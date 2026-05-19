---
slug: oci-artifacts
source_name: "OCI Image Specification + Artifacts Guidance"
primary_url: "https://github.com/opencontainers/image-spec/blob/main/spec.md"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
methodology_relevance: |
  OCI artifacts are research §5.1's "spec-as-distribution-
  artifact" packaging primitive — the published SPEC bundle
  can be distributed as an OCI artifact for content-
  addressed, signed delivery. This corpus entry anchors the
  manifest+config+layers structure, the descriptor model,
  and the artifacts-vs-images distinction so the
  methodology can cite OCI precisely when prescribing the
  SPEC bundle's distribution shape.
---

# OCI Image Specification + Artifacts Guidance

## 1. Source identity

- Name: OCI Image Specification.
- Canonical URL: `url://github.com/opencontainers/image-spec/blob/main/spec.md`.
- Maintainer: Open Container Initiative (Linux
  Foundation).
- Companion: Artifacts Guidance at
  `url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`
  (deep-read 2026-05-19 supplementary fetch per codex
  remediation finding 2.4; verbatim quotes incorporated in
  §3).

## 2. Fetch trace

- `cmd://WebFetch url://github.com/opencontainers/image-spec/blob/main/spec.md`
  — 2026-05-19; returned spec scope + manifest/config/
  layers + descriptor + artifacts-guidance reference.

## 3. Verbatim claims this corpus depends on

- **OCI Image definition**: "This specification defines
  an OCI Image, consisting of an image manifest, an image
  index (optional), a set of filesystem layers, and a
  configuration." (`url://github.com/opencontainers/image-spec/blob/main/spec.md`)

- **Image Manifest**: "a document describing the
  components that make up a container image." The
  manifest "contains metadata about the contents and
  dependencies of the image including the
  content-addressable identity of one or more filesystem
  layer changeset archives."

- **Image Configuration**: "a document determining layer
  ordering and configuration of the image suitable for
  translation into a runtime bundle."

- **Filesystem Layer**: "a changeset that describes a
  container's filesystem."

- **Descriptor**: "a reference that describes the type,
  metadata and content address of referenced content."
  Descriptors enable images to be "discovered by name,
  downloaded, verified by hash, trusted through a
  signature, and unpacked into an OCI Runtime Bundle."

- **OCI Artifacts Guidance** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`,
  deep-read 2026-05-19 supplementary fetch):
  - Verbatim: "Content other than OCI container images
    MAY be packaged using the image manifest."
  - Verbatim guidance on differentiating images from
    artifacts: "the `config.mediaType` value should not
    be a known OCI image config [media type]" and
    instead use "values specific to the artifact in
    `layer[*].mediaType`."
  - Normative posture: the document is **guidance**,
    not a formal specification; the only explicit
    RFC 2119 verb is the permissive "MAY" on
    artifact-via-image-manifest packaging. There is no
    MUST/SHOULD requirement compelling artifact
    packaging, only prescriptive guidance about media-
    type selection.
  - The historical non-conformant pattern
    (`application/vnd.oci.image.config.v1+json` for
    config with artifact-specific layer media types) is
    explicitly discouraged.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

OCI artifacts are the published-spec distribution
primitive that the methodology's SPEC bundle MAY adopt.
Key shape implications for the methodology's distribution
posture:

- A "front-door manifest + per-facet sub-specs" SPEC
  bundle MAPS directly onto OCI: the manifest is the
  bundle's front-door manifest; layers are the per-facet
  sub-specs as separate blobs; descriptors give content-
  addressing for each.
- Content-addressing by hash gives the methodology its
  "verifiable spec" affordance — the user-with-agent can
  verify the spec bundle they fetched matches what the
  developer published, by digest.
- Artifacts guidance covers non-image payloads (SBOMs,
  signatures, Helm charts) — the methodology's published
  SPEC bundle fits naturally into this category.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/oci-artifacts.md §3`):

- methodology-claim: "OCI Image Spec defines a four-
  component image: manifest, optional index, filesystem
  layers, configuration."
- methodology-claim: "OCI Descriptors enable content-
  addressing — every component is referenced by type,
  metadata, and content address; verification is by hash."
- methodology-claim: "OCI Artifacts Guidance extends the
  image spec to non-image payloads (SBOMs, signatures,
  Helm charts, methodology spec bundles)."
- methodology-claim: "The methodology's published SPEC
  bundle MAY be distributed as an OCI artifact: front-
  door manifest as OCI manifest; per-facet sub-specs as
  OCI layers; per-spec content-addressing by digest."

## 6. Open questions surfaced by the primary read

- The OCI Distribution Spec (separate from Image Spec)
  governs registry behaviour (push, pull, list, delete).
  Not deep-read in this pass; if methodology specifies a
  distribution channel, fetch as supplementary primary
  read.
- Helm v3 supports OCI registries natively; the
  intersection of OCI artifacts + Helm + Sigstore
  signing is a real-world precedent — the methodology
  MAY recommend this exact stack but should anchor each
  primitive separately rather than as a Helm-specific
  recipe.
- The Artifacts Guidance doc was deep-read on the
  2026-05-19 supplementary fetch (§3 last bullet
  block). The remaining open question is media-type
  naming for SPEC bundle artefacts specifically — the
  guidance permits non-OCI config media types but does
  not catalogue community conventions for
  methodology / spec-bundle artefacts. Methodology
  proposing specific media-type strings (e.g.
  `application/vnd.agentic-installation.spec-bundle+json`)
  needs an IANA-style convention proposal, not a
  further fetch of OCI guidance.
