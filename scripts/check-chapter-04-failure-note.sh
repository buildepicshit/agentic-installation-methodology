#!/usr/bin/env bash
# check-chapter-04-failure-note.sh — T-05 acceptance helper.
#
# Verifies longread/04-phase-3-sanitization-bar.md contains
# a Phase 3 failure-mode note in the §6.5 three-element
# structure (specs/2026-05-20-longread-structure/SPEC.md
# §6.5), placed as the chapter's penultimate section.
#
# Per T-04 lessons (chapter 03 prose R1 + chapter 02 prose
# R1), each element requires an explicit bold marker AND
# E3 requires a `judgment://agent-synthesis` tag to mark
# synthesis distinct from workpad-grounded case-study fact.
#
# Exit 0 on pass; exit 1 on missing element; exit 2 on bad
# args.

set -euo pipefail

CHAPTER="${1:-longread/04-phase-3-sanitization-bar.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-04-failure-note: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
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
    printf 'check-chapter-04-failure-note: FAIL — could not extract failure-mode section between last ## heading and forward pointer\n' >&2
    exit 1
fi

section_heading="$(printf '%s\n' "$section" | head -n 1)"
if ! printf '%s' "$section_heading" | grep -iqE 'failure|what we|phase 3|sanitization'; then
    printf 'check-chapter-04-failure-note: FAIL — section heading %q does not contain a failure-concept anchor\n' "$section_heading" >&2
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
    errors+=("E3 what-generalizes: needs explicit 'judgment://agent-synthesis' tag marking synthesis vs case-study fact")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-04-failure-note: %d element(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-04-failure-note: PASS — three explicit bold markers present + agent-synthesis tag on E3\n'
exit 0
