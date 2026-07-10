# Fleet Enforce

(bes-fleet-policy only.) Issue and apply a fleet directive across
target child repos under owner authority.

Use the `fleet-enforce` skill at
`agents/skills/fleet-enforce/SKILL.md` (mirror:
`.claude/skills/fleet-enforce/SKILL.md`).

Arguments: `<directive_id>` (kebab-case, date-prefixed slug),
`<target_repos>` (subset of fleet locations or `all`), `<authority>`
(`file://` SPEC reference, `bes-fleet-policy@<sha>`,
`owner://transcript-<date>`, or a triaged
`AGENT_FEEDBACK://<repo>/<entry-id>` — valid authority grammar per
`agents/scripts/fleet-enforce.sh`).

## Prerequisites

- Operating from `bes-fleet-policy` (not a child repo).
- Owner has approved the fleet rule change; authority is named and
  verifiable (one of the forms above).
- Action is bounded, scriptable, idempotent.
- Compliance check is a read-only shell expression.

## Procedure

1. Author directive at `agents/fleet-directives/<YYYY-MM-DD>-<slug>.md`
   per `agents/fleet-directives/README.md` format. Include
   front-matter (id, issued_by, target_repos, authority, type,
   status: pending, created, optional deadline / supersedes) +
   body sections (1. Summary, 2. Action, 3. Compliance check,
   4. Authority chain, 5. Rollback).
2. Validate:
   `bash agents/scripts/audit-fleet-compliance.sh --validate <id>`.
3. Commit the directive (Conventional Commit:
   `fleet-directive: <id> — <summary>`).
4. Apply: `bash agents/scripts/fleet-enforce.sh <id>`. Iterates
   target repos, runs action steps, runs compliance check, stages
   explicitly, commits, pushes.
5. Audit: `bash agents/scripts/audit-fleet-compliance.sh`.
6. On success, flip directive status `pending → applied` and resolve
   any AGENT_FEEDBACK entries the directive closes; commit + push.

## Hard rules

- ONLY bes-fleet-policy issues directives.
- Directives MUST cite owner authority.
- No `git add -A`; explicit staging.
- Respect per-target commit-msg hooks (Conventional Commits,
  INSTRUCTION_APPROVED, AI-attribution block).
- Never flip SPEC status to `approved`, `decomposed`,
  `superseded`, or `closed`.
- Failed compliance after apply → flip back to `pending` with
  `failed_targets`. Do NOT delete the directive.
- Directives immutable once `applied`; subsequent changes
  require a new directive that `supersedes:` the prior.
