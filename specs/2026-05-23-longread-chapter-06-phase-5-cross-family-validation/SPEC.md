---
id: 2026-05-23-longread-chapter-06-phase-5-cross-family-validation
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md
  - test -f longread/06-phase-5-cross-family-validation.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 06
  - bash scripts/check-chapter-06-phase-5-anchors.sh
  - bash scripts/check-chapter-06-failure-note.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/06-phase-5-cross-family-validation.md
word_budget_target: 1000
word_budget_max: 1300
---

# SPEC: Longread chapter 06 — Phase 5 Cross-Family Validation

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 06 as the
Phase 5 chapter: "Validating by a different-family
agent walkthrough." Chapters 00-05 are at status:
closed. Per
`file://specs/2026-05-20-longread-structure/SPEC.md`
§7.1, chapter 06 follows chapter 05. This Task SPEC
authors that chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 06 is the methodology's outstanding-obligation
chapter. By its end, the reader knows what Phase 5
asks (different-family agent walkthrough), why same-
family proxy is structurally weaker, where BES landed
(same-family proxy done; strict cross-family deferred),
and that this gate IS the chapter 00 prior disclosure
operationalised. The chapter is the load-bearing place
to own the methodology's outstanding gate honestly.

## 3. Goals

- Author `longread/06-phase-5-cross-family-validation.md`
  at target 1 000 words (advisory under soft-floors);
  max 1 300 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Include the cross-family validation question framing
  (why same-family is structurally weaker; what
  cross-family tests).
- Cover the walkthrough pattern per research workpad
  §6 Phase 5 (different-family agent attempts to
  deploy using ONLY published spec; surface gaps;
  document gap report).
- Cover where BES landed per workpad §7 (same-family
  proxy done; strict cross-family deferred).
- Cite chapter 00 explicitly for the prior disclosure
  that Phase 5 is the methodology's outstanding
  obligation.
- Cite corpus entries for methodology primitives:
  - `file://research/primary-sources/symphony-spec.md`
    §3 (Symphony's conformance profiles + DoD shape).
    The "re-implement in 5 languages" phrase is the
    research workpad's framing for Phase 5 (not in
    symphony-spec §3 directly).
  - `file://research/primary-sources/leaddev-agent-compiled.md`
    §3 (variance risk that cross-family validation
    mitigates).
  - `file://research/primary-sources/cucumber-gherkin.md`
    §3 (executable acceptance shape).
- Include a Phase 5 failure-mode note in the §6.5
  three-element structure as the chapter's penultimate
  section, with strict fact-vs-synthesis separation.
- End with "**In the next chapter**:" forward pointer
  to chapter 07 (Phase 6 ship + cross-link + sign).
- Author WITHOUT padding-for-budget AND WITHOUT over-
  attribution beyond the §6 authority-source list.

## 4. Non-Goals

- Authoring chapter 07-08 content.
- Performing the strict cross-family pass (that's
  external, owner-triggered per workpad §7).
- Resolving the open research questions enumerated in
  chapter 00.

## 5. Current System Facts

- Chapters 00-05 are at status: closed
  (`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  through
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`).
- Validator at
  `file://scripts/validate-longread-structure.sh`
  chapter-strict mode enforces 1 300 max for chapter
  06; 1 000 target is advisory.
- Phase 5-relevant corpus entries primary-read-
  complete per `file://research/primary-sources/INDEX.md`.
- Research workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 5 + §7 BES disposition.
- Parent Decision §7 at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  publication-gate obligation.
- Chapter 00 prior disclosure at
  `file://longread/00-introduction.md`.
- T-06 R6 explicit-authority-source-list block pattern
  proven at
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  §17.5.

## 6. Authority Map

Chapter 06 MAY cite the following authorities for
methodology-primitive and case-study claims. Any
claim beyond this set is over-attribution. <!-- lint-ok: no-citation -->


- **Primary-source corpus** at
  `file://research/primary-sources/`: methodology
  primitives (cross-family validation concept,
  walkthrough pattern, executable acceptance shape,
  variance-risk anchor).
- **Workpad §6 + §7** at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`:
  Phase 5 definition + BES Phase 5 disposition.
- **Parent Decision §7** at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`:
  publication-gate obligation; Product B shape +
  attribution.
- **Chapter 00 at
  `file://longread/00-introduction.md`**: prior
  disclosure that Phase 5 cross-family validation gate
  remains the methodology's outstanding obligation.
  Chapter 00 does NOT establish the cross-family vs
  same-family routing principle itself — that comes
  from MODEL_ROUTING.md.
- **MODEL_ROUTING.md** at
  `file://../bes-fleet-policy/agents/MODEL_ROUTING.md`:
  the cross-family routing pattern that explains why
  same-family is structurally weaker.

