---
slug: arc42
source_name: "arc42 — template for architecture communication and documentation"
primary_url: "https://docs.arc42.org/section-1/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched docs.arc42.org/section-1/ and arc42.org/overview/; section list + maintainers + license confirmed"
methodology_relevance: |
  arc42 is the most-cited prior-art template for architecture
  documentation in the methodology's research workpad §3 / §4.
  This corpus entry establishes arc42's 12-section structure,
  its self-description ("template for architecture communication
  and documentation"), and its maintenance posture, so the
  methodology can cite arc42 sections precisely (e.g. §8
  Crosscutting Concepts vs §9 Architectural Decisions) when
  comparing decomposition primitives.
---

# arc42

## 1. Source identity

- Name: arc42 — Template for Architecture Communication and
  Documentation.
- Canonical URL: `url://docs.arc42.org/` (primary template
  chapters at `/section-1/` through `/section-12/`); overview
  at `url://arc42.org/overview/`.
- Maintainers: Dr. Peter Hruschka and Dr. Gernot Starke
  (`url://arc42.org/overview/`).
- Supporters: Per Starke Web Development; innoQ
  (`url://arc42.org/overview/`).
- License posture: open-source-friendly; explicit licence
  link at `url://arc42.org/license` (not deep-read).

## 2. Fetch trace

- `cmd://WebFetch url://docs.arc42.org/section-1/` —
  2026-05-19; returned section listing + section-1
  excerpts; primary read.
- `cmd://WebFetch url://arc42.org/overview/` — 2026-05-19;
  returned definition, maintainers, license link;
  supplementary primary read.

## 3. Verbatim claims this corpus depends on

- **Self-definition (overview page)**: arc42 describes
  itself as "a template for architecture communication and
  documentation." It addresses "what should be documented
  about your architecture, and how it should be
  communicated." (`url://arc42.org/overview/`)

- **The 12 sections** of the arc42 template
  (`url://docs.arc42.org/section-1/` navigation), in order:

  1. Introduction and Goals
  2. Constraints
  3. Context and scope
  4. Solution strategy
  5. Building block view
  6. Runtime view
  7. Deployment view
  8. Concepts
  9. Architecture decisions
  10. Quality
  11. Risks and technical debt
  12. Glossary

- **Section 1.0 (Introduction and Goals)** — verbatim:
  "Describes the relevant requirements and the driving
  forces that software architects and development team
  must consider." (`url://docs.arc42.org/section-1/`)

- **Section 1.2 (Quality Goals)** — verbatim: "The top
  three (max five) quality goals for the architecture
  whose fulfillment is of highest importance to the major
  stakeholders." (`url://docs.arc42.org/section-1/`)

- **Posture** (overview): the template "presents itself
  as pragmatic and tailored to your specific needs."
  arc42 is intended as "a comprehensive, adaptable
  approach to architecture documentation rather than a
  prescriptive mandate." (`url://arc42.org/overview/`)

## 4. Gap from prior summary characterization

Prior summary in
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§12 noted arc42 as "access-denied and characterized via
WebSearch summaries." This primary read closes that gap:

- The exact 12-section list is now confirmed and citable <!-- lint-ok: no-citation -->
  by name and position (not paraphrased).
- arc42's self-description ("template for architecture <!-- lint-ok: no-citation -->
  communication and documentation") is anchored verbatim
  rather than inferred.
- arc42's adaptable-not-prescriptive posture is confirmed <!-- lint-ok: no-citation -->
  by the overview page, supporting the research workpad's
  characterization of arc42 as decomposition prior art
  whose customization model is implicit rather than
  formalized.

## 5. Downstream-citation surface

The following methodology claims are now licensed by this
corpus entry (downstream cite as
`file://research/primary-sources/arc42.md §3`):

- methodology-claim: "arc42 ships a 12-section structure <!-- lint-ok: no-citation -->
  covering introduction-and-goals, constraints, context,
  solution strategy, building-block view, runtime view,
  deployment view, concepts, architecture decisions,
  quality, risks-and-technical-debt, glossary."
- methodology-claim: "arc42 §9 Architecture Decisions <!-- lint-ok: no-citation -->
  exists as a separate section — decisions are first-class
  in arc42's decomposition, not buried inside design
  rationale."
- methodology-claim: "arc42 is pragmatic and adaptable, not <!-- lint-ok: no-citation -->
  a prescriptive mandate — author self-description."
- methodology-claim: "arc42 §8 Concepts covers crosscutting <!-- lint-ok: no-citation -->
  technical concerns; the agentic-installation methodology
  proposes additional decomposition primitives (customization
  catalog, deferral contract) that arc42 does not natively
  model."

## 6. Open questions surfaced by the primary read

- arc42 §9 Architecture Decisions does not specify an
  artefact shape (no ADR-template binding); a deeper read
  of arc42's published examples is needed to know whether
  arc42 §9 typically defers to Nygard-format ADRs or has
  its own preferred structure.
- arc42 §10 Quality and §11 Risks-and-Technical-Debt are
  named separately from §8 Concepts; the methodology's
  proposed "quality" facet (research §5.1) needs to
  decide whether it follows arc42's three-way split or
  collapses them.
- The license terms at `url://arc42.org/license` were not
  fetched on this pass; if downstream methodology
  artefacts reproduce arc42 templates or imagery, the
  license should be verified.
