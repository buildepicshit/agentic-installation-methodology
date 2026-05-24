# Codex R3 — T-09 chapter 08 Phase 7 failure modes Task SPEC

**MAJOR: 1. CONVERGENCE-FAIL.**

## Findings

### F1 — F2 helper still does not enforce "each mode is its own subsection" (MAJOR)

`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md#L176-L187`
and `#L393-L396` require each of the four failure modes to be its
own `###` subsection with the anchor plus all three §6.5 markers.

But `file://scripts/check-chapter-08-phase-7-anchors.sh#L120-L138`
loops over anchors independently and accepts any `###` block where
the current anchor and the three markers co-occur. It does not
require four distinct subsections, does not bind the anchor to the
subsection heading, and allows the same subsection to satisfy all
four anchors.

Direct probe against the exact AWK block showed a single synthetic
subsection named `### Cross-phase modes`, containing all four
anchors and one marker triplet, returns:

```text
PASS fastpath
PASS decomposition
PASS workpad bootstrap
PASS ceremony refactor
```

Impact: R2 F1 is not cleanly closed. T-14/AC-14 still claim
mechanical per-mode enforcement, but the helper still permits a
combined catalog subsection instead of four owned per-mode
disclosures.

Suggested fix: parse `###` blocks with a stable block id, require a
distinct matching block per failure-mode anchor, and preferably
require the anchor in the `###` heading itself so "its own
subsection" is mechanically meaningful.

## Verification

- `bash scripts/lint-spec.sh specs/.../SPEC.md` PASS.
- `bash scripts/lint-spec.sh specs/.../IDEA.md` PASS.
- `bash -n scripts/check-chapter-08-phase-7-anchors.sh` PASS.
- `bash -n scripts/check-chapter-08-closing.sh` PASS.
- Default helper runs fail only because the chapter file is not
  authored yet.
- File-backed synthetic self-test could not be run because the
  sandbox filesystem is read-only; stdin-only AWK probing was used.

## Convergence trajectory

| Round | BLOCKER | MAJOR | MINOR |
|---|---|---|---|
| R1 | 0 | 2 | 0 |
| R2 | 0 | 1 | 0 |
| R3 | 0 | 1 | 0 |

tokens used: 76,794
