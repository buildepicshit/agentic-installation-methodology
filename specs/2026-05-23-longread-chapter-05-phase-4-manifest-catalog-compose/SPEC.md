---
id: 2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose
status: verified
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md
  - test -f longread/05-phase-4-manifest-catalog-compose.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 05
  - bash scripts/check-chapter-05-phase-4-anchors.sh
  - bash scripts/check-chapter-05-failure-note.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/05-phase-4-manifest-catalog-compose.md
word_budget_target: 1200
word_budget_max: 1500
---

# SPEC: Longread chapter 05 — Phase 4 Manifest + Catalog Compose

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 05 as the
Phase 4 chapter: "Composing the front-door manifest +
per-facet sub-specs." Chapters 00-04 are at status:
closed. Per
`file://specs/2026-05-20-longread-structure/SPEC.md`
§7.1, chapter 05 follows chapter 04. This Task SPEC
authors that chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 05 is the methodology's composition chapter.
By its end, the reader knows what Phase 4 produces
(front-door manifest + per-facet sub-specs), what
artefact-shape choices Phase 4 makes (structured data,
prose, executable, diagram per workpad §6), where BES
landed (Product A v2.0 manifest+catalog per workpad
§7), and what Phase 4 failure honestly discloses
(conformance facet shipped `reserved` per chapter 01
prior disclosure).

## 3. Goals

- Author
  `longread/05-phase-4-manifest-catalog-compose.md` at
  target 1 200 words (advisory under soft-floors); max
  1 500 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Include the composition question framing (Phase 0-3
  closed; what does Phase 4 actually produce?). The
  chapter SHOULD open with this question per the §9
  RECOMMENDED structure; the acceptance gate enforces
  presence anywhere in the chapter, not position.
- Cover the four artefact shapes per research workpad
  §6 Phase 4: structured data, prose, executable,
  diagram.
- Cite at least one corpus entry per artefact shape:
  structured data
  (`file://research/primary-sources/helm-values-schema.md`
  §3); prose
  (`file://research/primary-sources/arc42.md` §3);
  executable
  (`file://research/primary-sources/cucumber-gherkin.md`
  §3); diagram
  (`file://research/primary-sources/c4-model.md` §3 or
  `file://research/primary-sources/structurizr-dsl.md`
  §3).
- Cover the manifest-as-front-door pattern via
  `file://research/primary-sources/oci-artifacts.md` §3
  (REQUIRED).
  `file://research/primary-sources/spec-kit.md` §3 MAY
  be cited as supporting frame but is NOT required by
  the acceptance gate (per T-06 R3 F2 closure — what
  the helper enforces matches what §8 requires).
- Cover where BES landed per workpad
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 (Product A v2.0 IS the worked example). The
  chapter MUST NOT claim chapters 01 + 02 established
  eight facets — chapter 02 established seven per
  workpad §6 Phase 1. Any reference to facet count
  beyond seven must cite a separate authority.
- Include a Phase 4 failure-mode note in the §6.5
  three-element structure with strict fact-vs-synthesis
  separation as the chapter's penultimate section.
- End with "**In the next chapter**:" forward pointer
  to chapter 06 (Phase 5 cross-family validation).
- Author WITHOUT padding-for-budget AND WITHOUT over-
  attribution beyond cited authority.

## 4. Non-Goals

- Authoring chapter 06-08 content.
- Defining the cross-family validation pass (chapter
  06).
