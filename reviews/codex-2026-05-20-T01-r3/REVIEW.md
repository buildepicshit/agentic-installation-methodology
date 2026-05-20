# Codex cross-family review R3 — T-01 chapter 00 introduction Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R3 spec-review after R2 remediation
Date: 2026-05-20

## Verdict

NEEDS-REVISION.

R2 remediation closed the main Contract ↔ validator mismatch
in §8.2/§9.2, but adjacent Contract acceptance text still
contradicts the new two-mode model. The Task SPEC also lacks
a runnable acceptance command for its own 800-word lower
bound, and the new T-11/T-12 checks remain mechanically weak.

## BLOCKER findings

### Finding 1
Severity: BLOCKER
File: `specs/2026-05-20-longread-structure/SPEC.md:616`,
`...:625`, `...:628`, `...:651`

Statement: The Contract's amended §8.2/§9.2 correctly defines
in-progress mode as allowing missing chapters, but the later
acceptance and DoD surfaces still require all nine chapter
files to exist. That leaves the Contract self-contradictory:
§8.2 says per-chapter slices can pass with only their authored
chapter present, while §13 AC-4, §14 DoD-3, and §15 AC-4 still
require every chapter file.

Recommendation: Split current Contract verification from
release-time verification. Mark "all 9 chapter files exist" as
release-time only, aligned with `release_acceptance_commands`,
or move it out of this Contract's current DoD/AC list.

## MAJOR findings

### Finding 2
Severity: MAJOR
File: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:12`,
`...:18`, `...:348`, `...:478`

Statement: The Task SPEC requires chapter 00 to be 800-1100
words, but its front-matter `acceptance_commands` only run
`test -f` and the permissive in-progress validator. Under the
amended Contract semantics, a 500-word chapter would satisfy
`validate-longread-structure.sh` because it clears the 50-word
per-file floor and 450-word total floor, while still violating
AC-2/T-3.

Recommendation: Add a runnable chapter-specific word-count
acceptance command enforcing `[800, 1100]`, or extend the
validator with a chapter-strict mode and use that command in
this Task SPEC.

### Finding 3
Severity: MAJOR
File: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:431`,
`...:436`, `...:458`, `...:465`

Statement: T-11 and T-12 still do not mechanically implement
their stated pass criteria. T-11 requires ascending first
occurrences inside a single 250-word window, but its loop
only checks line counts for `Phase N` tokens. T-12 allows OR
anchors such as "not prescription", "first-class", and
"citation discipline", but its evidence loop hard-codes only
`honest experience`, `failure mode`, and `corpus`, so a
compliant chapter using the allowed alternatives can emit
`missing:` lines.

Recommendation: Either convert T-11/T-12 into explicit manual
reviewer checks, or replace the loops with commands/scripts
that check the actual stated criteria and exit nonzero on
failure.

### Finding 4
Severity: MAJOR
File: `specs/2026-05-20-longread-chapter-00-introduction/IDEA.md:136`,
`specs/2026-05-20-longread-structure/SPEC.md:44`,
`...:80`, `...:154`, `...:241`, `...:577`

Statement: Mechanical `file://` reachability is still not
clean. IDEA §5 still contains
`file://research/primary-sources/<slug>.md`, and the Contract
contains multiple `file://.../<slug>.md` placeholders. The
Contract also uses file-relative paths such as
`file://../../../bes-fleet-policy/...` and
`file://../../schema/SPEC.schema.md`, which do not resolve as
repo-relative paths under the schema grammar.

Recommendation: Remove `file://` from placeholder patterns,
cite `file://research/primary-sources/INDEX.md` for slug
resolution, and normalize Contract cites to repo-relative
paths such as `../bes-fleet-policy/...`, `schema/...`,
`research/...`, and `specs/...`.

## MINOR findings

None.

## Advisory

Lint passed for all three markdown artefacts: Task SPEC, IDEA,
and Contract. Current validator failure is expected pre-
execution: `longread/00-introduction.md` does not exist yet,
and release mode correctly errors on all missing chapters.

Contract amendment hygiene: §19 is still unfilled, so no
Amendment Log note is required under the R3 prompt's rule.

## R2 closure table

| R2 finding | R3 status | Evidence |
|---|---|---|
| 1. Contract ↔ validator mismatch | PARTIAL | §8.2/§9.2 match the validator, but §13/§14/§15 still require all nine chapter files. See Finding 1. |
| 2. IDEA citation model too broad | CLOSED | IDEA §5 limits methodology primitives to corpus entries and limits parent/Contract/workpad cites to designated authority surfaces. |
| 3. T-10/T-11/T-12 evidence weak | PARTIAL | T-10 improved, but T-11/T-12 still do not mechanically implement their stated pass criteria. See Finding 3. |
| 4. Unresolved `file://<slug>` placeholder | PARTIAL | Task SPEC placeholder fixed, but IDEA and Contract still contain unresolved placeholder `file://` cites; Contract path bases also fail repo-relative reachability. See Finding 4. |
| 5. "nine ordered phases" wording | CLOSED | T-11 says "eight ordered phase chapters" and enumerates Phase 0 through Phase 7. |

tokens used: 87,527
