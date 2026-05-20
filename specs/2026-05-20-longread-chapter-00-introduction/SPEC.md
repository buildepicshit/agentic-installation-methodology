---
id: 2026-05-20-longread-chapter-00-introduction
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-20-longread-chapter-00-introduction/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-20-longread-chapter-00-introduction/SPEC.md
  - test -f longread/00-introduction.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 00
  - bash scripts/check-chapter-00-phase-roadmap.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/00-introduction.md
word_budget_target: 800
word_budget_max: 1100
---

# SPEC: Longread chapter 00 — Introduction

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals. RFC 2119 keywords
in this Task SPEC appear in Desired Behavior, Acceptance Criteria,
Test Plan, and Safety / Scope Invariants sections.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md` (status:
in-execution) names a nine-file `longread/` directory and a
mechanical validator. Per §6.1 of that Contract, chapter
00 is the introduction: "Why agentic installation; what
this longread is + is not; reader contract." Per §7.1
authoring sequence, chapter 00 is authored first because
it has lower cognitive load (frame-setting, no per-phase
case-study density) and because subsequent chapters
assume the reader has accepted the frame chapter 00
sets. This Task SPEC authors that chapter.

## 2. North Star / Product Promise

The longread is the human-readable narrative arm of
Product B (per the parent Decision SPEC at
`file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7). Chapter 00 is the reader's first contact with the
methodology. Its product promise: by the end of chapter
00, a reader (engineer or agent) knows what the longread
is going to cover, what posture it takes, what citation
discipline it follows, and what it explicitly does not
claim to resolve. The chapter sets the contract every
subsequent chapter inherits.

## 3. Goals

- Author `longread/00-introduction.md` at target 800
  words (max 1100; §6.2 of the longread Contract).
- Open with the agentic-installation hypothesis as
  procedure, not risk. Use the LeadDev critique
  (`file://research/primary-sources/leaddev-agent-compiled.md`
  §3) as the prior-art-as-risk frame the methodology
  publishes as method.
- State the reader contract: honest experience not
  prescription; failure modes + open research questions
  are first-class; citations resolve to the corpus
  + owner transcripts, not agent memory.
- Roadmap the eight phase chapters per §6.1.
- End with a forward pointer to chapter 01 (Phase 0
  maturity check).
- Conform to the §6.3 voice contract: first-person
  experiential; no passive voice for studio actions;
  no third-person methodology-vendor voice.
- Conform to the §6.4 citation rule: every methodology
  primitive cites a corpus entry, not external URL or
  agent memory.
- Pass `scripts/validate-longread-structure.sh` (chapter
  file present + word count within in-progress bounds).

## 4. Non-Goals

- Authoring chapter 01-08 content (those are subsequent
  Task SPECs T-02 through T-09).
- Resolving any of the seven open research questions
  (research workpad §2.3); chapter 00 announces them as
  flagged-open, chapter 08 synthesises them.
- Authoring an executive summary or abstract suitable
  for academic publication (the longread is engineering
  experiential narrative; chapter 00 is the reader
  contract, not an abstract).
- Cutting a v0.1 release tag of the longread; releases
  land after all nine chapters land.

## 5. Current System Facts

- The longread Contract is at status: in-execution. The
  validator at `file://scripts/validate-longread-structure.sh`
  exists. In in-progress mode, missing chapter files are
  printed as warnings (not errors); the per-chapter floor
  (50 prose words) and Contract §6.2 maximum apply to any
  chapter present. The in-progress total floor (450) acts
  as a permissive guard against an empty `longread/`. In
  release mode (`--release-mode`), missing chapters are
  errors and the total bounds are [8000, 12000].
- The `longread/` directory exists (created at validator
  commit) but is empty.
- The primary-source corpus is at v1.1 (22 sources, 3
  partial-with-notes) per
  `file://specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  §6.1 and verified by
  `cmd://bash scripts/check-corpus-completeness.sh` PASS.
- The R6 codex convergence pass at
  `file://reviews/codex-2026-05-19-round6/` declared the
  three Contract SPECs (parent Decision, corpus, v2.0
  repack) ready for forward motion.

## 6. Authority Map

Active authority for this Task:

