# Cross-family review — Chapter 00 prose

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing a content-quality review
on chapter 00 of the methodology longread. The Task SPEC
that bound this authoring (T-01) already converged through
5 rounds of structural codex review; this pass is on the
PROSE itself, not on the SPEC.

## Target

`file://longread/00-introduction.md` — 842 prose words.

## Context

- Parent Decision SPEC at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 binds Product B shape: case-study + procedure + posture;
  8 000-12 000 word band; first-person experiential voice;
  BES case-study density; failure modes first-class.
- Longread Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1-§6.5 govern chapter taxonomy, word budget, voice
  contract, corpus-citation rule, per-chapter failure-mode
  rule.
- T-01 Task SPEC at
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  §8 + §13 + §14 list 13 ACs covering content obligations
  (epigraph, LeadDev cite, 8-phase roadmap, reader contract
  three clauses, forward pointer) — all already verified
  PASS at the SPEC level.
- Primary-source corpus at `file://research/primary-sources/`
  (22 sources, v1.1 SOURCE_LIST_VERSION). LeadDev entry at
  `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 holds the verbatim Kruger quote.
- Research workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §2.3 lists the seven open research questions chapter 00
  promises to flag (not resolve).

## What I want from this review

A content-quality verdict at SEVERITY = MAJOR-or-higher.
For each finding: number, severity (BLOCKER / MAJOR /
MINOR / ADVISORY), citation (file:line in
`longread/00-introduction.md` or another artefact),
statement, recommendation.

Scan specifically for:

1. **Truthfulness against the corpus**: does every
   methodology primitive in the chapter actually trace to
   the cited corpus entry? Do BES-experiential claims
   match what the parent Decision + research workpad
   actually say (BES shipped Product A; published v2.0
   manifest+catalog; methodology arc; etc.)?
2. **Citation discipline against the rule at Contract §6.4**:
   are corpus cites used only for methodology primitives?
   Are owner-transcript cites used only for posture? No
   methodology primitive cited via parent-Decision or
   research-workpad anchors?
3. **Voice contract against Contract §6.3**: first-person
   experiential dominant? Any passive-voice for studio
   actions? Any third-person methodology-vendor voice
   ("the methodology suggests", "best practice")?
4. **Hypothesis framing**: does the chapter actually
   publish the agentic-installation hypothesis as procedure
   while contrasting against LeadDev's risk framing — or
   does it conflate the two?
5. **Reader-contract clarity**: are the three named
   clauses ("honest experience, not prescription";
   "failure modes are first-class content"; "corpus-
   citation discipline") functioning as the binding
   contract every subsequent chapter inherits, or are they
   buried in prose that doesn't commit to them?
6. **Reader-roadmap accuracy**: do the one-sentence phase
   summaries match the §6.1 chapter taxonomy + each phase's
   actual content per the research workpad §6 phase
   definitions?
7. **Open-questions disclosure**: does the chapter
   actually flag the seven open research questions as
   open, or does it gesture at them?
8. **Forward-pointer correctness**: does the "**In the
   next chapter**:" pointer match chapter 01's actual
   subject per §6.1 (Phase 0 maturity check)?
9. **Editorial quality**: any sentences that read as
   marketing rather than experiential? Any unsupported
   superlatives? Any drift toward methodology-vendor
   register?

## What I don't want

Editorial nitpicks below MAJOR severity — note in a brief
Advisory section. No SPEC-level structural findings (the
SPEC already converged at R5).

## Output

A single review document at
`reviews/codex-2026-05-20-chapter-00/REVIEW.md` (read-only
sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER findings, MAJOR findings,
MINOR findings, Advisory, Truthfulness table (chapter
claim → corpus cite → claim matches source? Y/N/PARTIAL).

Honest. If the chapter is ready for verified+closed as
drafted, say so. If it isn't, surface specific
sentence-level fixes.
