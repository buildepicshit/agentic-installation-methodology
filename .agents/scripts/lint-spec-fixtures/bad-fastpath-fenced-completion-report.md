---
id: 2026-08-07-fixture-bad-fastpath-fenced-completion-report
status: closed
type: fastpath
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: low
requires_network: false
requires_secrets: []
acceptance_commands: []
ideated_in: null
---

# SPEC: Lint Fixture — a FENCED Completion Report does not open the exemption

## 1. Problem

The renderer documentation contains this example (`file://STATUS.md`):

```markdown
## Completion Report
```

Rotate the GitHub PAT used by CI.

## 2. Files changed

- `docs/rotation-log.md` — record the rotation.

## 3. Owner directive

> Owner directed the rotation be logged.

## 4. Acceptance commands

- `cmd://true`

## 5. Completion Report

Fixture only; never executed.

The secrets test exempts the Completion Report subtree, because a retrospective
"no credential was touched" is not a claim that one was. If the scanner honours
a FENCED `## Completion Report`, the exemption opens inside §1 and swallows the
real secrets claim above it — which is the opposite of what the exemption is
for. Built and confirmed as a live bypass by the cross-family reviewer against
the 2026-08-07 first draft (`4621a35`), which returned exit 0. Expected: exit 1.
