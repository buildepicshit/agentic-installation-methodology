---
id: 2026-08-07-fixture-bad-fastpath-fenced-files-decoy
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

# SPEC: Lint Fixture — a FENCED heading is not a section

## 1. Problem

A CI gate rejects a build step that no longer exists (`file://STATUS.md`), so
the required gate must go. The template's own section list renders like this:

```markdown
## Files
Example heading only.
```

## 2. Change set

- `.github/workflows/ci.yml` — remove the required gate.

## 3. Owner directive

> Owner explicitly directed this gate removal.

## 4. Acceptance commands

- `cmd://true`

## 5. Completion Report

Fixture only; never executed.

The fenced `## Files` above is sample text, not a section. If the scanner
counts it as one, it sets "declaration found", which SUPPRESSES the whole-body
fallback — and the real declaration here is named "Change set", so the CI gate
is never read and this SPEC lints CLEAN. Built and confirmed as a live bypass
by the cross-family reviewer against the 2026-08-07 first draft (`4621a35`),
which returned exit 0. Expected: exit 1.
