---
id: 2026-05-21-longread-chapter-01-phase-0-maturity-check
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md
  - test -f longread/01-phase-0-maturity-check.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 01
  - bash scripts/check-chapter-01-phase-0-signals.sh
  - bash scripts/check-chapter-01-failure-note.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/01-phase-0-maturity-check.md
word_budget_target: 800
word_budget_max: 1100
---

# SPEC: Longread chapter 01 — Phase 0 Maturity Check

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals. RFC 2119 keywords in this
Task SPEC appear in Desired Behavior, Acceptance Criteria,
Test Plan, and Safety / Scope Invariants sections.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 01 as the
Phase 0 chapter: "When a product is ready to be published
as a deployment-grade SPEC." Chapter 00 (at
`file://longread/00-introduction.md`) introduced the
methodology and set the reader contract. Per
`file://specs/2026-05-20-longread-structure/SPEC.md` §7.1
authoring sequence, chapter 01 is authored after chapter
00. This Task SPEC authors that chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 01 is the reader's first phase chapter. By its
end, the reader knows what maturity signals to look for
before declaring a product ready to be published as a
deployment-grade SPEC, what anti-signals say it isn't
ready, and how BES failed its own maturity check the
first time. The chapter is the methodology's first
operational test: do the corpus citations + first-person
voice + failure-mode disclosure work together in a phase
chapter the way chapter 00 promised they would?

## 3. Goals

- Author `longread/01-phase-0-maturity-check.md` at
  target 800 words (max 1100 per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2).
- Open with the BES Phase 0 failure (first-person
  experiential per §6.3 of the longread Contract).
- Cover the four positive maturity signals per the
  research workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6.
- Cover the three anti-signals per the same source.
- Cite corpus entries for every methodology primitive per
  the Contract's §6.4 corpus-citation rule.
- Include a Phase 0 failure-mode note per §6.5.
- End with a "**In the next chapter**:" forward pointer
  to chapter 02 (Phase 1 facet inventory) per §8.1.
- Pass `scripts/validate-longread-structure.sh --chapter 01`
  (chapter word count in [800, 1100]).

## 4. Non-Goals

- Authoring chapter 02-08 content (subsequent Task
  SPECs).
- Defining maturity criteria for products other than
  agent-installable operating-frameworks (chapter 01
  scopes to the agentic-installation case).
- Resolving any of the seven open research questions
  (research workpad §2.3 enumerates them; chapter 01
  surfaces only Phase 0-adjacent ones if any).
- Repeating chapter 00 content (no re-stating the
  reader contract; chapter 01 inherits it).

## 5. Current System Facts

- Chapter 00 is at status: closed
  (`file://longread/00-introduction.md` and
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  status: closed).
- The longread Contract validator at
  `file://scripts/validate-longread-structure.sh`
  in chapter-strict mode enforces [800, 1100] for
  chapter 01 (verified via the §6.2 table).
- The primary-source corpus is at v1.1 (22 sources, 3
  partial-with-notes) per
  `file://specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  §6.1; verified via
  `cmd://bash scripts/check-corpus-completeness.sh` PASS.
- The research workpad Phase 0 definition at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 names four positive signals + three anti-signals.
- BES case-study Phase 0 data at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 documents the validation run + the failure modes.

## 6. Authority Map

Active authority for this Task:

- Longread Contract SPEC at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution). §6.1 names chapter 01's subject;
  §6.2 word budget; §6.3 voice; §6.4 corpus-citation;
  §6.5 per-chapter failure-mode rule; §7.1 authoring
  sequence; §8.1 forward-pointer convention.
- Parent Decision SPEC at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — Product B shape binding.
- Research workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 0 definition) + §7 (BES case-study data).
- Verified primary-source corpus at
  `file://research/primary-sources/` — citable
  evidence base.
- T-01 closure at
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  (status: closed) — establishes the pattern T-02
  inherits.
- `file://schema/SPEC.schema.md` — citation grammar.

Stale, superseded, or evidence-only:

- None for this slice.

Owner decisions required before implementation:

