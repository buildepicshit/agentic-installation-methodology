#!/usr/bin/env bash
# check-chapter-02-failure-note.sh — T-03 acceptance helper.
#
# Verifies longread/02-phase-1-facet-inventory.md contains
# a Phase 1 failure-mode note in the §6.5 three-element
# structure
# (specs/2026-05-20-longread-structure/SPEC.md §6.5),
# placed as the chapter's penultimate section (immediately
# before the forward pointer).
#
# Three element-groups (each must have ≥ 1 anchor present
# in the section between the last "## " heading and the
# forward pointer):
#
#   E1 "what happened": needs phrasing that names the
#      Phase 1 hybrid-output reality per research §6
#      ("output: a per-artefact classification table,
#      often hybrid"). Anchors include "hybrid",
#      "multiple facets", "did not fit". Per R1 F1 +
#      R2 F1 closure, the "strict 1:1" / "single-facet"
#      framing is NOT used because it goes beyond the
#      cited workpad authority.
#   E2 "what we did": "we accepted", "we ranked", "we
#      added", "we revised", "what we did".
#   E3 "what pattern generalizes": "pattern", "generaliz",
#      "lesson", "anti-pattern", "what we learned".
#
# Exit 0 on pass; exit 1 on missing element; exit 2 on bad
# arguments.

set -euo pipefail

CHAPTER="${1:-longread/02-phase-1-facet-inventory.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-02-failure-note: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

# Extract section between last "## " heading and the
# forward-pointer line.
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
    printf 'check-chapter-02-failure-note: FAIL — could not extract failure-mode section between last ## heading and forward pointer\n' >&2
    exit 1
fi

# Section heading must signal failure concept.
section_heading="$(printf '%s\n' "$section" | head -n 1)"
if ! printf '%s' "$section_heading" | grep -iqE 'failure|what we|missed|phase 1|hybrid'; then
    printf 'check-chapter-02-failure-note: FAIL — section heading %q does not contain a failure-concept anchor\n' "$section_heading" >&2
    exit 1
fi

errors=()

# E1: what happened — Phase 1 hybrid-output reality
# (the workpad-grounded framing; R1 F1 rejected the
# stricter "strict 1:1" wording for going beyond the
# cited record).
if ! printf '%s' "$section" | grep -iqE 'hybrid|multiple facets|did not fit|ambiguity|several facets'; then
    errors+=("E1 what-happened: needs an anchor describing the Phase 1 hybrid-output reality (e.g. 'hybrid', 'multiple facets', 'did not fit')")
fi

# E2: what we did.
if ! printf '%s' "$section" | grep -iqE 'we accepted|we ranked|we did|we added|what we did|we revised|we admitted|we allowed|we let'; then
    errors+=("E2 what-we-did: needs an explicit 'we ...' action anchor")
fi

# E3: what pattern generalizes.
if ! printf '%s' "$section" | grep -iqE 'pattern|generaliz|lesson|anti-pattern|what we learned|in retrospect|in hindsight'; then
    errors+=("E3 what-generalizes: needs a pattern/lesson/generalization anchor")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-02-failure-note: %d element(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-02-failure-note: PASS — three-element failure note present at chapter penultimate section\n'
exit 0
