# Codex cross-family review — Chapter 03 prose

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only content-quality review
Date: 2026-05-22
Target: `longread/03-phase-2-parameterization-surface.md`
(582 prose words at initial verify; 595 post-Amendment 1)

## Verdict

NEEDS-REVISION — 0 BLOCKER, 2 MAJOR.

Mechanical checks pass, prose compact without padding.
Two provenance issues remained.

## MAJOR findings

### Finding 1 — Symphony single-file claim not supported by cited corpus entry
Severity: MAJOR
Citation: `longread/03-phase-2-parameterization-surface.md:26-35`,
`research/primary-sources/symphony-spec.md:43-96`,
`...:123-149`

Chapter said `symphony-spec.md §3` shows a repo-owned
`WORKFLOW.md` schema where adopter deferred configuration
lives in one deterministic file. The Symphony corpus entry
§3 supports the 18-section SPEC, conformance profiles, DoD,
and a repo-owned workflow-contract pattern — but NOT the
specific single-file parameterization surface attributed
to it. That single-file framing is in the research workpad
§6; §6.4 requires methodology primitives to cite corpus
entries, not workpad summary alone.

Recommendation: add/repair corpus authority for the
Symphony WORKFLOW.md claim OR narrow chapter to say
workpad names Symphony as single-file pattern while the
corpus entry supports only the broader workflow-contract
shape.

### Finding 2 — Failure note E1 imports unsupported motive
Severity: MAJOR
Citation: `longread/03-phase-2-parameterization-surface.md:69-73`,
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:302-307`,
`...:364-366`

E1 correctly names workpad §6 two shapes + workpad §7
BES-distributed. But the added sentence "The clean
single-file shape that the methodology might have hoped
for was not the shape that fit" is not workpad-grounded.
Imports motive/preference into E1.

Per T-04 lesson, E1 and E2 should stay workpad-grounded
and E3 carry tagged synthesis. Delete the sentence or
move idea into E3 with `judgment://agent-synthesis`.

## Checks (R1)

- `validate-longread-structure.sh --chapter 03` → PASS
- `check-chapter-03-phase-2-anchors.sh` → PASS
- `check-chapter-03-failure-note.sh` → PASS
- `lint-spec.sh ...SPEC.md` → PASS

## R1 remediation summary (post-fix, 2026-05-22)

- F1 CLOSED: Symphony claim narrowed. Chapter now says
  "the workpad §6 names as Symphony's [single-file
  shape]" + cites symphony-spec §3 for the
  Workflow-Specification-as-section-5 claim only.
- F2 CLOSED: "hoped for single-file" sentence removed
  from E1. E1 stays workpad-grounded.

Chapter post-fix: 595 prose words (was 582 at initial
verify; +13 from narrowing rewrite). All mechanical
checks remain PASS.

tokens used: 131,375
