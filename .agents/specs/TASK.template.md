---
id: T-NN-kebab-case-slice
parent_spec: YYYY-MM-DD-kebab-case-spec-id
status: todo
owner: unassigned
model_route: gpt-5.5
cross_validation_lane: claude-opus-4-8
verification_lane: gpt-5.5
mode: HITL
deps: []
write_scope: disjoint
parallelism_evaluated: true
acceptance_commands: []
---

<!--
Per-task artefact emitted by the `/decompose-approved-spec` workflow
from an approved SPEC's Execution Plan section. TASK.md is the
dispatchable unit, dispatched directly to agents. The parent SPEC
remains the authority — this file IS NOT a peer authority; it
carries the slice's executable scope, model lanes, verification
commands, and evidence trail.

Front-matter contract: `file://agents/specs/SPEC.schema.md` §1.4.
`cross_validation_lane` MUST be a different model family from
`model_route`; owner alone sets `status: done`.

Citation discipline applies: every factual claim in §3 (Scope), §4
(Read context), and §6 (Evidence) MUST carry a citation prefix per
`file://agents/specs/SPEC.schema.md` §2.
-->

# TASK: [Slice Title]

## 1. Goal

One sentence. The user-, contract-, or workflow-visible outcome this
slice delivers.

## 2. Parent SPEC anchor

This task implements §[NN] [section title] of
`file://specs/{{parent_spec}}/SPEC.md`. The parent SPEC remains the
authority for what is in scope. This file is the executable
contract for THIS slice only.

## 3. Scope

### 3.1 Owned files

Files this worker MAY edit:

- `path/to/file.ext` — [why this file is in scope; cite the parent
  SPEC section that names it].

### 3.2 Read context

Files this worker MUST read before editing:

- `file://AGENTS.md`
- `file://specs/{{parent_spec}}/SPEC.md`
- `file://agents/MODEL_ROUTING.md` (before any subagent dispatch)
- [other repo-specific reads]

### 3.3 Out of scope

Explicit non-goals for this slice. Surface discovered out-of-scope
work as follow-ups per
`file://agents/templates/WORKFLOW.body.md` "BES-specific guardrails".

## 4. Model dispatch

| Lane | Model | Role |
|---|---|---|
| Primary | `{{model_route}}` | Implementation + workpad management. |
| Cross-validation | `{{cross_validation_lane}}` | Independent diff review before Human Review. Different family from primary. |
| Verification | `{{verification_lane}}` | Run acceptance_commands; capture fresh evidence. |

Subagent dispatch follows
`file://agents/templates/WORKFLOW.body.md` Step 2.

## 5. Acceptance

### 5.1 Acceptance commands

Each entry in front-matter `acceptance_commands` MUST exit 0 before
this task flips `in-progress → in-review`. List them here with a
one-line rationale:

- `cmd://...` — [what this proves].

### 5.2 Acceptance criteria

- [ ] AC-1: [criterion].
- [ ] AC-2: [criterion].

## 6. Evidence

Filled by the executor before `in-review`:

- Files changed: [list].
- Commands run + exit codes: [list].
- Cross-validation findings: [summary; full report linked from PR].
- Cross-validation receipt (REQUIRED — see code-review SKILL
  "Tool-Receipt Block"): [lane + model pin / invocation or validator
  output / session-log id / wall clock / tokens where exposed].
- PR (when opened): [URL].
- Residual risk: [if any].

## 7. Stop conditions

Reasons to halt and route back to the owner or root manager:

- Owner judgment required mid-slice.
- Discovered scope expansion.
- Cross-validation surfaced a blocker.
- Acceptance commands cannot pass under the bounded scope.
- Required external auth/secret missing.
