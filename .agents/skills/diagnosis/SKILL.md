---
name: diagnosis
description: "Use when debugging a failure, flaky behavior, regression, broken command, or unclear root cause. Builds a fast deterministic feedback loop before fixing."
license: unknown
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: adapted
    source_urls:
      - https://github.com/mattpocock/skills
    borrowed_from:
      - mattpocock/skills diagnosing-bugs
    upstream_status: current
    last_audited: 2026-07-08
    audit_cadence: quarterly
    adoption_status: adapted
    security_review: needed
    notes: "BES-adapted from external skill lineage (mattpocock/skills diagnosing-bugs; renamed upstream from 'diagnose' — the fleet's 2026-06-05 record was stale on the name and is corrected here; the rename predates v1.1, so it is NOT a v1.1 change); not a verbatim import. 2026-07-08 (v1.1.0 @ d574778): added the missing-architectural-seam-is-the-finding cue to Stop And Reframe, a perf-measure-first note, and a post-mortem output line; the ranked falsifiable hypotheses and [DEBUG-<id>] probe tagging were already present and were NOT re-added (no-op discipline). Adoption record: specs/2026-07-08-pocock-v1.1-alignment-rebaseline."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Diagnosis

Use this skill when the task is to understand why something fails,
regressed, flakes, or behaves unexpectedly.

Diagnosis comes before fixing. The output of diagnosis is evidence:
reproduction, observations, likely root cause, and the narrowest safe
fix direction.

## Procedure

1. Restate the symptom in observable terms.
2. Find the fastest deterministic feedback loop available: focused
   test, lint, command, log excerpt, local reproduction, or minimal
   fixture.
3. Reproduce the failure or record why reproduction is unavailable.
4. Inspect the relevant code, docs, and recent diff before proposing a
   fix.
5. Form 3-5 ranked, falsifiable hypotheses. Each hypothesis must name
   the observation that would prove or disprove it.
6. Test one hypothesis at a time with the feedback loop. If
   instrumentation is needed, tag temporary probes with a unique
   prefix such as `[DEBUG-<id>]` so cleanup is mechanical.
7. Apply the smallest fix that explains the observed failure.
8. Re-run the feedback loop and any directly related acceptance checks.
9. Remove temporary probes before claiming completion.

For performance diagnosis specifically, measure before changing: a profile
or benchmark is the feedback loop, and an optimization applied without a
baseline measurement is a guess, not a fix.

## Stop And Reframe

Stop and reframe before continuing when:

- Two plausible fixes fail.
- The failure contradicts the approved SPEC.
- The root cause requires changing behavior outside approved scope.
- The feedback loop is too slow or nondeterministic to support safe
  iteration.
- The evidence points to architecture, secrets, or external-service
  behavior rather than the local change — these still warrant care:
  secrets and external-service behavior carry data-handling and
  security risk, so treat them deliberately, not as routine local
  edits.
- No clean seam exists to observe the behavior or build a deterministic
  loop, and creating one would require reshaping the design — not merely
  provisioning a tool. Treat that absence as itself the finding: it points
  at an architectural gap, not a local bug. Hand it to architecture rather
  than forcing a fragile probe (adapted from `mattpocock/skills`
  `diagnosing-bugs` @ `d574778`, v1.1.0, per
  `file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md`
  §11 T7; the ranked-falsifiable-hypotheses and `[DEBUG-<id>]`
  probe-tagging cues were already present in this skill).

### Environment Is Fix-Or-Propose, Not A Dead Stop

A missing tool, a broken hook, or an absent feedback loop is
**fix-or-propose** work, not a reason to stop diagnosing:

- If the loop you need is missing or broken, repairing it or wiring up
  already-approved tooling IS in-scope diagnosis work — do it, then
  resume.
- If the loop requires something you cannot provision in-scope — a NEW
  tool, a NEW MCP server, or an edit to a hook, guardrail, or fleet
  rule — do not silently route around it: propose the change with the
  reproduction evidence in hand, and route it through owner or SPEC
  authorization.
- Never bypass a safety gate or hook to make a feedback loop "work";
  hook, guardrail, and fleet-rule edits route through SPEC, not a
  local patch.

## Output

Report:

- Symptom.
- Reproduction command or reason reproduction is unavailable.
- Key evidence.
- Root cause or strongest remaining hypothesis.
- Fix direction.
- Verification command and result.
- Residual risk.
- What would have prevented this — a one-line post-mortem naming the
  missing test, gate, or check that would have caught it earlier.

## Hard Rules

- Do not guess a fix before checking the code and available evidence.
- Do not treat a passing unrelated command as proof.
- Do not leave temporary debug logs, fixtures, or throwaway harnesses
  behind unless the approved SPEC explicitly keeps them.
- Do not expand implementation scope without an approved SPEC update.
- Do not claim completion without fresh verification evidence.
