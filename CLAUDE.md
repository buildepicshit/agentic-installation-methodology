# CLAUDE.md — agentic-installation-methodology

@AGENTS.md

## Claude entry protocol

1. Read `AGENTS.md` (imported above).
2. Read the active SPEC under `specs/<id>/SPEC.md` if one
   exists.
3. Read `schema/SPEC.schema.md` — front-matter schema,
   citation grammar, RFC 2119 conventions, status state
   machine.
4. For non-trivial work, follow the v1 spec-first procedure
   (IDEA → SPEC → blocking review → owner approval →
   execute → verify → spec-evidence → closed).

## Posture

This repo is **v0.1 scaffold**. No methodology content has
been authored. The next planned slices, bound by the parent
Decision SPEC at
`bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7, are:

- Repack of the sibling `agentic-ops-framework` v1.1 into
  manifest+catalog v2.0 (the worked example).
- Longread authoring (~8-12K words, first-person
  experiential, BES case-study density).
- Per-facet SPEC bundle authoring (architecture, deployment,
  behavior, customization, decisions, quality, operations,
  non-goals).
- External cross-family agent validation pass — gates
  publication.

A deep-research slice precedes the methodology-content slices
(longread + SPEC bundle): primary-source reads of arc42, C4
model, ADRs, Diátaxis, 12-factor, Helm values schemas, Nix
flakes, OCI artefacts, Sigstore signing, Symphony SPEC, and
the closest published precursors (Spec Kit, Kiro, OpenSpec,
Oracle Agent Spec). The methodology content must be grounded
in those primaries, not in agent summaries.

## Active SPEC

`specs/2026-05-18-repo-standup/SPEC.md` (status: verified) —
the inaugural internal SPEC capturing the scaffold standup
work via capture-after.

## Hooks (active)

PreToolUse, SessionStart, and Stop hooks ported verbatim from
Product A v1.1 (`hooks/` directory). Behaviour matches
Product A; see Product A's `OPERATING_MODEL.md` and the
hook source files for invariants.

## Tests

`tests/hooks/run-tests.sh` — 33-case hermetic harness ported
from Product A v1.1.
