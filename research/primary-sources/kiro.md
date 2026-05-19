---
slug: kiro
source_name: "Kiro — agentic AI coding IDE with spec-driven workflow"
primary_url: "https://kiro.dev/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched kiro.dev root; three-phase workflow (requirements / design / implementation) + EARS notation reference verbatim"
methodology_relevance: |
  Kiro is research §2.1's "spec-driven IDE" reference.
  This corpus entry anchors Kiro's three-phase workflow
  and the EARS-notation acceptance-criteria primitive
  so the methodology can cite Kiro precisely as a
  spec-as-authoring tool comparison point.
---

# Kiro

## 1. Source identity

- Name: Kiro — agentic AI IDE / CLI / web interface.
- Canonical URL: `url://kiro.dev/`.
- Posture: spec-driven; targets the "prototype to
  production" gap.

## 2. Fetch trace

- `cmd://WebFetch url://kiro.dev/` — 2026-05-19;
  returned definition, three-phase workflow, model
  reference; no AWS Bedrock language found on the
  homepage (the methodology's prior summary may have
  inferred a Bedrock binding that this primary read
  does not confirm).

## 3. Verbatim claims this corpus depends on

- **Self-definition** (`url://kiro.dev/`): "Kiro helps
  you bridge the gap from AI coding to engineering:
  manage intent, complete long-running tasks across
  large codebases, validate code correctness with an
  agent that learns how you work."

- **Form-factor**: "agentic AI with an IDE, CLI, and
  web interface that helps you go from prototype to
  production."

- **Three-phase workflow**:
  1. **Requirements** — "Kiro takes your natural
     language prompt and turns it into clear
     requirements and acceptance criteria in EARS
     notation."
  2. **Design** — "Kiro analyzes your codebase and
     comes up with the architecture, system design,
     and tech stack that meets your needs."
  3. **Implementation** — "Kiro then creates an
     implementation plan with discrete tasks,
     sequenced based on dependencies, with optional
     comprehensive tests." Users then "Ask Kiro to
     implement each task using advanced agents."

- **Model options**: "Claude Sonnet 4.5" or "Auto"
  models (per homepage); no explicit Bedrock binding
  found in fetched content.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Kiro is a spec-as-authoring tool — specs live inside
the developer's environment, drive code generation
inside the same environment. Same authoring-vs-
distribution distinction as Spec Kit.

EARS notation (Easy Approach to Requirements Syntax) is
the acceptance-criteria primitive Kiro adopts. The
methodology may reference EARS as a candidate
acceptance-criteria format for the behavior/ sub-spec,
but EARS itself is a separate specification (Mavin et
al.) that would merit its own corpus entry if
methodology mandates it.

The prior research workpad (§11 References)
characterised Kiro as "Bedrock-tethered." The primary
homepage read does NOT confirm this binding; the
homepage names Claude Sonnet 4.5 as a model option.
This is a gap-from-prior-summary correction worth
noting.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/kiro.md §3`):

- methodology-claim: "Kiro is an agentic AI IDE/CLI/
  web environment with a three-phase spec-driven
  workflow: Requirements → Design → Implementation."
- methodology-claim: "Kiro adopts EARS notation for
  acceptance criteria — a candidate primitive the
  methodology's behavior/ sub-spec MAY reference."
- methodology-claim: "Kiro is a spec-as-authoring
  tool (in-developer-environment); the methodology's
  spec-as-distribution-artefact posture is a different
  use case."

## 6. Open questions surfaced by the primary read

- The "Bedrock-tethered" characterisation in the prior
  research workpad was not confirmed by this primary
  read of the homepage. A deeper read of Kiro's
  enterprise / model-routing docs may be needed if
  methodology cites Kiro's hosting posture.
- EARS notation is a separate primary source
  (Mavin et al., 2009); if the methodology mandates
  EARS-format acceptance criteria, EARS deserves its
  own corpus entry.
- Kiro's CLI mode + agent dispatch model may be
  worth comparing to Symphony's per-issue isolated
  workspaces; not deep-read in this pass.
