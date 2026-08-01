---
name: spec-evidence
description: "OPT-IN ONLY — use when the OWNER asks to capture a lesson, or when you have found something that should change a fleet rule and you are about to propose that change. Do NOT run it as a routine close-out step. Scoped 2026-07-31 (owner-directed): running it once per SPEC accumulated 54 untriaged candidates across 14 SPECs since 2026-05-28, nearly all on already-closed work, with no consumer — an arrival rate with no service rate, which made finished SPECs read as open work. If a lesson is worth keeping, propose the rule change directly; if it is not worth a rule change, it is not worth writing down."
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
