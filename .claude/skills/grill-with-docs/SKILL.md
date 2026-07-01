---
name: grill-with-docs
description: "Use during IDEA-authoring rounds (any /idea-capture or /author-spec invocation). Augments spec-authoring §'Grill Before IDEA' with structured-options-cited-to-research pattern: AskUserQuestion with 2-4 concrete options, each option carrying a one-line tradeoff + a citation to the document section that justifies it. Owner-affirmed effective pattern this session 2026-05-25."
license: unknown
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: adapted
    source_urls:
      - https://raw.githubusercontent.com/mattpocock/skills/main/skills/engineering/grill-with-docs/SKILL.md
    borrowed_from:
      - mattpocock/skills grill-with-docs
    upstream_status: current
    last_audited: 2026-06-05
    audit_cadence: quarterly
    adoption_status: adapted
    security_review: needed
    notes: "BES-adapted from checked-in external skill lineage; not a verbatim import."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Grill With Docs

The grill-with-docs pattern formalises a technique
already used inside
`file://agents/skills/spec-authoring/SKILL.md`
§"Grill Before IDEA" but adds the **+ docs** layer
that the owner affirmed as effective during the
2026-05-25 engineering-quality arc.

## When to Use

Whenever you would normally grill the owner during
IDEA authoring — `/idea-capture` or `/author-spec`
sessions, or any moment where two-or-more design
paths warrant owner choice before committing.

Do NOT use this skill for:
- Simple yes/no confirmations (no docs grounding
  needed).
- Acknowledging owner directives that are already
  clear (don't grill what they already said).
- Substantive engineering decisions where you have
  primary-source evidence pointing one way — make
  the decision, surface the evidence, let owner
  redirect if needed.

## The Pattern

For each grill question:

1. **Run prior-art / research first** if the design
   space is unclear. Capture findings in IDEA §2 or
   a research-wave artefact.
2. **Frame the question with 2-4 mutually-exclusive
   options.** AskUserQuestion supports up to 4.
3. **Each option carries**:
   - A short label (1-5 words).
   - A description with the tradeoff named —
     including the downside, not just the upside.
   - A citation tag where applicable — e.g.
     "(framing N per §2.1 prior art)" or
     "(matches Wave 3 §2.2 finding)".
4. **Recommend one option** as the default by
   labeling it `(recommended)` — and put it first.
5. **Include "Not yet decided — explore the full
   surface first"** as an option when scope is
   genuinely open. Owner can pre-empt narrowing.

Example shape (from the engineering-quality arc
this session):

> Q: Which slice of cellular automata is V2 about?
> - CA as software-development methodology (virgin)
>   — Framing 1 per §2.1. No published mapping exists.
>   Highest novelty, lowest lineage scaffolding.
> - Wolfram-style spec interpretation (foundational)
>   — Framing 4 per §2.1. Computational irreducibility
>   gives V2 a theoretical underpinning. Established
>   formal lineage.
> - …

## Hard Rules

- Do not grill on metadata when you can decide it
  yourself (slug names, dates, file paths). Grill
  on substantive design only.
- Do not ask "do you approve this?" — that's not a
  grill, it's a confirmation. Use the existing
  status-flip flow for approvals.
- Do not bury the recommendation. Put it first +
  label it `(recommended)`.
- Do not skip the docs citation. The owner affirmed
  the pattern's value specifically because the docs
  grounding lets them check the reasoning quickly.

## Cross-references

- `file://agents/skills/spec-authoring/SKILL.md`
  §"Grill Before IDEA" — the foundational grill
  clause this skill augments.
- `file://specs/2026-05-25-agent-engineering-craft-discipline/IDEA.md`
  §2.3 — owner affirmation 2026-05-25 ("The new
  grill with docs skill is working very well I
  enjoy it").
- `file://agents/skills/honesty-cluster/SKILL.md`
  + `calibration-cluster` — receiving-code-review
  + escalation-rubric apply during grill-with-docs
  rounds when the owner disagrees with the
  recommendation.
