# Cross-family review — Chapter 01 prose

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing content-quality review on
chapter 01 of the methodology longread. T-02 SPEC already
converged at R2 (4→0). This pass is on the PROSE.

## Target

`file://longread/01-phase-0-maturity-check.md` (830 prose
words).

## Context

- T-02 SPEC at
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  (status: verified).
- Longread Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md` —
  §6.3 voice contract, §6.4 corpus-citation rule, §6.5
  per-chapter three-element failure-mode rule, §6.6 BES
  attribution posture.
- Chapter 00 at
  `file://longread/00-introduction.md` — sets the reader
  contract chapter 01 inherits.
- Research workpad §6 Phase 0 + §7 BES case-study:
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.
- Chapter 00 prose review evidence at
  `file://reviews/codex-2026-05-20-chapter-00/REVIEW.md`
  + R2 closure at
  `file://reviews/codex-2026-05-20-chapter-00-r2/REVIEW.md`.

## What I want

A content-quality verdict at SEVERITY = MAJOR-or-higher.

Scan specifically for:

1. **Truthfulness against the corpus** — does every cited
   corpus entry actually say what the chapter claims?
2. **Citation discipline against Contract §6.4** — every
   methodology primitive cites corpus only? Parent /
   research-workpad cites used only for shape /
   taxonomy / open-question enumeration?
3. **Voice contract against Contract §6.3** — first-
   person experiential? No passive voice for studio
   actions? No methodology-vendor register?
4. **Failure-note quality against Contract §6.5** —
   does the three-element note (what happened / what
   we did / what pattern generalizes) actually disclose
   a real BES failure honestly, or does it hedge?
5. **Phase 0 substance** — do the four positive signals
   + three anti-signals actually match the research
   workpad §6 Phase 0 definitions?
6. **Coherence with chapter 00** — does chapter 01
   inherit the reader contract correctly without
   restating it?
7. **Forward-pointer correctness** — does the "in the
   next chapter" pointer match chapter 02's actual
   subject (Phase 1 facet inventory) per Contract §6.1?

Lessons from chapter 00 R1 prose review (don't repeat
those misses): overclaim about "tested in production with
real users" is the canonical risk for these chapters —
flag any place chapter 01 makes more-than-supported
claims about what BES has achieved.

## Output

Single review at
`reviews/codex-2026-05-21-chapter-01/REVIEW.md` (read-only
sandbox; emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory,
Truthfulness table.

Honest. If ready for verified+closed, say so.
