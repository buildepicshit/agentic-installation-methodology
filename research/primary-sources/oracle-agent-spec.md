---
slug: oracle-agent-spec
source_name: "Oracle Open Agent Spec (Agent Spec)"
primary_url: "https://github.com/oracle/agent-spec"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched oracle/agent-spec README; framework-agnostic declarative language definition + JSON/YAML serialization + multi-SDK conformance verbatim"
methodology_relevance: |
  Oracle Agent Spec is research §2.1's "closest to 'ship
  spec, compile yourself'" — framework-agnostic
  declarative description of agentic systems. Closest
  cousin to the methodology's spec-as-distribution
  posture. This corpus entry anchors Agent Spec's
  conformance model and serialization shape so the
  methodology can cite it precisely as nearest neighbour.
---

# Oracle Open Agent Spec

## 1. Source identity

- Name: Open Agent Spec (Agent Spec).
- Maintainer: Oracle.
- Canonical URL: `url://github.com/oracle/agent-spec`.
- SDKs: PyAgentSpec (Python), tsagentspec (TypeScript).

## 2. Fetch trace

- `cmd://WebFetch url://github.com/oracle/agent-spec` —
  2026-05-19; returned README — definition,
  serialization, multi-SDK conformance posture.

## 3. Verbatim claims this corpus depends on

- **Definition** (`url://github.com/oracle/agent-spec`
  README): "Open Agent Spec (Agent Spec) is a
  framework-agnostic declarative language for defining
  agentic systems."

- **Scope** (verbatim): Agent Spec "defines building
  blocks for standalone agents and structured agentic
  workflows as well as common ways of composing them
  into multi-agent systems."

- **Serialization**: JSON/YAML. Users can "serialize /
  deserialize Agents to JSON/YAML, or create them from
  object representations with the assurance of
  conformance to the specification."

- **Multi-SDK conformance**: "SDKs in various
  languages can implement Agent Spec components with
  the assurance of conformance to the specification."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Oracle Agent Spec is the closest published precursor
to spec-as-distribution-artefact: it ships an agent
description that ANY conforming SDK can consume to
instantiate the agent. The methodology generalises
this from "agent description" to "product description"
— same posture, broader scope.

Key shape implications:

- The "framework-agnostic declarative language" framing
  is the methodology's framing for the SPEC bundle.
  Methodology can cite Agent Spec as precedent for
  cross-framework conformance.
- The multi-SDK pattern (Python + TypeScript SDKs
  conforming to the same spec) is the methodology's
  multi-runner pattern (any conforming installer agent
  can install from the SPEC bundle).
- JSON/YAML serialization is a candidate format for
  the methodology's front-door manifest; Agent Spec
  uses both.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/oracle-agent-spec.md
§3`):

- methodology-claim: "Oracle's Open Agent Spec is a
  framework-agnostic declarative language for
  defining agentic systems — closest published
  precursor to the methodology's spec-as-distribution
  posture for products generally."
- methodology-claim: "Agent Spec ships SDKs in
  multiple languages (Python, TypeScript) that
  conform to the same specification — the multi-
  runner pattern the methodology generalises."
- methodology-claim: "JSON and YAML are Agent Spec's
  serialization formats — both are candidates for
  the methodology's front-door manifest format."

## 6. Open questions surfaced by the primary read

- Agent Spec's scope is agentic systems (agents +
  workflows + multi-agent composition); the
  methodology's scope is products generally. The
  scope-generalisation step must be done by the
  methodology, not inherited from Agent Spec.
- Agent Spec's conformance model details (test
  harness? reference suite? validation tooling?)
  were not deep-read on this pass. If the
  methodology adopts a conformance harness, a
  deeper read of Agent Spec's conformance tests is
  warranted.
- The README does NOT compare Agent Spec to Spec Kit
  or other spec formats; the methodology must do
  that comparison work itself (or cite separate
  comparison sources).
