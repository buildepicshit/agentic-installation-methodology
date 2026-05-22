---
id: 2026-05-23-longread-chapter-04-phase-3-sanitization-bar
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md
  - test -f longread/04-phase-3-sanitization-bar.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 04
  - bash scripts/check-chapter-04-phase-3-anchors.sh
  - bash scripts/check-chapter-04-failure-note.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/04-phase-3-sanitization-bar.md
word_budget_target: 900
word_budget_max: 1200
---

# SPEC: Longread chapter 04 — Phase 3 Sanitization Bar

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 04 as the
Phase 3 chapter: "Dropping studio context without
dropping rigor." Chapters 00 + 01 + 02 + 03 are at
status: closed. Per
`file://specs/2026-05-20-longread-structure/SPEC.md`
§7.1, chapter 04 follows chapter 03. This Task SPEC
authors that chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 04 is the methodology's sanitization chapter.
By its end, the reader knows what the published spec
keeps and what it leaves behind, what three moves
constitute the Phase 3 bar per workpad §6, where BES
landed per workpad §7, and crucially what the asymmetry
between the published spec bundle (sanitized) and this
methodology longread (BES fully named per parent
Decision §7 disposition Q4) means in practice. The
chapter is the load-bearing place to address that
asymmetry honestly — Product B exists as a paired
artefact because the two artefacts have different
sanitization contracts by design.

## 3. Goals

- Author `longread/04-phase-3-sanitization-bar.md` at
  target 900 words (advisory under soft-floors); max
  1 200 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Open with the sanitization-bar question
  (parameterize-vs-hard-code closed in chapter 03; now:
  what does the spec keep vs leave behind?).
- Cover the three sanitization moves per research
  workpad §6 Phase 3.
- Cite at least
  `file://research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 for the reference-vs-solution split.
- Cite at least one of
  `file://research/primary-sources/12-factor.md` §3 or
  `file://research/primary-sources/diataxis.md` §3 for
  the content-classification analogue.
- Cover where BES landed per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 ("drop ALL studio context per
  `owner://transcript-2026-05-17`; generalize
  `owner://` → `decision-authority://<role>`").
- Address the asymmetry honestly: spec bundle
  sanitization vs longread case-study density per
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 disposition Q4.
- Include a Phase 3 failure-mode note in the §6.5
  three-element structure as the chapter's penultimate
  section, with strict fact-vs-synthesis separation
  per T-04 R1 lesson.
- End with "**In the next chapter**:" forward pointer
  to chapter 05 (Phase 4 manifest + catalog) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- Author WITHOUT padding-for-budget AND WITHOUT over-
  attribution to cited authority.

## 4. Non-Goals

- Authoring chapter 05-08 content.
- Defining the manifest + catalog composition (that's
  Phase 4, chapter 05).
- Enumerating an algorithmic sanitization rule set —
  the chapter explicitly names sanitization as
  judgement-laden, not mechanical.
- Resolving open research questions.

## 5. Current System Facts

- Chapters 00-03 are at status: closed
  (`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`,
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`,
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`,
  `file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`).
- Validator at
  `file://scripts/validate-longread-structure.sh`
  chapter-strict mode enforces 1 200 max for chapter
  04; 900-word target is advisory per soft-floors.
- Primary-source corpus at
  `file://research/primary-sources/` v1.1; Phase 3-
  relevant entries
  (`file://research/primary-sources/ref-arch-vs-solution-arch.md`,
  `file://research/primary-sources/12-factor.md`,
  `file://research/primary-sources/diataxis.md`,
  `file://research/primary-sources/sigstore-cosign.md`)
  primary-read-complete per
  `file://research/primary-sources/INDEX.md`.
- Research workpad
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 3 + §7 BES disposition.
- Parent Decision
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 disposition Q4 names BES fully throughout
  Product B.
- T-04 + chapters 02 + 03 prose-codex closures
  (`file://reviews/codex-2026-05-22-chapter-02-r2/REVIEW.md`,
  `file://reviews/codex-2026-05-22-chapter-03-r2/REVIEW.md`)
  established the corpus-vs-workpad attribution
  asymmetry pattern + the strict fact-vs-synthesis
  failure-note rule.

## 6. Authority Map

Active authority:
- Longread Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution).
- Parent Decision §7 + §14.0 soft-floors at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
- Research workpad §6 Phase 3 + §7 BES at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.
- Verified primary-source corpus at
  `file://research/primary-sources/`.
