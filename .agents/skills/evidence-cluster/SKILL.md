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

Before declaring a behaviour change done:
- Identify the files you modified.
- Identify tests that transitively reach those files
  (import graph, not just sibling tests).
- Run THAT set, not just the tests you wrote.
- Cite the test run as a tool-receipt
  (`execution-discipline-cluster` cross-ref).
- If a predicate or contract gates behavior, execute it against the
  live filesystem/runtime before sign-off
  (`file://specs/2026-06-22-fleet-sync-self-reconcile/SPEC_EVIDENCE.md`
  SE-1).

For the BES fleet today the helpers are:
- `bash .claude/hooks/tests/run-tests.sh` — fleet
  hook impact.
- `bash agents/scripts/<helper>.sh --self-test` —
  per-helper impact.

### 2. Anti-Over-Mock Cue

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

When reviewing a diff:
- Measure lines added vs behaviour added.
- If the code added is roughly an order of magnitude
  more than the behaviour warrants, flag as
  complexity-bloat. (Calibration: a ~200-line PR that
  adds one new public-API function is fine; ~2000 lines
  for that same one function is suspect — ~10x too much.
  Advisory cue, not a lint-enforced ratio.)
- Check imports added — every new dep is a
  long-lived liability; new deps without
  `deps_added` SPEC declaration are blocked by
  `block-undeclared-deps.sh` but advisory deps
  inside a node_modules churn warrant review.

### 4. Dual-Reader Ambiguity Probe (at SPEC review)

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
- Do not let a PR whose size dwarfs its behaviour by
  ~an order of magnitude land unchallenged (see the
  complexity-delta cue above).
- Do not skip the ambiguity probe on Contract SPECs
  — Contract is the most-binding artefact type.

## Cross-references

Host skills per practice: `tdd` (impact-aware selection),
`code-review` (complexity-delta), `spec-review` (ambiguity probe),
`execution-discipline-cluster` (tool receipts).
