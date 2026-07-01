# Lifecycle Router Details

This reference carries the detail removed from
`file://agents/skills/spec-driven-development/SKILL.md` so the loaded
skill stays small. Read it when you need the full lifecycle, status
ownership, or routing rationale.

## When to Read This

Read this reference when:

- deciding whether work needs IDEA, Task SPEC, Contract SPEC, or
  Decision SPEC;
- checking status ownership before moving a SPEC or TASK;
- dispatching multi-slice work;
- verifying cross-family review and model-routing requirements;
- adding or changing canonical skills.

For one active phase, prefer the phase skill directly.

## Full Lifecycle

1. **Preflight** - confirm repo, branch policy, and tooling per
   `AGENTS.md`, `CLAUDE.md`, `STATUS.md`, and preflight.
2. **Orient** - read `DOCUMENTATION_GUIDE.md` when present, active
   project docs, and approved specs relevant to the area.
3. **Predict known failures** - surface likely failure modes, scope
   drift, and ambiguous owner intent before authoring.
4. **Ideate** - resolve constraints, spec type, approaches, open
   owner questions, and recommendation.
5. **Author SPEC** - use `spec-authoring`; `/author-spec` consumes a
   ready IDEA unless the route is fastpath.
6. **Review SPEC** - use `spec-review`; the gate can set
   `approved-pending-owner` or `needs-revision`, never `approved`.
7. **Owner approve** - owner alone sets `status: approved`.
8. **Decompose when needed** - multi-slice Task / Contract SPECs use
   `approved-spec-decomposition` before execution.
9. **Dispatch** - each durable TASK.md anchors one executable slice.
10. **Execute** - implementation follows the approved SPEC / TASK.
11. **Cross-validate** - review runs before task completion using a
    different model family where required.
12. **Verify** - run acceptance commands and record evidence.
13. **Report / close** - fill Completion Report; owner alone closes
    after evidence governance.

## Status Ownership

- Owner alone sets `approved`, `decomposed`, `superseded`, and `closed`.
- Agents may set `draft`, `needs-revision`,
  `approved-pending-owner`, `in-execution`, and `verified` when the
  applicable gate has been satisfied.
- `approved-pending-owner` is a review result, not permission to
  execute.
- TASK.md evidence sections and SPEC Completion Reports are the only
  mutable execution sections unless the owner explicitly reopens
  scope.

The status grammar lives in `file://agents/specs/SPEC.schema.md`.

## Type Routing

- **Fastpath** - small, single-component, reversible,
  owner-directed work that passes every threshold in
  `file://agents/specs/SPEC.fastpath.template.md`.
- **Task SPEC** - concrete, scoped, verifiable implementation with a
  defined endpoint.
- **Contract SPEC** - behavior or protocol that future agents
  implement against: state machines, failure models, file formats,
  observability, or multi-component coordination.
- **Decision SPEC** - binding choice between named options with
  rationale and reversal plan.
- **Research workpad** - evidence gathering before IDEA when the
  problem is not yet crisp enough for a SPEC.

## Citation and Memory Boundary

Agent memory and training are legitimate inputs to ideation and
review reasoning, but artefacts need citable evidence. IDEA.md,
SPEC.md, Completion Reports, and spec evidence candidates cite
facts using the grammar in `file://agents/specs/SPEC.schema.md`.

## Decomposition and Dispatch

Multi-slice Task / Contract SPECs are decomposed into durable TASK.md
files before execution. Each TASK.md owns one vertical slice, records
model lanes, and binds the implementation agent to the parent SPEC.

Non-durable decomposition output is insufficient because later agents
would re-derive scope instead of anchoring on the same contract.

## Cross-Family Validation and Model Routing

TASK.md cross-validation uses a different model family from the
primary implementation lane when required by the decomposition. Before
delegation, model-specific work, dispatch, or non-trivial planning,
read `file://agents/MODEL_ROUTING.md`.

## Skill-Addition Atomicity

Adding a canonical skill is atomic. The same verified change includes:

- `agents/skills/<name>/SKILL.md`
- `.claude/skills/<name>/SKILL.md`
- `agents/SKILL_REGISTRY.md`
- `agents/scripts/fleet-files.txt`
- `agents/scripts/fleet-sync.sh` propagation coverage when needed

Splitting those updates can propagate an incoherent subset to child
repos.
