---
slug: sigstore-cosign
source_name: "Sigstore + cosign — keyless signing for software supply chain"
primary_url: "https://docs.sigstore.dev/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched Sigstore docs root; Fulcio + Rekor + cosign architecture and keyless model verbatim"
methodology_relevance: |
  Sigstore + cosign is research §4.4's "spec-as-
  distribution versioning + signing + verification"
  primitive. This corpus entry anchors the three-component
  architecture (Fulcio, Rekor, cosign), the keyless signing
  model, and the OCI-artifact signing process so the
  methodology can cite Sigstore precisely when prescribing
  the SPEC bundle's signing + verification contract.
---

# Sigstore + cosign

## 1. Source identity

- Name: Sigstore — open source project for software
  supply chain security.
- Components: Fulcio (CA), Rekor (transparency log),
  cosign (client).
- Canonical URL: `url://docs.sigstore.dev/`.
- Maintainer: Sigstore project (Linux Foundation +
  contributors).

## 2. Fetch trace

- `cmd://WebFetch url://docs.sigstore.dev/` — 2026-05-19;
  returned mission statement, three-component
  architecture, keyless signing model, cosign signing
  and verification flow.

## 3. Verbatim claims this corpus depends on

- **Mission** (`url://docs.sigstore.dev/`): "Sigstore is
  an open source project for improving software supply
  chain security. The Sigstore framework and tooling
  empowers software developers and consumers to securely
  sign and verify software artifacts such as release
  files, container images, binaries, software bills of
  materials (SBOMs), and more."

- **Fulcio**: "The code-signing certificate authority
  that issues short-lived certificates bound to verified
  identities."

- **Rekor**: "an immutable, append-only ledger" that
  records all signing events — the transparency log.

- **Cosign**: the Sigstore client that initiates signing
  operations.

- **Keyless signing model**: "The signer ideally forgoes
  using long-lived keypairs. With 'keyless' or
  'ephemeral key' signing, users verify the artifact
  using the transparency log for signature verification
  rather than keys."

- **Signing process**: "a Cosign client creates a
  temporary key pair, sends a certificate signing
  request to Fulcio with an OIDC identity token,
  receives a short-lived certificate, signs the
  artifact, and then discards the private key."

- **Cosign signing artefacts** deposited into Rekor:
  "the artifact's digest, signature and certificate."

- **Verification flow** (four checks): (1) verify the
  artifact's signature using the certificate's public
  key, (2) confirm the identity matches expectations,
  (3) validate the certificate against Sigstore's root
  of trust, (4) confirm inclusion in Rekor's immutable
  log.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Sigstore + cosign answer the "how does the user-with-
agent verify the methodology SPEC bundle they fetched
matches what the developer published?" question in
research §4.4 (spec-as-distribution versioning, signing,
verification). Key shape implications:

- The methodology's published SPEC bundle, distributed
  as an OCI artifact (per `oci-artifacts` corpus entry),
  is sign-able by cosign.
- Keyless signing means the developer does NOT need to
  manage long-lived signing keys for SPEC bundle
  releases — OIDC identity (e.g. GitHub Actions OIDC) is
  the trust root.
- Verification by user-with-agent is a four-step check
  that gives "this SPEC came from this developer's
  identity" without trust-on-first-use semantics.
- Rekor inclusion proof gives auditability — any past
  SPEC bundle's signing event is permanently logged.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/sigstore-cosign.md
§3`):

- methodology-claim: "Sigstore consists of Fulcio
  (short-lived certificate authority), Rekor (append-
  only transparency log), and cosign (the signing
  client)."
- methodology-claim: "Keyless signing eliminates
  long-lived signing keys: ephemeral keys are bound to
  OIDC identity via Fulcio; signatures + certificates +
  digest land in Rekor."
- methodology-claim: "cosign verification is a four-
  check process: signature, identity, certificate
  chain, Rekor inclusion."
- methodology-claim: "Sigstore is the methodology's
  recommended signing model for SPEC bundle releases —
  keyless, OIDC-rooted, transparency-logged."

## 6. Open questions surfaced by the primary read

- The exact OIDC providers Sigstore Fulcio accepts is
  configurable; the methodology may want to recommend
  specific providers (GitHub Actions, GitLab CI,
  Google) for spec-bundle releases but cannot mandate
  one without specifying the developer's CI/CD
  environment.
- Sigstore's relationship to in-toto and SLSA (Supply-
  chain Levels for Software Artifacts) is real but not
  deep-read on this pass. If the methodology adopts
  SLSA levels, those are separate primary sources
  worth fetching.
- Verification of multi-signature bundles (signed by
  multiple developers) — does cosign support this
  natively or is it tooling-on-top? Not verified;
  flag for follow-on if methodology proposes multi-
  signature governance for SPEC bundles.