- [ ] Approve this Task SPEC (flip
      approved-pending-owner → approved).

## 7. Code/Docs Reality Check

- The validator at
  `file://scripts/validate-longread-structure.sh`
  `--chapter 01` mode resolves to the chapter file
  `longread/01-phase-0-maturity-check.md`.
- T-01 (chapter 00) executed cleanly through 5 SPEC-
  level codex rounds at
  `file://reviews/codex-2026-05-20-T01/REVIEW.md`,
  `file://reviews/codex-2026-05-20-T01-r2/REVIEW.md`,
  `file://reviews/codex-2026-05-20-T01-r3/REVIEW.md`,
  `file://reviews/codex-2026-05-20-T01-r4/REVIEW.md`,
  `file://reviews/codex-2026-05-20-T01-r5/REVIEW.md`
  plus 2 prose-level rounds at
  `file://reviews/codex-2026-05-20-chapter-00/REVIEW.md`
  and
  `file://reviews/codex-2026-05-20-chapter-00-r2/REVIEW.md`.
  The lessons (path-base normalization, ideated_in,
  requires_network, mechanically-runnable T-evidence,
  AC ↔ T pairing, corpus-citation discipline strictness,
  prose-truth honesty about not-yet-proven gates) are
  applied to T-02 upfront.

## 8. Desired Behavior

After this Task executes:

- A file `longread/01-phase-0-maturity-check.md` MUST
  exist with prose content in [800, 1100] words per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- The chapter MUST open with the BES Phase 0 failure
  (publishing Product A v1 before the conformance bar
  was structured) as a first-person experiential
  account.
- The chapter MUST cover all four positive maturity
  signals from
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6: (1) deployed enough times that the customization
  surface is understood; (2) failure modes characterized;
  (3) developer names 3-5 load-bearing intent decisions
  vs implementation accidents; (4) empirical conformance
  bar.
- The chapter MUST cover all three anti-signals from the
  same source: (a) every install is bespoke; (b)
  developer can't articulate what's wrong in a
  non-compliant install; (c) customization surface is
  "edit the source".
- The chapter MUST cite the load-bearing-vs-accidents
  distinction to
  `file://research/primary-sources/adr-nygard.md` §3
  (Nygard's architecturally-significant-decision
  criterion).
- The chapter MUST cite the conformance-bar concept to
  `file://research/primary-sources/openspec.md` §3
  and/or
  `file://research/primary-sources/spec-kit.md` §3.
- The chapter MUST include a Phase 0 failure-mode note
  per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5 using its three-element structure:
  1. **What happened** (verbatim or near-verbatim from
     the research workpad / SPEC evidence).
  2. **What we did about it** (sanitized; specific BES
     transcript identifiers removed; the pattern
     preserved).
  3. **What pattern generalizes from the failure**
     (`judgment://agent-synthesis` is acceptable here).
  The failure note MUST appear as the chapter's
  penultimate section, immediately before the forward
  pointer.
- The chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 02 (Phase 1 facet
  inventory).
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT repeat chapter 00 reader-
  contract content (inherits it).

## 9. Domain Model / Contract

Chapter structural shape per longread Contract §8.1.
Recommended section structure (~800 word budget):

1. **The BES Phase 0 failure** (~150 w). First-person:
   we published Product A v1 before we had a
   conformance bar; here is what went wrong.
2. **The maturity question** (~120 w). What we should
   have asked first. Cite the LeadDev archaeology
   failure mode (`leaddev-agent-compiled.md §3`) as the
   risk we walked into.
3. **The four positive signals** (~250 w). Labelled
   list within prose. Each signal cites at least one
   corpus entry. Signal 3 (load-bearing decisions) cites
   `adr-nygard.md §3`. Signal 4 (conformance bar) cites
   `openspec.md §3` or `spec-kit.md §3`.
4. **The three anti-signals** (~150 w). Labelled list
   within prose. Each anti-signal names what we saw in
   our pre-v2.0 state.
