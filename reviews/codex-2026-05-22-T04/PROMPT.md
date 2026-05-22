# Cross-family review — T-04 chapter 03 Phase 2 parameterization surface Task SPEC

R1 cross-family review.

## Convergence history (compounding lessons applied upfront)

- T-01 (chapter 00): SPEC 5 rounds, prose 2 rounds. Closed.
- T-02 (chapter 01): SPEC 2 rounds, prose 2 rounds. Closed.
- T-03 (chapter 02): SPEC 4 rounds (2→1→1→0), prose 2 rounds
  (1→0). Closed. Note: R2/R3 chased adjacent-text stale
  example names in prohibition wording — generic-ized in R3.

Author has applied lessons upfront to T-04:
- ideated_in, requires_network, repo-root paths
- AC↔T parity (14↔14)
- mechanically-runnable T-evidence
- §6.5 three-element failure-mode rule with helper
- §6.6 attribution posture (correct read this time)
- chapter-strict mode in acceptance_commands
- soft-floors regime applied (target advisory, max
  enforced)
- explicit "no over-attribution beyond cited authority"
  constraint per T-03 chapter 02 prose R1 finding 1
- `< /dev/null` reminder for future codex dispatches
- Prohibition wording is generic, not example-listing

## Target

- `file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`
- `file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/IDEA.md`
- `file://scripts/check-chapter-03-phase-2-anchors.sh`
- `file://scripts/check-chapter-03-failure-note.sh`

## Context

- Longread Contract:
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution); §6.2 + §8.2 + §9.2 amended 2026-05-21
  soft-floors.
- Parent Decision §7 + §14.0 soft-floors:
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
- Research workpad §6 Phase 2 + §7 Phase 2 BES:
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.

## R1 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

Scan specifically:
1. T-01..T-03 lessons carry-through? Any regression from
   what was hard-won?
2. Helper-script quality (paired anchors actually narrow
   enough; no false-pass on bare keywords)?
3. Chapter 03 scope-vs-target — does §8/§9/§13
   constrain the author to Phase 2 substance (deferral
   concept + two shapes + BES distributed + failure
   note)?
4. Over-attribution risk specifically called out per
   T-03 chapter 02 prose R1 — does the SPEC actually
   prevent it, or only nominally?
5. Soft-floors regime applied?
6. Approval-readiness?

## Output

`reviews/codex-2026-05-22-T04/REVIEW.md` (read-only;
emit to stdout if cannot write).

CONVERGENCE-PASS if genuinely ready.
