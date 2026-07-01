# Fleet Enforce

(bes-fleet-policy only.) Issue and apply a fleet directive across
target child repos under owner authority.

Use the `fleet-enforce` skill at
`.agents/skills/fleet-enforce/SKILL.md`.

## Prerequisites

- Operating from `bes-fleet-policy` (not a child repo).
- Owner has approved a fleet rule change (closed SPEC, explicit
  `owner://transcript-<date>`, or legacy triaged AGENT_FEEDBACK
  entry).
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
6. On success, flip directive status `pending → applied`,
   commit + push.
7. Update any legacy AGENT_FEEDBACK entries this directive resolves
   (append Status line citing the bes-fleet-policy directive
   commit).

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