5. **Phase 0 failure-mode note** (~100 w). Penultimate
   section per §6.5 three-element structure: (1) what
   happened (Product A v1 published without a
   conformance bar); (2) what we did (re-entered Phase
   0 after the v2.0 repack made the conformance gap
   visible); (3) what pattern generalizes (the
   conformance bar must be in place BEFORE the
   manifest+catalog repack, not derived from it).
6. **Forward pointer** (~30 w). Final section.
   "**In the next chapter**:" → chapter 02 / Phase 1 /
   facet inventory.

## 10. Interfaces and Files

Owned files (written by this Task):

- `longread/01-phase-0-maturity-check.md` (new).
- `specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  (Completion Report fills at verify time).

Read-only context:

- `file://research/primary-sources/adr-nygard.md` §3.
- `file://research/primary-sources/openspec.md` §3.
- `file://research/primary-sources/spec-kit.md` §3.
- `file://research/primary-sources/leaddev-agent-compiled.md`
  §3.
- `file://research/primary-sources/arc42.md` §3.
- `file://research/primary-sources/kiro.md` §3.
- `file://specs/2026-05-20-longread-structure/SPEC.md`.
- `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  (status: closed — pattern reference).
- `file://longread/00-introduction.md` (chapter 00
  prose — voice/posture reference).
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 + §7.

Out of scope:

- Any edit to chapter 00 or any other longread chapter.
- Any edit to the longread Contract or corpus artefacts.

External effects:

- `cmd://git push` to the
  `agentic-installation-methodology` remote on `main`
  under `branch_policy: main-direct` per
  `file://../bes-fleet-policy/AGENTS.md`. Front-matter
  `requires_network: true` reflects this.

## 11. Execution Plan

1. Read research workpad §6 (Phase 0) + §7 (BES case-
   study data) to internalise the Phase 0 substance.
2. Read corpus entries adr-nygard, openspec, spec-kit,
   leaddev-agent-compiled, arc42, kiro §3 to locate
   verbatim claims to anchor methodology primitives.
3. Draft `longread/01-phase-0-maturity-check.md` per §9
   structure.
4. Self-review voice (§6.3) + corpus-citation discipline
   (§6.4) + failure-mode coverage (§6.5) + word budget.
5. Run
   `cmd://bash scripts/validate-longread-structure.sh --chapter 01`.
6. Run
   `cmd://bash scripts/lint-spec.sh specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`.
7. Stage explicit files; conventional-commits commit;
   push.
8. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other longread
  chapter file.
- The Task MUST NOT modify the longread Contract SPEC
  or any corpus artefact.
- The Task MAY cite internal BES SPEC identifiers and
  transcript identifiers per longread Contract §6.6 at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.6 (which explicitly says internal SPEC IDs are
  sanitization-safe slugs and SHOULD be cited where
  they support a specific failure-mode disclosure;
  transcript identifiers MAY be cited where the
  owner-verbatim grounds a methodology choice). The
  Task MUST NOT name unrelated BES product repos per
  §6.6 (the studio's unrelated product repos are
  irrelevant to the methodology and remain unnamed).
- The Task MUST NOT include AI-attribution trailers in
  the commit message.
- The Task MUST NOT use `git add .` or `git add -A`.

## 13. Test Plan

- T-1: `cmd://test -f longread/01-phase-0-maturity-check.md`
  exits 0.
- T-2:
  `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 01 at ≥ 50 prose words (in-progress
  floor).
- T-3: Chapter 01 word count is in [800, 1100],
  enforced by
  `cmd://bash scripts/validate-longread-structure.sh --chapter 01`.
- T-4:
  `cmd://bash scripts/lint-spec.sh specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing the corpus-
  citation rule at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4 strictly: every methodology primitive in the
  chapter (maturity bar, four signals, three anti-
  signals, load-bearing-decisions distinction,
  conformance-bar concept) MUST cite a corpus entry in
  the pattern `research/primary-sources/<slug>.md §3`
  (concrete `<slug>` resolved per
  `file://research/primary-sources/INDEX.md`). Parent
  Decision / Contract / research-workpad cites may only
  support Product B shape + phase taxonomy + open-
  question enumeration. Owner-transcript cites may only
  support posture statements.
