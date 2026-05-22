# Cross-family review — T-03 chapter 02 Phase 1 facet inventory Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing R1 spec-review on a Task
SPEC.

## Convergence history available

- T-01 (chapter 00): 5 SPEC rounds (7→0) + 2 prose rounds
  (2→0). Status: closed.
- T-02 (chapter 01): 2 SPEC rounds (4→0) + 2 prose rounds
  (3→0+gov→0). Status: closed.

Author has applied all T-01 R1-R5 + T-02 R1 lessons
upfront to T-03 (ideated_in, requires_network, repo-root
paths, AC↔T parity, mechanically-runnable T-evidence,
§6.5 three-element failure-mode helper, §6.6 attribution
posture, chapter-strict mode, no padding-for-budget under
the 2026-05-21 soft-floors amendment).

## Target

- `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
- `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/IDEA.md`
- `file://scripts/check-chapter-02-phase-1-facets.sh`
- `file://scripts/check-chapter-02-failure-note.sh`

## Context

- Longread Contract:
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution). §6.2 + §8.2 + §9.2 amended 2026-05-21
  soft-floors (target advisory; max enforced).
- Parent Decision:
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 (also amended 2026-05-21 soft-floors).
- Research workpad §6 Phase 1 (seven facets + hybrid
  output) + §7 (BES bucket split):
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.
- T-01 + T-02 closures:
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  + `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`.

## What I want

Honest verdict at SEVERITY = MAJOR-or-higher. For each
finding emit number, severity, file:line citation,
statement, recommendation.

Scan specifically:

1. **T-01 R1-R5 + T-02 R1 carry-through**: did the
   author actually apply every lesson? Path-base
   normalization (no globs/braces); ideated_in;
   requires_network; mechanically-runnable T-evidence;
   AC↔T parity; corpus-citation strictness; §6.5
   three-element failure rule; §6.6 attribution posture;
   chapter-strict mode in acceptance_commands; no
   padding-for-budget language.
2. **Helper-script quality**: do
   `check-chapter-02-phase-1-facets.sh` +
   `check-chapter-02-failure-note.sh` implement what T-9
   + T-12 claim? Are anchor sets broad enough to accept
   reasonable phrasings but narrow enough to fail
   genuinely missing content?
3. **Chapter 02 scope-vs-target**: §8 + §9 + §13 — does
   the SPEC actually constrain the author to Phase 1
   substance (seven facets + bucket split + hybrid +
   failure note), or is there room for under-scoping?
4. **§6.5 three-element rule applied correctly?** The
   chapter-01 Task SPEC misread §6.6; verify this Task
   reads both §6.5 and §6.6 correctly.
5. **Coherence with chapters 00 + 01**: T-03 cites
   closed chapters; doesn't re-state reader contract;
   forward pointer correctly targets chapter 03.
6. **Soft-floors regime applied throughout?**:
   front-matter target as advisory; SPEC text doesn't
   treat target as a hard floor; T-3 + AC-3 language
   matches the new validator semantics.

## Output

Single review at
`reviews/codex-2026-05-22-T03/REVIEW.md` (read-only
sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory.

Honest. If the SPEC is ready for owner approval as
drafted, say so.
