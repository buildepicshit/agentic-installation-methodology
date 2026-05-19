---
slug: symphony-spec
source_name: "OpenAI Symphony — SPEC.md (operating-model-as-SPEC)"
primary_url: "https://github.com/openai/symphony/blob/main/SPEC.md"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
methodology_relevance: |
  Symphony's SPEC.md is the only example of
  "operating-model-as-SPEC" identified by this project's
  research workpad — research §3 named it the source of
  14 transferable building blocks for the methodology.
  (Note: the "only" framing is project-research-scoped,
  not a globally-licensed uniqueness claim — fixed per
  codex Round-2 finding 2.6 PARTIAL: Symphony's own
  SPEC.md does not assert global uniqueness.) This corpus
  entry anchors the 18-section structure, the three-
  profile conformance model, and the tiered
  Definition-of-Done so the methodology can cite Symphony
  precisely when prescribing the SPEC bundle's shape and
  conformance harness.
---

# OpenAI Symphony SPEC.md

## 1. Source identity

- Name: OpenAI Symphony SPEC.md.
- Author: OpenAI (Symphony project).
- Canonical URL: `url://github.com/openai/symphony/blob/main/SPEC.md`.
- License: project license (OpenAI; not deep-read for
  exact licence terms on this pass).
- Status: in-the-wild operating-model-as-SPEC; cited as
  prior art for the methodology.

## 2. Fetch trace

- `cmd://WebFetch url://github.com/openai/symphony/blob/main/SPEC.md`
  — 2026-05-19; returned 18-section structure, §17
  Conformance Profiles, §18 DoD subsection breakdown.

## 3. Verbatim claims this corpus depends on

- **Symphony definition** (`url://github.com/openai/symphony/blob/main/SPEC.md`
  §1 Problem Statement): "Symphony is a long-running
  automation service that continuously reads work from
  an issue tracker (Linear in this specification
  version), creates an isolated workspace for each
  issue, and runs a coding agent session for that issue
  inside the workspace."

- **The 18-section structure**:
  1. Problem Statement
  2. Goals and Non-Goals
  3. System Overview
  4. Core Domain Model
  5. Workflow Specification (Repository Contract)
  6. Configuration Specification
  7. Orchestration State Machine
  8. Polling, Scheduling, and Reconciliation
  9. Workspace Management and Safety
  10. Agent Runner Protocol
  11. Issue Tracker Integration Contract
  12. Prompt Construction and Context Assembly
  13. Logging, Status, and Observability
  14. Failure Model and Recovery Strategy
  15. Security and Operational Safety
  16. Reference Algorithms
  17. Test and Validation Matrix
  18. Implementation Checklist

- **§17 Conformance Profiles** — three profiles:
  - **Core Conformance**: "Deterministic tests required
    for all conforming implementations."
  - **Extension Conformance**: "Required only for
    optional features an implementation chooses to
    ship."
  - **Real Integration Profile**: "Environment-dependent
    smoke/integration checks recommended before
    production use."

- **§18 Definition of Done** — three subsections aligned
  with §17 profiles:
  - §18.1 REQUIRED for Conformance: 23 mandatory
    components (workflow loader, orchestrator, tracker
    client, workspace manager, hooks, agent runner,
    retry queue, reconciliation, observability).
  - §18.2 RECOMMENDED Extensions: 4 optional
    capabilities (HTTP server, Linear GraphQL tool,
    persistence across restarts, pluggable tracker
    adapters).
  - §18.3 Operational Validation Before Production: 3
    pre-deployment checks (integration testing, host OS
    verification, HTTP server configuration).

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

The 18-section structure is the most concrete in-the-wild
example of operating-model-as-SPEC the methodology can
cite. Confirmed transferable building blocks from research
§3 (14 named blocks): the per-section anchoring of
domain model, workflow contract, configuration pipeline,
state machine, idempotency rules, safety invariants,
observability layering, failure-class × recovery matrix,
trust boundary, conformance profiles, tiered Definition
of Done.

The Symphony-specific (non-transferable) sections:
- §10 Agent Runner Protocol — agent-specific.
- §11.1-§11.4 Issue Tracker Integration — Linear-bound.
- §12 Prompt Construction — prompt-engineering-specific.
- §16 Reference Algorithms — Symphony-specific
  algorithms.
- §4 entity content — Codex/Linear-specific.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/symphony-spec.md §3`):

- methodology-claim: "Symphony's SPEC.md is the only
  example of an operating-model shipped as a versioned
  18-section SPEC artefact (with three-profile
  conformance harness + tiered DoD) **identified by
  this project's research workpad** at
  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §3. Symphony's own SPEC.md does not assert global
  uniqueness; the global-uniqueness claim is research-
  workpad scoped, not primary-source licensed."
- methodology-claim: "Symphony's three-profile
  conformance model (Core / Extension / Real-Integration)
  is reusable for the methodology's published SPEC
  bundle conformance harness."
- methodology-claim: "Symphony's tiered Definition-of-
  Done (§18.1 REQUIRED + §18.2 RECOMMENDED + §18.3
  pre-production checks) is the most directly portable
  section in the document and the methodology's
  SPEC-bundle Definition-of-Done MAY adopt the same
  structure."
- methodology-claim: "Symphony §5 Workflow Specification
  (the repo-owned contract pattern with framework-
  defined schema + free-form body + strict validation)
  is the most novel-and-portable building block in the
  Symphony document."

## 6. Open questions surfaced by the primary read

- Symphony's SPEC.md is bound to Linear as the issue
  tracker; the methodology's framing is tracker-
  agnostic. Citations of Symphony as prior art must
  note this binding.
- Symphony ships an Elixir reference implementation
  (per external coverage) but the SPEC.md itself does
  not bind to Elixir. Methodology may want to cite
  Symphony as evidence of "single SPEC + multiple
  language implementations" but should not put
  reference-implementation language constraints on its
  own SPEC bundle.
- Symphony §17 Conformance Profiles + §18 DoD are
  Symphony's quality bar; the methodology's SPEC bundle
  conformance suite is a separate harness. The shape is
  transferable but the contents are not.
