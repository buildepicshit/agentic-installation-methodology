#!/usr/bin/env bash
# check-chapter-00-phase-roadmap.sh — T-01 acceptance helper.
#
# Verifies longread/00-introduction.md contains a phase roadmap
# satisfying the T-11 contract in
# specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:
#
#   1. Each literal token Phase 0 .. Phase 7 appears 1 or 2 times.
#   2. The first occurrences appear in ascending order
#      (Phase 0 before Phase 1 before ... before Phase 7).
#   3. The first and last first-occurrence positions are within
#      1500 characters of each other (≈ 250 prose words).
#
# Exit 0 on pass; exit 1 on any failure; exit 2 on bad arguments.

set -euo pipefail

CHAPTER="${1:-longread/00-introduction.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-00-phase-roadmap: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

PHASES=("Phase 0" "Phase 1" "Phase 2" "Phase 3" "Phase 4" "Phase 5" "Phase 6" "Phase 7")
errors=()

content="$(cat "$CHAPTER")"

declare -A first_pos
declare -A occ_count

for phase in "${PHASES[@]}"; do
    count="$(grep -o -F "$phase" "$CHAPTER" | wc -l | tr -d ' ')"
    occ_count["$phase"]="$count"
    if [ "$count" -lt 1 ]; then
        errors+=("$phase: 0 occurrences (expected 1 or 2)")
        continue
    fi
    if [ "$count" -gt 2 ]; then
        errors+=("$phase: $count occurrences (expected 1 or 2)")
    fi
    prefix_to_first="${content%%"$phase"*}"
    first_pos["$phase"]=${#prefix_to_first}
done

all_present=1
for phase in "${PHASES[@]}"; do
    if [ -z "${first_pos[$phase]:-}" ]; then
        all_present=0
        break
    fi
done

if [ "$all_present" -eq 1 ]; then
    prev=-1
    for phase in "${PHASES[@]}"; do
        pos="${first_pos[$phase]}"
        if [ "$pos" -le "$prev" ]; then
            errors+=("ordering: $phase first-occurrence at byte $pos is not after the previous phase ($prev)")
        fi
        prev="$pos"
    done
    first_phase_pos="${first_pos[${PHASES[0]}]}"
    last_phase_pos="${first_pos[${PHASES[7]}]}"
    window=$((last_phase_pos - first_phase_pos))
    if [ "$window" -gt 1500 ]; then
        errors+=("window: Phase 0 and Phase 7 first-occurrences span $window characters (> 1500)")
    fi
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-00-phase-roadmap: %d issue(s) found:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-00-phase-roadmap: PASS — all 8 phase tokens present, ascending, within 1500-char window\n'
exit 0
