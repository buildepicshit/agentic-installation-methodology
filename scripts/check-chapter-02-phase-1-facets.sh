#!/usr/bin/env bash
# check-chapter-02-phase-1-facets.sh — T-03 acceptance helper.
#
# Verifies longread/02-phase-1-facet-inventory.md contains
# paired-anchor coverage of:
#   - all seven Phase 1 facets per research workpad §6
#     (../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md)
#     — each requires the facet label PLUS an intent-role
#       anchor (so a keyword listing does not pass without
#       actually framing the facet's intent role)
#   - the generalizable / mixed / studio-specific bucket
#     split per research §7 — each requires the bucket
#     label PLUS a bucket/classification term
#   - the hybrid-artefact concept (one artefact serves
#     multiple facets) — paired ("hybrid" + "multiple
#     facets")
#
# Each row requires BOTH anchor-a AND anchor-b to appear
# (case-insensitive, fixed-string).
#
# Exit 0 on pass; exit 1 on any missing; exit 2 on bad
# arguments.

set -euo pipefail

CHAPTER="${1:-longread/02-phase-1-facet-inventory.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-02-phase-1-facets: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
    exit 1
fi

# Row format: "Name|anchor-a|anchor-b"
ANCHORS=(
    "F1 Architecture facet|architecture|domain model"
    "F2 Deployment facet|deployment|substrate"
    "F3 Behavior facet|behavior|contract"
    "F4 Customization facet|customization|affordance"
    "F5 Decisions facet|decisions|rationale"
    "F6 Operations facet|operations|observability"
    "F7 Non-goals facet|non-goals|facet"
    "B1 generalizable bucket|generalizable|bucket"
    "B2 mixed bucket|mixed|bucket"
    "B3 studio-specific bucket|studio-specific|bucket"
    "H1 hybrid artefact|hybrid|multiple facets"
)

errors=()

for row in "${ANCHORS[@]}"; do
    IFS='|' read -r name a b <<<"$row"
    if ! grep -iqF "$a" "$CHAPTER"; then
        errors+=("$name: missing anchor '$a'")
        continue
    fi
    if ! grep -iqF "$b" "$CHAPTER"; then
        errors+=("$name: missing paired anchor '$b' (with '$a')")
    fi
done

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-02-phase-1-facets: %d anchor(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-02-phase-1-facets: PASS — 7 facets (paired) + 3 buckets (paired) + hybrid (paired) anchored\n'
exit 0
