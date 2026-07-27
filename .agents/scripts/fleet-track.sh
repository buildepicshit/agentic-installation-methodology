#!/usr/bin/env bash
# fleet-track.sh — create/sync the Tier 2 GitHub issue tree for a tracked bundle.
#
# CONTRACT
#   Tier 2 of `agents/OPERATING_MODEL.md` "Work visibility". Given a SPEC path,
#   creates one parent tracker issue plus one sub-issue per TRACKED UNIT, wires
#   dependencies, and writes the parent URL back to the SPEC's `tracker_ref`.
#
#   Authority: file://specs/2026-07-26-agent-work-tracking-surface/SPEC.md
#   §7.2 (trigger), §7.3/§7.3a (entities + tracked units), §7.5 (allowlist),
#   §8 (failure model), §8a (algorithm).
#
# TWO-PHASE STRUCTURE — this is the safety property, do not collapse it.
#   PHASE 1 is local validation ONLY and is the ONLY phase that may exit
#   non-zero. It runs entirely before the first mutation, so a refusal can
#   never leave partial remote state.
#   PHASE 2 touches the network and exits 0 UNCONDITIONALLY. Tracking is a
#   mirror; it must never be able to halt the work it is mirroring. Every
#   remote failure warns and falls through.
#
# EXIT CODES
#   0  did its job, or degraded and warned, or the bundle is untracked
#   2  local validation refused (bad spec_id / repo / unit id / >100 units)
#  64  usage
#
# MODES
#   <spec_path>        normal run
#   --self-test        hermetic; no network, no live GitHub, no ambient repo
#   --integration-test LIVE; proves cross-repo sub-issue attach, then cleans up
set -uo pipefail

OWNER="buildepicshit"
POLICY_REPO="bes-fleet-policy"
MAX_UNITS=100

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
root=$(CDPATH= cd -- "$script_dir/../.." && pwd -P)

# Manifests are read from $script_dir, NEVER from "$root/agents/scripts".
# This repo carries them at agents/scripts/; every child carries them at
# .agents/scripts/. Hard-coding the source layout made the roster unfindable
# in a child, the allowlist deny everything, and the self-test drop 18/0 -> 16/2.
# Source-side gates cannot see this; only in-situ verification in a propagated
# tree can (2026-07-24 propagation lesson, repeated here 2026-07-26).

warn() { printf 'fleet-track: %s\n' "$*" >&2; }
die()  { printf 'fleet-track: REFUSED: %s\n' "$*" >&2; exit 2; }

# ---------------------------------------------------------------- PHASE 1 ----

# Roster holds BARE names (ACTOCCATUD, Floom, ...). Everything must be
# normalised to owner/name BEFORE any check, or expansion feeds bare entries
# into an owner/name validator and every propagation refuses. (Gate 1 F-12.)
normalise_repo() {
    case "$1" in
        */*) printf '%s' "$1" ;;
        *)   printf '%s/%s' "$OWNER" "$1" ;;
    esac
}

# DEFAULT-DENY. Absence from the OSS denylist grants nothing: a repo created
# after that manifest was last edited would pass a denylist and, if public,
# leak internal text. (Gate 1 F-6.)
allowlisted() {
    local r="$1" name
    [[ "$r" =~ ^[A-Za-z0-9][A-Za-z0-9._-]*/[A-Za-z0-9][A-Za-z0-9._-]*$ ]] || return 1
    [[ "${r%%/*}" == "$OWNER" ]] || return 1
    name="${r##*/}"
    [[ "$name" == "$POLICY_REPO" ]] && return 0
    local manifest="$script_dir/fleet-internal-repos.txt"
    [[ -f "$manifest" ]] || return 1
    grep -qxF "$name" "$manifest"
}

fm_field() {  # fm_field <file> <key>
    awk -v k="$2" '
        BEGIN { c = 0 }
        /^---[[:space:]]*$/ { c++; if (c == 2) exit; next }
        c == 1 && $0 ~ "^" k ":" {
            sub("^" k ":[[:space:]]*", ""); sub(/[[:space:]]+$/, ""); print; exit
        }' "$1"
}

