# Verify Spec

Use this slash-command after implementation to verify a SPEC's
acceptance gate.

Workflow:

1. Inspect the diff against the approved spec (`git diff` between the
   pre-execution and current commits).
2. Confirm no unrelated files changed (the SPEC's scope boundary).
3. Run all `acceptance_commands` from front-matter; record exact
   command results.
4. Run the repo's normal verification gate if different (e.g. test
   suites, linters).
5. Check docs and instructions for consistency with the SPEC.
6. For Contract specs: re-run `bash agents/scripts/lint-spec.sh <SPEC>`
   to confirm self-conformance.
7. Fill the Completion Report:
   - Files changed
   - Commands run with exit codes
   - Verification result (per Test ID where the spec uses one)
   - Residual risks
   - Spec evidence candidates
8. If all acceptance criteria PASS and the report is filled, set SPEC
   front-matter `status: verified` (or hand off for owner to do so).

Hard rules:

- Do NOT say complete unless verification ran in the current session.
- Do NOT bypass repo hooks or verification gates.
- No AI attribution.

Use the `verification` skill.
