---
slug: ref-arch-vs-solution-arch
source_name: "Mike Cottmeyer — Reference Architecture vs Reference Implementation (LiminalArc, 2019)"
primary_url: "https://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
methodology_relevance: |
  This is the closest existing articulation of the
  methodology's cross-org ownership-split protocol
  (research §4.3): what the developer publishes as
  universal (reference architecture) vs what the
  installer customises (reference implementation /
  solution architecture). Mike Cottmeyer's distinction
  is the methodology's vocabulary precursor.
---

# Reference Architecture vs Reference Implementation

## 1. Source identity

- Title: "Reference Architecture vs Reference
  Implementation."
- Author: Mike Cottmeyer.
- Publisher: LiminalArc (Cottmeyer's consulting blog).
- Date: 2019-05.
- Canonical URL: `url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`.
- Context: agile-transformation consulting; emerged
  from observing organisations attempting to deploy
  SAFe, LeSS, or Disciplined Agile Delivery verbatim.

## 2. Fetch trace

- `cmd://WebFetch url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`
  — 2026-05-19; returned Cottmeyer's distinction +
  consulting context + universal-vs-negotiable framing.

## 3. Verbatim claims this corpus depends on

- **Reference architecture (Cottmeyer)**: comprises
  "base patterns that... transcend any of the
  methodologies." Key claim: "The reference
  architecture holds universally."

- **Reference implementation (Cottmeyer)**: "The
  reference implementation is what is negotiable" —
  contrasted directly with the universal nature of
  reference architecture.

- **Posture distinction (verbatim framing)**:
  - Reference Architecture: universal, non-negotiable
    foundational patterns (in Cottmeyer's domain:
    teams, backlogs, working tested software,
    dependency management).
  - Reference Implementation: tailorable methodology
    — the specific tools, techniques, and controls
    selected based on context.

- **Underlying thesis** (paraphrased from Cottmeyer, not
  verbatim): the original article frames the underlying
  point as understanding the immutable base patterns
  that organisations cannot violate without losing
  transformation viability. (See LiminalArc article
  body; the surrounding quotation in this corpus entry
  is a near-paraphrase based on the WebFetch summary —
  treat as paraphrase unless the exact source wording is
  later confirmed by a follow-on read.)

- **Consulting context** (paraphrased from Cottmeyer):
  the distinction emerged from practical agile-
  transformation work where organisations attempt to
  implement frameworks like SAFe, LeSS, or Disciplined
  Agile Delivery. Cottmeyer's observation: blindly
  deploying methodologies verbatim fails, but
  understanding the immutable patterns beneath various
  frameworks enables organisations to tailor their
  approach while maintaining transformation viability.
  (Both sentences are paraphrase based on the WebFetch
  summary, not exact source wording; the canonical
  article body is at the cited URL.)

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Cottmeyer's distinction maps directly onto the
methodology's cross-org ownership split:

- **What the developer publishes universally** =
  reference architecture (in methodology terms: the
  front-door manifest + architecture/ + behavior/ +
  decisions/ sub-specs; the "what" of the product).
- **What the installer makes negotiable** = reference
  implementation (in methodology terms: the
  customization/ + deployment/ sub-specs as
  parameterised; the "how" of the product in this
  installer's environment).

The vocabulary precedes the methodology and is
useful as a citable label. The methodology
generalises Cottmeyer's distinction from agile-
transformation consulting (developer = framework
author, installer = transforming organisation) to
arbitrary product distribution.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/ref-arch-vs-solution-arch.md
§3`):

- methodology-claim: "Cottmeyer (2019) distinguishes
  reference architecture (universal, non-negotiable)
  from reference implementation (tailorable,
  negotiable) — a vocabulary precursor for the
  methodology's cross-org ownership split."
- methodology-claim: "The methodology's developer-
  owns-intent / installer-owns-deployment ownership
  split is a generalisation of Cottmeyer's
  architecture-vs-implementation distinction, scaled
  from agile-transformation consulting to product
  distribution."
- methodology-claim: "Reference architecture as
  Cottmeyer defines it ('holds universally') is the
  methodology's analogue for what the published SPEC
  bundle's front-door manifest + intent sub-specs
  contain; reference implementation as Cottmeyer
  defines it ('what is negotiable') is the
  methodology's analogue for the customization +
  deployment sub-specs."
- methodology-claim: "Cottmeyer's empirical
  observation — 'blindly deploying methodologies
  verbatim fails' — is the methodology's case for
  non-prescriptive SPECs: prescription erodes the
  installer's authority to tailor."

## 6. Open questions surfaced by the primary read

- Cottmeyer's frame is agile-transformation
  consulting; the methodology generalises to
  arbitrary product distribution. The
  generalisability of Cottmeyer's "base patterns" to
  software-product domains beyond agile-transformation
  is not proven by his original frame — methodology
  must own the generalisation explicitly.
- Cottmeyer cites four base patterns (teams,
  backlogs, working tested software, dependency
  management) for agile transformation. The
  methodology has not yet enumerated equivalent
  "base patterns" for product distribution. This is
  a methodology design open question.
- Academic literature on reference-architecture-vs-
  solution-architecture (Galster, Avgeriou, others)
  is older than Cottmeyer's framing. If methodology
  wants stronger academic anchoring, those primary
  sources merit separate corpus entries.
