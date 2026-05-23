---
id: longread-chapter-05-phase-4-manifest-catalog-compose
spec_id: 2026-05-23-longread-chapter-05-phase-4-manifest-catalog-compose
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: claude-opus-4-7
brainstormed_on: 2026-05-23
implies_spec_type: task
---

# IDEA — Longread chapter 05 — Phase 4 Manifest + Catalog Compose

## Normative Language

This IDEA contains no RFC 2119 normative clauses per
`file://schema/SPEC.schema.md` §3.2.

## 1. Problem Seed

The longread Contract at
`file://specs/2026-05-20-longread-structure/SPEC.md`
(status: in-execution) §6.1 names chapter 05 as the
Phase 4 chapter: "Composing the front-door manifest +
per-facet sub-specs." Chapters 00-04 closed. Per
research workpad
`file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 4: "Produce the front-door manifest +
per-facet sub-specs per §5. Each sub-spec uses the
artefact shape best suited to its facet (structured
data, prose, executable, diagram)." Per workpad §7:
"the BES sanitized framework repo (Product A) IS the
worked example of the catalog shape."

## 2. Substance Citations

- `file://research/primary-sources/oci-artifacts.md`
  §3 — OCI image manifest + layers shape; the
  canonical manifest-as-front-door pattern.
- `file://research/primary-sources/arc42.md` §3 — 12-
  section architecture documentation template; the
  prose-mode prior art for per-facet sub-specs.
- `file://research/primary-sources/c4-model.md` §3 —
  four-abstraction hierarchy; the diagram-mode prior
  art.
- `file://research/primary-sources/structurizr-dsl.md`
  §3 — model-as-code; the executable-diagram artefact
  shape.
- `file://research/primary-sources/spec-kit.md` §3 —
  spec-as-deployment-grade framing; the manifest-
  level abstraction.
- `file://research/primary-sources/helm-values-schema.md`
  §3 — YAML + JSON-schema as canonical structured-data
  facet shape.
- `file://research/primary-sources/cucumber-gherkin.md`
  §3 — Given/When/Then as the executable behavioral-
  contract shape.
- `file://../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (Phase 4 definition) + §7 (BES Product A
  disposition).
- `file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 (parent Decision Product B shape binding).
- `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.1 / §6.2 / §6.3 / §6.4 / §6.5 / §6.6.

## 3. Constraints & Non-Negotiables

- Target 1 200 words (advisory under soft-floors); max
  1 500 words (enforced) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- First-person experiential voice per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.3.
- Corpus-citation rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.4: every methodology primitive (manifest+catalog
  concept; four artefact shapes; per-facet sub-spec
  pattern) MUST cite a corpus entry.
- Per-chapter failure-mode rule per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.5: three-element structure with strict fact-vs-
  synthesis separation.
- Chapter MUST end with "**In the next chapter**:"
  forward pointer to chapter 06 (Phase 5 cross-family
  validation) per
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §8.1.
- No padding-for-budget per the soft-floors regime at
  `file://specs/2026-05-20-longread-structure/SPEC.md`
  §6.2.
- No over-attribution to cited authority per the
  chapter 00-04 prose-codex pattern (latest at
  `file://reviews/codex-2026-05-23-chapter-04/REVIEW.md`).

## 4. Approaches Considered

### Approach A: Manifest-spec exposition
Define the manifest format; enumerate per-facet schema
fields; present as reference architecture.
Fit: drifts into reference-mode the chapter is supposed
to STAND BACK FROM; under-uses BES case study; violates
§6.3 first-person voice.
Verdict: REJECTED.

### Approach B: BES Product A as worked example
Open with the Phase 4 composition question. Walk through
the four artefact shapes (structured data / prose /
executable / diagram) per workpad §6. Describe Product
A v2.0 as the worked example per workpad §7. Address
the conformance-reserved disclosure honestly. Close
with the Phase 4 failure mode under strict fact-vs-
synthesis.
Fit: aligns with §6.3 + §6.4 + §6.5; parent Decision §7
case-study density; soft-floors + no over-attribution.
Verdict: SELECTED.

### Approach C: OCI artifact analogy throughout
Cast every Phase 4 primitive as OCI-image-manifest
shape (layers, descriptors, etc.).
Fit: forces metaphor where workpad doesn't; risks over-
attribution to OCI when workpad just names "manifest +
sub-specs" generically.
Verdict: REJECTED.

## 5. Recommendation

Approach B. Six-section structure (target ~1 200 words
under soft-floors; substance determines length):

1. **The composition question** (~150 w). Phase 0-3
   closed; what does composition produce as the
   shippable artefact? Anchor: oci-artifacts §3 for
   the manifest-as-front-door pattern (REQUIRED);
   spec-kit §3 MAY be cited as supporting frame.
2. **The four artefact shapes** (~300 w). Per workpad
   §6: structured data (helm-values-schema §3); prose
   (arc42 §3); executable (cucumber-gherkin §3);
   diagram (c4-model §3 + structurizr-dsl §3 as
   diagram-as-code).
3. **The manifest as front door** (~200 w). Cite oci-
   artifacts §3 for the manifest+layers shape. The
   methodology adapts this for spec bundles: manifest
   names per-facet sub-specs the way an OCI manifest
   names layers.
4. **Where BES landed** (~250 w). Product A v2.0
   manifest+catalog per workpad §7 ("the BES
   sanitized framework repo (Product A) IS the
   worked example of the catalog shape"). The seven facets
   (per chapter 02's facet inventory + chapter 04's
   reference). The chapter MUST NOT add Product A
   specifics beyond what workpad + chapters 01 + 02
   already establish.
5. **Phase 4 failure note** (~200 w; penultimate per
   §6.5). Strict fact-vs-synthesis separation:
   - E1 workpad-grounded: workpad §7 records Product
     A v2.0 as the worked example.
   - E2 workpad-grounded: we composed the manifest +
     seven-facet catalog; the conformance facet shipped
     `reserved` per chapter 01 disclosure.
   - E3 `judgment://agent-synthesis`; NOT workpad-
     proven: a manifest+catalog that discloses a
     reserved facet is closer to honest than a
     manifest that ships every facet as
     superficially complete.
6. **Forward pointer** (~50 w). To chapter 06 / Phase
   5 / cross-family validation.

Citation discipline (matches chapters 03 + 04
closures):
- Methodology primitives MUST cite corpus only.
- Workpad cites only for phase taxonomy + BES
  disposition.
- Parent Decision cites only for Product B shape +
  attribution.
- No specific named BES artefacts beyond what cited
  workpad + chapters 01 + 02 already establish.

## 6. Open Questions for Owner

- [ ] Q1: Concreteness of Product A v2.0 reference.
      Default: name v2.0 + the seven facets + conformance-
      reserved per workpad + chapter 01
      previously established; do not enumerate
      specific facet content beyond what those prior
      chapters already cited. Not owner-blocking.
- [ ] Q2: OCI vs spec-kit framing emphasis. Default per
      T-06 R3 F2 closure: OCI for the manifest+layers
      shape is REQUIRED; spec-kit MAY be cited as
      supporting frame but is NOT required by the
      acceptance gate. Not owner-blocking.

Neither Q1 nor Q2 is `owner-blocking`.

## 7. Owner Judgments

The rolls-royce posture + honest-experience contract +
no-padding-for-budget + no-over-attribution discipline
all carry over. The asymmetric-sanitization framing
from chapter 04 also carries — Product A is the
worked example here precisely because Product A is
the sanitized artefact, while Product B (this
longread) provides the case-study context. No new
owner judgments required.
