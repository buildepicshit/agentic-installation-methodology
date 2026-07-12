---
name: repo-orientation
description: Use at the start of work in any BES repo to build a current, cited map of instructions, repo state, verification gates, active plans, and likely risk before editing.
license: internal-only
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls: []
    borrowed_from: []
    upstream_status: not-applicable
    last_audited: 2026-06-05
    audit_cadence: annual
    adoption_status: bes-native
    security_review: not-required
    notes: "BES fleet-native skill."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Repo Orientation

Use this before planning or editing.

## Steps

1. Read the nearest `AGENTS.md`.
2. If present, read `CLAUDE.md`, `STATUS.md`,
   `.agents/DOCUMENTATION_GUIDE.md`, and the docs linked by `AGENTS.md`.
   `WORKFLOW.md` is the per-repo engagement contract; read its
   Section 1 (Universal) — it is the whole contract for every agent.
3. Read `SESSION_JOURNAL.md` at the repo root (last 3 entries).
   It tells you what the previous agent did, what was left dirty,
   and what to pick up. If absent, copy from
   `agents/templates/SESSION_JOURNAL.template.md` (or the propagated
   `.agents/templates/SESSION_JOURNAL.template.md` in a child repo).
4. Before dispatch, delegation, model-specific work, or
   multi-agent review, read `agents/MODEL_ROUTING.md` or the
   propagated `.agents/MODEL_ROUTING.md`.
5. Check git state with `git status --short --branch`.
6. Identify the active branch, tracking branch, untracked files,
   and unrelated local changes.
7. Identify the repo's verification gate and any hook setup
   requirements.
8. Locate the task's likely files with `rg` and `rg --files`.
9. If the area is unfamiliar, zoom out one abstraction layer: map the
   relevant modules, callers, data flow, and docs before choosing edit
   points.
10. Report only verified facts. Cite files or command output.

## Output

- Target repo and branch.
- Source-of-truth docs read.
- Model-routing source read when delegation or model selection is in scope.
- Relevant files or directories.
- One-layer-up module/caller map when the area is unfamiliar.
- Verification commands.
- Documentation placement constraints for this task.
- Local changes that must be preserved — REAL content changes only. A
  stat-dirty file (mtime touched, identical to HEAD) is clean; say nothing.
- Open questions — only a genuine owner DECISION that blocks the task. If
  none, say "none" and proceed. Do not manufacture questions to fill the slot.

## Hard Rules

- Do not edit during orientation.
- Do not rely on memory when repo docs can answer the question.
- If instructions conflict, stop and report the conflict.
- A clean tree with nothing owed is the success state, not a prompt to find
  something to flag. Report it in one line and move to the task
  (`agents/OPERATING_MODEL.md` "Standing Autonomy and Concision").
