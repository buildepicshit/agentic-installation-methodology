#!/usr/bin/env bash
# check-chapter-05-phase-4-anchors.sh — T-06 helper.
#
# Verifies longread/05-phase-4-manifest-catalog-compose.md
# contains paragraph-level paired-anchor coverage of:
#   - composition question (manifest + catalog/sub-spec)
#   - four artefact shapes (each with corpus anchor):
#       * structured data + helm-values-schema OR YAML/
#         JSON-schema
#       * prose + arc42 OR markdown
#       * executable + cucumber-gherkin OR Given/When/Then
#       * diagram + c4-model OR structurizr-dsl
#   - manifest-as-front-door (oci-artifacts §3 anchor +
#     manifest/front-door anchor)
#   - BES Product A worked example (Product A + worked
#     example/v2.0/catalog shape)
#
# Each row requires both anchor-a AND anchor-b within the
# SAME paragraph (awk RS=""). Paragraph-co-occurrence
# pattern proven across chapters 03 + 04 helpers.
#
# Exit 0 on pass; exit 1 on missing; exit 2 on bad args.

set -euo pipefail

CHAPTER="${1:-longread/05-phase-4-manifest-catalog-compose.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-05-phase-4-anchors: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
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

# Composition question.
if ! paragraph_pair_match "manifest" "catalog|sub-spec|sub spec|per-facet"; then
    errors+=("C1 composition question: 'manifest' + catalog/sub-spec/per-facet must co-occur in one paragraph")
fi

# Four artefact shapes — each must paragraph-co-occur
# with its NAMED CORPUS FILE PATH (not loose keywords).
# Per T-06 R1 finding 2, helper must prove the corpus
# anchor co-occurs with the concept, not accept bare
# keyword listings.
if ! paragraph_pair_match "structured data" "research/primary-sources/helm-values-schema.md"; then
    errors+=("S1 structured-data shape: 'structured data' + research/primary-sources/helm-values-schema.md anchor must co-occur in one paragraph")
fi

if ! paragraph_pair_match "prose" "research/primary-sources/arc42.md"; then
    errors+=("S2 prose shape: 'prose' + research/primary-sources/arc42.md anchor must co-occur in one paragraph")
fi

if ! paragraph_pair_match "executable" "research/primary-sources/cucumber-gherkin.md"; then
    errors+=("S3 executable shape: 'executable' + research/primary-sources/cucumber-gherkin.md anchor must co-occur in one paragraph")
fi

if ! paragraph_pair_match "diagram" "research/primary-sources/c4-model.md|research/primary-sources/structurizr-dsl.md"; then
    errors+=("S4 diagram shape: 'diagram' + research/primary-sources/c4-model.md or research/primary-sources/structurizr-dsl.md anchor must co-occur in one paragraph")
fi

# Manifest as front door — require oci-artifacts corpus
# anchor co-occurrence with front-door concept.
if ! paragraph_pair_match "front door" "research/primary-sources/oci-artifacts.md"; then
    if ! paragraph_pair_match "front-door" "research/primary-sources/oci-artifacts.md"; then
        errors+=("M1 manifest-as-front-door: 'front door'/'front-door' + research/primary-sources/oci-artifacts.md anchor must co-occur in one paragraph")
    fi
fi

# BES Product A worked example.
if ! paragraph_pair_match "Product A" "worked example|v2\\.0|catalog shape|manifest"; then
    errors+=("B1 BES Product A: 'Product A' + worked-example/v2.0/catalog-shape/manifest anchor must co-occur in one paragraph")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-05-phase-4-anchors: %d anchor(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-05-phase-4-anchors: PASS — composition + 4 shapes + manifest-front-door + BES Product A all paragraph-co-occur\n'
exit 0
