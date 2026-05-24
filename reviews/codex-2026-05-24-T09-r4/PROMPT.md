# R4 — T-09 chapter 08 Phase 7 failure modes Task SPEC

R3 returned 1 MAJOR (R2 F1 still not cleanly closed —
helper accepted one combined `### Cross-phase modes`
subsection satisfying all four anchors). Now
addressed.

## R3 finding and remediation

### R3 F1 — combined subsection passed all four anchors

R3 finding: the previous F2 helper checked, per anchor,
whether any `### …` block contained that anchor word
PLUS the three §6.5 bold markers. A single combined
subsection `### Cross-phase modes` listing all four
anchors and one marker triplet passed all four
iterations. The "each mode owns its subsection" claim
was therefore unenforced.

Remediation: helper F2 block rewritten to a stronger
contract:
  (a) the anchor MUST appear in the `### …` HEADING
      LINE itself, not anywhere in the subsection
      body;
  (b) the subsection body (until next `### `, `## `,
      or EOF) MUST contain all three §6.5 bold
      markers;
  (c) each anchor claims one DISTINCT heading; a
      heading already claimed by a prior anchor is
      skipped.

Self-test results (three synthetic fixtures, run
against the exact AWK block from the helper):
- Combined: `### Cross-phase modes` listing all four
  anchors + one triplet → FAIL on all four anchors
  (correct).
- Distributed: four `### …` subsections each named
  for one anchor with its own triplet → PASS.
- Three-only: `### Fastpath`, `### Decomposition`,
  `### Workpad bootstrap` each with triplets, ceremony
  refactor absent → FAIL on ceremony refactor.

SPEC updates:
- §8 Desired Behavior: each mode MUST own a DISTINCT
  `### …` subsection whose heading-line mentions the
  anchor; markers MUST live in that subsection's
  body; combined subsections / detached markers /
  subsection reuse are all non-conformant.
- §9 §3 Domain Model: spells out the per-mode
  subsection contract, includes suggested heading
  titles (`### Fastpath zero-adoption` etc.) so the
  chapter author has a concrete target.
- §13 T-9: updated F2 row description.
- §13 T-14: updated to describe distinct-heading +
  anchor-in-heading-line + triplet-in-body
  enforcement; cites the R2 F1 and R3 F1 lessons.
- §14 AC-14: mirrors T-14 strengthening.

## Target

`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/IDEA.md`
`file://scripts/check-chapter-08-phase-7-anchors.sh`
`file://scripts/check-chapter-08-closing.sh`

## R4 mandate

MAJOR-or-higher. CONVERGENCE-PASS if R3 F1 cleanly
closed with no new defects.

Output: `reviews/codex-2026-05-24-T09-r4/REVIEW.md`
(read-only sandbox; emit to stdout if cannot write).
