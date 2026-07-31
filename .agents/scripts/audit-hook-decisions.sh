#!/usr/bin/env bash
# audit-hook-decisions.sh — summarise the machine-local hook decision log.
#
# Answers the question the 2026-07-24 ceremony audit could not:
# do the fleet's 14 gate hooks ever actually block anything?
#
# The audit found 195 green hook tests and ZERO recorded instances of a hook
# blocking a real in-flight mistake — absence of MEASUREMENT, not proof of
# absence. This reads the log that closes that gap.
# Authority: specs/2026-07-24-hook-decision-instrumentation/SPEC.md
#            specs/2026-07-31-hook-decision-log-integrity/SPEC.md  (--all, rows)
#
# SCOPE, STATED HONESTLY
#   The log is machine-local and gitignored, so this reports on THIS MACHINE
#   only. Without --all it also reports on ONE PROJECT DIRECTORY only: each
#   repo writes its own log, and a 2026-07-31 census found the fleet's decision
#   data split across four logs totalling 42,418 records, of which a default
#   run saw 5,874. Use --all to aggregate across the roster.
#
# ROWS COUNT RECORDS, NOT TOOL CALLS
#   A hook registered under N matchers in settings.json runs N times per tool
#   call and writes N records. block-undeclared-deps.sh is registered 10 times;
#   warn-security-surface.sh twice. The `regs` column carries that multiplicity
#   so rows are comparable between hooks. It is never used to silently divide a
#   count: what is measured is reported, and the divisor is shown next to it.
#
# It is an inspection tool, never a gate: it exits 0 even with no log.
#
# Usage:
#   bash agents/scripts/audit-hook-decisions.sh            # all time, this repo
#   bash agents/scripts/audit-hook-decisions.sh --since 7  # last 7 days
#   bash agents/scripts/audit-hook-decisions.sh --blocks   # block records only
#   bash agents/scripts/audit-hook-decisions.sh --all      # every roster log
#   bash agents/scripts/audit-hook-decisions.sh --self-test

set -uo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd -P)"
# Overridable so --self-test can point discovery at a hermetic fixture tree.
FLEET_ROOT="${BES_LOG_FLEET_ROOT:-$(dirname "$REPO_ROOT")}"

LOG="${BES_LOG_FILE:-${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/decisions.log}"
SETTINGS="${BES_LOG_SETTINGS:-$REPO_ROOT/.claude/settings.json}"
SINCE_DAYS=""
BLOCKS_ONLY=0
ALL=0

while [ $# -gt 0 ]; do
    case "$1" in
        --since)
            # A bare `--since` must NOT `shift 2` — with one arg left that
            # shift fails, $# never decrements, and the loop spins forever.
            # Also reject a following FLAG: `--since --blocks` would
            # otherwise silently eat the flag as the value and fail with a
            # misleading "wants a whole number of days".
            if [ $# -lt 2 ] || [ -z "${2:-}" ] || case "${2:-}" in -*) true ;; *) false ;; esac; then
                printf 'audit-hook-decisions: --since needs a numeric value, e.g. --since 7\n' >&2
                exit 2
            fi
            SINCE_DAYS="$2"; shift; shift ;;
        --since=*)
            SINCE_DAYS="${1#*=}"
            if [ -z "$SINCE_DAYS" ]; then
                printf 'audit-hook-decisions: --since= needs a value, e.g. --since=7\n' >&2
                exit 2
            fi
            shift ;;
        --blocks) BLOCKS_ONLY=1; shift ;;
        --all) ALL=1; shift ;;
        --self-test) SELF_TEST=1; shift ;;
        # --help intentionally short-circuits before argument validation:
        # standard CLI behaviour, and refusing help because a LATER arg is
        # malformed would be user-hostile.
        -h|--help) sed -n "2,30p" "$0"; exit 0 ;;
        *) printf 'audit-hook-decisions: unknown arg: %s\n' "$1" >&2; exit 2 ;;
    esac
done

# Validate arguments BEFORE any early exit, so bad input never exits 0 just
# because the log happens to be absent (cross-family review r2, finding 4).
if [ -n "$SINCE_DAYS" ] && ! printf '%s' "$SINCE_DAYS" | grep -qE '^[0-9]+$'; then
    printf 'audit-hook-decisions: --since wants a whole number of days, got: %s\n' "$SINCE_DAYS" >&2
    exit 2