- T-6: Manual reviewer check against
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3 voice contract: first-person experiential
  dominates; no passive voice for studio actions; no
  third-person methodology-vendor voice.
- T-7: The chapter-introducing commit succeeds under
  `file://../bes-fleet-policy/.claude/hooks/block-ai-attribution.sh`
  and conforms to Conventional Commits per
  `file://../bes-fleet-policy/AGENTS.md`. Evidence:
  `cmd://git log -1 --format='%B'` contains no
  AI-attribution trailers.
- T-8: Manual inspection of §17 Completion Report of
  this SPEC at
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  shows subsections 17.1-17.5 non-empty after verify.
- T-9: BES Phase 0 failure opener check. The chapter
  MUST open with the BES Phase 0 failure (Product A v1
  published without a conformance bar). Mechanical
  evidence: `cmd://head -25
  longread/01-phase-0-maturity-check.md | grep -iE
  '(product a|conformance bar|v1|maturity)' | wc -l`
  returns ≥ 2 (at least two anchor terms in the
  opening). Manual reviewer: the opening reads as a
  first-person failure account, not a methodology
  preamble.
- T-10: Four positive maturity signals coverage.
  Mechanical evidence: a small helper script
  `file://scripts/check-chapter-01-phase-0-signals.sh`
  (authored under this Task) exits 0 iff the chapter
  contains substring anchors for all four positive
  signals + all three anti-signals.
- T-11: Corpus citation density. Chapter MUST cite at
  least three distinct primary-source corpus entries.
  Mechanical evidence: `cmd://grep -oE
  'research/primary-sources/[a-z0-9-]+\.md'
  longread/01-phase-0-maturity-check.md | sort -u | wc
  -l` returns ≥ 3.
- T-12: ADR-Nygard anchor for load-bearing decisions.
  Mechanical evidence: `cmd://grep -F
  'research/primary-sources/adr-nygard.md'
  longread/01-phase-0-maturity-check.md` exits 0.
- T-13: Conformance-bar anchor. Per the chapter-01
  prose codex review (Finding 1), the correct corpus
  anchors for installer-runnable conformance are
  `research/primary-sources/symphony-spec.md` §3
  (Conformance Profiles: Core / Extension / Real
  Integration) and
  `research/primary-sources/cucumber-gherkin.md` §3
  (Given/When/Then executable specifications). At
  least one MUST be cited. Mechanical evidence:
  `cmd://grep -qF 'research/primary-sources/symphony-spec.md'
  longread/01-phase-0-maturity-check.md ||
  grep -qF 'research/primary-sources/cucumber-gherkin.md'
  longread/01-phase-0-maturity-check.md` exits 0.
- T-14: Per-chapter Phase 0 failure-mode note in the
  §6.5 three-element structure, placed as the chapter's
  penultimate section (immediately before the forward
  pointer). Pass criteria:
  - **Mechanical (placement)**: the last `## ` heading
    before the `**In the next chapter**:` line is the
    failure-mode section. Evidence:
    `cmd://awk '/^## / {h=$0} /\*\*In the next chapter\*\*:/ {print h; exit}' longread/01-phase-0-maturity-check.md`
    emits a heading containing one of {"failure",
    "what we", "missed", "phase 0"} (case-insensitive).
  - **Mechanical (three-element structure)**: the
    failure-mode section contains at least one anchor
    each from three element-groups. Evidence:
    `cmd://bash scripts/check-chapter-01-failure-note.sh`
    exits 0 iff the section between the failure-mode
    heading and the forward pointer contains anchors
    for (1) what happened, (2) what we did, (3) what
    pattern generalizes.
  - **Manual reviewer**: the failure note is honest,
    specific (names Product A v1 + missing conformance
    bar), and generalizes a pattern other teams can
    apply.
- T-15: Forward pointer. Mechanical evidence:
  `cmd://tail -5 longread/01-phase-0-maturity-check.md
  | grep -E '\*\*In the next chapter\*\*:'` matches
  and references chapter 02 / Phase 1 / facet
  inventory.

