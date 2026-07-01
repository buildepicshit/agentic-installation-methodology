# Decompose Approved Spec

Use this workflow after a `SPEC.md` reaches `status: approved` and
before agents begin execution. It is the **authoritative
decomposition phase** of the v1 lifecycle, slotting between owner
approval and `in-execution`:

```
draft → approved-pending-owner → approved → DECOMPOSED → in-execution → verified → closed
                                            ^^^^^^^^^^^
                                            this workflow
```

(Side-exit: `approved`/`decomposed` specs retired before execution
flip to the owner-set terminal `superseded` per
`agents/specs/SPEC.schema.md` §1.3; such specs are not
decomposable.)

This workflow uses the `approved-spec-decomposition` skill at
`agents/skills/approved-spec-decomposition/SKILL.md`. It produces
durable `TASK.md` artefacts under `specs/<id>/tasks/`. Each TASK.md
is the dispatchable unit, executed directly by agents, and carries
the model-lane assignments (primary / cross-validation /
verification) from `agents/MODEL_ROUTING.md`. No external tracker
(e.g. Linear) or dispatcher (e.g. Symphony) is required.

The SPEC remains the immutable authority. TASK.md files are NOT
peers; they are the executable contracts for individual slices.

## Inputs

- `<spec_path>` — repo-relative path to an approved `SPEC.md`.
- Optional `<slice_target>` — specific area to decompose first when
  doing partial decomposition (rare; default is full decomposition).

## Preconditions

REFUSE to proceed unless:

1. `<spec_path>` exists and front-matter parses.
2. `status: approved` (set by owner).
3. Acceptance commands present in the SPEC, or §12 explicitly
   explains the empty list.
4. Open Questions resolved.
5. Each candidate slice has bounded write ownership.

If any precondition fails, surface the exact blocker with a
file/line citation. Do NOT emit TASK.md files.

## Procedure

1. Read the approved SPEC end-to-end.
2. Read `agents/MODEL_ROUTING.md` (Routing Matrix) and the
   `approved-spec-decomposition` skill.
3. Read the parent SPEC's §11 Execution Plan (Task) or
   §11/§14/§15 (Contract). Each named slice becomes one TASK.md.
4. Create the directory `specs/<parent_spec_id>/tasks/` if it does
   not exist.
5. For each slice, copy `agents/specs/TASK.template.md` to
   `specs/<parent_spec_id>/tasks/T-NN-<slug>.md` and fill the
   front-matter and body sections per the skill's "Procedure" §4–§5.
6. Compute topological execution order. If any slice has `deps`, it
   cannot start before its dependencies reach `status: done`.
7. Append a "Decomposition Index" subsection to the parent SPEC's
   Completion Report (Task §17 / Contract §19) listing tasks in
   execution order with their mode and model lanes.
8. Run `bash agents/scripts/lint-spec.sh
   specs/<parent_spec_id>/SPEC.md` and confirm exit 0.
9. Surface to the owner: the Decomposition Index, the Parallelism
   Decision Record (per
   `specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md`
   §8.1), and any AFK eligibility decisions.
10. Owner reviews and, on directive, flips parent SPEC status
    `approved → decomposed`. The workflow MUST NOT set the status;
    only the owner does.
11. After approval, agents dispatch and execute the TASK.md files
    directly (one branch/worktree per slice). No external tracker or
    dispatcher is required. If one is ever wired up, a task MAY be
    mirrored to it — optional only, never a precondition.

## Output Shape

```
specs/<parent_spec_id>/
├── IDEA.md
├── SPEC.md          (status: decomposed)
└── tasks/
    ├── T-01-<slug>.md
    ├── T-02-<slug>.md
    └── T-03-<slug>.md
```

Decomposition Index appended to parent SPEC's Completion Report:

```markdown
### Decomposition Index

Topological execution order (deps respected):

1. T-01-<slug> (mode: HITL, lanes: gpt-5.5 / claude-opus-4-8)
2. T-02-<slug> (mode: AFK, lanes: claude-opus-4-8 / gpt-5.5)
3. T-03-<slug> (mode: AFK, deps: [T-01], lanes: gpt-5.5 / claude-opus-4-8)

Parallelism decision: fanout
Rationale: Tasks T-02 and T-03 have disjoint write_scope and no
shared state; cross-validation lanes are configured for both.
```

## Hard Rules

- Do not decompose unapproved specs.
- Do not emit TASK.md without primary, cross-validation, and
  verification model lanes filled in.
- Do not assign overlapping `write_scope` to parallel AFK tasks.
- Do not flip parent SPEC status to `decomposed`. Owner alone does.
- Do not let TASK.md become a peer authority to SPEC.md.
- Do not skip the integration gate. After all tasks reach `done`,
  the parent SPEC's full `acceptance_commands` MUST pass before
  the SPEC flips `decomposed → in-execution → verified`.
- Do not pair `model_route` and `cross_validation_lane` from the
  same model family.
