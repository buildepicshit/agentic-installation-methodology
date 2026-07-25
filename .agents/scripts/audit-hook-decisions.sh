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
#
# The log is machine-local and gitignored, so this reports on THIS machine
# only. It is an inspection tool, never a gate: it exits 0 even with no log.
#
# Usage:
#   bash agents/scripts/audit-hook-decisions.sh            # all time
#   bash agents/scripts/audit-hook-decisions.sh --since 7  # last 7 days
#   bash agents/scripts/audit-hook-decisions.sh --blocks    # block records only

set -uo pipefail

LOG="${BES_LOG_FILE:-${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/decisions.log}"
SINCE_DAYS=""
BLOCKS_ONLY=0

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
        # --help intentionally short-circuits before argument validation:
        # standard CLI behaviour, and refusing help because a LATER arg is
        # malformed would be user-hostile.
        -h|--help) sed -n "2,20p" "$0"; exit 0 ;;
        *) printf 'audit-hook-decisions: unknown arg: %s\n' "$1" >&2; exit 2 ;;
    esac
done

# Validate arguments BEFORE any early exit, so bad input never exits 0 just
# because the log happens to be absent (cross-family review r2, finding 4).
if [ -n "$SINCE_DAYS" ] && ! printf '%s' "$SINCE_DAYS" | grep -qE '^[0-9]+$'; then
    printf 'audit-hook-decisions: --since wants a whole number of days, got: %s\n' "$SINCE_DAYS" >&2
    exit 2
fi

if [ ! -f "$LOG" ]; then
    printf 'audit-hook-decisions: no decision log at %s\n' "$LOG"
    printf '  Nothing has been recorded on this machine yet. This is not a failure —\n'
    printf '  the log is written by the gate hooks as they fire.\n'
    exit 0
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
records=$(awk -F'\t' -v cut="$CUTOFF" -v bo="$BLOCKS_ONLY" \
    'NF>=3 && (cut=="" || $1>=cut) && (bo==0 || $3=="BLOCK")' "$LOG" 2>/dev/null)

SCOPE="${CUTOFF:+ since $CUTOFF}"
[ "$BLOCKS_ONLY" = 1 ] && SCOPE="$SCOPE (BLOCK records only)"

if [ -z "$records" ]; then
    printf 'audit-hook-decisions: 0 records%s\n' "$SCOPE"
    exit 0
fi

total=$(printf '%s\n' "$records" | grep -c . || true)
printf '== hook decisions%s ==\n' "$SCOPE"
printf 'log:     %s\n' "$LOG"
printf 'records: %s\n\n' "$total"

# Under --blocks the set is already all-BLOCK, so a "by decision" split and a
# "blocks / total" column would both read trivially N/N and imply a block rate
# that is an artefact of the filter. Report a plain count instead.
printf '%s\n' "$records" | awk -F'\t' -v bo="$BLOCKS_ONLY" '
    { d[$3]++; hook[$2]++; if ($3=="BLOCK") b[$2]++ }
    END {
        if (bo == 0) {
            printf "by decision:\n"
            for (k in d) printf "  %-8s %6d\n", k, d[k]
            printf "\nby hook (blocks / total):\n"
            for (k in hook) printf "  %-38s %5d / %5d\n", k, (k in b ? b[k] : 0), hook[k]
        } else {
            printf "by hook (blocks):\n"
            for (k in hook) printf "  %-38s %5d\n", k, hook[k]
            printf "\n(no rate shown: --blocks filters the denominator away.\n"
            printf " Re-run without --blocks for blocks-per-invocation.)\n"
        }
    }' | sed -e '/^by/!s/^/ /'

if [ "$BLOCKS_ONLY" = 1 ]; then
    printf '\nblock records:\n'
    printf '%s\n' "$records" | awk -F'\t' '{ printf "  %s  %-34s %s\n", $1, $2, $4 }'
fi

printf '\nNote: this machine only. The log is gitignored by design and is NOT\n'
printf 'fleet-visible; do not treat it as a fleet-wide answer.\n'
exit 0