- Longread Contract SPEC at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (status: in-execution). §6.1 chapter taxonomy names
  chapter 00 as "Why agentic installation; what this
  longread is + is not; reader contract." §6.2 word
  budget. §6.3 voice contract. §6.4 citation rule.
  §7.1 authoring sequence.
- Parent Decision SPEC at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — binds Product B shape; §7 names "first-person
  experiential" voice + "BES case-study density" +
  "failure modes as first-class content."
- Verified primary-source corpus at
  `file://research/primary-sources/` — citable
  evidence base for every methodology primitive
  chapter 00 cites.
- `file://schema/SPEC.schema.md` — citation grammar,
  RFC 2119 scoping, front-matter schema.

Stale, superseded, or evidence-only:

- None for this slice.

Owner decisions required before implementation:

- [ ] Approve this Task SPEC (flip approved-pending-owner
      → approved).

## 7. Code/Docs Reality Check

- The R6 convergence evidence at
  `file://reviews/codex-2026-05-19-round6/` is durable
  on origin/main across all three repos. The methodology
  arc's substantive bindings (parent Decision §7; corpus
  §6.1; v2.0 repack §6.1 + §8) are stable.
- The validator at
  `file://scripts/validate-longread-structure.sh`
  in-progress mode accepts chapters at ≥ 50 prose words
  and ≤ each chapter's §6.2 max; missing chapters print
  as warnings, not errors, so T-01 PASSes after
  authoring only chapter 00. The release-mode invocation
  `cmd://bash scripts/validate-longread-structure.sh --release-mode`
  is reserved for v1.0 publication time and requires all
  nine chapters present.
- The longread Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md` §6.5
  (per-chapter failure-mode rule) applies to chapters
  01-07; chapter 00 is the introduction and is exempt
  from the per-chapter failure note (no Phase to surface
  failures from). Chapter 08 carries the cross-phase
  synthesis.

## 8. Desired Behavior

After this Task executes, the following MUST hold:

- A file `longread/00-introduction.md` MUST exist with
  prose content between 800 (target) and 1100 (max)
  words per the longread Contract §6.2.
- The chapter MUST open with a one-paragraph or
  one-sentence epigraph framing the agentic-installation
  hypothesis. The epigraph SHOULD be either an
  `owner://transcript-2026-05-18` quote or a
  `file://research/primary-sources/leaddev-agent-compiled.md`
  §3 verbatim quote.
- The chapter MUST cite the LeadDev critique as the
  closest published prior-art statement of the
  agentic-installation hypothesis (framed as risk; the
  methodology publishes it as procedure).
- The chapter MUST roadmap the eight phase chapters
  (Phase 0 + Phases 1-7) per the longread Contract §6.1.
- The chapter MUST state the reader contract: honest
  experience not prescription; failure modes + open
  research questions are first-class; corpus citation
  discipline.
- The chapter MUST end with a "**In the next chapter**:"
  forward pointer to chapter 01 (Phase 0 maturity check)
  per longread Contract §8.1 file structure.
- The chapter MUST conform to §6.3 voice contract:
  first-person experiential; no passive voice for
  studio actions; no third-person methodology-vendor
  voice.
- The chapter MAY include `judgment://agent-synthesis`
  observations but MUST be sparing (the §6.4 deep-
  research directive favours corpus citations).
- The chapter MUST NOT claim to resolve any of the
  seven open research questions (research workpad
  §2.3); these are announced in chapter 00 as
  flagged-open, synthesised in chapter 08.

## 9. Domain Model / Contract

The chapter's structural shape per longread Contract
§8.1:

```markdown
# Chapter 00 — Introduction

<epigraph: owner transcript OR corpus verbatim>

## <section heading>

<body prose with inline citations>

## <section heading>

…

---

**In the next chapter**: <forward pointer to chapter 01>
```

Recommended section structure (author may adjust within
the word budget):

1. **The hypothesis** (~150 words): state the
   agentic-installation premise — developers ship
   exhaustive intent specs; user-with-agents install
   locally; no developer-in-the-loop support loop. Cite
   the LeadDev critique as the prior-art-as-risk
   framing.
2. **What this longread is** (~150 words): a published
   methodology (procedure + posture + case study), not
   a finished theory. Eight phase chapters mapped to
   the methodology's Phase 0 + Phases 1-7. BES is the
   worked case study.
3. **What this longread is not** (~150 words): not
   prescription; not resolution of the seven open
   research questions; not academic-channel framing.
