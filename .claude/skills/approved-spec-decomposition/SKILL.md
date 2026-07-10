---
name: approved-spec-decomposition
description: "BLOCKING. Use after a SPEC.md is approved and before in-execution to emit one TASK.md per executable slice into specs/<id>/tasks/. Each TASK.md carries primary/cross-validation/verification model lanes and gates the parent SPEC's transition approved -> decomposed -> in-execution. Tasks are the source-of-truth dispatchable units that agents execute directly; no external tracker (Linear) or dispatcher (Symphony) is required."
license: internal-only
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls:
      - https://github.com/mattpocock/skills
    borrowed_from:
      - mattpocock/skills to-tickets
    upstream_status: current
    last_audited: 2026-07-08
    audit_cadence: annual
    adoption_status: adapted
    security_review: not-required
    notes: "BES fleet-native decomposition skill. The Wide-refactor exception (expand–contract) section was adapted 2026-07-08 from mattpocock/skills to-tickets @ d574778 (v1.1.0), placed tracker-free on the existing deps / write_scope substrate; the upstream tracker-native coordination was deliberately NOT imported (Lock L1). No executable or tool surface added. Adoption record: specs/2026-07-08-pocock-v1.1-alignment-rebaseline."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Approved Spec Decomposition

This skill is the **authoritative bridge artefact** between an
approved SPEC and dispatchable work. It runs after
`status: approved` and before `status: in-execution`.

It is no longer a planning aid. It produces durable TASK.md files
that Copilot and Claude subagents execute against directly. The
parent SPEC remains the immutable authority (Completion Report
aside); the TASK.md files are the executable contracts for each
slice.

## When to use

- A SPEC.md has front-matter `status: approved` and contains an
  Execution Plan (or Interfaces / Implementation) section
  Checklist (Contract SPEC) that names ≥ 2 distinct slices, OR
- The owner has directed decomposition for parallel execution per
  `file://agents/MODEL_ROUTING.md` "Routing Matrix" (multi-agent
  coding row).

Skip when:

- The SPEC is small enough to execute as one slice; in that case
  emit a single TASK.md and proceed.
- The SPEC is a Decision SPEC (Decision SPECs do not have
  implementation phases; their cascade is by id-citation per
  `file://specs/2026-05-02-studio-principle-ai/SPEC_EVIDENCE.md` §3).

## Preconditions

REFUSE to proceed unless:

1. `<spec_path>` exists with parseable front-matter.
2. `status: approved` (set by owner per
   `file://agents/specs/SPEC.schema.md` §1.3).
3. Acceptance commands present, OR explicit explanation of empty
   list in §4 Acceptance Criteria.
4. Open Questions resolved.
5. Write ownership can be bounded (each slice has disjoint
   `owned_files` per
   `file://specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md`
   §6.1.1).

If any precondition fails, stop and surface the exact blocker with a
file/line citation. Do NOT emit TASK.md files.

## Procedure

1. Read the approved SPEC end-to-end.
2. Read `file://agents/MODEL_ROUTING.md` "Routing Matrix" to map task
   classes to model lanes.
3. Read the parent SPEC's Execution Plan (or Interfaces /
   Implementation) section. Each slice in the plan becomes one TASK.md.
   Prefer thin vertical slices: each TASK should deliver a complete,
   independently verifiable path through the relevant layers instead
   of a horizontal "all schema", "all UI", or "all tests" bucket.
4. For each slice, copy `file://agents/specs/TASK.template.md` to
   `specs/<parent_spec_id>/tasks/T-NN-<slug>.md` and fill in:
   - `id` — `T-NN-<slug>` matching the file name.
   - `parent_spec` — the SPEC's id.
   - `status` — `todo`.
   - `owner` — `unassigned`.
   - `model_route` — primary lane from the
     `file://agents/MODEL_ROUTING.md` "Routing Matrix" for the
     slice's `task_class` (research, implementation, code-review,
     verification, docs, planning). Lane defaults per task class
     live in MODEL_ROUTING.md, not here.
   - `cross_validation_lane` — DIFFERENT model family from
     `model_route`; pick the counterpart family's lane from the
     Routing Matrix.
   - `verification_lane` — same family as primary for mechanical
     verification (lint, test); different family for behavioral
     verification (does the change actually do what the SPEC says).
   - `mode` — `AFK` only when AFK Eligibility (below) is satisfied;
     otherwise `HITL`.
   - `deps` — list of T-IDs that MUST reach `done` before this one
     starts.
   - `write_scope` — `disjoint` for parallel slices; `overlap`
     blocks parallel dispatch and requires a serial integration
     order.
   - `parallelism_evaluated: true`.
   - `acceptance_commands` — subset of the parent SPEC's
     acceptance_commands that prove THIS slice plus any task-local
     verification.
5. Author each TASK.md's body sections per the template:
   - §1 Goal
   - §2 Parent SPEC anchor (cite the SPEC section this slice
     implements)
   - §3 Scope (owned files, read context, out-of-scope)
   - §4 Model dispatch (lane table)
   - §5 Acceptance (commands + criteria)
   - §6 Evidence (left blank for executor)
   - §7 Stop conditions
6. Compute integration order. If any slice has `deps`, it cannot
   start before its dependencies reach `done`. Record the
   topological order in the parent SPEC's §6 Completion Report
   as a Decomposition
   Index that lists `T-NN: <title>` in execution order.