fi

# registrations <hook-name> -> count, or "-" when settings are unreadable.
# Counts filename mentions in settings.json; every mention there is a hook
# command registration. Degrades to "-" rather than erroring — a missing or
# unparseable settings file must not break an inspection tool.
registrations() {
    [ -r "$SETTINGS" ] || { printf '%s' '-'; return 0; }
    local n
    n=$(grep -o '[a-zA-Z0-9_.-]*\.sh' "$SETTINGS" 2>/dev/null | grep -cxF "$1" 2>/dev/null) || n=0
    [ "$n" = "0" ] && { printf '%s' '-'; return 0; }
    printf '%s' "$n"
}

# discover_logs -> one path per line. Studio root, this repo, then every repo
# named by the roster manifests. Absent logs are skipped, not reported as
# errors: most repos will not have one.
discover_logs() {
    local m name p seen=""
    { printf '%s\n' "$FLEET_ROOT/.claude/hooks/decisions.log"
      printf '%s\n' "$REPO_ROOT/.claude/hooks/decisions.log"
      for m in fleet-internal-repos.txt fleet-oss-repos.txt fleet-local-only-repos.txt; do
          [ -r "$SCRIPT_DIR/$m" ] || continue
          while IFS= read -r name; do
              case "$name" in ''|\#*) continue ;; esac
              printf '%s\n' "$FLEET_ROOT/$name/.claude/hooks/decisions.log"
          done < "$SCRIPT_DIR/$m"
      done
    } | while IFS= read -r p; do
          [ -f "$p" ] || continue
          case "$seen" in *"|$p|"*) continue ;; esac
          seen="$seen|$p|"
          printf '%s\n' "$p"
      done
}