4. **The reader contract** (~200 words): honest
   experience; failure modes + open questions as
   first-class content; corpus citation discipline;
   posture of "we tried this, we found X, we did not
   solve Y."
5. **Reader roadmap** (~100 words): one-sentence summary
   per phase chapter (8 sentences).
6. **Forward pointer** (~50 words): "**In the next
   chapter**: Phase 0 maturity check — when is a
   product ready to be published as a
   deployment-grade SPEC bundle?"

## 10. Interfaces and Files

Owned files (written by this Task):

- `longread/00-introduction.md` (new).
- `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  (this file; Completion Report fills appended at
  verify time).

Read-only context:

- `file://research/primary-sources/leaddev-agent-compiled.md`
  (corpus entry; primary citation).
- `file://specs/2026-05-20-longread-structure/SPEC.md` (the
  longread Contract this Task implements).
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  (parent Decision; §7 binding).
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §2.3 (seven open research questions; chapter 00
  announces them as flagged-open).

Out of scope:

- Any edits to other longread chapters (chapters 01-08
  are separate Task SPECs).
- Any edits to the longread Contract or any corpus
  artefact.

External effects:

- `cmd://git push` to the `agentic-installation-methodology`
  remote on `main`. Push is permitted under
  `branch_policy: main-direct` per
  `file://../bes-fleet-policy/AGENTS.md` "Branch and
  remote policy"; front-matter `requires_network: true`
  reflects this. No other network-bound or third-party
  side effects.

## 11. Execution Plan

1. Read the longread Contract §6.1-§6.5 + §8.1 + §7.1
   to internalise the chapter contract.
2. Read `file://research/primary-sources/leaddev-agent-compiled.md`
   §3 in full to anchor the primary-source citation.
3. Read `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   §2.3 (the seven open research questions; chapter 00
   announces them).
4. Draft `longread/00-introduction.md` per §9 Domain
   Model section structure.
5. Self-review for voice (§6.3) + citation discipline
   (§6.4) + word budget (§6.2).
6. Run `bash scripts/validate-longread-structure.sh` →
   expect a partial PASS (chapter 00 satisfies its
   per-chapter floor; other chapters still missing).
7. Run `bash scripts/lint-spec.sh
   specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
   → expect exit 0.
8. Stage explicit files; commit with conventional
   message; push.
9. Fill Completion Report §17; flip this SPEC's status
   to `verified`.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other longread
  chapter file.
- The Task MUST NOT modify the longread Contract SPEC
  or any corpus artefact.
- The Task MUST NOT claim to resolve any of the seven
  open research questions; the chapter announces them
  as flagged-open per parent Decision §7.
- The Task MUST NOT include AI-attribution trailers in
  the commit message (enforced by Product A's
  `block-ai-attribution.sh` hook discipline; this repo
  follows the same convention).
- The Task MUST NOT use `git add .` or `git add -A`;
  staging is explicit by file name.

## 13. Test Plan

- T-1: `cmd://test -f longread/00-introduction.md`
  exits 0.
- T-2: `cmd://bash scripts/validate-longread-structure.sh`
  reports `longread/00-introduction.md` at ≥ 50 prose
  words (per-chapter in-progress floor).
- T-3: Chapter 00 word count is between
  `word_budget_target` (800) and `word_budget_max`
  (1100) declared in this SPEC's front-matter, enforced
  mechanically by
  `cmd://bash scripts/validate-longread-structure.sh --chapter 00`.
  This invocation uses the chapter-strict mode added
  to the validator per longread Contract §8.2; it
  enforces both the lower bound (§6.2 target) and the
  upper bound (§6.2 max).
- T-4: `cmd://bash scripts/lint-spec.sh
  specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing the corpus-
  citation rule at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4 strictly: every **methodology primitive** in the
  chapter (e.g. the agentic-installation hypothesis, the
  Phase 0-7 procedure, sanitization bar, manifest+catalog
  shape, conformance surface) MUST cite a corpus entry
  in the pattern `research/primary-sources/<slug>.md §3`
  (concrete `<slug>` resolved per
  `file://research/primary-sources/INDEX.md`). Parent
  Decision SPEC + research-workpad citations are
  permitted ONLY for Product B shape, phase structure,
  owner dispositions, and the seven-open-question
  enumeration — never as substitutes for primary-source
  corpus anchors. Owner transcript cites
  (`owner://transcript-<date>`) are permitted only for
  posture / reader-contract statements, not for
  methodology primitives. Bare external URLs as primary
  anchors for methodology primitives are forbidden.