## 14. Acceptance Criteria

- [ ] AC-1: chapter file present.
- [ ] AC-2: word count in [800, 1100] via chapter-
      strict validator.
- [ ] AC-3: in-progress validator PASSes (chapter 01
      ≥ 50 prose words).
- [ ] AC-4: SPEC lint exits 0.
- [ ] AC-5: T-5 corpus-citation discipline (manual).
- [ ] AC-6: T-6 voice contract (manual).
- [ ] AC-7: T-7 commit-hygiene.
- [ ] AC-8: T-8 Completion Report fills.
- [ ] AC-9: T-9 BES Phase 0 failure opener.
- [ ] AC-10: T-10 four signals + three anti-signals
      coverage (helper script).
- [ ] AC-11: T-11 ≥ 3 distinct corpus citations.
- [ ] AC-12: T-12 adr-nygard anchor present.
- [ ] AC-13: T-13 symphony-spec OR cucumber-gherkin
      anchor present (conformance-bar corpus anchors
      per chapter-01 prose codex Finding 1).
- [ ] AC-14: T-14 Phase 0 failure-mode note.
- [ ] AC-15: T-15 forward pointer to chapter 02.

## 15. Rollback Plan

If chapter prose is wrong-shape after authoring: revert
the chapter-introducing commit, revise this SPEC, re-
author. If a single sentence needs adjustment post-
verify: amend in-place via `fix(chapter-01):` commit.

## 16. Open Questions

- [ ] Q1: BES Phase 0 failure specificity. Default:
      name the failure (Product A v1 published without
      conformance bar); do not name internal SPEC IDs.
      Not owner-blocking.
- [ ] Q2: Four signals format — narrative paragraphs vs
      labelled list within prose. Default: labelled
      list within prose. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.0 Amendment Log

Per the T-01 methodology arc lesson 3 (amendments need a
per-target stale-text audit), this Completion Report
records post-verify amendments to chapter 01:

- **Amendment 1** (commit `62bd77e`, 2026-05-21): Chapter
  prose rewritten per codex chapter-01 prose R1 review
  (3 MAJOR findings: wrong conformance anchors, failure-
  note blurred two failures, Nygard over-attributed).
  See `file://reviews/codex-2026-05-21-chapter-01/REVIEW.md`
  + `file://reviews/codex-2026-05-21-chapter-01-r2/REVIEW.md`
  (R2 CONVERGENCE-PASS on prose).
- **Historical evidence**: At initial verify (commit
  `aeeb262`), chapter was 830 prose words and cited
  `openspec.md` + `spec-kit.md` as conformance anchors
  + cited Nygard as origin of load-bearing-vs-accidents.
  Acceptance evidence in §17.1-§17.2 has been refreshed
  to the current (`62bd77e`) state below.

### 17.1 Files changed

- `longread/01-phase-0-maturity-check.md` (new, 897
  prose words after R1 prose remediation; 830 at
  initial authoring per Amendment 1).
- `specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  (status flip draft → in-execution → verified;
  Completion Report fills).
- `scripts/check-chapter-01-phase-0-signals.sh` (new;
  paired-anchor signal check for Phase 0 four positives
  + three anti-signals).
- `scripts/check-chapter-01-failure-note.sh` (new;
  three-element failure-note check enforcing §6.5
  structure + penultimate-section placement).

### 17.2 Commands run

- `cmd://bash scripts/lint-spec.sh
  specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  → 0 errors, 0 warnings.
- `cmd://test -f longread/01-phase-0-maturity-check.md`
  → exit 0.
- `cmd://bash scripts/validate-longread-structure.sh`
  → PASS in-progress; 2/9 chapters present; total=1776
  prose words.
- `cmd://bash scripts/validate-longread-structure.sh --chapter 01`
  → PASS chapter-strict; 897 prose words in [800, 1100]
  (current, post-Amendment 1; 830 at initial verify).
- `cmd://bash scripts/check-chapter-01-phase-0-signals.sh`
  → PASS (4 positives + 3 anti-signals, paired anchors).
