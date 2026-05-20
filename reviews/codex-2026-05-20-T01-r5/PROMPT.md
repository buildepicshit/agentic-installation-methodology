# Cross-family review R5 — T-01 chapter 00 introduction Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing R5 spec-review after R4
remediation.

## R4 verdict was NEEDS-REVISION (no BLOCKERs)

R4 report at `file://reviews/codex-2026-05-20-T01-r4/REVIEW.md`
listed 1 MAJOR:

- T-11 helper used `grep -c -F` (counts lines, not literal
  occurrences) and did not check §6.1 phase titles.

## R4 remediation landed

- Helper script now uses
  `grep -o -F "$phase" | wc -l` (occurrence count, not
  line count). Verified: triple `Phase 0` on one line is
  correctly counted as 3 and rejected.
- T-11 SPEC text split into two pass criteria:
  - **Mechanical (narrow)**: helper script enforces
    literal occurrence count [1,2], ascending order,
    1500-char window. Phase TITLES are NOT enforced by
    the helper.
  - **Manual reviewer**: §6.1 phase title coverage is
    a reviewer-judgment criterion; T-11 prose says so
    explicitly.

## R5 review target

- `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
- `file://specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`
- `file://specs/2026-05-20-longread-structure/SPEC.md`
- `file://scripts/validate-longread-structure.sh`
- `file://scripts/check-chapter-00-phase-roadmap.sh`

## R5 mandate

Honest verdict at SEVERITY = MAJOR-or-higher. For each
finding emit number, severity, file:line, statement,
recommendation.

Specifically:

1. **R4 carry-through**: did R4 Finding 1 close cleanly,
   or are there residual stale references?
2. **Whole-flow coherence**: read Task SPEC + IDEA +
   Contract + both scripts as a unit. Any remaining
   semantic gaps?
3. **Approval-readiness**: is this Task SPEC now ready
   for owner approval as drafted? If yes, say so
   explicitly. If not, list the specific gaps that
   remain.

## Output

Single review at
`reviews/codex-2026-05-20-T01-r5/REVIEW.md` (read-only
sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER findings, MAJOR findings,
MINOR findings, Advisory, R4 closure table,
Approval-readiness statement.

Be honest. Convergence-PASS verdict is fine if the SPEC
is genuinely ready. Don't manufacture findings.
