---
id: 2026-05-24-longread-chapter-07-phase-6-ship
status: in-execution
type: task
owner: HasNoBeef
ideated_in: specs/2026-05-24-longread-chapter-07-phase-6-ship/IDEA.md
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-24-longread-chapter-07-phase-6-ship/SPEC.md
  - test -f longread/07-phase-6-ship.md
  - bash scripts/validate-longread-structure.sh
  - bash scripts/validate-longread-structure.sh --chapter 07
  - bash scripts/check-chapter-07-phase-6-anchors.sh
  - bash scripts/check-chapter-07-failure-note.sh
cites_contract: 2026-05-20-longread-structure
chapter_file: longread/07-phase-6-ship.md
word_budget_target: 800
word_budget_max: 1000
---

# SPEC: Longread chapter 07 — Phase 6 Ship + Cross-Link + Sign

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`,
and `OPTIONAL` in this document are to be interpreted as
described in RFC 2119 and RFC 8174 when, and only when,
they appear in all capitals.

## 1. Problem

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 07 as the
Phase 6 chapter: "Shipping the SPEC bundle separately;
cross-linking; signing." Chapters 00-06 are at status:
closed. Per
`file://specs/2026-05-20-longread-structure/SPEC.md`
§7.1, chapter 07 follows chapter 06. This Task SPEC
authors that chapter. <!-- lint-ok: no-citation -->

## 2. North Star / Product Promise

Chapter 07 is the methodology's "what does honest
shipping look like" chapter. By its end, the reader
knows what ships where (Product A, Product B,
conformance suite), how each artefact cross-links to
the others, how signing + SBOM provenance fit, and what
current-state gaps get disclosed in the ship itself:
conformance reserved per
`file://longread/01-phase-0-maturity-check.md`; Phase 5
outstanding per
`file://longread/06-phase-5-cross-family-validation.md`.

## 3. Goals

