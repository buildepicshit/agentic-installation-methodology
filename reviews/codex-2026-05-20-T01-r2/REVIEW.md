# Codex cross-family review R2 — T-01 chapter 00 introduction Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R2 spec-review after R1 remediation
Date: 2026-05-20

## Verdict

NEEDS-REVISION.

The direct R1 edits mostly landed, but the amended validator
now conflicts with the active longread Contract SPEC it is
supposed to implement. There are also residual stale citation
instructions in the producing IDEA and one unresolved `file://`
placeholder in the Task SPEC. Not ready for owner approval as
amended.

## BLOCKER findings

### Finding 1
Severity: BLOCKER

Citation:
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:126`,
`...:161`,
`specs/2026-05-20-longread-structure/SPEC.md:475`,
`...:479`, `...:486`,
`scripts/validate-longread-structure.sh:118`

Statement: T-01 now depends on in-progress validator behavior
where missing chapters are warnings and the total floor is 450
words, but the active longread Contract still says the
validator verifies every expected chapter file exists and total
word count is between 5,000 and 13,000 in the default
algorithm. This is an active authority conflict: the Task SPEC
cites the Contract as binding, while the amended validator
implements different default semantics.

Recommendation: Amend the longread Contract §8.2 and §9.2 to
explicitly define in-progress vs release-mode validator
behavior, including missing-chapter warnings and the 450-word
in-progress floor, or restore the validator default to the
Contract and add a separate chapter-scoped/in-progress command
for T-01.

## MAJOR findings

### Finding 2
Severity: MAJOR

Citation:
`specs/2026-05-20-longread-chapter-00-introduction/IDEA.md:130`,
`...:131`,
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:363`,
`...:371`

Statement: R1 Finding 3 is only partially remediated. The Task
SPEC's T-5 now correctly narrows methodology primitives to
corpus citations, but the producing IDEA still says parent
Decision §7 plus Contract §6.1-§6.5 support "Product B shape +
methodology primitives." That adjacent IDEA text preserves the
broadened citation model R1 rejected.

Recommendation: Revise IDEA §5 so methodology primitives are
anchored to corpus entries only. Keep parent Decision /
Contract / research-workpad citations limited to Product B
shape, phase structure, owner dispositions, and open-question
enumeration.

### Finding 3
Severity: MAJOR

Citation:
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:408`,
`...:414`, `...:419`, `...:424`, `...:431`

Statement: T-9 through T-13 add AC coverage, but some evidence
remains mechanically weak. T-10 only counts
`leaddev-agent-compiled` occurrences and does not prove
prior-art-as-risk framing. T-11's
`grep -cE 'Phase [0-7]'` can pass duplicates while missing a
phase, phase title, exact-once requirement, or contiguous
roadmap. T-12 is purely manual and requires "named clauses"
without defining exact clause names or literals.

Recommendation: For T-10/T-11, replace count-only checks with
exact required literals or a small validation script that
verifies Phase 0 through Phase 7 each appear once with the §6.1
titles in one roadmap block. For T-12, either define exact
reader-contract headings/labels to grep or explicitly mark it
as reviewer-judgment with precise pass/fail criteria.

### Finding 4
Severity: MAJOR

Citation:
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:363`,
`...:370`, `schema/SPEC.schema.md:211`

Statement: R1 Finding 4 is mostly closed, but one `file://`
cite still does not resolve:
`file://research/primary-sources/<slug>.md`. The schema says
`file://` paths must exist at the cited commit, and the R2
mechanical reachability check found this as the only
unresolved unique `file://` path in the SPEC + IDEA.

Recommendation: Do not prefix placeholder citation patterns
with `file://`. Use prose such as "a corpus entry matching
`research/primary-sources/<slug>.md §3`," or cite concrete
corpus files.

## MINOR findings

### Finding 5
Severity: MINOR

Citation:
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:414`,
`...:420`

Statement: T-11 says "all nine ordered phases" but immediately
defines Phase 0 through Phase 7, which is eight phase tokens.
The Contract has nine chapter files, not nine phases.

Recommendation: Change "all nine ordered phases" to "all eight
ordered phase chapters."

## Advisory

SPEC lint passed:
`bash scripts/lint-spec.sh specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
exited 0 with 0 errors and 0 warnings.

IDEA lint also passed:
`bash scripts/lint-spec.sh specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`
exited 0.

Current-worktree acceptance commands do not all pass because
T-01 has not executed yet: `test -f longread/00-introduction.md`
exits 1, and `bash scripts/validate-longread-structure.sh`
exits 1 with `in-progress: total 0 below permissive floor 450`.
That pre-execution failure is expected. Release mode correctly
errors on missing chapters.

Concrete `file://` path normalization is otherwise good:
sibling paths using `file://../bes-fleet-policy/...` resolve
from repo root, as do repo-local paths.

## R1 closure table

| R1 finding | R2 status | Evidence |
|---|---|---|
| 1. Validator fails on missing chapter files | PARTIAL | Script now demotes missing chapters to warnings in in-progress mode and release mode still errors, but the active Contract still specifies the old default validator semantics. See Finding 1. |
| 2. §8 content obligations not paired with ACs | PARTIAL | AC-9 through AC-13 exist, but T-10/T-11/T-12 still have weak or ambiguous evidence. See Finding 3. |
| 3. T-5 broadened corpus-citation rule | PARTIAL | Task SPEC T-5 is narrowed, but IDEA §5 still says parent/Contract citations support methodology primitives. See Finding 2. |
| 4. Mixed `file://` path bases | PARTIAL | Concrete repo-root and sibling paths now resolve, but `file://research/primary-sources/<slug>.md` remains unresolved. See Finding 4. |
| 5. `requires_network: false` contradicted `git push` | CLOSED | Front-matter now has `requires_network: true`; §10 External effects documents `cmd://git push`. |
| 6. Validator chapter 00 max drifted from Contract §6.2 | CLOSED | Validator now sets `00-introduction.md` max to 1100; Contract §6.2 also says 1100. |
| 7. Missing `ideated_in` front-matter | CLOSED | SPEC front-matter includes `ideated_in: specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`; IDEA is `ready-for-spec`. |

tokens used: 106,980
