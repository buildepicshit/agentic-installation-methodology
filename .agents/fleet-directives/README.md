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
# or: all-internal | all-oss | all
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

## Worked example

Filename: `2026-05-13-recompose-workflow-applicability.md`

```yaml
---
id: 2026-05-13-recompose-workflow-applicability
issued_by: bes-fleet-policy
target_repos: [ACTOCCATUD, Floom, IKTO, UsefulIdiots, Mimir, Wick, Assets, agentic-installation-methodology]
authority: bes-fleet-policy@bb60488
type: file-recompose
status: applied
created: 2026-05-13
deadline: null
supersedes: null
failed_targets: []
---

# Directive: Recompose WORKFLOW.md with Applicability preamble

## 1. Summary

ACTOCCATUD agents reported that WORKFLOW.md read as a setup
checklist requiring Linear + Symphony install. The canonical body
got a new Applicability preamble that clarifies it's the Symphony
per-issue prompt template, not a setup doc. Per-repo WORKFLOW.md
must be re-composed with the new body.

## 2. Action

For each target repo:

```bash
bash bes-fleet-policy/agents/scripts/fleet-sync.sh <target> <posture>
```

`fleet-sync.sh` auto-recomposes WORKFLOW.md as part of internal
sync. OSS posture sync lays content in working tree only.

## 3. Compliance check

```bash
grep -q "^## Applicability" "$TARGET/WORKFLOW.md"
```

## 4. Authority chain

- `bes-fleet-policy@bb60488` — fleet body update.
- `owner://transcript-2026-05-13` — owner directive flagging
  ACTOCCATUD agent complaints.

## 5. Rollback

Issue a new directive that recomposes WORKFLOW.md from the prior
fleet body. Cite the bes-fleet-policy commit predating bb60488.
```

## Hard rules

- Directives are immutable once `applied`. Edits go through a new
  superseding directive.
- Directives MUST cite owner authority.
- Compliance checks MUST be read-only.
- Action steps MUST be idempotent and bounded.
- Owner alone flips terminal statuses (`expired`, `superseded`).
- Failed targets MUST be listed in `failed_targets:` with citation
  per failure.