# --- self-test -------------------------------------------------------------
if [ "${SELF_TEST:-0}" = "1" ]; then
    P=0; F=0
    ck() { if [ "$2" = "$3" ]; then P=$((P+1)); printf 'PASS %s\n' "$1";
           else F=$((F+1)); printf 'FAIL %s\n  want: %s\n  got:  %s\n' "$1" "$2" "$3"; fi; }
    SELF="$SCRIPT_DIR/$(basename -- "$0")"
    T=$(mktemp -d); trap 'rm -rf "$T" 2>/dev/null' EXIT

    # Hermetic fixture fleet: a root log, a repo log, and two roster children.
    mkdir -p "$T/root/.claude/hooks" "$T/root/repoA/.claude/hooks" \
             "$T/root/repoB/.claude/hooks" "$T/root/repoC/.claude/hooks"
    printf '2026-07-01T00:00:00Z\th1.sh\tALLOW\t-\t-\n' > "$T/root/.claude/hooks/decisions.log"
    printf '2026-07-01T00:00:01Z\th1.sh\tBLOCK\t-\t-\n2026-07-01T00:00:02Z\th2.sh\tALLOW\t-\t-\n' \
        > "$T/root/repoA/.claude/hooks/decisions.log"
    printf '2026-07-01T00:00:03Z\th2.sh\tBLOCK\t-\t-\n' > "$T/root/repoB/.claude/hooks/decisions.log"
    # repoC has no log at all — must be skipped silently, not error.

    # A fixture roster + settings, in a scripts dir the script can discover.
    mkdir -p "$T/root/repoA/agents/scripts"
    cp "$SELF" "$T/root/repoA/agents/scripts/"
    printf 'repoB\nrepoC\n' > "$T/root/repoA/agents/scripts/fleet-internal-repos.txt"
    printf '#comment\n\n' > "$T/root/repoA/agents/scripts/fleet-oss-repos.txt"
    FIX="$T/root/repoA/agents/scripts/$(basename -- "$0")"
    printf '{"hooks":{"PreToolUse":[{"hooks":[{"command":"x/h1.sh"}]},{"hooks":[{"command":"y/h1.sh"}]},{"hooks":[{"command":"z/h2.sh"}]}]}}\n' \
        > "$T/settings.json"

    # 1. single-log: exact totals and rows for a known fixture
    out=$(BES_LOG_FILE="$T/root/repoA/.claude/hooks/decisions.log" \
          BES_LOG_SETTINGS="$T/settings.json" bash "$FIX" 2>&1)
    ck "single-log: record count" "records: 2" "$(printf '%s\n' "$out" | grep -m1 '^records:')"
    # row is "<hook> <blocks> / <records> <regs>", whitespace-normalised
    ck "single-log: h1 row" "h1.sh 1 / 1 2" \
       "$(printf '%s\n' "$out" | awk '/h1\.sh/{$1=$1; print; exit}')"
    ck "single-log: h2 row" "h2.sh 0 / 1 1" \
       "$(printf '%s\n' "$out" | awk '/h2\.sh/{$1=$1; print; exit}')"
    ck "single-log: scope note names the project" "1" \
       "$(printf '%s\n' "$out" | grep -c 'project directory')"

    # 2. --all: aggregates every existing log, skips the absent one
    out=$(BES_LOG_FLEET_ROOT="$T/root" BES_LOG_SETTINGS="$T/settings.json" \
          bash "$FIX" --all 2>&1)
    ck "--all: aggregate record count" "records: 4" "$(printf '%s\n' "$out" | grep -m1 '^records:')"
    ck "--all: logs read" "3" "$(printf '%s\n' "$out" | grep -c 'decisions.log$')"
    ck "--all: absent log skipped" "0" "$(printf '%s\n' "$out" | grep -c 'repoC')"
    ck "--all: h2 aggregates across repos" "h2.sh 1 / 2 1" \
       "$(printf '%s\n' "$out" | awk '/h2\.sh/{$1=$1; print; exit}')"

    # 3. --since filters, and --blocks narrows the whole report
    out=$(BES_LOG_FLEET_ROOT="$T/root" BES_LOG_SETTINGS="$T/settings.json" \
          bash "$FIX" --all --blocks 2>&1)
    ck "--all --blocks: only blocks counted" "records: 2" \
       "$(printf '%s\n' "$out" | grep -m1 '^records:')"

    # 4. settings.json absent -> regs degrade to "-", never an error
    out=$(BES_LOG_FILE="$T/root/repoA/.claude/hooks/decisions.log" \
          BES_LOG_SETTINGS="$T/nope.json" bash "$FIX" 2>&1); rc=$?
    ck "no settings: exit 0" "0" "$rc"
    ck "no settings: regs degrade to dash" "-" \
       "$(printf '%s\n' "$out" | awk '/h1\.sh/{print $NF}' | head -1)"

    # 5. no logs anywhere -> clean report, exit 0.
    # The copy must live in its OWN tree: REPO_ROOT is derived from the script's
    # location, so running the repoA copy would discover repoA's log and this
    # case would silently test nothing.
    mkdir -p "$T/empty/agents/scripts"
    cp "$SELF" "$T/empty/agents/scripts/"
    out=$(BES_LOG_FLEET_ROOT="$T/empty" BES_LOG_SETTINGS="$T/settings.json" \
          bash "$T/empty/agents/scripts/$(basename -- "$0")" --all 2>&1); rc=$?
    ck "no logs: exit 0" "0" "$rc"
    ck "no logs: says so" "1" "$(printf '%s\n' "$out" | grep -c '0 records')"

    # 6. argument validation preserved
    bash "$FIX" --since >/dev/null 2>&1; ck "bare --since exits 2" "2" "$?"
    bash "$FIX" --since abc >/dev/null 2>&1; ck "non-numeric --since exits 2" "2" "$?"
    bash "$FIX" --bogus >/dev/null 2>&1; ck "unknown arg exits 2" "2" "$?"

    printf '\n=== audit-hook-decisions self-test: %d pass / %d fail ===\n' "$P" "$F"
    [ "$F" -eq 0 ]; exit $?
fi

# --- report ----------------------------------------------------------------
LOGS=""
if [ "$ALL" = "1" ]; then
    LOGS=$(discover_logs)
    if [ -z "$LOGS" ]; then
        printf 'audit-hook-decisions: 0 records — no decision logs found under %s\n' "$FLEET_ROOT"
        printf '  Nothing has been recorded on this machine yet. This is not a failure —\n'
        printf '  the log is written by the gate hooks as they fire.\n'
        exit 0
    fi
else
    if [ ! -f "$LOG" ]; then
        printf 'audit-hook-decisions: no decision log at %s\n' "$LOG"
        printf '  Nothing has been recorded on this machine yet. This is not a failure —\n'
        printf '  the log is written by the gate hooks as they fire.\n'
        exit 0
    fi
    LOGS="$LOG"
fi

