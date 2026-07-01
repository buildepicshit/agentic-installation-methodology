---
name: code-review
description: "Use for reviewing local diffs, branches, or PRs. Prioritises bugs, regressions, missing tests, unsafe assumptions, and broken repo contracts over surface polish. Do not use to author or review SPEC.md / IDEA.md artefacts — use spec-review for that BLOCKING gate."
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

# Code Review

Use this when asked to review.

## Review Focus

- Correctness bugs.
- Behavioral regressions.
- Missing or weak tests.
- Security, privacy, or secret-handling risks.
- Broken architecture boundaries.
- Drift from `AGENTS.md`, approved specs, or public docs.
- Verification gaps.

## Two-Stage Review For Decomposed Work

For substantial parallel work or slices produced by
`approved-spec-decomposition`, review in this order:

1. SPEC compliance: confirm the slice stayed inside approved scope,
   touched only allowed ownership, preserved acceptance evidence, and
   did not create a peer authority beside SPEC.md.
2. Code quality: review correctness, regressions, maintainability,
   security, tests, and verification gaps.

If the first pass finds scope drift, stop there and request correction
before spending review effort on style or deeper implementation detail.

## Architecture Checks

When reviewing architecture or maintainability, prefer concrete tests:

- Deletion test: if removing a module makes complexity vanish instead
  of reappearing in callers, it may be pass-through ceremony.
- Interface test surface: public behavior should be reviewable through
  the module's interface, not only by inspecting internals.
- Depth: a useful module hides meaningful behavior behind a smaller
  interface; a shallow module mostly forwards complexity.

Treat these as risk signals, not automatic refactor requests. Tie any
finding to the approved SPEC, caller impact, or verification gap.

## Output

Findings first, ordered by severity. Each finding should include:

- file and line reference when available
- the concrete risk
- why the current change causes it
- a practical fix direction

Then include open questions and a brief summary only after findings.

When the review workflow dispatched any file-mutating probe, the
output MUST also include a clean-tree receipt (probe-marker sweep /
diff gate passed) per
[`references/multi-agent-review.md`](references/multi-agent-review.md).

## Hard Rules

- If there are no findings, say that clearly and list residual risk.
- Do not lead with praise or broad summaries.
- Do not request stylistic churn unless it affects correctness,
  maintainability, or repo contracts.
- **Cross-family review for TASK.md execution.** When reviewing a
  diff produced by an agent fulfilling a TASK.md, the reviewer
  SHOULD run on a different model family from the TASK.md
  `model_route`. The TASK.md `cross_validation_lane` names the
  expected family. For diffs executing a **fleet-propagating
  guardrail SPEC** (class defined in
  `file://agents/MODEL_ROUTING.md` Operating Rule 20), cross-family
  diff review is REQUIRED before the parent SPEC flips to
  `verified` — the same-family escape hatch does not apply. For
  non-guardrail work, if only same-family review is available,
  record `same-family-review: <model>` in the output and surface
  as a residual risk. See
  `file://agents/MODEL_ROUTING.md` and
  `file://specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md`
  §7.3.
- **Destructive sync over subset-owned mirrors.** When a sync owns
  only a subset of a directory, such as `SKILL.md` plus references
  in a mixed mirror, it MUST NOT `rm -rf` and rebuild the whole
  directory. Scope deletion to the manifest-governed set and
  depth-bound enumeration so nested non-governed files cannot match
  (`file://specs/2026-06-22-fleet-sync-self-reconcile/SPEC_EVIDENCE.md`
  SE-2).
- **Read-only.** Cross-validation reviewers MUST NOT edit files
  during review; they emit findings only. The primary executor
  addresses findings or posts justified pushback. Sole sanctioned
  exception: mutation probes in multi-agent review workflows,
  which run ONLY in mechanically isolated worktrees and never
  touch the reviewed tree — see
  [`references/multi-agent-review.md`](references/multi-agent-review.md).
