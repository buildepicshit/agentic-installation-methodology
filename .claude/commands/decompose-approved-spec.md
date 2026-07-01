# Decompose Approved Spec

Use this slash-command after a `SPEC.md` is `status: approved` and the
work is large enough to split into vertical HITL or AFK execution
slices.

Argument: `<spec_path>` — repo-relative path to the approved `SPEC.md`.

1. Refuse unless `<spec_path>` exists and front matter has
   `status: approved`.
2. Read `agents/skills/approved-spec-decomposition/SKILL.md` or the
   repo-local `.agents/skills/approved-spec-decomposition/SKILL.md`.
3. Read the approved SPEC in full.
4. Produce a decomposition plan with `slice_id`, `mode`, `goal`,
   `owned_files`, `read_context`, `dependencies`, `acceptance_evidence`,
   `review_order`, and `stop_conditions`.
5. Keep every slice subordinate to the approved SPEC.
6. Mark slices `AFK` only when scope, ownership, and verification are
   explicit and no owner decision is needed mid-slice.
7. Include integration order and final verification expectations.

Use the `approved-spec-decomposition` skill. Do not edit source files
or dispatch workers unless the active approved SPEC/workflow authorizes
that next step.
