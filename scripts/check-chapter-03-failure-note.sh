#!/usr/bin/env bash
# check-chapter-03-failure-note.sh — T-04 acceptance helper.
#
# Verifies longread/03-phase-2-parameterization-surface.md
# contains a Phase 2 failure-mode note in the §6.5 three-
# element structure (specs/2026-05-20-longread-structure/
# SPEC.md §6.5), placed as the chapter's penultimate
# section.
#
# Per T-04 R1 finding 2, each element requires an explicit
# anchor phrase (not generic vocabulary). The expected
# pattern is the literal bold markers "**What happened.**",
# "**What we did.**", "**What pattern generalizes.**" —
# the same phrasing chapters 01 and 02 use. The check
# rejects sections that lack any of those three explicit
# markers.
#
# Exit 0 on pass; exit 1 on missing element; exit 2 on bad
# args.

set -euo pipefail

CHAPTER="${1:-longread/03-phase-2-parameterization-surface.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-03-failure-note: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
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
    printf 'check-chapter-03-failure-note: FAIL — could not extract failure-mode section between last ## heading and forward pointer\n' >&2
    exit 1
fi

section_heading="$(printf '%s\n' "$section" | head -n 1)"
if ! printf '%s' "$section_heading" | grep -iqE 'failure|what we|phase 2|surface|deferral'; then
    printf 'check-chapter-03-failure-note: FAIL — section heading %q does not contain a failure-concept anchor\n' "$section_heading" >&2
    exit 1
fi

errors=()

# E1: explicit "What happened" bold marker.
if ! printf '%s' "$section" | grep -qE '\*\*What happened\.?\*\*'; then
    errors+=("E1 what-happened: needs explicit bold marker **What happened.**")
fi

# E2: explicit "What we did" bold marker.
if ! printf '%s' "$section" | grep -qE '\*\*What we did\.?\*\*'; then
    errors+=("E2 what-we-did: needs explicit bold marker **What we did.**")
fi

# E3: explicit "What pattern generalizes" bold marker.
if ! printf '%s' "$section" | grep -qE '\*\*What pattern generalizes\.?\*\*|\*\*What generalizes\.?\*\*'; then
    errors+=("E3 what-generalizes: needs explicit bold marker **What pattern generalizes.** (or **What generalizes.**)")
fi

# E3 additionally must carry judgment://agent-synthesis
# tag, since the chapter 02 R1 + T-04 R1 lessons require
# synthesis to be marked as synthesis.
if ! printf '%s' "$section" | grep -qF 'judgment://agent-synthesis'; then
    errors+=("E3 what-generalizes: needs explicit 'judgment://agent-synthesis' tag marking synthesis vs case-study fact")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-03-failure-note: %d element(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-03-failure-note: PASS — three explicit bold markers present + agent-synthesis tag on E3\n'
exit 0
