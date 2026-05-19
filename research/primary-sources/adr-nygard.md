---
slug: adr-nygard
source_name: "Documenting Architecture Decisions — Michael Nygard (2011)"
primary_url: "https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched Cognitect blog post directly; ADR template + rationale + lightweight thesis confirmed verbatim"
methodology_relevance: |
  Nygard's 2011 post is the foundational ADR document;
  every state-of-practice ADR tooling (MADR, adr-tools,
  Y-statements) cites it as origin. The methodology's
  research workpad §5.1 names "ADRs (Nygard format),
  append-only, superseded-by-link" as the decisions
  facet primitive. This corpus entry anchors the
  template structure, the lightweight-documentation
  thesis, and the supersession model verbatim so the
  methodology can cite Nygard precisely.
---

# Architecture Decision Records (Nygard)

## 1. Source identity

- Title: "Documenting Architecture Decisions".
- Author: Michael Nygard.
- Date: 2011-11-15.
- Publisher: Cognitect blog.
- Canonical URL: `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions`.
- Status: foundational; widely cited as the origin of
  ADR practice.

## 2. Fetch trace

- `cmd://WebFetch url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions`
  — 2026-05-19; returned full post text including
  template structure, rationale, and lightweight-
  documentation thesis.

## 3. Verbatim claims this corpus depends on

- **ADR definition** (Nygard 2011): "An architecture
  decision record is a short text file in a format
  similar to an Alexandrian pattern."
  (`url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions`)

- **Scope of "architecturally significant"**: ADRs
  capture decisions "affecting structure, non-functional
  characteristics, dependencies, interfaces, or
  construction techniques."

- **The four core template sections**:
  1. **Title** — "short noun phrases" (example: "ADR 1:
     Deployment on Ruby on Rails 3.0.10").
  2. **Context** — "describes the forces at play,
     including technological, political, social, and
     project local" using "value-neutral" language.
  3. **Decision** — "states our response to these
     forces" in "full sentences, with active voice."
  4. **Consequences** — "describes the resulting
     context, after applying the decision" including
     positive, negative, and neutral outcomes.

- **Status section** — fifth (tracking) section: tracks
  whether decisions are "proposed," "accepted,"
  "deprecated," or "superseded."

- **Why ADRs matter** (verbatim): "One of the hardest
  things to track during the life of a project is the
  motivation behind certain decisions."

- **Lightweight thesis** (verbatim): "Large documents
  are never kept up to date. Small, modular documents
  have at least a chance at being updated." And: "Nobody
  ever reads large documents, either."

- **Length target** (verbatim guidance): ADRs are
  ideally "one or two pages long," written as "a
  conversation with a future developer."

## 4. Gap from prior summary characterization

Prior summary in
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§5.1 cited "ADRs (Nygard format), append-only,
superseded-by-link" without the verbatim template
structure or the lightweight thesis. This primary read
closes the gap:

- The five-section template (Title / Context / Decision <!-- lint-ok: no-citation -->
  / Consequences / Status) is anchored verbatim.
- The "Alexandrian pattern" framing is now citable as <!-- lint-ok: no-citation -->
  Nygard's own characterisation.
- The supersession lifecycle (proposed → accepted → <!-- lint-ok: no-citation -->
  deprecated → superseded) is anchored as Nygard's
  proposed status taxonomy.
- The "small modular documents are kept up to date" <!-- lint-ok: no-citation -->
  thesis is anchored as Nygard's rationale, not
  paraphrased.

## 5. Downstream-citation surface

The following methodology claims are licensed by this
entry (cite as
`file://research/primary-sources/adr-nygard.md §3`):

- methodology-claim: "ADRs are short (one-to-two-page) <!-- lint-ok: no-citation -->
  text files capturing architecturally significant
  decisions in a five-section template: Title, Context,
  Decision, Consequences, Status." (Nygard §3)
- methodology-claim: "ADR status lifecycle is proposed <!-- lint-ok: no-citation -->
  → accepted → deprecated → superseded; supersession
  produces a new ADR that references the old one's id."
- methodology-claim: "Nygard's lightweight thesis is <!-- lint-ok: no-citation -->
  that 'large documents are never kept up to date' —
  the methodology's decisions facet inherits this thesis
  in choosing per-decision artefacts over consolidated
  decision-log documents."
- methodology-claim: "Context section uses 'value- <!-- lint-ok: no-citation -->
  neutral' language describing forces at play —
  political, social, technological, project-local — so
  later readers can understand the decision's
  pressures."

## 6. Open questions surfaced by the primary read

- Nygard's post does not formalize a directory layout
  for ADRs; state-of-practice tooling (adr-tools, MADR)
  conventions are documented separately (corpus slug:
  `adr-tools-state`).
- The methodology's "decisions facet" sub-spec needs to
  decide whether to mandate Nygard's exact five-section
  template OR allow MADR's richer template OR allow
  Y-statements. This is a methodology design choice not
  resolvable from Nygard alone.
- Nygard's "Alexandrian pattern" framing implies the ADR
  is a single named pattern in a pattern language; the
  methodology has not yet committed to pattern-language
  framing for its own decisions facet.
