# Cross-family review R2 — T-01 chapter 00 introduction Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing R2 spec-review on a Task
SPEC after R1 remediation.

## R1 verdict was NEEDS-REVISION

R1 report at
`file://reviews/codex-2026-05-20-T01/REVIEW.md` listed 1
BLOCKER + 6 MAJOR findings. They were:

1. (BLOCKER) Validator fails on missing chapter files → T-01
   couldn't pass its own acceptance commands.
2. (MAJOR) §8 content obligations (epigraph, LeadDev cite,
   8-phase roadmap, reader contract, "In the next chapter")
   not paired with ACs.
3. (MAJOR) T-5 broadened the Contract's corpus-citation rule
   beyond what Contract §6.4 permits.
4. (MAJOR) Mixed file:// path bases (spec-dir-relative vs
   repo-root).
5. (MAJOR) `requires_network: false` contradicted `git push`
   in execution plan.
6. (MAJOR) Validator chapter 00 max (1200) drifted from
   Contract §6.2 (1100).
7. (MAJOR) Missing `ideated_in` front-matter (schema-required).

## R2 mandate

R1 remediation landed:

- Validator: missing chapters demoted to warnings in
  in-progress mode (errors in release mode). Per-chapter
  max table aligned with Contract §6.2 (6 cells corrected;
  totals now sum to 11 800).
- IDEA.md authored at
  `specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`
  (status: ready-for-spec).
- SPEC front-matter: `ideated_in:` added, `requires_network:
  true`.
- §10 External effects: git push documented.
- T-5: narrowed to require corpus cites for methodology
  primitives strictly; parent / research / owner cites
  permitted only for designated authority surfaces.
- T-9 through T-13 + AC-9 through AC-13 added covering §8
  content obligations.
- Path bases normalized to repo-root for in-repo cites;
  sibling-repo cites use `file://../bes-fleet-policy/...`
  (one-level-up; consistent with existing repo practice;
  resolves OK from repo root).

## R2 review target

`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`

Plus the producing IDEA:
`file://specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`

Plus the amended validator:
`file://scripts/validate-longread-structure.sh`

## What I want from R2

Honest verdict at SEVERITY = MAJOR-or-higher. For each
finding emit number, severity, file:line citation,
statement, recommendation.

Specifically:

1. **R1 carry-through**: did every R1 finding actually
   close, or are there residual stale references in
   adjacent sections (the "amendments leave adjacent text
   stale" pattern from the methodology arc R2-R6 codex
   passes)?
2. **New issues introduced by R1 remediation**: do T-9
   through T-13 use mechanically-verifiable evidence
   commands, or do they introduce new manual-judgment
   ambiguity? Does the validator amendment introduce new
   semantic gaps (e.g., the missing-chapter-as-warning
   path swallowing release-mode signal)?
3. **IDEA ↔ SPEC consistency**: does the IDEA cite the
   same Contract sections + corpus entries the SPEC does?
   Does §4 Approaches Considered actually narrow to the
   selected approach used in §9 of the SPEC?
4. **Acceptance-command runnability**: do
   `acceptance_commands` (lint-spec.sh, test -f, validate-
   longread-structure.sh) all succeed after the
   amendments, OR do they still encode the broken
   behavior?
5. **Mechanical reachability**: every `file://` cite in
   the SPEC + IDEA resolves to a real path (no stale
   references after the path-base normalization).

## Output

A single review document at
`reviews/codex-2026-05-20-T01-r2/REVIEW.md` (sandbox is
read-only; if you cannot write, emit to stdout and I
will persist).

Structure: Verdict, BLOCKER findings, MAJOR findings,
MINOR findings, Advisory, R1 closure table (R1 Finding N
→ status: CLOSED / PARTIAL / RE-OPENED with brief
evidence).

Be honest. If the SPEC is now ready for owner approval as
amended, say so. If not, surface the specific gaps.
