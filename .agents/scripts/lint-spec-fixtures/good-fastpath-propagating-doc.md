---
id: 2026-08-06-fixture-good-fastpath-propagating-doc
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

# SPEC: Lint Fixture — fastpath touching a propagating doc with no consequence

## 1. Problem

A heading in a fleet-propagating reference doc is misspelled
(`file://agents/WORKSPACE_LAYOUT.md`). Fixing a typo changes no behaviour.

## 2. Files changed

- `agents/WORKSPACE_LAYOUT.md` — correct one heading.

This is the case the OLD manifest-path test BARRED: the file propagates, so the
path test blocked it, yet it cannot alter any gate verdict. Expected: exit 2
(advisory only — the manifest hit nudges, it does not block)
(`file://specs/2026-08-06-guardrail-proxies-to-consequence/SPEC.md` S1).

## 6. Completion Report

Fixture only; never executed.
