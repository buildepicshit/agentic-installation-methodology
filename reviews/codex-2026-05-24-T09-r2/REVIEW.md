# Codex R2 — T-09 chapter 08 Phase 7 failure modes Task SPEC

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR.

## F1 — F2 marker counts still do not prove per-mode disclosure

`file://scripts/check-chapter-08-phase-7-anchors.sh:88-123` checks
the four failure-mode anchors globally, then separately requires
each bold marker to appear at least four times globally. That still
allows a chapter to pass by listing `fastpath`, `decomposition`,
`workpad bootstrap`, and `ceremony refactor` once, while placing
four unrelated `**What happened.**` / `**What we did.**` /
`**What pattern generalizes.**` triplets elsewhere.

That contradicts
`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md:350-359`,
which says T-14 is mechanically enforced for "each" failure mode.
R1 F1 is therefore not closed cleanly. Fix by coupling each mode
anchor to all three markers in the same bounded disclosure
block/section, or demote the "mechanically enforced" claim to an
explicit manual gate.

R1 F2 appears closed: the closing helper now checks the final
non-blank paragraph against the exact Contract §8.1 text, and the
IDEA conflict is gone.

Verification: `lint-spec` PASS for the SPEC; `bash -n` PASS for both
helpers. Runtime helper checks fail only because chapter 08 has not
been authored yet.

## Convergence trajectory

| Round | BLOCKER | MAJOR | MINOR |
|---|---|---|---|
| R1 | 0 | 2 | 0 |
| R2 | 0 | 1 | 0 |

tokens used: 76,023
