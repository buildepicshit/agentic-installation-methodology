---
id: longread-chapter-07-phase-6-ship
spec_id: 2026-05-24-longread-chapter-07-phase-6-ship
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-24
implies_spec_type: task
---

# IDEA — Longread chapter 07 — Phase 6 Ship + Cross-Link + Sign

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 07 as the
Phase 6 chapter: "Shipping the SPEC bundle separately;
cross-linking; signing." Chapters 00-06 closed (with 06
pending owner close). Per research workpad
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 6: framework spec ships standalone (Product
A); methodology paper ships standalone (Product B);
conformance suite ships as a versioned bundle; each
cites the other; articles cite both. Per workpad §7
Phase 6: "paired release of Product A and Product B."

## 2. Substance Citations

- `file://research/primary-sources/sigstore-cosign.md`
  §3 — signing pattern.
- `file://research/primary-sources/oci-artifacts.md` §3
  — versioned bundle shape with integrity material.
- `file://research/primary-sources/cyclonedx-sbom.md`
  §3 — SBOM as provenance artefact.
- `file://research/primary-sources/spec-kit.md` §3 —
  spec-as-deployment-grade framing.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 6 definition) + §7 (BES Phase 6 disposition).
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 (parent Decision paired-release + signature
  binding).
- `file://longread/01-phase-0-maturity-check.md`
  (chapter 01 — conformance-reserved disclosure).
- `file://longread/04-phase-3-sanitization-bar.md`
  (chapter 04 — Product A / Product B asymmetry).
- `file://longread/06-phase-5-cross-family-validation.md`
  (chapter 06 — Phase 5 outstanding gate).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6.

## 3. Constraints & Non-Negotiables

- Target 800 words (advisory under soft-floors); max
  1 000 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2 — second-smallest budget.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: every methodology primitive (paired-release
  shape, signing pattern, SBOM/provenance, versioned
  bundle) MUST cite a corpus entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: three-element structure with strict fact-vs-
  synthesis separation. E1 + E2 workpad/Decision-
  grounded; E3 synthesis-tagged.
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 08 (Phase 7 failure modes
  as content) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- No padding-for-budget per the soft-floors regime.
- No over-attribution per the chapter 00-06 prose-
  codex pattern (latest at
  `file://reviews/codex-2026-05-23-chapter-06-r3/REVIEW.md`).
- Apply the T-06 R6 explicit-authority-source-list
  block pattern at
  `file://specs/2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose/SPEC.md`
  §17.5 in §6 from the start (T-07 lesson at
  `file://specs/2026-05-23-longread-chapter-06-phase-5-cross-family-validation/SPEC.md`
  §17.5: §6 stays as Authority Map slot; do NOT
  renumber).
- E2 stays workpad/Decision grounded per the chapter
  02-06 recurring prose-codex class documented at
  `file://reviews/codex-2026-05-23-chapter-06-r2/REVIEW.md`;
  paired-release rationale stays in E3 as synthesis.
- Helper requires corpus FILE PATHS in same paragraph
  per T-06 + T-07 R1 F2 lesson at
  `file://reviews/codex-2026-05-23-T07/REVIEW.md`.

## 4. Approaches Considered

### Approach A: Technical signing checklist
Walk through `cosign sign-blob`, `cyclonedx-cli`, OCI
artifact pushes step-by-step.
Fit: drifts toward methodology-vendor prescription;
violates §6.3 voice; under-uses BES case-study density.
Verdict: REJECTED.

### Approach B: Paired-release narrative with provenance
Open with the ship question. Walk through what ships
where per workpad §6 (Product A + Product B +
conformance suite). Cover cross-linking (each cites the
other). Cover signing + provenance via sigstore-cosign
+ cyclonedx-sbom + oci-artifacts. Address current
state honestly: paired release in flight; conformance
suite reserved per chapter 01; Phase 5 gate
outstanding per chapter 06. Close with Phase 6 failure
note strict fact-vs-synthesis.
Fit: aligns with §6.3 + §6.4 + §6.5 + case-study
density + honest-disclosure posture.
Verdict: SELECTED.

### Approach C: Distribution-channel survey
Compare GitHub releases, OCI registries, npm, PyPI,
etc. as channel choices.
Fit: chapter would balloon; under-uses BES case study;
distribution-channel selection is not what Phase 6
asks.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Five-section structure (target ~800 words
under soft-floors):

1. **The ship question** (~100 w). With Phase 0-5
   substantive work done, what does Phase 6 actually
   ship? Cite spec-kit §3 for spec-as-deployment-grade
   framing.
2. **What ships where** (~250 w). Per workpad §6:
   Product A (framework spec) standalone; Product B
   (methodology paper) standalone; conformance suite
   as versioned bundle. Cite oci-artifacts §3 for the
   versioned-bundle shape.
3. **Cross-linking** (~150 w). Each artefact cites
   the other; articles cite both. Per workpad §6.
4. **Signing + provenance** (~200 w). Cite
   sigstore-cosign §3 for signing; cite cyclonedx-sbom
   §3 for SBOM as supply-chain provenance.
5. **Phase 6 failure note** (~150 w; penultimate per
   §6.5). Strict fact-vs-synthesis:
   - E1 workpad-grounded: workpad §7 records BES
     Phase 6 as "paired release of Product A and
     Product B."
   - E2 workpad/Decision-grounded: parent Decision §7
     binds the paired Product A v2.0 / Product B v1.0
     release SHAPE (not current shipped state);
     Product B is in flight (this longread). The
     conformance suite is reserved per chapter 01;
     the Phase 5 cross-family pass is outstanding per
     chapter 06.
   - E3 `judgment://agent-synthesis`; NOT workpad-
     proven: ship-with-disclosure beats ship-with-
     hidden-gaps; the paired-artefact shape
     operationalises that posture.
6. **Forward pointer** (~30 w). To chapter 08 / Phase
   7 / failure modes as first-class content.

Citation discipline (apply T-06 R6 authority-source-
list block in §6):
- Primary-source corpus: methodology primitives
  (paired-release shape, signing, SBOM, versioned
  bundle, spec-as-deployment-grade).
- Workpad §6 + §7: Phase 6 definition + BES Phase 6
  disposition.
- Parent Decision §7: paired-release + signature
  binding.
- Chapter 01: conformance-reserved disclosure.
- Chapter 04: Product A / Product B asymmetry.
- Chapter 06: Phase 5 outstanding-gate disclosure.

## 6. Open Questions for Owner

- [ ] Q1: Conformance-suite reserved + Phase 5
      outstanding referenced in E2 — both are
      current-state facts per chapters 01 + 06.
      Default: cite both chapters; E2 stays workpad/
      chapter-grounded. Not owner-blocking.
- [ ] Q2: Signing detail depth. Default: name
      sigstore-cosign §3's signing pattern + cyclonedx
      §3's SBOM pattern; do NOT prescribe specific
      cosign / cdxgen commands (methodology pattern
      not adopter checklist). Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce + honest-experience + no-padding +
no-over-attribution + authority-source-list-block-
in-§6 + E2-stays-fact discipline all carry over.
Phase 6 is the methodology's "what does shipping
honestly look like" chapter; it builds on chapter 04
(asymmetry) + chapter 06 (outstanding gate) to ship
the methodology with its gaps disclosed rather than
hidden.