- `cmd://bash scripts/check-chapter-01-failure-note.sh`
  → PASS (three-element structure at penultimate
  section).
- T-11: 4 distinct corpus citations (current, post-
  Amendment 1: adr-nygard, cucumber-gherkin, leaddev-
  agent-compiled, symphony-spec; initial verify
  citations were adr-nygard, leaddev-agent-compiled,
  openspec, spec-kit, replaced per R1 F1).
- T-12: adr-nygard cite present.
- T-13: symphony-spec AND cucumber-gherkin cites
  present (T-13 + AC-13 updated per Amendment 1 to
  require symphony-spec OR cucumber-gherkin, replacing
  the original openspec OR spec-kit; codex chapter-01
  prose R1 F1 established these are the correct
  conformance-bar anchors).
- T-15: forward pointer present, references chapter 02
  / Phase 1 / facet inventory.

### 17.3 Verification result

All 15 acceptance criteria PASS.

Manual reviewer checks confirmed during authoring:

- T-5 corpus-citation discipline: methodology primitives
  (load-bearing-vs-accidents at Signal 3; conformance bar
  at Signal 4; LeadDev archaeology framing at the
  "maturity question" paragraph) cite corpus entries
  only. Parent Decision / Contract / research-workpad
  cites appear in §10 + §7 of the SPEC, not in the
  chapter prose.
- T-6 voice: first-person experiential ("We published",
  "we shipped", "we worked back", "we took the lesson");
  no third-person methodology-vendor voice; no passive
  voice for studio actions.
- Failure-note quality: names Product A v1 + missing
  conformance bar; explains the v2.0 `conformance.status:
  reserved` honest-disclosure response; generalizes the
  pattern that conformance bar belongs in Phase 0, not
  Phase 4.

### 17.4 Residual risk

- The failure-note pattern claim ("conformance belongs
  in Phase 0, not Phase 4") is `judgment://agent-synthesis`
  per Contract §6.5 element 3; Owner sign-off via the
  "approved" flip is the validation. Codex prose review
  catches if the synthesis is wrong.
- The chapter mentions Phase 1 / Phase 2 / Phase 4 by
  number in forward-pointer + pattern paragraphs; this
  is necessary referential prose, not a roadmap
  violation. Chapter 00's roadmap helper does not apply
  to chapter 01.
- The paired-anchor helper requires a specific
  vocabulary ("customization surface", "implementation
  accident", "non-compliant install"). If a later
  authoring pass restructures these terms, the helper
  will need re-tuning; the helper is chapter-01-
  specific.

### 17.5 Spec evidence candidates

- **T-01 → T-02 lesson transfer accelerates
  convergence.** T-01 SPEC needed 5 codex rounds
  (7→4→4→1→0). T-02 SPEC needed 2 rounds (4→0). The
  R1-R5 lessons (path-base normalization, ideated_in,
  mechanically-runnable evidence, AC↔T parity,
  citation discipline strictness) were applied
  upfront; only the chapter-specific findings (helper
  paired anchors, §6.5 three-element enforcement,
  §6.6 attribution-posture reading) needed
  remediation.
- **Per-chapter helper scripts pay back.** Authoring
  two helpers (signals + failure-note) cost minutes
  but provides a mechanical gate that catches the
  failure modes a manual reviewer would miss
  (signal-vocabulary drift, failure-note placement,
  three-element structure).
- **The §6.5 three-element pattern needs explicit
  mechanical enforcement.** Codex R1 caught that a
  loose grep for "failure" words would pass while
  burying the failure note. The helper extracts the
  penultimate-section content + enforces the three
  element-groups; this pattern generalizes to chapters
  02-07.
- **Reading the Contract carefully matters as much as
  reading the corpus.** R1 F4 caught my §6.6 misread
  (I said MUST NOT name internal SPEC IDs; §6.6
  explicitly says they're sanitization-safe and SHOULD
  be cited where they support failure-mode
  disclosure). Lesson: when authoring a per-chapter
  Task SPEC that says "MUST NOT", verify by reading
  the cited Contract section verbatim, not
  paraphrasing it.
