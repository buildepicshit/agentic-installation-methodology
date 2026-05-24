#!/usr/bin/env bash
# check-chapter-08-phase-7-anchors.sh — T-09 helper.
#
# Verifies paragraph-level co-occurrence with file-path
# anchors per T-06 R1 F2 + T-07 R1 F2 lesson. Helper
# docstring row count matches implemented `if` block
# count per T-08 R1 F1 lesson.
#
# 7 rows (each implemented as one if-block):
#   - Q1 leaddev risk framing + leaddev-agent-compiled.md
#   - W1 workpad authority (§6 Phase 7 + §7 + §2.3)
#   - D1 parent Decision publication binding
#   - C1 chapters 01-07 all referenced by file path
#     (internal loop over 7 paths)
#   - F1 four BES cross-phase failure modes
#     (internal loop over 4 anchor terms)
#   - F2 §6.5 three-element structure coupled per
#     cross-phase mode via OWNED `### …` subsections
#     (codex T-09 R1 F1 + R2 F1 + R3 F1): for each of
#     the 4 mode anchors, the chapter MUST contain a
#     distinct `### …` heading whose heading line
#     mentions the anchor AND whose body (until the
#     next `### `, `## `, or EOF) contains all three
#     §6.5 bold markers (`**What happened.**`,
#     `**What we did.**`, `**What pattern
#     generalizes.**`). Each anchor claims one
#     heading; subsections cannot be reused.
#   - R1 seven open research questions
#     (internal loop over 7 anchor terms)

set -euo pipefail

CHAPTER="${1:-longread/08-phase-7-failure-modes-as-first-class-content.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-08-phase-7-anchors: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

paragraph_pair_match() {
    local anchor_a="$1"
    local anchor_b="$2"
    awk -v a="$anchor_a" -v b="$anchor_b" '
        BEGIN { RS=""; IGNORECASE=1 }
        index(tolower($0), tolower(a)) > 0 && match(tolower($0), tolower(b)) > 0 { found=1; exit }
        END { exit !found }
    ' "$CHAPTER"
}

errors=()

# Q1: leaddev risk framing.
if ! paragraph_pair_match "risk" "research/primary-sources/leaddev-agent-compiled.md"; then
    if ! paragraph_pair_match "archaeology" "research/primary-sources/leaddev-agent-compiled.md"; then
        errors+=("Q1 leaddev risk framing: 'risk' or 'archaeology' + leaddev-agent-compiled.md must co-occur in one paragraph")
    fi
fi

# W1: workpad authority for §7 + §2.3.
if ! paragraph_pair_match "workpad" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
    if ! paragraph_pair_match "research" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
        errors+=("W1 workpad authority: 'workpad' or 'research' + workpad RESEARCH.md path must co-occur in one paragraph")
    fi
fi

# D1: parent Decision publication binding.
if ! paragraph_pair_match "parent Decision" "bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md"; then
    if ! paragraph_pair_match "Decision" "bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md"; then
        errors+=("D1 parent Decision: 'parent Decision' + parent Decision SPEC.md path must co-occur in one paragraph")
    fi
fi

# C1: all 7 chapters 01-07 referenced by file path.
chapter_paths=(
    "longread/01-phase-0-maturity-check.md"
    "longread/02-phase-1-facet-inventory.md"
    "longread/03-phase-2-parameterization-surface.md"
    "longread/04-phase-3-sanitization-bar.md"
    "longread/05-phase-4-manifest-catalog-compose.md"
    "longread/06-phase-5-cross-family-validation.md"
    "longread/07-phase-6-ship.md"
)
missing_chapters=()
for p in "${chapter_paths[@]}"; do
    if ! grep -qF "$p" "$CHAPTER"; then
        missing_chapters+=("$p")
    fi
done
if [ ${#missing_chapters[@]} -gt 0 ]; then
    errors+=("C1 chapter references: missing chapter file paths (${missing_chapters[*]})")
fi

# F1: four BES cross-phase failure modes (each anchor must appear).
failure_anchors=(
    "fastpath"
    "decomposition"
    "workpad bootstrap"
    "ceremony refactor"
)
missing_failures=()
for a in "${failure_anchors[@]}"; do
    if ! grep -iqF "$a" "$CHAPTER"; then
        missing_failures+=("$a")
    fi
done
if [ ${#missing_failures[@]} -gt 0 ]; then
    errors+=("F1 BES failure modes: missing anchors (${missing_failures[*]})")
fi

# F2: §6.5 three-element structure coupled per cross-
# phase mode via OWNED `### …` subsections. Codex T-09
# R3 F1 lesson: requiring "anchor + markers somewhere
# in a ### block" still allowed one combined subsection
# to satisfy all four anchors. Stronger contract:
#   (a) the anchor MUST appear in the `### …` HEADING
#       LINE itself (so the subsection is named for the
#       mode);
#   (b) the subsection body (until the next `### `,
#       `## `, or EOF) MUST contain all three §6.5 bold
#       markers `**What happened.**`,
#       `**What we did.**`,
#       `**What pattern generalizes.**`;
#   (c) each anchor MUST claim a DISTINCT heading —
#       no subsection may be reused across modes.
# Implementation: iterate anchors in order; for each,
# scan the chapter and lock the first qualifying
# unclaimed `### …` heading.
missing_f2=()
used_headings=""
for anchor in "${failure_anchors[@]}"; do
    matched_heading="$(awk -v anchor="$anchor" -v used="$used_headings" '
        BEGIN {
            IGNORECASE = 1
            in_block = 0
            heading = ""
            matched = ""
        }
        function flush() {
            if (in_block && heading_has_anchor && has_hap && has_did && has_pat) {
                if (index(used, "|" heading "|") == 0 && matched == "") {
                    matched = heading
                }
            }
        }
        /^### / {
            flush()
            in_block = 1
            heading = $0
            heading_has_anchor = (tolower($0) ~ tolower(anchor))
            has_hap = 0; has_did = 0; has_pat = 0
            next
        }
        /^## / {
            flush()
            in_block = 0
            next
        }
        in_block {
            if (index($0, "**What happened.**") > 0) has_hap = 1
            if (index($0, "**What we did.**") > 0) has_did = 1
            if (index($0, "**What pattern generalizes.**") > 0) has_pat = 1
        }
        END {
            flush()
            if (matched != "") print matched
        }
    ' "$CHAPTER")"
    if [ -z "$matched_heading" ]; then
        missing_f2+=("$anchor: no unclaimed \`### …\` heading contains the anchor AND has all three §6.5 markers in its body")
    else
        used_headings="${used_headings}|${matched_heading}|"
    fi
done
if [ ${#missing_f2[@]} -gt 0 ]; then
    errors+=("F2 §6.5 per-mode owned-subsection coupling: ${missing_f2[*]}")
fi

# R1: seven open research questions (each anchor must appear).
research_anchors=(
    "exhaustiveness"
    "ambiguity"
    "patching"
    "install-matches-intent|install matches intent"
    "equivalence class"
    "capability floor"
    "adversarial"
)
missing_research=()
for a in "${research_anchors[@]}"; do
    if ! grep -iqE "$a" "$CHAPTER"; then
        missing_research+=("$a")
    fi
done
if [ ${#missing_research[@]} -gt 0 ]; then
    errors+=("R1 open research questions: missing anchors (${missing_research[*]})")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-08-phase-7-anchors: %d row(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-08-phase-7-anchors: PASS — 7 rows: leaddev + workpad + parent Decision + 7 chapter refs + 4 failure modes + §6.5 three-element structure + 7 research questions all anchored\n'
exit 0