# Slice shapes, fenced content ignored — same rules as lint-spec.sh.
plan_slice_count() {
    awk '
        /^[[:space:]]*(```|~~~)/ { fence = !fence; next }
        fence { next }
        /^##+[[:space:]].*Execution Plan/ { inplan = 1; next }
        inplan && /^##+[[:space:]]/ { inplan = 0 }
        inplan && /^[0-9]+\.[[:space:]]/  { num++ }
        inplan && /^###+[[:space:]]/      { head++ }
        inplan && /^[-*][[:space:]]+\*\*/ { bul++ }
        END { m = num; if (head > m) m = head; if (bul > m) m = bul; print m + 0 }
    ' "$1"
}

# A propagation slice fans out to one unit PER TARGET REPO. Representing it as
# a single unit collapses N independent merge events into one state and defeats
# the question Tier 2 exists to answer. (Gate 1 F-4.)
plan_has_propagation_slice() {
    awk '
        /^[[:space:]]*(```|~~~)/ { fence = !fence; next }
        fence { next }
        /^##+[[:space:]].*Execution Plan/ { inplan = 1; next }
        inplan && /^##+[[:space:]]/ { inplan = 0 }
        inplan && tolower($0) ~ /propagat/ { found = 1 }
        END { exit(found ? 0 : 1) }
    ' "$1"
}

# Emits: <unit_id>\t<owner/repo> per line.
expand_units() {
    local spec="$1" target="$2" n slug
    if plan_has_propagation_slice "$spec"; then
        local manifest="$script_dir/fleet-internal-repos.txt"
        if [[ -f "$manifest" ]]; then
            while IFS= read -r name; do
                [[ -n "$name" ]] || continue
                local r; r=$(normalise_repo "$name")
                allowlisted "$r" || continue
                slug=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]' | tr -c 'a-z0-9-' '-')
                slug="${slug%-}"
                printf 'R-%s\t%s\n' "$slug" "$r"
            done < "$manifest"
        fi
    fi
    n=$(plan_slice_count "$spec")
    local i
    for ((i = 1; i <= n; i++)); do
        printf 'T-%02d\t%s\n' "$i" "$target"
    done
}

phase1() {  # phase1 <spec_path> ; sets SPEC_ID TARGET UNITS_FILE TRACKED
    local spec="$1"
    [[ -f "$spec" ]] || die "no such SPEC: $spec"

    SPEC_ID=$(fm_field "$spec" id)
    [[ "$SPEC_ID" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-[A-Za-z0-9][A-Za-z0-9-]*$ ]] \
        || die "spec id '$SPEC_ID' is not a safe name (§16 B-3)"

    TARGET=$(normalise_repo "$(fm_field "$spec" repo)")
    allowlisted "$TARGET" || die "repo '$TARGET' is not an in-scope internal repo (§7.5 default-deny)"

    UNITS_FILE=$(mktemp)
    expand_units "$spec" "$TARGET" > "$UNITS_FILE"

    local u_id u_repo count=0
    while IFS=$'\t' read -r u_id u_repo; do
        [[ -n "$u_id" ]] || continue
        [[ "$u_id" =~ ^(T-[0-9]{2}|R-[a-z0-9-]+)$ ]] || die "unit id '$u_id' is not a safe name"
        allowlisted "$u_repo" || die "unit '$u_id' targets non-allowlisted repo '$u_repo'"
        count=$((count + 1))
    done < "$UNITS_FILE"

    [[ "$count" -le "$MAX_UNITS" ]] \
        || die "$count units exceeds the platform cap of $MAX_UNITS sub-issues per parent — split the SPEC"

    # Trigger evaluated on EXPANDED UNITS, not slices: a one-slice SPEC that
    # propagates to seven repos is seven units and must be tracked. (Gate 1 F-11.)
    local manifest_carried=0
    grep -qE '(^|[^A-Za-z])(agents/|\.agents/|\.claude/)' "$spec" && manifest_carried=1
    TRACKED=0
    [[ "$manifest_carried" -eq 1 && "$count" -ge 2 ]] && TRACKED=1
    [[ $(plan_slice_count "$spec") -gt 3 ]] && TRACKED=1
    [[ -n "$(fm_field "$spec" tracker_ref)" ]] && TRACKED=1
    UNIT_COUNT="$count"
}

