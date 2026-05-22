---
id: longread-chapter-02-phase-1-facet-inventory
spec_id: 2026-05-22-longread-chapter-02-phase-1-facet-inventory
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-22
implies_spec_type: task
---

# IDEA — Longread chapter 02 — Phase 1 Facet Inventory

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 02 as the
Phase 1 chapter: "Classifying every artefact by facet."
Chapter 01 covered the Phase 0 maturity check (when a
product is ready to publish). Chapter 02 picks up after
the maturity bar is satisfied: how do you classify every
artefact in the product by its intent role? The methodology
research workpad at
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 (Phase 1) names seven facets and the hybrid-artefact
shape; §7 records the BES case-study disposition
(generalizable / mixed / studio-specific buckets).

## 2. Substance Citations

- `file://research/primary-sources/arc42.md` §3 —
  architecture documentation by viewpoints; the prior-art
  framing for facet-driven documentation.
- `file://research/primary-sources/c4-model.md` §3 — per-
  level decomposition (system → container → component →
  code) as a complementary multi-perspective pattern.
- `file://research/primary-sources/diataxis.md` §3 —
  four-type documentation classification (tutorial / how-
  to / reference / explanation); a parallel "classify by
  intent role" pattern from a different domain.
- `file://research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 — reference architecture vs solution architecture
  ownership split; relevant for the generalizable / mixed
  / studio-specific bucket distinction.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 1 definition: seven facets + hybrid output) +
  §7 (BES Phase 1 case-study data).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6.

## 3. Constraints & Non-Negotiables

- Target 1 000 words (advisory per the 2026-05-21
  soft-floors amendment); maximum 1 300 words (enforced)
  per `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: every methodology primitive in chapter 02 (the
  facet concept, the seven facets, the hybrid-artefact
  output, the generalizable / mixed / studio-specific
  buckets) MUST cite a corpus entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: chapter 02 includes a Phase 1 failure-mode note
  in the three-element structure (what happened / what
  we did / what pattern generalizes).
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 03 (Phase 2 parameterization
  surface) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- No padding-for-budget (soft-floors regime; T-02
  Amendment 2 lesson at
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  §17.5).

## 4. Approaches Considered

### Approach A: Enumerate the seven facets as a clean list
Present facets 1-7 with definitions; cite arc42 / c4-model
once each.
Fit: violates §6.3 first-person voice contract; reads as
spec, not narrative.
Verdict: REJECTED.

### Approach B: Narrative around BES's actual classification work
Open with the act of classifying Product A — what was
clearly one-facet, what was hybrid, what surprised us.
Surface the seven facets through the classification
experience. Close with the Phase 1 failure mode (hybrid-
artefact tension between strict classification and
honest categorization).
Fit: aligns with §6.3 first-person voice + §6.5 per-
chapter failure-mode rule + the parent Decision's case-
study density requirement.
Verdict: SELECTED.

### Approach C: arc42 / C4 / Diataxis comparative review
Compare three prior-art facet/viewpoint systems; show
where the methodology lands.
Fit: drifts toward third-person methodology-vendor
register; under-uses the BES case study.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Five-section structure (target ~1 000 words):

1. **What classification is for** (~120 w). Why bother
   classifying artefacts by facet at all — it's the
   precondition for the Phase 2 deferral contract.
   Anchor: arc42 viewpoints; ref-arch-vs-solution-arch.
2. **The seven facets** (~250 w). Architecture,
   Deployment, Behavior, Customization, Decisions,
   Operations, Non-goals. Each named with the one-
   sentence intent role from the research workpad.
3. **What we found when we classified Product A** (~300
   w). The generalizable / mixed / studio-specific
   bucket split per research workpad §7. The hybrid-
   output reality per research §6 (one artefact often
   serves multiple facets). No specific named artefacts
   beyond what the workpad authority supports.
4. **Phase 1 failure-mode note** (~150 w; penultimate
   per §6.5). What happened (classifying produced
   hybrid output — many artefacts did not fit cleanly
   into one facet; the workpad calls this out as the
   per-artefact classification reality); what we did
   (accepted hybrid as the output shape; ranked facet
   primacy per artefact); what generalizes
   (`judgment://agent-synthesis`: categorize honestly
   even when honesty means hybrid).
5. **Forward pointer** (~50 w).

Citation discipline:
- Methodology primitives (facet concept; the seven
  facets; hybrid output; generalizable/mixed/studio-
  specific) MUST cite corpus only.
- Parent Decision / Contract / research-workpad cites
  for Product B shape + phase taxonomy.
- BES-experiential statements MAY cite internal SPEC
  IDs + owner transcripts (per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.6).

## 6. Open Questions for Owner

- [ ] Q1: How concretely should the BES Phase 1
      classification examples be named? Default per R1
      F1 + R2 F1 + R3 closure: stay within cited
      research-workpad authority. The workpad supports
      the seven facets + hybrid-output reality + the
      generalizable/mixed/studio-specific bucket split,
      but does NOT name specific artefacts. The chapter
      does not name any specific artefacts beyond what
      the cited workpad authority supports. A future
      amendment that adds a citable source may permit
      the corresponding example. Not owner-blocking.
- [ ] Q2: Should the seven facets be presented as a
      labelled list within prose, or as a short table?
      Default: labelled list within prose (matches
      chapter 01 anti-signal labelling style; preserves
      first-person voice). Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce posture
(`owner://transcript-2026-05-18`) + the honest-experience
contract from chapter 00 + the no-padding-for-budget
directive (`owner://transcript-2026-05-21`) carry over.
No new owner judgments required for Approach B.
