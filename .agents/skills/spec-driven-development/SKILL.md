---
name: spec-driven-development
description: "Routes BES non-trivial work through the IDEA -> SPEC lifecycle and selects the next phase skill. Use when planning architecture, behavior, guardrails, workflow, data model, CI, public-doc, multi-file, or unclear-scope work in a BES repo."
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

# Spec-Driven Development

Use this as the lifecycle router for non-trivial BES work. It chooses
the right amount of ceremony and hands off to the phase skill that
owns the next action.

This skill owns lifecycle routing. It does not own authoring details,
review gates, decomposition mechanics, implementation, verification,
or evidence governance.

## Route First

Pick the lightest route that preserves fleet authority:

1. **Command-only / read-only** -> answer directly or run the command.
2. **Small reversible edit** -> evaluate the fastpath thresholds.
3. **Unclear or design-heavy work** -> run an IDEA conversation.
4. **Concrete implementation** -> author a Task SPEC.
5. **Future-agent behavior contract** -> author a Contract SPEC.
6. **Binding trade-off** -> author a Decision SPEC.
7. **Research-heavy uncertainty** -> use a research workpad before
   IDEA capture.

## Lifecycle Map

5-gate default: **Align** (Preflight / Orient / Predict) → **Spec** (Ideate /
Author SPEC) → **Approve** (Review / Owner approve) → **Execute** →
**Verify** (Verify / Report). High-risk or multi-agent work MAY insert
Decompose → Dispatch → Cross-validate between Approve and Execute (see
`references/lifecycle-router.md`), but that full path is NOT the default
(`file://specs/2026-06-30-operating-model-lean-down/SPEC.md` §7).

## Phase Routing

| Need | Use |
|---|---|
| Capture IDEA or write SPEC | `spec-authoring` |
| Review IDEA or SPEC | `spec-review` |
| Split approved multi-slice work | `approved-spec-decomposition` |
| Execute approved scope | `implementation-execution` |
| Prove the change | `verification` |
| Capture durable lessons | `spec-evidence-governance` |
| Check a small reversible exception | `spec-authoring` + `SPEC.fastpath.template.md` |

## Hard Stops

- Owner alone sets `approved`, `decomposed`, `superseded`, and `closed`.
- `approved-pending-owner` is not execution permission.
- When work takes the decomposition path (high-risk / multi-agent),
  do not execute its slices before durable per-slice TASK.md
  decomposition lands. Decomposition is the exception, not the 5-gate
  default — see the Lifecycle Map above.
- Do not silently revise the contract when scope drifts.
- Do not claim completion without fresh verification.
- An operating-model change is complete only when its same-wave
  doc-reconciliation sweep of the propagating corpus lands
  (`file://specs/2026-07-01-leandown-doc-reconciliation/SPEC_EVIDENCE.md` SE-1).
- Do not run multiple owner-interactive planning tracks in parallel.
- For delegation, model-specific work, or non-trivial planning, read
  `file://agents/MODEL_ROUTING.md`.

## References

Read only the reference needed for the current route:

- Full lifecycle and status details:
  `file://agents/skills/spec-driven-development/references/lifecycle-router.md`
- Fastpath / capture-after exception:
  `file://agents/skills/spec-driven-development/references/capture-after-and-fastpath.md`
- Non-propagating Decision SPEC cascade:
  `file://agents/skills/spec-driven-development/references/cascade-by-id-citation.md`
- Citation and status grammar: `file://agents/specs/SPEC.schema.md`
- Phase mechanics: the phase skill named in the routing table.
