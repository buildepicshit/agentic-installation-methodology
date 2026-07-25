# Review Spec

Single source: `/review-spec` is served by the `review-spec` skill
(`agents/skills/review-spec/SKILL.md`), which owns the
gate logic, status-transition table, and output contract.

The gate is BLOCKING and MUST NOT set `status: approved` — owner only
(`agents/specs/SPEC.schema.md` §5).
