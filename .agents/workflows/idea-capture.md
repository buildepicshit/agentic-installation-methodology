# Idea Capture

Use this workflow at the close of an ideation conversation between
owner and primary agent, to capture the conversation as a contract-
grade IDEA.md that feeds `/author-spec`.

This workflow is Phase 2 of the BES IDEA→SPEC pipeline (see
`agents/skills/spec-authoring/SKILL.md` and
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§7.2).

## Inputs

- `<slug>`: kebab-case topic slug (REQUIRED).
- Optional `--spec-id <YYYY-MM-DD>-<slug>` override. Default is
  today's ISO date plus the slug.
- The active conversation transcript, including any owner directives
  captured as `owner://transcript-<YYYY-MM-DD>` references.

## Procedure

0. Apply the grill-before-IDEA tactic from
   `agents/skills/spec-authoring/SKILL.md`: inspect repo facts before
   asking, ask one owner question at a time, present 2-3 approaches
   when the design space is ambiguous, and capture owner validation
   before authoring the IDEA.
1. Read `agents/skills/spec-authoring/SKILL.md` and
   `agents/specs/SPEC.schema.md`. Confirm the chosen
   `implies_spec_type` (task / contract / decision) per the type-
   selection decision tree.
2. Compute `spec_id`. Default: `<today-iso>-<slug>`. If the owner
   passed `--spec-id`, use that.
3. Determine the spec folder. In `bes-fleet-policy`, the folder is
   `specs/<spec_id>/`. In any child repo (ACTOCCATUD, Floom, IKTO,
   Mimir, UsefulIdiots, Wick), the folder is
   `.agents/specs/<spec_id>/`. Create it if missing.
4. Render `IDEA.md` from `agents/specs/IDEA.template.md`, populating
   each REQUIRED section from the conversation:
   - Front-matter: `id`, `spec_id`, `status: draft`, `owner`,
     `brainstormed_by`, `brainstormed_on`, `implies_spec_type`.
   - Body: Working Title, Normative Language preamble, 1. Problem
     Seed, 2. Substance Citations, 3. Constraints & Non-Negotiables,
     4. Approaches Considered (≥ 2), 5. Recommendation, 6. Open
     Questions for Owner, 7. Owner Judgments.
5. Apply the citation grammar
   (`file://agents/specs/SPEC.schema.md` §2) to every factual claim.
   Owner directives in §7 MUST appear as `owner://transcript-<YYYY-
   MM-DD>` with the verbatim quote in surrounding prose. Agent memory
   and training MUST NOT appear as evidence.
6. Write the file. Leave `status: draft`.
7. Run the IDEA quality gate (
   `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
   §10.1) by handing off to `spec-review` in IDEA mode, or by
   invoking `agents/scripts/lint-spec.sh <folder>/IDEA.md` directly.
8. Resolve status from the gate result:
   - **Pass** (no blocking failures): set `status: ready-for-spec`.
     Surface the result and tell the owner the IDEA is ready for
     `/author-spec`.
   - **Fail** (one or more blocking failures): leave
     `status: draft`. Surface every failure with a `file:line`
     citation. Do not advance.
   - **Owner-blocking**: if the conversation could not resolve all
     §6 Open Questions and the IDEA still records unresolved owner-
     blocking questions, set `status: owner-blocking` instead of
     `ready-for-spec` and stop. Owner-blocking is a separate
     transition from a gate failure; do not conflate the two.
9. Print the spec folder path, the IDEA.md path, the resulting
   status, and the next action for the owner.

## Reference Algorithm

From `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§17.1:

```text
function idea_capture(slug, conversation_state):
  spec_id = today_iso() + "-" + slug
  folder = current_repo_root() + "/.agents/specs/" + spec_id
  if running_in_bes_fleet_policy():
    folder = repo_root() + "/specs/" + spec_id
  ensure_directory(folder)
  template = read("agents/specs/IDEA.template.md")
  idea = render_idea(template, conversation_state)
  write(folder + "/IDEA.md", idea)
  set_front_matter(folder + "/IDEA.md", "status", "draft")
  result = run_idea_quality_gate(folder + "/IDEA.md")
  if result.pass:
    set_front_matter(folder + "/IDEA.md", "status", "ready-for-spec")
  else:
    surface_failures(result.failures)
  return result
```

## Hard Rules

- Do not skip the quality gate. An IDEA at `status: draft` blocks
  `/author-spec`; an IDEA at `status: ready-for-spec` MUST have
  passed the gate.
- Do not set `status: ready-for-spec` on a failing gate.
- Do not silently rewrite owner statements. Use verbatim quotes
  attributed to `owner://transcript-<YYYY-MM-DD>`.
- Do not put agent memory or training as evidence in the artefact.
  Conversational input, yes; cited evidence, no.
- Do not propagate this workflow's path conventions by hand. The
  dual-path branch (`specs/` in `bes-fleet-policy`,
  `.agents/specs/` in child repos) is part of the contract;
  re-deriving it elsewhere risks drift.
