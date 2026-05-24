# R3 — T-09 chapter 08 Phase 7 failure modes Task SPEC

R2 returned 1 MAJOR (F1 not cleanly closed); now
addressed.

## R2 finding and remediation

### R2 F1 — global marker counts decoupled from per-mode disclosure

R2 finding: the F2 row counted bold-marker occurrences
globally (≥ 4 each), allowing a chapter to list the
four cross-phase mode anchors once each while placing
the §6.5 marker triplets in unrelated parts of the
chapter. T-14/AC-14 claimed mechanical per-mode
enforcement; the helper did not deliver that.

Remediation:
- Anchors helper F2 block rewritten: for each of the
  four failure-mode anchors (fastpath, decomposition,
  workpad bootstrap, ceremony refactor) the helper now
  requires a level-3 markdown subsection (`### …`) that
  contains BOTH the anchor word AND all three §6.5
  bold markers (`**What happened.**`,
  `**What we did.**`, `**What pattern generalizes.**`).
  The subsection bound is structural, not a fragile
  line-count window.
- Self-test: PASS on a synthetic chapter where each
  mode owns its own `### …` subsection with all three
  markers; FAIL on a synthetic chapter where the modes
  are listed once but markers live in an unrelated
  subsection.
- SPEC §8 Desired Behavior: now requires each mode to
  be its own `### …` subsection.
- SPEC §9 §3 Domain Model: now mandates per-mode `###
  …` subsections containing anchor + all three §6.5
  markers; cataloguing by name or detached markers is
  non-conformant.
- SPEC §13 T-9 and T-14: updated to describe the F2
  structural binding (was "marker counts ≥ 4").
- SPEC §14 AC-14: updated to mirror the per-mode `###
  …` subsection requirement.

R2 F2 (closing helper + IDEA conflict) remained closed
across R2; no changes in R3.

## Target

`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/IDEA.md`
`file://scripts/check-chapter-08-phase-7-anchors.sh`
`file://scripts/check-chapter-08-closing.sh`

## R3 mandate

MAJOR-or-higher. CONVERGENCE-PASS if R2 F1 closed
cleanly with no new defects.

Output: `reviews/codex-2026-05-24-T09-r3/REVIEW.md`
(read-only sandbox; emit to stdout if cannot write).
