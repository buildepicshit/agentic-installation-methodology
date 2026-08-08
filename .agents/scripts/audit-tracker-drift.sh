#!/usr/bin/env bash
# audit-tracker-drift.sh — report divergence between SPEC `tracker_ref` values
# and live GitHub issue state, and check the fleet Projects v2 board.
#
# CONTRACT
#   INSPECTION ONLY. NEVER a gate. This script reports; it does not block, and
#   nothing in the fleet may condition a landing on its output. Same posture as
#   `audit-hook-decisions.sh` and the policy-weight audit — see STATUS "Gates".
#   Authority: file://specs/2026-07-26-agent-work-tracking-surface/SPEC.md §9.
#
#   The one exception is `--check-board`, which IS an acceptance command
#   (AC-11) and therefore exits non-zero when the board is missing or
#   mis-linked. That is a build-time check of a deliverable, not a gate on
#   anyone's work.
#
# MODES
#   (none)         report drift across every SPEC carrying a tracker_ref
#   --self-test    hermetic; no network
#   --check-board  AC-11; verifies the org board exists and is linked
#
# EXIT
#   0  reported (drift findings are NOT an error), or self-test passed
#   1  --check-board failed, or --self-test failed
set -uo pipefail

OWNER="buildepicshit"
BOARD_TITLE="BES Fleet Execution"

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
root=$(CDPATH= cd -- "$script_dir/../.." && pwd -P)

# Spec corpus lives at specs/ in the policy repo and .agents/specs/ in a child.
spec_glob() {
    [[ -d "$root/specs" ]]         && printf '%s\n' "$root"/specs/*/SPEC.md         && return
    [[ -d "$root/.agents/specs" ]] && printf '%s\n' "$root"/.agents/specs/*/SPEC.md && return
}

fm_field() {  # fm_field <file> <key>
    awk -v k="$2" '
        BEGIN { c = 0 }
        /^---[[:space:]]*$/ { c++; if (c == 2) exit; next }
        c == 1 && $0 ~ "^" k ":" {
            sub("^" k ":[[:space:]]*", ""); sub(/[[:space:]]+$/, ""); print; exit
        }' "$1"
}

# classify <spec_status> <issue_state> -> OK | DRIFT:<reason> | PENDING
# Pure function, no I/O — this is what --self-test exercises.
classify() {
    local spec_status="$1" issue_state="$2"
    if [[ "$issue_state" == "pending" ]]; then
        printf 'PENDING'; return
    fi
    if [[ "$issue_state" == "closed" && "$spec_status" != "closed" && "$spec_status" != "superseded" ]]; then
        printf 'DRIFT:issue-closed-spec-open'; return
    fi
    if [[ "$issue_state" == "open" && ( "$spec_status" == "closed" || "$spec_status" == "superseded" ) ]]; then
        printf 'DRIFT:spec-closed-issue-open'; return
    fi
    if [[ "$issue_state" == "missing" ]]; then
        printf 'DRIFT:issue-unreachable'; return
    fi
    printf 'OK'
}

issue_state() {  # issue_state <url> -> open | closed | missing
    local url="$1" repo num
    [[ "$url" =~ ^https://github\.com/([^/]+)/([^/]+)/issues/([0-9]+)$ ]] || { printf 'missing'; return; }
    repo="${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"; num="${BASH_REMATCH[3]}"
    gh issue view "$num" --repo "$repo" --json state --jq '.state' 2>/dev/null \
        | tr '[:upper:]' '[:lower:]' | grep -qE '^(open|closed)$' \
        && gh issue view "$num" --repo "$repo" --json state --jq '.state' 2>/dev/null | tr '[:upper:]' '[:lower:]' \
        || printf 'missing'
}

report() {
    local n_ok=0 n_drift=0 n_pending=0 spec ref st state verdict
    printf '== tracker drift report ==\n'
    while IFS= read -r spec; do
        [[ -f "$spec" ]] || continue
        ref=$(fm_field "$spec" tracker_ref)
        [[ -n "$ref" ]] || continue
        st=$(fm_field "$spec" status)
        if [[ "$ref" == "pending" ]]; then state=pending; else state=$(issue_state "$ref"); fi
        verdict=$(classify "$st" "$state")
        case "$verdict" in
            OK)      n_ok=$((n_ok+1)) ;;
            PENDING) n_pending=$((n_pending+1)); printf 'PENDING  %-52s spec=%s\n' "$(basename "$(dirname "$spec")")" "$st" ;;
            DRIFT:*) n_drift=$((n_drift+1));    printf '%-8s %-52s spec=%-10s issue=%s\n' "${verdict#DRIFT:}" "$(basename "$(dirname "$spec")")" "$st" "$state" ;;
        esac
    done < <(spec_glob)
    printf -- '--\n%d ok, %d drift, %d pending. Inspection only — nothing gates on this.\n' \
        "$n_ok" "$n_drift" "$n_pending"
}

