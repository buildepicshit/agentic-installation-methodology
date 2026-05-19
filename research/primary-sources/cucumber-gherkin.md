---
slug: cucumber-gherkin
source_name: "Cucumber / Gherkin — executable specifications"
primary_url: "https://cucumber.io/docs/gherkin/reference"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched cucumber.io gherkin reference; Given/When/Then + Feature/Scenario/Background structure + executable-spec characterisation verbatim"
methodology_relevance: |
  Cucumber / Gherkin is research §5.1's "Gherkin /
  Cucumber executable acceptance" primitive for the
  methodology's behavior/ sub-spec. This corpus entry
  anchors the keyword structure and the executable-
  specification semantics so the methodology can cite
  Gherkin precisely as the behavioural-acceptance
  primitive.
---

# Cucumber / Gherkin

## 1. Source identity

- Name: Gherkin — domain-specific language for
  executable specifications, consumed by Cucumber.
- Canonical URL: `url://cucumber.io/docs/gherkin/reference`.
- Maintainer: Cucumber organisation.

## 2. Fetch trace

- `cmd://WebFetch url://cucumber.io/docs/gherkin/reference`
  — 2026-05-19; returned Gherkin keyword reference +
  Feature/Scenario/Background + executable-spec
  semantics.

## 3. Verbatim claims this corpus depends on

- **Self-characterisation**: Gherkin is "a language
  for writing executable specifications" that "uses
  special keywords to structure feature files that
  describe software behavior in human-readable terms."

- **Given step**: "put the system in a known state"
  before interactions begin. Establishes preconditions
  (e.g. "I am logged in").

- **When step**: describes an action — "a person
  interacting with the system, or it can be an event
  triggered by another system" (e.g. "Guess a word",
  "Withdraw money").

- **Then step**: "describe an expected outcome, or
  result." Verifies observable results via assertions.

- **And / But**: connectors chaining multiple steps of
  the same type for readability.

- **Feature**: a `.feature` file's first required
  keyword; groups related scenarios.

- **Scenario**: concrete example following Given-When-
  Then pattern.

- **Background**: common Given steps that run before
  each scenario in the feature, eliminating repetitive
  setup.

- **Executable semantics**: each Gherkin step matches
  to implementation code called a "step definition."
  Cucumber executes steps sequentially. Scenarios form
  "an executable specification of the system."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Gherkin provides the methodology's behavior/ sub-spec
its most human-readable + machine-executable
acceptance-criteria primitive. Key shape implications:

- The methodology's published SPEC bundle MAY include
  a `behavior/` directory with `.feature` files that
  serve simultaneously as documentation, acceptance
  test, and contract — Gherkin's three-in-one
  affordance.
- The Background section pattern is reusable for the
  methodology's behavior/ sub-spec when many scenarios
  share preconditions (e.g. "the product is installed
  per deployment/ sub-spec").
- Step definitions live in the IMPLEMENTATION, not the
  spec. The methodology's SPEC bundle ships the
  Gherkin scenarios; the user-with-agent's installation
  generates or implements the step definitions
  appropriate to their language/runtime. This is the
  spec-as-distribution / installer-implements pattern
  in action.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/cucumber-gherkin.md
§3`):

- methodology-claim: "Gherkin is a language for
  executable specifications using Given-When-Then
  keywords structured into Features and Scenarios."
- methodology-claim: "Gherkin's Background sections
  let multiple scenarios share preconditions —
  reusable in the methodology's behavior/ sub-spec for
  shared post-install state."
- methodology-claim: "Gherkin scenarios serve as
  documentation, acceptance test, and contract
  simultaneously — three-in-one affordance the
  methodology's behavior/ sub-spec may adopt."
- methodology-claim: "Step definitions live in the
  implementation (not the SPEC); the methodology's
  installing user-with-agent generates appropriate
  step definitions for their language/runtime."

## 6. Open questions surfaced by the primary read

- Gherkin has language-specific syntax conventions
  (English keywords by default; other languages
  supported). The methodology's SPEC bundle should
  pin English as the canonical Gherkin language for
  cross-installer portability, unless explicitly
  internationalised.
- Cucumber as the canonical runner is not the only
  Gherkin consumer (behave, SpecFlow, Karate). The
  methodology should not mandate Cucumber; the SPEC
  bundle ships `.feature` files; the installer
  chooses the runner.
- Gherkin doesn't natively handle non-functional
  properties (performance, reliability). The
  methodology may want a separate behavior/ sub-spec
  entry for those (or cite quality-attribute-specific
  primitives).
