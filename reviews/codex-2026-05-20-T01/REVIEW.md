# Codex cross-family review — T-01 chapter 00 introduction Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: `--sandbox read-only` (review was emitted to stdout; this
file is the durable capture by the Claude author).
Date: 2026-05-20.
Same-family Claude gate before this pass: PASS (lint 0/0, AC↔T
8↔8 paired).

## Verdict

NEEDS-REVISION — one BLOCKER making T-01 impossible to verify
as scoped; six MAJOR issues weakening citation reachability,
acceptance rigor, and SPEC↔gate alignment.

## BLOCKER findings

### Finding 1
Severity: BLOCKER

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:11`,
`specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:319`,
`scripts/validate-longread-structure.sh:119`

Statement: The front-matter requires
`bash scripts/validate-longread-structure.sh`, but this Task
owns only `longread/00-introduction.md` and explicitly forbids
authoring other chapter files. The validator exits non-zero
until all nine chapter files exist, so T-01 cannot pass its
own acceptance commands after doing only the scoped work.

Recommendation: Amend the Contract/validator to support a
chapter-scoped in-progress check, or change T-01's acceptance
command to a chapter-local mechanical check. Do not approve
this Task while the full-longread validator is mandatory for a
single-chapter slice.

## MAJOR findings

### Finding 2
Severity: MAJOR

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:177`,
`...:183`, `...:187`, `...:193`, `...:382`

Statement: Several §8 MUST/SHOULD content obligations are not
directly represented in ACs or tests: epigraph, LeadDev critique
citation, eight-phase roadmap, reader contract, and exact
"In the next chapter" forward pointer. A chapter could satisfy
AC-1 through AC-8 while missing one of those core introduction
requirements.

Recommendation: Add explicit T/AC pairs for each load-bearing
content requirement, even if some remain manual reviewer
checks. At minimum, include checks for the epigraph source,
LeadDev citation, all eight phase names, reader-contract
sentence, and final `**In the next chapter**:` pointer.

### Finding 3
Severity: MAJOR

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:350`,
`specs/2026-05-20-longread-structure/SPEC.md:268`

Statement: T-5 broadens the Contract's corpus-citation rule by
allowing methodology primitives to cite `owner://`, parent
Decision, or research workpad anchors. The Contract says
methodology primitives MUST cite corresponding corpus entries;
parent/research cites are appropriate for phase/open-question
authority, not as substitutes for primary-source corpus
anchors.

Recommendation: Narrow T-5: methodology primitives must cite
`file://research/primary-sources/<slug>.md §3`; parent Decision
and research workpad citations may only support Product B
shape, phase structure, owner dispositions, and the seven
open-question enumeration.

### Finding 4
Severity: MAJOR

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:35`,
`...:50`, `...:65`, `schema/SPEC.schema.md:211`

Statement: `file://` citations use mixed path bases. Some only
resolve relative to the SPEC directory (`../2026-...`,
`../../../bes-fleet-policy/...`), while others only resolve
from repo root (`research/...`, `scripts/...`). The schema
allows repo-relative or absolute paths, so a single mechanical
reachability validator cannot interpret this SPEC consistently.

Recommendation: Normalize internal citations to repo-root paths
such as `file://specs/2026-05-20-longread-structure/SPEC.md`
and `file://research/...`. For sibling-repo cites, use a single
documented form such as `file://../bes-fleet-policy/...` from
repo root or absolute paths.

### Finding 5
Severity: MAJOR

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:9`,
`...:288`, `...:312`

Statement: Front-matter says `requires_network: false`, but the
execution plan includes `git push`, and External effects says
"None" while also allowing a standard git push. That is a
hidden external effect and an environment requirement
contradiction.

Recommendation: Either remove push from this Task's execution
scope, or set `requires_network: true` and list the remote push
as an external effect.

### Finding 6
Severity: MAJOR

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:17`,
`specs/2026-05-20-longread-structure/SPEC.md:213`,
`scripts/validate-longread-structure.sh:38`

Statement: The SPEC and Contract set chapter 00 max at 1100
words, but the validator uses 1200 for `00-introduction.md`.
The stated mechanical validator therefore does not enforce the
chapter's declared maximum.

Recommendation: Fix the validator budget table to match
Contract §6.2 before relying on it, or add a T-3 command that
directly enforces `[800, 1100]` with the same word-count
function.

### Finding 7
Severity: MAJOR

Citation: `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:1`,
`schema/SPEC.schema.md:54`,
`templates/SPEC.task.template.md:1`

Statement: The Task SPEC front-matter omits required
`ideated_in`. The lint script misses this, but the schema and
Task template both require it.

Recommendation: Add the producing IDEA path, or explicitly
document and cite an approved lifecycle exception before review
can pass.

## MINOR findings

None at the requested MAJOR-or-higher review bar.

## Advisory

- Word-budget arithmetic in §9 sums to 800 exactly, matching
  `word_budget_target: 800`; the section plan is consistent
  with `word_budget_max: 1100`.
- Q1 and Q2 do not appear owner-blocking; both are local
  authoring choices if the acceptance gaps above are fixed.

## Reachability checks

Resolved? below uses the schema rule: repo-relative or absolute
path. "Spec-dir fallback exists" means the file exists only if
interpreted relative to
`specs/2026-05-20-longread-chapter-00-introduction/`.

| Lines | `file://` cite | Resolved? | Note |
|---|---|---:|---|
| 35, 122, 163, 273, 359 | `file://../2026-05-20-longread-structure/SPEC.md` | N | Spec-dir fallback exists |
| 50, 129, 275 | `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md` | N | Spec-dir fallback exists |
| 65, 181, 271, 297 | `file://research/primary-sources/leaddev-agent-compiled.md` | Y | Repo-root path |
| 101, 157, 343 | `file://scripts/validate-longread-structure.sh` | Y | Repo-root path |
| 109 | `file://specs/2026-05-19-primary-source-research-corpus/SPEC.md` | Y | Repo-root path |
| 113, 152 | `file://reviews/codex-2026-05-19-round6/` | Y | Repo-root directory |
| 134 | `file://research/primary-sources/` | Y | Repo-root directory |
| 137 | `file://schema/SPEC.schema.md` | Y | Repo-root path |
| 277, 299 | `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` | N | Spec-dir fallback exists |
| 353 | `file://research/primary-sources/<slug>.md §3` | N | Template pattern, not concrete path |
| 355 | `file://...` | N | Placeholder, not concrete path |
| 367 | `file://../../../bes-fleet-policy/.claude/hooks/block-ai-attribution.sh` | N | Spec-dir fallback exists |
| 369 | `file://../../../bes-fleet-policy/AGENTS.md` | N | Spec-dir fallback exists |

tokens used: 197,787
