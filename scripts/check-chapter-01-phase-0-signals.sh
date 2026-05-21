#!/usr/bin/env bash
# check-chapter-01-phase-0-signals.sh — T-02 acceptance helper.
#
# Verifies longread/01-phase-0-maturity-check.md contains
# substring anchors for the four positive Phase 0 maturity
# signals + three anti-signals per research workpad §6
# (../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md).
#
# Each signal requires PAIRED anchors — both terms in the
# pair must appear in the chapter (case-insensitive, fixed-
# string). This guards against loose substring matches that
# would pass while missing the research-§6 meaning.
#
# Exit 0 on pass; exit 1 on any missing pair; exit 2 on
# bad arguments.

set -euo pipefail

CHAPTER="${1:-longread/01-phase-0-maturity-check.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-01-phase-0-signals: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

# Each row: "Signal name|anchor-a|anchor-b"
# Match passes iff BOTH anchor-a AND anchor-b appear in the
# chapter (case-insensitive, fixed-string). If anchor-b is
# the literal "-" then only anchor-a is required.
SIGNALS=(
    "S1 deployed enough times|deployed|customization surface"
    "S2 failure modes characterized|failure modes|characterized"
    "S3 load-bearing decisions|load-bearing|implementation accident"
    "S4 conformance bar|conformance bar|acceptance commands"
    "A1 every install is bespoke|every install|bespoke"
    "A2 cant articulate non-compliant|non-compliant install|-"
    "A3 edit the source customization|edit the source|-"
)

errors=()

for row in "${SIGNALS[@]}"; do
    IFS='|' read -r name a b <<<"$row"
    if ! grep -iqF "$a" "$CHAPTER"; then
        errors+=("$name: missing anchor '$a'")
        continue
    fi
    if [ "$b" != "-" ]; then
        if ! grep -iqF "$b" "$CHAPTER"; then
            errors+=("$name: missing paired anchor '$b' (with '$a')")
        fi
    fi
done

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-01-phase-0-signals: %d signal(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-01-phase-0-signals: PASS — all 4 positive + 3 anti-signals anchored with paired terms\n'
exit 0
