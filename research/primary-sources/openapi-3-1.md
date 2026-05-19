---
slug: openapi-3-1
source_name: "OpenAPI Specification 3.1.0"
primary_url: "https://spec.openapis.org/oas/v3.1.0"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
methodology_relevance: |
  OpenAPI is research §5.1's HTTP-API contract
  primitive for the methodology's behavior/ sub-spec.
  This corpus entry anchors the root document
  structure, the JSON Schema 2020-12 relationship, and
  the explicit interface-not-implementation posture so
  the methodology can cite OpenAPI precisely when
  prescribing the behavior/ sub-spec's API contract
  shape.
---

# OpenAPI Specification 3.1.0

## 1. Source identity

- Name: OpenAPI Specification (OAS), version 3.1.0.
- Canonical URL: `url://spec.openapis.org/oas/v3.1.0`.
- Maintainer: OpenAPI Initiative (Linux Foundation).
- Posture: programming-language-agnostic interface
  description for HTTP APIs.

## 2. Fetch trace

- `cmd://WebFetch url://spec.openapis.org/oas/v3.1.0`
  — 2026-05-19; returned definition, root document
  fields, JSON Schema relationship, interface/
  implementation posture.

## 3. Verbatim claims this corpus depends on

- **Self-definition** (`url://spec.openapis.org/oas/v3.1.0`):
  "The OpenAPI Specification (OAS) defines a standard,
  programming language-agnostic interface description
  for HTTP APIs, which allows both humans and computers
  to discover and understand the capabilities of a
  service without requiring access to source code,
  additional documentation, or inspection of network
  traffic."

- **Root document fields** (per spec):
  - `openapi` (required) — OAS version.
  - `info` (required) — title, version, description,
    contact, license.
  - `servers` — Server Objects; defaults to `/`.
  - `paths` — endpoints and operations.
  - `webhooks` — incoming webhooks the API provider may
    initiate.
  - `components` — reusable schemas, responses,
    parameters, examples, request bodies, headers,
    security schemes, links, callbacks, path items.
  - `security` — security mechanisms applicable across
    the API.
  - `tags` — tags for documentation control.
  - `externalDocs` — additional external documentation.

- **JSON Schema relationship** (verbatim): "Data types
  in the OAS are based on the types supported by the
  JSON Schema Specification Draft 2020-12." The Schema
  Object is "a superset of JSON Schema Specification
  Draft 2020-12."

- **Multi-document support** (verbatim): "An OpenAPI
  document _MAY_ be made up of a single document or be
  divided into multiple, connected parts at the
  discretion of the author."

- **Interface vs implementation** (verbatim): "the API
  request and response bodies and other content are
  not required to be JSON or YAML." OpenAPI defines
  "the description of APIs, not their implementation,
  runtime behavior, or business logic."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

OpenAPI is the methodology's reference for
contract-as-spec at the HTTP-API surface. Key shape
implications for the methodology's behavior/ sub-spec:

- The methodology's behavior/ sub-spec covers ANY
  behavior contract, not only HTTP. OpenAPI is one of
  several behavior-contract primitives (others:
  Cucumber/Gherkin for behavioural acceptance,
  AsyncAPI for event-driven, GraphQL SDL).
- OpenAPI 3.1's adoption of JSON Schema 2020-12 means
  the methodology's customization/ sub-spec
  (Helm-values-schema-style) and behavior/ sub-spec
  (OpenAPI) can share JSON Schema as the validation
  language.
- The multi-document affordance — OpenAPI documents
  can be split across files — supports the
  methodology's manifest+catalog packaging shape: a
  service-with-many-endpoints can have a behavior/
  sub-spec composed of multiple OpenAPI files
  referenced from the front-door manifest.
- The interface-not-implementation posture is the
  methodology's own posture: the SPEC bundle describes
  what the product must DO, not how it is
  implemented.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/openapi-3-1.md §3`):

- methodology-claim: "OpenAPI 3.1.0 defines a
  programming-language-agnostic interface description
  for HTTP APIs covering paths, operations,
  components, security, webhooks."
- methodology-claim: "OpenAPI 3.1 Schema Object is a
  superset of JSON Schema 2020-12; the methodology's
  customization and behavior sub-specs MAY share JSON
  Schema as a validation language."
- methodology-claim: "OpenAPI documents may be split
  across multiple connected files at author
  discretion — the manifest+catalog packaging is a
  natural fit."
- methodology-claim: "OpenAPI describes interface,
  not implementation — the methodology's behavior/
  sub-spec inherits this distinction explicitly."

## 6. Open questions surfaced by the primary read

- AsyncAPI (event-driven APIs) and GraphQL SDL are
  separate behavior-contract primitives the
  methodology MAY support; not deep-read in this pass.
  If methodology adopts a multi-protocol behavior/
  sub-spec, those are separate corpus entries worth
  authoring as v1.1 corpus expansion.
- OpenAPI's `webhooks` field (introduced in 3.1) is
  one model for outbound-from-service contracts; the
  methodology may want to recommend this for
  webhook-driven products but should cite the 3.1
  changeset, not assume it's universally adopted.
- The OpenAPI specification is itself a large document
  (~100K words); a deeper read of specific sections
  (security, components, callbacks) may be needed if
  the methodology's behavior/ sub-spec specifies
  detailed conventions for those.
