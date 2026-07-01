---
name: calibration-cluster
description: "Use during execution + completion phases. Two practices bundled: (1) confidence-band declarations on completion-report claims — say what you know vs what you're guessing; (2) escalation rubric — when iteration is not converging or confidence is below threshold, stop and ask. KDD 2025 evidence: high-accuracy + miscalibrated is the norm; explicit calibration is the corrective."
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

# Calibration Cluster

Two practices bundle here because they share one root:
**knowing what you don't know is the meta-skill**.

## Use Cases

Invoke this skill when writing a completion report,
when about to declare a task complete, when you're
on round N>1 of a fix loop and not converging, or
when proposing a change you're less than 80%
confident about.

## The Two Practices

### 1. Confidence-Band Declaration

Completion-report claims fall into bands:

- **HIGH (>= 90%)**: I executed this myself + verified
  the captured artefact. Example: "Lint passes — 0
  errors / 0 warnings per attached log."
- **MEDIUM (60-90%)**: Inference from related evidence
  I observed. Example: "The other gates' patterns
  should work here because they did there."
- **LOW (< 60%)**: Hypothesis or untested assumption.
  Example: "I expect this to work on macOS though I
  only tested on Linux."

§17 / §19 completion-report rows MUST tag claims with
their band when the band is anything other than HIGH.
Untagged claims default to HIGH and MUST be verifiable.

A HIGH claim contradicted later is a spec-evidence
candidate (calibration drift). A LOW claim that turns
out correct is fine — calibration is about honesty,
not accuracy.

### 2. Escalation Rubric (First-Class Anti-Doom-Loop Norm)

The escalation rubric is not skill-only fine print: it is a
**first-class, always-loaded anti-doom-loop norm**. Per the
canon Decision at
`file://specs/2026-06-20-agent-canon-bounded-autonomy-voice/SPEC.md`
§7.3, when iteration is not converging an agent MUST stop and
either surface to the owner or reset context rather than grind.
Grinding past the threshold below is the documented cause of
repeated resets — treat the rubric as a standing obligation, not
a tip.

When iteration stops converging — defined as:
- 2+ consecutive review rounds with the same OR
  increasing defect count, OR
- 3+ tool invocations attempting to fix the same
  underlying error, OR
- A loop where each fix surfaces a new defect of the
  same shape (e.g. all are copilot-doc-verification
  defects),

STOP and either surface to the owner or reset context. Per the
CLI #5 R6→R8 trajectory-reversal lesson at
`file://specs/2026-05-25-agent-cli-invocation-craft/SPEC.md`
§19.5: "when cross-family review trajectory reverses
for 2+ rounds, narrow scope before grinding more
cycles."

The escalation surface IS the owner. The format:
- Name the loop pattern observed.
- Name the alternative paths considered.
- Recommend one (don't just dump options on the
  owner).
- Wait for direction before continuing.

#### Drift Checkpoint — "Have You Lost The Plot?"

Run this lightweight checkpoint periodically during a long or
looping task, well before the hard thresholds above fire. Ask
yourself:

- Can I still state the original goal in one sentence, and is
  this edit serving it?
- Am I fixing the symptom I started on, or have I drifted onto a
  different problem?
- Is my context still carrying the load-bearing facts, or has it
  filled with noise from failed attempts?

If the answer is "I've lost the plot," that is itself a converge
failure: stop and either surface to the owner or reset context.

A context reset is a legitimate recovery move — but it loses
working memory, so it MUST be preceded by a short handoff that
records the current facts, the commands already run (with their
results), and the open blocker. Reset only after the handoff is
written, so evidence is not lost.

## Hard Rules

- Do not declare HIGH confidence without a verifiable
  artefact backing it.
- Do not pretend MEDIUM/LOW claims are HIGH to
  appear competent.
- Do not silently iterate past the loop-counter
  threshold. Surface.
- Do not dump unstructured option lists on the owner
  when escalating. Surface ranked + recommended.

## Cross-references

- `file://specs/2026-05-25-agent-cli-invocation-craft/SPEC.md`
  §19.5 — trajectory-reversal lesson + spec-evidence
  candidates this cluster operationalises.
- `file://agents/skills/honesty-cluster/SKILL.md` —
  in-flight failure disclosure pairs with confidence-
  band declaration.
