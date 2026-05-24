---
id: longread-chapter-08-phase-7-failure-modes
spec_id: 2026-05-24-longread-chapter-08-phase-7-failure-modes
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-24
implies_spec_type: task
---

# IDEA — Longread chapter 08 — Phase 7 Failure Modes as First-Class Content

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

Chapter 08 is the final chapter — the synthesis chapter
where Phase 7's novel methodology primitive (failure
modes as first-class content) gets the full treatment.
Per longread Contract
`file://specs/2026-05-20-longread-structure/SPEC.md`
§6.1 chapter title: "Failure modes; open research
questions; the honest posture." Per §6.2 target 1 500
/ max 2 000 (largest chapter budget). Per Contract
§6.5: "Chapter 08 synthesises the cross-phase failure
modes catalogued in the research workpad — fastpath
zero-adoption, decomposition-phase paper-only across
23 SPECs, workpad bootstrap gap, the four owner-
blocking ceremony refactor questions — and the per-
chapter failure notes from chapters 01-07. Chapter 08
also synthesises ... the seven open research questions
per §6.6 (now mandatory in AC-9)." This is the
methodology's most explicit honest-disclosure chapter.

## 2. Substance Citations

- `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 — risk framing that motivates failure-modes-as-
  content (revisits chapter 00's epigraph anchor).
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 7 (definition) + §7 (four+ BES failure
  modes) + §2.3 (seven open research questions).
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 (parent Decision: all four+ failure modes MUST be
  published; all seven open research questions MUST be
  published as flagged-open).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6 / §8.1.
- Per-chapter failure notes from chapters 01-07 at
  `file://longread/01-phase-0-maturity-check.md`,
  `file://longread/02-phase-1-facet-inventory.md`,
  `file://longread/03-phase-2-parameterization-surface.md`,
  `file://longread/04-phase-3-sanitization-bar.md`,
  `file://longread/05-phase-4-manifest-catalog-compose.md`,
  `file://longread/06-phase-5-cross-family-validation.md`,
  `file://longread/07-phase-6-ship.md`.
- Internal BES audit SPECs cited per Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.6 (BES attribution permits internal SPEC IDs in
  failure-mode disclosure).

## 3. Constraints & Non-Negotiables

- Target 1 500 words (advisory under soft-floors); max
  2 000 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 — largest chapter budget.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4.
- Chapter 08 carries the synthesis per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: per-chapter failure notes from chapters 01-07
  synthesised; cross-phase failure modes catalogued;
  seven open research questions enumerated as flagged-
  open.
- Forward pointer per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1: the chapter's final non-blank paragraph is the
  exact literal `**In the next chapter**: This is the
  last chapter. The seven open research questions
  follow.` — same `**In the next chapter**:` label as
  every other chapter, with body text declaring this is
  the last chapter. No prose follows the line.
- No padding-for-budget per the soft-floors regime at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- No over-attribution per the chapter 00-07 prose-
  codex pattern (latest at
  `file://reviews/codex-2026-05-24-chapter-07-r2/REVIEW.md`).
- Apply the T-06 R6 explicit-authority-source-list
  block pattern at
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  §17.5 in §6 from start; §6 stays as Authority Map
  slot per T-07 lesson at
  `file://specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`
  §17.5; helper docstring count matches implemented
  rows per T-08 R1 F1 lesson at
  `file://reviews/codex-2026-05-24-T08/REVIEW.md`.
- E2 stays workpad/Decision-grounded; synthesis stays
  tagged judgment://agent-synthesis per chapter 02-07
  recurring class.

## 4. Approaches Considered

### Approach A: Pure summary of prior chapters
Restate each chapter 01-07's failure note as a bullet.
Fit: doesn't add the cross-phase failure modes or open
research questions; violates Contract §6.5 mandatory
content; under-uses parent Decision §7's "failure modes
as first-class content" binding.
Verdict: REJECTED.

### Approach B: Three-part synthesis with full disclosure
Part 1: synthesise per-chapter failure notes (chapters
01-07). Part 2: catalogue the four+ cross-phase BES
failure modes per workpad §7. Part 3: enumerate the
seven open research questions per workpad §2.3 as
flagged-open. Close with a Phase 7 meta-failure note +
the "This is the last chapter" closer.
Fit: aligns with §6.5 mandatory content + parent
Decision §7 binding + chapter 00's reader contract.
Verdict: SELECTED.

### Approach C: Open-research-questions-only chapter
Skip the cross-phase synthesis; focus only on the
seven open questions as the chapter's substance.
Fit: violates §6.5 + parent Decision §7 (failure modes
+ open questions both required).
Verdict: REJECTED.

## 5. Recommendation

Approach B. Six-section structure (target ~1 500 words
under soft-floors):

1. **The Phase 7 question + reader contract revisited**
   (~150 w). Why failure modes are content not errata.
   Anchor: leaddev-agent-compiled §3 (risk framing
   from chapter 00).
2. **Per-chapter failure synthesis** (~400 w). Pull
   the "what we did" + "what generalizes" from chapters
   01-07's failure notes. Each chapter cited by file
   path.
3. **Cross-phase failure modes (BES catalogue)**
   (~400 w). Per workpad §7: fastpath zero-adoption;
   decomposition-phase paper-only across 23 SPECs;
   workpad bootstrap gap; four owner-blocking ceremony
   refactor questions. Internal SPEC IDs cited per
   Contract §6.6.
4. **The seven open research questions** (~400 w).
   Per workpad §2.3 verbatim or near-verbatim:
   exhaustiveness without prescription;
   ambiguity-without-developer-in-loop; versioning/
   patching semantics; install-matches-intent;
   equivalence classes; capability floor; adversarial
   spec consumption.
5. **Phase 7 meta-failure note** (~100 w; penultimate
   per §6.5). What failure-modes-as-content itself
   missed. E1 + E2 workpad/Decision-grounded; E3
   synthesis-tagged.
6. **Closing** (~50 w). Per Contract §8.1: "This is
   the last chapter. The seven open research questions
   follow."

Citation discipline (apply T-06 R6 + T-07 + T-08
lessons):
- Primary-source corpus for methodology primitives.
- Workpad §6 Phase 7 + §7 four+ failure modes +
  §2.3 seven open research questions.
- Parent Decision §7 publish-as-flagged-open binding.
- Internal BES audit SPEC IDs per Contract §6.6.
- Each chapter 01-07 failure note synthesised; cite
  by file path.

## 6. Open Questions for Owner

- [ ] Q1: Closing-line wording. Default per Contract
      §8.1: "This is the last chapter. The seven open
      research questions follow." Not owner-blocking.
- [ ] Q2: BES failure-mode disclosure depth. Default:
      cite internal SPEC IDs per Contract §6.6 for the
      four failure modes; sanitize specific transcripts
      or owner-judgment lines that don't survive
      publication; preserve the failure-mode pattern
      itself. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The honest-experience contract + no-padding + no-over-
attribution + authority-source-list-block-in-§6 + §6-
stays-Authority-Map + helper-docstring-matches-rows +
E2-stays-workpad-grounded discipline all carry over.
Chapter 08 is the methodology's most explicit honest-
disclosure chapter — the place where every gap the
methodology has flagged across chapters 00-07 gets
synthesised + the open research questions get
enumerated as flagged-open per parent Decision §7
binding. The rolls-royce posture
(`owner://transcript-2026-05-18`) operationalises
here as "publish the gaps we know about, named."
