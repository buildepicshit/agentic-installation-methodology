---
id: 2026-05-22-longread-chapter-03-phase-2-parameterization-surface
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md
  - test -f longread/03-phase-2-parameterization-surface.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 03
  - bash scripts/check-chapter-03-phase-2-anchors.sh
  - bash scripts/check-chapter-03-failure-note.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/03-phase-2-parameterization-surface.md
word_budget_target: 1000
word_budget_max: 1300
---

# SPEC: Longread chapter 03 — Phase 2 Parameterization Surface

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 03 as the
Phase 2 chapter: "What the spec parameterizes vs hard-
codes (the deferral contract)." Chapters 00 + 01 + 02
are at status: closed. Per
`file://specs/2026-05-20-longread-structure/SPEC.md`
§7.1, chapter 03 follows chapter 02. This Task SPEC
authors that chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 03 is the methodology's deferral-contract
chapter. By its end, the reader knows what question
Phase 2 asks (parameterize vs hard-code), what two
prior-art shapes the research workpad names (single-
file vs multi-file), where BES landed (distributed
multi-file per workpad §7), and what Phase 2 failure
generalizes. The chapter sets up Phase 3 (sanitization
bar) which depends on the parameterization surface
being drawn first.

## 3. Goals

- Author `longread/03-phase-2-parameterization-surface.md`
  at target 1 000 words (advisory under the soft-floors
  amendment at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2); maximum 1 300 words (enforced).
- Open with the deferral-contract question.
- Cover the two prior-art shapes per research workpad
  §6 Phase 2 (single-file Symphony WORKFLOW.md; multi-
  file customization catalog).
- Cite at least
  `file://research/primary-sources/symphony-spec.md` §3
  for single-file and at least one of
  `file://research/primary-sources/helm-values-schema.md`
  or `file://research/primary-sources/nix-flakes.md` §3
  for multi-file.
- Cover where BES landed per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 (distributed multi-file).
- Include a Phase 2 failure-mode note in the §6.5
  three-element structure as the chapter's penultimate
  section.
- End with "**In the next chapter**:" forward pointer
  to chapter 04 (Phase 3 sanitization bar) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- Author WITHOUT padding-for-budget AND WITHOUT over-
  attribution to cited authority per chapter 02 R1
  prose finding 1.

## 4. Non-Goals

- Authoring chapter 04-08 content.
- Defining the sanitization bar (that's Phase 3,
  chapter 04).
- Cataloguing every parameterization pattern in prior
  art (chapter 03 names two shapes per workpad, not a
  survey).
- Resolving open research questions.

## 5. Current System Facts

- Chapters 00 + 01 + 02 are at status: closed
  (`file://longread/00-introduction.md`,
  `file://longread/01-phase-0-maturity-check.md`,
  `file://longread/02-phase-1-facet-inventory.md`).
- The longread Contract validator at
  `file://scripts/validate-longread-structure.sh` in
  chapter-strict mode enforces the §6.2 max for chapter
  03 (1 300 words); the 1 000-word target is advisory
  per the soft-floors amendment.
- The primary-source corpus at
  `file://research/primary-sources/` is at v1.1; the
  Phase 2-relevant entries
  (`file://research/primary-sources/symphony-spec.md`,
  `file://research/primary-sources/helm-values-schema.md`,
  `file://research/primary-sources/nix-flakes.md`,
  `file://research/primary-sources/12-factor.md`,
  `file://research/primary-sources/ref-arch-vs-solution-arch.md`)
  are all primary-read-complete per
  `file://research/primary-sources/INDEX.md`.
- Research workpad
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 2 names two shapes; §7 records BES disposition
  as distributed.
- T-01 + T-02 + T-03 closures at
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`,
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`,
  and
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
  established the per-chapter pattern this Task
  inherits, including the soft-floors regime and the
  no-over-attribution prose-codex lesson.

## 6. Authority Map

Active authority:
- Longread Contract SPEC at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution). §6.1 chapter taxonomy; §6.2 word
  budget (soft-floors); §6.3 voice; §6.4 corpus-
  citation; §6.5 three-element failure rule; §6.6
  attribution; §7.1 authoring sequence; §8.1
  forward-pointer.
