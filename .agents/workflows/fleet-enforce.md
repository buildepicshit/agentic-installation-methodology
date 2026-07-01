# Fleet Enforce Workflow

Use this workflow to issue and apply a structured directive
across one or more fleet repos. Runs ONLY from `bes-fleet-policy`
under owner authority.

Companion skill:
`file://agents/skills/fleet-enforce/SKILL.md`.
Slash command: `/fleet-enforce`.

## Inputs

- `<directive_id>`: kebab-case slug (e.g.
  `2026-05-13-recompose-workflow-applicability`).
- `<target_repos>`: subset of fleet locations or `all`.
- `<authority>`: bes-fleet-policy commit SHA, SPEC reference, or
  `owner://transcript-<date>`.

## Preconditions

REFUSE to proceed unless:

1. The agent is operating inside `bes-fleet-policy`. Other repos
   cannot issue directives.
2. Authority is named and verifiable
   (`file://` / `owner://` / `bes-fleet-policy@<sha>`).
3. The action is bounded — shell-scriptable, single-pass, no
   open-ended owner judgment mid-execution.
4. The compliance check is a shell expression that exits 0 / non-0.
5. `block-git-add-all`, `block-edit-on-main`, `block-push-to-main`,
   `block-verify-bypass`, `block-ai-attribution` hooks remain
   active — directives MUST respect them.

## Procedure

1. **Author the directive** at
   `agents/fleet-directives/<directive_id>.md`. Use the format
   in `file://agents/fleet-directives/README.md`. Front-matter
   includes: id, issued_by, target_repos, authority, type, status,
   created, deadline (optional), supersedes (optional).
2. **Validate**:
   `bash agents/scripts/audit-fleet-compliance.sh --validate
   <directive_id>`. Checks format, citation, and that target_repos
   resolves to known fleet locations.
3. **Commit the directive** in bes-fleet-policy:
   `git add agents/fleet-directives/<directive_id>.md`
   `git commit -m "fleet-directive: <directive_id> — <short summary>"`
   `git push origin main`
4. **Apply**:
   `bash agents/scripts/fleet-enforce.sh <directive_id>`. The
   script iterates target_repos, executes action steps per target,
   runs compliance check, stages changes explicitly, commits with
   message referencing the directive id, pushes.
5. **Audit**:
   `bash agents/scripts/audit-fleet-compliance.sh` confirms all
   targets pass the compliance check. Surfaces any failed targets
   for owner attention.
6. **Update directive status** in bes-fleet-policy: flip front-
   matter `status: pending` → `status: applied` after a successful
   compliance audit. Commit + push.
7. **Surface any legacy AGENT_FEEDBACK entries this directive
   resolves**: if legacy per-repo `AGENT_FEEDBACK.md` files exist,
   walk entries tagged with this directive in their suggested-fix /
   status fields. Update those entries' Status sections to
   `resolved` with citation to the bes-fleet-policy directive
   commit.

## Output Shape

```
agents/fleet-directives/<directive_id>.md          (status: applied)

per-target commits:
  <repo>@<sha>  chore(fleet-directive): apply <directive_id> ...

legacy per-target AGENT_FEEDBACK.md entries (if any):
  Status line appended: "resolved by bes-fleet-policy@<sha> directive <id>"
```

## Hard rules

- ONLY bes-fleet-policy issues directives.
- Directives MUST cite owner authority. No agent-initiated.
- Enforcer MUST stage files explicitly (no `git add -A`).
- Enforcer MUST respect per-target commit-msg hooks (Conventional
  Commits, INSTRUCTION_APPROVED env handling, AI-attribution
  block).
- Enforcer MUST NOT flip SPEC status to `approved`, `decomposed`,
  `superseded`, or `closed`.
- Failed compliance after apply: flip directive back to `pending`
  with `failed_targets:` listing each failure with citation. Do
  NOT delete the directive.
- Directives are immutable once `applied`. Subsequent changes
  require a new directive that `supersedes:` the prior.
