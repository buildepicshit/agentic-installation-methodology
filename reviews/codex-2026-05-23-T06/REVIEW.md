# Codex R1 — T-06 chapter 05 Task SPEC

Mode: read-only R1 spec-review. Date: 2026-05-23.

## Verdict

NEEDS-REVISION — 0 BLOCKER, 2 MAJOR.

## MAJOR

### F1 — invalid "8 facets from chapters 02+04" claim
SPEC + IDEA cited chapter 02 + 04 as having established
8 facets. Chapter 02 establishes 7 per workpad §6 Phase 1.

Recommendation: reconcile facet authority before approval.

### F2 — anchors helper accepts bare keywords
Shape rows accept `yaml`, `gherkin`, `c4 model` without
requiring actual corpus file paths.

Recommendation: require `research/primary-sources/<slug>.md`
co-occurrence with each concept.

## R1 remediation summary

- F1: §5 + §8 explicitly forbid "chapters 02+04 established
  8 facets"; chapter 02 = 7 facets per workpad.
- F2: helper rewritten to require corpus file paths
  in same paragraph. Verified bare-keyword chapter FAILs.

tokens used: 121,541