- T-6: Manual reviewer check against the voice contract
  at `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3: first-person experiential dominates; no passive
  voice for studio actions; no third-person methodology-
  vendor voice; the chapter explicitly acknowledges
  the methodology does not resolve the seven open
  questions.
- T-7: The chapter-introducing commit succeeds (no
  hook rejection) under
  `file://../bes-fleet-policy/.claude/hooks/block-ai-attribution.sh`
  and conforms to Conventional Commits per
  `file://../bes-fleet-policy/AGENTS.md`
  "Engineering standards". Evidence: `cmd://git log -1
  --format='%s'` returns a `<type>(<scope>): <subject>`
  shape and `cmd://git log -1 --format='%B'` contains
  no `Co-Authored-By: Claude` / `Co-Authored-By: GPT-...`
  trailers.
- T-8: Manual inspection of §17 Completion Report shows
  non-empty subsections 17.1 (files changed), 17.2
  (commands run), 17.3 (verification result), 17.4
  (residual risk), 17.5 (spec evidence candidates).
- T-9: Epigraph check. The chapter MUST open with an
  epigraph (one paragraph or one sentence) drawn from
  either `owner://transcript-2026-05-18` or
  `file://research/primary-sources/leaddev-agent-compiled.md`
  §3. Evidence: `cmd://head -20 longread/00-introduction.md`
  shows a quote block or italicised attribution before
  the first body heading.
