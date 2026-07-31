---
tracker:
  kind: linear
  endpoint: https://api.linear.app/graphql
  api_key: $LINEAR_API_KEY
polling:
  interval_ms: 30000
workspace:
  root: /tmp/.symphony/workspaces/fixture
codex:
  enabled: true
---

# WORKFLOW.md — fixture-bad-workflow-dispatcher-yaml-crlf

Fixture intro paragraph. The body markers below are all present so
the ONLY audit failure this fixture can produce is the dispatcher-era
front-matter gate.

## Applicability

Fixture stand-in for the fleet-baseline body's Applicability preamble.

## Step 0 — Orient (universal)

Fixture marker section.

## Step 2 — Subagent dispatch and multi-model fan-out

Fixture marker section; carries the `cross_validation_lane` marker.

## Step 4 — Decomposition gap recovery

Fixture marker section.
