---
id: 2026-05-24-longread-chapter-08-phase-7-failure-modes
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md
  - test -f longread/08-phase-7-failure-modes-as-first-class-content.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 08
  - bash scripts/check-chapter-08-phase-7-anchors.sh
  - bash scripts/check-chapter-08-closing.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/08-phase-7-failure-modes-as-first-class-content.md
word_budget_target: 1500
word_budget_max: 2000
---

# SPEC: Longread chapter 08 — Phase 7 Failure Modes

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 08 as the
Phase 7 chapter: "Failure modes; open research
questions; the honest posture." Chapters 00-07 closed
(07 pending owner close). Per
`file://specs/2026-05-20-longread-structure/SPEC.md`
§7.1, chapter 08 follows chapter 07. This Task SPEC
authors the final chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 08 is the methodology's most explicit honest-
disclosure chapter. By its end, the reader has: (1)
per-chapter failure synthesis pulling chapters 01-07
together; (2) the four+ cross-phase BES failure modes
catalogued per workpad §7; (3) all seven open research
questions enumerated as flagged-open per workpad §2.3
+ parent Decision §7 binding; (4) a meta Phase 7
failure note for what failure-modes-as-content itself
missed; (5) the "this is the last chapter" closer per
Contract §8.1.

## 3. Goals

- Author
  `longread/08-phase-7-failure-modes-as-first-class-content.md`
  at target 1 500 words (advisory under soft-floors);
  max 2 000 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 — largest chapter.
- Include the Phase 7 question framing (failure modes
  as content vs errata; revisit chapter 00 reader
  contract).
- Synthesise per-chapter failure notes from chapters
  01-07 (each cited by file path).
- Catalogue the four+ BES cross-phase failure modes
  per workpad §7: fastpath zero-adoption;
  decomposition-phase paper-only; workpad bootstrap
  gap; four owner-blocking ceremony refactor
  questions. Internal BES SPEC IDs cited per Contract
  §6.6 where they support disclosure.
- Enumerate all seven open research questions per
  workpad §2.3 (verbatim or near-verbatim).
- Include a Phase 7 meta-failure note in §6.5 three-
  element structure as the chapter's penultimate
  section.
- Close with the literal forward-pointer text per
  Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1: "**In the next chapter**: This is the last
  chapter. The seven open research questions follow."
- Author WITHOUT padding-for-budget AND WITHOUT over-
  attribution beyond §6 authority-source list.

## 4. Non-Goals

- Resolving any of the seven open research questions
  — chapter 08 enumerates as flagged-open, does not
  claim to resolve.
- Adding new failure modes beyond the four+ workpad
  §7 + per-chapter synthesis.
- Cutting the v1.0 release — that's a separate Task
  SPEC.

## 5. Current System Facts