- Parent Decision at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 + §14.0 soft-floors amendment.
- Research workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 2) + §7 (BES Phase 2 case-study).
- Verified primary-source corpus.
- Chapter 00 / 01 / 02 closures:
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`,
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`,
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`.
- `file://schema/SPEC.schema.md`.

Stale, superseded, or evidence-only:
- None for this slice.

Owner decisions required before implementation:
- [ ] Approve this Task SPEC (flip
      approved-pending-owner → approved).

## 7. Code/Docs Reality Check

- Soft-floors regime per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 in effect.
- No-over-attribution discipline per chapter 02 prose
  R1 closure at
  `file://reviews/codex-2026-05-22-chapter-02/REVIEW.md`:
  chapter 03 stays within cited workpad authority for
  BES claims.
- Helper-script paired-anchor pattern proven at
  `file://scripts/check-chapter-01-phase-0-signals.sh`
  + `file://scripts/check-chapter-02-phase-1-facets.sh`.
- "Codex hung on stdin" gotcha per
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
  §17.5: future codex dispatches append `< /dev/null`
  when piping output.

## 8. Desired Behavior

After this Task executes:

- A file
  `longread/03-phase-2-parameterization-surface.md`
  MUST exist with prose content at or below 1 300
  words per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- The chapter MUST open with the deferral-contract
  question framing (parameterize vs hard-code).
- The chapter MUST cite the single-file shape via
  `file://research/primary-sources/symphony-spec.md` §3.
- The chapter MUST cite the multi-file shape via at
  least one of
  `file://research/primary-sources/helm-values-schema.md`
  or `file://research/primary-sources/nix-flakes.md` §3.
- The chapter MUST describe where BES landed
  (distributed multi-file) per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7, citing the workpad directly. The chapter MUST
  NOT add Product A specifics not supported by the
  cited authority.
- The chapter MUST include a Phase 2 failure-mode note
  in the §6.5 three-element structure as the chapter's
  penultimate section.
- The chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 04 (Phase 3 sanitization
  bar).
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT pad for word budget.

## 9. Domain Model / Contract

Recommended section structure (target ~1 000 words;
not enforced as floor):

1. **The deferral-contract question** (~150 w). Why
   Phase 1's facet inventory is the precondition. Cite
   ref-arch-vs-solution-arch §3 for ownership-split
   frame.
2. **Two prior-art shapes** (~300 w). Single-file
   (Symphony WORKFLOW.md per workpad §6 + symphony-spec
   §3). Multi-file (Helm values.yaml per helm-values-
   schema §3; Nix flake.nix per nix-flakes §3). 12-
   factor §3 for the config-vs-code separation
   principle.
3. **Where BES landed** (~250 w). Cite workpad §7
   directly: "distributed (multiple `fleet-manifest`-
   style configs are needed, not a single one)". No
   claims beyond this anchor.
4. **Phase 2 failure-mode note** (~200 w; penultimate
   per §6.5). Strict fact-vs-synthesis separation per
   chapter 02 R1 closure (`file://reviews/codex-2026-05-22-chapter-02/REVIEW.md`):
   - **What happened** (workpad-grounded only): workpad
     §6 names two shapes (single-file vs multi-file
     catalog); workpad §7 records BES as landing on a
     distributed multi-file surface.
   - **What we did** (workpad-grounded only): accepted
     the distributed shape per workpad §7.
   - **What generalizes**
     (`judgment://agent-synthesis`; NOT
     workpad-proven): the parameterization shape is
     plausibly a downstream consequence of facet-
     inventory shape; the chapter MUST mark this
     explicitly as agent-synthesis, not as case-study
     fact.
5. **Forward pointer** (~30 w).

## 10. Interfaces and Files

Owned files (written by this Task):
- `longread/03-phase-2-parameterization-surface.md`.
- `specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`.
- `scripts/check-chapter-03-phase-2-anchors.sh` (new
  helper: paired-anchor coverage of deferral-contract
  + two prior-art shapes + BES distributed claim).
- `scripts/check-chapter-03-failure-note.sh` (new
  helper: three-element structure + penultimate
  placement).

