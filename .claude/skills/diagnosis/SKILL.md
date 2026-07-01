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
      - https://raw.githubusercontent.com/mattpocock/skills/main/skills/engineering/diagnose/SKILL.md
    borrowed_from:
      - mattpocock/skills diagnose
    upstream_status: current
    last_audited: 2026-06-05
    audit_cadence: quarterly
    adoption_status: adapted
    security_review: needed
    notes: "BES-adapted from checked-in external skill lineage; not a verbatim import."
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

### Environment Is Fix-Or-Propose, Not A Dead Stop

A missing tool, a broken hook, or an absent feedback loop is
**fix-or-propose** work, not a reason to stop diagnosing. The whole
point of this skill is to build a deterministic feedback loop, so:

- If the loop you need is missing or broken, repairing it or wiring up
  already-approved tooling IS in-scope diagnosis work — do it, then
  resume.
- If the loop requires something you cannot provision in-scope — a NEW
  tool, a NEW MCP server, or an edit to a hook, guardrail, or fleet
  rule — do not silently route around it: propose the change with the
  reproduction evidence in hand, and route it through owner or SPEC
  authorization.

These genuine safety stops still hold and are not softened by the
above:

- Do not bypass a safety gate or hook to make a feedback loop "work."
- Hand-editing a hook, guardrail, or fleet rule stays out of scope; it
  routes through the inbox-plus-SPEC channel, not a local patch.
- Secrets and external-service behavior still warrant deliberate care
  (see the clause above).

## Output

Report:

- Symptom.
- Reproduction command or reason reproduction is unavailable.
- Key evidence.
- Root cause or strongest remaining hypothesis.
- Fix direction.
- Verification command and result.
- Residual risk.

## Hard Rules

- Do not guess a fix before checking the code and available evidence.
- Do not treat a passing unrelated command as proof.
- Do not leave temporary debug logs, fixtures, or throwaway harnesses
  behind unless the approved SPEC explicitly keeps them.
- Do not expand implementation scope without an approved SPEC update.
- Do not claim completion without fresh verification evidence.
