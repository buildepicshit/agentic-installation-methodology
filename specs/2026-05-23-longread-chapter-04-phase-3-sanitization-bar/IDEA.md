---
id: longread-chapter-04-phase-3-sanitization-bar
spec_id: 2026-05-23-longread-chapter-04-phase-3-sanitization-bar
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-23
implies_spec_type: task
---

# IDEA — Longread chapter 04 — Phase 3 Sanitization Bar

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 04 as the
Phase 3 chapter: "Dropping studio context without
dropping rigor." Chapter 03 closed the parameterization
surface; chapter 04 picks up the question of what goes
out the door — what does the published spec keep and
what does it leave behind? Per the research workpad
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 3, the bar is three moves: drop studio context
from the spec body; use studio experience as evidence
frame; document preconditions for assumptions.
Per workpad §7, BES landed on "drop ALL studio context
per `owner://transcript-2026-05-17`; generalize
`owner://` → `decision-authority://<role>`."

## 2. Substance Citations

- `file://research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 — reference-vs-solution split; the sanitization
  line follows this distinction (reference architecture
  is universal; solution architecture is studio-specific).
- `file://research/primary-sources/12-factor.md` §3 —
  config-vs-code separation principle; analogous to
  studio-context-vs-spec-body separation.
- `file://research/primary-sources/diataxis.md` §3 —
  four-mode documentation classification; helps think
  about what content belongs where (the published spec
  is reference-mode; the methodology longread is
  explanation-mode + case-study).
- `file://research/primary-sources/sigstore-cosign.md`
  §3 — supply-chain provenance + signing; relevant to
  the trust-boundary preconditions Phase 3 documents.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 3 definition) + §7 (BES Phase 3 disposition).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6.
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  parent Decision §7 disposition Q4 — fully-named
  case-study density (relevant to the asymmetry between
  spec bundle sanitization and methodology longread
  attribution).

## 3. Constraints & Non-Negotiables

- Target 900 words (advisory under soft-floors); max
  1 200 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: every methodology primitive (sanitization bar
  concept; three moves; trust-boundary preconditions;
  reference-vs-solution split) MUST cite a corpus
  entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: chapter 04 includes a Phase 3 failure-mode
  note in the three-element structure with strict
  fact-vs-synthesis separation (T-04 R1 + chapter 02
  R1 + chapter 03 R1 lesson).
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 05 (Phase 4 manifest +
  catalog) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- No padding-for-budget per the soft-floors regime at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 + the T-02 lesson at
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  §17.5.
- No over-attribution to cited authority per the
  chapter 00 / 01 / 02 / 03 prose-codex pattern
  (latest evidence at
  `file://reviews/codex-2026-05-22-chapter-03/REVIEW.md`).

## 4. Approaches Considered

### Approach A: Methodology-vendor prescription
Define sanitization as a checklist; tell readers what
to drop.
Fit: violates §6.3 first-person voice contract; misses
the case-study density parent Decision §7 requires.
Verdict: REJECTED.

### Approach B: BES experience as the path through the
question, plus the asymmetry honestly named
Open with the sanitization-bar question. Walk through
the three moves per workpad §6. Name the asymmetry
honestly: the published spec bundle gets the
sanitization treatment per workpad §7 BES disposition,
while this longread itself does NOT drop studio
context per parent Decision §7 disposition Q4 (BES is
named as case study). Close with the Phase 3 failure
mode strictly fact-vs-synthesis.
Fit: aligns with §6.3 voice + §6.5 failure rule +
corpus-citation discipline + case-study density. The
asymmetry is the load-bearing observation the chapter
exists to make.
Verdict: SELECTED.

### Approach C: Algorithmic sanitization rules
Enumerate find/replace rules + regex patterns + an
imagined sanitization linter.
Fit: drifts into solution-architecture territory that
chapter 04 is supposed to draw a line AGAINST; would
mislead readers into thinking sanitization is mechanical
rather than judgement-laden.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Five-section structure (target ~900 words
under soft-floors; substance determines length):

1. **The sanitization-bar question** (~150 w). What
   does the published spec keep and what does it leave
   behind? Cite ref-arch-vs-solution-arch §3 for the
   line.
2. **Three sanitization moves** (~250 w). Per workpad
   §6: (a) drop studio context from spec body; (b) use
   studio experience as evidence frame; (c) document
   preconditions for assumptions. Cite 12-factor §3
   for the config-vs-code analogue; cite diataxis §3
   for the four-mode classification (reference-mode vs
   explanation-mode).
3. **The asymmetry** (~250 w). Cite workpad §7 BES
   disposition (drop ALL; generalize owner:// to
   decision-authority://<role>) — that applies to the
   published spec bundle. Cite parent Decision §7
   disposition Q4 — Product B itself is the longread
   you're reading; BES is named here because the
   case-study density is the methodology's check
   against bullshit. The two artefacts ship paired
   precisely because they have different sanitization
   contracts.
4. **Phase 3 failure-mode note** (~200 w; penultimate
   per §6.5). Strict fact-vs-synthesis separation:
   - E1 workpad-grounded: workpad §7 records BES bar
     as "drop ALL studio context; generalize owner://
     → decision-authority://<role>".
   - E2 workpad-grounded: BES applied the bar to the
     Product A spec body.
   - E3 `judgment://agent-synthesis`: "drop ALL" is
     easier to state than to apply — distinguishing
     studio-context-as-evidence from studio-context-
     as-leak is judgement, not algorithm.
5. **Forward pointer** (~50 w). To chapter 05 / Phase
   4 / manifest + catalog.

Citation discipline (matches chapter 03 + T-04 R2
closure):
- Methodology primitives MUST cite corpus only.
- Workpad cites only for phase taxonomy + BES
  disposition + open-question enumeration.
- Parent Decision §7 disposition Q4 may anchor the
  asymmetry-between-artefacts observation.
- No specific named BES artefacts beyond what the
  cited workpad authority supports.

## 6. Open Questions for Owner

- [ ] Q1: How explicitly should the asymmetry between
      spec-bundle-sanitization and longread-attribution
      be named? Default: name it explicitly in §3 of
      the chapter as a load-bearing observation, with
      both cites (workpad §7 for sanitization
      disposition; parent Decision §7 Q4 for full
      attribution). Not owner-blocking.
- [ ] Q2: Trust-boundary preconditions example concreteness.
      Default per chapter 02 R1 closure: stay within
      workpad authority — workpad §6 names "trust-
      boundary declarations the installer must make"
      generically; do not invent specific BES
      examples without citable source. Not owner-
      blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce posture
(`owner://transcript-2026-05-18`) + honest-experience
contract + no-padding-for-budget directive + no-over-
attribution discipline all carry over. No new owner
judgments required for Approach B. The asymmetry
observation in §3 is direct application of parent
Decision §7 disposition Q4 already decided.