Read-only context:
- `file://research/primary-sources/symphony-spec.md` §3.
- `file://research/primary-sources/helm-values-schema.md`
  §3.
- `file://research/primary-sources/nix-flakes.md` §3.
- `file://research/primary-sources/12-factor.md` §3.
- `file://research/primary-sources/ref-arch-vs-solution-arch.md`
  §3.
- `file://specs/2026-05-20-longread-structure/SPEC.md`.
- `file://longread/00-introduction.md`,
  `file://longread/01-phase-0-maturity-check.md`,
  `file://longread/02-phase-1-facet-inventory.md`.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 + §7.

Out of scope:
- Any edit to chapters 00-02 or any other longread
  chapter.
- Any edit to the longread Contract or corpus.

External effects:
- `cmd://git push` to the agentic-installation-
  methodology remote on main under
  `branch_policy: main-direct`. Front-matter
  `requires_network: true` reflects this.

## 11. Execution Plan

1. Read research workpad §6 Phase 2 + §7 Phase 2.
2. Read corpus entries symphony-spec §3,
   helm-values-schema §3, nix-flakes §3, 12-factor §3,
   ref-arch-vs-solution-arch §3.
3. Author the two helper scripts BEFORE chapter prose.
4. Draft chapter prose per §9 structure WITHOUT
   padding-for-budget AND WITHOUT over-attribution.
5. Self-review voice + corpus citation + failure-note
   structure + max word budget + over-attribution risk.
6. Run acceptance commands.
7. Stage explicit files; conventional-commits commit;
   push.
8. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other longread
  chapter.
- The Task MUST NOT modify the longread Contract or
  corpus.
- The Task MAY cite internal BES SPEC IDs and
  transcript IDs per Contract §6.6 where they support
  Phase 2 failure-mode disclosure; MUST NOT name
  unrelated BES product repos.
- The Task MUST NOT pad-for-budget; MUST NOT make
  claims beyond cited workpad authority.
- The Task MUST NOT include AI-attribution trailers in
  commits; MUST NOT use `git add .` / `git add -A`.

## 13. Test Plan

- T-1: `cmd://test -f
  longread/03-phase-2-parameterization-surface.md`
  exits 0.
- T-2:
  `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 03 ≥ 50 prose words (in-progress
  per-chapter floor; advisory under soft-floors).
- T-3: Chapter 03 word count is at or below 1 300
  enforced max, with the 1 000 target reported as
  advisory if below. Evidence:
  `cmd://bash scripts/validate-longread-structure.sh --chapter 03`.
- T-4:
  `cmd://bash scripts/lint-spec.sh specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing the corpus-
  citation rule at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4 strictly: every methodology primitive in the
  chapter (deferral-contract concept, single-file vs
  multi-file shape, parameterize-vs-hard-code question)
  MUST cite a corpus entry. Parent / Contract /
  workpad cites only for Product B shape + phase
  taxonomy + the BES-disposition statement.
- T-6: Manual reviewer check against
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3 voice contract.
- T-7: Commit-hygiene per
  `file://../bes-fleet-policy/.claude/hooks/block-ai-attribution.sh`
  and Conventional Commits per
  `file://../bes-fleet-policy/AGENTS.md`. Evidence:
  `cmd://git log -1 --format='%B'` contains no
  AI-attribution trailers.
- T-8: Manual inspection of §17 Completion Report of
  this SPEC shows §17.1-§17.5 non-empty after verify.
- T-9: Paired-anchor coverage of deferral-contract +
  single-file + multi-file + BES-distributed. Evidence:
  `cmd://bash scripts/check-chapter-03-phase-2-anchors.sh`
  exits 0.
- T-10: Corpus citation density. Chapter MUST cite at
  least three distinct primary-source corpus entries.
  Evidence: `cmd://grep -oE
  'research/primary-sources/[a-z0-9-]+\.md'
  longread/03-phase-2-parameterization-surface.md |
  sort -u | wc -l` returns ≥ 3.
- T-11: Symphony anchor for single-file. Evidence:
  `cmd://grep -qF
  'research/primary-sources/symphony-spec.md'
  longread/03-phase-2-parameterization-surface.md`
  exits 0.
