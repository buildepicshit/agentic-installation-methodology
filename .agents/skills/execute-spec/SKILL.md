---
name: execute-spec
description: "Use when implementing an approved BES SPEC.md or a TASK.md slice (after decomposition). Keeps edits scoped to approved scope, preserves user work, updates directly coupled tests/docs, surfaces (does not silently swallow) scope drift. Requires SPEC at status: approved (owner-set) or later. Do not implement against draft / needs-revision / approved-pending-owner specs."
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

# Implementation Execution

Use only after a spec is approved by the owner or controlling workflow.

## Steps

0. **Open the task list before the first edit.** Maintain the harness's
   native task list, one item per Execution Plan step, marked
   in-progress as you start each and complete as you finish. This is
   Tier 1 of `.agents/OPERATING_MODEL.md` "Work visibility" and is NOT
   optional: execution state held only in context is invisible to the
   owner and lost at session end.

   Then run the Tier 2 helper, which self-exits for untracked work:
   `bash .agents/scripts/fleet-track.sh <spec_path>` in a child repo, or
   `bash agents/scripts/fleet-track.sh <spec_path>` in `bes-fleet-policy`.
   It is repo-relative and never on `$PATH`. If the script is absent,
   skip it and note that in the Completion Report — it MUST NOT block
   execution.
1. Re-read the approved `SPEC.md`.
2. Re-read the repo `AGENTS.md` and relevant docs.
3. Confirm branch/worktree state with `git status --short --branch`.
4. Edit only files named by the spec or directly required by the change.
5. Use `diagnosis` before fixing unclear failures, flaky behavior,
   regressions, broken commands, or unknown root causes.
6. Use `tdd` for behavior changes when a focused automated or scripted
   check can express the desired behavior without exceeding spec scope.
7. For substantial approved specs, use `decompose-approved-spec` to
   split vertical HITL/AFK slices before dispatching workers. Slices
   remain subordinate to SPEC.md.
8. If the approved scope calls for a prototype, make it explicitly
   throwaway: answer one question, hold ITS OWN runtime state in memory
   rather than persisting anything, provide one command to run it, and
   delete or absorb it before completion. This concerns the prototype's
   data, never your execution state — that is governed by step 0 and
   MUST be on the task list regardless.
9. Add or update tests before or with production changes when behavior
   changes and the approved spec's verification method supports it.
10. Keep unrelated refactors out of scope.
11. Run the spec acceptance commands.
12. Prepare the completion report requested by the spec.

## Stop Conditions

- New facts materially change scope.
- Required files contain unrelated local changes that make safe editing
  ambiguous.
- Verification requires unavailable secrets or infrastructure.
- The spec's acceptance criteria are not testable.
- The spec requires the agent to invent product, design, quality, release, or
  acceptance criteria.
- Diagnosis shows the root cause requires behavior outside approved scope.
- Decomposition cannot produce bounded ownership or clear acceptance
  evidence for a worker slice.

## Hard Rules

- Preserve unrelated user changes.
- Do not silently expand scope.
- Do not convert agent opinions into implementation authority.
- Do not leave prototype code in the production path unless the
  approved SPEC explicitly absorbs it.
- Do not bypass hooks, CI, or verification gates.
- Do not claim completion without fresh verification evidence.
