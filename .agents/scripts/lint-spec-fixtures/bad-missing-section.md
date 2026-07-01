---
id: 2026-05-01-fixture-bad-missing-section
status: draft
type: task
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: low
requires_network: false
requires_secrets: []
ideated_in: agents/scripts/lint-spec-fixtures/IDEA-bad-missing-section.md
acceptance_commands:
  - test -f agents/scripts/lint-spec-fixtures/bad-missing-section.md
---

# SPEC: Lint Fixture — Missing Acceptance Criteria Section

## Normative Language

The key words MUST, SHOULD, and MAY in this document are to be
interpreted as described in RFC 2119.

## 1. Problem

This fixture deliberately omits the `## 14. Acceptance Criteria`
section to verify lint catches missing required sections — see
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19 T11.

## 2. North Star / Product Promise

A negative-fixture exit-1 verification proves lint enforces §9.2 per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §9.2.

## 3. Goals

Lint MUST exit 1 against this fixture per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19 T11.

## 4. Non-Goals

Other negative fixtures live in adjacent files per
`file://agents/scripts/lint-spec-fixtures/`.

## 5. Current System Facts

This file omits §14 by design per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19 T11.

## 6. Authority Map

- Authority spec: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`.

## 7. Code/Docs Reality Check

No drift detected per
`cmd://git status` clean output at fixture creation time.

## 8. Desired Behavior

Lint MUST emit "missing required section: ## 14. Acceptance Criteria"
per `file://agents/scripts/lint-spec.sh` Required-section presence block.

## 9. Domain Model / Contract

`(path: string, expected_exit: int)` — this fixture binds
`(bad-missing-section.md, 1)` per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19.

## 10. Interfaces and Files

- File: `agents/scripts/lint-spec-fixtures/bad-missing-section.md`.

## 11. Execution Plan

Author this file once per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19.

## 12. Safety / Scope Invariants

Offline only per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §10.5.

## 13. Test Plan

Run lint and confirm exit 1 with a missing-section diagnostic per
`cmd://bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/bad-missing-section.md`.

## 15. Rollback Plan

Delete the file per
`cmd://rm agents/scripts/lint-spec-fixtures/bad-missing-section.md`.

## 16. Open Questions

None.

## 17. Completion Report

To be filled on execution.
