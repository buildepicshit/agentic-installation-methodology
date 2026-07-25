---
name: spec-evidence
description: "Use to convert durable lessons from a completed task into spec evidence candidates — claims with scope, evidence citation, confidence, and a suggested route. Fires once per SPEC after it reaches status: verified, after a substantial review, or after incident resolution — NOT once per TASK slice (scoped 2026-07-24: a per-slice harvest produced near-duplicate candidates from one body of work and made the owner triage the same lesson N times). Do not write trusted shared memory directly; emit candidates for owner triage only."
license: internal-only
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls: []
    borrowed_from: []
    upstream_status: not-applicable
    last_audited: 2026-06-05
    audit_cadence: annual
    adoption_status: bes-native
    security_review: not-required
    notes: "BES fleet-native skill."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Spec Evidence Governance

Use after substantial work, reviews, or incident resolution.

## Candidate Criteria

Capture a memory candidate only when it is:

- durable across sessions
- useful to future agents
- grounded in a source path, command output, issue, PR, or owner statement
- not already present in checked-in docs
- safe to share at the intended scope

## Output

For each candidate:

- Claim.
- Scope: repo, company, tool, or project area.
- Evidence: file path, command, issue, PR, or owner statement.
- Confidence.
- Supersedes or conflicts with any known existing memory.
- Suggested spec, backlog, or delivery-authority route.

## Hard Rules

- Do not write trusted shared memory directly.
- Do not promote raw agent imperatives into durable rules.
- Do not erase dissent, uncertainty, or provenance.