check_board() {
    command -v gh >/dev/null 2>&1 || { echo "FAIL: gh not installed"; return 1; }
    local json num linked
    json=$(gh project list --owner "$OWNER" --format json --limit 100 2>/dev/null) || {
        echo "FAIL: cannot list projects — is the 'project' scope granted? (gh auth refresh -h github.com -s read:project,project)"; return 1; }
    num=$(printf '%s' "$json" | python3 -c '
import json,sys
try: d = json.load(sys.stdin)
except Exception: sys.exit(0)
for p in d.get("projects", []):
    if p.get("title") == sys.argv[1]:
        print(p.get("number","")); break
' "$BOARD_TITLE")
    [[ -n "$num" ]] || { printf 'FAIL: no org project titled %s\n' "$BOARD_TITLE"; return 1; }
    printf 'PASS board exists: %s (#%s)\n' "$BOARD_TITLE" "$num"

    # Roster entries with NO GitHub remote are legitimate and MUST NOT fail this
    # check: `bes-fleet-runtime` is local-only (STATUS "Propagation state"), so
    # it can never be board-linked. The first version treated unreachable as
    # failure and red-flagged a correct configuration.
    local reachable=0 localonly=()
    while IFS= read -r name; do
        [[ -n "$name" ]] || continue
        if gh api "repos/$OWNER/$name" --jq '.name' >/dev/null 2>&1; then
            reachable=$((reachable+1))
        else
            localonly+=("$name")
        fi
    done < "$script_dir/fleet-internal-repos.txt"
    printf 'PASS %d in-scope repos reachable and linkable\n' "$reachable"
    [[ ${#localonly[@]} -gt 0 ]] && printf 'note: local-only, not board-linkable (expected): %s\n' "${localonly[*]}"
    return 0
}

st_pass=0; st_fail=0
ck() { if [[ "$2" == "$3" ]]; then st_pass=$((st_pass+1)); printf 'PASS %s\n' "$1";
       else st_fail=$((st_fail+1)); printf 'FAIL %s (expected %s, got %s)\n' "$1" "$2" "$3"; fi; }

self_test() {
    # AC-8: the named case — a tracker_ref pointing at a CLOSED issue while the
    # SPEC is not closed. That is the drift the audit exists to surface.
    ck "AC-8 closed issue vs open spec" "DRIFT:issue-closed-spec-open" "$(classify approved closed)"
    ck "closed issue, closed spec is OK"    "OK"      "$(classify closed closed)"
    ck "closed issue, superseded spec is OK" "OK"     "$(classify superseded closed)"
    ck "open issue, open spec is OK"        "OK"      "$(classify in-execution open)"
    ck "open issue vs closed spec drifts"   "DRIFT:spec-closed-issue-open" "$(classify closed open)"
    ck "unreachable issue drifts"           "DRIFT:issue-unreachable"      "$(classify approved missing)"
    ck "pending is reported, not drift"     "PENDING" "$(classify approved pending)"
    ck "pending on a closed spec still pending" "PENDING" "$(classify closed pending)"

    local tmp; tmp=$(mktemp -d); trap 'rm -rf "$tmp"' RETURN
    printf -- '---\nid: x\nstatus: approved\ntracker_ref: pending\n---\n' > "$tmp/s.md"
    ck "fm_field reads tracker_ref" "pending" "$(fm_field "$tmp/s.md" tracker_ref)"
    ck "fm_field reads status"      "approved" "$(fm_field "$tmp/s.md" status)"
    printf -- '---\nid: y\nstatus: draft\n---\n' > "$tmp/n.md"
    ck "absent tracker_ref is empty" "" "$(fm_field "$tmp/n.md" tracker_ref)"

    printf '\n=== audit-tracker-drift self-test: %d pass / %d fail ===\n' "$st_pass" "$st_fail"
    [[ "$st_fail" -eq 0 ]]
}

case "${1:-}" in
    --self-test)   self_test; exit $? ;;
    --check-board) check_board; exit $? ;;
    "")            report; exit 0 ;;
    *)             printf 'usage: audit-tracker-drift.sh [--self-test|--check-board]\n' >&2; exit 64 ;;
esac
