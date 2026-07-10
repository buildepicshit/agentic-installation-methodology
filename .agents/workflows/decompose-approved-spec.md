# Decompose Approved Spec

Single source: the `/decompose-approved-spec` slash-command
(`.claude/commands/decompose-approved-spec.md`) is the invocation
surface; the `approved-spec-decomposition` skill
(`agents/skills/approved-spec-decomposition/SKILL.md`) owns the
mechanics — preconditions, TASK.md emission
(`specs/<id>/tasks/T-NN-<slug>.md` with model lanes per
`agents/MODEL_ROUTING.md`), the Decomposition Index, and the
owner-only `approved → decomposed` flip. Front-matter contract:
`agents/specs/SPEC.schema.md` §1.4.
