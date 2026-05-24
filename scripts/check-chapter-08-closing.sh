#!/usr/bin/env bash
# check-chapter-08-closing.sh — T-09 helper.
#
# Verifies the chapter's final non-blank content is the
# exact literal closing line per Contract §8.1:
#
#   **In the next chapter**: This is the last chapter.
#   The seven open research questions follow.
#
# Codex T-09 R1 F2 lesson: a substring-only check is too
# loose (no period enforcement, no ordering, no
# "no-prose-after" enforcement). Helper normalises
# whitespace on the final non-blank lines and requires a
# byte-exact match against the literal closing text. No
# prose may follow it.

set -euo pipefail

CHAPTER="${1:-longread/08-phase-7-failure-modes-as-first-class-content.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-08-closing: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

EXPECTED='**In the next chapter**: This is the last chapter. The seven open research questions follow.'

# Strip trailing blank lines, take the last paragraph
# (everything from the final blank line to EOF), and
# collapse whitespace.
tail_paragraph="$(awk '
    { lines[NR] = $0 }
    END {
        # find last non-blank line
        last = NR
        while (last > 0 && lines[last] ~ /^[[:space:]]*$/) last--
        if (last == 0) exit
        # find blank line before that block
        start = last
        while (start > 1 && lines[start-1] !~ /^[[:space:]]*$/) start--
        for (i = start; i <= last; i++) printf "%s ", lines[i]
        printf "\n"
    }
' "$CHAPTER" | tr -s ' \t' ' ' | sed 's/^ //; s/ $//')"

if [ "$tail_paragraph" != "$EXPECTED" ]; then
    printf 'check-chapter-08-closing: FAIL — final non-blank paragraph is not the exact Contract §8.1 closing line.\n' >&2
    printf '  expected: %s\n' "$EXPECTED" >&2
    printf '  got:      %s\n' "$tail_paragraph" >&2
    exit 1
fi

printf 'check-chapter-08-closing: PASS — Contract §8.1 closing line is the exact final non-blank paragraph\n'
exit 0