CUTOFF=""
if [ -n "$SINCE_DAYS" ]; then
    CUTOFF=$(date -u -d "-${SINCE_DAYS} days" +%Y-%m-%dT%H:%M:%SZ 2>/dev/null) \
        || CUTOFF=$(date -u -v-"${SINCE_DAYS}"d +%Y-%m-%dT%H:%M:%SZ 2>/dev/null) \
        || CUTOFF=""
    if [ -z "$CUTOFF" ]; then
        printf 'audit-hook-decisions: could not compute a cutoff date on this platform\n' >&2
        exit 2
    fi
fi

# ISO-8601 UTC sorts lexicographically, so a string compare is a date compare.
# --blocks narrows the WHOLE report, not just an appended detail list, so the
# totals and per-hook table always describe exactly the records shown.
records=$(printf '%s\n' "$LOGS" | while IFS= read -r f; do cat "$f" 2>/dev/null; done \
    | awk -F'\t' -v cut="$CUTOFF" -v bo="$BLOCKS_ONLY" \
      'NF>=3 && (cut=="" || $1>=cut) && (bo==0 || $3=="BLOCK")')

SCOPE="${CUTOFF:+ since $CUTOFF}"
[ "$BLOCKS_ONLY" = 1 ] && SCOPE="$SCOPE (BLOCK records only)"

if [ -z "$records" ]; then
    printf 'audit-hook-decisions: 0 records%s\n' "$SCOPE"
    exit 0
fi

total=$(printf '%s\n' "$records" | grep -c . || true)
printf '== hook decisions%s ==\n' "$SCOPE"
if [ "$ALL" = "1" ]; then
    printf 'logs:\n'
    printf '%s\n' "$LOGS" | while IFS= read -r f; do
        printf '  %6s  %s\n' "$(wc -l < "$f" 2>/dev/null | tr -d ' ')" "$f"
    done
else
    printf 'log:     %s\n' "$LOG"
fi
printf 'records: %s\n\n' "$total"

# Under --blocks the set is already all-BLOCK, so a "by decision" split and a
# "blocks / total" column would both read trivially N/N and imply a block rate
# that is an artefact of the filter. Report a plain count instead.
hook_rows=$(printf '%s\n' "$records" | awk -F'\t' -v bo="$BLOCKS_ONLY" '
    { d[$3]++; hook[$2]++; if ($3=="BLOCK") b[$2]++ }
    END {
        if (bo == 0) {
            printf "by decision:\n"
            for (k in d) printf "  %-8s %6d\n", k, d[k]
            printf "\nby hook (blocks / records, regs):\n"
            for (k in hook) printf "  %-38s %5d / %5d\n", k, (k in b ? b[k] : 0), hook[k]
        } else {
            printf "by hook (blocks, regs):\n"
            for (k in hook) printf "  %-38s %5d\n", k, hook[k]
        }
    }')

# Append the registration multiplicity per hook row. Done in shell rather than
# awk so the settings lookup degrades independently per hook.
printf '%s\n' "$hook_rows" | while IFS= read -r line; do
    case "$line" in
        "  "*".sh"*) printf '%s   %s\n' "$line" "$(registrations "$(printf '%s' "$line" | awk '{print $1}')")" ;;
        *) printf '%s\n' "$line" ;;
    esac
done | sed -e '/^by/!s/^/ /'

if [ "$BLOCKS_ONLY" = 1 ]; then
    printf '\nblock records:\n'
    printf '%s\n' "$records" | awk -F'\t' '{ printf "  %s  %-34s %s\n", $1, $2, $4 }'
    printf '\n(no rate shown: --blocks filters the denominator away.\n'
    printf ' Re-run without --blocks for blocks-per-record.)\n'
fi

printf '\nNote: this machine only. The log is gitignored by design and is NOT\n'
printf 'fleet-visible; do not treat it as a fleet-wide answer.\n'
if [ "$ALL" = "1" ]; then
    printf 'Scope: every decision log discovered under %s.\n' "$FLEET_ROOT"
else
    printf 'Scope: ONE project directory (%s). Other repos keep their own logs —\n' "$LOG"
    printf 'run with --all to aggregate across the roster.\n'
fi
printf 'Rows count RECORDS, not tool calls: a hook registered under N matchers\n'
printf 'writes N records per call. The regs column is that N (from %s).\n' "$SETTINGS"
exit 0
