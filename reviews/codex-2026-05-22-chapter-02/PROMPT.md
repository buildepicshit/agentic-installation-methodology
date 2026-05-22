# Cross-family review — Chapter 02 prose

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing content-quality review on
chapter 02 of the methodology longread. T-03 SPEC converged
at R4 (4 rounds, 2→1→1→0); this pass is on the PROSE.

## Target

`file://longread/02-phase-1-facet-inventory.md` (668 prose
words).

## Context

- T-03 SPEC at
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
  (status: verified).
- Longread Contract:
  `file://specs/2026-05-20-longread-structure/SPEC.md` —
  §6.3 voice; §6.4 corpus-citation; §6.5 three-element
  failure rule; §6.6 attribution posture. §6.2 amended
  2026-05-21 soft-floors (target advisory; max enforced).
- Chapters 00 + 01 (closed) at `file://longread/00-introduction.md`
  + `file://longread/01-phase-0-maturity-check.md`.
- Research workpad §6 Phase 1 + §7 Phase 1 case-study data
  at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.
- Corpus entries arc42 §3, c4-model §3 at
  `file://research/primary-sources/arc42.md` +
  `file://research/primary-sources/c4-model.md`.

## What I want

Content-quality verdict at SEVERITY = MAJOR-or-higher.

Scan specifically:
1. **Truthfulness against corpus**: does the chapter's
   use of arc42 + c4-model match what those entries §3
   actually say? Any claim about the seven facets that
   the research workpad does not support?
2. **Citation discipline against Contract §6.4**: are
   methodology primitives (facet concept; seven facets;
   hybrid output; bucket split) cited correctly? Parent
   Decision / Contract / research-workpad cites used
   only for shape / taxonomy?
3. **Voice contract against §6.3**: first-person
   experiential? Passive voice for studio actions? Any
   methodology-vendor register slipping in?
4. **Failure note quality against §6.5**: three-element
   structure honest? "What we did" specific enough to
   be checkable? "What generalizes" anchored or vague?
5. **Phase 1 substance**: do the seven facet definitions
   match the workpad? Does the bucket split match
   research §7?
6. **Length under soft-floors**: 668 words against
   advisory target 1 000. Is the chapter too thin (was
   substance dropped that should have been kept), or
   appropriately compact (says what needs saying)?
7. **Forward pointer**: matches chapter 03's actual
   subject?

Lessons from chapter 00/01 prose reviews to avoid: (a)
overclaim about what BES has achieved; (b) wrong-anchor
citations (e.g. citing X for Y when X doesn't support Y);
(c) failure note blurring distinct failures.

## Output

`reviews/codex-2026-05-22-chapter-02/REVIEW.md` (read-
only sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory,
Truthfulness table.

Honest. CONVERGENCE-PASS if genuinely ready.