- Chapters 00-07 are at status: closed
  (`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  through
  `file://specs/2026-05-24-longread-chapter-07-phase-6-ship/SPEC.md`).
- Validator at
  `file://scripts/validate-longread-structure.sh`
  chapter-strict mode enforces 2 000 max for chapter
  08; 1 500 target advisory.
- Workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 7 (definition) + §7 (four+ failure modes)
  + §2.3 (seven open research questions).
- Parent Decision §7 at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  binds publication of both failure modes (research §7)
  and open research questions (research §2.3) as
  flagged-open.

## 6. Authority Map

Chapter 08 MAY cite the following authorities for
methodology-primitive and case-study claims. Any
claim beyond this set is over-attribution. <!-- lint-ok: no-citation -->

- **Primary-source corpus** at
  `file://research/primary-sources/`: methodology
  primitives, especially
  `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 for risk framing.
- **Workpad** at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`:
  §6 Phase 7 definition + §7 four+ failure modes +
  §2.3 seven open research questions.
- **Parent Decision §7** at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`:
  publish-failure-modes + publish-open-questions
  binding.
- **Chapters 01-07 failure notes** at
  `file://longread/01-phase-0-maturity-check.md`
  through
  `file://longread/07-phase-6-ship.md`: synthesis
  inputs.
- **Internal BES audit SPECs** per Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.6: identifiers like `2026-05-17-contract-corpus-
  retrospective-audit` MAY be cited for specific
  failure-mode disclosure.

## 7. Code/Docs Reality Check

- Soft-floors regime in effect per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Helper patterns proven across chapters 03-07 (latest
  at `file://reviews/codex-2026-05-24-T08-r2/REVIEW.md`).
- Chapter 08 has NO forward pointer to another chapter
  — uses the
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1 last-chapter closer.

## 8. Desired Behavior

After this Task executes:

- A file
  `longread/08-phase-7-failure-modes-as-first-class-content.md`
  MUST exist with prose content at or below 2 000
  words.
- The chapter MUST include the Phase 7 question
  framing.
- The chapter MUST synthesise per-chapter failure
  notes from chapters 01-07 (cited by file path).
- The chapter MUST disclose all four+ workpad §7
  cross-phase failure modes (fastpath, decomposition,
  workpad-bootstrap, ceremony-refactor). Each mode
  MUST own a DISTINCT level-3 markdown subsection
  (`### …` heading) whose heading-line text mentions
  the mode anchor word AND whose subsection body
  (until the next `### `, `## `, or end-of-file)
  contains the Contract §6.5 three-element structure
  with literal bold markers `**What happened.**`,
  `**What we did.**`, `**What pattern generalizes.**`
  per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5. A single combined subsection naming all four
  modes is non-conformant; markers detached from the
  mode subsection are non-conformant; subsection
  reuse across modes is non-conformant.
- The chapter MUST enumerate all seven workpad §2.3
  open research questions.
- The chapter MUST cite the parent Decision §7
  publication binding.
- The chapter MUST include a Phase 7 meta-failure
  note in §6.5 three-element structure as the
  chapter's penultimate section.
- The chapter MUST close with the literal forward-
  pointer text per Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1: "**In the next chapter**: This is the last
  chapter. The seven open research questions follow."
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT pad for word budget.
- The chapter MUST NOT claim to resolve any of the
  seven open research questions.

## 9. Domain Model / Contract

Recommended section structure (target ~1 500 words):

1. **Phase 7 question + reader contract revisited**
   (~150 w). Cite leaddev-agent-compiled §3 for risk
   framing.
2. **Per-chapter failure synthesis** (~400 w). Pull
   from chapters 01-07 failure notes. Each chapter
   cited by file path.
3. **Cross-phase failure modes (BES catalogue)**
   (~400 w). Per workpad §7: fastpath zero-adoption;
   decomposition-phase paper-only across 23 SPECs;
   workpad bootstrap gap; four owner-blocking
   ceremony refactor questions. Internal SPEC IDs
   cited per Contract §6.6. **Each of the four modes
   MUST own a DISTINCT level-3 markdown subsection
   under §3. The subsection's `### …` heading line
   MUST mention the mode anchor word; the subsection
   body (until the next `### `, `## `, or end-of-
   file) MUST contain the full Contract §6.5 three-
   element structure with literal bold markers
   `**What happened.**` (workpad-grounded fact),
   `**What we did.**` (workpad-grounded action), and
   `**What pattern generalizes.**`
   (`judgment://agent-synthesis`).** Suggested
   subsection titles: `### Fastpath zero-adoption`,
   `### Decomposition paper-only across 23 SPECs`,
   `### Workpad bootstrap gap`,
   `### Ceremony refactor questions`. A single
   combined catalogue subsection, or `### …`
   subsections that omit the anchor from the heading
   line, or subsection reuse across modes, are all
   mechanically rejected by the T-9 helper F2 row.
4. **The seven open research questions** (~400 w).
   Per workpad §2.3 each enumerated: exhaustiveness;
   ambiguity-without-developer; versioning/patching;
   install-matches-intent; equivalence classes;
   capability floor; adversarial spec consumption.
5. **Phase 7 meta-failure note** (~100 w; penultimate).
   Strict fact-vs-synthesis:
   - **What happened** (workpad-grounded): failure-
     modes-as-content is the novel addition per
     workpad §6 Phase 7.
   - **What we did** (workpad-grounded): published
     four+ BES failure modes + seven open research
     questions in this chapter.
   - **What pattern generalizes**
     (`judgment://agent-synthesis`): failure-modes-as-
     content has its own failure mode — what didn't
     get caught in the synthesis itself.
6. **Closing** (~50 w). "**In the next chapter**:
   This is the last chapter. The seven open research
   questions follow." Per Contract §8.1 exact
   wording.

## 10. Interfaces and Files

Owned files (written by this Task):
- `longread/08-phase-7-failure-modes-as-first-class-content.md`.
- `specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`.
- `scripts/check-chapter-08-phase-7-anchors.sh` (new
  helper).
- `scripts/check-chapter-08-closing.sh` (new helper;
  verifies "This is the last chapter" closer per §8.1).

Read-only context: §6 authority list + chapters 00-07
+ workpad + parent Decision + Contract.

Out of scope: any edit to chapters 00-07 / Contract /
corpus.

External effects: `cmd://git push` under
`branch_policy: main-direct`.

## 11. Execution Plan

1. Read workpad §6 Phase 7 + §7 four+ failure modes +
   §2.3 seven open research questions.
2. Read parent Decision §7 publish-bindings.
3. Read corpus entry leaddev-agent-compiled §3.
4. Read each chapter 01-07 failure note.
5. Author the two helper scripts BEFORE chapter
   prose. Verify helper docstring count matches
   implemented row count (T-08 lesson).
6. Draft chapter prose per §9.
7. Self-review.
8. Run acceptance commands.
9. Stage explicit files; conventional commits; push.
10. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT modify chapters 00-07 / Contract
  / corpus.
- The Task MAY cite internal BES SPEC IDs per
  Contract §6.6 where they support failure-mode
  disclosure.
- The Task MUST NOT make Product-A or Product-B
  case-study claims beyond §6 authority-source list.
- The Task MUST NOT resolve any open research
  question — enumerates as flagged-open only.
- The Task MUST NOT pad-for-budget; MUST NOT use
  `git add .` / `git add -A`; MUST NOT include
  AI-attribution trailers in commits.

## 13. Test Plan

- T-1: `cmd://test -f
  longread/08-phase-7-failure-modes-as-first-class-content.md`
  exits 0.
- T-2: `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 08 ≥ 50 prose words.
- T-3: Chapter 08 word count at or below 2 000.
  Evidence: `cmd://bash scripts/validate-longread-structure.sh --chapter 08`.
- T-4: `cmd://bash scripts/lint-spec.sh specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing corpus-citation
  discipline at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4.
- T-6: Manual reviewer check against
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3 voice contract.
- T-7: Commit-hygiene per
  `file://../bes-fleet-policy/.claude/hooks/block-ai-attribution.sh`
  and Conventional Commits per
  `file://../bes-fleet-policy/AGENTS.md`. Evidence:
  `cmd://git log -1 --format='%B'` contains no
  AI-attribution trailers.
- T-8: Manual inspection of §17 of this SPEC at
  `file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
  shows §17.1-§17.5 non-empty after verify.
- T-9: Paragraph-co-occurrence anchors. Evidence:
  `cmd://bash scripts/check-chapter-08-phase-7-anchors.sh`
  exits 0 iff all required anchors paragraph-co-
  occur. Helper covers 7 rows: leaddev risk framing;
  workpad authority; parent Decision binding; per-
  chapter synthesis (each of 01-07); four BES
  failure-mode anchors; §6.5 owned-subsection
  coupling per mode (each cross-phase mode claims a
  distinct `### …` heading whose heading-line
  mentions the anchor and whose body contains all
  three §6.5 bold markers); seven open research
  questions.
- T-10: Closing line per Contract §8.1. Evidence:
  `cmd://bash scripts/check-chapter-08-closing.sh`
  exits 0 iff the chapter ends with the literal
  "**In the next chapter**: This is the last
  chapter. The seven open research questions follow."
- T-11: leaddev-agent-compiled anchor present.
  Evidence: `cmd://grep -qF
  'research/primary-sources/leaddev-agent-compiled.md'
  longread/08-phase-7-failure-modes-as-first-class-content.md`
  exits 0.
- T-12: All 7 chapters 01-07 referenced by file path.
  Evidence: `cmd://bash scripts/check-chapter-08-phase-7-anchors.sh`
  helper covers this row.
- T-13: All seven open research questions present per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §2.3 (helper checks 7 distinct anchor terms).
- T-14: All four BES failure modes present per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 AND each mode owns a DISTINCT `### …`
  subsection whose heading-line mentions the anchor
  AND whose subsection body contains all three §6.5
  bold markers (`**What happened.**`,
  `**What we did.**`, `**What pattern
  generalizes.**`). The T-9 helper F2 row enforces
  this mechanically: it iterates the 4 anchors in
  order, locking a distinct unclaimed `### …`
  heading for each (anchor-in-heading-line +
  triplet-in-body). Marker counts alone are not
  sufficient (codex T-09 R2 F1 lesson); a single
  combined subsection is not sufficient (codex T-09
  R3 F1 lesson).

## 14. Acceptance Criteria

- [x] AC-1: chapter file present.
- [x] AC-2: in-progress validator PASSes.
- [x] AC-3: chapter-strict validator PASSes (≤ 2 000
      max; 1 500 target advisory).
- [x] AC-4: SPEC lint exits 0.
- [x] AC-5: T-5 corpus discipline (manual) — codex R2
      CONVERGENCE-PASS confirms after R1 F1 fix.
- [x] AC-6: T-6 voice (manual) — codex R2
      CONVERGENCE-PASS.
- [x] AC-7: T-7 commit-hygiene — Conventional Commits;
      no AI-attribution trailers.
- [x] AC-8: T-8 Completion Report fills (this §17).
- [x] AC-9: T-9 paragraph-co-occurrence anchors
      (helper PASS — 7 rows).
- [x] AC-10: T-10 closing line per §8.1 (helper PASS).
- [x] AC-11: T-11 leaddev anchor present.
- [x] AC-12: T-12 all 7 chapters 01-07 referenced
      (covered by T-9).
- [x] AC-13: T-13 all 7 open research questions
      present (covered by T-9).
- [x] AC-14: T-14 all 4 BES failure modes present
      AND each owns a DISTINCT `### …` subsection
      with the anchor in the heading line + the §6.5
      three-element structure in the body
      (mechanically enforced by T-9 F2 row).

## 15. Rollback Plan

If chapter prose wrong-shape: revert, revise SPEC,
re-author. If single-sentence adjustment post-verify:
amend via `fix(chapter-08):` commit + Amendment Log
§17.0 entry.

## 16. Open Questions

- [ ] Q1: Closing line wording. Default per §8.1:
      "This is the last chapter. The seven open
      research questions follow." Not owner-blocking.
- [ ] Q2: Failure-mode disclosure depth. Default:
      cite internal SPEC IDs per Contract §6.6;
      preserve the failure-mode pattern, not specific
      transcripts. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.1 Files changed

- `longread/08-phase-7-failure-modes-as-first-class-content.md`
  (new; 1441 prose words; methodology Contract §6.5
  three-element structure on the four BES cross-phase
  modes via distinct `### …` subsections + per-chapter
  failure-note synthesis + seven open research
  questions + Phase 7 meta-failure note + Contract
  §8.1 closing).
- `specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
  (new + iterated; final status: verified).
- `specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/IDEA.md`
  (new).
- `scripts/check-chapter-08-phase-7-anchors.sh` (new;
  7 rows incl. F2 per-mode owned-subsection coupling).
- `scripts/check-chapter-08-closing.sh` (new; byte-
  exact final-paragraph match against Contract §8.1).
- `reviews/codex-2026-05-24-T09/REVIEW.md`,
  `reviews/codex-2026-05-24-T09-r2/REVIEW.md`,
  `reviews/codex-2026-05-24-T09-r3/REVIEW.md`,
  `reviews/codex-2026-05-24-T09-r4/REVIEW.md` (SPEC
  cross-family review trail; R4 CONVERGENCE-PASS).
- `reviews/codex-2026-05-24-chapter-08/REVIEW.md`,
  `reviews/codex-2026-05-24-chapter-08-r2/REVIEW.md`
  (prose cross-family review trail; R2
  CONVERGENCE-PASS).

### 17.2 Commands run

- `bash scripts/lint-spec.sh
  specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
  — 0 errors / 0 warnings.
- `bash scripts/lint-spec.sh
  specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/IDEA.md`
  — 0 errors / 0 warnings.
- `bash scripts/check-chapter-08-phase-7-anchors.sh`
  — PASS (7 rows: leaddev + workpad + parent Decision
  + 7 chapter refs + 4 failure modes + §6.5 per-mode
  owned-subsection + 7 research questions).
- `bash scripts/check-chapter-08-closing.sh` — PASS
  (final non-blank paragraph byte-exact match against
  Contract §8.1).
- `bash scripts/validate-longread-structure.sh` —
  PASS (9/9 chapters; total 7154 prose words).
- `bash scripts/validate-longread-structure.sh
  --chapter 08` — PASS at 1441 prose words (≤ 2000
  max; below 1500 target advisory).
- `bash -n scripts/check-chapter-08-phase-7-anchors.sh`
  + `bash -n scripts/check-chapter-08-closing.sh` —
  PASS.
- Codex cross-family SPEC review: R1 (2 MAJOR) → R2
  (1 MAJOR) → R3 (1 MAJOR) → R4 CONVERGENCE-PASS.
- Codex cross-family prose review: R1 (1 MAJOR) →
  R2 CONVERGENCE-PASS.

### 17.3 Verification result

All 14 acceptance criteria PASS. Helper output stored
at workpad-grounded paths. Codex cross-family review
converged at CONVERGENCE-PASS on both the Task SPEC
(R4) and the chapter prose (R2). Chapter 08 is the
ninth and final chapter of the methodology longread;
the full longread now passes the in-progress
validator at 9/9 chapters / 7154 prose words and the
chapter-08 strict validator at 1441 prose words.

### 17.4 Residual risk

- The strict cross-family validation pass (real
  external user-with-agent install) remains owed per
  parent Decision §7 publication-gate binding; this
  is a longread-arc-wide gap, not a chapter-08
  defect. Disclosure preserved across chapters 00,
  06, 07, and 08.
- The conformance facet remains `reserved` per
  chapter 01's disclosure; same disclosure status as
  prior chapters.
- The F2 helper's owned-subsection contract assumes
  level-3 markdown headings. Chapter 08 conforms;
  future chapter authors must do likewise if the
  contract gets reused elsewhere.

### 17.5 Spec evidence candidates

- **Iterative helper-tightening converges to
  structural binding, not loose-text grep.** T-09 R1
  helper grep'd anchors; R2 added marker-count
  counts; R3 collapsed to one-block-satisfies-all;
  R4 finally required anchor-in-heading-line +
  body-triplet-co-occurrence + distinct-heading-per-
  anchor. Each round closed exactly one false-
  positive class. Durable lesson: when a SPEC
  promises "mechanical per-X enforcement," the
  helper MUST bind to a structural primitive (a
  heading, a subsection, a block) that cannot be
  satisfied by re-arrangement; loose-grep + counts
  always leaves a re-arrangement loophole.
- **Codex F2 lessons cascade across the longread
  arc.** Chapter 08 prose R1 caught corpus anchors
  missing in the open-questions section — the same
  corpus-discipline class codex caught earlier in the
  chapter 05 + chapter 06 prose passes. Durable
  lesson: any chapter that introduces methodology
  primitives MUST anchor them to corpus entries at
  authoring time, not at review time.
- **"Eat your own dogfood" pattern.** Chapter 08
  publishes BES's four cross-phase failure modes in
  the §6.5 three-element structure mandated by the
  methodology Contract that the longread itself
  defines. The Phase 7 meta-failure note in §5
  publishes the failure mode of failure-modes-as-
  content itself. Durable lesson: self-applied
  methodology is the most credible evidence the
  methodology generalizes; the meta-failure-note
  position is what keeps it from being a closed
  loop.
