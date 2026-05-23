# Chapter 07 — Phase 6: Ship + Cross-Link + Sign

## The ship question

Phases 0 through 5 produced a sanitized, composed,
honestly-validated artefact set. Phase 6 asks the last
question before the methodology stops being a private
practice and starts being a public obligation: how does
this thing go out the door so that what installers
download is what we meant to ship, and so the gaps we
know about are visible to them at install time? The
research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 6 names the four-part answer directly:
framework spec ships standalone; methodology paper
ships standalone; conformance suite ships as a
versioned bundle; each cites the other.
`research/primary-sources/spec-kit.md` §3's spec-as-
deployment-grade framing sits behind all four — the
spec is the deployment unit, so the deployment unit has
to look like a spec.

## What ships where

Three shippable artefacts, three different shapes.
Product A is the framework spec; it ships standalone
as a repository with the manifest + catalog shape
chapter 05 already described. Product B is this
methodology paper; it ships standalone with its case
study density and its honest disclosure of what is
and is not yet validated. The conformance suite, when
it exists, ships as a versioned bundle — a separately
tagged, integrity-verifiable artefact installers can
pull. The workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 6 defines this three-artefact shape;
workpad §7 records the BES Phase 6 disposition more
narrowly as a paired Product A / Product B release.
The conformance suite is reserved per chapter 01 and
this chapter's failure note; that part of the triad
is shape-not-yet-state. The versioned-bundle shape
itself comes from
`research/primary-sources/oci-artifacts.md` §3 — the
OCI image manifest is the prior art for naming each
component of an artefact by type, metadata, and
content address, with verification by hash digest.

## Cross-linking

Three artefacts with no cross-references is just three
artefacts; with cross-references it is a release. Per
the research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 6, each artefact cites the other: the
framework spec's README points at the methodology
paper; the methodology paper points at the framework
spec it documents; both point at the conformance
suite. The article(s) that announce the release cite
both. The cross-link is not a courtesy — it is how an
installer who finds one artefact can find the other
two and verify that they are looking at versions that
were meant to ship together.

## Signing + provenance

Cross-linking proves intent. Signing proves authorship.
`research/primary-sources/sigstore-cosign.md` §3's
keyless signing pattern — sign the artefact, publish
the signature, let downstream verify against a public
transparency log — is the prior art the methodology
adopts. The signature does not prove the artefact is
correct; it proves the artefact is what the signer
released. Provenance is the next layer.
`research/primary-sources/cyclonedx-sbom.md` §3's SBOM
format names every component-with-version that went
into the artefact — an installer who wants to know
what is actually inside the bundle reads the SBOM
rather than rummaging through the source tree.
Signing + SBOM together let a careful installer answer
two questions the bundle alone cannot answer: did the
people we trust release this, and what is inside it?

## Phase 6 failure note (BES)

**What happened.** The research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§7 records the BES Phase 6 disposition as a paired release of Product A and Product B.

**What we did.** Parent Decision §7 at
`../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
binds the paired Product A v2.0 / Product B v1.0
release shape (Decision binds shape, not current
state); Product B remains in flight (this longread).
The conformance suite is reserved per chapter 01's
disclosure at `longread/01-phase-0-maturity-check.md`;
the Phase 5 cross-family pass is outstanding per
chapter 06 at
`longread/06-phase-5-cross-family-validation.md`.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: ship-with-disclosure beats ship-
with-hidden-gaps. A methodology that releases its
artefacts paired and explicitly flags which gates have
not yet been satisfied gives installers the
information they need to set their own trust
posture. A release that hides its gaps forces
installers to discover them by hitting them.

---

**In the next chapter**: Phase 7 — failure modes as
first-class content. With the methodology shipped
honestly, how do we ensure the failure modes we
encountered along the way stay published as content
rather than getting buried as errata?