## 7. Code/Docs Reality Check

- Soft-floors regime in effect per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Paragraph-co-occurrence anchor pattern + explicit-
  bold-marker failure-note pattern proven across
  chapters 03 + 04 + 05 (latest at
  `file://reviews/codex-2026-05-23-chapter-05-r2/REVIEW.md`).
- The Phase 5 failure note is uniquely load-bearing per
  `file://longread/00-introduction.md`: Phase 5 is the
  methodology's outstanding gate and this chapter
  operationalises chapter 00's prior disclosure.

## 8. Desired Behavior

After this Task executes:

- A file `longread/06-phase-5-cross-family-validation.md`
  MUST exist with prose content at or below 1 300
  words.
- The chapter MUST include the cross-family
  validation question framing.
- The chapter MUST cover the walkthrough pattern per
  workpad §6 Phase 5.
- The chapter MUST cite at least one of
  `file://research/primary-sources/symphony-spec.md`
  §3 or
  `file://research/primary-sources/cucumber-gherkin.md`
  §3 for the validation-shape corpus anchor.
- The chapter MUST cite
  `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 for the variance-risk anchor.
- The chapter MUST cover where BES landed per workpad
  §7 (same-family proxy done; strict cross-family
  deferred).
- The chapter MUST cite chapter 00 at
  `file://longread/00-introduction.md` for the prior
  disclosure that Phase 5 remains outstanding.
- The chapter MUST include a Phase 5 failure-mode
  note in §6.5 three-element structure as the
  penultimate section, with strict fact-vs-synthesis
  separation.
- The chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 07.
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT pad for word budget.
- The chapter MUST NOT make Product-A or Product-B
  case-study claims beyond the §6 authority-source
  list.

## 9. Domain Model / Contract

Recommended section structure (target ~1 000 words):

1. **The cross-family validation question** (~150 w).
   Why same-family is structurally weaker; what
   cross-family tests that nothing else does. Cite
   leaddev-agent-compiled §3 for the variance risk.
2. **The walkthrough pattern** (~250 w). Per workpad
   §6: different-family agent attempts to deploy
   using ONLY published spec; surface gaps; document
   gap report. Cite symphony-spec §3 for the
   "re-implement" analogue + cucumber-gherkin §3 for
   executable acceptance.
3. **Where BES landed** (~250 w). Workpad §7 records
   same-family proxy performed; strict cross-family
   deferred to owner-triggered external run. Chapter
   00 already disclosed this as the methodology's
   outstanding obligation. Cite parent Decision §7
   for the publication-gate binding.
4. **Phase 5 failure-mode note** (~300 w; penultimate
   per §6.5). Strict fact-vs-synthesis:
   - **What happened** (workpad-grounded): workpad §7
     records BES Phase 5 as "same-family proxy
     performed in this session (per SE2); strict
     cross-family deferred to owner-triggered
     external run."
   - **What we did** (workpad-grounded): performed
     the same-family proxy; the strict cross-family
     pass remains owed per parent Decision §7
     publication-gate.
   - **What pattern generalizes**
     (`judgment://agent-synthesis`; NOT workpad-
     proven): same-family proxy is a stopgap, not the
     bar; the published methodology ships with this
     gate explicitly outstanding, and the paired
     spec-bundle + longread shape is part of why —
     the longread discloses the gap so installers
     know what is and is not yet validated.
5. **Forward pointer** (~50 w). To chapter 07 / Phase
   6 / ship + cross-link + sign.

## 10. Interfaces and Files

Owned files (written by this Task):
- `longread/06-phase-5-cross-family-validation.md`.
- `specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`.
- `scripts/check-chapter-06-phase-5-anchors.sh` (new
  helper; paragraph-co-occurrence including the
  chapter-00 prior-disclosure cross-reference).
- `scripts/check-chapter-06-failure-note.sh` (new
  helper; explicit bold markers + agent-synthesis tag).

Read-only context: §6 authority-source list +
chapters 00-05 closures + longread Contract + schema.

Out of scope: any edit to chapters 00-05 or longread
Contract or corpus.

External effects: `cmd://git push` under
`branch_policy: main-direct`.

## 11. Execution Plan

1. Read research workpad §6 Phase 5 + §7 BES
   disposition.
2. Read parent Decision §7 publication-gate
   obligation.
3. Read corpus entries symphony-spec §3,
   leaddev-agent-compiled §3, cucumber-gherkin §3.
4. Read chapter 00 prior disclosure passages.
5. Author the two helper scripts BEFORE chapter
   prose.
6. Draft chapter prose per §9 structure WITHOUT
   padding AND WITHOUT over-attribution beyond the
   §6 authority-source list.
