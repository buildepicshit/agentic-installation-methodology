# Cross-family review R2 — T-02 chapter 01 Phase 0 Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing R2 after R1 remediation.

## R1 verdict was NEEDS-REVISION

R1 at `file://reviews/codex-2026-05-21-T02/REVIEW.md`:
0 BLOCKER, 4 MAJOR.

## R1 remediation landed

- **F1** (citation reachability): glob/brace patterns in
  `file://` cites replaced with concrete per-file cites
  in §7 + §10.
- **F2** (helper too weak): helper script rewritten with
  paired-anchor rule per signal. S3 needs `load-bearing`
  AND `implementation accident`; S4 needs `conformance
  bar` AND `acceptance commands`; etc.
- **F3** (§6.5 three-element structure): §8 + §9 + T-14
  rewritten to require three-element structure
  (what happened / what we did / what pattern
  generalizes) + end-of-chapter placement. New helper
  `scripts/check-chapter-01-failure-note.sh` enforces
  both.
- **F4** (§6.6 misread): §12 reversed — Task MAY cite
  internal BES SPEC IDs + transcript IDs per Contract
  §6.6.

## R2 target

- `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
- `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/IDEA.md`
- `file://scripts/check-chapter-01-phase-0-signals.sh`
- `file://scripts/check-chapter-01-failure-note.sh`

## R2 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

Scan specifically:
1. **R1 carry-through**: did each of F1-F4 close cleanly?
2. **New issues from remediation**: paired-anchor rule
   too strict (false negatives)? Failure-note helper
   awk extraction robust? §12 reversal introduced new
   risk?
3. **Whole-flow coherence**: SPEC + IDEA + 2 helpers
   read as a unit. Any remaining semantic gaps?
4. **Approval-readiness**: is T-02 SPEC now ready for
   owner approval? If yes, say so explicitly.

## Output

Single review at
`reviews/codex-2026-05-21-T02-r2/REVIEW.md` (read-only
sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory,
R1 closure table.

Honest. CONVERGENCE-PASS is fine if genuinely ready.
