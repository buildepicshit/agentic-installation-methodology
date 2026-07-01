# Review Spec

Use this slash-command to run the BLOCKING per-type quality gate on a
`SPEC.md` (or an `IDEA.md` in IDEA mode).

Workflow:

1. Identify artefact type from front-matter `type:` (SPEC) or
   `implies_spec_type:` (IDEA).
2. Select the per-type gate:
   - Task → bar (b) "verifiable" (per SPEC §10.2)
   - Contract → bar (c) "Symphony-grade" with REQUIRED lint pass
     (per SPEC §10.3)
   - Decision → bar (b) plus candidate-comparison (per SPEC §10.4)
   - IDEA → IDEA quality gate (per SPEC §10.1)
3. For Contract specs (and RECOMMENDED for Task and Decision and IDEA):
   run `bash agents/scripts/lint-spec.sh <path>`.
   - Exit `1` → blocking failure.
   - Exit `2` → advisory warnings only.
   - Exit `0` → clean.
4. Produce a Quality Gate Result (per SPEC §6.1.4): `spec_path`, `type`,
   `bar`, `pass`, `failures` list with `criterion`, `evidence`,
   `severity`.
5. Status transitions:
   - On any blocking failure → set `status: needs-revision`.
   - On clean pass → set `status: approved-pending-owner`.
   - **The skill MUST NOT set `status: approved`. Only the owner does
     that.**

Hard rules:

- Lead with findings ordered by severity.
- Cite every finding with file:line.
- Do not approve specs with hidden architecture decisions or scope
  hidden in Open Questions.
- Refuse to run on specs that are already in a post-approval status
  (`approved`, `in-execution`, `verified`, `closed`, `superseded`).

Use the `spec-review` skill.