- T-12: Multi-file anchor (helm-values-schema OR
  nix-flakes). Evidence:
  `cmd://grep -qF 'research/primary-sources/helm-values-schema.md'
  longread/03-phase-2-parameterization-surface.md ||
  grep -qF 'research/primary-sources/nix-flakes.md'
  longread/03-phase-2-parameterization-surface.md`
  exits 0.
- T-13: Per-chapter Phase 2 failure-mode note in §6.5
  three-element structure at penultimate position.
  Evidence:
  `cmd://bash scripts/check-chapter-03-failure-note.sh`
  exits 0.
- T-14: Forward pointer. Evidence:
  `cmd://tail -5
  longread/03-phase-2-parameterization-surface.md |
  grep -E '\*\*In the next chapter\*\*:'` matches and
  references chapter 04 / Phase 3 / sanitization bar.

## 14. Acceptance Criteria

- [ ] AC-1: chapter file present.
- [ ] AC-2: in-progress validator PASSes.
- [ ] AC-3: chapter-strict validator PASSes (≤ 1 300
      max; target 1 000 advisory).
- [ ] AC-4: SPEC lint exits 0.
- [ ] AC-5: T-5 corpus-citation discipline (manual).
- [ ] AC-6: T-6 voice contract (manual).
- [ ] AC-7: T-7 commit-hygiene.
- [ ] AC-8: T-8 Completion Report fills.
- [ ] AC-9: T-9 paired-anchor coverage (helper PASS).
- [ ] AC-10: T-10 ≥ 3 distinct corpus citations.
- [ ] AC-11: T-11 symphony-spec anchor present.
- [ ] AC-12: T-12 helm-values-schema OR nix-flakes
      anchor present.
- [ ] AC-13: T-13 three-element failure note at
      penultimate position (helper PASS).
- [ ] AC-14: T-14 forward pointer to chapter 04.

## 15. Rollback Plan

If chapter prose wrong-shape after authoring: revert,
revise this SPEC, re-author. If single-sentence
adjustment post-verify: amend via `fix(chapter-03):`
commit + Amendment Log §17.0 entry.

## 16. Open Questions

- [ ] Q1: Concreteness of "what BES landed on". Default
      per chapter 02 R1 closure: stay within cited
      workpad authority. Not owner-blocking.
- [ ] Q2: Two-vs-three prior-art shapes. Default:
      single-file (Symphony) + multi-file (Helm + Nix
      as two flavours); 12-factor as supporting frame
      not a third shape. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.0 Amendment Log

- **Amendment 1** (commit `82d2ca9`, 2026-05-22):
  Chapter prose trimmed per codex chapter-03 prose R1
  review (2 MAJOR findings — Symphony §3 over-attribution
  + failure-note E1 unsupported motive). Symphony
  single-file claim narrowed: chapter cites
  `symphony-spec.md` §3 only for "§5 Workflow
  Specification (Repository Contract)" section name;
  workpad §6 carries the single-file framing. E1
  "hoped for single-file" sentence removed; E1 stays
  workpad-grounded. Chapter post-fix: 595 prose words
  (initial 582). See
  `file://reviews/codex-2026-05-22-chapter-03/REVIEW.md`
  for R1 + `file://reviews/codex-2026-05-22-chapter-03-r2/REVIEW.md`
  for R2 CONVERGENCE-PASS.

### 17.1 Files changed

- `longread/03-phase-2-parameterization-surface.md`
  (new; 595 prose words after Amendment 1; 582 at
  initial). Below advisory target 1 000; below enforced
  max 1 300. Soft-floors accepts.
- `specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`
  (status: draft → in-execution → verified; §17 fills).
- `scripts/check-chapter-03-phase-2-anchors.sh` (new
  helper; paragraph-co-occurrence design).
- `scripts/check-chapter-03-failure-note.sh` (new
  helper; explicit bold markers + agent-synthesis tag).

### 17.2 Commands run

- `cmd://bash scripts/lint-spec.sh
  specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md`
  → 0 errors, 0 warnings.
- `cmd://test -f
  longread/03-phase-2-parameterization-surface.md` →
  exit 0.
- `cmd://bash scripts/validate-longread-structure.sh`
  → PASS in-progress; 4/9 chapters present;
  total=2954 prose words (current).
