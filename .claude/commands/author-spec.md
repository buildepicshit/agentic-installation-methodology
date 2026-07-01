# Author Spec

Use this slash-command to author a `SPEC.md` from an `IDEA.md` that
has reached `status: ready-for-spec`.

Pre-conditions (REQUIRED — refuse to proceed otherwise):

- `IDEA.md` exists in the target spec folder.
- `IDEA.md` front-matter `status: ready-for-spec`.
- `IDEA.md` front-matter `implies_spec_type:` is one of `task` |
  `contract` | `decision`.

Workflow:

1. Read `AGENTS.md`, `CLAUDE.md`, `STATUS.md`, and the IDEA.md.
2. Read `agents/specs/SPEC.schema.md` for shared conventions.
3. Select the template by `implies_spec_type:`:
   - `task` → `agents/specs/SPEC.task.template.md`
   - `contract` → `agents/specs/SPEC.contract.template.md`
   - `decision` → `agents/specs/SPEC.decision.template.md`
4. Author `SPEC.md` in the spec folder, populated from the IDEA and the
   conversation. Use the `spec-authoring` skill.
5. Set SPEC front-matter:
   - `type:` to the chosen subtype
   - `status: draft`
   - `ideated_in:` to the relative path of `IDEA.md`
6. Fill `Current System Facts` with cited facts only (citation grammar
   per `agents/specs/SPEC.schema.md` §2).
7. Mark unresolved decisions as `Open Questions`; mark questions only
   the owner can answer as `owner-blocking`.
8. Stop at the spec. Do not implement. Hand off to `/review-spec`.

Use the `spec-authoring` skill.
