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
| adr-tools-state | pending | — | State of ADR practice: adr-tools, MADR, Y-statements; cross-check Nygard against current usage |
| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); strongest reproducibility primitive |
| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
| symphony-spec | pending | — | OpenAI Symphony SPEC.md; in-the-wild operating-model-as-SPEC; 14 transferable building blocks |
| spec-kit | pending | — | GitHub Spec Kit; closest spec-as-authoring tool |
| kiro | pending | — | Kiro spec-driven IDE; Bedrock-tethered AI coding environment |
| openspec | pending | — | OpenSpec project; new agentic spec format |
| oracle-agent-spec | pending | — | Oracle Agent Spec; spec-as-agent-description; closest to "ship spec, compile yourself" |
| ref-arch-vs-solution-arch | pending | — | Reference architecture vs solution architecture; cross-org ownership-split antecedent |
| leaddev-agent-compiled | pending | — | LeadDev critique; closest published statement of agentic-installation hypothesis (as risk) |
| cucumber-gherkin | pending | — | Cucumber / Gherkin reference; behavioral acceptance primitive |
| openapi-3-1 | pending | — | OpenAPI 3.1 specification; API contract primitive |
| structurizr-dsl | pending | — | Structurizr DSL (C4 implementation); machine-readable architecture |

## Status legend

- `pending` — source not yet fetched; corpus incomplete.
- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).
