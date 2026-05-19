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
| arc42 | pending | — | Architecture documentation template; methodology §3 building block; comparison point for §8 Crosscutting Concepts |
| c4-model | pending | — | C4 model for software architecture (Container/Component/Code levels); Structurizr DSL implementation |
| adr-nygard | pending | — | Nygard's original Architecture Decision Records post (2011); the decisions facet primitive |
| adr-tools-state | pending | — | State of ADR practice: adr-tools, MADR, Y-statements; cross-check Nygard against current usage |
| diataxis | pending | — | Documentation taxonomy: tutorials / how-to / reference / explanation; comparison for methodology packaging |
| 12-factor | pending | — | 12-factor app manifesto; Config knob primitive; conformance overlay reference |
| helm-values-schema | pending | — | Helm values.schema.json + JSON Schema; customization-affordance grammar closest in practice |
| nix-flakes | pending | — | Nix flake schema + RFC 49; strongest reproducible-from-spec primitive |
| oci-artifacts | pending | — | OCI Image Spec + Artifact spec; spec-as-distribution packaging primitive |
| sigstore-cosign | pending | — | Sigstore architecture + cosign; signing model for spec-as-distribution artefacts |
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