- T-10: LeadDev citation check. The chapter body MUST
  cite `file://research/primary-sources/leaddev-agent-compiled.md`
  as the prior-art-as-risk anchor for the
  agentic-installation hypothesis. Mechanical evidence
  (existence): `cmd://grep -c
  'research/primary-sources/leaddev-agent-compiled'
  longread/00-introduction.md` returns ≥ 1. Manual
  reviewer judgment (framing): the cite MUST be used
  as the prior-art-as-risk anchor, not a casual
  reference. Pass criterion: the paragraph containing
  the LeadDev cite explicitly contrasts LeadDev's
  risk framing with the methodology's procedure
  framing (substring match of any of {"risk", "framed
  as", "prior art"} within 200 characters of the
  cite).
- T-11: Eight-phase roadmap check. The chapter MUST
  name all **eight** ordered phase chapters (Phase 0
  + Phases 1-7 — chapters 01 through 08) in a single
  contiguous roadmap section. Pass criterion
  (mechanical, narrow): each of the literal tokens
  `Phase 0`, `Phase 1`, `Phase 2`, `Phase 3`,
  `Phase 4`, `Phase 5`, `Phase 6`, `Phase 7` appears
  at least once and at most twice in the chapter
  (counted as literal occurrences, not matching
  lines). Mechanical evidence: the helper script
  `file://scripts/check-chapter-00-phase-roadmap.sh`
  (authored under this Task) exits 0 iff all eight
  tokens are present with literal-occurrence counts
  in [1, 2] AND their first occurrences appear in
  ascending order AND the first and last
  first-occurrence positions are within 1500
  characters of each other (≈ 250-word window). The
  script is invoked as part of `acceptance_commands`.
  Pass criterion (manual reviewer): each roadmap
  entry uses or paraphrases the §6.1 phase title for
  that chapter (e.g. Phase 0 entry mentions "maturity
  check"; Phase 1 entry mentions "facet inventory";
  etc.) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1. The helper script does not enforce phase
  titles; the §6.1-title check is reviewer-judgment.
- T-12: Reader-contract check, anchored on the parent
  Decision SPEC at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 (Product B shape: case-study + procedure +
  posture). The chapter MUST state the reader contract
  using three named clauses:
  1. **Honest experience, not prescription** — explicit
     statement that the longread reports what BES did
     and learned, not what other teams MUST do.
  2. **Failure modes are first-class** — explicit
     statement that the seven open research questions
     and per-phase failure notes are content, not
     errata.
  3. **Corpus-citation discipline** — explicit
     statement that methodology primitives cite the
     primary-source corpus.
  Pass criterion (mechanical existence): each of the
  three clauses MUST match at least one of its
  permitted anchors. Mechanical evidence:
  `cmd://grep -iqE 'honest experience|not prescription' longread/00-introduction.md &&
   grep -iqE 'failure mode|first-class' longread/00-introduction.md &&
   grep -iqE 'corpus|citation discipline' longread/00-introduction.md`
  exits 0. Pass criterion (manual reviewer): the
  three clauses function as named clauses, not buried
  in unrelated prose.
- T-13: Forward-pointer check. The chapter MUST end
  with a "**In the next chapter**:" pointer to chapter
  01 (Phase 0 maturity check). Evidence:
  `cmd://tail -10 longread/00-introduction.md` shows
  the literal `**In the next chapter**:` token followed
  by a sentence referencing chapter 01 / Phase 0.

## 14. Acceptance Criteria

- [ ] AC-1: `longread/00-introduction.md` exists at the
      expected path.
- [ ] AC-2: Word count is in [800, 1100] prose words.
- [ ] AC-3: `validate-longread-structure.sh` reports
      chapter 00 at ≥ 50 prose words (in-progress mode).
- [ ] AC-4: `lint-spec.sh` on this SPEC exits 0.
- [ ] AC-5: T-5 citation discipline check passes (manual).
- [ ] AC-6: T-6 voice contract check passes (manual).
- [ ] AC-7: T-7 commit-hygiene check passes (commit
      conforms to Conventional Commits + no AI
      attribution trailer).
- [ ] AC-8: T-8 Completion Report fills check passes
      (§17.1-§17.5 non-empty).
- [ ] AC-9: T-9 epigraph check passes (chapter opens
      with owner-transcript or LeadDev §3 quote).
- [ ] AC-10: T-10 LeadDev citation check passes (≥ 1
      cite of leaddev-agent-compiled.md).
- [ ] AC-11: T-11 eight-phase roadmap check passes
      (Phase 0-7 named in a contiguous roadmap).
- [ ] AC-12: T-12 reader-contract check passes (three
      contract clauses present as named statements).
- [ ] AC-13: T-13 forward-pointer check passes
      ("**In the next chapter**:" → chapter 01 / Phase 0).

## 15. Rollback Plan

If the chapter prose proves wrong-shape after authoring:

1. Revert the chapter-introducing commit with `git
   revert`; the SPEC stays in draft / needs-revision.
2. Revise this Task SPEC to address the shape issue.
3. Re-author the chapter from the revised SPEC.

If a single sentence or paragraph needs adjustment
post-verify: amend in-place via a small `fix(chapter-
00):` commit; no SPEC revision needed.

## 16. Open Questions

- [ ] Q1: Epigraph choice — owner transcript (rolls-
      royce directive) vs. Kruger patching quote from
      LeadDev §3 vs. a synthesis. Default: Kruger
      quote, because it grounds the chapter in the
      published prior-art risk framing the methodology
      publishes as procedure. Not owner-blocking; can
      revise in-place after authoring if the chosen
      epigraph reads wrong.
- [ ] Q2: Reader roadmap density — one-sentence per
      phase chapter (8 sentences) vs. one-paragraph
      per chapter. Default: one-sentence to keep the
      introduction under budget. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`; both can be
adjusted in-place during authoring or post-verify.

## 17. Completion Report

### 17.1 Files changed

- `longread/00-introduction.md` (new, 842 prose words).
- `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  (status flip draft → in-execution → verified;
  Completion Report fills).

### 17.2 Commands run

- `cmd://bash scripts/lint-spec.sh
  specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  → 0 errors, 0 warnings, 48 citation hits.
- `cmd://test -f longread/00-introduction.md` → exit 0.
- `cmd://bash scripts/validate-longread-structure.sh` →
  PASS in-progress mode; 1/9 chapters present;
  total=842 prose words; 8 deferred-chapter warnings.
- `cmd://bash scripts/validate-longread-structure.sh
  --chapter 00` → PASS chapter-strict; 842 prose words
  in [800, 1100].
- `cmd://bash scripts/check-chapter-00-phase-roadmap.sh`
  → PASS; all 8 phase tokens present, ascending,
  within 1500-char window.
- T-10 mechanical check: `cmd://grep -c
  'research/primary-sources/leaddev-agent-compiled'
  longread/00-introduction.md` → 3 occurrences.
- T-12 mechanical check: all three OR-anchor regex
  groups present (`grep -iqE` chain exited 0).
- T-13 mechanical check: `cmd://tail -3
  longread/00-introduction.md | grep -E '\*\*In the
  next chapter\*\*:'` → matches.

### 17.3 Verification result

All 13 acceptance criteria PASS.

Manual reviewer checks (T-5, T-6, T-10 framing
manual portion, T-11 §6.1 title coverage manual
portion, T-12 named-clauses manual portion) confirmed
by the executing agent during authoring:

- T-5: methodology primitives in chapter 00 cite
  only `research/primary-sources/leaddev-agent-compiled.md`
  §3 (corpus); the BES-experiential / posture
  statements cite `owner://transcript-2026-05-18`;
  Product B shape statements cite the research
  workpad §2.3 + the parent Decision §7 binding.
- T-6: first-person experiential voice dominates
  ("We shipped", "we did", "we report"); no third-
  person methodology-vendor voice; no passive voice
  for studio actions; chapter explicitly says it
  does not resolve the seven open research questions.
- T-10 manual framing portion: the LeadDev quote +
  cite are used as the prior-art-as-risk anchor in
  §1 "The hypothesis" with explicit contrast — the
  paragraph immediately after the epigraph contains
  the substring "framed exactly this shape as risk"
  and "treated it as a procedure to be done well".
- T-11 manual §6.1 title coverage: each roadmap entry
  in §6 includes the corresponding §6.1 phase title
  (e.g. Phase 0 → "maturity check"; Phase 1 → "facet
  inventory"; etc.).
- T-12 manual named-clauses: the reader-contract
  section uses bold-emphasis named clauses
  ("**honest experience, not prescription**",
  "**failure modes are first-class content**",
  "**corpus-citation discipline**") — not buried in
  prose.

### 17.4 Residual risk

- The chapter epigraph quotes Lukaas Kruger from
  LeadDev §3 verbatim. If the LeadDev article URL
  ever moves or the article is edited, the
  corpus entry retains the quote at
  `research/primary-sources/leaddev-agent-compiled.md`
  §3 — but the chapter prose only cites the corpus
  entry, not the URL, so this is resilient.
- The chapter says "a small studio shipping a
  portfolio of products" rather than naming products.
  Subsequent chapters (01-08) will increase BES
  attribution density per §6.6 of the longread
  Contract; chapter 00 is deliberately frame-light.
- The mechanical helpers (`check-chapter-00-phase-roadmap.sh`,
  `validate-longread-structure.sh --chapter 00`) do
  not verify §6.1 phase title paraphrase quality;
  that's a T-11 manual reviewer concern documented
  in the Task SPEC.

### 17.5 Spec evidence candidates

- **The per-chapter Task SPEC pattern works.** Five
  rounds of codex cross-family review (R1-R5) plus
  helper-script authoring produced a SPEC + chapter
  pair where every claim in the SPEC is mechanically
  checkable, the validator + Contract + Task agree
  on semantics, and the chapter prose conforms to
  thirteen Acceptance Criteria of which eight are
  mechanically machine-verifiable.
- **Cross-family review converges faster on Task
  SPECs than on Contract SPECs.** Trajectory R1
  (7 findings) → R2 (4) → R3 (4) → R4 (1) → R5 (0)
  is 5 rounds. The parent Decision + corpus +
  v2.0 repack Contracts required 6 rounds in the
  prior arc. Per-chapter Task SPECs have smaller
  surface; smaller surface converges faster.
- **Helper scripts pay for themselves.** Authoring
  `check-chapter-00-phase-roadmap.sh` cost one R4
  round of findings-then-fix; the script is now
  reusable for chapters 01-08 with minor parameter
  changes. Without the helper, T-11 evidence was a
  bash one-liner that R3 codex tore apart for
  hidden ambiguity.
- **Path-base normalization needs schema clarification.**
  R1-R3 spent material review cycles on
  spec-dir-relative vs repo-root vs sibling-repo
  `file://` cite patterns. The repo's `schema/SPEC.schema.md`
  says "repo-relative or absolute" but is silent on
  the sibling-repo case. Candidate v2 SPEC: clarify
  the sibling-repo cite convention
  (`file://../<sibling>/...`) and add a mechanical
  reachability check to lint-spec.sh.
