# Chapter 05 — Phase 4: Manifest + Catalog Compose

## The composition question

Phases 0 through 3 close in sequence: maturity check
(chapter 01), facet inventory (chapter 02),
parameterization surface (chapter 03), sanitization bar
(chapter 04). Each phase hands its output to the next.
Phase 4's input is the full set: a sanitized, parameterized
per-artefact classification table. Phase 4's output is the
shippable artefact — what an installer actually downloads,
clones, or pulls. The research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 4 names the shape directly: "Produce the
front-door manifest + per-facet sub-specs per §5. Each
sub-spec uses the artefact shape best suited to its facet
(structured data, prose, executable, diagram)."

## The four artefact shapes

The workpad's "best suited to its facet" line is the
methodology's claim that a single document type cannot
carry every facet faithfully. Different facets want
different shapes.

**Structured data.** Architecture facets that capture
relations, deployment facets that capture parameter
schemas, decisions facets that capture machine-readable
metadata want a structured-data shape — YAML or JSON
under a schema. The prior-art template is
`research/primary-sources/helm-values-schema.md` §3:
Helm's `Chart.yaml` carries metadata, `values.yaml`
carries adopter overrides, and a JSON Schema validates
the override at install time.

**Prose.** Architecture context, decisions rationale,
non-goals statements want a prose shape — markdown with
the conventions of a documented architecture. The
prior-art template is `research/primary-sources/arc42.md`
§3: arc42's 12-section template structures architecture
prose around a fixed set of viewpoints.

**Executable.** Behavior contracts want an executable
shape — given a precondition, when an action runs, then
an observable outcome. The prior-art template is
`research/primary-sources/cucumber-gherkin.md` §3:
Gherkin's Given/When/Then `.feature` files express
behavior as runnable specifications.

**Diagram.** Architecture facets at a non-trivial level
of decomposition want a diagram shape — but a diagram
that lives in source control alongside the other
artefacts. The prior-art template is
`research/primary-sources/c4-model.md` §3 (the
four-abstraction hierarchy: System → Container →
Component → Code) combined with
`research/primary-sources/structurizr-dsl.md` §3
(a text-based DSL that compiles to C4 diagrams),
giving us diagram-as-code.

## The manifest as front door

Four artefact shapes means four-or-more files at minimum,
and a real spec bundle has dozens. Something has to be the
front door — the file an installer opens first that names
every other file in the bundle. The prior-art template is
`research/primary-sources/oci-artifacts.md` §3: an OCI
image manifest "contains metadata about the contents and
dependencies of the image" and names every layer that
makes up the image. The methodology adapts this for spec
bundles. The manifest is a single structured-data file at
a known top-level path that names every facet, points at
the per-facet sub-spec file(s), declares versions, and
records integrity material (hash, signature, provenance).
An installer reads the manifest first; the manifest tells
the installer where everything else is.

## Where BES landed

The research workpad §7 records the BES Phase 4
disposition plainly: "the BES sanitized framework repo
(Product A) IS the worked example of the catalog shape."
The parent Decision SPEC at
`../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7 binds the paired Product A v2.0 / Product B v1.0
release and names the front-door manifest plus per-facet
sub-specs as the structural contract. Chapter 02 already
established the seven facets per workpad §6 Phase 1 —
Architecture, Deployment, Behavior, Customization,
Decisions, Operations, Non-goals — and chapter 04 already
established the Product A / Product B sanitization
asymmetry. What chapter 05 adds is the composition shape
itself: per parent Decision §7's binding, Product A v2.0
ships a top-level manifest plus per-facet sub-specs that
follow the four-artefact-shape mapping above. The
conformance facet shipped `reserved` per chapter 01's
prior disclosure — the manifest names the facet honestly,
but the executable conformance suite is not yet authored.

## Phase 4 failure note (BES)

**What happened.** Workpad §7 records Product A as the
worked example of the catalog shape; parent Decision §7
binds the v2.0 release and the manifest+catalog
structural contract. Chapter 01 records that the
conformance facet shipped `reserved` — the manifest
declares the facet exists in the schema but the suite
is not yet authored.

**What we did.** We composed the manifest plus per-facet
sub-spec catalog and disclosed the reserved-conformance
gap in the manifest itself, rather than omitting the
facet entirely or pretending it was complete.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: a manifest+catalog that discloses a
reserved facet is closer to honest than a manifest that
ships every facet as superficially complete. Reserved
status names the gap an installer needs to know about;
omission lets the installer discover the gap by
hitting it in production. The next release closes the
gap; in the meantime, the disclosure is doing real work.

---

**In the next chapter**: Phase 5 — cross-family
validation. With a sanitized manifest+catalog composed,
how do we test that an installer not steeped in our
studio context can actually install from it?
