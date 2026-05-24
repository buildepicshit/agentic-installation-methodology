# Codex R1 — Chapter 08 prose

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR.

## F1 — Open-question section introduces corpus primitives without corpus anchors

Severity: MAJOR

`longread/08-phase-7-failure-modes-as-first-class-content.md:192-221`
named reference-architecture literature and Oracle Agent
Spec while only anchoring the section to the workpad.
Contract §6.4 requires methodology primitives to cite
their corpus entries at `research/primary-sources/<slug>.md`
§3.

The workpad was enough authority for "these are the
seven open questions," but not enough for the embedded
prior-art claims.

Required repair:
- Add `research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 near the reference-architecture sentence.
- Add `research/primary-sources/oracle-agent-spec.md`
  §3 near the Oracle Agent Spec sentence.
- For the drift/prompt-drift sentence, either add a
  corpus anchor if one exists, or rephrase so it is
  clearly a workpad-carried open-question label rather
  than a direct literature claim.

## Clean Checks

- `bash scripts/check-chapter-08-phase-7-anchors.sh` PASS.
- `bash scripts/check-chapter-08-closing.sh` PASS.
- `bash scripts/validate-longread-structure.sh` PASS,
  9/9 chapters, total 7131.
- `bash scripts/validate-longread-structure.sh
  --chapter 08` PASS, 1418 prose words.
- `bash scripts/lint-spec.sh
  specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
  PASS.

No MAJOR issue found in §6.5 triplet ownership, final
closing text, first-person voice, or shape-vs-state
handling.

## Convergence trajectory

| Round | BLOCKER | MAJOR | MINOR |
|---|---|---|---|
| R1 | 0 | 1 | 0 |

tokens used: 182,895
