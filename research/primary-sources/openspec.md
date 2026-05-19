---
slug: openspec
source_name: "OpenSpec — Spec-driven development for AI coding assistants"
primary_url: "https://github.com/Fission-AI/OpenSpec"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched Fission-AI/OpenSpec README; three-command workflow + artefact set + lighter-than-Spec-Kit posture verbatim"
methodology_relevance: |
  OpenSpec is a recent (Fission-AI) spec-driven dev tool
  that positions itself as the lighter counterpart to
  Spec Kit. This corpus entry anchors its workflow and
  posture so the methodology can survey the spec-as-
  authoring tool space accurately.
---

# OpenSpec

## 1. Source identity

- Name: OpenSpec — Spec-driven development for AI
  coding assistants.
- Canonical URL: `url://github.com/Fission-AI/OpenSpec`.
- Maintainer: Fission AI.
- Posture: spec-as-authoring, tool-agnostic across
  AI coding assistants.

## 2. Fetch trace

- `cmd://WebFetch url://github.com/Fission-AI/OpenSpec`
  — 2026-05-19; returned definition, three-stage
  workflow, artefact set, comparisons to Spec Kit and
  Kiro.

## 3. Verbatim claims this corpus depends on

- **Definition** (`url://github.com/Fission-AI/OpenSpec`):
  OpenSpec is "Spec-driven development (SDD) for AI
  coding assistants."

- **Philosophy** (verbatim): "fluid not rigid →
  iterative not waterfall → easy not complex → built
  for brownfield not just greenfield → scalable from
  personal projects to enterprises."

- **Three-stage workflow**:
  1. `/opsx:propose "your idea"` — "AI creates
     proposal, specs, design, and tasks."
  2. `/opsx:apply` — "AI implements tasks from the
     checklist."
  3. `/opsx:archive` — "Completed changes move to
     archive folder."

- **Extended commands**: `/opsx:new`, `/opsx:continue`,
  `/opsx:ff`, `/opsx:verify`, `/opsx:bulk-archive`,
  `/opsx:onboard`.

- **Artefact set per change**:
  - `proposal.md` — rationale and overview.
  - `specs/` — requirements and scenarios.
  - `design.md` — technical approach.
  - `tasks.md` — implementation checklist.

- **Comparison to Spec Kit** (per README):
  OpenSpec is "lighter" with freedom to "iterate
  freely" rather than enforcing "rigid phase gates"
  and "lots of Markdown."

- **Comparison to Kiro** (per README): OpenSpec is
  "tool agnostic"; Kiro locks users into "their IDE
  and limited to Claude models," whereas OpenSpec
  "works with the tools you already use" (20+ AI
  assistants).

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

OpenSpec is spec-as-authoring (like Spec Kit, Kiro)
with different ergonomics: lighter phase structure,
tool-agnostic, brownfield-friendly. Posture-wise it is
still authoring-time, intra-team; the methodology's
spec-as-distribution scope is distinct.

OpenSpec's "brownfield not just greenfield" framing is
relevant prior art for the methodology: extracting a
SPEC from an existing product (Product A v1.1 → v2.0
manifest+catalog) IS brownfield extraction. The
methodology may want to acknowledge OpenSpec's
brownfield emphasis.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/openspec.md §3`):

- methodology-claim: "OpenSpec is a tool-agnostic
  spec-driven development tool (Fission AI) with a
  three-stage workflow: propose / apply / archive."
- methodology-claim: "OpenSpec's 'brownfield not just
  greenfield' posture is relevant prior art for the
  methodology's extraction-from-existing-product
  emphasis."
- methodology-claim: "The spec-as-authoring tool
  space includes at least three named tools (Spec Kit,
  Kiro, OpenSpec) with different ergonomic tradeoffs;
  the methodology's spec-as-distribution-artefact
  posture is distinct from all three."

## 6. Open questions surfaced by the primary read

- OpenSpec is recent (Fission-AI; release timing not
  verified on this pass). The "20+ AI assistants"
  claim was not enumerated in the fetched content; if
  methodology cites OpenSpec's compatibility surface,
  fetch the supported-tools list separately.
- OpenSpec's "brownfield-friendly" posture is a claim
  not deeply verified; methodology's case study
  (Product A repack) IS brownfield extraction but the
  methodology should not borrow OpenSpec's tooling for
  the case study unless that's deliberately chosen.
- The criticism of Spec Kit ("rigid phase gates",
  "lots of Markdown") is OpenSpec's competitive
  framing; the methodology should treat this as
  marketing language, not as primary fact about Spec
  Kit. Spec Kit's primary read (corpus slug `spec-
  kit`) is the authoritative source on Spec Kit's
  posture.