- Chapter 00-03 closures at
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  through
  `file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`.
- `file://schema/SPEC.schema.md` — citation grammar.

Stale, superseded, or evidence-only:
- None for this slice.

Owner decisions required before implementation:
- [ ] Approve this Task SPEC.

## 7. Code/Docs Reality Check

- Soft-floors regime per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 in effect.
- Paragraph-co-occurrence helper-script pattern proven
  at
  `file://scripts/check-chapter-03-phase-2-anchors.sh`
  + `file://scripts/check-chapter-03-failure-note.sh`.
- Explicit bold-marker rule for §6.5 three-element
  failure note proven at
  `file://scripts/check-chapter-03-failure-note.sh`.
- Asymmetry between Product A and Product B
  (sanitization applies to A; B names BES fully) is
  load-bearing for chapter 04 per
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 disposition Q4.

## 8. Desired Behavior

After this Task executes:

- A file `longread/04-phase-3-sanitization-bar.md`
  MUST exist with prose content at or below 1 200
  words per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- The chapter MUST open with the sanitization-bar
  question (what does the published spec keep vs
  leave behind).
- The chapter MUST cover all three sanitization moves
  per research workpad §6 Phase 3: (a) drop studio
  context from spec body; (b) use studio experience
  as evidence frame; (c) document preconditions for
  the spec's assumptions (trust-boundary
  declarations).
- The chapter MUST cite the reference-vs-solution
  split via
  `file://research/primary-sources/ref-arch-vs-solution-arch.md`
  §3.
- The chapter MUST cite the content-classification
  analogue via at least one of
  `file://research/primary-sources/12-factor.md` §3
  or
  `file://research/primary-sources/diataxis.md` §3.