- Specifying Product A's full manifest schema or facet
  contents in detail (the chapter references workpad
  + chapters 01 + 02 prior establishment; details
  belong to Product A's own repo).
- Resolving open research questions.

## 5. Current System Facts

- Chapters 00-04 are at status: closed
  (`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  through
  `file://specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`).
- Validator at
  `file://scripts/validate-longread-structure.sh`
  chapter-strict mode enforces 1 500 max for chapter
  05; 1 200 target is advisory.
- Phase 4-relevant corpus entries
  (`file://research/primary-sources/oci-artifacts.md`,
  `file://research/primary-sources/arc42.md`,
  `file://research/primary-sources/c4-model.md`,
  `file://research/primary-sources/structurizr-dsl.md`,
  `file://research/primary-sources/spec-kit.md`,
  `file://research/primary-sources/helm-values-schema.md`,
  `file://research/primary-sources/cucumber-gherkin.md`)
  primary-read-complete per
  `file://research/primary-sources/INDEX.md`.
- Research workpad
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 4 names manifest+catalog pattern + four
  artefact shapes; §7 records "Product A IS the
  worked example."
- Chapter 01 at
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  established the conformance-reserved disclosure. Chapter
  02 (facet inventory) at
  `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
  established the seven facets per workpad §6 Phase 1
  (Architecture, Deployment, Behavior, Customization,
  Decisions, Operations, Non-goals). Chapter 04
  (sanitization + asymmetry) at
  `file://specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`
  established the Product A v2.0 reference (manifest+
  catalog name) + the Product-A-vs-Product-B
  sanitization asymmetry. Chapter 05 MUST NOT claim
  chapters 01 + 02 established eight facets; if
  Product A v2.0 ships an additional facet beyond the
  workpad-named seven, that fact must be cited from a
  separate authority (Product A's own repo) rather
  than from the prior chapters.

## 6. Authority Map

Active authority:
- Longread Contract at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  (in-execution).
- Parent Decision §7 + §14.0 soft-floors at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
- Research workpad §6 Phase 4 + §7 BES at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`.
- Verified primary-source corpus at
  `file://research/primary-sources/`.
- Chapter 00-04 closures at
  `file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  through
  `file://specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md`.
- `file://schema/SPEC.schema.md` — citation grammar.

Stale, superseded, or evidence-only:
- None for this slice.

Owner decisions required before implementation:
- [ ] Approve this Task SPEC.

## 7. Code/Docs Reality Check

- Soft-floors regime in effect per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Paragraph-co-occurrence anchor pattern + explicit-
  bold-marker failure-note pattern proven at
  `file://scripts/check-chapter-04-phase-3-anchors.sh`
  + `file://scripts/check-chapter-04-failure-note.sh`.
- Strict fact-vs-synthesis discipline established
  through chapters 02-04 prose-codex passes (latest at
  `file://reviews/codex-2026-05-23-chapter-04-r2/REVIEW.md`).
- Workpad-vs-corpus attribution asymmetry pattern per
  chapter 03 prose R1 lesson at
  `file://reviews/codex-2026-05-22-chapter-03/REVIEW.md`
  (workpad framing cannot be smuggled in as corpus
  authority).

## 8. Desired Behavior

After this Task executes:

- A file
  `longread/05-phase-4-manifest-catalog-compose.md`
  MUST exist with prose content at or below 1 500
  words.
- The chapter MUST include the composition-question
  framing (Phase 0-3 closed; Phase 4 produces what?).
  The chapter SHOULD open with this; the acceptance
  gate verifies presence, not position.
- The chapter MUST cover all four artefact shapes per
  research workpad §6 Phase 4: structured data, prose,
  executable, diagram.
- The chapter MUST cite at least one corpus entry per
  shape (above list).
- The chapter MUST cite the manifest-as-front-door
  pattern via `oci-artifacts.md` §3.
- The chapter MUST cover where BES landed per workpad
  §7 (Product A v2.0 worked example), referencing the
  prior establishment of the seven facets + conformance-
  reserved disclosure from chapter 01.
- The chapter MUST include a Phase 4 failure-mode note
  in the §6.5 three-element structure as the chapter's
  penultimate section.
- The chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 06.
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT pad for word budget.
- The chapter MUST NOT make Product-A or Product-B
  case-study claims beyond the cited authority set:
  primary-source corpus (for methodology primitives);
  workpad §6 + §7 (for phase taxonomy + BES
  disposition); parent Decision §7 (for Product B
  shape + attribution); chapter 01 (for conformance-
  reserved disclosure); chapter 02 (for the seven
  facets); chapter 04 (for the Product A v2.0
  manifest+catalog reference + the Product-A-vs-
  Product-B sanitization asymmetry).

## 9. Domain Model / Contract

Recommended section structure (target ~1 200 words;
not enforced as floor):

1. **The composition question** (~150 w). What
   Phase 4 produces given Phase 0-3 outputs.
2. **The four artefact shapes** (~300 w). Per workpad
   §6: structured data (helm-values-schema §3); prose
   (arc42 §3); executable (cucumber-gherkin §3);
   diagram (c4-model §3 + structurizr-dsl §3).
3. **The manifest as front door** (~250 w). Cite
   oci-artifacts §3 (REQUIRED). May also cite
   spec-kit §3 as supporting frame (OPTIONAL).
4. **Where BES landed** (~300 w). Product A v2.0 per
   workpad §7. Reference the seven facets + conformance-
   reserved per chapters 01 + 02 prior establishment.
   The chapter MUST NOT add new Product A specifics
   beyond what those prior chapters established.
5. **Phase 4 failure-mode note** (~200 w; penultimate
   per §6.5). Strict fact-vs-synthesis:
   - **What happened** (workpad-grounded): workpad §7
     records Product A v2.0 as the worked example;
     chapter 01 records that the conformance
     facet shipped `reserved`.
   - **What we did** (workpad-grounded): composed the
     manifest + per-facet sub-spec catalog; disclosed
     the reserved-conformance gap rather than hiding
     it.
   - **What pattern generalizes**
     (`judgment://agent-synthesis`; NOT workpad-
     proven): a manifest+catalog that discloses a
     reserved facet is closer to honest than a
     manifest that ships every facet as superficially
     complete.
6. **Forward pointer** (~50 w). To chapter 06 / Phase
   5 / cross-family validation.

## 10. Interfaces and Files

Owned files (written by this Task):
- `longread/05-phase-4-manifest-catalog-compose.md`.
- `specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`.
- `scripts/check-chapter-05-phase-4-anchors.sh` (new
  helper; paragraph-co-occurrence for composition
  question + four shapes + manifest-front-door + BES
  Product A reference).
- `scripts/check-chapter-05-failure-note.sh` (new
  helper; explicit-bold-markers + agent-synthesis tag
  pattern from chapter 04).

Read-only context:
- All Phase 4-relevant corpus entries (oci-artifacts,
  arc42, c4-model, structurizr-dsl, spec-kit,
  helm-values-schema, cucumber-gherkin).
- `file://specs/2026-05-20-longread-structure/SPEC.md`.
- All chapter 00-04 closures + their prose.
- Research workpad §6 + §7.
- Parent Decision §7 + §14.0.

Out of scope:
- Any edit to chapters 00-04 or any other longread
  chapter.
- Any edit to the longread Contract or corpus.

External effects:
- `cmd://git push` under `branch_policy: main-direct`.

## 11. Execution Plan

1. Read research workpad §6 Phase 4 + §7 Product A
   disposition.
2. Read corpus entries oci-artifacts §3, arc42 §3,
   c4-model §3, structurizr-dsl §3, spec-kit §3,
   helm-values-schema §3, cucumber-gherkin §3.
3. Author the two helper scripts BEFORE chapter
   prose.
4. Draft chapter prose per §9 structure WITHOUT
   padding AND WITHOUT over-attribution.
5. Self-review voice + corpus citation + failure-note
   structure + max word budget + over-attribution
   risk.
6. Run acceptance commands.
7. Stage explicit files; conventional-commits commit;
   push.
8. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other
  longread chapter.
- The Task MUST NOT modify the longread Contract or
  corpus.
- The Task MAY cite internal BES SPEC IDs + transcript
  IDs per Contract §6.6 where they support Phase 4
  failure-mode disclosure; MUST NOT name unrelated BES
  product repos.
- The Task MUST NOT pad-for-budget; MUST NOT make
  Product-A or Product-B case-study claims beyond the
  cited authority set (primary-source corpus; workpad
  §6/§7; parent Decision §7; chapter 01 conformance-
  reserved; chapter 02 seven facets; chapter 04
  Product A v2.0 reference + sanitization asymmetry).
- The Task MUST NOT include AI-attribution trailers in
  commits; MUST NOT use `git add .` / `git add -A`.

## 13. Test Plan

- T-1: `cmd://test -f
  longread/05-phase-4-manifest-catalog-compose.md`
  exits 0.
- T-2: `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 05 ≥ 50 prose words (advisory under
  soft-floors).
- T-3: Chapter 05 word count at or below 1 500
  enforced max; 1 200 target advisory if below.
  Evidence: `cmd://bash
  scripts/validate-longread-structure.sh --chapter 05`.
- T-4: `cmd://bash scripts/lint-spec.sh
  specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  exits 0.
- T-5: Manual reviewer check enforcing corpus-citation
  rule at
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
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  shows §17.1-§17.5 non-empty after verify.
- T-9: Paragraph-co-occurrence anchor coverage.
  Evidence: `cmd://bash
  scripts/check-chapter-05-phase-4-anchors.sh` exits 0
  iff composition-question + four-shapes + manifest-
  front-door + BES-product-A-reference all paragraph-
  co-occur.
- T-10: Corpus citation density ≥ 5 distinct entries
  (chapter 05 is bigger than predecessors; richer
  citation set). Evidence: `cmd://grep -oE
  'research/primary-sources/[a-z0-9-]+\.md'
  longread/05-phase-4-manifest-catalog-compose.md |
  sort -u | wc -l` returns ≥ 5.
- T-11: oci-artifacts anchor present (manifest-front-
  door). Evidence: `cmd://grep -qF
  'research/primary-sources/oci-artifacts.md'
  longread/05-phase-4-manifest-catalog-compose.md`
  exits 0.
- T-12: At least one each of structured-data (helm),
  prose (arc42), executable (cucumber-gherkin), and
  diagram (c4-model OR structurizr-dsl) anchors
  present. Evidence: `cmd://bash
  scripts/check-chapter-05-phase-4-anchors.sh` covers
  this via the four-shapes paragraph-co-occur check.
- T-13: Per-chapter Phase 4 failure-mode note in
  §6.5 three-element structure at penultimate
  position. Evidence: `cmd://bash
  scripts/check-chapter-05-failure-note.sh` exits 0.
- T-14: Forward pointer to chapter 06. Evidence:
  `cmd://tail -5
  longread/05-phase-4-manifest-catalog-compose.md |
  grep -E '\*\*In the next chapter\*\*:'` matches.

## 14. Acceptance Criteria

- [ ] AC-1: chapter file present.
- [ ] AC-2: in-progress validator PASSes.
- [ ] AC-3: chapter-strict validator PASSes (≤ 1 500
      max; 1 200 target advisory).
- [ ] AC-4: SPEC lint exits 0.
- [ ] AC-5: T-5 corpus-citation discipline (manual).
- [ ] AC-6: T-6 voice contract (manual).
- [ ] AC-7: T-7 commit-hygiene.
- [ ] AC-8: T-8 Completion Report fills.
- [ ] AC-9: T-9 paragraph-co-occurrence coverage
      (helper PASS).
- [ ] AC-10: T-10 ≥ 5 distinct corpus citations.
- [ ] AC-11: T-11 oci-artifacts anchor present.
- [ ] AC-12: T-12 four-shapes coverage (covered by
      T-9 helper).
- [ ] AC-13: T-13 three-element failure note at
      penultimate position (helper PASS).
- [ ] AC-14: T-14 forward pointer to chapter 06.

## 15. Rollback Plan

If chapter prose wrong-shape: revert, revise this
SPEC, re-author. If single-sentence adjustment post-
verify: amend via `fix(chapter-05):` commit +
Amendment Log §17.0 entry.

## 16. Open Questions

- [ ] Q1: Concreteness of Product A v2.0 reference.
      Default: name v2.0 + the seven facets + conformance-
      reserved per workpad + chapter 01 prior
      establishment; do not enumerate specific facet
      content beyond what those prior chapters
      already cited. Not owner-blocking.
- [ ] Q2: OCI vs spec-kit framing emphasis. Default per
      T-06 R3 F2 closure: OCI for manifest+layers shape
      is REQUIRED; spec-kit MAY be cited as supporting
      frame for the spec-as-deployment-grade
      abstraction but is NOT required by the acceptance
      gate. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.0 Amendment Log

- **Amendment 1** (this commit, 2026-05-23): Chapter
  prose trimmed per codex chapter-05 prose R1 (1 MAJOR
  — Product A v2.0 details attributed to chapter 04
  instead of parent Decision §7). Rewrite cited parent
  Decision §7 explicitly for v2.0/manifest binding;
  narrowed workpad §7 quote to "Product A is the
  worked example" (no v2.0); narrowed chapter 04 ref
  to sanitization asymmetry only. Chapter post-fix:
  789 prose words (initial 749). See
  `file://reviews/codex-2026-05-23-chapter-05/REVIEW.md`
  for R1 +
  `file://reviews/codex-2026-05-23-chapter-05-r2/REVIEW.md`
  for R2 CONVERGENCE-PASS.

### 17.1 Files changed

- `longread/05-phase-4-manifest-catalog-compose.md` (new;
  789 prose words after Amendment 1; 749 at initial).
  Below advisory target 1 200; below enforced max
  1 500. Soft-floors accepts.
- `specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  (status: draft → in-execution → verified; §17 fills).
- `scripts/check-chapter-05-phase-4-anchors.sh` (new
  helper; paragraph-co-occurrence with corpus file
  path requirement per T-06 R1 F2 closure).
- `scripts/check-chapter-05-failure-note.sh` (new
  helper; explicit bold markers + agent-synthesis tag).

### 17.2 Commands run

- `bash scripts/lint-spec.sh
  specs/.../SPEC.md` → 0 errors, 0 warnings.
- `test -f longread/05-phase-4-manifest-catalog-compose.md`
  → exit 0.
- `bash scripts/validate-longread-structure.sh` → PASS
  in-progress; 6/9 chapters present; total prose words
  ~4 342 (current).
- `bash scripts/validate-longread-structure.sh
  --chapter 05` → PASS chapter-strict; 789 prose words
  (max 1 500); below advisory target 1 200.
- `bash scripts/check-chapter-05-phase-4-anchors.sh` →
  PASS.
- `bash scripts/check-chapter-05-failure-note.sh` →
  PASS.
- T-10: 6 distinct corpus citations (helm-values-schema,
  arc42, cucumber-gherkin, c4-model, structurizr-dsl,
  oci-artifacts).
- T-11: oci-artifacts cited (with "front door" in same
  paragraph per helper).
- T-14: forward pointer present, references chapter 06
  / Phase 5 / cross-family validation.

### 17.3 Verification result

All 14 acceptance criteria PASS.

Manual reviewer checks (current, post-Amendment 1):

- T-5 corpus-citation discipline: every methodology
  primitive (four artefact shapes, manifest-as-front-
  door pattern) cites a corpus entry per paragraph-co-
  occurrence helper. Parent Decision §7 cited for
  Product A v2.0 + manifest+catalog binding. Workpad
  cites limited to Phase 4 substance + worked-example
  disposition. Chapter 04 ref limited to sanitization
  asymmetry per R1 closure. Chapter 01 cited for
  conformance-reserved.
- T-6 voice: first-person experiential ("we compose,"
  "we adopt"); no third-person methodology-vendor
  voice; no passive voice for studio actions.
- Failure-note quality (post-Amendment 1): E1 + E2
  strictly workpad + parent Decision + chapter 01
  grounded. E3 explicitly `judgment://agent-synthesis`
  tagged. The disclosure-vs-omission generalization is
  agent-synthesis, not workpad-proven.

### 17.4 Residual risk

- Chapter 05 at 789 prose words is fourth consecutive
  sub-target chapter (chapter 02 at 573; chapter 03
  at 595; chapter 04 at 617; chapter 05 at 789). Soft-
  floors regime continues to accept; no padding-for-
  budget surfaced.
- Authority-fence pattern in T-06 SPEC took 6 codex
  rounds to converge. The class of issue ("wording
  that omits one allowed authority source") generated
  R2-R5 iterations. R6 closed via an explicit
  authority-source-list block. This pattern is durable
  enough to warrant explicit template scaffolding for
  T-07+ Task SPECs.
- Phase 4 failure-note E3 is `judgment://agent-
  synthesis`; owner sign-off via "approved" flip is
  the validation.

### 17.5 Spec evidence candidates

- **Authority-source asymmetry across chapters is
  the load-bearing complexity of late-phase chapters.**
  Chapter 05 needed to weave together workpad §6
  (Phase 4 definition) + workpad §7 (Product A worked
  example) + parent Decision §7 (v2.0 + manifest+
  catalog binding) + chapter 01 (conformance-reserved)
  + chapter 02 (seven facets) + chapter 04
  (sanitization asymmetry) + 6 distinct corpus
  entries. The cumulative authority count is higher
  than any prior chapter. T-06 SPEC's 6-round
  convergence reflected the difficulty of stating
  the allowed-source set without omitting any.
- **Explicit authority-source-list block pattern.**
  T-06 R6 closed via a single explicit block listing
  every allowed source — "primary-source corpus
  (methodology primitives); workpad §6 + §7 (phase
  taxonomy + BES disposition); parent Decision §7
  (shape + attribution); chapter 01 (conformance);
  chapter 02 (facets); chapter 04 (asymmetry)" —
  referenced from §8 + §12. This pattern is
  templatable; T-07+ Task SPECs should ship with the
  block from the start rather than evolve it through
  codex iterations.
- **Manifest-as-front-door + four-shapes is the
  methodology's structural payload.** Chapter 05 is
  the only chapter so far whose substance is itself
  the published methodology pattern (other chapters
  describe phases; chapter 05 describes the artefact
  the phases produce). The four-shape mapping (helm-
  values-schema, arc42, cucumber-gherkin, c4-model+
  structurizr-dsl) + manifest-as-OCI-analogue is
  potentially the most reusable section of the
  longread for adopters.
- **Soft-floors regime durable through 4 sub-target
  chapters in a row.** Chapter 02 (573) + 03 (595) +
  04 (617) + 05 (789). Even the longest chapter so
  far landed at 789/1200 advisory target without
  padding pressure surfacing. The regime works.
