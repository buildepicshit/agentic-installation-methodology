---
name: idea-capture
description: "Use to run and capture the IDEA conversation that precedes a SPEC — the grill that surfaces constraints, 2-3 considered approaches, a recommendation, and any owner-blocking questions. Emits IDEA.md at specs/<id>/IDEA.md and gates it to status: ready-for-spec. Hands off to author-spec for SPEC authoring. Do not use to author a SPEC (author-spec) or to review one (review-spec)."
license: internal-only
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls: []
    borrowed_from: []
    upstream_status: not-applicable
    last_audited: 2026-07-24
    audit_cadence: annual
    adoption_status: bes-native
    security_review: not-required
    notes: "BES fleet-native. Split out of the author-spec skill on 2026-07-24 so each slash-command maps to exactly one skill: the invocation name IS the skill directory name and Claude Code provides no alias mechanism, so /idea-capture and /author-spec could not both be served by one skill. Prose only; no executable or tool surface. Adoption record: specs/2026-07-24-command-skill-collapse."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
---

# Idea Capture

Phase 1 of the Spec gate: the IDEA conversation. `author-spec` owns SPEC
authoring; this skill owns getting to a decision worth writing down.

Split from `author-spec` on 2026-07-24 so each slash-command maps to exactly
one skill. The invocation name IS the directory name and there is no alias
mechanism, so two commands could not share one skill
(`file://specs/2026-07-24-command-skill-collapse/SPEC.md` §3).

## When to Use

- Before authoring any non-trivial SPEC, per the enumerated non-trivial
  trigger in `file://agents/OPERATING_MODEL.md` "Required Work Model".
- When the owner raises an idea that is not yet a decision.

Do NOT use when the conversation yields **no decision** — the approach was
never in doubt. Then skip the artefact and set `ideated_in: no-decision` on the
SPEC (`file://agents/specs/SPEC.schema.md`). Filing an IDEA that records "we
did the obvious thing" produces a citable artefact with nothing citable in it.

## The Contract

The conversation MUST resolve, and the artefact MUST record:

1. **The problem** in the owner's terms, not the agent's restatement.
2. **Constraints** — technical, posture, and owner preference.
3. **2-3 considered approaches**, each cited to something real (a file, a
   command output, a doc, an owner statement). Not invented alternatives
   padded out to reach three.
4. **A recommendation**, with the reason it beats the runners-up.
5. **Owner-blocking questions**, separated from things the agent may decide.

Agent memory and training are LEGITIMATE conversational inputs but MUST NOT
appear as evidence in the artefact — the input-vs-artefact distinction
(`file://agents/OPERATING_MODEL.md` "Memory Policy").

## Grill Tactics

Owned jointly with `author-spec`, whose "Grill Before IDEA" section carries
the full pattern — the **design tree**, the **frontier** round, the question
emission shape, and the facts-vs-decisions split:
`file://agents/skills/author-spec/SKILL.md`. Read it before the first
question, not after.

In brief: work the tree in rounds, asking the whole frontier at once rather
than one question per turn; find facts yourself and dispatch a sub-agent when
the lookup is slow, without blocking the rest of the round; argue the
strongest case against your own recommendation before presenting it; name what
would change your mind; and when an option is cheaper but architecturally
worse, say so in those terms rather than leading with cost.

## Output

`specs/<id>/IDEA.md` from `file://agents/specs/IDEA.template.md`, gated to
`status: ready-for-spec`. The SPEC then cites it via `ideated_in`.

Workflow doc: `file://agents/workflows/idea-capture.md`.

## Hard Rules

- Do not advance to SPEC authoring while an owner-blocking question is open.
- Do not present a recommendation without the alternatives it beat.
- Do not cite memory or training as evidence in the artefact.