- The chapter MUST cover where BES landed per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 (drop ALL; generalize owner:// →
  decision-authority://<role>).
- The chapter MUST name the asymmetry between Product
  A sanitization and Product B case-study density,
  citing parent Decision §7 disposition Q4 at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
- The chapter MUST include a Phase 3 failure-mode
  note in the §6.5 three-element structure as the
  chapter's penultimate section, with strict fact-vs-
  synthesis separation (E1 + E2 workpad-grounded; E3
  explicitly `judgment://agent-synthesis` tagged).
- The chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 05.
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT pad for word budget.
- The chapter MUST NOT make claims about Phase 3
  specifics beyond what workpad §6 + §7 + parent
  Decision §7 directly support.

## 9. Domain Model / Contract

Recommended section structure (target ~900 words;
not enforced as floor):

1. **The sanitization-bar question** (~150 w). What
   does the published spec keep vs leave behind. Cite
   ref-arch-vs-solution-arch §3 for the line.
2. **Three sanitization moves** (~250 w). Per workpad
   §6: drop studio context; experience-as-evidence;
   trust-boundary preconditions. Cite 12-factor §3
   (config-vs-code analogue) and/or diataxis §3
   (content classification).
3. **The asymmetry** (~250 w). Cite workpad §7 for
   BES Product A disposition. Cite parent Decision §7
   disposition Q4 for Product B full attribution.
   Name the asymmetry as load-bearing — Product B
   exists paired with Product A precisely because
   the two artefacts have different sanitization
   contracts.
4. **Phase 3 failure-mode note** (~200 w; penultimate
   per §6.5). Strict fact-vs-synthesis separation:
   - **What happened** (workpad-grounded): workpad §7
     records BES bar as "drop ALL studio context;
     generalize owner:// → decision-authority://<role>".
   - **What we did** (workpad-grounded): adopted the
     bar; applied it to Product A's spec body.
   - **What pattern generalizes**
     (`judgment://agent-synthesis`; NOT workpad-
     proven): "drop ALL" is easier to state than to
     apply; distinguishing studio-context-as-evidence
     from studio-context-as-leak is judgement, not
     algorithm.
5. **Forward pointer** (~30 w). To chapter 05 / Phase
   4 / manifest + catalog.

## 10. Interfaces and Files

Owned files (written by this Task):
- `longread/04-phase-3-sanitization-bar.md`.
- `specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`.
- `scripts/check-chapter-04-phase-3-anchors.sh` (new;
  paragraph-co-occurrence design covering: sanitization-
  bar concept; three moves; BES disposition;
  asymmetry).
- `scripts/check-chapter-04-failure-note.sh` (new;
  explicit-bold-marker rule + agent-synthesis tag,
  same pattern as chapter 03 helper).

Read-only context:
- `file://research/primary-sources/ref-arch-vs-solution-arch.md` §3.
- `file://research/primary-sources/12-factor.md` §3.
- `file://research/primary-sources/diataxis.md` §3.
- `file://research/primary-sources/sigstore-cosign.md` §3
  (optional anchor for trust-boundary preconditions).
- `file://specs/2026-05-20-longread-structure/SPEC.md`.
- `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`,
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`,
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`,
  `file://specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`.
- `file://longread/00-introduction.md`,
  `file://longread/01-phase-0-maturity-check.md`,
  `file://longread/02-phase-1-facet-inventory.md`,
  `file://longread/03-phase-2-parameterization-surface.md`.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 + §7.
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7.

Out of scope:
- Any edit to chapters 00-03 or any other longread
  chapter.
- Any edit to the longread Contract or corpus.

External effects:
- `cmd://git push` under
  `branch_policy: main-direct` per
  `file://../bes-fleet-policy/AGENTS.md`. Front-matter
  `requires_network: true`.

## 11. Execution Plan

1. Read research workpad §6 Phase 3 + §7 BES disposition.
2. Read parent Decision §7 disposition Q4.
3. Read corpus entries ref-arch-vs-solution-arch §3,
   12-factor §3, diataxis §3, sigstore-cosign §3.
4. Author the two helper scripts BEFORE chapter prose.
5. Draft chapter prose per §9 structure WITHOUT
   padding AND WITHOUT over-attribution.
6. Self-review voice + corpus citation + failure-note
   structure + max word budget + over-attribution risk.
7. Run acceptance commands.
8. Stage explicit files; conventional-commits commit;
   push.
9. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other
  longread chapter.
- The Task MUST NOT modify the longread Contract or
  corpus.
- The Task MAY cite internal BES SPEC IDs and
  transcript IDs per Contract §6.6 where they support
  Phase 3 failure-mode disclosure; MUST NOT name
  unrelated BES product repos.
- The Task MUST NOT pad-for-budget; MUST NOT make
  claims beyond cited workpad/Decision authority.
- The Task MUST NOT include AI-attribution trailers
  in commits; MUST NOT use `git add .` / `git add -A`.

## 13. Test Plan

- T-1: `cmd://test -f
  longread/04-phase-3-sanitization-bar.md` exits 0.
- T-2:
  `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 04 ≥ 50 prose words (advisory
  under soft-floors).
- T-3: Chapter 04 word count at or below 1 200
  enforced max; 900 target reported as advisory if
  below. Evidence:
  `cmd://bash scripts/validate-longread-structure.sh --chapter 04`.
- T-4:
  `cmd://bash scripts/lint-spec.sh specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing corpus-citation
  rule at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: methodology primitives MUST cite corpus only.
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
  `file://specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`
  shows §17.1-§17.5 non-empty after verify.
- T-9: Paired-anchor coverage. Evidence:
  `cmd://bash scripts/check-chapter-04-phase-3-anchors.sh`
  exits 0 iff sanitization-bar + three-moves +
  BES-disposition + asymmetry all paragraph-co-occur.
- T-10: Corpus citation density ≥ 3 distinct entries.
  Evidence: `cmd://grep -oE
  'research/primary-sources/[a-z0-9-]+\.md'
  longread/04-phase-3-sanitization-bar.md | sort -u
  | wc -l` returns ≥ 3.
- T-11: ref-arch-vs-solution-arch anchor present.
  Evidence: `cmd://grep -qF
  'research/primary-sources/ref-arch-vs-solution-arch.md'
  longread/04-phase-3-sanitization-bar.md` exits 0.
- T-12: 12-factor OR diataxis anchor present.
  Evidence: `cmd://grep -qF
  'research/primary-sources/12-factor.md'
  longread/04-phase-3-sanitization-bar.md ||
  grep -qF 'research/primary-sources/diataxis.md'
  longread/04-phase-3-sanitization-bar.md` exits 0.
- T-13: Per-chapter Phase 3 failure-mode note in
  §6.5 three-element structure at penultimate
  position. Evidence:
  `cmd://bash scripts/check-chapter-04-failure-note.sh`
  exits 0.
- T-14: Forward pointer to chapter 05. Evidence:
  `cmd://tail -5
  longread/04-phase-3-sanitization-bar.md |
  grep -E '\*\*In the next chapter\*\*:'` matches.

## 14. Acceptance Criteria

- [ ] AC-1: chapter file present.
- [ ] AC-2: in-progress validator PASSes.
- [ ] AC-3: chapter-strict validator PASSes (≤ 1 200
      max; 900 target advisory).
- [ ] AC-4: SPEC lint exits 0.
- [ ] AC-5: T-5 corpus-citation discipline (manual).
- [ ] AC-6: T-6 voice contract (manual).
- [ ] AC-7: T-7 commit-hygiene.
- [ ] AC-8: T-8 Completion Report fills.
- [ ] AC-9: T-9 paired-anchor coverage (helper PASS).
- [ ] AC-10: T-10 ≥ 3 distinct corpus citations.
- [ ] AC-11: T-11 ref-arch-vs-solution-arch anchor
      present.
- [ ] AC-12: T-12 12-factor OR diataxis anchor present.
- [ ] AC-13: T-13 three-element failure note at
      penultimate position (helper PASS).
- [ ] AC-14: T-14 forward pointer to chapter 05.

## 15. Rollback Plan

If chapter prose wrong-shape after authoring: revert,
revise this SPEC, re-author. If single-sentence
adjustment post-verify: amend via `fix(chapter-04):`
commit + Amendment Log §17.0 entry.

## 16. Open Questions

- [ ] Q1: Explicit naming of the spec-bundle-vs-
      longread sanitization asymmetry. Default: name
      it explicitly in §3, with workpad §7 cite for
      Product A disposition and parent Decision §7
      disposition Q4 cite for Product B full
      attribution. Not owner-blocking.
- [ ] Q2: Trust-boundary preconditions example
      concreteness. Default per chapter 02 R1 closure:
      stay within workpad authority; do not invent
      BES-specific examples without citable source.
      Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.0 Amendment Log

- **Amendment 1** (this commit, 2026-05-23): Chapter
  trimmed per codex chapter-04 prose R1 (1 MAJOR —
  failure-note E2 imported Sigstore analogy, not
  workpad-grounded). Sigstore reference moved from E2
  to Move 3 of the three-sanitization-moves section as
  prior-art frame for trust-boundary declarations. E2
  narrowed to "We adopted the bar and applied it to
  Product A's spec body." Chapter post-fix: 617 prose
  words (initial 624). See
  `file://reviews/codex-2026-05-23-chapter-04/REVIEW.md`
  for R1 +
  `file://reviews/codex-2026-05-23-chapter-04-r2/REVIEW.md`
  for R2 CONVERGENCE-PASS.

### 17.1 Files changed

- `longread/04-phase-3-sanitization-bar.md` (new; 617
  prose words post-Amendment 1; 624 at initial).
  Below advisory target 900; below enforced max 1 200.
  Soft-floors accepts.
- `specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`
  (status: draft → in-execution → verified; §17 fills).
- `scripts/check-chapter-04-phase-3-anchors.sh` (new
  helper; paragraph-co-occurrence + asymmetry both-
  sides design).
- `scripts/check-chapter-04-failure-note.sh` (new
  helper; explicit-bold-markers + agent-synthesis tag).

### 17.2 Commands run

- `cmd://bash scripts/lint-spec.sh
  specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`
  → 0 errors, 0 warnings.
- `cmd://test -f
  longread/04-phase-3-sanitization-bar.md` → exit 0.
- `cmd://bash scripts/validate-longread-structure.sh`
  → PASS in-progress; 5/9 chapters; total prose words
  3 553 (current; post-Amendment 1).
- `cmd://bash scripts/validate-longread-structure.sh --chapter 04`
  → PASS chapter-strict; 617 prose words (max 1 200);
  below advisory target 900.
- `cmd://bash scripts/check-chapter-04-phase-3-anchors.sh`
  → PASS (sanitization-bar concept + 3 moves + BES
  disposition + asymmetry all paragraph-co-occur).
- `cmd://bash scripts/check-chapter-04-failure-note.sh`
  → PASS (explicit bold markers + agent-synthesis tag).
- T-10: 4 distinct corpus citations (12-factor,
  diataxis, ref-arch-vs-solution-arch, sigstore-cosign).
- T-11: ref-arch-vs-solution-arch cited.
- T-12: both 12-factor AND diataxis cited.
- T-14: forward pointer present, references chapter 05
  / Phase 4 / manifest + catalog.

### 17.3 Verification result

All 14 acceptance criteria PASS.

Manual reviewer checks (current, post-Amendment 1):

- T-5 corpus-citation discipline: methodology
  primitives cite corpus only. Reference-vs-solution
  cites ref-arch-vs-solution-arch §3. Move 1 cites
  12-factor §3 (config/code analogue). Move 2 cites
  diataxis §3 (reference-vs-explanation modes). Move 3
  cites sigstore-cosign §3 (provenance posture as
  prior-art frame for trust-boundary preconditions).
  BES disposition cites workpad §7 verbatim. The
  asymmetry observation cites parent Decision §7 Q4 +
  workpad §7.
- T-6 voice: first-person experiential ("we extracted
  the framework", "We adopted the bar"). No third-
  person methodology-vendor voice.
- Failure-note quality (post-Amendment 1): E1 + E2
  strictly workpad-grounded. E3 explicitly
  `judgment://agent-synthesis` tagged; the studio-
  context-as-evidence vs studio-context-as-leak
  observation is synthesis, not workpad-proven.
- Asymmetry-observation honesty: chapter explicitly
  names BOTH the spec-bundle sanitization contract
  (Product A; workpad §7) AND the longread case-study
  contract (Product B; parent Decision §7 Q4), and
  states that this paired-release shape is by design,
  not by accident.

### 17.4 Residual risk

- Chapter 04 at 617 prose words is third consecutive
  sub-target chapter (chapter 02 at 573; chapter 03
  at 595). Soft-floors regime continues to accept.
- The asymmetry observation is load-bearing for the
  whole methodology — if a future external reviewer
  or installer reads this chapter and says "you tell
  me to sanitize but you don't sanitize yourselves",
  the chapter has already addressed that question
  honestly per parent Decision §7 Q4 + workpad §7. If
  the framing still feels uncomfortable to external
  readers, a follow-on amendment can sharpen it.
- The E3 synthesis ("drop ALL is judgement not
  algorithm") is `judgment://agent-synthesis` per
  Contract §6.5 element 3; owner sign-off is the
  validation.

### 17.5 Spec evidence candidates

- **Asymmetric-sanitization framing is the chapter's
  load-bearing observation.** Chapter 04 is the
  natural place to address the otherwise-confusing
  fact that the methodology longread itself does not
  follow Phase 3's drop-ALL rule — because parent
  Decision §7 Q4 explicitly says Product B is the
  case study and BES is named throughout. The two
  artefacts (sanitized spec bundle + fully-named
  longread) ship paired by design, with different
  sanitization contracts that discharge different
  obligations. Future chapters may build on this
  framing; the chapter that introduces it must do so
  cleanly.
- **Move-3 sigstore-as-prior-art works**. The R1
  prose finding was that Sigstore appeared in the
  failure note where it didn't belong; the fix moved
  it to Move 3 (trust-boundary preconditions) where
  it functions cleanly as prior-art frame. The
  reusable lesson: when a corpus citation gets
  flagged in a failure note, ask whether the right
  placement is in the chapter body where the
  corresponding methodology primitive is introduced.
- **Recurring E2 over-attribution class**. Chapters
  02 + 03 + 04 prose-codex passes all caught E2 (or
  equivalent) drifting beyond workpad-grounded
  "what we did". The pattern is durable enough that
  it should be encoded into a per-chapter authoring
  rule: when drafting the failure note, write E1 +
  E2 from the workpad ONLY (do not refer to corpus
  entries even by name unless they appear in the
  workpad disposition itself); save corpus-frame
  references for the chapter body or for E3 under
  `judgment://agent-synthesis`.
- **Soft-floors regime durable through 3 sub-target
  chapters**. Chapter 02 at 573, chapter 03 at 595,
  chapter 04 at 617. Across three consecutive
  chapters under the soft-floors regime, no padding-
  for-budget pressure surfaced. The regime is
  working.
