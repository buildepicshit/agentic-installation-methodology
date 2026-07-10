# Fleet Directives

Cross-repo enforcement records issued by `bes-fleet-policy` under
owner authority. Each directive captures: what changed in fleet
policy, which target repos must apply the change, how to apply,
and how to verify compliance.

Authority:
`file://agents/skills/fleet-enforce/SKILL.md`;
`file://agents/workflows/fleet-enforce.md`;
`file://agents/scripts/fleet-enforce.sh`;
`file://agents/scripts/audit-fleet-compliance.sh`.

## Directive file format

Path: `agents/fleet-directives/<YYYY-MM-DD>-<kebab-slug>.md`.

Front-matter:

```yaml
---
id: 2026-05-13-example-directive
issued_by: bes-fleet-policy
target_repos: [ACTOCCATUD, Floom, IKTO, UsefulIdiots, Mimir, Wick, Assets, agentic-installation-methodology]
# or: all-internal | all-oss | all-local | all
authority: bes-fleet-policy@<sha>
# or: file://specs/<spec-id>/SPEC.md
# or: owner://transcript-<date>
# or: AGENT_FEEDBACK://<repo>/<entry-id>
type: file-recompose | manifest-update | hook-config | spec-status-flip | other
status: pending
created: 2026-05-13
deadline: null         # optional ISO date
supersedes: null       # optional previous directive id
failed_targets: []     # populated only when status flips back to pending
---
```

Body sections:

### 1. Summary

One paragraph describing the change. What was the source-of-truth
update? What problem does this fix?

### 2. Action

Per-target shell-scriptable steps. Example:

```bash
# For each target repo:
bash bes-fleet-policy/agents/scripts/fleet-sync.sh <target> internal
# Optional additional steps...
```

Steps MUST be:

- Idempotent (running twice produces the same state).
- Bounded (no open-ended owner judgment).
- Respectful of hooks (no `--no-verify`, no `git add -A`).

### 3. Compliance check

A shell expression that exits 0 when the target is in compliance.
Example:

```bash
grep -q "^## Applicability" "$TARGET/WORKFLOW.md"
```

The check MUST be:

- Single-line or single-pipeline.
- Exit 0 = compliant; non-0 = drift.
- Read-only (no side effects).

### 4. Authority chain

- Cite the bes-fleet-policy commit (`bes-fleet-policy@<sha>`)
  that landed the source-of-truth change.
- Cite the SPEC (if any) that authorised the change.
- Cite the owner transcript or AGENT_FEEDBACK entry that
  surfaced the requirement.

### 5. Rollback

How to revert this directive if it proves wrong. Either a reverse
shell snippet or a reference to the superseding directive that
would undo the change.

## Status lifecycle

```
pending  →  applied  →  expired       (lifecycle complete; archived)
           ↘  (compliance fail)
              pending (with failed_targets)  → applied (after fix)

         or:
         applied  →  superseded  (later directive replaces this one)
```

Owner alone flips `applied → expired` or marks `superseded`.
fleet-enforce.sh handles `pending → applied`. Audit may flip
`applied → pending` with failed_targets on drift detection.

## Hard rules

- Directives are immutable once `applied`. Edits go through a new
  superseding directive.
- Directives MUST cite owner authority.
- Compliance checks MUST be read-only.
- Action steps MUST be idempotent and bounded.
- Owner alone flips terminal statuses (`expired`, `superseded`).
- Failed targets MUST be listed in `failed_targets:` with citation
  per failure.
