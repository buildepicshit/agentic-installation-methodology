---
slug: adr-tools-state
source_name: "adr.github.io — state of ADR practice"
primary_url: "https://adr.github.io/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "partial"
fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
methodology_relevance: |
  State-of-practice ADR ecosystem (MADR, Y-statements,
  Nygard, adr-tools CLI) is the cross-check against
  Nygard's 2011 origin. This corpus entry anchors
  community framing and template diversity so the
  methodology's decisions facet can survey current
  practice rather than locking only on Nygard.
---

# adr.github.io — State of ADR Practice

## 1. Source identity

- Name: adr.github.io — community resource for
  Architecture Decision Records.
- Canonical URL: `url://adr.github.io/`.
- Posture: community catalogue of ADR templates,
  tooling, practices.
- Linked sub-pages (not deep-read on this pass):
  `/adr-templates/`, `/ad-practices/`,
  `/adr-tooling/`.

## 2. Fetch trace

- `cmd://WebFetch url://adr.github.io/` — 2026-05-19;
  returned ADR community definition, template family
  references; specific template catalogs and CLI
  conventions live on sub-pages not fetched in this
  pass.

## 3. Verbatim claims this corpus depends on

- **ADR (community definition)**: "An Architectural
  Decision Record (ADR) captures a single AD and its
  rationale; Put it simply, ADR can help you
  understand the reasons for a chosen architectural
  decision, along with its trade-offs and consequences."
  (`url://adr.github.io/`)

- **Architectural Decision (community definition)**:
  "a justified design choice that addresses a
  functional or non-functional requirement that is
  architecturally significant."

- **Template families referenced** (per root page;
  catalogue at `/adr-templates/`):
  - **Nygard's template** — the foundational 2011
    blog post template (corpus entry `adr-nygard`).
  - **Y-statements** — from Zdun et al.'s "Sustainable
    Architectural Decisions" paper.
  - **MADR** (Markdown Architectural Decision Records)
    — community-maintained richer template.
  - Reference to "seven templates" comparison paper.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

The state-of-practice ADR ecosystem confirms Nygard's
template is foundational but no longer the only option.
The methodology's decisions facet must choose between:

- Mandating Nygard's exact 5-section template (most
  restrictive; clearest);
- Allowing the MADR richer template (more fields:
  status, deciders, context-and-problem-statement,
  considered-options, decision-outcome, pros-and-cons-
  of-the-options);
- Allowing Y-statements (one-line decision statements
  with reasoning lattice);
- Permitting any of the catalogued templates.

The choice is a methodology design decision; this
corpus entry provides the landscape from which the
decision is made.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/adr-tools-state.md
§3`):

- methodology-claim: "The state-of-practice ADR
  ecosystem includes Nygard's template (origin),
  MADR (community-rich), Y-statements (Zdun et al.),
  and other templates catalogued at adr.github.io."
- methodology-claim: "ADRs are community-defined as
  'capturing a single AD and its rationale,
  trade-offs, and consequences'."
- methodology-claim: "An Architectural Decision is
  'a justified design choice that addresses a
  functional or non-functional requirement that is
  architecturally significant'."
- methodology-claim: "The methodology's decisions/
  sub-spec MAY permit one or more catalogued ADR
  templates; the choice is a methodology design
  decision (not resolved by the community)."

## 6. Open questions surfaced by the primary read

- The adr.github.io root page references but does not
  enumerate the full template catalogue;
  `/adr-templates/` is the dedicated page. If
  methodology mandates a specific template, fetch
  that page.
- adr-tools CLI conventions (file naming, directory
  layout, `adr new`, `adr supersede` semantics) live
  on `/adr-tooling/`; not deep-read in this pass. If
  methodology adopts adr-tools-style conventions for
  the decisions/ sub-spec, fetch separately.
- The "seven templates" comparison paper is cited
  but not named in the fetched content; the
  methodology may want to find this paper for a
  deeper template-survey citation.
