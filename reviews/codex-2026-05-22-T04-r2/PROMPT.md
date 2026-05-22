# Cross-family review R2 — T-04 chapter 03 Task SPEC

R2 after R1 remediation. R1 was 0 BLOCKER, 2 MAJOR.

## R1 remediation landed

- **F1** (unsupported causality in failure note): §9 + IDEA
  §5 rewritten with strict fact-vs-synthesis separation.
  "What happened" + "What we did" now state only what
  workpad §6 + §7 directly support. "What generalizes" is
  marked `judgment://agent-synthesis` explicitly and tagged
  as NOT workpad-proven.
- **F2** (helpers allow broad keyword false-passes):
  - anchors helper rewritten to require paragraph-level
    co-occurrence (anchor-a + anchor-b in SAME paragraph,
    not scattered globally). Verified: scattered-keyword
    chapter FAILs; co-occurring chapter PASSes.
  - failure-note helper rewritten to require explicit bold
    markers (**What happened.** / **What we did.** /
    **What pattern generalizes.**) plus
    `judgment://agent-synthesis` tag in E3. Verified: vague
    section without markers FAILs.

## R2 target

`file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`
`file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/IDEA.md`
`file://scripts/check-chapter-03-phase-2-anchors.sh`
`file://scripts/check-chapter-03-failure-note.sh`

## R2 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

1. R1 F1 + F2 closed?
2. New issues from rewrite (helpers too strict, fact-vs-
   synthesis separation introduces new gap)?
3. Approval-readiness?

## Output

`reviews/codex-2026-05-22-T04-r2/REVIEW.md` (read-only;
emit to stdout if cannot write).

CONVERGENCE-PASS if genuinely ready.
