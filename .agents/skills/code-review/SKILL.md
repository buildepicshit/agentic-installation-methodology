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
    source_urls:
      - https://github.com/mattpocock/skills
    borrowed_from:
      - mattpocock/skills code-review
    upstream_status: current
    last_audited: 2026-07-08
    audit_cadence: annual
    adoption_status: adapted
    security_review: not-required
    notes: "BES fleet-native review skill. The always-on Fowler Smell Baseline section was adapted 2026-07-08 from mattpocock/skills code-review @ d574778 (v1.1.0), subordinate to the pre-existing correctness / SPEC-scope / Deletion-Interface-Depth checks; no executable or tool surface added. Adoption record: specs/2026-07-08-pocock-v1.1-alignment-rebaseline."
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
- Unswept sibling consumers: when the diff fixes a duplicated or
  copied construct, grep for its same-shaped SIBLINGS — the fix
  landing in one copy while a byte-similar copy stays broken is a
  three-time-confirmed miss class
  (`file://specs/2026-07-01-propagation-machinery-fixes/SPEC_EVIDENCE.md`
  SE-3).

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

## Smell Baseline (always-on)

A curated set of Fowler code smells (_Refactoring_, ch.3) applies to
every review as a maintainability lens — even when a repo documents no
standards of its own. It is **subordinate to the correctness, regression,
and SPEC-scope checks above**: raise a smell only after those, never in
place of them. Three rules bind it:

- **A documented repo standard overrides the baseline.** `AGENTS.md`, an
  approved SPEC, or a repo coding-standards doc always wins; where it
  endorses what a smell would flag, suppress the smell.
- **Every smell is a judgement call, never a hard violation.** Label each
  as a possibility ("possible Feature Envy") and tie it to SPEC scope,
  caller impact, or a verification gap — the same risk-signal framing as
  the Architecture Checks above.
- **Skip anything tooling already enforces.** Don't hand-flag what a
  linter, formatter, or type-checker already catches.

Each smell reads *what it is → how to fix*; match it against the diff:

- **Mysterious Name** — a function, variable, or type whose name doesn't reveal what it does or holds. → rename it; if no honest name comes, the design's murky.
- **Duplicated Code** — the same logic shape appears in more than one hunk or file in the change. → extract the shared shape, call it from both.
- **Feature Envy** — a method that reaches into another object's data more than its own. → move the method onto the data it envies.
- **Data Clumps** — the same few fields or params keep travelling together (a type wanting to be born). → bundle them into one type, pass that.
- **Primitive Obsession** — a primitive or string standing in for a domain concept that deserves its own type. → give the concept its own small type.
- **Repeated Switches** — the same `switch`/`if`-cascade on the same type recurs across the change. → replace with polymorphism, or one map both sites share.
- **Shotgun Surgery** — one logical change forces scattered edits across many files in the diff. → gather what changes together into one module.
- **Divergent Change** — one file or module is edited for several unrelated reasons. → split so each module changes for one reason.
- **Speculative Generality** — abstraction, parameters, or hooks added for needs the spec doesn't have. → delete it; inline back until a real need shows.
- **Message Chains** — long `a.b().c().d()` navigation the caller shouldn't depend on. → hide the walk behind one method on the first object.
- **Middle Man** — a class or function that mostly just delegates onward. → cut it, call the real target direct.
- **Refused Bequest** — a subclass or implementer that ignores or overrides most of what it inherits. → drop the inheritance, use composition.

Provenance: the smell vocabulary is adapted from `mattpocock/skills`
`skills/engineering/code-review` @ `d574778` (v1.1.0) per
`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md` §11 T1;
the Deletion / Interface / Depth checks above are BES-native and are not
superseded by it.

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

## Tool-Receipt Block (REQUIRED on cross-family review artifacts)

Every cross-family review artifact (diff review or spec review) MUST
carry a provenance receipt block proving it was produced by a real
tool run. An artifact without a complete receipt block is INVALID for
gate purposes — the review is treated as NOT-RUN: the TASK.md
cross-validation gate stays unsatisfied and a guardrail SPEC MUST NOT
flip `verified` on it. This is the single canonical statement;
`agents/skills/spec-review/SKILL.md`, `agents/specs/SPEC.schema.md`
§1.4, and `agents/specs/TASK.template.md` cite it. Adopted per
`file://specs/2026-07-01-cross-val-tool-receipts/SPEC.md`.

REQUIRED fields (the FIELDS are normative, not any one machine's log
layout):

- `lane` — reviewing surface + explicit model pin
  (e.g. `copilot gpt-5.5`).
- `invocation` — the exact CLI invocation, or the validator's verbatim
  PASS/WARN output for it.
- `session_log` — a session/log identifier the run can be traced to
  (path, id, or transcript reference).
- `wall_clock` — start or completion timestamp of the run.
- `tokens` — token/cost counts where the lane exposes them; OMIT when
  not exposed — never fabricate.

Example:

```text
receipt:
  lane: copilot gpt-5.5 (cross-family, GPT)
  invocation: gh copilot -- -p "<prompt>" --model gpt-5.5 -s ... (validator PASS)
  session_log: ~/.copilot/logs/2026-07-02T10-41-session.log
  wall_clock: 2026-07-02T10:41Z
  tokens: omitted — lane does not expose usage
```

## Hard Rules

- If there are no findings, say that clearly and list residual risk.
- Do not lead with praise or broad summaries.
- Do not request stylistic churn unless it affects correctness,
  maintainability, or repo contracts.
- **Cross-family review for TASK.md execution.** The TASK.md
  `cross_validation_lane` names the expected reviewing family
  (different from `model_route`). For diffs executing a
  **fleet-propagating guardrail SPEC**, cross-family diff review is
  REQUIRED before the parent SPEC flips to `verified` — the
  same-family escape hatch does not apply. For non-guardrail work,
  if only same-family review is available, record
  `same-family-review: <model>` in the output and surface as a
  residual risk. Canonical semantics and guardrail-class
  definition: `file://agents/MODEL_ROUTING.md` Rule 20.
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
