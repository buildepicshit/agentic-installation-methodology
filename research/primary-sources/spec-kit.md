---
slug: spec-kit
source_name: "GitHub Spec Kit — Spec-Driven Development toolkit"
primary_url: "https://github.com/github/spec-kit"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched github/spec-kit repository README; six-command lifecycle + artefact set + posture verbatim"
methodology_relevance: |
  Spec Kit is research §2.1's "closest spec-as-authoring
  tool." Authoring-artefact posture is the explicit
  contrast point for the methodology's spec-as-
  distribution-artefact posture. This corpus entry
  anchors Spec Kit's command lifecycle, artefact set,
  and authoring-posture so the methodology can cite the
  authoring/distribution distinction precisely.
---

# GitHub Spec Kit

## 1. Source identity

- Name: GitHub Spec Kit — open source toolkit for
  Spec-Driven Development.
- Canonical URL: `url://github.com/github/spec-kit`.
- Maintainer: GitHub.
- Posture: spec-as-authoring (the spec drives
  implementation generation).

## 2. Fetch trace

- `cmd://WebFetch url://github.com/github/spec-kit` —
  2026-05-19; returned definition, six-command
  lifecycle, artefact set.

## 3. Verbatim claims this corpus depends on

- **Definition** (`url://github.com/github/spec-kit`):
  Spec Kit is "an open source toolkit that allows you
  to focus on product scenarios and predictable
  outcomes instead of vibe coding every piece from
  scratch."

- **Spec-Driven Development thesis** (verbatim):
  "Spec-Driven Development flips the script on
  traditional software development… specifications
  become executable, directly generating working
  implementations rather than just guiding them."

- **Six-command lifecycle**:
  1. `/speckit.constitution` — "Create or update
     project governing principles and development
     guidelines."
  2. `/speckit.specify` — "Define what you want to
     build (requirements and user stories)."
  3. `/speckit.clarify` — "Clarify underspecified
     areas (recommended before `/speckit.plan`)."
  4. `/speckit.plan` — "Create technical
     implementation plans with your chosen tech
     stack."
  5. `/speckit.tasks` — "Generate actionable task
     lists for implementation."
  6. `/speckit.implement` — "Execute all tasks to
     build the feature according to the plan."

- **Optional command**: `/speckit.analyze` for
  "Cross-artifact consistency & coverage analysis."

- **Artefact set produced**:
  - `.specify/memory/constitution.md` — project
    principles.
  - `specs/[feature-name]/spec.md` — functional
    specifications.
  - `specs/[feature-name]/plan.md` — technical
    implementation plan.
  - `specs/[feature-name]/tasks.md` — task breakdown.
  - `specs/[feature-name]/contracts/` — API specs,
    data models.
  - `specs/[feature-name]/research.md` — tech-stack
    research.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Spec Kit's posture is authoring-time, intra-team:
specifications drive implementation generation within
one team's codebase. The methodology's posture is
distribution-time, cross-org: specifications are
shipped as artefacts user-with-agents install on their
own terms.

Both postures call the artefact a "spec"; they mean
different things. The methodology MUST be precise:

- Spec Kit specs are scaffolds the team's own agent
  consumes to generate code.
- Methodology specs are published distribution
  artefacts the user-with-agent consumes to install
  the developer's product.

The lifecycle commands map loosely (constitution ≈
methodology's parent Decision; specify ≈ longread;
plan ≈ deployment/ sub-spec; tasks ≈ TASK.md
decomposition; implement ≈ install) but the consumer
identity is different.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/spec-kit.md §3`):

- methodology-claim: "Spec Kit is the closest spec-
  as-authoring tool (GitHub, 2025) — its specs are
  scaffolds for an in-team agent's code generation."
- methodology-claim: "Spec Kit's six-command lifecycle
  (constitution → specify → clarify → plan → tasks →
  implement) is in-team authoring; the methodology's
  lifecycle is cross-org distribution + install."
- methodology-claim: "Spec Kit produces an artefact
  set (spec.md, plan.md, tasks.md, contracts/) that
  remains inside one team's repo; the methodology's
  artefact set is the published SPEC bundle distributed
  to user-with-agent installers."
- methodology-claim: "The 'spec is executable' thesis
  Spec Kit articulates is shared by the methodology;
  the difference is WHO executes the spec — Spec Kit:
  the authoring team's agent; methodology: the
  installing user's agent, with no developer in the
  loop."

## 6. Open questions surfaced by the primary read

- Spec Kit's `/speckit.constitution` artefact has
  loose mapping to the methodology's parent Decision
  SPEC; the actual contracts of the two are different
  (Spec Kit constitution = principles + style;
  methodology Decision = binding choice). Comparison
  should not flatten the distinction.
- Whether Spec Kit specs can be PUBLISHED for cross-
  team consumption (vs in-team authoring only) is
  ambiguous from the README; the methodology may want
  to acknowledge Spec Kit as a candidate
  authoring-time tool but is silent on its
  cross-org-distribution use.
- Spec Kit's `clarify` step is a useful pattern —
  agents ask for clarification before planning — that
  the methodology's authoring-time guidance MAY
  reference, even though the methodology's
  distribution artefacts are post-clarification.
