---
name: evidence-cluster
description: "Use during code authoring + spec-review. Four practices bundled: (1) impact-aware test selection — run tests the changed files transitively reach, not just the ones you wrote; (2) anti-over-mock cue — no mocks outside test files; (3) complexity-delta gate during review — measure lines vs behaviour; (4) dual-reader ambiguity probe at SPEC review — second reviewer asks 'what does this permit/forbid that disagrees'."
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

# Evidence Cluster

Four practices bundle here because they share one root:
**the artefact has to do the right thing, not just
exist**.

## Use Cases

Invoke this skill when implementing a behaviour change
(impact-aware tests + anti-over-mock), when reviewing a
diff (complexity-delta gate), when reviewing a SPEC
(dual-reader ambiguity probe).

## The Four Practices

### 1. Impact-Aware Test Selection

Per Wave 1 §2.1 TDAD paper finding: procedural TDD
without impact-graph awareness made regressions
**worse** (6.08% → 9.94%). Graph-based impact analysis
cut regressions 70%.

Before declaring a behaviour change done:
- Identify the files you modified.
- Identify tests that transitively reach those files
  (import graph, not just sibling tests).
- Run THAT set, not just the tests you wrote.
- Cite the test run as a tool-receipt
  (`honesty-cluster` cross-ref).
- If a predicate or contract gates behavior, execute it against the
  live filesystem/runtime before sign-off; text review alone missed
  a live-repo-broken predicate across four cross-family rounds
  (`file://specs/2026-06-22-fleet-sync-self-reconcile/SPEC_EVIDENCE.md`
  SE-1).

For the BES fleet today the helpers are:
- `bash .claude/hooks/tests/run-tests.sh` — fleet
  hook impact.
- `bash agents/scripts/<helper>.sh --self-test` —
  per-helper impact.

### 2. Anti-Over-Mock Cue

Per Wave 1: 36% agent commits add mocks vs 26%
non-agent. Mocks outside test files are signal of
laziness or test-as-mirror-of-implementation.

Rules:
- **NEVER add `mock`, `jest.mock`, `vi.mock`,
  `MagicMock`, etc. outside test files.** Production
  code that needs a mockable seam should use
  dependency injection at module boundaries (per
  standards §U15 boundary validation).
- **One mock per test, not many.** Over-mocked tests
  test the mock, not the behaviour.
- **If you find yourself mocking the database in
  more than half your tests** the architecture is
  test-hostile. Surface it.

### 3. Complexity-Delta Gate (during review)

Per Wave 1 §2.1 MSR 2026 finding: AI-reviewer
suggestions adopted at scale produce significantly
larger complexity + size increases than human-
reviewer suggestions.

When reviewing a diff:
- Measure lines added vs behaviour added.
- If lines:behaviour-points >= 50:1, flag as
  complexity-bloat. (Heuristic: a 200-line PR that
  adds one new public-API function is fine; one
  that adds 2000 lines + one function is suspect.)
- Check imports added — every new dep is a
  long-lived liability; new deps without
  `deps_added` SPEC declaration are blocked by
  `block-undeclared-deps.sh` but advisory deps
  inside a node_modules churn warrant review.

### 4. Dual-Reader Ambiguity Probe (at SPEC review)

Per Wave 1 §2.1 SDD literature: ambiguity has
near-zero cost for human readers but compounds
catastrophically with agents.

When cross-family reviewing a SPEC:
- Pick one normative claim per major section.
- Ask: "What behaviour does this permit / forbid that
  another reader might disagree on?"
- If the answer is "nothing" you've read it tightly;
  if the answer reveals interpretive surface, surface
  the ambiguity as a finding.

This is distinct from existing diff-review — the
ambiguity probe targets the SPEC TEXT's interpretive
surface, not the implementation.

## Hard Rules

- Do not declare a behaviour change done without
  running impact-aware tests.
- Do not add mocks to non-test files.
- Do not let a 10:1 lines:behaviour PR land
  unchallenged.
- Do not skip the ambiguity probe on Contract SPECs
  — Contract is the most-binding artefact type.

## Cross-references

- `file://agents/skills/tdd/SKILL.md` — impact-aware
  selection extends tdd's discipline.
- `file://agents/skills/code-review/SKILL.md` —
  complexity-delta gate runs inside code-review.
- `file://agents/skills/spec-review/SKILL.md` —
  ambiguity probe runs inside spec-review.
- `file://agents/skills/honesty-cluster/SKILL.md` —
  tool-receipts pair with impact-aware runs.
