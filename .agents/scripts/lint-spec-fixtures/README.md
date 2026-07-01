# lint-spec-fixtures

Test fixtures for `agents/scripts/lint-spec.sh`. Each fixture is a Task
SPEC. The lint script is run against each file and exit code asserted.

| Fixture | Expected exit | Why |
|---|---|---|
| `good-task.md` | `0` | Minimal valid Task SPEC. Front-matter complete, all §9.2 sections present, every claim cites a source per `agents/specs/SPEC.schema.md` §2. |
| `bad-uncited.md` | `1` | Same shape as `good-task.md` but two paragraphs in §1 and §5 omit any citation prefix. Exercises SPEC §19 T10. |
| `bad-missing-section.md` | `1` | Same shape as `good-task.md` but the `## 14. Acceptance Criteria` section is removed. Exercises SPEC §19 T11. |

Authority: `specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§10.5 (lint requirements), §19 T09–T11 (test cases).

Run:

```sh
bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/good-task.md
bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/bad-uncited.md
bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/bad-missing-section.md
```