- Author `longread/07-phase-6-ship.md` at target 800
  words (advisory under soft-floors); max 1 000 words
  (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 — second-smallest chapter.
- Include the ship question framing.
- Cover what ships where per research workpad §6 Phase
  6 (Product A standalone + Product B standalone +
  conformance suite as versioned bundle).
- Cover cross-linking (each artefact cites the other;
  articles cite both).
- Cite at least
  `file://research/primary-sources/sigstore-cosign.md`
  §3 for signing AND
  `file://research/primary-sources/oci-artifacts.md` §3
  for versioned-bundle shape.
- Cite at least
  `file://research/primary-sources/cyclonedx-sbom.md`
  §3 for SBOM/provenance OR
  `file://research/primary-sources/spec-kit.md` §3 for
  spec-as-deployment-grade.
- Cover where BES landed per
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 ("paired release of Product A and Product B").
- Include current-state honesty: conformance reserved
  per chapter 01, Phase 5 outstanding per chapter 06.
- Include a Phase 6 failure-mode note in §6.5 three-
  element structure as the chapter's penultimate
  section.
- End with "**In the next chapter**:" forward pointer
  to chapter 08 (Phase 7 failure modes as content).
- Author WITHOUT padding-for-budget AND WITHOUT over-
  attribution beyond the §6 authority-source list.

## 4. Non-Goals

- Authoring chapter 08 content.
- Prescribing specific cosign / cdxgen / cyclonedx-cli
  commands (methodology pattern not installer
  checklist).
- Catalog of distribution channels (GitHub, OCI
  registries, etc.).
- Resolving open research questions.

## 5. Current System Facts

- Chapters 00-06 are at status: closed
  (`file://specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
  through
  `file://specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`).
- Validator at
  `file://scripts/validate-longread-structure.sh`
  chapter-strict mode enforces 1 000 max for chapter
  07; 800 target advisory.
- Phase 6-relevant corpus entries primary-read-complete
  per `file://research/primary-sources/INDEX.md`.
- Research workpad at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 Phase 6 + §7 BES disposition.
- Parent Decision §7 at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  paired-release + signature binding.
- Chapter 01 conformance-reserved disclosure at
  `file://longread/01-phase-0-maturity-check.md`.
- Chapter 04 Product A / Product B asymmetry at
  `file://longread/04-phase-3-sanitization-bar.md`.
- Chapter 06 Phase 5 outstanding-gate disclosure at
  `file://longread/06-phase-5-cross-family-validation.md`.

## 6. Authority Map

Chapter 07 MAY cite the following authorities for
methodology-primitive and case-study claims. Any
claim beyond this set is over-attribution. <!-- lint-ok: no-citation -->

- **Primary-source corpus** at
  `file://research/primary-sources/`: methodology
  primitives (paired-release shape, signing pattern,
  SBOM provenance, versioned-bundle shape, spec-as-
  deployment-grade).
- **Workpad §6 + §7** at
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`:
  Phase 6 definition + BES Phase 6 disposition.
- **Parent Decision §7** at
  `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`:
  paired-release + signature + Product B shape +
  attribution.
- **Chapter 01** at
  `file://longread/01-phase-0-maturity-check.md`:
  conformance-reserved disclosure.
- **Chapter 04** at
  `file://longread/04-phase-3-sanitization-bar.md`:
  Product A / Product B sanitization asymmetry.
- **Chapter 06** at
  `file://longread/06-phase-5-cross-family-validation.md`:
  Phase 5 cross-family outstanding gate.

## 7. Code/Docs Reality Check

- Soft-floors regime in effect per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- Paragraph-co-occurrence anchor pattern + explicit-
  bold-marker failure-note pattern proven across
  chapters 03-06 (latest at
  `file://reviews/codex-2026-05-23-chapter-06-r3/REVIEW.md`).
- Authority-source-list block in §6 from start per
  T-06 R6 lesson at
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  §17.5; §6 NOT renumbered per T-07 lesson at
  `file://specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`
  §17.5.

## 8. Desired Behavior

After this Task executes:

- A file `longread/07-phase-6-ship.md` MUST exist
  with prose content at or below 1 000 words.
- The chapter MUST include the ship-question framing.
- The chapter MUST cover the three shippable artefacts
  per workpad §6 Phase 6 (Product A + Product B +
  conformance suite as versioned bundle).
- The chapter MUST cover cross-linking (each cites
  the other).
- The chapter MUST cite
  `file://research/primary-sources/sigstore-cosign.md`
  §3 for signing.
- The chapter MUST cite
  `file://research/primary-sources/oci-artifacts.md`
  §3 for versioned-bundle shape.
- The chapter MUST cite at least one of
  `file://research/primary-sources/cyclonedx-sbom.md`
  §3 OR
  `file://research/primary-sources/spec-kit.md` §3.
- The chapter MUST cover where BES landed per workpad
  `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7 ("paired release of Product A and Product B").
- The chapter MUST surface the current-state honesty
  notes (conformance reserved per chapter 01; Phase 5
  outstanding per chapter 06).
- The chapter MUST include a Phase 6 failure-mode
  note in §6.5 three-element structure as the
  penultimate section, with strict fact-vs-synthesis
  separation.
- The chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 08.
- The chapter MUST conform to §6.3 voice contract.
- The chapter MUST NOT pad for word budget.
- The chapter MUST NOT make Product-A or Product-B
  case-study claims beyond the §6 authority-source
  list.
- The chapter MUST NOT prescribe specific signing /
  SBOM commands (pattern not checklist).

## 9. Domain Model / Contract

Recommended section structure (target ~800 words):

1. **The ship question** (~100 w). With Phase 0-5
   done, what does Phase 6 ship? Cite spec-kit §3 OR
   workpad §6 framing.
2. **What ships where** (~250 w). Per workpad §6:
   Product A standalone + Product B standalone +
   conformance suite as versioned bundle. Cite
   oci-artifacts §3 for the versioned-bundle shape.
3. **Cross-linking** (~150 w). Each artefact cites
   the other; articles cite both. Per workpad §6.
4. **Signing + provenance** (~200 w). Cite
   sigstore-cosign §3 for signing pattern + cyclonedx-
   sbom §3 for SBOM provenance.
5. **Phase 6 failure note** (~150 w; penultimate per
   §6.5). Strict fact-vs-synthesis:
   - **What happened** (workpad-grounded): workpad
     §7 records BES Phase 6 as "paired release of
     Product A and Product B."
   - **What we did** (workpad + Decision + chapter
     grounded): parent Decision §7 binds the paired
     Product A v2.0 / Product B v1.0 release shape;
     Product B remains in flight (this longread).
     Conformance suite reserved per chapter 01; Phase
     5 cross-family pass outstanding per chapter 06.
     The chapter MUST NOT claim Product A v2.0 has
     shipped without a current-state citable
     authority (parent Decision binds shape, not
     state).
   - **What pattern generalizes**
     (`judgment://agent-synthesis`; NOT workpad-proven):
     ship-with-disclosure beats ship-with-hidden-gaps;
     the paired-artefact shape with explicit
     reserved/outstanding flags operationalises
     that posture.
6. **Forward pointer** (~30 w). To chapter 08 / Phase
   7 / failure modes as first-class content.

## 10. Interfaces and Files

Owned files (written by this Task):
- `longread/07-phase-6-ship.md`.
- `specs/2026-05-24-longread-chapter-07-phase-6-ship/SPEC.md`.
- `scripts/check-chapter-07-phase-6-anchors.sh` (new
  helper; paragraph-co-occurrence with corpus file
  paths).
- `scripts/check-chapter-07-failure-note.sh` (new
  helper; explicit bold markers + agent-synthesis tag).

Read-only context: §6 authority-source list +
chapters 00-06 + longread Contract + corpus.

Out of scope: any edit to chapters 00-06, Contract,
or corpus.

External effects: `cmd://git push` under
`branch_policy: main-direct`.

## 11. Execution Plan

1. Read research workpad §6 Phase 6 + §7 BES
   disposition.
2. Read parent Decision §7 paired-release + signature
   binding.
3. Read corpus entries sigstore-cosign §3, oci-
   artifacts §3, cyclonedx-sbom §3, spec-kit §3.
4. Read chapters 01 + 04 + 06 cross-reference
   anchors.
5. Author the two helper scripts BEFORE chapter prose.
6. Draft chapter prose per §9 structure WITHOUT
   padding AND WITHOUT over-attribution beyond §6
   authority-source list.
7. Self-review.
8. Run acceptance commands.
9. Stage explicit files; conventional commits; push.
10. Fill Completion Report §17.

## 12. Safety / Scope Invariants

- The Task MUST NOT author or modify any other
  longread chapter.
- The Task MUST NOT modify the longread Contract or
  corpus.
- The Task MAY cite internal BES SPEC IDs +
  transcript IDs per Contract §6.6 where they support
  Phase 6 failure-mode disclosure; MUST NOT name
  unrelated BES product repos.
- The Task MUST NOT make Product-A or Product-B
  case-study claims beyond the §6 authority-source
  list.
- The Task MUST NOT prescribe specific signing /
  SBOM commands.
- The Task MUST NOT include AI-attribution trailers
  in commits; MUST NOT use `git add .` / `git add -A`.

## 13. Test Plan

- T-1: `cmd://test -f longread/07-phase-6-ship.md`
  exits 0.
- T-2: `cmd://bash scripts/validate-longread-structure.sh`
  reports chapter 07 ≥ 50 prose words.
- T-3: Chapter 07 word count at or below 1 000; 800
  target advisory. Evidence:
  `cmd://bash scripts/validate-longread-structure.sh --chapter 07`.
- T-4: `cmd://bash scripts/lint-spec.sh specs/2026-05-24-longread-chapter-07-phase-6-ship/SPEC.md`
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
  `file://specs/2026-05-24-longread-chapter-07-phase-6-ship/SPEC.md`
  shows §17.1-§17.5 non-empty after verify.
- T-9: Paragraph-co-occurrence anchor coverage.
  Evidence: `cmd://bash scripts/check-chapter-07-phase-6-anchors.sh`
  exits 0 iff ship-question + three-artefacts +
  cross-linking + signing + SBOM + BES-paired-release
  all paragraph-co-occur with corpus/authority file
  paths.
- T-10: Corpus citation density ≥ 3 distinct entries.
  Evidence: `cmd://grep -oE 'research/primary-sources/[a-z0-9-]+\.md'
  longread/07-phase-6-ship.md | sort -u | wc -l`
  returns ≥ 3.
- T-11: sigstore-cosign anchor present. Evidence:
  `cmd://grep -qF 'research/primary-sources/sigstore-cosign.md'
  longread/07-phase-6-ship.md` exits 0.
- T-12: oci-artifacts anchor present. Evidence:
  `cmd://grep -qF 'research/primary-sources/oci-artifacts.md'
  longread/07-phase-6-ship.md` exits 0.
- T-13: Per-chapter Phase 6 failure-mode note in §6.5
  three-element structure at penultimate position.
  Evidence: `cmd://bash scripts/check-chapter-07-failure-note.sh`
  exits 0.
- T-14: Forward pointer to chapter 08. Evidence:
  `cmd://tail -5 longread/07-phase-6-ship.md |
  grep -E '\*\*In the next chapter\*\*:'` matches.

## 14. Acceptance Criteria

- [ ] AC-1: chapter file present.
- [ ] AC-2: in-progress validator PASSes.
- [ ] AC-3: chapter-strict validator PASSes (≤ 1 000
      max; 800 target advisory).
- [ ] AC-4: SPEC lint exits 0.
- [ ] AC-5: T-5 corpus-citation discipline (manual).
- [ ] AC-6: T-6 voice contract (manual).
- [ ] AC-7: T-7 commit-hygiene.
- [ ] AC-8: T-8 Completion Report fills.
- [ ] AC-9: T-9 paragraph-co-occurrence coverage
      (helper PASS).
- [ ] AC-10: T-10 ≥ 3 distinct corpus citations.
- [ ] AC-11: T-11 sigstore-cosign anchor present.
- [ ] AC-12: T-12 oci-artifacts anchor present.
- [ ] AC-13: T-13 three-element failure note at
      penultimate position (helper PASS).
- [ ] AC-14: T-14 forward pointer to chapter 08.

## 15. Rollback Plan

If chapter prose wrong-shape: revert, revise SPEC,
re-author. If single-sentence adjustment post-verify:
amend via `fix(chapter-07):` commit + Amendment Log
§17.0 entry.

## 16. Open Questions

- [ ] Q1: Conformance + Phase 5 current-state honesty
      in E2. Default: cite chapters 01 + 06 explicitly
      in E2 as current-state grounded. Not owner-
      blocking.
- [ ] Q2: Signing detail depth. Default: pattern not
      checklist; do NOT prescribe cosign / cdxgen
      commands. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 17. Completion Report

### 17.1 Files changed

(to be filled — at Verification phase)

### 17.2 Commands run

(to be filled — at Verification phase)

### 17.3 Verification result

(to be filled — at Verification phase)

### 17.4 Residual risk

(to be filled — at Verification phase)

### 17.5 Spec evidence candidates

(to be filled — durable lessons)
