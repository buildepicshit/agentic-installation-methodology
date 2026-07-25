# Reference Architecture First + External Tool Adoption

Authoring discipline that fires when the SPEC's domain has a public
reference architecture, OR when the SPEC adopts an external tool.
Read this when either applies; the parent SKILL.md links here.

## Contents

- Reference Architecture First — procedure when a public reference
  exists.
- External tool adoption shape — the six-part shape for landing a
  new tool in the fleet.

## Reference Architecture First

When a public reference architecture exists for the SPEC's domain,
cite it in §3 Evidence / Authority and mirror its contract shape. Novel
design is for gaps the reference does not cover.

Procedure:

1. Identify the reference architecture (an OSS project, a published
   spec, an academic paper, an internal-but-prior BES SPEC).
2. Fetch and read the reference's spec/SPEC.md/whitepaper.
3. Cite verbatim in §3 Evidence / Authority with `url://`, `file://`,
   or `owner://` prefix per `file://agents/specs/SPEC.schema.md` §2.
4. Map the reference's primary entities, state machines, and
   normative requirements onto BES fleet primitives (citation
   discipline, owner-only authority, fleet propagation, hooks,
   lint).
5. Diff the gap: what does the reference cover that BES doesn't?
   What does BES cover that the reference doesn't?
6. The SPEC's design proposes the gap-closing primitives only; it
   does NOT re-derive what the reference already specifies.

Worked example:
`file://specs/2026-05-09-symphony-aligned-execution-layer/SPEC_EVIDENCE.md` §2.

## External tool adoption shape

When adopting an external tool that fits BES procedure (CLI, library,
runner), use this six-part shape:

1. **Decision SPEC** selecting the tool over alternatives. Cites
   the upstream repo + docs in §3 Evidence / Authority; the
   trade-off matrix in the "Decision Criteria · Candidate Options ·
   Trade-off Comparison" section covers BES-specific criteria
   (procedure binding, coexistence with existing tooling,
   citation+authority preservation, OSS posture, agent skill
   surface, maintenance cost).
2. **Task SPEC** executing the deliverables. Lists the artefact
   set in §6.1 Files Changed.
3. **`agents/skills/<tool>/SKILL.md`** mirroring upstream's
   SKILL.md if one exists, adding BES bindings (citation grammar,
   owner-only authority, propagation contract, hard rules against
   bypassing existing fleet surfaces).
4. **`agents/templates/<tool>.<ext>.template`** project-level
   config bound to BES procedure via the tool's hook surface
   (lint-spec on staged artefacts, parent-SPEC acceptance on
   merge, evidence reminders, removal guards).
5. **`agents/OPERATING_MODEL.md`** section documenting the tool
   boundary against existing fleet tooling (e.g., "use X for
   autonomous; use Y for owner-led").
6. **`agents/SKILL_REGISTRY.md`** row in the supplementary skill
   table.

`fleet-sync.sh` propagates (3) + (4) + the manifest entry in
`agents/scripts/fleet-files.txt`. `.config/<tool>.<ext>` is
overwritten on each sync; per-repo edits are drift.

Adoption precedent: `file://specs/2026-05-09-fleet-adopt-worktrunk/SPEC.md`.
