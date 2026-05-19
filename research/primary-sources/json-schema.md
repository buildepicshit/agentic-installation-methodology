---
slug: json-schema
source_name: "JSON Schema specification (Draft 2020-12)"
primary_url: "https://json-schema.org/specification.html"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "partial"
fetch_evidence: "fetched specification index page; vocabularies enumerated; conceptual definition + validation model NOT on the index page — both live on the actual spec drafts referenced from it"
methodology_relevance: |
  JSON Schema is the underlying validation primitive that
  both Helm values-schema and OpenAPI 3.1 build on. The
  methodology's customization sub-spec validates adopter
  knob declarations against JSON Schema directly; citing
  Helm + OpenAPI without anchoring JSON Schema is a
  transitive citation gap codex remediation 2.3 closes.
---

# JSON Schema (Draft 2020-12)

## 1. Source identity

- Name: JSON Schema specification.
- Canonical URL: `url://json-schema.org/specification.html`.
- Maintainer: JSON Schema project (community-maintained
  under json-schema.org).
- Current version: Draft 2020-12 (previous: 2019-09).
- License: documentation site is publicly published; the
  specification drafts themselves are MIT-licensed.

## 2. Fetch trace

- `cmd://WebFetch url://json-schema.org/specification.html`
  — 2026-05-19; returned the spec index page enumerating
  the two-part spec structure + the eight vocabularies.
  The index does NOT contain the conceptual definition
  or the validation-model walkthrough; those live in the
  Core + Validation drafts linked from the index.
- Status `partial`: deep reads of the Core draft and
  Validation draft are NOT performed in this pass.
  Methodology MUST NOT quote specific validation keyword
  semantics or vocabulary-resolution algorithms from
  this entry until those follow-on reads land.

## 3. Verbatim claims this corpus depends on

- **Two-part spec structure** (`url://json-schema.org/specification.html`):
  - **JSON Schema Core**: "defines the basic foundation
    of JSON Schema."
  - **JSON Schema Validation**: "defines the validation
    keywords of JSON Schema."

- **Current version**: Draft 2020-12 (previous: 2019-09).

- **The eight single-vocabulary meta-schemas**:
  1. Core Vocabulary
  2. Applicator Vocabulary
  3. Validation Vocabulary
  4. Unevaluated Vocabulary
  5. Format Annotation Vocabulary
  6. Format Assertion Vocabulary
  7. Content Vocabulary
  8. Meta-Data Vocabulary

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

JSON Schema is the primitive other corpus entries cite
transitively:

- `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/helm-values-schema.md`
  §3: Helm's `values.schema.json` uses JSON Schema for
  validation.
- `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/openapi-3-1.md`
  §3: "Data types in the OAS are based on the types
  supported by the JSON Schema Specification Draft
  2020-12. The Schema Object is a superset of JSON
  Schema Specification Draft 2020-12."

The methodology's customization sub-spec
(`url://github.com/buildepicshit/agentic-ops-framework/blob/main/spec-bundle/customization/contract.md`)
adopts JSON Schema directly for its `knobs.schema.json`
artefact; this corpus entry now grounds that adoption in
the primary source rather than transiting through Helm
or OpenAPI.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/json-schema.md §3`):

- methodology-claim: "JSON Schema Draft 2020-12 is the
  primary validation primitive the methodology adopts;
  Helm values-schema and OpenAPI 3.1 build on it."
- methodology-claim: "JSON Schema is split into Core
  (foundation) and Validation (keywords); the
  methodology cites both as a unit."
- methodology-claim: "Eight vocabularies (Core,
  Applicator, Validation, Unevaluated, Format
  Annotation, Format Assertion, Content, Meta-Data)
  organise the spec; the methodology may reference
  specific vocabularies once their drafts are deep-read."

## 6. Open questions surfaced by the primary read

- The index page does NOT contain the conceptual
  definition of JSON Schema or the validation model.
  Both live in the Core + Validation drafts. Deep reads
  of those drafts are queued as a follow-on corpus
  expansion (status: pending for the Core / Validation
  draft sub-entries; this aggregate entry sits at
  `partial`).
- The relationship between JSON Schema 2020-12 and
  earlier drafts (Draft 7, Draft 6) is not deep-read;
  adopter tooling commonly pins older drafts, so the
  methodology's customization sub-spec MAY need to
  acknowledge multi-draft support.
- The Format Assertion Vocabulary (separate from Format
  Annotation) shifts format strings from advisory to
  blocking; methodology MAY adopt format-assertion
  semantics but the choice should be deliberate and
  separately cited.
