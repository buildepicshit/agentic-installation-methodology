#!/usr/bin/env bash
# check-chapter-01-failure-note.sh — T-02 acceptance helper.
#
# Verifies longread/01-phase-0-maturity-check.md contains a
# Phase 0 failure-mode note in the §6.5 three-element
# structure
# (specs/2026-05-20-longread-structure/SPEC.md §6.5), placed
# as the chapter's penultimate section (immediately before
# the forward pointer).
#
# Three element-groups (each must have at least one anchor
# present somewhere in the section between the failure-
# mode heading and the forward pointer):
#
#   E1 "what happened": e.g. "product a v1", "published"
#      paired with "without" or "missing"; or "what
#      happened".
#   E2 "what we did": e.g. "we re-entered", "we did",
#      "we added", "we repacked", "what we did".
#   E3 "what pattern generalizes": e.g. "pattern",
#      "generalizes", "lesson", "what we learned".
#
# Exit 0 on pass; exit 1 on missing element; exit 2 on
# bad arguments.

set -euo pipefail

CHAPTER="${1:-longread/01-phase-0-maturity-check.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-01-failure-note: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

# Extract the section between the last "## " heading
# before the "**In the next chapter**:" line and the
# forward-pointer line itself.
section="$(awk '
    /^## / { last_h_line = NR; last_h = $0 }
    /\*\*In the next chapter\*\*:/ { pointer_line = NR; exit }
    { lines[NR] = $0 }
    END {
        if (last_h_line == 0 || pointer_line == 0) exit
        for (i = last_h_line; i < pointer_line; i++) {
            print lines[i]
        }
    }
' "$CHAPTER")"

if [ -z "$section" ]; then
    printf 'check-chapter-01-failure-note: FAIL — could not extract failure-mode section between last ## heading and forward pointer\n' >&2
    exit 1
fi

# Verify the section heading itself signals a failure
# concept.
section_heading="$(printf '%s\n' "$section" | head -n 1)"
if ! printf '%s' "$section_heading" | grep -iqE 'failure|what we|missed|phase 0'; then
    printf 'check-chapter-01-failure-note: FAIL — section heading %q does not contain a failure-concept anchor\n' "$section_heading" >&2
    exit 1
fi

errors=()

# E1: what happened (Product A v1 + missing/without)
e1_a=$(printf '%s' "$section" | grep -iqE 'product a (v1|version 1|v\.1)' && echo Y || echo N)
e1_b=$(printf '%s' "$section" | grep -iqE 'without|missing|did not have|lacked' && echo Y || echo N)
if [ "$e1_a" = N ] || [ "$e1_b" = N ]; then
    errors+=("E1 what-happened: needs both 'Product A v1' AND a missing/without anchor")
fi

# E2: what we did
if ! printf '%s' "$section" | grep -iqE 'we re-entered|we did|we added|we repacked|we caught|what we did|we revised|we cut|we shipped|we then'; then
    errors+=("E2 what-we-did: needs an explicit 'we ...' action anchor")
fi

# E3: what pattern generalizes
if ! printf '%s' "$section" | grep -iqE 'pattern|generaliz|lesson|what we learned|the takeaway|in retrospect|in hindsight'; then
    errors+=("E3 what-generalizes: needs a pattern/lesson/generalization anchor")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-01-failure-note: %d element(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-01-failure-note: PASS — three-element failure note present at chapter penultimate section\n'
exit 0
