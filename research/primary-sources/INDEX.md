# Primary-source corpus index

Source-list version: v1.0
Last updated: 2026-05-19

Per
`file://../../specs/2026-05-19-primary-source-research-corpus/SPEC.md`
§6.1, §6.4. Every slug listed below has a corresponding
artefact file at `research/primary-sources/<slug>.md`. The
check script `scripts/check-corpus-completeness.sh` enforces
the bijection and the completeness state.

| Slug | Status | Fetched on | Methodology summary |
|---|---|---|---|
| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); strongest reproducibility primitive |
| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |

## Status legend

- `pending` — source not yet fetched; corpus incomplete.
- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).
