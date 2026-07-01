# Review Spec

Slash command: `/review-spec`. This workflow is **BLOCKING**: it MUST
move spec status to `needs-revision` on any blocking failure and MUST
NOT advance a spec to `approved`. Only the owner sets `approved`
(authority: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§7.6, §11.6; schema: `file://agents/specs/SPEC.schema.md` §5).

Use the `spec-review` skill
(`file://agents/skills/spec-review/SKILL.md`) for the gate logic; this
workflow doc is the slash-command-level orchestration.

## When to run

1. After `/author-spec` writes a `SPEC.md` and before owner approval.
2. After an author revises a spec previously marked
   `status: needs-revision`.
3. As a follow-up to `/idea-capture` if the IDEA gate did not auto-
   transition `IDEA.md` from `draft` to `ready-for-spec` (rare; the
   IDEA gate normally runs inline in `/idea-capture`).

## Inputs

- `<spec_path>`: repo-relative path to the artefact under review.
  REQUIRED. The artefact MUST be `<spec-folder>/SPEC.md` or
  `<spec-folder>/IDEA.md`.

## Steps

1. Read front-matter of `<spec_path>`. REQUIRE either `type`
   (`task` | `contract` | `decision`) for SPEC.md, or
   `implies_spec_type` for IDEA.md. If front-matter is missing or
   malformed, emit a Quality Gate Result with
   `criterion: front-matter-parse`, `severity: blocking`, and stop.
2. Reject if `status` is already in a post-approval state
   (`approved`, `in-execution`, `verified`, `closed`,
   `superseded`). Emit
   `criterion: status-not-reviewable`, `severity: blocking`. Do not
   mutate the artefact.
3. Select the per-type gate (per SPEC §10):
   - `task` → §10.2 bar (b) "verifiable".
   - `contract` → §10.3 bar (c) "Contract-grade".
   - `decision` → §10.4 bar (b) + candidate-comparison.
   - IDEA.md → §10.1 IDEA gate.
4. Run the selected gate. Collect failures with `criterion`,
   `evidence` (file/line citation per SPEC.schema §2), and
   `severity` (`blocking` | `advisory`).
5. Run `bash agents/scripts/lint-spec.sh <spec_path>`:
   - **REQUIRED** for `type: contract`. Exit 1 → append failure with
     `severity: blocking`. Exit 2 → append with `severity: advisory`.
     Exit 0 → no entry.
   - RECOMMENDED for `type: task`, `type: decision`, and IDEA.md.
     Run, but treat exit 1 as advisory unless the gate independently
     fails the same check.
   - If the lint script is missing at invocation time and the spec
     is `type: contract`, emit `criterion: lint-unavailable`,
     `severity: blocking`.
6. Emit the Quality Gate Result. Schema per SPEC §6.1.4:
   `spec_path`, `type`, `bar`, `pass`, `failures[].criterion`,
   `failures[].evidence`, `failures[].severity`. The skill's
   `SKILL.md` shows a worked example.
7. Transition front-matter `status` per the table below. The skill
   performs the mutation; this workflow only orchestrates.

## Status transitions

| Artefact | Status before | Blocking failure? | Status after |
|---|---|---|---|
| `SPEC.md` | `draft` | yes | `needs-revision` |
| `SPEC.md` | `draft` | no | `approved-pending-owner` |
| `SPEC.md` | `needs-revision` | yes | `needs-revision` |
| `SPEC.md` | `needs-revision` | no | `approved-pending-owner` |
| `IDEA.md` | `draft` | yes | `draft` (surface failures) |
| `IDEA.md` | `draft` | no | `ready-for-spec` |
| `IDEA.md` | `owner-blocking` | (any) | `owner-blocking` (owner only) |

The workflow MUST NOT set `status: approved` on any artefact. The
owner sets `approved` after reviewing the Quality Gate Result and
the SPEC.

## Output

Return, in order:

1. The Quality Gate Result (YAML block).
2. Blocking findings first, ordered by severity, each with a
   file/line citation.
3. Advisory findings after.
4. The recommendation line: `approve-pending-owner`,
   `block-needs-revision`, `idea-ready-for-spec`, or `idea-blocked`.

## Hard rules

- BLOCKING: any `severity: blocking` failure prevents the
  `approved-pending-owner` transition.
- The workflow MUST NOT set `status: approved`. Owner authority only.
- The workflow MUST NOT silently revise spec content. It mutates only
  front-matter `status` per the table above.
- Lint exit 1 on a Contract SPEC blocks even if the gate otherwise
  passes.
- Open Questions that imply substantive design choices are
  `criterion: scope-hidden-in-open-question`, `severity: blocking`.
- Cite every finding (`file://`, `cmd://`, etc.) per SPEC.schema §2.
  Uncited findings are themselves a review-quality failure.

## Cross-references

- Skill (gate logic): `file://agents/skills/spec-review/SKILL.md`.
- Authority: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
  §10, §11.6, §17.3.
- Schema: `file://agents/specs/SPEC.schema.md` §5, §1.3, §2, §3.
- Lint script: `file://agents/scripts/lint-spec.sh`.
- Companion workflows: `file://agents/workflows/idea-capture.md`,
  `file://agents/workflows/author-spec.md`.