7. Self-review.
8. Run acceptance commands.
9. Stage explicit files; conventional commits; push.
10. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other
  longread chapter.
- The Task MUST NOT modify the longread Contract or
  corpus.
- The Task MAY cite internal BES SPEC IDs + transcript
  IDs per Contract §6.6 where they support Phase 5
  failure-mode disclosure; MUST NOT name unrelated BES
  product repos.
- The Task MUST NOT make Product-A or Product-B
  case-study claims beyond the §6 authority-source
  list (primary-source corpus; workpad §6/§7; parent
  Decision §7; chapter 00; MODEL_ROUTING.md).
- The Task MUST NOT include AI-attribution trailers
  in commits; MUST NOT use `git add .` / `git add -A`.

## 13. Test Plan

- T-1: `cmd://test -f
  longread/06-phase-5-cross-family-validation.md`
  exits 0.
- T-2: `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 06 ≥ 50 prose words.
- T-3: Chapter 06 word count at or below 1 300; 1 000
  target advisory. Evidence:
  `cmd://bash scripts/validate-longread-structure.sh --chapter 06`.
- T-4: `cmd://bash scripts/lint-spec.sh specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing the corpus-
  citation rule at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4 discipline.
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
  `file://specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`
  shows §17.1-§17.5 non-empty after verify.
- T-9: Paragraph-co-occurrence anchor coverage.
  Evidence: `cmd://bash
  scripts/check-chapter-06-phase-5-anchors.sh` exits
  0 iff cross-family-validation + walkthrough +
  same-family-proxy + chapter-00-prior-disclosure all
  paragraph-co-occur with their corpus/authority
  anchors.
- T-10: Corpus citation density ≥ 3 distinct
  entries. Evidence: `cmd://grep -oE
  'research/primary-sources/[a-z0-9-]+\.md'
  longread/06-phase-5-cross-family-validation.md |
  sort -u | wc -l` returns ≥ 3.
- T-11: leaddev-agent-compiled anchor present (variance
  risk). Evidence: `cmd://grep -qF
  'research/primary-sources/leaddev-agent-compiled.md'
  longread/06-phase-5-cross-family-validation.md`
  exits 0.
- T-12: symphony-spec OR cucumber-gherkin anchor
  present (validation shape). Evidence: `cmd://grep
  -qF 'research/primary-sources/symphony-spec.md'
  longread/06-phase-5-cross-family-validation.md ||
  grep -qF
  'research/primary-sources/cucumber-gherkin.md'
  longread/06-phase-5-cross-family-validation.md`
  exits 0.
- T-13: Per-chapter Phase 5 failure-mode note in §6.5
  three-element structure at penultimate position.
  Evidence: `cmd://bash
  scripts/check-chapter-06-failure-note.sh` exits 0.
- T-14: Forward pointer to chapter 07. Evidence:
  `cmd://tail -5
  longread/06-phase-5-cross-family-validation.md |
  grep -E '\*\*In the next chapter\*\*:'` matches.

## 14. Acceptance Criteria

- [ ] AC-1: chapter file present.
- [ ] AC-2: in-progress validator PASSes.
- [ ] AC-3: chapter-strict validator PASSes (≤ 1 300
      max; 1 000 target advisory).
- [ ] AC-4: SPEC lint exits 0.
- [ ] AC-5: T-5 corpus-citation discipline (manual).
- [ ] AC-6: T-6 voice contract (manual).
- [ ] AC-7: T-7 commit-hygiene.
- [ ] AC-8: T-8 Completion Report fills.
- [ ] AC-9: T-9 paragraph-co-occurrence coverage
      (helper PASS).
- [ ] AC-10: T-10 ≥ 3 distinct corpus citations.
- [ ] AC-11: T-11 leaddev-agent-compiled anchor
      present.
- [ ] AC-12: T-12 symphony-spec OR cucumber-gherkin
      anchor present.
- [ ] AC-13: T-13 three-element failure note at
      penultimate position (helper PASS).
- [ ] AC-14: T-14 forward pointer to chapter 07.

## 15. Rollback Plan

If chapter prose wrong-shape: revert, revise SPEC,
re-author. If single-sentence adjustment post-verify:
amend via `fix(chapter-06):` commit + Amendment Log
§17.0 entry.

## 16. Open Questions

- [ ] Q1: How explicitly should "this is the load-
      bearing methodology gap" framing be named?
      Default per chapter 00 prior disclosure: name
      it directly in §3 (Where BES landed) and §4
      (failure note). Not owner-blocking.
- [ ] Q2: Reference to MODEL_ROUTING.md. Default:
      cite once in §2 "why same-family is weaker"
      framing. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.0 Amendment Log

