---
id: longread-chapter-06-phase-5-cross-family-validation
spec_id: 2026-05-23-longread-chapter-06-phase-5-cross-family-validation
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-23
implies_spec_type: task
---

# IDEA — Longread chapter 06 — Phase 5 Cross-Family Validation

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 06 as the
Phase 5 chapter: "Validating by a different-family
agent walkthrough." Chapters 00-05 closed. Per research
workpad
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 5: have a different-family agent (Codex /
Gemini / a different Claude lane) attempt to deploy the
product as a brand-new installer using only the
published spec; surface where the spec was under-
specified; document the gap report. Per workpad §7
Phase 5: "same-family proxy performed in this session
(per SE2); strict cross-family deferred to owner-
triggered external run."

This is the chapter that addresses head-on the honest
disclosure chapter 00 made at
`file://longread/00-introduction.md` about Phase 5
being the methodology's outstanding obligation.

## 2. Substance Citations

- `file://research/primary-sources/symphony-spec.md`
  §3 — Symphony's conformance profiles + the
  "re-implement in 5 languages" pattern workpad §6
  names as analogue.
- `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 — the agent-compiled-software variance risk that
  cross-family validation is meant to mitigate.
- `file://research/primary-sources/cucumber-gherkin.md`
  §3 — Given/When/Then as the executable shape a
  validation pass exercises.
- `file://research/primary-sources/spec-kit.md` §3 —
  spec-as-deployment-grade — only sustains under
  cross-family validation.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 5 definition) + §7 (BES Phase 5
  disposition).
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 (parent Decision Phase 5 obligation; external
  cross-family pass gates publication).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6.
- `file://longread/00-introduction.md` (chapter 00
  explicitly disclosed the Phase 5 gate as still owed).
- `file://../bes-fleet-policy/agents/MODEL_ROUTING.md`
  — cross-family-review routing pattern (different
  model family for review).

## 3. Constraints & Non-Negotiables

- Target 1 000 words (advisory under soft-floors); max
  1 300 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: every methodology primitive (cross-family
  validation concept, walkthrough pattern, gap report,
  same-family-proxy-as-stopgap framing) MUST cite a
  corpus entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: three-element structure with strict fact-vs-
  synthesis separation. Phase 5 failure is the
  load-bearing failure for the whole longread — the
  deferred-cross-family-pass is the methodology's
  outstanding obligation.
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 07 (Phase 6 ship +
  cross-link + sign) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- No padding-for-budget per the soft-floors regime at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- No over-attribution to cited authority per the
  chapter 00-05 prose-codex pattern (latest at
  `file://reviews/codex-2026-05-23-chapter-05/REVIEW.md`).
- Apply the T-06 R6 explicit-authority-source-list
  block pattern (T-06 §17.5 lesson at
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`).

## 4. Approaches Considered

### Approach A: Prescriptive walkthrough procedure
Define cross-family validation as a checklist;
enumerate validation steps.
Fit: drifts toward methodology-vendor register;
violates §6.3 first-person voice; under-uses BES
case-study density.
Verdict: REJECTED.

### Approach B: Honest disclosure of the still-owed gate
Open with the question chapter 00 already disclosed:
the Phase 5 gate is the methodology's outstanding
obligation. Walk through the validation pattern per
workpad §6 (different-family agent attempts to deploy
using only published spec; gap report). Address the
BES same-family proxy honestly per workpad §7. Cite
chapter 00's prior disclosure. Close with Phase 5
failure note that names the strict-cross-family-pass
as deferred per workpad §7 (this IS the failure mode).
Fit: aligns with §6.3 + §6.4 + §6.5; honest about
the load-bearing methodology gap.
Verdict: SELECTED.

### Approach C: Same-family proxy as full Phase 5
Treat the same-family proxy performed during this
session as sufficient Phase 5 evidence.
Fit: violates the parent Decision §7 gate; chapter 00
already disclosed it isn't sufficient; would be
dishonest.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Five-section structure (target ~1 000
words under soft-floors):

1. **The cross-family validation question** (~150 w).
   Why same-family review is structurally weaker;
   what cross-family validation tests that nothing
   else does. Cite leaddev-agent-compiled §3 for the
   underlying variance risk.
2. **The walkthrough pattern** (~250 w). Per workpad
   §6: different-family agent attempts to deploy
   using ONLY published spec; surface gaps; document
   gap report. Cite symphony-spec §3 for the
   "re-implement" analogue + cucumber-gherkin §3 for
   the executable acceptance shape a walkthrough
   exercises.
3. **Where BES landed** (~250 w). Workpad §7: same-
   family proxy performed; strict cross-family
   deferred to owner-triggered external run. Chapter
   00 already disclosed this as the methodology's
   outstanding obligation. Cite parent Decision §7
   for the publication-gate binding.
4. **Phase 5 failure-mode note** (~250 w; penultimate
   per §6.5). Strict fact-vs-synthesis separation:
   - E1 workpad-grounded: workpad §7 records BES
     Phase 5 as "same-family proxy performed in this
     session (per SE2); strict cross-family deferred
     to owner-triggered external run."
   - E2 workpad-grounded: we performed the same-
     family proxy; strict cross-family is owed.
   - E3 `judgment://agent-synthesis`; NOT workpad-
     proven: same-family proxy is a stopgap, not the
     bar; the published methodology ships with this
     gate explicitly outstanding, and that is part of
     why this longread exists paired with the spec
     bundle — to disclose the gap honestly.
5. **Forward pointer** (~50 w). To chapter 07 / Phase
   6 / ship + cross-link + sign.

Citation discipline — apply T-06 R6 explicit
authority-source-list:
- Primary-source corpus: methodology primitives
  (cross-family pattern, walkthrough, executable
  acceptance).
- Workpad §6 + §7: Phase 5 definition + BES
  disposition.
- Parent Decision §7: publication-gate obligation.
- Chapter 00: prior disclosure that Phase 5 gate is
  outstanding.

## 6. Open Questions for Owner

- [ ] Q1: How explicitly should the "this is the
      load-bearing methodology gap" framing be named?
      Default per chapter 00 prior disclosure: name
      it directly in §3 (Where BES landed) and §4
      (failure note); chapter 00 has already made
      the disclosure, chapter 06 is the place to
      operationalize it. Not owner-blocking.
- [ ] Q2: Reference to MODEL_ROUTING.md.
      `file://../bes-fleet-policy/agents/MODEL_ROUTING.md`
      documents the same-family-vs-cross-family
      routing pattern that this chapter draws on.
      Default: cite it once in the §2 "why same-
      family is weaker" framing. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce posture + honest-experience contract +
no-padding-for-budget + no-over-attribution discipline
+ T-06 authority-source-list block all carry over. The
Phase 5 chapter is where the methodology owns up to
its outstanding obligation cleanly; that ownership is
the chapter's load-bearing observation.
