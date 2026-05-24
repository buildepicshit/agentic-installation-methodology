# R4 Review — T-09 chapter 08 Phase 7 failure modes Task SPEC

## Findings

No MAJOR-or-higher findings.

## Verdict

**CONVERGENCE-PASS.**

R3 F1 is cleanly closed. The helper now requires each failure-mode
anchor to appear in a distinct `### ...` heading line, with the
three §6.5 bold markers inside that subsection body. A combined
`### Cross-phase modes` subsection no longer satisfies F2.

## Evidence

- `bash scripts/lint-spec.sh specs/.../SPEC.md` passed with 0 errors
  / 0 warnings.
- `bash scripts/lint-spec.sh specs/.../IDEA.md` passed with 0 errors
  / 0 warnings.
- `bash -n scripts/check-chapter-08-phase-7-anchors.sh` passed.
- `bash -n scripts/check-chapter-08-closing.sh` passed.
- Synthetic F2 fixtures against the exact AWK block:
  - combined `### Cross-phase modes` body listing all four anchors
    + one marker triplet: FAIL on all four anchors.
  - distributed four `### ...` subsections with one marker triplet
    each: PASS.
  - three-mode fixture missing ceremony refactor subsection: FAIL.
  - one heading containing all four anchor words + one marker
    triplet: FAIL for the remaining unclaimed anchors.

## Notes

The default chapter helpers currently fail because
`longread/08-phase-7-failure-modes-as-first-class-content.md` has
not been authored yet. I did not count that as a finding because
this review target is the Task SPEC / IDEA / helper scripts, not
completed chapter execution.

## Convergence trajectory

| Round | BLOCKER | MAJOR | MINOR |
|---|---|---|---|
| R1 | 0 | 2 | 0 |
| R2 | 0 | 1 | 0 |
| R3 | 0 | 1 | 0 |
| R4 | 0 | 0 | 0 |

tokens used: 83,811
