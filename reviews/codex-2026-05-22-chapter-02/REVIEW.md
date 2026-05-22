# Codex cross-family review — Chapter 02 prose

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only content-quality review
Date: 2026-05-22
Target: `longread/02-phase-1-facet-inventory.md` (668
prose words at initial verify)

## Verdict

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR.

Chapter 02 is close but not convergence-ready. Prose
stays compact, voice is mostly aligned, and arc42/C4
prior-art use is truthful. Remaining MAJOR is
provenance: Phase 1 failure note + case-study section
added Product A process details not supported by the
cited workpad/corpus authority.

## BLOCKER

None.

## MAJOR findings

### Finding 1 — Phase 1 "what we did" adds unsupported case-study specifics
Severity: MAJOR
Citation: `longread/02-phase-1-facet-inventory.md:59-67`,
`...:78-85`,
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:288-300`,
`...:361-363`

Workpad supports the seven facets + "often hybrid" +
generalizable/mixed/studio-specific bucket split. It
does NOT support:
- buckets "did not coincide with the facet axis"
- generalizable-on-Architecture-+-studio-specific-on-
  Customization axis-crossing example
- BES added a per-artefact facet-primacy ranking
- Phase 2 consumed a longer primacy-ranked table

The strongest issue is the failure-note "What we did"
element: Contract §6.5 requires it to preserve the actual
BES pattern; the prose is specific enough to sound
checkable, but the only `facet-primacy` evidence is the
T-03 IDEA/SPEC itself.

Recommendation: trim the prose to the supported fact —
BES accepted hybrid per-artefact classification rather
than forcing clean one-facet classification — or add a
citable Product A audit source proving the additional
claims.

## MINOR

None at MAJOR-or-higher.

## Advisory

668-word length is acceptable under the soft-floors
amendment. Do not pad. If expanded, expansion should
only add citable Product A evidence or remove the
unsupported "what we did" details.

Voice broadly aligned with §6.3; no serious vendor-
register drift.

Mechanical checks pass; they do not catch the provenance
issue above.

## Truthfulness table (R1)

| Claim | Source support | Verdict | Notes |
|---|---:|---|---|
| arc42 prior-art for structured documentation | arc42 §3 | YES | Self-defines as architecture documentation template. |
| C4 per-level decomposition | c4-model §3 | YES | Four-level hierarchy supported. |
| Seven facets | Workpad §6 | YES | Matches lines 288-300. |
| Facet definitions | Workpad §6 | YES | Faithful expansions of terse workpad labels. |
| Bucket split | Workpad §7 | YES | Lines 361-363. |
| Bucket/facet axis non-coincidence | Workpad §7 | **PARTIAL/NO** | Labels supported; axis-crossing not. |
| Hybrid per-artefact output | Workpad §6 | YES | Supported. |
| BES added facet-primacy ranking | Authority set | **NO** | Only in T-03 SPEC/IDEA, not in cited authority. |
| Failure note three-element shape | Contract §6.5 | **PARTIAL** | Shape present; "what we did" lacks independent evidence. |
| Forward pointer to chapter 03 | Contract §6.1 / §7.1 | YES | Correct. |

## R1 remediation summary (post-fix, 2026-05-22)

Chapter trimmed of unsupported specifics:
- "buckets did not coincide with the facet axis" → removed.
- Architecture + Customization axis-crossing example → removed.
- "BES added a per-artefact facet-primacy ranking" → removed.
- "Phase 2 had to consume a longer primacy-ranked table" → removed.

What we did failure-note element trimmed to: "We
accepted hybrid as the output shape, not as a defect to
be cleaned up. The honest table is the table."

Chapter word count: 668 → 573 prose words (still under
1300 max; advisory below 1000 target — soft-floors
regime accepts).

All mechanical checks remain PASS.

tokens used: 156,689
