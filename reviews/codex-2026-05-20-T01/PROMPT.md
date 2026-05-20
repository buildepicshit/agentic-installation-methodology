# Cross-family review — T-01 chapter 00 introduction Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing a BLOCKING cross-family
spec-review pass on a Task SPEC. Same-family Claude review
already passed clean (lint 0/0, AC↔T 8↔8 paired). Find what
same-family review missed.

## Target SPEC

`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`

Type: task. Bar: (b) verifiable per
`file://../bes-fleet-policy/specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§10.2.

## Context: where this slice sits

Parent Decision SPEC:
`file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7 binds Product B shape (case-study + procedure + posture);
chapter 00 is the reader's first contact with the published
methodology.

Active Contract this Task implements:
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution; the longread structural contract). Per
§6.1 chapter 00 is "Why agentic installation; what this
longread is + is not; reader contract." §6.2 word budget table;
§6.3 voice contract; §6.4 corpus-citation rule; §6.5 per-
chapter failure-mode rule (chapter 00 is exempt per §7
exception); §7.1 authoring sequence (chapter 00 first); §8.1
file structure.

Primary-source corpus (the citation base):
`file://research/primary-sources/` — 22 verified sources at
SOURCE_LIST_VERSION v1.1. Lookup index:
`file://research/primary-sources/INDEX.md`.

Six prior rounds of codex review converged on the three
Contract SPECs that bind this slice; see
`file://reviews/codex-2026-05-19-round{1..6}/` for the trajectory
(27→17→10→9→7→0 findings).

## What I want from you

A spec-review pass at SEVERITY = MAJOR-or-higher.

For each finding emit:

- finding number
- severity (BLOCKER / MAJOR / MINOR / ADVISORY)
- citation (file:line)
- statement (what is wrong, in one or two sentences)
- recommendation (what to change)

Specifically scan for what same-family review tends to miss:

1. **Hidden scope**: Does any Open Question or §9 Domain Model
   text imply a substantive design choice that should be a
   blocking decision before approval?
2. **Citation discipline drift**: Are any factual claims
   backed only by agent-memory phrasing dressed up as a
   `file://` cite that doesn't actually exist?
3. **Voice / posture inconsistency**: Does the Task SPEC
   itself follow the corpus-citation rule it imposes on the
   chapter, or does it tell-not-show?
4. **Test-Plan rigour**: Are T-1 through T-8 actually
   mechanically verifiable as written? Or do any of them
   require reviewer judgment in ways that hide acceptance
   risk?
5. **Acceptance-Criteria vs Desired-Behavior drift**: Does
   every MUST/SHOULD/MAY in §8 surface as either an AC or as
   an explicit non-acceptance-criterion design constraint?
6. **Word-budget arithmetic**: The chapter §9 section sizes
   sum to ~800. Does the sum match the front-matter
   `word_budget_target: 800`? Are the §9 sizes consistent
   with `word_budget_max: 1100`?
7. **Citation reachability**: Do every `file://...` cite in
   the SPEC resolve to a real path?
8. **Boundary with neighboring chapters**: Does the SPEC
   over-specify or under-specify what chapter 00 owns vs
   what subsequent chapters own?

Anything beyond MAJOR-or-higher (advisory polish, editorial
nitpick) — note in a brief Advisory section at the end. Don't
spend cycles on it.

## Output

A single review document at
`reviews/codex-2026-05-20-T01/REVIEW.md` with the structure:

```
# Codex cross-family review — T-01 chapter 00 introduction Task SPEC

## Verdict

<one-line PASS / NEEDS-REVISION + rationale>

## BLOCKER findings

## MAJOR findings

## MINOR findings

## Advisory

## Reachability checks

(table of file:// cites in the SPEC + resolved? Y/N)
```

Be honest. If the SPEC is in fact ready for owner approval as
drafted, say so. If it isn't, surface why with specific
file:line cites.
