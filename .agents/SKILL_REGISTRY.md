# BES Agent Skill Registry

Status: canonical shared skill map, 2026-05-05.

Use this registry to choose the right workflow before starting work. Skills are
small operating procedures, not broad policy documents.

Documentation placement rules live in `.agents/DOCUMENTATION_GUIDE.md`. Read
that guide before creating, moving, archiving, or publishing docs/specs.

## Required Core Skills

| Skill | Use when | Output |
|---|---|---|
| `repo-orientation` | Starting any task or entering a repo | Repo map, source-of-truth list, verification gates, risks |
| `spec-authoring` | Capturing an IDEA conversation or authoring a typed SPEC (fastpath / task / contract / decision); includes the structured-options-cited-to-docs grill pattern | Structured `IDEA.md` and/or typed `SPEC.md` populated from the matching template, with citation discipline |
| `spec-driven-development` | Planning non-trivial work | Approved executable `SPEC.md` |
| `spec-review` | Reviewing a draft spec | Blocking findings, open questions, approval recommendation |
| `implementation-execution` | Implementing approved scope | Scoped diff and updated tests/docs |
| `verification` | Proving a change works | Command output summary and residual risk |
| `code-review` | Reviewing an existing diff or PR | Bug/risk findings with file references |
| `spec-evidence-governance` | Capturing durable lessons | Spec evidence candidates with provenance |

## Tactical Skills

These skills improve execution behavior without creating a new
authority layer. Approved SPECs and repo policy still control scope.

| Skill | Use when | Output |
|---|---|---|
| `diagnosis` | Debugging a failure, flaky behavior, regression, broken command, or unclear root cause | Reproduction loop, evidence, root cause or strongest hypothesis, fix direction, verification result |
| `tdd` | Implementing a behavior change where a useful executable check can describe the expected behavior | Focused red/green/refactor loop, behavior-facing check, acceptance command follow-through |
| `approved-spec-decomposition` | An approved SPEC is large enough to split into vertical HITL or AFK slices | Subordinate decomposition plan with owned files, dependencies, acceptance evidence, and two-stage review order |
| `fleet-enforce` | (bes-fleet-policy only) Cross-repo enforcement of fleet rule changes via structured directives | `agents/fleet-directives/<id>.md` + `fleet-enforce.sh` apply across target repos; `audit-fleet-compliance.sh` verifies; owner-only authority |
| `cross-agent-cli-invocation` | Invoking another agent's CLI from Bash (claude→copilot, copilot→claude, and similar future cross-agent calls) | Documented gotchas + minimum-viable invocations; helper `validate-cli-invocation.sh` provides PASS/WARN/FAIL pre-flight check; PreToolUse hook `block-bad-cli-invocation.sh` mechanically blocks malformed Claude Code Bash calls. Copilot-side mechanical enforcement belongs in the approved CLI-invocation guardrail lane. |
| `execution-discipline-cluster` | Every execution-phase task + any answer with a load-bearing knowledge gap; six practices bundled (tool receipts, in-flight failure disclosure, receiving-code-review, ground-before-you-answer, confidence-band declaration, escalation rubric) | Receipts cite captured artefacts not prose; failures + scope drift surface as first-class report entries; review feedback verified before accepting; load-bearing gaps researched to primary sources before answering; HIGH/MEDIUM/LOW confidence bands on claims; escalation / reset-with-handoff when a fix loop stops converging |
| `evidence-cluster` | Code authoring + spec-review | Impact-aware test selection (transitive graph) + anti-over-mock (no mocks in prod files) + complexity-delta gate during review + dual-reader ambiguity probe at SPEC review |

## Invocation Rules

- Run `node .agents/scripts/preflight.mjs` before root planning, dispatch, or
  spec execution.
- Use `repo-orientation` before choosing implementation files.
- Read `.agents/DOCUMENTATION_GUIDE.md` during orientation when the repo has
  one.
- Use `spec-driven-development` for architecture, behavior, guardrail,
  workflow, data model, CI, public-doc, or multi-file work.
- Use `spec-authoring` to run the IDEA→SPEC pipeline: `/idea-capture` to
  capture the ideation conversation as a structured `IDEA.md`, then
  `/author-spec` to render the matching typed SPEC template.
- Use `spec-review` before executing a spec written by another agent.
- Use `verification` before claiming completion.
- Use `code-review` for reviews; findings lead.
- Use `spec-evidence-governance` only to produce evidence candidates. The approved
  spec and delivery record remain the trusted write boundary.
- Use `diagnosis` before fixing unclear failures or regressions.
- Use `tdd` when a behavior change can be safely expressed as a focused
  automated or scripted check.
- Use `approved-spec-decomposition` or `/decompose-approved-spec` only
  after SPEC.md is approved and the work benefits from vertical HITL/AFK
  slices.

## Cross-Agent Parity

- Copilot reads `AGENTS.md`, `WORKFLOW.md`, and `.agents/skills/**`.
- Claude reads `CLAUDE.md`, `AGENTS.md`, and repo-local `.claude/skills/**`
  when present.
- The default MCP allowlist is `.agents/mcp/approved-defaults.json`; it is
  empty until an approved spec changes it.
- The `.agents/skills/**` copies are the canonical source. Claude-native skill
  copies should be generated from them or kept byte-for-byte aligned.
