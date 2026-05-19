---
slug: leaddev-agent-compiled
source_name: "LeadDev — Can you trust the spec? The risky future of agent-compiled software"
primary_url: "https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
methodology_relevance: |
  This is the closest published statement of the
  agentic-installation hypothesis — framed as a RISK,
  not as a method. The methodology Product B publishes
  the same hypothesis as PROCEDURE (with the risks
  named and acknowledged). This corpus entry anchors
  the risk framing, the patching-semantics quote, and
  Willison's hybrid mitigation so the methodology can
  cite the LeadDev article precisely as the prior-art
  critique it must address.
---

# LeadDev — Can You Trust the Spec?

## 1. Source identity

- Title: "Can you trust the spec? The risky future of
  agent-compiled software".
- Publisher: LeadDev.
- Canonical URL: `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`.
- Status: published critique; closest in-the-wild
  articulation of the agentic-installation hypothesis
  framed as a risk surface.

## 2. Fetch trace

- `cmd://WebFetch url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
  — 2026-05-19; returned core risk hypothesis,
  patching-semantics quote, Willison mitigation.

## 3. Verbatim claims this corpus depends on

- **Core risk hypothesis** (verbatim from the article):
  "In regulated environments, organizations must be
  able to say with precision what code was running at
  the time of an incident, demonstrate it was tested,
  and show it was authorised."
  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`)

- **Patching-semantics quote** (attributed to Lukaas
  Kruger, Klarus founder): "Patching is no longer
  'Deploy version 2.1.4' but 'Update the spec and hope
  every downstream compilation behaves consistently.'"

- **Concrete failure mode** (verbatim): "If every
  deployment compiles a slightly different agent-built
  version from a shared spec, incident response becomes
  an archaeology problem."

- **Simon Willison mitigation** (attributed): leverage
  "custom plugins and API integrations — which can be
  vibe coded as much as you like, but benefit from
  taking to a core system that's standardized and
  tested and understood." Hybrid approach: customise
  the periphery, standardise the core.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

The LeadDev article is the methodology's most direct
honest-posture obligation. The methodology Product B
publishes the same hypothesis as procedure; it MUST
address the risks LeadDev names rather than dismiss
them.

Implications for the methodology:

- The §7 failure-modes section of the longread MUST
  cite this article as the prior-art critique.
- The methodology's seven open research questions
  (research workpad §2.3) cover exactly the surfaces
  LeadDev names — particularly Q3 (versioning and
  patching semantics), Q4 (install-matches-intent
  verification), Q5 (equivalence classes of valid
  implementations).
- Willison's hybrid mitigation (custom periphery +
  standardised core) is the methodology's reference-
  implementation/extensions split made concrete by
  another voice.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/leaddev-agent-compiled.md
§3`):

- methodology-claim: "The agentic-installation
  hypothesis — that developers ship specs and users
  agent-compile their own deployments — has been
  articulated in published form as a risk (LeadDev,
  Kruger, Willison) before being articulated as a
  procedure."
- methodology-claim: "In regulated environments, the
  'what code was running at the time of incident'
  obligation is unmet by agent-compiled software unless
  the SPEC + compilation outcome is reproducibly
  verifiable."
- methodology-claim: "Patching semantics under
  agentic-installation shift from 'deploy version X.Y.Z'
  to 'update spec and verify downstream re-compilation
  is consistent' — the methodology's versioning facet
  must address this directly."
- methodology-claim: "Hybrid customise-periphery /
  standardise-core was articulated by Simon Willison in
  the LeadDev article as a mitigation suggestion
  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`).
  Whether the methodology endorses it for safety-
  critical paths is a separate **methodology
  judgment** (`judgment://agent-synthesis` requiring
  owner affirmation), not a claim licensed by Willison
  or the LeadDev article alone."

## 6. Open questions surfaced by the primary read

- The article does not propose a solution; it names
  the risks. The methodology takes the risks as open
  research questions (research §2.3) rather than
  claiming to resolve them — this corpus read confirms
  the framing is appropriate.
- The regulated-environments framing (audit, incident
  response, authorisation traces) is more prominent in
  the LeadDev article than in the dispositioned
  research workpad. The methodology longread should
  surface compliance + audit traceability as a
  first-class concern, not bury it.
- Kruger's "hope every downstream compilation behaves
  consistently" phrasing is the methodology's
  acknowledged tension: deterministic build-from-spec
  is the goal; "hope it works" is the failure mode the
  methodology's reproducibility primitives (Nix,
  Sigstore-anchored bundle versioning) try to close.
