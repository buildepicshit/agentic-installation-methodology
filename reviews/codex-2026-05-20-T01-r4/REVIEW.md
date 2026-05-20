# Codex cross-family review R4 — T-01 chapter 00 introduction Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R4 spec-review after R3 remediation
Date: 2026-05-20

## Verdict

NEEDS-REVISION.

No BLOCKER findings remain. R3 mostly closed, but T-11 is
still mechanically under-enforced.

## BLOCKER findings

None.

## MAJOR findings

### Finding 1
Severity: MAJOR
File:
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:429`,
`...:435`,
`scripts/check-chapter-00-phase-roadmap.sh:33`

Statement: T-11 still claims more than the helper enforces.
The SPEC requires all eight ordered phase chapters "with
phase titles per §6.1" in a contiguous roadmap, but the
helper only checks `Phase 0` through `Phase 7` tokens. It
also uses `grep -c -F`, which counts matching lines, not
literal token occurrences, so `Phase 0` repeated three times
on one line is counted as `1` and can evade the stated "at
most twice" rule.

Recommendation: Count literal occurrences with
`grep -o -F "$phase" "$CHAPTER" | wc -l` or equivalent. Also
either enforce the expected phase titles from Contract §6.1
in the helper, or demote title verification to an explicit
manual T-11 reviewer check.

## MINOR findings

None.

## Advisory

Lint passes for Task SPEC, IDEA, and Contract. Both scripts
pass `bash -n` and are executable.

Current acceptance-command failures are expected pre-
execution because `longread/00-introduction.md` does not
exist yet.

Non-blocking cleanup: Contract §8.2 and §9.2 still contain a
little two-mode-era wording/pseudocode, but the actual §8.2
three-mode prose and validator behavior align for the
acceptance path.

## R3 closure table

| R3 finding | R4 status | Evidence |
|---|---|---|
| 1. Contract still required all nine chapter files during in-progress verification | CLOSED | Contract AC-4 / DoD-3 / AC-4 qualify all-files-present as release-time only. |
| 2. Missing strict 800-word lower-bound command | CLOSED | Task acceptance includes `bash scripts/validate-longread-structure.sh --chapter 00`; validator implements chapter-strict target/max checks. |
| 3. T-11/T-12 weak mechanical checks | PARTIAL | T-12 grep chain is materially improved. T-11 helper still under-enforces occurrence counts and phase-title coverage. See Finding 1. |
| 4. Contract path bases and `<slug>.md` placeholders | CLOSED | No remaining `file://...<slug>` or stale `../../` path-base hits in the reviewed target set. |

tokens used: 132,028