7. Run `cmd://bash agents/scripts/lint-spec.sh
   specs/<parent_spec_id>/SPEC.md` and confirm it does not FAIL:
   exit 0 (clean) or exit 2 (advisory warnings only) both pass; exit 1
   is blocking. (Exit 2 is advisory per the lint's own contract and the
   canonical exit-code mapping — an approved SPEC carrying only advisory
   warnings is not dead-stopped at decomposition.)
8. Surface the decomposition to the owner with the Decomposition
   Index and the Parallelism Decision Record (Decision: `fanout` |
   `local`; Rationale: …; Lanes: …) per
   `file://specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md`
   §8.1.
9. Owner reviews the decomposition. **One-shot approval**, not
   per-task. On owner directive, flip the parent SPEC's status
   `approved → decomposed`. The skill MUST NOT set the status; only
   the owner does (the owner-only `approved` / `decomposed` /
   `superseded` / `closed` class from
   `file://agents/specs/SPEC.schema.md` §1.3).
10. After owner approval, agents may dispatch and execute tasks
    directly (own branch/worktree per slice).

## AFK Eligibility (per task)

Mark a task `AFK` only when ALL of:

- `owned_files` are bounded and disjoint from other AFK slices.
- `acceptance_commands` are explicit and mechanically verifiable.
- No mid-slice owner judgment is required.
- Agent can stop safely on ambiguity (escalate to workpad blocker).
- The cross-validation lane is configured and a different family
  from primary.

Otherwise mark `HITL`.

## Slice Quality

Each TASK.md should be:

- independently verifiable by its own acceptance commands;
- narrow enough to complete without re-planning the parent SPEC;
- complete enough to demo, inspect, or prove one real behavior;
- ordered by explicit dependencies, not by vague implementation
  phases;
- marked `HITL` when owner judgment, design choice, or architecture
  approval is still needed.
- written without concrete file paths or code snippets in the §1/§2
  narrative (they go stale fast) — the sole exception is a
  prototype-produced snippet that encodes a decision more precisely than
  prose (a state machine, reducer, schema, or type shape); the §3
  `owned_files` scope block is exempt and names files explicitly.

## Wide-refactor exception (expand–contract)

Vertical slicing is the default. The exception is a **wide refactor**:
one mechanical change (rename a shared column, retype a shared symbol)
whose **blast radius** fans across the codebase so that no single vertical
slice can land green. Do not force it into a vertical TASK; sequence it as
expand–contract across TASK.md files wired by `deps`:

1. **Expand** — `T-01`: add the new form beside the old so nothing breaks.
   `deps: []`.
2. **Migrate** — `T-02..T-0k`: migrate call sites in batches sized by
   blast radius (per package / per directory). Each batch is its own TASK
   with `deps: [T-01]` and `write_scope: disjoint` where the batches touch
   non-overlapping trees. Acceptance stays green batch-to-batch because the
   old form still exists.
3. **Contract** — `T-final`: delete the old form once no caller remains.
   `deps: [T-02, …, T-0k]` (every migrate batch).
4. **When batches cannot stay green alone** — keep the sequence but mark
   the migrate batches `write_scope: overlap`, dispatch them serially on a
   shared integration branch, and add a final integrate-and-verify TASK
   that runs the parent SPEC's full `acceptance_commands` as the
   integration gate. Green is promised only at that gate; the migrate
   TASKs' own acceptance MAY be limited to typecheck / compile.

This reuses the existing `deps`, `write_scope: disjoint|overlap`, and
integration-gate machinery — expand–contract is the pattern that machinery
was built for; it is named here. Prefer prefactoring first ("make the
change easy, then make the easy change"). Adapted from `mattpocock/skills`
`skills/engineering/to-tickets` @ `d574778` (v1.1.0), placed tracker-free
on our `deps` substrate per
`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md` §11 T2
(Lock L1 — the upstream tracker-native coordination is NOT imported).

## Cross-validation pattern

The cross-validation lane runs between `in-progress` and
`in-review` (different-family rule: Hard Rules below). Procedure,
executor skills, and the same-family-proxy fallback when
cross-family dispatch is unavailable:
[`references/cross-validation-lanes.md`](references/cross-validation-lanes.md).

## Hard Rules

- Do not decompose unapproved specs.
- Do not emit TASK.md without a `cross_validation_lane` of a
  different model family from `model_route`.
- Do not assign overlapping `write_scope` to parallel `AFK` tasks
  without root-manager integration control and serial integration
  order.
- Do not flip the parent SPEC's status to `decomposed`. Owner alone
  does that.
- Do not create a peer authority. Each TASK.md cites its parent
  SPEC; the parent SPEC remains immutable execution authority.
- Do not skip integration verification. After all tasks reach
  `done`, the parent SPEC's full acceptance_commands run as the
  integration gate before flipping to `verified`.
- Do not dispatch AFK work with unresolved owner questions.

## Output shape

After this skill runs, the parent SPEC's directory looks like:

```
specs/<parent_spec_id>/
├── IDEA.md
├── SPEC.md          (status: decomposed, set by owner)
└── tasks/
    ├── T-01-<slug>.md
    ├── T-02-<slug>.md
    └── ...
```

The parent SPEC's Completion Report gains a Decomposition Index:

```markdown
### Decomposition Index

Topological execution order (deps respected):

1. T-01-<slug> (mode: HITL, lanes: <primary> / <cross-family>)
2. T-02-<slug> (mode: AFK, lanes: <primary> / <cross-family>)
3. T-03-<slug> (mode: AFK, deps: [T-01], lanes: <primary> / <cross-family>)
```
