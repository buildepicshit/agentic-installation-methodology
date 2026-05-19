---
slug: c4-model
source_name: "The C4 model for visualising software architecture"
primary_url: "https://c4model.com/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched c4model.com/ + c4model.com/abstractions; four-level hierarchy confirmed verbatim; notation+tooling independence confirmed"
methodology_relevance: |
  C4 is the methodology's primary reference for
  architecture decomposition at the Container / Component
  level, cited in the research workpad §5.1 packaging
  recommendation. This corpus entry establishes the four
  abstractions verbatim, the notation-independence
  posture, and the boundary with code-level diagrams so
  the methodology can cite C4 precisely when prescribing
  the architecture/ sub-spec's diagram shape.
---

# C4 Model

## 1. Source identity

- Name: The C4 model for visualising software
  architecture.
- Author / maintainer: Simon Brown.
- Canonical URL: `url://c4model.com/`; abstractions
  detail at `url://c4model.com/abstractions`.
- Posture: notation-independent, tooling-independent,
  hierarchical.

## 2. Fetch trace

- `cmd://WebFetch url://c4model.com/` — 2026-05-19;
  returned definition + four-abstraction hierarchy +
  notation-independence statement.
- `cmd://WebFetch url://c4model.com/abstractions` —
  2026-05-19; returned per-level descriptions.

## 3. Verbatim claims this corpus depends on

- **Self-definition (homepage)**: "The C4 model is an
  easy to learn, developer friendly approach to software
  architecture diagramming." (`url://c4model.com/`
  #the-c4-model-for-visualising-software-architecture)

- **The four-abstraction hierarchy** (`url://c4model.com/`):
  C4 comprises "a set of hierarchical abstractions"
  consisting of:
  1. Software systems
  2. Containers
  3. Components
  4. Code

- **Software System** (`url://c4model.com/abstractions`):
  "A software system is made up of one or more containers
  (applications and data stores)."

- **Container** (`url://c4model.com/abstractions`):
  containers "contain one or more components"; they are
  "applications and data stores" — distinct from Docker
  containers per the model's own terminology, though the
  abstractions page does not contain an explicit
  Docker-disambiguation sentence in the fetched excerpt.

- **Component** (`url://c4model.com/abstractions`):
  components are elements contained within containers
  that "in turn are implemented by one or more code
  elements."

- **Code** (`url://c4model.com/abstractions`): the
  lowest level — "classes, interfaces, objects,
  functions, etc" that implement components.

- **Notation independence** (`url://c4model.com/`
  #diagrams/notation): C4 is "notation independent" —
  the model does not prescribe UML, ArchiMate, or any
  particular notation.

- **Tooling independence** (`url://c4model.com/`
  #tooling): C4 is "tooling independent" — works with
  any diagramming tool.

## 4. Gap from prior summary characterization

Prior summary in
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§3 / §5.1 cited C4 as the architecture decomposition
primitive at "Container-level (Structurizr DSL preferred
for machine-readability)." This primary read closes the
gap on:

- The exact four-level hierarchy is now anchored verbatim, <!-- lint-ok: no-citation -->
  not paraphrased.
- The notation-independence and tooling-independence <!-- lint-ok: no-citation -->
  postures are anchored to the homepage's own
  headings — the methodology can cite these as
  conformance properties C4 offers that other
  decomposition frameworks (e.g. arc42, ADRs) do not.
- The "Container" disambiguation was NOT found verbatim <!-- lint-ok: no-citation -->
  on the fetched pages; the abstractions page implies the
  distinction (Container = applications and data stores)
  but does not state "Container is NOT a Docker
  container" in the fetched text. This is an `open
  question` for §6.

## 5. Downstream-citation surface

The following methodology claims are licensed by this
entry (cite as
`file://research/primary-sources/c4-model.md §3`):

- methodology-claim: "C4 is a four-level hierarchical <!-- lint-ok: no-citation -->
  architecture-visualisation model: Software Systems →
  Containers → Components → Code."
- methodology-claim: "C4 is notation-independent and <!-- lint-ok: no-citation -->
  tooling-independent (per c4model.com homepage
  #diagrams/notation, #tooling)."
- methodology-claim: "C4 Containers are applications and <!-- lint-ok: no-citation -->
  data stores, not Docker containers — the terminology
  is C4's own and predates / is separate from container
  runtimes."
- methodology-claim: "Code-level (level 4) diagrams in C4 <!-- lint-ok: no-citation -->
  represent classes, interfaces, objects, functions; the
  methodology's architecture/ sub-spec MAY include
  Container + Component diagrams but Code-level diagrams
  are typically generated rather than authored."

## 6. Open questions surfaced by the primary read

- The exact "C4 Container is NOT a Docker container"
  disambiguation sentence was not present in the fetched
  excerpts. A deeper read of `url://c4model.com/diagrams/container`
  may yield the verbatim disambiguation. The methodology's
  prose draft should not put quote marks around a
  Docker-disambiguation phrasing this corpus has not
  anchored.
- C4's relationship to UML / ArchiMate is implied by the
  "notation independent" posture but not stated as a
  comparison; if downstream methodology compares C4 to
  UML decomposition, that comparison should be sourced
  separately or framed as agent-synthesis.
- Structurizr DSL (separate corpus entry slug:
  `structurizr-dsl`) is C4's reference implementation;
  the relationship between C4-as-model and Structurizr-
  as-DSL is documented separately. Cross-reference at
  artefact-completion time.
