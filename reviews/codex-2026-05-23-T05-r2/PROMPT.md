# Cross-family review R2 — T-05 chapter 04 Task SPEC

R2 after R1 remediation. R1 was 0 BLOCKER, 2 MAJOR.

## R1 remediation landed

- **F1** (IDEA cited non-existent repo-local parent
  Decision path): IDEA §2 fixed — now cites
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
- **F2** (asymmetry helper too loose): rewrote the
  asymmetry check to require BOTH sides in the same
  paragraph — Product A + sanitization/drop-ALL AND
  Product B + case-study/named/full-transparency.
  Verified: loose-asymmetry chapter FAILs; full-
  asymmetry paragraph PASSes.

## R2 target

`file://specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`
`file://specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/IDEA.md`
`file://scripts/check-chapter-04-phase-3-anchors.sh`
`file://scripts/check-chapter-04-failure-note.sh`

## R2 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

1. R1 F1 + F2 closed?
2. New issues from rewrite (helper too strict; false
   negatives)?
3. Approval-readiness?

## Output

`reviews/codex-2026-05-23-T05-r2/REVIEW.md` (read-only;
emit to stdout if cannot write).

CONVERGENCE-PASS if genuinely ready.
