---
slug: 12-factor
source_name: "The Twelve-Factor App"
primary_url: "https://12factor.net/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched 12factor.net root; methodology characterisation + 12 factor names verbatim + Factor III headline"
methodology_relevance: |
  12-factor is research §4.1's "Config" reference (Factor
  III: "Store config in the environment") cited as the
  weakest customization-affordance grammar — names that
  knobs exist, not which knobs the installer is expected
  to turn. This corpus entry anchors the 12-factor self-
  description, the canonical factor list, and the Config
  factor verbatim so the methodology can cite 12-factor
  precisely when comparing customization grammars.
---

# The Twelve-Factor App

## 1. Source identity

- Name: The Twelve-Factor App — a methodology for
  building software-as-a-service apps.
- Authors: Adam Wiggins (originally, at Heroku) + open
  contribution.
- Canonical URL: `url://12factor.net/`.
- License: Creative Commons (per site footer; not
  deep-read on this pass).

## 2. Fetch trace

- `cmd://WebFetch url://12factor.net/` — 2026-05-19;
  returned methodology definition, 12-factor names,
  Factor III ("Config") headline.

## 3. Verbatim claims this corpus depends on

- **Methodology characterisation** (`url://12factor.net/`):
  a twelve-factor app is "a methodology for building
  software-as-a-service apps that" possess these
  characteristics:
  - Employ "declarative formats for setup automation, to
    minimize time and cost for new developers joining
    the project"
  - Feature "a clean contract with the underlying
    operating system, offering maximum portability
    between execution environments"
  - Work well "for deployment on modern cloud platforms,
    obviating the need for servers and systems
    administration"
  - "Minimize divergence between development and
    production, enabling continuous deployment for
    maximum agility"
  - "Scale up without significant changes to tooling,
    architecture, or development practices"

- **The twelve factors** (`url://12factor.net/`):
  1. **Codebase** — One codebase tracked in revision
     control, many deploys
  2. **Dependencies** — Explicitly declare and isolate
     dependencies
  3. **Config** — Store config in the environment
  4. **Backing Services** — Treat backing services as
     attached resources
  5. **Build, Release, Run** — Strictly separate build
     and run stages
  6. **Processes** — Execute the app as one or more
     stateless processes
  7. **Port Binding** — Export services via port binding
  8. **Concurrency** — Scale out via the process model
  9. **Disposability** — Maximize robustness with fast
     startup and graceful shutdown
  10. **Dev/Prod Parity** — Keep development, staging,
      and production as similar as possible
  11. **Logs** — Treat logs as event streams
  12. **Admin Processes** — Run admin/management tasks
      as one-off processes

- **Factor III (Config)** — verbatim headline: "Store
  config in the environment."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

12-factor is the lightest-weight customization-grammar
prior art: it says configuration exists in environment
variables, not which environment variables the
installer needs to set or what their valid
combinations are. Research §4.1 characterised it as
"says env vars exist, not which knobs the installer is
expected to turn." This corpus read confirms the
characterisation by anchoring Factor III to its
verbatim minimal statement ("Store config in the
environment") — no schema, no enumeration, no
deferral contract.

Implications for the methodology's customization/
sub-spec:

- The methodology's customization grammar is a strict
  superset of 12-factor's posture: it declares WHICH
  knobs the installer is expected to turn, with what
  validation, and under what compositional constraints.
- 12-factor's strength — minimalism — is the
  methodology's weakness if applied directly: 12-factor
  is excellent for the operating-system-boundary
  contract (Factor III enables env-var-based
  configuration) but insufficient for the
  application-domain customization grammar the
  methodology proposes.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/12-factor.md §3`):

- methodology-claim: "12-factor is a methodology for
  cloud-native SaaS app construction with twelve
  named characteristics ranging from codebase tracking
  to admin processes."
- methodology-claim: "12-factor Factor III ('Config')
  prescribes only that configuration be stored in the
  environment — the methodology does NOT specify which
  config knobs exist or how they validate."
- methodology-claim: "12-factor sets the
  operating-system-boundary contract; the methodology's
  customization grammar sets the application-domain
  contract — these are complementary, not competing."
- methodology-claim: "12-factor's Dev/Prod Parity
  posture is the methodology's reproducibility-bar
  precedent at the methodology-language level."

## 6. Open questions surfaced by the primary read

- 12-factor is now ~15 years old (originated at Heroku
  circa 2011); the "15-factor" or "12+3-factor"
  extensions floated in the community (auth, telemetry,
  API-first) are not part of the original 12 and would
  be separately sourced if the methodology references
  them.
- Factor III is silent on secrets management; the
  methodology's deployment/ sub-spec should not cite
  12-factor for secrets posture (that's a separate
  primary source — likely Vault, AWS Secrets Manager
  docs, or SOPS).
- 12-factor's Disposability factor (#9) overlaps with
  the methodology's failure-mode discussion (research
  §5.1 operations facet). The methodology MAY cite
  12-factor's disposability characterisation as prior
  art for the operations/ sub-spec.
