# R2 — Chapter 08 prose (Phase 7 failure modes as first-class content)

R1 returned 1 MAJOR (F1); addressed.

## R1 finding and remediation

### R1 F1 — corpus anchors for embedded prior-art claims

R1 finding: the open-questions section named
reference-architecture literature and Oracle Agent
Spec as prior art while only anchoring to the
workpad; Contract §6.4 requires corpus anchors at
`research/primary-sources/<slug>.md §3` for
methodology primitives.

Remediation:
- Q1 (Exhaustiveness without prescription): now
  cites `research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 inline.
- Q5 (Equivalence classes): now cites
  `research/primary-sources/oracle-agent-spec.md` §3
  inline.
- Q2 (Ambiguity when agents cannot ask the
  developer): rephrased as a workpad-carried
  open-question label rather than a direct literature
  claim about drift/prompt-drift; the workpad already
  flags this as such in §2.3.

## Local verification (already PASS)

- `bash scripts/check-chapter-08-phase-7-anchors.sh`
  PASS (7 rows).
- `bash scripts/check-chapter-08-closing.sh` PASS.
- `bash scripts/validate-longread-structure.sh
  --chapter 08` PASS at 1441 prose words.

## Target

`file://longread/08-phase-7-failure-modes-as-first-class-content.md`
`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`

## R2 mandate

MAJOR-or-higher. CONVERGENCE-PASS if R1 F1 closed
cleanly with no new defects.

Output: `reviews/codex-2026-05-24-chapter-08-r2/REVIEW.md`
(read-only sandbox; emit to stdout if cannot write).
