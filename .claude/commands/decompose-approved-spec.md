# Decompose Approved Spec

Use this slash-command after a `SPEC.md` is `status: approved` and the
work is large enough to split into vertical HITL or AFK execution
slices.

Argument: `<spec_path>` — repo-relative path to the approved `SPEC.md`.

1. Refuse unless `<spec_path>` exists and front matter has
   `status: approved`.
2. Read `agents/skills/approved-spec-decomposition/SKILL.md` (or the
   repo-local `.agents/skills/approved-spec-decomposition/SKILL.md`)
   and follow its Procedure — the skill owns the mechanics.
3. Read the approved SPEC in full.
4. Emit one durable TASK.md per slice at
   `specs/<parent_spec_id>/tasks/T-NN-<slug>.md` (child repos:
   `.agents/specs/<parent_spec_id>/tasks/`) from
   `agents/specs/TASK.template.md`, with front-matter per
   `agents/specs/SPEC.schema.md` §1.4 — including `model_route`,
   `cross_validation_lane` (different model family REQUIRED), and
   `verification_lane` from `agents/MODEL_ROUTING.md`.
5. Keep every task subordinate to the approved SPEC.
6. Mark slices `AFK` only when scope, ownership, and verification are
   explicit and no owner decision is needed mid-slice.
7. Append the Decomposition Index (topological execution order, modes,
   lanes) to the parent SPEC's Completion Report and surface it to the
   owner. The owner alone flips `approved → decomposed`.

Use the `approved-spec-decomposition` skill. Do not edit source files
or dispatch workers unless the active approved SPEC/workflow authorizes
that next step.
