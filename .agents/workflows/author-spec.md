# Author Spec

Use this workflow to turn an approved IDEA artefact into a typed,
executable `SPEC.md`. Authoring mechanics are owned by the
`spec-authoring` skill (`agents/skills/spec-authoring/SKILL.md`); the
shared schema lives at `agents/specs/SPEC.schema.md`.

## Pre-conditions (REQUIRED)

This workflow REFUSES to run unless ALL of the following hold:

1. The target spec folder exists (`.agents/specs/<spec-id>/` in child
   repos; `specs/<spec-id>/` in `bes-fleet-policy`).
2. `<spec-folder>/IDEA.md` exists.
3. `IDEA.md` front-matter has `status: ready-for-spec`.
4. `IDEA.md` front-matter has `implies_spec_type:` set to one of
   `task`, `contract`, or `decision`.

If any pre-condition fails, the workflow MUST stop and surface the
specific failure with a `file://` citation. It MUST NOT proceed to
author `SPEC.md`. Recovery is to run `/idea-capture` (or revise the
existing IDEA) until the IDEA quality gate passes.

Pseudocode (per the authority spec §17.2):

```text
function author_spec(spec_folder):
  idea_path = spec_folder + "/IDEA.md"
  if not exists(idea_path):
    return error("IDEA.md missing at " + idea_path)
  if front_matter(idea_path, "status") != "ready-for-spec":
    return error("IDEA.md not ready-for-spec at " + idea_path)
  type = front_matter(idea_path, "implies_spec_type")
  if type not in {"task", "contract", "decision"}:
    return error("invalid implies_spec_type: " + str(type))
  template_path = "agents/specs/SPEC." + type + ".template.md"
  template = read(template_path)
  spec = render_spec(template, idea_path)
  write(spec_folder + "/SPEC.md", spec)
  set_front_matter(spec_folder + "/SPEC.md", "status", "draft")
  set_front_matter(spec_folder + "/SPEC.md", "type", type)
  set_front_matter(spec_folder + "/SPEC.md", "ideated_in",
                   relative_path(spec_folder, idea_path))
  return spec_folder + "/SPEC.md"
```

## Workflow

1. Read `AGENTS.md`, `CLAUDE.md` if present, `STATUS.md` if present,
   and `.agents/DOCUMENTATION_GUIDE.md` if present.
2. Confirm the pre-conditions above. Stop on failure.
3. Read `<spec-folder>/IDEA.md` in full. Treat it as the binding
   ideation record.
4. Read `agents/specs/SPEC.schema.md` for citation grammar and
   front-matter conventions.
5. Read `implies_spec_type:` from `IDEA.md` front-matter and select
   the matching template:
   - `task` → `agents/specs/SPEC.task.template.md`
   - `contract` → `agents/specs/SPEC.contract.template.md`
   - `decision` → `agents/specs/SPEC.decision.template.md`
6. Inspect the codebase and authoritative sources before proposing
   implementation details. Every factual claim authored into
   `SPEC.md` MUST carry a citation prefix.
7. Author `SPEC.md` in the spec folder, populated from `IDEA.md` and
   the conversation context. Preserve every required section header
   from the chosen template verbatim.
8. Set front-matter:
   - `type:` to the chosen subtype (matches `implies_spec_type:`).
   - `status: draft`.
   - `ideated_in:` to the repo-relative path of `IDEA.md`.
   - All other shared front-matter fields per
     `agents/specs/SPEC.schema.md` §1.2.
9. Fill `Current System Facts` / `Code/Docs Reality Check` with cited
   facts only. No memory-only claims.
10. Keep implementation steps concrete enough for another agent to
    execute. Mark unresolved decisions as Open Questions instead of
    guessing.
11. Hand off to the blocking quality gate by running `/review-spec`
    on the new `SPEC.md`. The `spec-review` skill applies the
    per-type gate, runs `lint-spec.sh` (REQUIRED for Contract),
    produces a Quality Gate Result, and sets
    `status: needs-revision` on any blocking failure or
    `status: approved-pending-owner` on a clean pass.
12. Stop at the spec. The owner — and only the owner — sets
    `status: approved`. Do not implement until `status: approved`.

## Hard rules

- Do NOT proceed if `IDEA.md` is missing or its `status:` is not
  `ready-for-spec`.
- Do NOT pick a template that does not match
  `implies_spec_type:`. Type selection is determined by the IDEA
  artefact, not by the authoring agent's preference.
- Do NOT skip the handoff to `/review-spec`. The review gate is
  blocking and the only path to `approved-pending-owner`.
- Do NOT set `status: approved`. Only the owner does that.
