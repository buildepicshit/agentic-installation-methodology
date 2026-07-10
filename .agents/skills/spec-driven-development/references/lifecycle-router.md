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

## Lifecycle

The 5-gate flow is the DEFAULT
(`file://specs/2026-06-30-operating-model-lean-down/SPEC.md` §7). The full
13-phase path MAY be used for high-risk or multi-agent work but MUST NOT be
the default.

### 5-gate default

1. **Align** - preflight (repo, branch policy, tooling per `AGENTS.md`,
   `CLAUDE.md`, `STATUS.md`); orient (`DOCUMENTATION_GUIDE.md` + active docs
   + relevant approved specs); and predict likely failure modes, scope
   drift, and ambiguous owner intent.
2. **Spec** - ideate (constraints, type, approaches, owner questions,
   recommendation) then author via `spec-authoring` (`/author-spec` consumes
   a ready IDEA unless the route is fastpath).
3. **Approve** - `spec-review` sets `approved-pending-owner` or
   `needs-revision` (never `approved`); owner alone sets `status: approved`.
4. **Execute** - implementation follows the approved SPEC.
5. **Verify** - run acceptance commands, record evidence, fill the
   Completion Report; owner alone closes after evidence governance.

### Full path (high-risk / multi-agent exception)

Insert between Approve and Execute: **Decompose** (multi-slice Task /
Contract SPECs use `approved-spec-decomposition` to emit durable TASK.md),
**Dispatch** (each TASK.md anchors one executable slice), and
**Cross-validate** (review on a different model family where required).

## Status Ownership

The status grammar and the owner-only status class (`approved`,
`decomposed`, `superseded`, `closed`) are canonical in
`file://agents/specs/SPEC.schema.md` §1.3.
`approved-pending-owner` is a review result, not permission to
execute. TASK.md evidence sections and SPEC Completion Reports are
the only mutable execution sections unless the owner explicitly
reopens scope.

## Type Routing

Fastpath / Task / Contract / Decision selection is owned by
`file://agents/skills/spec-authoring/SKILL.md` "Type Selection";
fastpath thresholds live in
`file://agents/specs/SPEC.fastpath.template.md`. Use a research
workpad for evidence gathering when the problem is not yet crisp
enough for an IDEA.

## Citation and Memory Boundary

Memory is input, never evidence: artefacts cite facts using the
grammar in `file://agents/specs/SPEC.schema.md` §2.

## Decomposition, Dispatch, and Cross-Family Validation

Multi-slice mechanics (durable per-slice TASK.md, model lanes,
integration order) are owned by
`file://agents/skills/approved-spec-decomposition/SKILL.md`.
Cross-family review semantics are stated once in
`file://agents/MODEL_ROUTING.md` Rule 20; read MODEL_ROUTING before
dispatch, delegation, model-specific work, or non-trivial planning.

## Skill-Addition Atomicity

Adding a canonical skill is atomic. The same verified change includes:

- `agents/skills/<name>/SKILL.md`
- `.claude/skills/<name>/SKILL.md`
- `agents/SKILL_REGISTRY.md`
- `agents/scripts/fleet-files.txt`
- `agents/scripts/fleet-sync.sh` propagation coverage when needed

Splitting those updates can propagate an incoherent subset to child
repos.
