# Cross-family review R3 — T-01 chapter 00 introduction Task SPEC

You are a different-model-family reviewer (gpt-5.5, xhigh
reasoning, read-only) performing R3 spec-review after R2
remediation.

## R2 verdict was NEEDS-REVISION

R2 report at
`file://reviews/codex-2026-05-20-T01-r2/REVIEW.md` listed 1
BLOCKER + 3 MAJOR + 1 MINOR.

## R2 remediation landed

- **R2 Finding 1 (BLOCKER)**: Longread Contract §8.2 +
  §9.2 amended to declare two modes (in-progress
  default; release with `--release-mode`); missing-
  chapter-as-warning + 450-word in-progress floor +
  release-mode [8000, 12000] band now match validator
  semantics. Contract still at status: in-execution.
- **R2 Finding 2 (MAJOR)**: IDEA §5 narrowed —
  methodology primitives MUST cite corpus-only;
  parent / Contract / research-workpad cites limited to
  designated authority surfaces.
- **R2 Finding 3 (MAJOR)**: T-10 + T-11 + T-12 evidence
  strengthened — T-10 adds prior-art-framing manual
  judgment + 200-char window substring check; T-11
  enumerates eight literal "Phase N" tokens with a
  bash loop checking each appears 1-2 times; T-12
  names three contract clauses with case-insensitive
  substring anchors + a bash loop checking presence.
- **R2 Finding 4 (MAJOR)**: `file://` prefix removed
  from the `<slug>.md` placeholder; reference now uses
  prose pattern + a real cite to
  `file://research/primary-sources/INDEX.md` for slug
  resolution.
- **R2 Finding 5 (MINOR)**: "nine ordered phases" →
  "eight ordered phase chapters" in T-11.

## R3 review target

`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
`file://specs/2026-05-20-longread-chapter-00-introduction/IDEA.md`
`file://specs/2026-05-20-longread-structure/SPEC.md` (the
amended Contract)
`file://scripts/validate-longread-structure.sh` (the
amended validator)

## R3 mandate

Honest verdict at SEVERITY = MAJOR-or-higher. For each
finding emit number, severity, file:line, statement,
recommendation.

Specifically scan for:

1. **R2 carry-through**: did every R2 finding actually
   close, or are there residual stale references in
   adjacent sections (the "amendments leave adjacent
   text stale" pattern)?
2. **New issues introduced by R2 remediation**: does the
   amended Contract §8.2/§9.2 introduce new logic gaps?
   Does the validator implement what the amended
   Contract describes (Contract ↔ code parity)? Do the
   new T-10/T-11/T-12 commands actually pass when the
   chapter is well-authored, and fail when it isn't?
3. **Acceptance-command runnability**: are
   `acceptance_commands` complete and self-consistent
   under the new Contract semantics?
4. **Mechanical reachability**: every `file://` cite in
   SPEC + IDEA + Contract resolves to a real path.
5. **Contract amendment hygiene**: the Contract was
   amended in-place at status: in-execution. Does that
   require an Amendment Log subsection in §19 (or
   wherever the Completion Report lives) to record the
   post-design amendment? If §19 is currently empty
   (because the Contract has not been verified yet),
   no log is required, but if §19 is populated, an
   amendment note is required.

## Output

A single review document at
`reviews/codex-2026-05-20-T01-r3/REVIEW.md` (sandbox is
read-only; if you cannot write, emit to stdout and I
will persist).

Structure: Verdict, BLOCKER findings, MAJOR findings,
MINOR findings, Advisory, R2 closure table.

Be honest. If the SPEC + IDEA + Contract are now ready
for owner approval as amended, say so. If not, surface
specific gaps.
