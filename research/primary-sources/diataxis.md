---
slug: diataxis
source_name: "Diátaxis — a systematic framework for technical documentation authoring"
primary_url: "https://diataxis.fr/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched diataxis.fr/ + diataxis.fr/start-here/; four-mode taxonomy + two-axis structure confirmed verbatim"
methodology_relevance: |
  Diátaxis is the methodology's documentation-taxonomy
  reference: the research workpad §5.1 names Diátaxis as
  comparison prior art for the methodology's longread
  vs SPEC-bundle split (and within the SPEC bundle, the
  facet-level split). This corpus entry anchors the
  four modes verbatim and the two-axis structure
  (action-vs-cognition × study-vs-work) so the
  methodology can cite Diátaxis precisely when
  justifying its own packaging structure.
---

# Diátaxis

## 1. Source identity

- Name: Diátaxis — "a way of thinking about and doing
  documentation."
- Author: Daniele Procida.
- Canonical URL: `url://diataxis.fr/`; introduction at
  `url://diataxis.fr/start-here/`.
- License: documentation site itself is published
  openly; specific license terms not deep-read on this
  pass.

## 2. Fetch trace

- `cmd://WebFetch url://diataxis.fr/` — 2026-05-19;
  returned self-definition + four-mode enumeration.
- `cmd://WebFetch url://diataxis.fr/start-here/` —
  2026-05-19; returned per-mode verbatim definitions +
  two-axis structure.

## 3. Verbatim claims this corpus depends on

- **Self-definition** (`url://diataxis.fr/`):
  "Diátaxis is a way of thinking about and doing
  documentation. It prescribes approaches to content,
  architecture and form that emerge from a systematic
  approach to understanding the needs of documentation
  users."

- **The four documentation modes** (`url://diataxis.fr/start-here/`):

  - **Tutorials** — verbatim: "A tutorial is a lesson,
    that takes a student by the hand through a learning
    experience. A tutorial is always practical: the
    user does something, under the guidance of an
    instructor."
  - **How-to guides** — verbatim: "A how-to guide
    addresses a real-world goal or problem, by providing
    practical directions to help the user who is in
    that situation."
  - **Reference** — verbatim: "Reference guides contain
    the technical description — facts — that a user
    needs in order to do things correctly: accurate,
    complete, reliable information, free of distraction
    and interpretation."
  - **Explanation** — verbatim: "Explanatory guides
    provide context and background. They serve the need
    to understand and put things in a bigger picture."

- **Two structural axes** (`url://diataxis.fr/start-here/`):

  1. **Action vs. Cognition**: "Tutorials and how-to
     guides concern what the user does (action); while
     reference and explanation address what the user
     knows (cognition)."
  2. **Study vs. Work**: "Tutorials and explanation
     serve acquisition of skill (the user's study);
     whereas how-to guides and reference serve
     application of skill (the user's work)."

- **Resulting 2×2 matrix**: the four modes occupy
  distinct quadrants. Tutorials = action + study;
  How-to = action + work; Explanation = cognition +
  study; Reference = cognition + work.

- **Normative claim** (`url://diataxis.fr/`):
  "Documentation should itself be organised around the
  structures of those needs."

## 4. Gap from prior summary characterization

Prior summary in
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§4 / §5.1 cited Diátaxis as decomposition prior art
without anchoring its specific axes or per-mode
definitions. This primary read closes the gap:

- The four-mode taxonomy is anchored verbatim with <!-- lint-ok: no-citation -->
  source-provided definitions, not paraphrased.
- The two-axis structure (action-vs-cognition × study- <!-- lint-ok: no-citation -->
  vs-work) is anchored — this is the underlying
  justification, and the methodology can either adopt
  Diátaxis's axes or explicitly diverge with rationale.
- The framework's posture as "systematic approach" not <!-- lint-ok: no-citation -->
  "style guide" is anchored to its self-definition.

## 5. Downstream-citation surface

The following methodology claims are licensed by this
entry (cite as
`file://research/primary-sources/diataxis.md §3`):

- methodology-claim: "Diátaxis is a four-mode <!-- lint-ok: no-citation -->
  documentation taxonomy: tutorials, how-to guides,
  reference, explanation."
- methodology-claim: "The four modes are structured <!-- lint-ok: no-citation -->
  along two axes — action vs. cognition (what the user
  does vs. knows) and study vs. work (skill acquisition
  vs. application)."
- methodology-claim: "Diátaxis prescribes that <!-- lint-ok: no-citation -->
  documentation should be organised around user needs
  rather than around the structure of the product."
- methodology-claim: "The methodology's published <!-- lint-ok: no-citation -->
  artefacts (longread + SPEC bundle) constitute, in
  Diátaxis terms, primarily explanation (longread) +
  reference (SPEC bundle) — neither tutorial nor
  how-to, which is a Diátaxis-articulable scope choice."

## 6. Open questions surfaced by the primary read

- Diátaxis applies to product documentation aimed at
  human end-users. The methodology Product B publishes
  is aimed at engineers + agents — does the same
  four-mode taxonomy hold, or does the agent-as-reader
  change the relevant cognitive modes? Not resolvable
  from Diátaxis alone; methodology-design open question.
- The methodology's longread is "first-person
  experiential" per the parent Decision §7; Diátaxis
  doesn't formalize a fifth "experience report" mode.
  The methodology may have to articulate an extension
  (or sub-mode of explanation) for its first-person
  posture.
- Diátaxis does not formally address machine-readable
  documentation (the SPEC-bundle facet of methodology
  output); the methodology's structured-data /
  prose-document hybrid is a packaging choice Diátaxis
  doesn't directly model.
