# Cross-family review R4 — T-01 chapter 00 introduction Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing R4 spec-review after R3
remediation.

## R3 verdict was NEEDS-REVISION

R3 report at `file://reviews/codex-2026-05-20-T01-r3/REVIEW.md`
listed 1 BLOCKER + 3 MAJOR.

## R3 remediation landed

- **R3 Finding 1 (BLOCKER)**: longread Contract §13 AC-4 +
  §14 DoD-3 + §15 AC-4 amended to qualify "all 9 chapter
  files exist" as release-time only; this Contract's
  verification accepts deferred chapters per §8.2.
- **R3 Finding 2 (MAJOR)**: validator gained
  `--chapter NN` chapter-strict mode that enforces
  `[§6.2-target, §6.2-max]` for one chapter, ignoring
  others. T-01 acceptance_commands now include
  `bash scripts/validate-longread-structure.sh --chapter 00`.
  Contract §8.2 amended to declare the three-mode design.
- **R3 Finding 3 (MAJOR)**:
  - T-11: helper script
    `file://scripts/check-chapter-00-phase-roadmap.sh`
    authored. Tested: PASS on ascending Phase 0..7 in
    one paragraph; FAIL on shuffled order. Acceptance
    command added.
  - T-12: evidence rewritten to use `grep -iqE` with
    alternation matching all stated OR-anchors;
    chained with `&&` so any missing anchor exits non-
    zero.
- **R3 Finding 4 (MAJOR)**: Contract path bases
  normalized (`../../../` → `../`; `../../` → repo-
  root); Contract + IDEA `<slug>.md` placeholders
  demoted from `file://` to bare path.

## R4 review target

- `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
- `file://specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  (the amended Contract)
- `file://scripts/validate-longread-structure.sh`
  (3-mode validator)
- `file://scripts/check-chapter-00-phase-roadmap.sh`
  (new helper)

## R4 mandate

Honest verdict at SEVERITY = MAJOR-or-higher. For each
finding emit number, severity, file:line, statement,
recommendation.

Specifically scan for:

1. **R3 carry-through**: did every R3 finding actually
   close, or are there residual stale references in
   adjacent sections?
2. **New issues introduced by R3 remediation**: does
   the helper script implement what T-11 claims? Does
   the validator's `--chapter` arg-parsing handle edge
   cases? Does Contract §8.2 still match the validator
   after the third-mode amendment?
3. **Acceptance-command runnability under amendments**:
   when chapter 00 is well-authored, do the 5
   acceptance commands pass cleanly? When chapter 00
   is malformed, does each command surface its specific
   failure mode?
4. **Whole-flow coherence**: read Task SPEC + IDEA +
   Contract as a unit. Are there any remaining
   semantic gaps between them?

## Output

Single review at
`reviews/codex-2026-05-20-T01-r4/REVIEW.md` (read-only
sandbox; emit to stdout if you cannot write).

Structure: Verdict, BLOCKER findings, MAJOR findings,
MINOR findings, Advisory, R3 closure table.

Honest. If ready for owner approval, say so.
