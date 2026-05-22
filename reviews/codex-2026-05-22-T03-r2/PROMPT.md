# Cross-family review R2 — T-03 chapter 02 facet inventory Task SPEC

R2 after R1 remediation.

## R1 was NEEDS-REVISION (0 BLOCKER, 2 MAJOR)

R1 at `file://reviews/codex-2026-05-22-T03/REVIEW.md`.

## R1 remediation landed

- **F1** (failure-mode specifics not in cited authority):
  §9 + §16 rewrote Phase 1 failure note to stay within
  the research-workpad-grounded record. "What happened"
  now anchors on the workpad's "output: often hybrid (one
  artefact serves multiple facets)" line — the workpad-
  grounded reality. Dropped "strict 1:1" / "single-facet"
  framing; replaced with "did not fit cleanly" / "multiple
  facets applied at once". §16 Q1 default updated to
  match.
- **F2** (helper accepts bare anchors): both helpers
  strengthened with paired-anchor rule. Each facet now
  requires label + intent-role term (e.g. Architecture +
  "domain model"; Operations + "observability"). Each
  bucket requires label + "bucket". Failure-note helper
  E1 anchors aligned with F1 fix. Confirmed bare-keyword
  listing now FAILs the helper.

## R2 target

`file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
`file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/IDEA.md`
`file://scripts/check-chapter-02-phase-1-facets.sh`
`file://scripts/check-chapter-02-failure-note.sh`

## R2 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

Scan specifically:
1. **R1 carry-through**: F1 + F2 closed? Any stale
   "strict 1:1" / "single-facet" wording left in §9 /
   §13 / §14 / §16?
2. **New issues from remediation**: paired anchors too
   strict (false negatives)? Phase 1 substance still
   intact?
3. **Approval-readiness**: ready for owner approval?

## Output

`reviews/codex-2026-05-22-T03-r2/REVIEW.md` (read-only;
emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory, R1
closure table.

Honest. CONVERGENCE-PASS if genuinely ready.