- `cmd://bash scripts/validate-longread-structure.sh --chapter 03`
  → PASS chapter-strict; 595 prose words (max 1 300);
  below advisory target 1 000.
- `cmd://bash scripts/check-chapter-03-phase-2-anchors.sh`
  → PASS (deferral + single-file + multi-file + BES
  distributed all paragraph-co-occur).
- `cmd://bash scripts/check-chapter-03-failure-note.sh`
  → PASS (explicit bold markers + agent-synthesis tag).
- T-10: 5 distinct corpus citations (12-factor,
  helm-values-schema, nix-flakes, ref-arch-vs-solution-
  arch, symphony-spec).
- T-11: symphony-spec cited.
- T-12: both helm-values-schema AND nix-flakes cited.
- T-14: forward pointer present, references chapter 04
  / Phase 3 / sanitization bar.

### 17.3 Verification result

All 14 acceptance criteria PASS.

Manual reviewer checks (current, post-Amendment 1):

- T-5 corpus-citation discipline: methodology
  primitives cite corpus only. Single-file shape cites
  workpad §6 explicitly for the characterization +
  symphony-spec §3 for the narrower workflow-contract
  section claim. Multi-file shape cites helm-values-
  schema §3 + nix-flakes §3. 12-factor §3 for the
  config-vs-code principle. ref-arch-vs-solution-arch
  §3 for the ownership-split frame. BES distributed
  disposition cites workpad §7 verbatim.
- T-6 voice: first-person experiential ("We worked
  through the facet inventory"; "We accepted the
  distributed shape"; "we worked from both"). No
  third-person methodology-vendor voice.
- Failure-note quality: E1 + E2 strictly workpad-
  grounded. E3 explicitly tagged
  `judgment://agent-synthesis` with "synthesis, not a
  workpad-proven case-study claim" disclaimer.

### 17.4 Residual risk

- Chapter 03 at 595 prose words is well below advisory
  target 1 000. Same pattern as chapter 02 (573).
  Under soft-floors regime this is acceptable; no
  padding-for-budget pressure surfaced.
- Symphony single-file framing leans on workpad
  characterization rather than corpus authority. The
  chapter is honest about this asymmetry per R1 F1
  closure. If a future corpus expansion adds a
  Symphony WORKFLOW.md-specific source, the chapter
  can amend to anchor the claim more strongly.
- The Phase 2 failure note's E3 is `judgment://agent-
  synthesis`; owner sign-off via the "approved" flip
  is the validation. Subsequent chapters may revisit
  the synthesis as more case-study data accumulates.

### 17.5 Spec evidence candidates

- **Corpus-vs-workpad attribution asymmetry**.
  Methodology primitives MUST cite corpus per Contract
  §6.4 — but the research workpad's phase definitions
  often summarize prior-art shapes in ways the corpus
  entries don't literally articulate. Chapter 03 hit
  this with Symphony's WORKFLOW.md framing (workpad
  characterizes; corpus entry §3 has it indirectly via
  the 18-section list). Pattern: cite the workpad for
  the workpad-characterization; cite the corpus for
  what the corpus literally says; do NOT cite the
  corpus for the workpad's gloss of it. This is the
  same shape as chapter 01's Nygard finding (corpus
  supports A; workpad framing says B; chapter must
  separate the two).
- **Helper-script paragraph-co-occurrence design pays
  back**. T-04 R1 finding 2 forced a rewrite of the
  facet/anchor helper from global-grep to paragraph-
  scoped grep. Cost: minutes. Benefit: a chapter that
  scatters keywords without co-occurrence now FAILs
  mechanically rather than passing on false-positive.
  Forward-applicable to chapters 04-08.
- **Explicit bold-marker enforcement for §6.5
  three-element structure** caught vague failure notes
  cleanly. The helper now requires literal
  `**What happened.**` / `**What we did.**` /
  `**What pattern generalizes.**` markers + a
  `judgment://agent-synthesis` tag. A "vague but
  failure-themed" section now FAILs.
- **Soft-floors regime continues to work**. Chapter 03
  at 595 prose words is the second consecutive sub-
  target chapter (chapter 02 at 573). Both authored
  without padding-for-budget pressure.
