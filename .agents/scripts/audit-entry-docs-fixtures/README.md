# audit-entry-docs fixtures

Test fixtures for `agents/scripts/audit-entry-docs.sh`. Each
fixture simulates a repo's root-level entry-doc state. The auditor
runs in single-repo mode; fixtures are not classified as fleet
repos (the auditor falls back to internal-repo audit with a WARN).

| Fixture | Expected | Why |
|---|---|---|
| `good-internal/` | PASS (exit 0) | Has `AGENTS.md` referencing Fleet Rule Origination, `CLAUDE.md` starting with `@AGENTS.md`, and a `WORKFLOW.md` in the composed shape: comments-only front-matter + all four fleet-body markers. (Repaired 2026-07-30 — it had rotted to FAIL when the body-drift check landed; `specs/2026-07-30-workflow-yaml-dispatcher-purge/SPEC.md`.) |
| `bad-no-agents-md/` | FAIL (exit 1) | Missing `AGENTS.md` entirely. Blocking — AGENTS.md is the canonical entry doc per OPERATING_MODEL Source Of Truth. |
| `bad-claude-md-no-import/` | FAIL (exit 1) | `CLAUDE.md` does not import `@AGENTS.md` in the first 10 lines. Blocking — CLAUDE.md must import the canonical content per the agent-agnostic posture. |
| `bad-workflow-dispatcher-yaml/` | FAIL (exit 1) | `WORKFLOW.md` front-matter carries Symphony-era dispatcher config (tracker/polling/workspace/codex). Every other check passes — body markers present, entry docs valid — so the failure isolates the dispatcher-era front-matter allowlist gate. |
| `bad-workflow-dispatcher-yaml-crlf/` | FAIL (exit 1) | Same dispatcher config but with CRLF line endings. Regression fixture for the fail-open class the cross-family gate-2 review caught: an exact `^---$` opener check treats `---\r` as "no front matter" and skips the gate entirely; the gate CR-strips before matching. |

Section naming and Fleet Rule Origination references are
ADVISORY (warned in stderr but do not block). Each repo titles
its sections as fits its content; the fleet-level requirement is
that the file exists and that CLAUDE.md (if present) imports
AGENTS.md.

Run the auditor in single-repo mode against each fixture:

```sh
cd agents/scripts/audit-entry-docs-fixtures/good-internal
bash ../../audit-entry-docs.sh   # exit 0
```

Authority: `file://specs/2026-05-02-fleet-harness-enhancements/SPEC.md`
§13 (Test Plan).
