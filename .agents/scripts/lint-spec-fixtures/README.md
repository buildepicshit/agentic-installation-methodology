# lint-spec-fixtures

Test fixtures for `agents/scripts/lint-spec.sh`. Each fixture is a Task
SPEC. The lint script is run against each file and exit code asserted.

| Fixture | Expected exit | Why |
|---|---|---|
| `good-task.md` | `0` | Minimal valid Task SPEC. Front-matter complete, all §9.2 sections present, every claim cites a source per `agents/specs/SPEC.schema.md` §2. |
| `bad-uncited.md` | `1` | Same shape as `good-task.md` but two paragraphs in §1 and §5 omit any citation prefix. Exercises SPEC §19 T10. |
| `bad-missing-section.md` | `1` | Same shape as `good-task.md` but the `## 14. Acceptance Criteria` section is removed. Exercises SPEC §19 T11. |
| `bad-untracked-bundle.md` | `1` | Same shape as `good-task.md`, with a MALFORMED `tracker_ref`. Exercises the surviving FORM half of the tracker_ref rule (`agents/specs/SPEC.schema.md` §1.2). Until 2026-08-05 it exercised the >3-slice Tier 2 trigger, which `agents/OPERATING_MODEL.md` "Work visibility" retired on 2026-07-31 in favour of owner-request-only; the fixture outlived the rule. |
| `bad-fastpath-consequence.md` | `1` | A `type: fastpath` SPEC naming `.github/workflows/ci.yml`. Exercises the Rule 20 CONSEQUENCE bar: an enforcement surface blocks fastpath even though the path is in NO propagation manifest — the case the pre-2026-08-06 path test admitted. |
| `good-fastpath-propagating-doc.md` | `2` | A `type: fastpath` SPEC naming `agents/WORKSPACE_LAYOUT.md`. Exercises the other direction: a manifest-carried path with no consequence is ADVISORY (exit 2), not blocking — the case the path test barred. |
| `bad-fastpath-fenced-files-decoy.md` | `1` | A `type: fastpath` SPEC declaring `.github/workflows/ci.yml` under a section named "Change set", with a FENCED `## Files` earlier in the body. Exercises fence-awareness: if the scanner counts the fenced heading as a section it marks "declaration found", suppressing the whole-body fallback, and the CI gate is never read. Found as a live bypass by the cross-family reviewer against `4621a35`, where it returned exit 0. |
| `bad-fastpath-fenced-completion-report.md` | `1` | A `type: fastpath` SPEC with a FENCED `## Completion Report` in §1, above a real "Rotate the GitHub PAT" claim. Exercises the other half of fence-awareness: an early exemption swallows the secrets claim it exists to catch. Same origin, also exit 0 under `4621a35`. |
| `good-fastpath-declined-gate.md` | `0` | A `type: fastpath` SPEC whose §2 names three documents and no guard, but whose §5.2 Residual risk names a hook it CONSIDERED and DECLINED to change, and says no credential is touched. Exercises mention-immunity (2026-08-07): both fastpath tests read the change-set DECLARATION, not the whole document. Before the fix this fixture failed with 2 errors — one on the hook path, one on the word `credential` — i.e. the guard taxed the honest write-up and would have stayed silent had the paragraph been omitted. |

Authority: `specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§10.5 (lint requirements), §19 T09–T11 (test cases).

Run:

```sh
bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/good-task.md
bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/bad-uncited.md
bash agents/scripts/lint-spec.sh agents/scripts/lint-spec-fixtures/bad-missing-section.md
```
