---
slug: cyclonedx-sbom
source_name: "CycloneDX Software Bill of Materials specification"
primary_url: "https://cyclonedx.org/specification/overview/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched cyclonedx.org specification overview; definition + SBOM contents + format enumeration + supply-chain framing confirmed verbatim"
methodology_relevance: |
  CycloneDX is research §4.4's missing primary source for
  the audit / provenance story. The methodology's
  spec-as-distribution manifest (now expanding to include
  digest + provenance fields per codex remediation 3.5)
  carries SBOM references; without a primary SBOM source,
  the manifest's provenance claim was hand-waving. The
  LeadDev critique §3 "regulated environments" framing
  needs an SBOM anchor for the methodology's compliance
  posture.
---

# CycloneDX SBOM Specification

## 1. Source identity

- Name: CycloneDX — Software Bill of Materials
  specification.
- Canonical URL: `url://cyclonedx.org/specification/overview/`.
- Maintainer: OWASP Foundation + Ecma International
  (jointly developed; standardised as ECMA-424).
- Current version: 1.7 (released 2025-10-21).

## 2. Fetch trace

- `cmd://WebFetch url://cyclonedx.org/specification/overview/`
  — 2026-05-19; returned framework definition + SBOM
  content enumeration + supported encoding formats +
  supply-chain framing.

## 3. Verbatim claims this corpus depends on

- **Definition** (`url://cyclonedx.org/specification/overview/`):
  CycloneDX is "a highly modular and extensible
  framework designed to represent a broad range of supply
  chain information with precision and flexibility."

- **Joint maintenance**: developed jointly by the OWASP
  Foundation and Ecma International, standardised as
  ECMA-424.

- **SBOM contents** (per spec):
  - **Components**: "first-party and third-party
    components" including "software, hardware devices,
    machine learning models, source code, and
    configurations."
  - **Services**: "external APIs that the software may
    call" with endpoint URIs and authentication details.
  - **Dependencies**: both "direct and transitive
    relationships" between components and services.
  - **Vulnerabilities**: known and previously undisclosed
    vulnerabilities affecting components and services.
  - **Metadata**: supplier, manufacturer, tools used,
    license information.
  - **Additional elements**: compositions, formulations,
    annotations, definitions, declarations, citations.

- **Supported encoding formats** (three):
  - JSON (`application/vnd.cyclonedx+json`)
  - XML (`application/vnd.cyclonedx+xml`)
  - Protocol Buffers (`application/x.vnd.cyclonedx+protobuf`)

- **Supply-chain framing**: CycloneDX's role is
  "supply chain transparency" and covers "vulnerability
  management and license compliance to cryptographic
  transparency and operational assurance."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

CycloneDX is the methodology's grounding for the
spec-as-distribution provenance story. Key shape
implications:

- The methodology's manifest schema (per codex
  remediation 3.5) gains a `provenance` field that
  carries SBOM references; CycloneDX is a primary SBOM
  option for those references. (SPDX is the other major
  format and warrants comparison; see §6 — the
  "canonical" framing was reduced to "primary option"
  per codex Round-2 finding on cyclonedx overreach.)
- The LeadDev critique
  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
  §3) raised regulated-environments compliance as a
  risk surface; CycloneDX is one primary SBOM option
  relevant to that compliance gap. ("Directly addresses"
  was reduced to "relevant to" per codex Round-2 finding
  on cyclonedx overreach — full compliance requires more
  than an SBOM format; SPDX comparison + NTIA element
  mapping + VEX vulnerability handling are companion
  pieces.)
- The three encoding formats (JSON / XML / Protobuf)
  let the methodology recommend JSON as default while
  acknowledging adopter environments may use XML for
  regulated-industry tooling or Protobuf for
  wire-efficient pipelines.
- The component scope (software / hardware / ML models
  / source / configurations) is broad enough that the
  methodology's spec bundle itself can be enumerated as
  an SBOM-tracked component when bundled into an OCI
  artifact.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/cyclonedx-sbom.md §3`):

- methodology-claim: "CycloneDX is a jointly OWASP +
  Ecma-maintained SBOM framework (ECMA-424; current
  version 1.7) representing components, services,
  dependencies, vulnerabilities, and metadata."
- methodology-claim: "CycloneDX supports JSON, XML, and
  Protocol Buffers encodings; the methodology
  recommends JSON as the manifest-provenance default."
- methodology-claim: "Component scope includes software,
  hardware, ML models, source code, and configurations;
  the methodology's spec bundle qualifies as a CycloneDX
  component when distributed via OCI registry."
- methodology-claim: "CycloneDX addresses the regulated-
  environments compliance gap LeadDev's critique
  identified; methodology's audit posture rests on
  CycloneDX-format provenance for releases."

## 6. Open questions surfaced by the primary read

- SPDX is the other major SBOM format
  (`url://spdx.dev/`); the methodology should
  acknowledge it as an alternative and document why
  CycloneDX is the recommended default (e.g.
  finer-grained vulnerability handling, OWASP backing,
  ECMA standardisation) — but a separate primary read
  of SPDX is needed to do that justly.
- NTIA minimum SBOM elements are referenced by some
  CycloneDX adopters but the overview page does not
  enumerate them; methodology compliance claims
  against NTIA need a separate primary source.
- Vulnerability Exploitability eXchange (VEX) is
  related to CycloneDX vulnerability handling; if the
  methodology covers vulnerability disclosure under
  spec-as-distribution, VEX is a separate corpus
  candidate.
