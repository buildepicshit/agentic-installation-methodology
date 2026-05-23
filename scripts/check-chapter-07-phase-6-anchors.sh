#!/usr/bin/env bash
# check-chapter-07-phase-6-anchors.sh — T-08 helper.
#
# Verifies paragraph-level co-occurrence with corpus
# file paths per T-06 R1 F2 + T-07 R1 F2 lesson.
#
# Rows:
#   - ship-question + spec-kit OR workpad RESEARCH.md
#   - three-artefacts + paired release + workpad
#     RESEARCH.md or parent Decision SPEC.md
#   - cross-linking + workpad RESEARCH.md
#   - signing + sigstore-cosign.md
#   - SBOM/provenance + cyclonedx-sbom.md
#   - versioned-bundle + oci-artifacts.md
#   - BES paired-release + workpad RESEARCH.md path

set -euo pipefail

CHAPTER="${1:-longread/07-phase-6-ship.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-07-phase-6-anchors: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
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

# Three-anchor row check.
paragraph_triple_match() {
    local anchor_a="$1" anchor_b="$2" anchor_c="$3"
    awk -v a="$anchor_a" -v b="$anchor_b" -v c="$anchor_c" '
        BEGIN { RS=""; IGNORECASE=1 }
        index(tolower($0), tolower(a)) > 0 && index(tolower($0), tolower(b)) > 0 && index(tolower($0), tolower(c)) > 0 { found=1; exit }
        END { exit !found }
    ' "$CHAPTER"
}

errors=()

# Ship-question framing.
if ! paragraph_pair_match "ship" "research/primary-sources/spec-kit.md"; then
    if ! paragraph_pair_match "ship" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
        errors+=("Q1 ship-question: 'ship' + spec-kit.md OR workpad RESEARCH.md must co-occur in one paragraph")
    fi
fi

# Three-artefacts triad: Product A + Product B + conformance suite.
if ! paragraph_triple_match "Product A" "Product B" "conformance suite"; then
    errors+=("A1 three-artefacts: 'Product A' + 'Product B' + 'conformance suite' must co-occur in one paragraph")
fi
# Three-artefacts authority anchor.
if ! paragraph_pair_match "conformance suite" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
    if ! paragraph_pair_match "Product A" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
        errors+=("A2 three-artefacts authority: 'Product A' OR 'conformance suite' + workpad RESEARCH.md must co-occur in one paragraph")
    fi
fi

# Cross-linking + workpad authority.
if ! paragraph_pair_match "cross-link" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
    if ! paragraph_pair_match "cite the other" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
        errors+=("X1 cross-linking: 'cross-link' or 'cite the other' + workpad RESEARCH.md path must co-occur in one paragraph")
    fi
fi

# Signing + sigstore-cosign corpus.
if ! paragraph_pair_match "sign" "research/primary-sources/sigstore-cosign.md"; then
    errors+=("S1 signing: 'sign' + research/primary-sources/sigstore-cosign.md must co-occur in one paragraph")
fi

# SBOM/provenance + cyclonedx corpus.
if ! paragraph_pair_match "sbom" "research/primary-sources/cyclonedx-sbom.md"; then
    if ! paragraph_pair_match "provenance" "research/primary-sources/cyclonedx-sbom.md"; then
        errors+=("P1 SBOM/provenance: 'SBOM' or 'provenance' + research/primary-sources/cyclonedx-sbom.md must co-occur in one paragraph")
    fi
fi

# Versioned bundle + oci-artifacts.
if ! paragraph_pair_match "versioned bundle" "research/primary-sources/oci-artifacts.md"; then
    if ! paragraph_pair_match "manifest" "research/primary-sources/oci-artifacts.md"; then
        errors+=("V1 versioned-bundle: 'versioned bundle' or 'manifest' + research/primary-sources/oci-artifacts.md must co-occur in one paragraph")
    fi
fi

# BES paired-release + workpad authority.
if ! paragraph_pair_match "paired release" "bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md"; then
    errors+=("B1 BES disposition: 'paired release' + workpad RESEARCH.md path must co-occur in one paragraph")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-07-phase-6-anchors: %d anchor(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-07-phase-6-anchors: PASS — ship-question + three-artefacts + cross-linking + signing + SBOM + versioned-bundle + BES paired-release all paragraph-co-occur with file-path anchors\n'
exit 0
