# Codex cross-family review — Chapter 00 prose

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only content-quality review
Date: 2026-05-20
Target: `longread/00-introduction.md` (842 prose words)

## Verdict

SEVERITY: MAJOR. Not ready for verified+closed as drafted.
Chapter 00 is structurally strong and mostly aligned with
the voice/posture contract, but two prose-level issues need
correction: the opener overclaims what has been proven in
production, and the chapter promises corpus-citation
discipline while introducing key methodology primitives
without corpus anchors.

## BLOCKER findings

None.

## MAJOR findings

### Finding 1 — opener overclaims
Severity: MAJOR
Citation: `longread/00-introduction.md:9-16`

The opener says the hypothesis was "tested in production"
and that BES "shipped a real product to real users by
writing a spec a coding agent could install from." The
evidence supports Product A being published and repacked
into v2.0 manifest+catalog, but not yet the stronger claim
that independent user-with-agent installation has been
proven in production. The parent Decision still treats
external cross-family installation as a publication gate,
and Product A v2.0 itself discloses scaffold-grade gaps in
several facets.

Supporting citations:
- `../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:337-340`
- `../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:358-362`
- `../agentic-ops-framework/CHANGELOG.md:112-119`
- `../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1020-1037`

Recommendation: Recast the opener to distinguish what is
already proven from what remains gated. Suggested direction:
"We shipped Product A as a public operating-framework
release, then repacked it into a manifest+catalog v2.0
bundle as the worked case study for Product B. That proved
the packaging and studio discipline; independent
user-with-agent installation from the bundle remains the
validation gate this methodology still owes."

### Finding 2 — methodology primitives in roadmap lack corpus anchors
Severity: MAJOR
Citation: `longread/00-introduction.md:35-40`, `...:85-92`,
`...:96-108`

The chapter states that every methodology primitive cites
a primary-source corpus entry, but the roadmap introduces
primitives without corpus anchors: facet inventory,
parameterization surface, deferral contract, sanitization
bar, manifest+catalog composition, cross-family validation,
ship/signing, and failure-mode publication. The Contract
requires methodology primitives to cite
`research/primary-sources/<slug>.md §3`, and T-01's manual
citation check explicitly names the Phase 0-7 procedure,
sanitization bar, and manifest+catalog shape as
citation-sensitive.

Supporting citations:
- `specs/2026-05-20-longread-structure/SPEC.md:266-289`
- `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md:367-385`

Recommendation: Either add compact corpus anchors in the
roadmap, or narrow the roadmap to chapter titles and
explicitly defer primitive-level corpus citations to the
phase chapters. If keeping the current substantive wording,
add relevant corpus anchors such as
`leaddev-agent-compiled.md §3` for the installation
hypothesis, `spec-kit.md §3` for spec-as-authoring
contrast, `oci-artifacts.md §3` for manifest/distribution
shape, `ref-arch-vs-solution-arch.md §3` for ownership
split, and `symphony-spec.md §3` for
conformance/walkthrough patterns where applicable.

## MINOR findings

None.

## Advisory

No below-MAJOR editorial issues. The prose mostly avoids
vendor-register and keeps first-person experiential
posture.

## Truthfulness table

| Chapter claim | Source checked | Matches? | Notes |
|---|---|---:|---|
| Kruger patching epigraph | `research/primary-sources/leaddev-agent-compiled.md:48-52` | Y | Quote matches corpus. |
| LeadDev as closest published prior-art-as-risk framing | corpus §3 + research §2.3 | Y | Correctly contrasts. |
| "tested in production" / "real users" | parent Decision + Product A v2.0 evidence | **PARTIAL** | Product A shipped + v2.0 exists; user-with-agent install not yet evidenced. |
| Product B = longread + SPEC bundle, first-person, BES case study, failure modes first-class | parent Decision §7 | Y | Matches. |
| Phase roadmap accuracy | Contract §6.1 + research §6 | Y | Summaries accurate, but corpus anchoring missing in prose. |
| Seven open research questions remain open | research §2.3 | Y | All seven topic surfaces listed. |
| BES fully named as worked case study | parent Decision + research | Y | Correct. |
| Product A v2.0 is manifest+catalog | Product A README + CHANGELOG | Y | Correct. |
| Product A v2.0 carries "executable contract for installers" | install.md + CHANGELOG | **PARTIAL** | Install/post-install checks exist, but conformance is reserved/empty at v2.0, so "executable contract" should be tightened. |

tokens used: 127,252
