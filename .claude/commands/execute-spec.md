# Execute Spec

Use this slash-command only after a `SPEC.md` is `status: approved` by
owner.

Pre-conditions (REQUIRED — refuse to proceed otherwise):

- SPEC.md front-matter `status: approved`.

Workflow:

1. Re-read the approved spec, `AGENTS.md`, `CLAUDE.md`, `STATUS.md`.
2. Confirm the worktree or branch state.
3. Implement only the approved scope.
4. Preserve unrelated user changes.
5. Update directly coupled tests/docs only when required by the spec.
6. Run all `acceptance_commands` from front-matter; record exit codes
   and outputs in §Completion Report.
7. Prepare the Completion Report requested by the spec (§6 in the unified
   `SPEC.template.md`; §5 in fastpath).

Hard rules:

- Subagents MUST NOT modify any section of the SPEC except the
  Completion Report.
- If new facts materially change scope: STOP and surface to the owner.
  Do NOT silently revise the SPEC.
- No AI attribution in commits, PRs, or generated output.
- Stage files explicitly by name. Never `git add -A` or `git add .`.

Use the `implementation-execution` skill.
