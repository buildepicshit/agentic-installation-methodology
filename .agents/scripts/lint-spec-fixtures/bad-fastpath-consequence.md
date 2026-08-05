---
id: 2026-08-06-fixture-bad-fastpath-consequence
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

# SPEC: Lint Fixture — fastpath naming an enforcement surface

## 1. Problem

A CI gate rejects a build step that no longer exists, so every run fails
(`cmd://bash agents/scripts/run-ci-gates.sh`). Removing the stale gate is a
one-line change.

## 2. Files changed

- `.github/workflows/ci.yml` — drop the retired gate step.

This is the case the OLD manifest-path test ADMITTED: `.github/workflows/ci.yml`
is in no propagation manifest, so path-based fastpath screening passed it, while
the change plainly alters what CI blocks. Expected: exit 1
(`file://specs/2026-08-06-guardrail-proxies-to-consequence/SPEC.md` S1).

## 6. Completion Report

Fixture only; never executed.
