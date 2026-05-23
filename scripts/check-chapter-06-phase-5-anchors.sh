#!/usr/bin/env bash
# check-chapter-06-phase-5-anchors.sh — T-07 helper.
#
# Per T-06 R1 F2 + T-07 R1 F2 lesson: each row requires
# paragraph-level co-occurrence with NAMED CORPUS FILE
# PATHS or AUTHORITY FILE PATHS, not loose keywords.
#
# Verifies longread/06-phase-5-cross-family-validation.md
# contains paragraph-level paired-anchor coverage of:
#   - cross-family validation concept + leaddev-agent-
#     compiled corpus file path (variance-risk anchor)
#   - walkthrough pattern + symphony-spec or cucumber-
#     gherkin corpus file path (validation-shape anchor)
#   - BES same-family proxy + workpad RESEARCH.md
#     file path (BES disposition authority)
#   - chapter 00 prior disclosure + longread/00-
#     introduction.md file path

set -euo pipefail

CHAPTER="${1:-longread/06-phase-5-cross-family-validation.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-06-phase-5-anchors: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
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

# Cross-family + variance-risk corpus anchor.
if ! paragraph_pair_match "cross-family" "research/primary-sources/leaddev-agent-compiled.md"; then
    errors+=("V1 cross-family + variance: 'cross-family' + research/primary-sources/leaddev-agent-compiled.md must co-occur in one paragraph")
fi

# Walkthrough pattern + validation-shape corpus anchor.
if ! paragraph_pair_match "walkthrough" "research/primary-sources/symphony-spec.md|research/primary-sources/cucumber-gherkin.md"; then
    errors+=("W1 walkthrough + shape: 'walkthrough' + research/primary-sources/symphony-spec.md OR research/primary-sources/cucumber-gherkin.md must co-occur in one paragraph")
fi

# BES disposition + workpad authority.
if ! paragraph_pair_match "same-family proxy" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
    errors+=("B1 BES disposition: 'same-family proxy' + workpad RESEARCH.md path must co-occur in one paragraph")
fi

# Chapter 00 prior disclosure.
if ! paragraph_pair_match "chapter 00" "longread/00-introduction.md"; then
    errors+=("C1 chapter-00 prior disclosure: 'chapter 00' + longread/00-introduction.md path must co-occur in one paragraph")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-06-phase-5-anchors: %d anchor(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-06-phase-5-anchors: PASS — cross-family + leaddev + walkthrough + symphony/gherkin + BES disposition + workpad + chapter 00 prior all paragraph-co-occur with file-path anchors\n'
exit 0
