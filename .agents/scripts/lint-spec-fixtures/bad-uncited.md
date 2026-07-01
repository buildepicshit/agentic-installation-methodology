---
id: 2026-05-01-fixture-bad-uncited
status: draft
type: task
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: low
requires_network: false
requires_secrets: []
ideated_in: agents/scripts/lint-spec-fixtures/IDEA-bad-uncited.md
acceptance_commands:
  - test -f agents/scripts/lint-spec-fixtures/bad-uncited.md
---

# SPEC: Lint Fixture — Bad (Uncited)

## Normative Language

The key words MUST, SHOULD, and MAY in this document are to be
interpreted as described in RFC 2119.

## 1. Problem

The Symphony spec is 2169 lines long and was ratified in 2024. This
paragraph deliberately omits any citation prefix.

## 2. North Star / Product Promise

The North Star here is verifying lint catches uncited claims, citing
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19 T10.

## 3. Goals

The fixture MUST trigger at least one citation error per
`file://agents/specs/SPEC.schema.md` §2.

## 4. Non-Goals

Out of scope per `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19.

## 5. Current System Facts

The studio has 6 child repos and was bootstrapped on 2024-11-09. This
sentence is also deliberately uncited and should be flagged.

## 6. Authority Map

- Authority spec: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`.

## 7. Code/Docs Reality Check

No drift detected at fixture creation per
`cmd://git status` clean output.

## 8. Desired Behavior

Lint MUST exit 1 against this fixture per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19 T10.

## 9. Domain Model / Contract

`(path: string, expected_exit: int)` — this fixture binds
`(bad-uncited.md, 1)` per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19.

## 10. Interfaces and Files

- File: `agents/scripts/lint-spec-fixtures/bad-uncited.md`.

## 11. Execution Plan

Author this file once per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19.

## 12. Safety / Scope Invariants

Offline only per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §10.5.

## 13. Test Plan

Run lint and confirm exit 1 per
`cmd://bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/bad-uncited.md`.

## 14. Acceptance Criteria

- [ ] Lint exits 1 with at least one citation error per
  `file://specs/.../SPEC.md` §19 T10.

## 15. Rollback Plan

Delete the file per
`cmd://rm agents/scripts/lint-spec-fixtures/bad-uncited.md`.

## 16. Open Questions

None.

## 17. Completion Report

To be filled on execution.
