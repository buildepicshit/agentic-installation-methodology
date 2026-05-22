# Codex cross-family review R2 — T-03 chapter 02 Phase 1 facet inventory Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R2 spec-review after R1 remediation
Date: 2026-05-22

## Verdict

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR. R1 F2 closed in
executable helper logic. R1 F1 not fully closed: stale
unsupported Phase 1 specifics and single-facet framing
remained in the SPEC and linked IDEA.

## BLOCKER

None.

## MAJOR findings

### Finding 1 — R1 F1 carry-through incomplete
Severity: MAJOR
Citation:
`specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md:237-251`,
`...:441-449`,
`specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/IDEA.md:95-140`,
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:288-300`,
`...:361-363`

§9 still names `the hook suite` and `Customization
facet promotion in v2.0` as Phase 1 case-study content,
while §16 said the workpad "does NOT name specific
artefact examples." §9 also still said a "clean one-
facet-per-artefact table did not fit cleanly" and that
BES avoided "forcing single-facet." The linked IDEA
repeats the rejected "strict 1:1" / "single-facet"
framing.

Cited research authority supports only the seven facets,
hybrid output, and the bucket split. It does not support
those specific examples or the attempted strict-
classification narrative.

Recommendation: remove the hook-suite / v2.0
customization claims unless new citable authority is
added. Rewrite §9 and the IDEA to state only the
workpad-grounded fact: Phase 1 produced often-hybrid
output because one artefact can serve multiple facets.

## MINOR

None.

## Advisory

F2 looks closed:
`scripts/check-chapter-02-phase-1-facets.sh:33-46` now
requires paired anchors for facets, buckets, and hybrid
output. No MAJOR false-negative risk; paired terms track
workpad language closely.

The failure-note helper executable logic is aligned at
`scripts/check-chapter-02-failure-note.sh:64-69`, but its
header comment at lines 15-18 still mentions "strict 1:1"
/ "single-facet." Not MAJOR (code no longer enforces it),
but should be cleaned to avoid reintroducing stale
guidance.

`bash scripts/lint-spec.sh ...SPEC.md` passed: 0 errors,
0 warnings.

## R1 closure table

| R1 finding | R2 status | Evidence |
|---|---:|---|
| F1 — failure-mode specifics not in cited authority | OPEN | SPEC §9 still carries unsupported hook-suite / v2.0 specifics and single-facet framing; IDEA repeats strict 1:1 wording. |
| F2 — helper accepts bare anchors | CLOSED | Facet helper requires label + intent-role / bucket / hybrid pair. |

tokens used: 132,327
