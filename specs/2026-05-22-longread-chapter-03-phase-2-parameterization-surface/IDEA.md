---
id: longread-chapter-03-phase-2-parameterization-surface
spec_id: 2026-05-22-longread-chapter-03-phase-2-parameterization-surface
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-22
implies_spec_type: task
---

# IDEA — Longread chapter 03 — Phase 2 Parameterization Surface

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 03 as the
Phase 2 chapter: "What the spec parameterizes vs hard-
codes (the deferral contract)." Chapter 02 produced
the per-artefact facet inventory. Chapter 03 picks up
from that inventory and asks the next question: for
each artefact and facet, what does the spec parameterize
(leave to the installer) versus hard-code (assert as
intent)? This is the deferral-contract decision per
research workpad
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 2. Per §7, BES landed on a distributed
parameterization surface (multiple `fleet-manifest`-
style configs, not single-file).

## 2. Substance Citations

- `file://research/primary-sources/symphony-spec.md` §3
  — Symphony's single-file `WORKFLOW.md` approach;
  named in research §6 Phase 2 as the canonical
  single-file pattern.
- `file://research/primary-sources/helm-values-schema.md`
  §3 — Helm's `values.yaml` + JSON-schema-validated
  override pattern; canonical multi-file
  parameterization in the Kubernetes ecosystem.
- `file://research/primary-sources/nix-flakes.md` §3 —
  `flake.nix` as a hermetic parameterization shape with
  pinned inputs.
- `file://research/primary-sources/12-factor.md` §3 —
  config-in-environment vs code-in-repository
  separation pattern.
- `file://research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 — reference architecture vs solution architecture
  ownership split; which determines what the spec can
  parameterize vs must hard-code.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 2 definition) + §7 (BES Phase 2 case-study
  data).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6.

## 3. Constraints & Non-Negotiables

- Target 1 000 words (advisory per the 2026-05-21
  soft-floors amendment); maximum 1 300 words (enforced)
  per `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: every methodology primitive in chapter 03 (the
  deferral-contract concept, the single-file vs multi-
  file shape choice, the parameterize-vs-hard-code
  question) MUST cite a corpus entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: chapter 03 includes a Phase 2 failure-mode note
  in the three-element structure.
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 04 (Phase 3 sanitization
  bar) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- No padding-for-budget per the soft-floors regime
  defined at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 + the T-02 lesson at
  `file://specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md`
  §17.5.
- No over-attribution to cited authority per the
  chapter 00 / 01 / 02 prose-codex pattern (chapter
  02 R1 finding 1 at
  `file://reviews/codex-2026-05-22-chapter-02/REVIEW.md`).

## 4. Approaches Considered

### Approach A: Theoretical exposition of parameterization
Define parameterize-vs-hard-code abstractly; cite Helm
+ Nix + Symphony as parallel examples; describe BES
choice as illustration.
Fit: drifts toward methodology-vendor register; under-
uses the BES case study.
Verdict: REJECTED.

### Approach B: BES experience as the path through the question
Open with the deferral-contract question. Walk through
the two prior-art shapes (single-file Symphony,
multi-file Helm/Nix) the workpad names. Describe BES
landing on a distributed multi-file shape (workpad §7
direct claim). Close with the Phase 2 failure mode
honestly anchored on workpad authority.
Fit: aligns with §6.3 first-person voice + §6.5 per-
chapter failure-mode rule + corpus-citation discipline.
Verdict: SELECTED.

### Approach C: Catalogue of all parameterization patterns
Enumerate Helm + Nix + Symphony + 12-factor + arc42 +
others as a comparative survey.
Fit: chapter would balloon past max; under-uses BES
case study.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Five-section structure (target ~1 000 words
under soft-floors; substance determines length):

1. **The deferral-contract question** (~150 w). The
   question Phase 2 asks; why Phase 1's facet inventory
   is its precondition. Cite ref-arch-vs-solution-arch
   §3 for the ownership-split frame.
2. **Two prior-art shapes** (~250 w). Single-file
   (Symphony WORKFLOW.md per workpad §6 + symphony-spec
   §3). Multi-file (Helm values.yaml per helm-values-
   schema §3; Nix flake.nix per nix-flakes §3). Cite
   12-factor §3 for the config-vs-code separation
   principle.
3. **Where BES landed** (~250 w). Distributed
   multi-file parameterization surface per workpad §7
   ("multiple `fleet-manifest`-style configs are
   needed, not a single one"). NO claims beyond this
   workpad anchor.
4. **Phase 2 failure-mode note** (~200 w; penultimate
   per §6.5). Strict fact-vs-synthesis separation:
   - What happened (workpad-grounded): workpad §6
     names two shapes; workpad §7 records BES as
     distributed.
   - What we did (workpad-grounded): accepted the
     distributed shape per workpad §7.
   - What generalizes
     (`judgment://agent-synthesis`; NOT workpad-
     proven): parameterization shape is plausibly
     downstream of facet inventory.
5. **Forward pointer** (~30 w). To chapter 04 / Phase 3
   / sanitization bar.

Citation discipline (matches chapter 02 +
T-03 R4 closure):
- Methodology primitives MUST cite corpus only.
- Workpad cites only for phase taxonomy + Product B
  shape + open-question enumeration.
- No specific named BES artefacts beyond what the cited
  workpad authority supports.

## 6. Open Questions for Owner

- [ ] Q1: Concreteness of "what BES landed on". Default
      per chapter 02 R1 closure: stay within cited
      workpad authority. Workpad §7 says "distributed
      (multiple fleet-manifest-style configs)" — the
      chapter cites this directly without naming
      specific config files. Not owner-blocking.
- [ ] Q2: Two-vs-three prior-art shapes. Default: name
      single-file (Symphony) + multi-file (Helm + Nix
      as two flavours) per workpad §6. The chapter
      MAY also reference 12-factor's config-vs-code
      principle as supporting frame, not as a third
      shape. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce posture + honest-experience contract +
no-padding-for-budget directive + no-over-attribution
discipline all carry over. No new owner judgments
required for Approach B.
