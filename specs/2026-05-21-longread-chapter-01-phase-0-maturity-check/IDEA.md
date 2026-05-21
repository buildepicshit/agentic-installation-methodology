---
id: longread-chapter-01-phase-0-maturity-check
spec_id: 2026-05-21-longread-chapter-01-phase-0-maturity-check
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-21
implies_spec_type: task
---

# IDEA — Longread chapter 01 — Phase 0 Maturity Check

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md` (status:
in-execution) §6.1 names chapter 01 as the Phase 0 chapter:
"When a product is ready to be published as a deployment-
grade SPEC." Chapter 00 introduced the methodology and set
the reader contract. Chapter 01 is the first phase chapter
the reader hits and must convey the maturity-check
substance: four positive signals + three anti-signals,
sourced from
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 (Phase 0 definition). It must include a per-chapter
Phase 0 failure-mode note per longread Contract §6.5
(chapter 00 was exempt; chapters 01-07 are not).

## 2. Substance Citations

- `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 — the "incident response becomes archaeology" failure
  mode anchors why a maturity bar matters at all.
- `file://research/primary-sources/spec-kit.md` §3 — the
  spec-as-deployment-grade framing.
- `file://research/primary-sources/openspec.md` §3 — the
  conformance-bar framing (acceptance commands the
  developer trusts).
- `file://research/primary-sources/arc42.md` §3 —
  architecture-maturity signal patterns.
- `file://research/primary-sources/adr-nygard.md` §3 — the
  "load-bearing decisions vs implementation accidents"
  distinction (Nygard's "architecturally-significant
  decision" criterion).
- `file://research/primary-sources/kiro.md` §3 — agent-
  installable spec maturity criteria.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 0 definition) + §7 (BES case-study data).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5.

## 3. Constraints & Non-Negotiables

- Target 800 words; maximum 1 100 words per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.2.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.4:
  every methodology primitive in chapter 01 (the maturity
  bar, the four signals, the three anti-signals, the
  load-bearing-decisions distinction, the conformance-bar
  concept) MUST cite a corpus entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.5:
  chapter 01 includes a Phase 0 failure-mode note
  disclosing where BES failed its own maturity check.
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 02 (Phase 1 facet inventory)
  per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §8.1.

## 4. Approaches Considered

### Approach A: Bullet-list maturity criteria
Present the four signals + three anti-signals as bullet
lists. Crisp, machine-readable.
Fit: violates the first-person experiential voice
contract; reads as checklist not narrative.
Verdict: REJECTED.

### Approach B: Narrative around the BES Phase 0 failure
Open with our Phase 0 failure (publishing Product A v1
before we had a conformance bar), then surface the four
signals as what we learned to ask before publishing, and
the three anti-signals as what we missed.
Fit: aligns with §6.3 first-person experiential voice +
§6.5 per-chapter failure-mode rule; turns the methodology
primitives into experiential primitives.
Verdict: SELECTED.

### Approach C: Pure-methodology phase exposition
Define Phase 0 abstractly first; cite BES experience as
illustration after.
Fit: drifts toward methodology-vendor register; weakens
the case-study density parent Decision §7 requires.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Five-section structure: (1) The BES Phase 0
failure (~150 w); (2) The maturity question (~120 w); (3)
The four signals we learned to require (~250 w); (4) The
three anti-signals (~150 w); (5) Failure mode + forward
pointer (~130 w).

Citation discipline (matches Task SPEC T-5 and chapter
00):
- Methodology primitives (maturity bar concept; the four
  signals; the three anti-signals; load-bearing-vs-
  accidents distinction; conformance-bar concept) MUST
  cite `research/primary-sources/<slug>.md §3` only.
- Product B shape / phase taxonomy / open-question
  enumeration MAY cite parent Decision / Contract /
  research workpad.
- BES-experiential statements MAY cite owner transcripts
  + internal SPEC artefacts.

## 6. Open Questions for Owner

- [ ] Q1: How specific should the BES Phase 0 failure
      disclosure be? Default: name the failure
      (Product A v1 published without a conformance
      bar), don't name internal SPEC IDs. Not
      owner-blocking; adjustable.
- [ ] Q2: Should the four signals be enumerated as
      narrative paragraphs or as a labelled list within
      prose? Default: labelled list within prose, to
      preserve first-person voice while keeping the four
      signals scannable. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce posture
(`owner://transcript-2026-05-18`) + the failure-modes-
first-class commitment from chapter 00 carry over.
Chapter 01 operationalises both by leading with the BES
failure rather than the methodology primitives. No
additional owner judgments required for Approach B.
