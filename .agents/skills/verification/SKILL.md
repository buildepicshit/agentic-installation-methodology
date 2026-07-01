---
name: verification
description: Use before reporting done. Runs the narrowest relevant checks first, then the repo gate when warranted, and records fresh evidence plus residual risk.
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

# Verification

Use before claiming work is complete.

## Steps

1. Read the spec acceptance commands and repo `AGENTS.md` verification section.
2. Run the narrowest relevant test or lint first.
3. Run the broader repo gate when the change touches shared behavior,
   interfaces, CI, docs contracts, or release surfaces.
4. For decomposed work, verify slice evidence first, then run final
   integration acceptance commands from the approved SPEC.
5. Capture command, result, and important output.
6. If a command fails, diagnose whether the failure is caused by the change,
   existing repo state, missing dependency, sandbox/network limits, or secrets.
7. Re-run only after a meaningful fix or environment change.

## Output

- Commands run.
- Pass/fail result.
- Key output lines or summarized failures.
- For decomposed work, slice evidence and final integration evidence.
- Residual risk.
- Checks not run and why.

## Oracle Integrity

A passing golden/digest oracle only pins what actually reaches the
hash. Before claiming oracle coverage for a behavior, probe-confirm
the behavior contributes: ablate one term it depends on (zero a
constant, flip a sign) and REQUIRE the oracle output to CHANGE. If
the golden reproduces bit-for-bit with the term ablated, the oracle
never observed that behavior and the claim is hollow. Origin:
ACTOCCATUD de-risk spike — gravity arithmetic underflowed to zero
every tick yet reproduced the M1 golden exactly (ACTOCCATUD
`.agents/specs/2026-06-02-de-risk-spike-rust-godot-vertical-slice/`
§17.3 M4 + tasks/T-05 §6; routed via bes-fleet-policy
`AGENT_INBOX.md` 2026-06-05 entry).

Ablation probes are file-mutating: run them in an isolated
worktree (or copy-mutate-restore with verified zero delta), per
the probe lifecycle in
`file://agents/skills/code-review/references/multi-agent-review.md`.

## Tracked-Path Claims

Before claiming a file was committed, verify it is tracked:
`git ls-files --error-unmatch <path>` (or check the commit's own
stat list). Ignore rules can silently swallow sources — ACTOCCATUD's
.NET-era `bin/` rule untracked Rust `src/bin/` SOURCES for two days
while a commit message claimed them (fixed with a `!**/src/bin/`
negation; same inbox routing as above). When a repo changes
ecosystems, audit its ignore rules against the new layout before
trusting add/commit results.

## Hard Rules

- Do not say "should pass" as verification.
- Do not hide failing checks.
- Do not spend CI minutes when local gates are required first.
- **Tree hygiene before commit/golden ops.** Do not commit or
  regenerate goldens from a tree that has not passed the
  probe-residue gate after any file-mutating probe ran — same
  pre-commit gate family as §Tracked-Path Claims; mechanics in
  `file://agents/skills/code-review/references/multi-agent-review.md`.
- **Grep the enforcement surface, not bare tokens.** Verification
  greps MUST target the actual enforcement pattern (e.g. the
  `Co-Authored-By:` trailer), never a bare token that legitimately
  appears in content (e.g. `Claude` matching `CLAUDE.md`) — bare
  tokens false-positive and mask real gate behavior
  (`file://specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md`
  §17.5 SE3, dispositioned ACCEPT 2026-06-10).
- **Verify against reality.** A predicate or contract that gates
  behavior MUST be executed against the live filesystem/runtime
  before sign-off, not only reviewed as text; four cross-family
  review rounds passed a predicate wrong for the live repo
  (`file://specs/2026-06-22-fleet-sync-self-reconcile/SPEC_EVIDENCE.md`
  SE-1).
- **Cross-family verification for behavioral checks.** Mechanical
  verification (lint, unit tests, type checks) MAY use the same
  model family as implementation. **Behavioral verification** —
  confirming the change actually delivers the SPEC's named outcome
  — SHOULD use a different model family from the implementer per
  the TASK.md `verification_lane`. Same-family behavioral
  verification inherits the same reasoning blind spots. See
  `file://agents/MODEL_ROUTING.md` and
  `file://specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md`
  §7.3.
- **Integration gate.** When a parent SPEC's TASK.md set all reach
  `done`, the integration verifier runs the parent SPEC's full
  `acceptance_commands` as the gate before flipping
  `decomposed → in-execution → verified`. Per-task evidence MUST
  be aggregated into the parent SPEC's Completion Report.
