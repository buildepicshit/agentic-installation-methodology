---
slug: structurizr-dsl
source_name: "Structurizr DSL — text-based C4 model definition"
primary_url: "https://docs.structurizr.com/dsl"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "partial"
fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
methodology_relevance: |
  Structurizr DSL is research §5.1's machine-readable
  C4 implementation. This corpus entry anchors the
  DSL's purpose and posture so the methodology can
  cite it precisely as the architecture/ sub-spec's
  preferred diagram-as-code primitive.
---

# Structurizr DSL

## 1. Source identity

- Name: Structurizr DSL — text-based domain-specific
  language for defining C4-model architectures.
- Author: Simon Brown (same author as C4 model).
- Canonical URL: `url://docs.structurizr.com/dsl`.
- Posture: architecture-as-code.

## 2. Fetch trace

- `cmd://WebFetch url://docs.structurizr.com/dsl` —
  2026-05-19; primary-read of root page; definition +
  C4 implementation confirmed; deep syntax (workspace
  / model / views) not fully fetched on this pass.

## 3. Verbatim claims this corpus depends on

- **DSL definition** (`url://docs.structurizr.com/dsl`):
  the Structurizr DSL provides "a way to define a
  software architecture model (based upon the C4
  model) using a text-based domain specific language
  (DSL)."

- **C4-model basis** (per same page): the DSL
  implements the C4 model framework; the documentation
  references diagram types across the C4 hierarchy:
  system context, container, component, code.

- **Architecture-as-code posture** (per same page):
  "as code" philosophy — architecture definitions are
  text-based artefacts, versionable + readable +
  programmable.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Structurizr DSL is the architecture-as-code primitive
that lets the methodology's architecture/ sub-spec
ship machine-readable diagrams (not PNG renders or
hand-drawn artefacts). Key shape implications:

- The methodology's architecture/ sub-spec MAY ship
  one or more `.dsl` files that define the C4 model
  for the product; tooling (Structurizr Lite,
  Structurizr Cloud, or third-party renderers like
  c4-plantuml) renders them to diagrams at consumer
  time.
- Versionable + diff-able: architecture changes show
  up in git diffs, not in opaque image binaries.
- Pairs with C4 (separate corpus entry) — the
  methodology cites C4 as the conceptual model and
  Structurizr DSL as the preferred concrete encoding.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/structurizr-dsl.md
§3`):

- methodology-claim: "Structurizr DSL is a text-based
  DSL for defining C4-model architectures — diagrams
  as code."
- methodology-claim: "The methodology's architecture/
  sub-spec MAY ship .dsl files as the canonical
  diagram artefacts, renderable by Structurizr Lite /
  Cloud / third-party tooling."
- methodology-claim: "Structurizr DSL's architecture-as-
  code posture aligns with the methodology's
  preference for versionable + diff-able artefacts in
  the SPEC bundle."

## 6. Open questions surfaced by the primary read

- The exact DSL syntax (workspace, model, views
  keywords) was not deep-read in this pass — only the
  top-level navigation. If the methodology's
  architecture/ sub-spec sketches example .dsl
  snippets, a deeper fetch of `docs.structurizr.com/dsl/language`
  is needed.
- Alternative architecture-as-code tools (Mermaid,
  PlantUML with c4-plantuml, IcePanel, Likec4) cover
  similar ground; the methodology should acknowledge
  multiple options rather than mandating Structurizr.
- Structurizr's hosting model (Lite for self-host,
  Cloud for hosted) is a deployment choice for the
  methodology's downstream tooling, not part of the
  spec itself; flag for non-binding methodology
  guidance.