- **Amendment 1** (this commit, 2026-05-23): Chapter
  prose remediated through 2 codex prose rounds. R1
  flagged 2 MAJOR: "different Claude lane" example
  collapsed same-family into cross-family;
  paired-artefact rationale was in E2 instead of E3.
  R2 flagged 1 MAJOR: E2 overclaimed "shipped paired"
  (Product B SPEC bundle not yet shipped per
  STATE.md). R3 CONVERGENCE-PASS. Chapter post-fix:
  669 prose words.

### 17.1 Files changed

- `longread/06-phase-5-cross-family-validation.md` (new;
  669 prose words). Below advisory target 1 000; below
  enforced max 1 300.
- `specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`
  (status: draft → in-execution → verified; §17 fills).
- `scripts/check-chapter-06-phase-5-anchors.sh` (new;
  paragraph-co-occurrence with corpus/authority file
  paths).
- `scripts/check-chapter-06-failure-note.sh` (new;
  explicit bold markers + agent-synthesis tag).

### 17.2 Commands run

- `lint-spec.sh ...SPEC.md` → 0/0.
- `test -f longread/06-phase-5-cross-family-validation.md`
  → exit 0.
- `validate-longread-structure.sh` → PASS in-progress;
  7/9 chapters; total ~5 011 words.
- `validate-longread-structure.sh --chapter 06` →
  PASS; 669 prose words; below advisory target 1 000.
- `check-chapter-06-phase-5-anchors.sh` → PASS.
- `check-chapter-06-failure-note.sh` → PASS.
- T-10: 3 distinct corpus citations (leaddev-agent-
  compiled, symphony-spec, cucumber-gherkin).
- T-11: leaddev-agent-compiled cited (with
  "cross-family" co-occurrence).
- T-12: both symphony-spec AND cucumber-gherkin cited
  (with "walkthrough" co-occurrence).
- T-14: forward pointer present, references chapter 07
  / Phase 6 / ship + cross-link + sign.

### 17.3 Verification result

All 14 acceptance criteria PASS.

Manual reviewer checks (current, post-Amendment 1):

- T-5 corpus discipline: methodology primitives cite
  corpus only. Workpad + parent Decision + chapter 00
  + MODEL_ROUTING.md cites limited to authority-
  source-list block §6 specified domains.
- T-6 voice: first-person experiential ("we performed";
  "we") dominant; no methodology-vendor voice.
- Failure-note: E1 + E2 strictly workpad + parent-
  Decision grounded; E3 explicitly synthesis-tagged.
- Critical clarification post-R1: "different Claude
  lane" is now framed as proxy, not gate.
- Critical clarification post-R2: E2 stays workpad-
  grounded; no overclaim that Product B has shipped.

### 17.4 Residual risk

- Chapter 06 at 669 prose words is fifth consecutive
  sub-target chapter under soft-floors.
- Phase 5 is the methodology's outstanding gate per
  parent Decision §7. The longread now honestly owns
  the gap; the obligation transfers to the external
  cross-family pass (owner-triggered).
- E3 mentions "ships paired" as the methodological
  pattern, not a current-state claim. Codex R3
  reviewed this as below-MAJOR; if a future reader
  finds the framing confusing, in-place wording
  amendment via §17.0 Amendment Log.

### 17.5 Spec evidence candidates

- **Phase 5 chapter is the load-bearing honesty
  chapter.** Chapter 00 disclosed the outstanding
  gate; chapter 06 operationalises it. This chapter
  is the methodology's most explicit own-the-gap
  statement and the place where parent Decision §7's
  publication-gate is named in prose.
- **Authority-source-list block worked.** Five
  authorities + corpus prefix all listed upfront in §6;
  T-07 R1 still caught §3/§6 reference drift in 4
  places. Lesson: even with the block in place,
  reference renumbering creates new stale-text class.
  Forward: T-08 should NOT renumber section §6 if
  authority-source-list block lives there.
- **Workpad-grounded E1 + E2 vs synthesis-tagged E3
  pattern continues to compound.** Chapter 06 R1 + R2
  both caught E2 drifts into synthesis (paired-artefact
  rationale; "shipped paired"). The recurring class
  across chapters 02-06 prose-codex: E2 wants to
  generalize; resist.
- **Codex R3 "ships paired" residual was MINOR not
  MAJOR**. The E3 synthesis claim "ships paired with
  its own disclosure" is methodological pattern not
  current-state Product B shipment. Codex R3
  explicitly distinguished. The line between
  current-state factual claim and methodology-pattern
  synthesis is sometimes subtle; explicit
  judgment://agent-synthesis tag scopes the latter.
