---
id: 2026-05-01-fixture-good-task
status: draft
type: task
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: low
requires_network: false
requires_secrets: []
ideated_in: agents/scripts/lint-spec-fixtures/IDEA-good-task.md
acceptance_commands:
  - test -f agents/scripts/lint-spec-fixtures/good-task.md
---

# SPEC: Lint Fixture — Good Task

## Normative Language

The key words MUST, SHOULD, and MAY in this document are to be
interpreted as described in RFC 2119.

## 1. Problem

The lint script needs a known-good Task SPEC fixture so the test suite
can verify exit code 0. See `file://agents/scripts/lint-spec.sh` §"Self-test".

## 2. North Star / Product Promise

A passing fixture proves the lint script's happy path. The owner
directed: "ship a fixture that passes" — see `owner://transcript-2026-05-01`.

## 3. Goals

The fixture MUST exit 0 under `cmd://bash agents/scripts/lint-spec.sh`
when the script is run on this file.

## 4. Non-Goals

This fixture does not exercise Contract or Decision SPEC paths; those
are out of scope for the v1 lint test suite per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §19.

## 5. Current System Facts

The lint script lives at `file://agents/scripts/lint-spec.sh` and is
393 lines per `cmd://wc -l agents/scripts/lint-spec.sh`.

## 6. Authority Map

- Authority spec: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`.
- Schema: `file://agents/specs/SPEC.schema.md`.

## 7. Code/Docs Reality Check

No drift detected at fixture creation time —
`cmd://git -C bes-fleet-policy status` reported a clean tree before
this fixture was added.

## 8. Desired Behavior

Running `lint-spec.sh` against this fixture MUST exit 0 and print a
summary table to stdout. Citation `judgment://owner` applies — this
contract was set by the owner during the same transcript at
`owner://transcript-2026-05-01`.

## 9. Domain Model / Contract

A fixture file is `(path: string, expected_exit: int)`. This fixture
binds `(good-task.md, 0)`.

## 10. Interfaces and Files

- File: `agents/scripts/lint-spec-fixtures/good-task.md`.
- Consumer: `file://agents/scripts/lint-spec.sh`.

## 11. Execution Plan

Author this file once; verify under `cmd://bash agents/scripts/lint-spec.sh`.

## 12. Safety / Scope Invariants

The fixture MUST NOT reference network resources or secrets — the
lint script is offline per
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §10.5.

## 13. Test Plan

Run the script against this fixture and confirm exit code 0 — see
`cmd://bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/good-task.md`.

## 14. Acceptance Criteria

- [ ] Lint exits 0 against this file (per
  `file://specs/.../SPEC.md` §19 T09).

## 15. Rollback Plan

Delete the fixture file; no other artefacts depend on it per
`cmd://grep -r good-task.md agents/`.

## 16. Open Questions

None.

## 17. Completion Report

To be filled on execution.