# ---------------------------------------------------------------- PHASE 2 ----
# Everything below warns and falls through. No path here exits non-zero.

gh_ok() { command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; }

set_tracker_ref() {  # set_tracker_ref <spec> <value>
    local spec="$1" val="$2"
    if grep -q '^tracker_ref:' "$spec"; then
        sed -i "s|^tracker_ref:.*|tracker_ref: $val|" "$spec" || warn "could not write tracker_ref"
    else
        sed -i "0,/^---$/!{0,/^---$/s|^---$|tracker_ref: $val\n---|}" "$spec" \
            || warn "could not insert tracker_ref"
    fi
}

find_issue() {  # find_issue <repo> <title-prefix>  -> url or empty
    gh issue list --repo "$1" --state all --search "$2 in:title" \
        --json title,url --limit 100 2>/dev/null \
      | python3 -c '
import json,sys
try: rows = json.load(sys.stdin)
except Exception: sys.exit(0)
p = sys.argv[1]
for r in rows:
    if r.get("title","").startswith(p):
        print(r["url"]); break
' "$2" 2>/dev/null
}

phase2() {  # phase2 <spec_path>
    local spec="$1" parent url u_id u_repo prefix title
    if ! gh_ok; then
        warn "gh unavailable or unauthenticated — recording tracker_ref: pending"
        set_tracker_ref "$spec" pending
        return 0
    fi

    prefix="[$SPEC_ID]"
    title=$(awk '/^# /{sub(/^# /,""); print; exit}' "$spec")
    parent=$(find_issue "$TARGET" "$prefix")
    if [[ -z "$parent" ]]; then
        parent=$(gh issue create --repo "$TARGET" \
                   --title "$prefix $title" \
                   --label fleet-tracked \
                   --body "Spec: \`$spec\`

Tracker issue for this bundle. The SPEC is the execution authority; this
issue mirrors state. Closed by the owner only.

Acceptance criteria live in the SPEC §4." 2>/dev/null) || parent=""
    fi
    if [[ -z "$parent" ]]; then
        warn "parent issue could not be created — recording tracker_ref: pending"
        set_tracker_ref "$spec" pending
        return 0
    fi

    local unresolved=()
    while IFS=$'\t' read -r u_id u_repo; do
        [[ -n "$u_id" ]] || continue
        url=$(find_issue "$u_repo" "$prefix $u_id")
        if [[ -z "$url" ]]; then
            url=$(gh issue create --repo "$u_repo" \
                    --title "$prefix $u_id" \
                    --body "Slice of $parent" \
                    --parent "$parent" 2>/dev/null) || url=""
        fi
        [[ -z "$url" ]] && { unresolved+=("$u_id"); warn "unit $u_id ($u_repo) unresolved"; }
    done < "$UNITS_FILE"

    set_tracker_ref "$spec" "$parent"
    [[ ${#unresolved[@]} -gt 0 ]] && warn "unresolved units: ${unresolved[*]} — re-run to complete"
    printf 'fleet-track: %s -> %s (%s units)\n' "$SPEC_ID" "$parent" "$UNIT_COUNT" >&2
    return 0
}

# -------------------------------------------------------------- SELF-TEST ----
# Hermetic: no network, no live GitHub, no dependence on the ambient repo.

st_pass=0; st_fail=0
ck() {  # ck <desc> <expected> <actual>
    if [[ "$2" == "$3" ]]; then st_pass=$((st_pass + 1)); printf 'PASS %s\n' "$1"
    else st_fail=$((st_fail + 1)); printf 'FAIL %s (expected %s, got %s)\n' "$1" "$2" "$3"; fi
}

mkspec() {  # mkspec <file> <id> <repo> <plan-body>
    { printf -- '---\nid: %s\nstatus: approved\ntype: task\nrepo: %s\n---\n\n# T\n\n## 9. Execution Plan\n\n' "$2" "$3"
      printf '%s\n' "$4"; } > "$1"
}

self_test() {
    local tmp; tmp=$(mktemp -d); trap 'rm -rf "$tmp"' RETURN

    # --- §7.5 default-deny allowlist ---
    allowlisted "$OWNER/$POLICY_REPO"     && ck "allowlist: policy repo"          0 0 || ck "allowlist: policy repo" 0 1
    allowlisted "$OWNER/ACTOCCATUD"       && ck "allowlist: internal repo"        0 0 || ck "allowlist: internal repo" 0 1
    allowlisted "$OWNER/Wick"             && ck "fence: public repo refused"      0 1 || ck "fence: public repo refused" 0 0
    allowlisted "$OWNER/Mimir"            && ck "fence: Mimir refused"            0 1 || ck "fence: Mimir refused" 0 0
    allowlisted "$OWNER/brand-new-repo"   && ck "fence: unknown repo refused"     0 1 || ck "fence: unknown repo refused" 0 0
    allowlisted "evilorg/ACTOCCATUD"      && ck "fence: foreign owner refused"    0 1 || ck "fence: foreign owner refused" 0 0
    allowlisted "$OWNER/a/../b"           && ck "fence: path separator refused"   0 1 || ck "fence: path separator refused" 0 0

    # --- normalisation: roster holds bare names (F-12) ---
    ck "normalise: bare name"  "$OWNER/ACTOCCATUD" "$(normalise_repo ACTOCCATUD)"
    ck "normalise: idempotent" "$OWNER/ACTOCCATUD" "$(normalise_repo "$OWNER/ACTOCCATUD")"

    # --- slice counting: fenced content ignored ---
    mkspec "$tmp/fenced.md" 2026-07-26-fenced "$POLICY_REPO" '```
1. no
2. no
3. no
4. no
```

1. real'
    ck "count: fenced numbers ignored" 1 "$(plan_slice_count "$tmp/fenced.md")"

    mkspec "$tmp/bul.md" 2026-07-26-bul "$POLICY_REPO" '- **One.** a
- **Two.** b
- **Three.** c
- **Four.** d'
    ck "count: bullet plan" 4 "$(plan_slice_count "$tmp/bul.md")"

    # --- §7.3a propagation expands per repo, not per slice (F-4) ---
    local roster_n; roster_n=$(grep -cvE '^[[:space:]]*$' "$script_dir/fleet-internal-repos.txt")
    mkspec "$tmp/prop.md" 2026-07-26-prop "$POLICY_REPO" '1. Propagation to the internal children.'
    local prop_units; prop_units=$(expand_units "$tmp/prop.md" "$OWNER/$POLICY_REPO" | grep -c '^R-')
    ck "expand: propagation -> one unit per repo" "$roster_n" "$prop_units"

    mkspec "$tmp/noprop.md" 2026-07-26-noprop "$POLICY_REPO" '1. Ordinary slice.'
    ck "expand: no propagation -> no R- units" 0 "$(expand_units "$tmp/noprop.md" "$OWNER/$POLICY_REPO" | grep -c '^R-')"

    # --- PHASE 1 refuses BEFORE mutating ---
    mkspec "$tmp/badid.md" "../../etc/passwd" "$POLICY_REPO" '1. x'
    ( phase1 "$tmp/badid.md" ) >/dev/null 2>&1
    ck "phase1: traversal spec_id refused" 2 "$?"

    mkspec "$tmp/badrepo.md" 2026-07-26-badrepo "Wick" '1. x'
    ( phase1 "$tmp/badrepo.md" ) >/dev/null 2>&1
    ck "phase1: OSS repo refused" 2 "$?"

    mkspec "$tmp/ok.md" 2026-07-26-ok "$POLICY_REPO" '1. x'
    ( phase1 "$tmp/ok.md" ) >/dev/null 2>&1
    ck "phase1: valid spec accepted" 0 "$?"

    # --- §8 degradation: gh absent -> pending, exit 0 (AC-9) ---
    mkspec "$tmp/deg.md" 2026-07-26-deg "$POLICY_REPO" '1. a
2. b
3. c
4. d'
    # Stub ONLY the gh probe. Wiping PATH would also break awk/mktemp and
    # would test the harness rather than the degradation path.
    ( phase1 "$tmp/deg.md" >/dev/null 2>&1
      gh_ok() { return 1; }
      phase2 "$tmp/deg.md" >/dev/null 2>&1 )
    ck "degrade: gh absent exits 0" 0 "$?"
    ck "degrade: wrote pending" "pending" "$(fm_field "$tmp/deg.md" tracker_ref)"

    printf '\n=== fleet-track self-test: %d pass / %d fail ===\n' "$st_pass" "$st_fail"
    [[ "$st_fail" -eq 0 ]]
}

# ------------------------------------------------------- INTEGRATION TEST ----
# LIVE. Proves the one platform claim the whole design rests on: a sub-issue in
# one repo can attach to a parent in a DIFFERENT repo under the same owner.
# Round 1 of the spec review could not verify this (shell and web were denied)
# and read this SPEC's own citations back, which is circular. AC-12 exists so
# the premise is proven by the platform, not by a document.
integration_test() {
    gh_ok || { warn "gh unavailable — integration test cannot run"; return 1; }
    local child_repo="" name
    while IFS= read -r name; do
        [[ -n "$name" ]] || continue
        child_repo="$OWNER/$name"; break
    done < "$script_dir/fleet-internal-repos.txt"
    [[ -n "$child_repo" ]] || { warn "no internal repo in roster"; return 1; }

    local parent="" child="" rc=1
    cleanup() {
        [[ -n "$child"  ]] && gh issue close "$child"  --repo "$child_repo"        >/dev/null 2>&1
        [[ -n "$parent" ]] && gh issue close "$parent" --repo "$OWNER/$POLICY_REPO" >/dev/null 2>&1
    }
    trap cleanup RETURN

    parent=$(gh issue create --repo "$OWNER/$POLICY_REPO" \
               --title "[integration-test] fleet-track cross-repo attach" \
               --body "Automated AC-12 check. Closed automatically." 2>/dev/null) || return 1
    child=$(gh issue create --repo "$child_repo" \
              --title "[integration-test] child in a different repo" \
              --body "Parent: $parent" --parent "$parent" 2>/dev/null) || return 1

    local pnum="${parent##*/}"
    if gh api "repos/$OWNER/$POLICY_REPO/issues/$pnum/sub_issues" 2>/dev/null | grep -qF "$child"; then
        printf 'PASS cross-repo sub-issue attach: %s -> %s\n' "$child_repo" "$OWNER/$POLICY_REPO"
        rc=0
    else
        printf 'FAIL cross-repo sub-issue attach — the design premise does NOT hold\n'
    fi
    return "$rc"
}

# ------------------------------------------------------------------ MAIN ----
case "${1:-}" in
    --self-test)        self_test; exit $? ;;
    --integration-test) integration_test; exit $? ;;
    "")                 printf 'usage: fleet-track.sh <spec_path> | --self-test | --integration-test\n' >&2; exit 64 ;;
esac

phase1 "$1"
if [[ "$TRACKED" -eq 0 ]]; then
    rm -f "$UNITS_FILE"
    exit 0            # not a tracked bundle — nothing to do, not an error
fi
phase2 "$1"
rm -f "$UNITS_FILE"
exit 0
