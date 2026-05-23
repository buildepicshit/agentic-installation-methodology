#!/usr/bin/env bash
# check-chapter-06-failure-note.sh — T-07 helper.
#
# Verifies the Phase 5 failure-mode note in
# longread/06-phase-5-cross-family-validation.md uses
# the §6.5 three-element structure with explicit bold
# markers + judgment://agent-synthesis tag.

set -euo pipefail

CHAPTER="${1:-longread/06-phase-5-cross-family-validation.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-06-failure-note: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

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
    printf 'check-chapter-06-failure-note: FAIL — could not extract failure-mode section\n' >&2
    exit 1
fi

section_heading="$(printf '%s\n' "$section" | head -n 1)"
if ! printf '%s' "$section_heading" | grep -iqE 'failure|what we|phase 5|cross-family|outstanding'; then
    printf 'check-chapter-06-failure-note: FAIL — section heading %q does not contain a failure-concept anchor\n' "$section_heading" >&2
    exit 1
fi

errors=()

if ! printf '%s' "$section" | grep -qE '\*\*What happened\.?\*\*'; then
    errors+=("E1 what-happened: needs explicit bold marker **What happened.**")
fi

if ! printf '%s' "$section" | grep -qE '\*\*What we did\.?\*\*'; then
    errors+=("E2 what-we-did: needs explicit bold marker **What we did.**")
fi

if ! printf '%s' "$section" | grep -qE '\*\*What pattern generalizes\.?\*\*|\*\*What generalizes\.?\*\*'; then
    errors+=("E3 what-generalizes: needs explicit bold marker **What pattern generalizes.** (or **What generalizes.**)")
fi

if ! printf '%s' "$section" | grep -qF 'judgment://agent-synthesis'; then
    errors+=("E3 what-generalizes: needs explicit 'judgment://agent-synthesis' tag")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-06-failure-note: %d element(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-06-failure-note: PASS — three explicit bold markers + agent-synthesis tag on E3\n'
exit 0
