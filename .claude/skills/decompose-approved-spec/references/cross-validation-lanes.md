# Cross-validation lane assignment

Read this when choosing a per-slice `cross_validation_lane`
during decomposition (BLOCKING different-family rule per the
parent skill).

## Pattern

A Rule-20 TASK.md — one that alters what a gate blocks or allows, touches
secrets or a security surface, or changes branch/push protection — MUST name
a `cross_validation_lane` of a different
model family from `model_route`. The cross-validation review
runs between `in-progress` and `in-review`:

1. Primary agent finishes implementation; opens PR.
2. Cross-validation agent (different family) is dispatched as a
   subagent or as a separate review run, scoped
   to:
   - Read-only access to the diff and the parent SPEC.md.
   - Output: findings list ordered by severity, file/line
     citations, no edits. (Mutation probes, when a review
     workflow uses them, are governed separately by
     `file://agents/skills/review-diff/references/multi-agent-review.md`
     — isolated worktrees only, never the shared tree.)
3. Findings are recorded in the workpad `Validation` section.
4. Primary agent addresses each finding (code/test/docs) or posts
   explicit justified pushback, per
   `file://agents/templates/WORKFLOW.body.md` Section 1 "Step 3 —
   Cross-family cross-validation".
5. Only after cross-validation findings are resolved does the
   task flip `in-progress → in-review`.

## Skill responsibilities

The `review-diff` skill at
`file://agents/skills/review-diff/SKILL.md` and the
`review-spec` skill at
`file://agents/skills/review-spec/SKILL.md` are the executors
of cross-validation; this skill (`decompose-approved-spec`)
names the lane.

## Fallback when cross-family dispatch is impossible

Per SE2 (capture in
`file://specs/2026-05-17-contract-corpus-retrospective-audit/SPEC_EVIDENCE.md`),
when the execution context cannot dispatch cross-family (e.g.
Claude Code only spawns Claude-family subagents), the honest
path is same-family proxy + clearly-labelled deferral. This
fallback applies to TASK.md execution too; strict cross-family
pass deferred to owner-triggered external runner.

**Exception — Rule 20 work has NO same-family fallback.**
For a change that alters what a gate blocks or allows, touches secrets
or a security surface, or changes branch/push protection (the Rule 20
bar since 2026-07-31 — not a manifest-path test), cross-family review is
REQUIRED with NO waiver:
if the cross-family lane is unavailable the work HOLDS; a per-case
override exists only as an explicit owner in-transcript directive, never
as an agent-initiated proxy (`file://agents/MODEL_ROUTING.md` Rule 20,
owner-affirmed strict 2026-07-02). The proxy+deferral path above applies
only to non-guardrail work.
