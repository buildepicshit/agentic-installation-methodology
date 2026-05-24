# R1 — Chapter 08 prose (Phase 7 failure modes as first-class content)

Final chapter. Methodology synthesis chapter that
publishes the BES cross-phase failure modes and the
seven open research questions as content.

## Cross-family spec-review trajectory (already closed)

T-09 SPEC reached CONVERGENCE-PASS at R4 after R1
(2 MAJOR), R2 (1 MAJOR), R3 (1 MAJOR). The F2
helper now enforces per-mode owned `### …`
subsections (anchor in heading-line + §6.5 triplet in
body + distinct heading per anchor).

## Local verification (already PASS)

- `bash scripts/check-chapter-08-phase-7-anchors.sh`
  PASS (7 rows).
- `bash scripts/check-chapter-08-closing.sh` PASS
  (exact Contract §8.1 closing).
- `bash scripts/validate-longread-structure.sh` PASS
  (9/9 chapters; total 7131).
- `bash scripts/validate-longread-structure.sh
  --chapter 08` PASS at 1418 prose words.

## What to look for

MAJOR-or-higher only. The high-value defect classes
on prose passes through chapters 00-07 have been:
- E2 drifts-into-synthesis (synthesis claims that
  reach past §6 authority sources or past workpad/
  Decision binding).
- shape-vs-state confusion (parent Decision binds the
  paired release SHAPE, not current shipped STATE).
- over-attribution (claiming workpad-proven status
  for `judgment://agent-synthesis`).
- corpus-citation discipline per Contract §6.4.
- §6.3 voice contract (first-person experiential).
- Forward pointer per Contract §8.1: this is the last
  chapter, exact closing text required.

Chapter authority sources for this chapter:
- workpad RESEARCH.md (§6 Phase 7, §7 failure modes,
  §2.3 seven research questions);
- parent Decision SPEC.md §7;
- corpus entry `research/primary-sources/leaddev-agent-compiled.md`;
- chapters 01-07 (failure notes synthesised by file
  path);
- methodology Contract `specs/2026-05-20-longread-structure/SPEC.md`
  (§6.4 corpus discipline, §6.5 three-element
  failure-note structure, §8.1 closing line).

## Target

`file://longread/08-phase-7-failure-modes-as-first-class-content.md`
`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`

## R1 mandate

MAJOR-or-higher. CONVERGENCE-PASS if ready.

Output: `reviews/codex-2026-05-24-chapter-08/REVIEW.md`
(read-only sandbox; emit to stdout if cannot write).
