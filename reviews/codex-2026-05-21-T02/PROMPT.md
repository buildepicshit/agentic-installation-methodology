# Cross-family review — T-02 chapter 01 Phase 0 maturity check Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing a BLOCKING cross-family
spec-review on a Task SPEC. T-01 (chapter 00) already
converged: 5 SPEC-level rounds + 2 prose rounds, all closed.
The author has applied all T-01 R1-R5 lessons upfront to
T-02 (ideated_in, requires_network, repo-root paths,
chapter-strict mode, AC↔T parity, mechanically-runnable
T-evidence, corpus-citation discipline strictness, helper
script for content checks).

## Target

- `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
- `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/IDEA.md`
- `file://scripts/check-chapter-01-phase-0-signals.sh`

## Context

- Longread Contract:
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution).
- Parent Decision:
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7.
- Research workpad §6 Phase 0 + §7 BES case-study data:
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.
- Primary-source corpus: 22 sources at
  `file://research/primary-sources/` (v1.1).
- T-01 evidence:
  `file://reviews/codex-2026-05-20-T01{,-r2,-r3,-r4,-r5}/`
  + `file://reviews/codex-2026-05-20-chapter-00{,-r2}/`.

## What I want

A verdict at SEVERITY = MAJOR-or-higher.

Scan specifically:

1. **T-01 R1-R5 carry-through**: did the author actually
   apply every T-01 lesson? Path-base normalization;
   ideated_in; requires_network; mechanically-runnable
   T-evidence; AC↔T parity; corpus-citation strictness;
   chapter-strict mode in acceptance_commands?
2. **Helper script quality**: does
   `check-chapter-01-phase-0-signals.sh` actually
   implement what T-10 claims? Are the anchor sets
   broad enough to accept reasonable phrasings but
   narrow enough to fail genuinely missing signals?
3. **Chapter 01 content scope**: §8 + §9 + §13 — does
   the structural plan actually constrain the author
   to deliver Phase 0 substance (four signals + three
   anti-signals + BES failure + failure note) or does
   it leave room for under-scoping?
4. **§6.5 per-chapter failure-mode rule**: T-14
   covers it. Is the mechanical evidence (grep for
   failure-language anchors) sufficient, or could a
   chapter pass T-14 while burying the failure?
5. **§6.6 BES attribution posture**: §12 says "MUST
   NOT name internal BES SPEC identifiers." Is this
   the right reading of Contract §6.6? Or does §6.6
   permit naming specific SPECs?
6. **Coherence with T-01 closed**: chapter 00 is
   closed; does T-02 cite chapter 00 correctly + not
   re-state reader contract?

## Output

Single review at
`reviews/codex-2026-05-21-T02/REVIEW.md` (read-only
sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory.

Honest. If the SPEC is ready for owner approval as
drafted, say so. If T-01's hard-won lessons aren't
showing up here, that's the most important finding.
