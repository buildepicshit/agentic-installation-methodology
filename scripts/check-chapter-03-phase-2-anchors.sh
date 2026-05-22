#!/usr/bin/env bash
# check-chapter-03-phase-2-anchors.sh — T-04 acceptance helper.
#
# Verifies longread/03-phase-2-parameterization-surface.md
# contains paired-anchor coverage of:
#   - deferral-contract concept (paragraph-level co-occurrence
#     of "deferral" + parameterize/hard-code anchor)
#   - single-file prior-art shape (paragraph-level co-occurrence
#     of "single-file" + Symphony/WORKFLOW.md anchor)
#   - multi-file prior-art shape (paragraph-level co-occurrence
#     of "multi-file" + Helm/Nix/values.yaml/flake.nix anchor)
#   - BES distributed disposition (paragraph-level co-occurrence
#     of "distributed" + fleet-manifest/"not a single one"
#     anchor)
#
# Paragraph = a contiguous block of non-blank lines.
# Each row requires the anchor pair within the SAME paragraph
# (not just somewhere in the chapter). This guards against
# global keyword false-passes per T-04 R1 finding 2.
#
# Exit 0 on pass; exit 1 on any missing; exit 2 on bad args.

set -euo pipefail

CHAPTER="${1:-longread/03-phase-2-parameterization-surface.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-03-phase-2-anchors: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

# Split chapter into paragraphs (blank-line delimited),
# search each for the required anchor pair.
# anchor_a is a fixed-string; anchor_b is a regex (extended).
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

# Deferral-contract concept.
if ! paragraph_pair_match "deferral" "parameteriz|hard-code|hard code"; then
    errors+=("D1 deferral concept: 'deferral' + parameterize/hard-code anchors must co-occur in one paragraph")
fi

# Single-file shape.
if ! paragraph_pair_match "single-file" "symphony|workflow\\.md"; then
    if ! paragraph_pair_match "single file" "symphony|workflow\\.md"; then
        errors+=("S1 single-file shape: 'single-file' + Symphony/WORKFLOW.md anchors must co-occur in one paragraph")
    fi
fi

# Multi-file shape.
if ! paragraph_pair_match "multi-file" "helm|nix|values\\.yaml|flake\\.nix"; then
    if ! paragraph_pair_match "multi file" "helm|nix|values\\.yaml|flake\\.nix"; then
        errors+=("M1 multi-file shape: 'multi-file' + Helm/Nix anchor must co-occur in one paragraph")
    fi
fi

# BES distributed disposition.
if ! paragraph_pair_match "distributed" "fleet-manifest|not a single one"; then
    errors+=("B1 BES disposition: 'distributed' + fleet-manifest/'not a single one' must co-occur in one paragraph")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-03-phase-2-anchors: %d anchor(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-03-phase-2-anchors: PASS — deferral + single-file + multi-file + BES distributed all paragraph-co-occur\n'
exit 0
