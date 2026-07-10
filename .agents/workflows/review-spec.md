# Review Spec

Single source: the `/review-spec` slash-command
(`.claude/commands/review-spec.md`) is the invocation surface; the
`spec-review` skill (`agents/skills/spec-review/SKILL.md`) owns the
gate logic, status-transition table, and output contract.

The gate is BLOCKING and MUST NOT set `status: approved` — owner only
(`agents/specs/SPEC.schema.md` §5).
