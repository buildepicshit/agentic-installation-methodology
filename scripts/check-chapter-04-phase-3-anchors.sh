#!/usr/bin/env bash
# check-chapter-04-phase-3-anchors.sh — T-05 acceptance helper.
#
# Verifies longread/04-phase-3-sanitization-bar.md contains
# paragraph-level paired-anchor coverage of:
#   - sanitization-bar concept (paragraph co-occurrence of
#     "sanitization" + "bar"/"keep"/"leave"/"line" anchor)
#   - three sanitization moves per workpad §6 (one row per
#     move: drop studio context; experience-as-evidence;
#     trust-boundary preconditions)
#   - BES disposition per workpad §7 (paragraph co-occurrence
#     of "drop ALL" + "owner://" or "decision-authority://"
#     anchor)
#   - the asymmetry between Product A sanitization and
#     Product B case-study density (paragraph co-occurrence
#     of "asymmetry" or equivalent + "Product B"/"longread"
#     + workpad §7 reference)
#
# Each row requires both anchor-a AND anchor-b within the
# SAME paragraph (awk RS=""). Same pattern as
# check-chapter-03-phase-2-anchors.sh.
#
# Exit 0 on pass; exit 1 on missing; exit 2 on bad args.

set -euo pipefail

CHAPTER="${1:-longread/04-phase-3-sanitization-bar.md}"

if [ ! -f "$CHAPTER" ]; then
    printf 'check-chapter-04-phase-3-anchors: FAIL — chapter file not found at %s\n' "$CHAPTER" >&2
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

# Sanitization-bar concept.
if ! paragraph_pair_match "sanitization" "bar|keep|leave behind|line|published spec"; then
    errors+=("S0 sanitization-bar concept: 'sanitization' + bar/keep/leave/line anchor must co-occur in one paragraph")
fi

# Move 1: drop studio context.
if ! paragraph_pair_match "drop" "studio context"; then
    errors+=("M1 drop studio context: 'drop' + 'studio context' must co-occur in one paragraph")
fi

# Move 2: experience-as-evidence.
if ! paragraph_pair_match "experience" "evidence|we tried|first-person|first person"; then
    errors+=("M2 experience-as-evidence: 'experience' + evidence/we-tried/first-person anchor must co-occur in one paragraph")
fi

# Move 3: trust-boundary preconditions.
if ! paragraph_pair_match "trust" "boundary|precondition|installer"; then
    errors+=("M3 trust-boundary preconditions: 'trust' + boundary/precondition/installer anchor must co-occur in one paragraph")
fi

# BES disposition.
if ! paragraph_pair_match "drop ALL" "owner://|decision-authority://|transcript"; then
    if ! paragraph_pair_match "drop all studio" "owner://|decision-authority://|transcript"; then
        errors+=("B1 BES disposition: 'drop ALL' + owner://transcript or decision-authority:// must co-occur in one paragraph")
    fi
fi

# Asymmetry — requires BOTH sides of the contrast in the
# same paragraph: Product A side (sanitization/drop ALL/
# spec bundle) AND Product B side (longread/case-study/
# named/full transparency). Per T-05 R1 finding 2, a loose
# 'asymmetry'+'longread' anchor passes too easily; the
# asymmetry only matters if both Product A's sanitized
# disposition AND Product B's full attribution appear
# together.
asymmetry_match() {
    awk '
        BEGIN { RS=""; IGNORECASE=1 }
        {
            p = tolower($0)
            has_a = (index(p, "product a") > 0) || (index(p, "spec bundle") > 0)
            has_a_disposition = (index(p, "sanitiz") > 0) || (index(p, "drop all") > 0) || (index(p, "drop ALL") > 0)
            has_b = (index(p, "product b") > 0) || (index(p, "longread") > 0)
            has_b_disposition = (index(p, "case study") > 0) || (index(p, "case-study") > 0) || (index(p, "named") > 0) || (index(p, "full transparency") > 0)
            if (has_a && has_a_disposition && has_b && has_b_disposition) { found = 1; exit }
        }
        END { exit !found }
    ' "$CHAPTER"
}
if ! asymmetry_match; then
    errors+=("A1 asymmetry: one paragraph must name BOTH 'Product A/spec bundle' + 'sanitization/drop ALL' AND 'Product B/longread' + 'case study/named/full transparency' (per T-05 R1 F2 closure)")
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'check-chapter-04-phase-3-anchors: %d anchor(s) missing:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'check-chapter-04-phase-3-anchors: PASS — sanitization-bar concept + 3 moves + BES disposition + asymmetry all paragraph-co-occur\n'
exit 0
