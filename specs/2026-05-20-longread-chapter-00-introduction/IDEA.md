---
id: longread-chapter-00-introduction
spec_id: 2026-05-20-longread-chapter-00-introduction
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-20
implies_spec_type: task
---

# IDEA — Longread chapter 00 — Introduction

## Normative Language

This IDEA contains no RFC 2119 normative clauses; it is a
producing artefact for a Task SPEC that itself contains the
normative clauses. Per
`file://schema/SPEC.schema.md` §3.2, IDEA artefacts MAY use
RFC 2119 keywords in reported recommendations but are not
binding.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) names nine chapter files and a
mechanical validator. Per its §7.1 authoring sequence, chapter
00 (`longread/00-introduction.md`) is authored first because
it sets the reader contract every subsequent chapter inherits.
The methodology arc converged at R6 codex review on the three
Contract SPECs that bind Product B (parent Decision, corpus,
v2.0 repack); STATE.md at
`file://STATE.md` names T-01 chapter 00 as the next slice. No
chapter prose exists yet.

## 2. Substance Citations

Source-of-truth references for the methodology primitives
chapter 00 must convey: <!-- lint-ok: no-citation -->


- `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 — the LeadDev critique of agentic installation framed as
  risk; chapter 00 publishes the same hypothesis as procedure.
- `file://specs/2026-05-20-longread-structure/SPEC.md` §6.1
  — chapter taxonomy (chapter 00 = "Why agentic installation;
  what this longread is + is not; reader contract").
- `file://specs/2026-05-20-longread-structure/SPEC.md` §6.2 —
  per-chapter word budget table (chapter 00: target 800, max
  1 100).
- `file://specs/2026-05-20-longread-structure/SPEC.md` §6.3 —
  voice contract (first-person experiential).
- `file://specs/2026-05-20-longread-structure/SPEC.md` §6.4 —
  corpus-citation rule.
- `file://specs/2026-05-20-longread-structure/SPEC.md` §7.1 —
  authoring sequence (chapter 00 first).
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — Product B shape binding (case-study + procedure +
  posture).

## 3. Constraints & Non-Negotiables

- Target 800 words; maximum 1 100 words per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.2.
- First-person experiential voice per §6.3.
- Corpus-citation rule per §6.4: every methodology primitive
  MUST cite a corpus entry (not external URL, not agent
  memory).
- Chapter 00 is exempt from the per-chapter failure-mode
  rule at
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.5
  (it is the introduction; no Phase to surface failures
  from). Chapter 08 carries the cross-phase synthesis.
- The chapter MUST roadmap the eight phase chapters per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.1.
- The chapter MUST end with an "**In the next chapter**:"
  forward pointer to chapter 01 per
  `file://specs/2026-05-20-longread-structure/SPEC.md` §8.1
  file structure.
- The chapter MUST NOT claim to resolve any of the seven
  open research questions
  (`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §2.3).

## 4. Approaches Considered

### Approach A: Pure case-study introduction (BES-first)

Open by describing how BES authored Product A; introduce the
methodology as a generalisation of that experience.

Fit: chapter 00 is supposed to set the frame BEFORE the
case study. Putting BES first makes chapter 00 a Phase 1
preview, not an introduction.

Verdict: REJECTED.

### Approach B: Pure procedure introduction (methodology-first)

Open with the agentic-installation hypothesis as a clean
procedure statement; introduce BES as a worked example in
later chapters.

Fit: aligns with §6.1 framing ("Why agentic installation; what
this longread is + is not; reader contract"). Sets the frame
neutrally. The BES case-study arrives organically in chapters
01-08.

Verdict: SELECTED.

### Approach C: Academic-paper abstract

Author chapter 00 as a publication abstract (problem, method,
results, limitations).

Fit: parent Decision §7 binds Product B as experiential
narrative, not academic publication. Wrong register.

Verdict: REJECTED.

## 5. Recommendation

Approach B. Six-section structure per the §9 Domain Model of
the producing Task SPEC: (1) The hypothesis (~150 words);
(2) What this longread is (~150 words); (3) What this longread
is not (~150 words); (4) The reader contract (~200 words);
(5) Reader roadmap (~100 words, one sentence per phase
chapter); (6) Forward pointer (~50 words).

Citation discipline (matches Task SPEC T-5; narrower than
the broadened model the R1 review rejected):

- Methodology primitives (agentic-installation hypothesis,
  the Phase 0-7 procedure shape, sanitization bar,
  manifest+catalog pattern, conformance surface) MUST cite
  `research/primary-sources/<slug>.md §3` only.
  Parent Decision / Contract / research-workpad cites are
  NOT substitutes for primary-source corpus anchors.
- Product B shape, the phase taxonomy, owner dispositions,
  and the seven-open-question enumeration MAY cite parent
  Decision §7 / Contract §6.1-§6.5 / research workpad §2.3.
- Posture / reader-contract statements MAY cite
  `owner://transcript-<date>` quotes.
- LeadDev §3 anchors the prior-art-as-risk framing the
  methodology publishes as procedure.

## 6. Open Questions for Owner

- [ ] Q1: Epigraph choice — owner transcript ("Do what is
      the rolls royce" / "deep research, not bullshit") vs.
      LeadDev §3 Kruger patching quote vs. a synthesis.
      Default: LeadDev §3 quote (grounds chapter in
      published prior-art risk framing). Not owner-blocking.
- [ ] Q2: Reader roadmap density — one-sentence per phase
      chapter (8 sentences) vs. one-paragraph per chapter.
      Default: one-sentence to fit the 800-word budget. Not
      owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`; both can be adjusted
in-place during authoring or post-verify.

## 7. Owner Judgments

The rolls-royce posture is anchored by
`owner://transcript-2026-05-18` ("Do what is the rolls
royce" / "deep research, not bullshit"). This directive
operationalises chapter 00's reader contract: honest
experience, failure modes as first-class content, corpus
citation discipline. No additional owner judgments are
required to author the chapter under Approach B.
