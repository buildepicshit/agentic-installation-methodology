# Cross-family review R2 — T-06 chapter 05 Task SPEC

R2 after R1 remediation.

## R1 was NEEDS-REVISION (0 BLOCKER, 2 MAJOR)

R1 at `file://reviews/codex-2026-05-23-T06/REVIEW.md`:
- F1: SPEC claimed chapters 02+04 established 8 facets;
  chapter 02 actually establishes 7 per workpad §6.
- F2: helper accepts bare keywords (yaml, gherkin, etc.)
  instead of actual corpus file paths.

## R1 remediation landed

- **F1**: §5 Current System Facts + §8 Desired Behavior
  rewritten — chapter 02 established the seven facets
  per workpad §6 Phase 1; SPEC explicitly forbids
  claiming chapters 02+04 established eight; any facet
  count beyond seven must cite separate authority.
- **F2**: helper anchors-shape rows require actual
  corpus file paths (research/primary-sources/<slug>.md)
  to co-occur with concept anchors. Verified: bare-
  keyword chapter FAILs all 5 shape/manifest rows;
  corpus-path chapter PASSes.

## R2 target

`file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
`file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/IDEA.md`
`file://scripts/check-chapter-05-phase-4-anchors.sh`
`file://scripts/check-chapter-05-failure-note.sh`

## R2 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

1. R1 F1 + F2 closed?
2. New issues from rewrite (helper too strict for
   natural prose?)?
3. Approval-readiness?

## Output

`reviews/codex-2026-05-23-T06-r2/REVIEW.md` (read-only;
emit to stdout if cannot write).

CONVERGENCE-PASS if genuinely ready.
