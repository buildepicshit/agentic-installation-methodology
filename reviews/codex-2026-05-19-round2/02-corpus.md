Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e4226-4eba-7790-b8fc-958f002dfdf3
--------
user
Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md plus the 22 corpus artefacts under research/primary-sources/ AND the new artefacts json-schema.md + cyclonedx-sbom.md. Round 1 findings 2.1-2.9 captured at reviews/codex-2026-05-19/02-corpus.md were addressed by direct edits in commits e9268c1, 22371e3 + the remediation Contract §7.D in c1c9d95. Verify: (1) 2.2 status truth — INDEX shows adr-tools-state and structurizr-dsl as partial now? (2) 2.3 source-list expansion — json-schema + cyclonedx-sbom added correctly to §6.1 + SOURCE_LIST_VERSION bumped to v1.1? (3) 2.4 oci-artifacts §3 — does the deep-read of artifacts-guidance now license the non-image-payload claims? (4) 2.5-2.9 (c4-model docker, symphony uniqueness, leaddev Willison, ref-arch verbatim/paraphrase, nix strongest) — are the rewrites honest? (5) NEW findings: did the json-schema artefact at status partial actually disclose what's not deep-read? Did the cyclonedx-sbom entry overreach? Output: per-finding remediation verdict + new findings + Quality Gate Result.
codex
I’ll treat this as a read-only review: first confirm the remediation contract and prior findings, then check the current SPEC, index, and the affected source notes against the exact questions you listed.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|SOURCE_LIST_VERSION|02-corpus|cyclonedx|json-schema|oci-artifacts|adr-tools-state|structurizr-dsl|Willison|Symphony|Nix|c4-model|ref-arch" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
codex
No relevant prior memory hits for this repo or review topic, so I’m relying on the live repo evidence from here. Next I’m reading the review record, the active spec, and the corpus inventory together so the verdicts line up with the actual remediation target.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
?? reviews/codex-2026-05-19-round2/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
reviews/codex-2026-05-19-round2/02-corpus.md
reviews/codex-2026-05-19-round2/01-parent-decision.md
reviews/codex-2026-05-19/00-SYNTHESIS.md
reviews/codex-2026-05-19/04-longread.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/01-parent-decision.md
research/primary-sources/INDEX.md
research/primary-sources/cyclonedx-sbom.md
research/primary-sources/json-schema.md
research/primary-sources/oci-artifacts.md
research/primary-sources/leaddev-agent-compiled.md
research/primary-sources/symphony-spec.md
research/primary-sources/nix-flakes.md
research/primary-sources/ref-arch-vs-solution-arch.md
research/primary-sources/c4-model.md
research/primary-sources/adr-tools-state.md
research/primary-sources/openspec.md
research/primary-sources/oracle-agent-spec.md
research/primary-sources/structurizr-dsl.md
research/primary-sources/cucumber-gherkin.md
research/primary-sources/kiro.md
research/primary-sources/openapi-3-1.md
research/primary-sources/spec-kit.md
research/primary-sources/12-factor.md
research/primary-sources/sigstore-cosign.md
research/primary-sources/helm-values-schema.md
research/primary-sources/diataxis.md
research/primary-sources/adr-nygard.md
research/primary-sources/arc42.md
CLAUDE.md
AGENTS.md
README.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md
LICENSE
tests/hooks/run-tests.sh
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/fixtures/msg-clean.txt
specs/2026-05-19-codex-remediation-amendments/SPEC.md
specs/2026-05-20-longread-structure/SPEC.md
templates/IDEA.template.md
hooks/block-ai-attribution.sh
templates/TASK.template.md
templates/SPEC.task.template.md
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
hooks/verify-reminder.sh
templates/SPEC.contract.template.md
hooks/session-start-context.sh
hooks/block-verify-bypass.sh
hooks/block-push-to-main.sh
hooks/block-git-add-all.sh
hooks/block-edit-on-main.sh
scripts/validate-skill-frontmatter.sh
scripts/lint-spec.sh
scripts/validate-longread-structure.sh
scripts/check-corpus-completeness.sh
schema/SPEC.schema.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-18-repo-standup/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git log --oneline --decorate -12' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
c1c9d95 (HEAD -> main, origin/main, origin/HEAD) spec(verify): codex remediation Contract -> verified; corpus §6.1 amended to v1.1 (§7.D), 2 new sources (findings 2.3)
72b1957 spec: codex remediation-amendments Contract (Round 5 batch wrapper)
1777c8b spec(fix): longread §6.5 per-chapter failure-mode rule (codex finding 4.5)
22371e3 spec(fix): corpus Completion Report acknowledges lint-impedance honestly (codex finding 2.1)
e9268c1 fix(corpus): status truth + citation overreach (codex findings 2.2, 2.4-2.9)
969698f spec(fix): longread Contract — acceptance commands, word budget, voice rule, attribution (codex findings 4.1, 4.4, 4.6, 4.7)
3ce373d review: codex (gpt-5.5 xhigh) cross-family review across 4 SPECs
c71233c feat: validate-longread-structure.sh mechanical gate (Slice 3 partial)
8008bf6 spec(execute): Slice 3 longread Contract -> in-execution; owner directive 'approved'
c41515c spec: longread structure Contract SPEC (Slice 3)
9bc531e feat(corpus): all 20 primary-source artefacts complete; slice 1.5 -> verified
fe13fe6 feat(corpus): 9 of 20 primary-source artefacts (decomposition + reproducibility + signing primitives)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' reviews/codex-2026-05-19-round2/02-corpus.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e4226-4eba-7790-b8fc-958f002dfdf3
--------
user
Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md plus the 22 corpus artefacts under research/primary-sources/ AND the new artefacts json-schema.md + cyclonedx-sbom.md. Round 1 findings 2.1-2.9 captured at reviews/codex-2026-05-19/02-corpus.md were addressed by direct edits in commits e9268c1, 22371e3 + the remediation Contract §7.D in c1c9d95. Verify: (1) 2.2 status truth — INDEX shows adr-tools-state and structurizr-dsl as partial now? (2) 2.3 source-list expansion — json-schema + cyclonedx-sbom added correctly to §6.1 + SOURCE_LIST_VERSION bumped to v1.1? (3) 2.4 oci-artifacts §3 — does the deep-read of artifacts-guidance now license the non-image-payload claims? (4) 2.5-2.9 (c4-model docker, symphony uniqueness, leaddev Willison, ref-arch verbatim/paraphrase, nix strongest) — are the rewrites honest? (5) NEW findings: did the json-schema artefact at status partial actually disclose what's not deep-read? Did the cyclonedx-sbom entry overreach? Output: per-finding remediation verdict + new findings + Quality Gate Result.
codex
I’ll treat this as a read-only review: first confirm the remediation contract and prior findings, then check the current SPEC, index, and the affected source notes against the exact questions you listed.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|SOURCE_LIST_VERSION|02-corpus|cyclonedx|json-schema|oci-artifacts|adr-tools-state|structurizr-dsl|Willison|Symphony|Nix|c4-model|ref-arch" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
codex
No relevant prior memory hits for this repo or review topic, so I’m relying on the live repo evidence from here. Next I’m reading the review record, the active spec, and the corpus inventory together so the verdicts line up with the actual remediation target.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
?? reviews/codex-2026-05-19-round2/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
reviews/codex-2026-05-19-round2/02-corpus.md
reviews/codex-2026-05-19-round2/01-parent-decision.md
reviews/codex-2026-05-19/00-SYNTHESIS.md
reviews/codex-2026-05-19/04-longread.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/01-parent-decision.md
research/primary-sources/INDEX.md
research/primary-sources/cyclonedx-sbom.md
research/primary-sources/json-schema.md
research/primary-sources/oci-artifacts.md
research/primary-sources/leaddev-agent-compiled.md
research/primary-sources/symphony-spec.md
research/primary-sources/nix-flakes.md
research/primary-sources/ref-arch-vs-solution-arch.md
research/primary-sources/c4-model.md
research/primary-sources/adr-tools-state.md
research/primary-sources/openspec.md
research/primary-sources/oracle-agent-spec.md
research/primary-sources/structurizr-dsl.md
research/primary-sources/cucumber-gherkin.md
research/primary-sources/kiro.md
research/primary-sources/openapi-3-1.md
research/primary-sources/spec-kit.md
research/primary-sources/12-factor.md
research/primary-sources/sigstore-cosign.md
research/primary-sources/helm-values-schema.md
research/primary-sources/diataxis.md
research/primary-sources/adr-nygard.md
research/primary-sources/arc42.md
CLAUDE.md
AGENTS.md
README.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md
LICENSE
tests/hooks/run-tests.sh
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/fixtures/msg-clean.txt
specs/2026-05-19-codex-remediation-amendments/SPEC.md
specs/2026-05-20-longread-structure/SPEC.md
templates/IDEA.template.md
hooks/block-ai-attribution.sh
templates/TASK.template.md
templates/SPEC.task.template.md
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
hooks/verify-reminder.sh
templates/SPEC.contract.template.md
hooks/session-start-context.sh
hooks/block-verify-bypass.sh
hooks/block-push-to-main.sh
hooks/block-git-add-all.sh
hooks/block-edit-on-main.sh
scripts/validate-skill-frontmatter.sh
scripts/lint-spec.sh
scripts/validate-longread-structure.sh
scripts/check-corpus-completeness.sh
schema/SPEC.schema.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-18-repo-standup/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git log --oneline --decorate -12' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
c1c9d95 (HEAD -> main, origin/main, origin/HEAD) spec(verify): codex remediation Contract -> verified; corpus §6.1 amended to v1.1 (§7.D), 2 new sources (findings 2.3)
72b1957 spec: codex remediation-amendments Contract (Round 5 batch wrapper)
1777c8b spec(fix): longread §6.5 per-chapter failure-mode rule (codex finding 4.5)
22371e3 spec(fix): corpus Completion Report acknowledges lint-impedance honestly (codex finding 2.1)
e9268c1 fix(corpus): status truth + citation overreach (codex findings 2.2, 2.4-2.9)
969698f spec(fix): longread Contract — acceptance commands, word budget, voice rule, attribution (codex findings 4.1, 4.4, 4.6, 4.7)
3ce373d review: codex (gpt-5.5 xhigh) cross-family review across 4 SPECs
c71233c feat: validate-longread-structure.sh mechanical gate (Slice 3 partial)
8008bf6 spec(execute): Slice 3 longread Contract -> in-execution; owner directive 'approved'
c41515c spec: longread structure Contract SPEC (Slice 3)
9bc531e feat(corpus): all 20 primary-source artefacts complete; slice 1.5 -> verified
fe13fe6 feat(corpus): 9 of 20 primary-source artefacts (decomposition + reproducibility + signing primitives)


exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' reviews/codex-2026-05-19/02-corpus.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,280p' specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
id: 2026-05-19-primary-source-research-corpus
status: verified
type: contract
owner: HasNoBeef
repo: agentic-installation-methodology
branch_policy: main-direct
risk: medium
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
  - test -f research/primary-sources/INDEX.md
  - bash scripts/check-corpus-completeness.sh
cites_decision: 2026-05-18-agentic-installation-methodology
---

# SPEC: Primary-Source Research Corpus (Deep-Research Preface)

Status: Draft v1
Type: Contract
Purpose: govern the production of a structured primary-source
research corpus that grounds every methodology claim in
arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
Agent Spec / reference-architecture literature before any
methodology content (longread, SPEC bundle) lands. The corpus
is the citable evidence base downstream slices draw from;
the SPEC defines its shape, completeness gates, and
citation discipline.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

## 1. Problem Statement

The 2026-05-17 research workpad
(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
or upstream
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
§12 Verification Caveats records that several primary
sources were "access-denied and characterized via WebSearch
summaries cross-checked against multiple sources" — arc42,
C4, ADR, Diátaxis, 12-factor. The methodology Product B
publishes draws heavily on those primitives (research §3,
§4, §5). Owner directive
`decision-authority://owner:2026-05-18` ("base this all in
deep research and best practices - not make up bullshit")
forecloses publishing claims grounded in agent summaries
when the primaries themselves are reachable with proper
tooling (WebFetch, archive.org, primary-PDF retrieval). The
methodology body (longread + SPEC bundle) MUST NOT land
before each in-scope primary has a structured corpus entry
that captures the verbatim claims the methodology depends
on. This SPEC defines the corpus shape, the per-source
artefact template, the completeness gate, and the citation
discipline that binds the longread and SPEC bundle
authoring slices to the corpus rather than to agent memory.

## 2. Goals and Non-Goals

Goals:

- Define an exhaustive in-scope source list with rationale
  per entry.
- Define the per-source artefact template: front-matter,
  fetch metadata, verbatim claim extracts, gap from prior
  agent summary, citation surface.
- Define a completeness gate enforced by a check script
  (`scripts/check-corpus-completeness.sh`) so the corpus's
  state is mechanically verifiable.
- Establish the citation grammar binding: every methodology
  claim in downstream artefacts MUST cite a corpus entry
  via `file://research/primary-sources/<slug>.md§<n>`, not
  agent memory.

Non-goals:

- Authoring the methodology longread or SPEC bundle
  (subsequent slices).
- Repacking Product A v1.1 into manifest+catalog v2.0
  (sibling slice).
- Resolving the seven open research questions enumerated in
  the dispositioned research workpad §2.3 — the corpus
  informs them; it does not pretend to resolve them.
- A literature review essay. The corpus is structured
  source artefacts, not synthesized prose.

## 3. System Overview

The deep-research corpus is a directory at
`research/primary-sources/` inside this repo. Each in-scope
source has one structured artefact at
`research/primary-sources/<slug>.md`. An `INDEX.md` at the
directory root lists every in-scope source, its slug, its
current status (`pending` / `primary-read-complete` /
`access-blocked` / `superseded`), and a one-line summary of
the verbatim claims the methodology depends on from that
source. A check script
(`scripts/check-corpus-completeness.sh`) walks the index and
reports gaps (`pending` entries, `access-blocked` entries
without an alternative-source-found note, slugs in the
index that lack a file under `research/primary-sources/`).

Downstream methodology slices (longread, SPEC bundle) cite
the corpus exclusively for primitives derived from these
sources. Lint at the corpus-citation surface is enforced by
a follow-on extension to `scripts/lint-spec.sh` (out of
scope for this SPEC; deferred to a follow-on Task SPEC).

The corpus is append-only on a per-entry basis; an entry
may be superseded by a follow-on entry (slug-suffixed
`-vN`) but never deleted. Provenance is preserved.

## 4. Authority Map

Active authority:

- `decision-authority://owner:2026-05-18` — owner directive
  ("base this all in deep research and best practices - not
  make up bullshit") binding deep-primary-source discipline
  before any methodology content lands.
- Parent Decision SPEC at
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — binds Product B shape; §9 Locks unlock authoring of
  follow-on slices including this preface.
- Dispositioned research workpad at
  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §12 Verification Caveats — names the specific access-
  denied primaries that this corpus closes the gap on.
- `file://schema/SPEC.schema.md` — citation grammar,
  RFC 2119 scoping rules, front-matter schema.

Stale, superseded, or evidence-only:

- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
  — superseded research workpad; evidence-only.

Owner decisions required before implementation:

- [ ] Confirm the §6 Domain Model source list is exhaustive
      for v1.0; subsequent additions land as follow-on
      Contract SPEC amendments.

## 5. Code/Docs Reality Check

- The `research/primary-sources/` directory does not yet
  exist (`cmd://ls research/` returns "No such file" before
  this slice executes).
- The check script `scripts/check-corpus-completeness.sh`
  does not yet exist (`cmd://test -f
  scripts/check-corpus-completeness.sh` exits non-zero
  pre-execution).
- The `WebFetch` tool is the primary retrieval mechanism;
  fallback is `cmd://curl -fsSL --max-time 30` for
  endpoints WebFetch fails on, with archive.org
  (`url://web.archive.org/web/*/`) as the
  access-blocked fallback.

## 6. Domain Model

### 6.1 In-scope sources (v1.0)

| Slug | Source | Primary URL | Why in scope |
|---|---|---|---|
| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
| symphony-spec | OpenAI Symphony SPEC.md | `url://github.com/openai/symphony/blob/main/SPEC.md` | In-the-wild operating-model-as-SPEC; research §3 transferable building blocks |
| spec-kit | GitHub Spec Kit | `url://github.com/github/spec-kit` | Closest spec-as-authoring tool; research §2.1 |
| kiro | Kiro spec-driven IDE | `url://kiro.dev` | Spec-driven IDE; research §2.1 |
| openspec | OpenSpec project | `url://github.com/Fission-AI/OpenSpec` | New agentic spec project; surfaced by recent field state |
| oracle-agent-spec | Oracle Agent Spec | `url://github.com/oracle/agent-spec` | Spec-as-agent-description; research §2.1 |
| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
| leaddev-agent-compiled | LeadDev "Can you trust the spec" article | `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software` | Closest published statement of the agentic-installation hypothesis (as risk); research §2.2 |
| cucumber-gherkin | Cucumber / Gherkin reference | `url://cucumber.io/docs/gherkin/reference/` | Behavioral acceptance primitive; research §5.1 |
| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
| structurizr-dsl | Structurizr DSL (C4 implementation) | `url://docs.structurizr.com/dsl` | Machine-readable C4; research §5.1 |
| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |

`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
`file://../2026-05-19-codex-remediation-amendments/SPEC.md`
§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
baseline. Two further candidates flagged but NOT v1.1
mandatory (deferred to corpus §17 Q4 v1.2 expansion):
`dev-container-spec`, `slsa-in-toto`.

Additions land as follow-on Contract SPEC amendments per
§17 Open Questions.

### 6.2 Per-source artefact schema

Each `research/primary-sources/<slug>.md` is a markdown
document with the following front-matter and section
structure:

```yaml
---
slug: <slug>            # matches §6.1 row
source_name: "<Full name>"
primary_url: "<URL>"
fetched_via: "WebFetch" | "curl" | "archive.org" | "manual"
fetched_on: <YYYY-MM-DD>
fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
fetch_evidence: "<one-line digest of fetch result or
                  fallback used>"
supersedes: <slug>      # OPTIONAL; for vN entries
methodology_relevance: |
  <one-paragraph statement of which methodology claims
   draw on this source>
---
```

Required sections (in order):

1. **§1 Source identity** — name, canonical URL,
   maintainer / publisher, license / copyright posture
   (the bar for fair-use excerpts in our corpus).
2. **§2 Fetch trace** — what was attempted, what worked,
   what was blocked. Cites the agent tool calls
   (`cmd://WebFetch <url>`, `cmd://curl -fsSL <url>`)
   with one-line outcome digests.
3. **§3 Verbatim claims this corpus depends on** —
   the primary's own words, quoted. Each quote is
   attributed by §-and-paragraph (or chapter / section
   identifier from the source) and accompanied by a
   methodology-relevance note. Quotes MAY be excerpted
   per fair-use limits per §6.3.
4. **§4 Gap from prior summary characterization** — what
   the 2026-05-17 research workpad (or earlier agent
   summaries) got right, what it got wrong or imprecise,
   and what new primary-anchored claims are now available
   to the methodology body.
5. **§5 Downstream-citation surface** — the set of
   methodology claims this entry now licenses, expressed
   as `methodology-claim: "<claim>"` paired with the
   §1-§3 anchor that supports it.
6. **§6 Open questions surfaced by the primary read** —
   things the primary itself doesn't answer that the
   methodology may have to flag as open. Distinct from
   the seven research-workpad open questions; these
   are primary-anchored unknowns.

### 6.3 Citation and fair-use posture

Verbatim quotes in §3 of each artefact are excerpts for
research and methodology purposes; per US fair-use
doctrine (and equivalents in other jurisdictions), the
corpus is editorial commentary on published sources, not
republication. Each quote is bounded — typically
≤ 50 words, never exceeding the smaller of (a) one
paragraph of source text or (b) 200 words. The artefact
is the methodology's editorial citation surface, not a
mirror. When the source's license is permissive
(Apache-2.0 / MIT / CC-BY for documentation), longer
excerpts MAY be included with attribution.

### 6.4 INDEX.md contract

`research/primary-sources/INDEX.md` is the corpus's
machine-checkable index. Format:

```markdown
# Primary-source corpus index

Source-list version: v1.0
Last updated: <YYYY-MM-DD>


 succeeded in 0ms:
Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e3e53-0e1f-77a0-9a32-cd53f524e819
--------
user
Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
codex
I’ll keep this read-only and treat it as a review gate: first confirm the active repo artefacts and line numbers, then inspect the specified sample deeply enough to issue file:line findings.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|agentic ops framework|Product B" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'pwd && git status --short && rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology
?? reviews/
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/01-parent-decision.md
research/primary-sources/INDEX.md
research/primary-sources/ref-arch-vs-solution-arch.md
research/primary-sources/adr-tools-state.md
research/primary-sources/openspec.md
research/primary-sources/oracle-agent-spec.md
research/primary-sources/structurizr-dsl.md
research/primary-sources/cucumber-gherkin.md
research/primary-sources/kiro.md
research/primary-sources/openapi-3-1.md
research/primary-sources/spec-kit.md
research/primary-sources/leaddev-agent-compiled.md
research/primary-sources/symphony-spec.md
research/primary-sources/12-factor.md
research/primary-sources/sigstore-cosign.md
research/primary-sources/oci-artifacts.md
research/primary-sources/nix-flakes.md
research/primary-sources/helm-values-schema.md
research/primary-sources/diataxis.md
research/primary-sources/adr-nygard.md
research/primary-sources/c4-model.md
research/primary-sources/arc42.md
CLAUDE.md
AGENTS.md
README.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md
specs/2026-05-20-longread-structure/SPEC.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-18-repo-standup/SPEC.md
tests/hooks/run-tests.sh
LICENSE
schema/SPEC.schema.md
templates/IDEA.template.md
scripts/lint-spec.sh
scripts/validate-longread-structure.sh
templates/TASK.template.md
scripts/check-corpus-completeness.sh
templates/SPEC.task.template.md
scripts/validate-skill-frontmatter.sh
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
templates/SPEC.contract.template.md
hooks/block-verify-bypass.sh
hooks/verify-reminder.sh
hooks/block-edit-on-main.sh
hooks/block-push-to-main.sh
hooks/session-start-context.sh
hooks/block-ai-attribution.sh
hooks/block-git-add-all.sh
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/fixtures/msg-clean.txt

codex
The memory registry had no relevant hit for this repo/spec, so I’m relying on the live repository artefacts. I also see untracked `reviews/` files already present; I’ll ignore them unless they become useful context, since the requested target is the SPEC plus corpus.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	id: 2026-05-19-primary-source-research-corpus
     3	status: verified
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-installation-methodology
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: true
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
    13	  - test -f research/primary-sources/INDEX.md
    14	  - bash scripts/check-corpus-completeness.sh
    15	cites_decision: 2026-05-18-agentic-installation-methodology
    16	---
    17	
    18	# SPEC: Primary-Source Research Corpus (Deep-Research Preface)
    19	
    20	Status: Draft v1
    21	Type: Contract
    22	Purpose: govern the production of a structured primary-source
    23	research corpus that grounds every methodology claim in
    24	arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
    25	Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
    26	Agent Spec / reference-architecture literature before any
    27	methodology content (longread, SPEC bundle) lands. The corpus
    28	is the citable evidence base downstream slices draw from;
    29	the SPEC defines its shape, completeness gates, and
    30	citation discipline.
    31	
    32	## Normative Language
    33	
    34	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    35	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    36	document are to be interpreted as described in RFC 2119 and RFC 8174
    37	when, and only when, they appear in all capitals.
    38	
    39	## 1. Problem Statement
    40	
    41	The 2026-05-17 research workpad
    42	(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
    43	or upstream
    44	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
    45	§12 Verification Caveats records that several primary
    46	sources were "access-denied and characterized via WebSearch
    47	summaries cross-checked against multiple sources" — arc42,
    48	C4, ADR, Diátaxis, 12-factor. The methodology Product B
    49	publishes draws heavily on those primitives (research §3,
    50	§4, §5). Owner directive
    51	`decision-authority://owner:2026-05-18` ("base this all in
    52	deep research and best practices - not make up bullshit")
    53	forecloses publishing claims grounded in agent summaries
    54	when the primaries themselves are reachable with proper
    55	tooling (WebFetch, archive.org, primary-PDF retrieval). The
    56	methodology body (longread + SPEC bundle) MUST NOT land
    57	before each in-scope primary has a structured corpus entry
    58	that captures the verbatim claims the methodology depends
    59	on. This SPEC defines the corpus shape, the per-source
    60	artefact template, the completeness gate, and the citation
    61	discipline that binds the longread and SPEC bundle
    62	authoring slices to the corpus rather than to agent memory.
    63	
    64	## 2. Goals and Non-Goals
    65	
    66	Goals:
    67	
    68	- Define an exhaustive in-scope source list with rationale
    69	  per entry.
    70	- Define the per-source artefact template: front-matter,
    71	  fetch metadata, verbatim claim extracts, gap from prior
    72	  agent summary, citation surface.
    73	- Define a completeness gate enforced by a check script
    74	  (`scripts/check-corpus-completeness.sh`) so the corpus's
    75	  state is mechanically verifiable.
    76	- Establish the citation grammar binding: every methodology
    77	  claim in downstream artefacts MUST cite a corpus entry
    78	  via `file://research/primary-sources/<slug>.md§<n>`, not
    79	  agent memory.
    80	
    81	Non-goals:
    82	
    83	- Authoring the methodology longread or SPEC bundle
    84	  (subsequent slices).
    85	- Repacking Product A v1.1 into manifest+catalog v2.0
    86	  (sibling slice).
    87	- Resolving the seven open research questions enumerated in
    88	  the dispositioned research workpad §2.3 — the corpus
    89	  informs them; it does not pretend to resolve them.
    90	- A literature review essay. The corpus is structured
    91	  source artefacts, not synthesized prose.
    92	
    93	## 3. System Overview
    94	
    95	The deep-research corpus is a directory at
    96	`research/primary-sources/` inside this repo. Each in-scope
    97	source has one structured artefact at
    98	`research/primary-sources/<slug>.md`. An `INDEX.md` at the
    99	directory root lists every in-scope source, its slug, its
   100	current status (`pending` / `primary-read-complete` /
   101	`access-blocked` / `superseded`), and a one-line summary of
   102	the verbatim claims the methodology depends on from that
   103	source. A check script
   104	(`scripts/check-corpus-completeness.sh`) walks the index and
   105	reports gaps (`pending` entries, `access-blocked` entries
   106	without an alternative-source-found note, slugs in the
   107	index that lack a file under `research/primary-sources/`).
   108	
   109	Downstream methodology slices (longread, SPEC bundle) cite
   110	the corpus exclusively for primitives derived from these
   111	sources. Lint at the corpus-citation surface is enforced by
   112	a follow-on extension to `scripts/lint-spec.sh` (out of
   113	scope for this SPEC; deferred to a follow-on Task SPEC).
   114	
   115	The corpus is append-only on a per-entry basis; an entry
   116	may be superseded by a follow-on entry (slug-suffixed
   117	`-vN`) but never deleted. Provenance is preserved.
   118	
   119	## 4. Authority Map
   120	
   121	Active authority:
   122	
   123	- `decision-authority://owner:2026-05-18` — owner directive
   124	  ("base this all in deep research and best practices - not
   125	  make up bullshit") binding deep-primary-source discipline
   126	  before any methodology content lands.
   127	- Parent Decision SPEC at
   128	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   129	  §7 — binds Product B shape; §9 Locks unlock authoring of
   130	  follow-on slices including this preface.
   131	- Dispositioned research workpad at
   132	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   133	  §12 Verification Caveats — names the specific access-
   134	  denied primaries that this corpus closes the gap on.
   135	- `file://schema/SPEC.schema.md` — citation grammar,
   136	  RFC 2119 scoping rules, front-matter schema.
   137	
   138	Stale, superseded, or evidence-only:
   139	
   140	- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   141	  — superseded research workpad; evidence-only.
   142	
   143	Owner decisions required before implementation:
   144	
   145	- [ ] Confirm the §6 Domain Model source list is exhaustive
   146	      for v1.0; subsequent additions land as follow-on
   147	      Contract SPEC amendments.
   148	
   149	## 5. Code/Docs Reality Check
   150	
   151	- The `research/primary-sources/` directory does not yet
   152	  exist (`cmd://ls research/` returns "No such file" before
   153	  this slice executes).
   154	- The check script `scripts/check-corpus-completeness.sh`
   155	  does not yet exist (`cmd://test -f
   156	  scripts/check-corpus-completeness.sh` exits non-zero
   157	  pre-execution).
   158	- The `WebFetch` tool is the primary retrieval mechanism;
   159	  fallback is `cmd://curl -fsSL --max-time 30` for
   160	  endpoints WebFetch fails on, with archive.org
   161	  (`url://web.archive.org/web/*/`) as the
   162	  access-blocked fallback.
   163	
   164	## 6. Domain Model
   165	
   166	### 6.1 In-scope sources (v1.0)
   167	
   168	| Slug | Source | Primary URL | Why in scope |
   169	|---|---|---|---|
   170	| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
   171	| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
   172	| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
   173	| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
   174	| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
   175	| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
   176	| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
   177	| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' research/primary-sources/INDEX.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
# Primary-source corpus index

Source-list version: v1.1
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
| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |

## Status legend

- `pending` — source not yet fetched; corpus incomplete.
- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '160,380p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   160	  endpoints WebFetch fails on, with archive.org
   161	  (`url://web.archive.org/web/*/`) as the
   162	  access-blocked fallback.
   163	
   164	## 6. Domain Model
   165	
   166	### 6.1 In-scope sources (v1.0)
   167	
   168	| Slug | Source | Primary URL | Why in scope |
   169	|---|---|---|---|
   170	| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
   171	| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
   172	| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
   173	| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
   174	| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
   175	| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
   176	| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
   177	| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
   178	| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
   179	| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
   180	| symphony-spec | OpenAI Symphony SPEC.md | `url://github.com/openai/symphony/blob/main/SPEC.md` | In-the-wild operating-model-as-SPEC; research §3 transferable building blocks |
   181	| spec-kit | GitHub Spec Kit | `url://github.com/github/spec-kit` | Closest spec-as-authoring tool; research §2.1 |
   182	| kiro | Kiro spec-driven IDE | `url://kiro.dev` | Spec-driven IDE; research §2.1 |
   183	| openspec | OpenSpec project | `url://github.com/Fission-AI/OpenSpec` | New agentic spec project; surfaced by recent field state |
   184	| oracle-agent-spec | Oracle Agent Spec | `url://github.com/oracle/agent-spec` | Spec-as-agent-description; research §2.1 |
   185	| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
   186	| leaddev-agent-compiled | LeadDev "Can you trust the spec" article | `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software` | Closest published statement of the agentic-installation hypothesis (as risk); research §2.2 |
   187	| cucumber-gherkin | Cucumber / Gherkin reference | `url://cucumber.io/docs/gherkin/reference/` | Behavioral acceptance primitive; research §5.1 |
   188	| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
   189	| structurizr-dsl | Structurizr DSL (C4 implementation) | `url://docs.structurizr.com/dsl` | Machine-readable C4; research §5.1 |
   190	| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
   191	| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
   192	
   193	`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
   194	`file://../2026-05-19-codex-remediation-amendments/SPEC.md`
   195	§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
   196	baseline. Two further candidates flagged but NOT v1.1
   197	mandatory (deferred to corpus §17 Q4 v1.2 expansion):
   198	`dev-container-spec`, `slsa-in-toto`.
   199	
   200	Additions land as follow-on Contract SPEC amendments per
   201	§17 Open Questions.
   202	
   203	### 6.2 Per-source artefact schema
   204	
   205	Each `research/primary-sources/<slug>.md` is a markdown
   206	document with the following front-matter and section
   207	structure:
   208	
   209	```yaml
   210	---
   211	slug: <slug>            # matches §6.1 row
   212	source_name: "<Full name>"
   213	primary_url: "<URL>"
   214	fetched_via: "WebFetch" | "curl" | "archive.org" | "manual"
   215	fetched_on: <YYYY-MM-DD>
   216	fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
   217	fetch_evidence: "<one-line digest of fetch result or
   218	                  fallback used>"
   219	supersedes: <slug>      # OPTIONAL; for vN entries
   220	methodology_relevance: |
   221	  <one-paragraph statement of which methodology claims
   222	   draw on this source>
   223	---
   224	```
   225	
   226	Required sections (in order):
   227	
   228	1. **§1 Source identity** — name, canonical URL,
   229	   maintainer / publisher, license / copyright posture
   230	   (the bar for fair-use excerpts in our corpus).
   231	2. **§2 Fetch trace** — what was attempted, what worked,
   232	   what was blocked. Cites the agent tool calls
   233	   (`cmd://WebFetch <url>`, `cmd://curl -fsSL <url>`)
   234	   with one-line outcome digests.
   235	3. **§3 Verbatim claims this corpus depends on** —
   236	   the primary's own words, quoted. Each quote is
   237	   attributed by §-and-paragraph (or chapter / section
   238	   identifier from the source) and accompanied by a
   239	   methodology-relevance note. Quotes MAY be excerpted
   240	   per fair-use limits per §6.3.
   241	4. **§4 Gap from prior summary characterization** — what
   242	   the 2026-05-17 research workpad (or earlier agent
   243	   summaries) got right, what it got wrong or imprecise,
   244	   and what new primary-anchored claims are now available
   245	   to the methodology body.
   246	5. **§5 Downstream-citation surface** — the set of
   247	   methodology claims this entry now licenses, expressed
   248	   as `methodology-claim: "<claim>"` paired with the
   249	   §1-§3 anchor that supports it.
   250	6. **§6 Open questions surfaced by the primary read** —
   251	   things the primary itself doesn't answer that the
   252	   methodology may have to flag as open. Distinct from
   253	   the seven research-workpad open questions; these
   254	   are primary-anchored unknowns.
   255	
   256	### 6.3 Citation and fair-use posture
   257	
   258	Verbatim quotes in §3 of each artefact are excerpts for
   259	research and methodology purposes; per US fair-use
   260	doctrine (and equivalents in other jurisdictions), the
   261	corpus is editorial commentary on published sources, not
   262	republication. Each quote is bounded — typically
   263	≤ 50 words, never exceeding the smaller of (a) one
   264	paragraph of source text or (b) 200 words. The artefact
   265	is the methodology's editorial citation surface, not a
   266	mirror. When the source's license is permissive
   267	(Apache-2.0 / MIT / CC-BY for documentation), longer
   268	excerpts MAY be included with attribution.
   269	
   270	### 6.4 INDEX.md contract
   271	
   272	`research/primary-sources/INDEX.md` is the corpus's
   273	machine-checkable index. Format:
   274	
   275	```markdown
   276	# Primary-source corpus index
   277	
   278	Source-list version: v1.0
   279	Last updated: <YYYY-MM-DD>
   280	
   281	| Slug | Status | Fetched on | Methodology summary |
   282	|---|---|---|---|
   283	| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
   284	| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
   285	| ... | ... | ... | ... |
   286	```
   287	
   288	Every row's `Slug` MUST correspond to a `<slug>.md` file in
   289	the directory; every `<slug>.md` file MUST have a row in
   290	INDEX.md. The check script enforces both directions.
   291	
   292	## 7. Behavior Specification
   293	
   294	### 7.1 Per-source read procedure
   295	
   296	For each in-scope source (§6.1):
   297	
   298	1. **Identify primary URL.** Use §6.1's primary URL as
   299	   starting point.
   300	2. **Fetch via WebFetch.** Capture the response. If
   301	   WebFetch returns content, set `fetched_via: WebFetch`.
   302	3. **Fallback chain on failure.** If WebFetch fails:
   303	   a. Retry with `curl -fsSL --max-time 30 <url>`.
   304	   b. If primary URL is access-blocked, attempt
   305	      `url://web.archive.org/web/<recent-snapshot>/<url>`
   306	      via WebFetch.
   307	   c. If all fail, set `fetch_outcome: access-blocked`
   308	      and §2 Fetch trace records every attempted call.
   309	      The slug remains in INDEX.md with that status; an
   310	      alternative-source-found note is REQUIRED in §6
   311	      Open Questions of that artefact OR the
   312	      methodology MUST NOT cite primitives from that
   313	      source in downstream slices.
   314	4. **Extract verbatim claims** germane to the
   315	   methodology's §3 / §4 / §5 from the research workpad
   316	   (or the dispositioned-research §11.5 disposition
   317	   table). Each quote is attributed and bounded per §6.3.
   318	5. **Author the artefact** at
   319	   `research/primary-sources/<slug>.md` per §6.2 schema.
   320	6. **Update INDEX.md** to add the row (or update status
   321	   if the slug already had a `pending` placeholder).
   322	7. **Lint the artefact**:
   323	   `bash scripts/lint-spec.sh
   324	   research/primary-sources/<slug>.md` SHOULD exit 0.
   325	   The lint may not be a perfect fit for non-SPEC
   326	   artefacts; lint exit 1 on a corpus artefact is
   327	   advisory unless the failure is uncited-claim, which
   328	   IS blocking — corpus artefacts above all else MUST
   329	   carry citations.
   330	
   331	### 7.2 INDEX-driven check script
   332	
   333	`scripts/check-corpus-completeness.sh` MUST:
   334	
   335	1. Read INDEX.md and parse every row.
   336	2. For each row's slug, verify
   337	   `research/primary-sources/<slug>.md` exists.
   338	3. For each `<slug>.md` file, verify a row exists in
   339	   INDEX.md with matching slug.
   340	4. Verify every row's status is one of
   341	   `primary-read-complete | partial | access-blocked |
   342	   superseded | pending`.
   343	5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
   344	   version frozen in §6.1 of this SPEC.
   345	6. Exit 0 if every slug in INDEX.md is either
   346	   `primary-read-complete` or has a documented
   347	   `access-blocked` (with §6 alternative note); else
   348	   exit non-zero with diagnostic lines per gap.
   349	
   350	### 7.3 Corpus citation binding (downstream slices)
   351	
   352	Downstream methodology slices (longread, SPEC bundle)
   353	cite primitives from these sources via
   354	`file://research/primary-sources/<slug>.md §<n>` or by
   355	fully-qualified-URL-with-corpus-anchor
   356	`file://research/primary-sources/<slug>.md` when the
   357	whole entry is the relevance. Agent memory and prior
   358	agent summaries are NOT citable for any claim drawn
   359	from a source in §6.1's scope.
   360	
   361	The lint extension to enforce this binding is out of
   362	scope; it lands as a follow-on Task SPEC. In the
   363	interim, reviewers (cross-family and same-family)
   364	enforce manually.
   365	
   366	## 8. Schema Specification
   367	
   368	### 8.1 Per-source artefact front-matter (formal)
   369	
   370	```yaml
   371	slug:               # string; matches §6.1 row; required
   372	source_name:        # string; required; full source name
   373	primary_url:        # string; required; canonical URL
   374	fetched_via:        # enum: WebFetch | curl | archive.org | manual
   375	fetched_on:         # date: YYYY-MM-DD; required
   376	fetch_outcome:      # enum: primary-read-complete | partial |
   377	                    #       access-blocked
   378	fetch_evidence:     # string; required; one-line digest
   379	supersedes:         # string; optional; slug of prior entry
   380	methodology_relevance: |  # string; multi-line; required

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/INDEX.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	# Primary-source corpus index
     2	
     3	Source-list version: v1.1
     4	Last updated: 2026-05-19
     5	
     6	Per
     7	`file://../../specs/2026-05-19-primary-source-research-corpus/SPEC.md`
     8	§6.1, §6.4. Every slug listed below has a corresponding
     9	artefact file at `research/primary-sources/<slug>.md`. The
    10	check script `scripts/check-corpus-completeness.sh` enforces
    11	the bijection and the completeness state.
    12	
    13	| Slug | Status | Fetched on | Methodology summary |
    14	|---|---|---|---|
    15	| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
    16	| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
    17	| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
    18	| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
    19	| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
    20	| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
    21	| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
    22	| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); strongest reproducibility primitive |
    23	| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
    24	| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
    25	| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
    26	| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
    27	| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
    28	| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
    29	| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
    30	| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
    31	| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
    32	| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
    33	| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
    34	| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
    35	| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
    36	| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |
    37	
    38	## Status legend
    39	
    40	- `pending` — source not yet fetched; corpus incomplete.
    41	- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
    42	- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
    43	- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
    44	- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba reviews/codex-2026-05-19/02-corpus.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	Reading additional input from stdin...
     2	OpenAI Codex v0.129.0 (research preview)
     3	--------
     4	workdir: /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
     5	model: gpt-5.5
     6	provider: openai
     7	approval: never
     8	sandbox: read-only
     9	reasoning effort: xhigh
    10	reasoning summaries: none
    11	session id: 019e3e53-0e1f-77a0-9a32-cd53f524e819
    12	--------
    13	user
    14	Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
    15	codex
    16	I’ll keep this read-only and treat it as a review gate: first confirm the active repo artefacts and line numbers, then inspect the specified sample deeply enough to issue file:line findings.
    17	exec
    18	/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|agentic ops framework|Product B" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
    19	 exited 1 in 0ms:
    20	exec
    21	/home/linuxbrew/.linuxbrew/bin/bash -c 'pwd && git status --short && rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
    22	 succeeded in 0ms:
    23	/var/home/hasnobeef/buildepicshit/agentic-installation-methodology
    24	?? reviews/
    25	reviews/codex-2026-05-19/02-corpus.md
    26	reviews/codex-2026-05-19/01-parent-decision.md
    27	research/primary-sources/INDEX.md
    28	research/primary-sources/ref-arch-vs-solution-arch.md
    29	research/primary-sources/adr-tools-state.md
    30	research/primary-sources/openspec.md
    31	research/primary-sources/oracle-agent-spec.md
    32	research/primary-sources/structurizr-dsl.md
    33	research/primary-sources/cucumber-gherkin.md
    34	research/primary-sources/kiro.md
    35	research/primary-sources/openapi-3-1.md
    36	research/primary-sources/spec-kit.md
    37	research/primary-sources/leaddev-agent-compiled.md
    38	research/primary-sources/symphony-spec.md
    39	research/primary-sources/12-factor.md
    40	research/primary-sources/sigstore-cosign.md
    41	research/primary-sources/oci-artifacts.md
    42	research/primary-sources/nix-flakes.md
    43	research/primary-sources/helm-values-schema.md
    44	research/primary-sources/diataxis.md
    45	research/primary-sources/adr-nygard.md
    46	research/primary-sources/c4-model.md
    47	research/primary-sources/arc42.md
    48	CLAUDE.md
    49	AGENTS.md
    50	README.md
    51	CONTRIBUTING.md
    52	CODE_OF_CONDUCT.md
    53	specs/2026-05-20-longread-structure/SPEC.md
    54	specs/2026-05-19-primary-source-research-corpus/SPEC.md
    55	specs/2026-05-18-repo-standup/SPEC.md
    56	tests/hooks/run-tests.sh
    57	LICENSE
    58	schema/SPEC.schema.md
    59	templates/IDEA.template.md
    60	scripts/lint-spec.sh
    61	scripts/validate-longread-structure.sh
    62	templates/TASK.template.md
    63	scripts/check-corpus-completeness.sh
    64	templates/SPEC.task.template.md
    65	scripts/validate-skill-frontmatter.sh
    66	templates/SPEC.fastpath.template.md
    67	templates/SPEC.decision.template.md
    68	templates/SPEC.contract.template.md
    69	hooks/block-verify-bypass.sh
    70	hooks/verify-reminder.sh
    71	hooks/block-edit-on-main.sh
    72	hooks/block-push-to-main.sh
    73	hooks/session-start-context.sh
    74	hooks/block-ai-attribution.sh
    75	hooks/block-git-add-all.sh
    76	tests/hooks/fixtures/msg-with-coauthor.txt
    77	tests/hooks/fixtures/msg-clean.txt
    78	
    79	codex
    80	The memory registry had no relevant hit for this repo/spec, so I’m relying on the live repository artefacts. I also see untracked `reviews/` files already present; I’ll ignore them unless they become useful context, since the requested target is the SPEC plus corpus.
    81	exec
    82	/home/linuxbrew/.linuxbrew/bin/bash -c 'nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
    83	 succeeded in 0ms:
    84	     1	---
    85	     2	id: 2026-05-19-primary-source-research-corpus
    86	     3	status: verified
    87	     4	type: contract
    88	     5	owner: HasNoBeef
    89	     6	repo: agentic-installation-methodology
    90	     7	branch_policy: main-direct
    91	     8	risk: medium
    92	     9	requires_network: true
    93	    10	requires_secrets: []
    94	    11	acceptance_commands:
    95	    12	  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
    96	    13	  - test -f research/primary-sources/INDEX.md
    97	    14	  - bash scripts/check-corpus-completeness.sh
    98	    15	cites_decision: 2026-05-18-agentic-installation-methodology
    99	    16	---
   100	    17	
   101	    18	# SPEC: Primary-Source Research Corpus (Deep-Research Preface)
   102	    19	
   103	    20	Status: Draft v1
   104	    21	Type: Contract
   105	    22	Purpose: govern the production of a structured primary-source
   106	    23	research corpus that grounds every methodology claim in
   107	    24	arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
   108	    25	Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
   109	    26	Agent Spec / reference-architecture literature before any
   110	    27	methodology content (longread, SPEC bundle) lands. The corpus
   111	    28	is the citable evidence base downstream slices draw from;
   112	    29	the SPEC defines its shape, completeness gates, and
   113	    30	citation discipline.
   114	    31	
   115	    32	## Normative Language
   116	    33	
   117	    34	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
   118	    35	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
   119	    36	document are to be interpreted as described in RFC 2119 and RFC 8174
   120	    37	when, and only when, they appear in all capitals.
   121	    38	
   122	    39	## 1. Problem Statement
   123	    40	
   124	    41	The 2026-05-17 research workpad
   125	    42	(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
   126	    43	or upstream
   127	    44	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   128	    45	§12 Verification Caveats records that several primary
   129	    46	sources were "access-denied and characterized via WebSearch
   130	    47	summaries cross-checked against multiple sources" — arc42,
   131	    48	C4, ADR, Diátaxis, 12-factor. The methodology Product B
   132	    49	publishes draws heavily on those primitives (research §3,
   133	    50	§4, §5). Owner directive
   134	    51	`decision-authority://owner:2026-05-18` ("base this all in
   135	    52	deep research and best practices - not make up bullshit")
   136	    53	forecloses publishing claims grounded in agent summaries
   137	    54	when the primaries themselves are reachable with proper
   138	    55	tooling (WebFetch, archive.org, primary-PDF retrieval). The
   139	    56	methodology body (longread + SPEC bundle) MUST NOT land
   140	    57	before each in-scope primary has a structured corpus entry
   141	    58	that captures the verbatim claims the methodology depends
   142	    59	on. This SPEC defines the corpus shape, the per-source
   143	    60	artefact template, the completeness gate, and the citation
   144	    61	discipline that binds the longread and SPEC bundle
   145	    62	authoring slices to the corpus rather than to agent memory.
   146	    63	
   147	    64	## 2. Goals and Non-Goals
   148	    65	
   149	    66	Goals:
   150	    67	
   151	    68	- Define an exhaustive in-scope source list with rationale
   152	    69	  per entry.
   153	    70	- Define the per-source artefact template: front-matter,
   154	    71	  fetch metadata, verbatim claim extracts, gap from prior
   155	    72	  agent summary, citation surface.
   156	    73	- Define a completeness gate enforced by a check script
   157	    74	  (`scripts/check-corpus-completeness.sh`) so the corpus's
   158	    75	  state is mechanically verifiable.
   159	    76	- Establish the citation grammar binding: every methodology
   160	    77	  claim in downstream artefacts MUST cite a corpus entry
   161	    78	  via `file://research/primary-sources/<slug>.md§<n>`, not
   162	    79	  agent memory.
   163	    80	
   164	    81	Non-goals:
   165	    82	
   166	    83	- Authoring the methodology longread or SPEC bundle
   167	    84	  (subsequent slices).
   168	    85	- Repacking Product A v1.1 into manifest+catalog v2.0
   169	    86	  (sibling slice).
   170	    87	- Resolving the seven open research questions enumerated in
   171	    88	  the dispositioned research workpad §2.3 — the corpus
   172	    89	  informs them; it does not pretend to resolve them.
   173	    90	- A literature review essay. The corpus is structured
   174	    91	  source artefacts, not synthesized prose.
   175	    92	
   176	    93	## 3. System Overview
   177	    94	
   178	    95	The deep-research corpus is a directory at
   179	    96	`research/primary-sources/` inside this repo. Each in-scope
   180	    97	source has one structured artefact at
   181	    98	`research/primary-sources/<slug>.md`. An `INDEX.md` at the
   182	    99	directory root lists every in-scope source, its slug, its
   183	   100	current status (`pending` / `primary-read-complete` /
   184	   101	`access-blocked` / `superseded`), and a one-line summary of
   185	   102	the verbatim claims the methodology depends on from that
   186	   103	source. A check script
   187	   104	(`scripts/check-corpus-completeness.sh`) walks the index and
   188	   105	reports gaps (`pending` entries, `access-blocked` entries
   189	   106	without an alternative-source-found note, slugs in the
   190	   107	index that lack a file under `research/primary-sources/`).
   191	   108	
   192	   109	Downstream methodology slices (longread, SPEC bundle) cite
   193	   110	the corpus exclusively for primitives derived from these
   194	   111	sources. Lint at the corpus-citation surface is enforced by
   195	   112	a follow-on extension to `scripts/lint-spec.sh` (out of
   196	   113	scope for this SPEC; deferred to a follow-on Task SPEC).
   197	   114	
   198	   115	The corpus is append-only on a per-entry basis; an entry
   199	   116	may be superseded by a follow-on entry (slug-suffixed
   200	   117	`-vN`) but never deleted. Provenance is preserved.
   201	   118	
   202	   119	## 4. Authority Map
   203	   120	
   204	   121	Active authority:
   205	   122	
   206	   123	- `decision-authority://owner:2026-05-18` — owner directive
   207	   124	  ("base this all in deep research and best practices - not
   208	   125	  make up bullshit") binding deep-primary-source discipline
   209	   126	  before any methodology content lands.
   210	   127	- Parent Decision SPEC at
   211	   128	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   212	   129	  §7 — binds Product B shape; §9 Locks unlock authoring of
   213	   130	  follow-on slices including this preface.
   214	   131	- Dispositioned research workpad at
   215	   132	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   216	   133	  §12 Verification Caveats — names the specific access-
   217	   134	  denied primaries that this corpus closes the gap on.
   218	   135	- `file://schema/SPEC.schema.md` — citation grammar,
   219	   136	  RFC 2119 scoping rules, front-matter schema.
   220	   137	
   221	   138	Stale, superseded, or evidence-only:
   222	   139	
   223	   140	- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   224	   141	  — superseded research workpad; evidence-only.
   225	   142	
   226	   143	Owner decisions required before implementation:
   227	   144	
   228	   145	- [ ] Confirm the §6 Domain Model source list is exhaustive
   229	   146	      for v1.0; subsequent additions land as follow-on
   230	   147	      Contract SPEC amendments.
   231	   148	
   232	   149	## 5. Code/Docs Reality Check
   233	   150	
   234	   151	- The `research/primary-sources/` directory does not yet
   235	   152	  exist (`cmd://ls research/` returns "No such file" before
   236	   153	  this slice executes).
   237	   154	- The check script `scripts/check-corpus-completeness.sh`
   238	   155	  does not yet exist (`cmd://test -f
   239	   156	  scripts/check-corpus-completeness.sh` exits non-zero
   240	   157	  pre-execution).
   241	   158	- The `WebFetch` tool is the primary retrieval mechanism;
   242	   159	  fallback is `cmd://curl -fsSL --max-time 30` for
   243	   160	  endpoints WebFetch fails on, with archive.org
   244	   161	  (`url://web.archive.org/web/*/`) as the
   245	   162	  access-blocked fallback.
   246	   163	
   247	   164	## 6. Domain Model
   248	   165	
   249	   166	### 6.1 In-scope sources (v1.0)
   250	   167	
   251	   168	| Slug | Source | Primary URL | Why in scope |
   252	   169	|---|---|---|---|
   253	   170	| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
   254	   171	| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
   255	   172	| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
   256	   173	| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
   257	   174	| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
   258	   175	| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
   259	   176	| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
   260	   177	| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	id: 2026-05-19-codex-remediation-amendments
     3	status: verified
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-installation-methodology
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-19-codex-remediation-amendments/SPEC.md
    13	cites_decision: 2026-05-18-agentic-installation-methodology
    14	amends:
    15	  - ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
    16	  - ../2026-05-19-primary-source-research-corpus/SPEC.md
    17	  - ../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
    18	---
    19	
    20	# SPEC: Codex Remediation Amendments — Round 4-5 Batch
    21	
    22	Status: Draft v1
    23	Type: Contract (amendments package)
    24	Purpose: consolidate the remaining seven findings from the
    25	codex cross-family review at
    26	`file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md` as
    27	a single coordinated amendment batch. Each numbered §7
    28	sub-amendment patches a specific section of a verified
    29	parent SPEC; this Contract is the binding wrapper so the
    30	owner can approve the batch in one pass rather than
    31	authoring four separate amendment SPECs.
    32	
    33	## Normative Language
    34	
    35	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    36	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    37	document are to be interpreted as described in RFC 2119 and RFC 8174
    38	when, and only when, they appear in all capitals.
    39	
    40	## 1. Problem Statement
    41	
    42	The codex cross-family review at
    43	`file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
    44	returned 27 findings across the methodology arc. Rounds 1-4
    45	of remediation addressed 20 findings via direct edits
    46	(SPEC-text drift corrections, status truth, citation
    47	overreach, broken cross-repo paths, fleet-sync guard, voice
    48	rule, BES leakage, word budget, per-chapter failure notes).
    49	Seven findings remain; each requires an amendment to a
    50	verified parent SPEC's contract surface (not drift
    51	correction):
    52	
    53	- Parent Decision SPEC at
    54	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`:
    55	  findings 1.1, 1.2, 1.3, 1.4 (candidate-space, facet
    56	  classification, trade-off matrix, locks scope).
    57	- Corpus Contract SPEC at
    58	  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`:
    59	  finding 2.3 (source-list expansion).
    60	- v2.0 Repack Contract SPEC at
    61	  `file://../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`:
    62	  findings 3.5, 3.6 (manifest schema expansion + behavior.primary
    63	  field-vs-directory drift).
    64	- Plus one new-tooling Task SPEC obligation (finding 4.2, <!-- lint-ok: no-citation -->
    65	  corpus-citation lint extension) which this Contract names
    66	  as a follow-on without authoring the Task SPEC inline.
    67	
    68	The seven amendments are consolidated here because (a)
    69	they share a single provenance (the codex review); (b)
    70	they're all derived from the same review evidence; (c)
    71	batching them avoids seven separate owner-approval cycles;
    72	(d) the amendments don't share execution dependencies that
    73	would force separate sequencing.
    74	
    75	## 2. Goals and Non-Goals
    76	
    77	Goals:
    78	
    79	- Enumerate the seven amendment patches per §7
    80	  sub-amendments below, each with target SPEC + target
    81	  section + before/after text.
    82	- Document the codex finding each patch derives from for
    83	  audit traceability.
    84	- Bind the amendments to a single approval batch so the
    85	  owner can flip approved-pending-owner → approved in one
    86	  pass.
    87	
    88	Non-goals:
    89	
    90	- Authoring the corpus-citation lint extension itself
    91	  (finding 4.2 — that's a separate Task SPEC).
    92	- Re-running cross-family review on the amended state
    93	  (that's a separate post-remediation slice).
    94	- Retroactively re-tagging v2.0.0 of agentic-ops-framework
    95	  (the v2.0.0 release stands; the manifest-schema
    96	  expansion in §7.E lands as v2.1 when authored).
    97	
    98	## 3. System Overview
    99	
   100	This Contract is **a package of amendment patches**.
   101	Execution is per-§7-sub-amendment direct edit of the named
   102	target SPEC's named section. Each patch is small (≤ ~20
   103	lines of SPEC-text change typically). Verification is per-
   104	patch lint pass on the amended target SPEC.
   105	
   106	The Contract itself does NOT change the framework's
   107	operating model. The parent SPECs being amended retain
   108	their `verified` status; their amendments are recorded
   109	both in this SPEC's §7 and in the targets' own commit
   110	history.
   111	
   112	## 4. Authority Map
   113	
   114	Active authority:
   115	
   116	- `decision-authority://owner:2026-05-19` — owner directive
   117	  "okay we should addreess all of these" authorising
   118	  remediation across all 27 codex findings.
   119	- Codex cross-family review evidence at
   120	  `file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
   121	  + per-target review at
   122	  `file://../../reviews/codex-2026-05-19/01-parent-decision.md`,
   123	  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
   124	  `file://../../reviews/codex-2026-05-19/03-v2-repack.md`,
   125	  `file://../../reviews/codex-2026-05-19/04-longread.md`.
   126	- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
   127	  ("External cross-family validation pass surfaces a
   128	  structural flaw") authorising amendment of the parent
   129	  Decision via this follow-on Contract.
   130	
   131	Stale, superseded, or evidence-only sources: none specific
   132	to this Contract.
   133	
   134	Owner decisions required before implementation:
   135	
   136	- [ ] Approve the seven sub-amendments as a batch
   137	      (`approved-pending-owner` → `approved` on this
   138	      Contract).
   139	
   140	## 5. Code/Docs Reality Check
   141	
   142	- All target SPECs currently exist at the paths cited in <!-- lint-ok: no-citation -->
   143	  §1 and are at status: verified.
   144	- Rounds 1-4 remediation commits are durably landed on <!-- lint-ok: no-citation -->
   145	  origin/main of all three repos.
   146	- The codex review evidence is committed at
   147	  `file://../../reviews/codex-2026-05-19/` (5 files
   148	  including SYNTHESIS).
   149	
   150	## 6. Domain Model
   151	
   152	The amendments span three categories:
   153	
   154	1. **Candidate-space + locks** (parent Decision §5, §6,
   155	   §9): findings 1.1, 1.2, 1.4.
   156	2. **Trade-off matrix** (parent Decision §6): finding
   157	   1.3.
   158	3. **Source-list expansion** (corpus §6.1): finding 2.3.
   159	4. **Schema expansion + drift fix** (v2.0 repack §6.1,
   160	   §8): findings 3.5, 3.6.
   161	5. **New tooling Task SPEC** (queued as follow-on, not
   162	   inline): finding 4.2.
   163	
   164	## 7. Pipeline Specification (the seven sub-amendments)
   165	
   166	### §7.A — Parent Decision §5: add paper-style + bundle-only candidates (finding 1.1, 1.4)
   167	
   168	Target:
   169	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   170	§5 Candidate Options.
   171	
   172	Patch: insert two new candidates §5.5 and §5.6 with the
   173	required fields (Description / Fit-with-substance /
   174	Fit-with-constraints / Cost / Risk), labelled REJECTED
   175	with rationale:
   176	
   177	- §5.5 Paper-style (arxiv / workshop) — rejected because
   178	  it doubles down on the spec-as-distribution claim by
   179	  publishing through an academic channel, but the
   180	  academic channel adds review latency + format
   181	  constraints that conflict with the methodology's
   182	  honest-experiential posture; the longread channel
   183	  delivers the same content with less ceremony.
   184	- §5.6 SPEC-bundle-only (no longread) — rejected because
   185	  it sacrifices the case-study density per parent §8
   186	  Posture; identical reasoning to candidate 5.2 but
   187	  named explicitly as a rejected shape.
   188	
   189	§9 Locks UPDATE: add SPEC-bundle-only and paper-style to
   190	the "Forecloses" list. Move the existing blog-only +
   191	series-only entries into a single "Forecloses
   192	shape-without-SPEC-bundle" entry consolidating both
   193	underspecified-publication-channel options.
   194	
   195	### §7.B — Parent Decision §6 + §7: conformance + signing as first-class facets (finding 1.2)
   196	
   197	Target: parent Decision SPEC §6 Trade-off Comparison + §7
   198	Decision Statement.
   199	
   200	Patch:
   201	
   202	- §6 trade-off criteria UPDATE: add a new criterion
   203	  "executable conformance + signed-distribution
   204	  surface" with high weight, sourced from research §5.1.
   205	- §7 Decision Statement INSERT: a clause stating
   206	  conformance suite + signed distribution are
   207	  **first-class** facets of the SPEC bundle, not
   208	  "additional facets requiring amendment". The §9 Locks
   209	  list moves these from "amend to add" status to
   210	  "REQUIRED at v1.0".
   211	
   212	### §7.C — Parent Decision §6 + §8: disambiguate honest-disclosure matrix row (finding 1.3)
   213	
   214	Target: parent Decision SPEC §6 trade-off matrix +
   215	§8 Decision Rationale row 3 reference.
   216	
   217	Patch:
   218	
   219	- §6 RENAME the "honest disclosure" criterion to
   220	  "failure-mode + open-question publication surface".
   221	  Re-score the candidates so this criterion measures only
   222	  the publication surface (whether the format LANDS
   223	  failure modes + open questions as first-class
   224	  content), not whether they're "disclosed" generically
   225	  (which the longread + SPEC bundle + blog + series all
   226	  technically can).
   227	- §8 UPDATE rationale citing this criterion's new
   228	  precise name.
   229	
   230	### §7.D — Corpus Contract §6.1: source-list expansion (finding 2.3)
   231	
   232	Target:
   233	`file://../2026-05-19-primary-source-research-corpus/SPEC.md`
   234	§6.1 In-scope sources (v1.0).
   235	
   236	Patch: add two REQUIRED v1.0 entries to the §6.1 table
   237	(and bump `SOURCE_LIST_VERSION` to v1.1; updates the
   238	check script's expectation):
   239	
   240	- `json-schema` — JSON Schema spec (Draft 2020-12);
   241	  primary URL `url://json-schema.org/specification.html`.
   242	  Methodology relevance: Helm values-schema + OpenAPI
   243	  3.1 both rely on JSON Schema; the methodology's
   244	  customization sub-spec validates against JSON Schema;
   245	  citing Helm + OpenAPI without citing the underlying
   246	  primitive is a transitive citation gap.
   247	- `cyclonedx-sbom` — CycloneDX SBOM specification;
   248	  primary URL `url://cyclonedx.org/specification/overview/`.
   249	  Methodology relevance: the methodology's audit /
   250	  provenance story (research §4.4 + LeadDev §3
   251	  regulated-environments framing) needs a primary SBOM
   252	  source.
   253	
   254	Two additional candidates flagged but NOT v1.0
   255	mandatory (deferred to v1.1 corpus expansion):
   256	`dev-container-spec`, `slsa-in-toto`. These remain in
   257	§17 Open Questions as v1.1 candidates.
   258	
   259	### §7.E — v2.0 Repack Contract §6.1 + §8: expand manifest schema (finding 3.5)
   260	
   261	Target:
   262	`file://../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
   263	§6.1 + §8.
   264	
   265	Patch: amend the front-door manifest schema to add the
   266	following fields at the top level:
   267	
   268	- `schema_uri` (string, REQUIRED) — URL of the schema
   269	  this manifest conforms to (currently inline at §6.1;
   270	  externalising lets adopters reference a versioned
   271	  remote schema).
   272	- `source_commit` (string, REQUIRED) — git commit SHA the
   273	  bundle was generated from (binds the bundle to its
   274	  source-of-truth state).
   275	- `source_tag` (string, OPTIONAL) — git tag if the bundle
   276	  corresponds to a tagged release.
   277	- Per-facet record fields: `media_type` (string,
   278	  RECOMMENDED), `digest` (string, RECOMMENDED;
   279	  `algorithm:hex` form per OCI Descriptor convention),
   280	  `size` (integer, OPTIONAL), `status` (enum:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"2\\.[1-9]|Finding|Quality Gate|FAIL|PASS|severity|BLOCK|MEDIUM|HIGH|LOW|lint|status truth|source-list|OCI|Docker|Symphony|Willison|reference architecture|Nix|CycloneDX|JSON Schema\" reviews/codex-2026-05-19/02-corpus.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
60:scripts/lint-spec.sh
95:    12	  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
107:    24	arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
108:    25	Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
171:    88	  the dispositioned research workpad §2.3 — the corpus
195:   112	a follow-on extension to `scripts/lint-spec.sh` (out of
254:   171	| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
260:   177	| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
261:   178	| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
263:   180	| symphony-spec | OpenAI Symphony SPEC.md | `url://github.com/openai/symphony/blob/main/SPEC.md` | In-the-wild operating-model-as-SPEC; research §3 transferable building blocks |
264:   181	| spec-kit | GitHub Spec Kit | `url://github.com/github/spec-kit` | Closest spec-as-authoring tool; research §2.1 |
265:   182	| kiro | Kiro spec-driven IDE | `url://kiro.dev` | Spec-driven IDE; research §2.1 |
267:   184	| oracle-agent-spec | Oracle Agent Spec | `url://github.com/oracle/agent-spec` | Spec-as-agent-description; research §2.1 |
268:   185	| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
269:   186	| leaddev-agent-compiled | LeadDev "Can you trust the spec" article | `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software` | Closest published statement of the agentic-installation hypothesis (as risk); research §2.2 |
397:   314	   `bash scripts/lint-spec.sh
399:   316	   The lint may not be a perfect fit for non-SPEC
400:   317	   artefacts; lint exit 1 on a corpus artefact is
435:   352	The lint extension to enforce this binding is out of
532:   449	### 11.2 Adversarial spec consumption (research §2.3.7)
558:   475	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
571:   488	      authored, executable, lint clean against shellcheck
588:   505	- [x] AC-1: `cmd://bash scripts/lint-spec.sh
608:   525	- [x] AC-9: Cross-family review (BLOCKING per parent
622:   539	- The source-list version drifts because §6.1 is
644:   561	- [ ] Q2: The corpus-citation-binding lint extension is
646:   563	      to add the lint extension as a follow-on Task SPEC
651:   568	      BLOCKING per slice. Same-family self-review is the
660:   577	      (CycloneDX), Pact for contract testing, JSON
680:   597	Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
683:   600	  hypothesis space). <!-- lint-ok: no-citation -->
685:   602	  the methodology actually rests on. <!-- lint-ok: no-citation -->
728:   645	- `cmd://bash scripts/lint-spec.sh
732:   649	  exit 0; PASS — 20 sources, all complete.
733:   650	- Per-artefact `cmd://bash scripts/lint-spec.sh
735:   652	  (lint script is designed for SPEC artefacts; corpus
737:   654	  `type:`). Per this SPEC §7.1, lint exit 1 on a
745:   662	PASS. All §15 ACs met:
747:   664	- AC-1: SPEC.md lint clean (exit 0).
758:   675	  the 18-section Symphony list and 12-factor's 12
762:   679	  access-blocked) and the source-list discoveries
777:   694	- **Per-artefact lint mismatch**: the lint script
781:   698	  check is the authoritative gate. If future lint
782:   699	  evolution adds corpus-mode, the per-artefact lint
816:   733	  research workpad §2.3 (exhaustiveness vs.
835:   752	- **Lint-vs-corpus impedance**: the SPEC's lint script
839:   756	  spurious lint errors. Two paths: (a) extend
840:   757	  lint-spec.sh with a corpus-mode (out of scope here);
841:   758	  (b) accept lint as advisory for corpus per the
843:   760	  spec-evidence for future linter design: lints should
850:   767	  (Symphony's 18-section list, 12-factor's 12 factor
889:    21	| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
898:    30	| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
899:    31	| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
901:    33	| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
1008:    92	- The exact 12-section list is now confirmed and citable <!-- lint-ok: no-citation -->
1010:    94	- arc42's self-description ("template for architecture <!-- lint-ok: no-citation -->
1013:    97	- arc42's adaptable-not-prescriptive posture is confirmed <!-- lint-ok: no-citation -->
1025:   109	- methodology-claim: "arc42 ships a 12-section structure <!-- lint-ok: no-citation -->
1030:   114	- methodology-claim: "arc42 §9 Architecture Decisions <!-- lint-ok: no-citation -->
1034:   118	- methodology-claim: "arc42 is pragmatic and adaptable, not <!-- lint-ok: no-citation -->
1036:   120	- methodology-claim: "arc42 §8 Concepts covers crosscutting <!-- lint-ok: no-citation -->
1120:    61	  "applications and data stores" — distinct from Docker
1123:    64	  Docker-disambiguation sentence in the fetched excerpt.
1152:    93	- The exact four-level hierarchy is now anchored verbatim, <!-- lint-ok: no-citation -->
1154:    95	- The notation-independence and tooling-independence <!-- lint-ok: no-citation -->
1159:   100	- The "Container" disambiguation was NOT found verbatim <!-- lint-ok: no-citation -->
1162:   103	  but does not state "Container is NOT a Docker
1172:   113	- methodology-claim: "C4 is a four-level hierarchical <!-- lint-ok: no-citation -->
1175:   116	- methodology-claim: "C4 is notation-independent and <!-- lint-ok: no-citation -->
1178:   119	- methodology-claim: "C4 Containers are applications and <!-- lint-ok: no-citation -->
1179:   120	  data stores, not Docker containers — the terminology
1182:   123	- methodology-claim: "Code-level (level 4) diagrams in C4 <!-- lint-ok: no-citation -->
1190:   131	- The exact "C4 Container is NOT a Docker container"
1195:   136	  Docker-disambiguation phrasing this corpus has not
1298:    90	- The five-section template (Title / Context / Decision <!-- lint-ok: no-citation -->
1300:    92	- The "Alexandrian pattern" framing is now citable as <!-- lint-ok: no-citation -->
1302:    94	- The supersession lifecycle (proposed → accepted → <!-- lint-ok: no-citation -->
1305:    97	- The "small modular documents are kept up to date" <!-- lint-ok: no-citation -->
1315:   107	- methodology-claim: "ADRs are short (one-to-two-page) <!-- lint-ok: no-citation -->
1319:   111	- methodology-claim: "ADR status lifecycle is proposed <!-- lint-ok: no-citation -->
1322:   114	- methodology-claim: "Nygard's lightweight thesis is <!-- lint-ok: no-citation -->
1327:   119	- methodology-claim: "Context section uses 'value- <!-- lint-ok: no-citation -->
1408:    55	- **values.schema.json** implements JSON Schema
1414:    61	  during `helm install`, `helm upgrade`, `helm lint`,
1424:    71	<!-- lint-ok: no-citation -->
1434:    81	- Validation lifecycle hooks (install/upgrade/lint/
1451:    98	<!-- lint-ok: no-citation -->
1459:   106	  (JSON Schema validation contract)."
1461:   108	  upgrade, lint, and template stages — multi-stage
1474:   121	- JSON Schema (the underlying validation language Helm
1477:   124	  customization facet specifies a particular JSON Schema
1486:   133	- Helm's relationship to OCI artifact registries (Helm
1487:   134	  charts can be pushed/pulled via OCI as of v3) is
1493:     3	source_name: "OpenAI Symphony — SPEC.md (operating-model-as-SPEC)"
1500:    10	  Symphony's SPEC.md is the only in-the-wild example of
1506:    16	  Symphony precisely when prescribing the SPEC bundle's
1510:    20	# OpenAI Symphony SPEC.md
1514:    24	- Name: OpenAI Symphony SPEC.md.
1515:    25	- Author: OpenAI (Symphony project).
1530:    40	- **Symphony definition** (`url://github.com/openai/symphony/blob/main/SPEC.md`
1531:    41	  §1 Problem Statement): "Symphony is a long-running
1584:    94	<!-- lint-ok: no-citation -->
1596:   106	The Symphony-specific (non-transferable) sections:
1600:   110	- §16 Reference Algorithms — Symphony-specific
1606:   116	<!-- lint-ok: no-citation -->
1611:   121	- methodology-claim: "Symphony's SPEC.md is the only
1615:   125	- methodology-claim: "Symphony's three-profile
1619:   129	- methodology-claim: "Symphony's tiered Definition-of-
1625:   135	- methodology-claim: "Symphony §5 Workflow Specification
1629:   139	  Symphony document."
1633:   143	- Symphony's SPEC.md is bound to Linear as the issue
1635:   145	  agnostic. Citations of Symphony as prior art must
1637:   147	- Symphony ships an Elixir reference implementation
1640:   150	  Symphony as evidence of "single SPEC + multiple
1644:   154	- Symphony §17 Conformance Profiles + §18 DoD are
1645:   155	  Symphony's quality bar; the methodology's SPEC bundle
1657:     8	fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
1665:    16	  Willison's hybrid mitigation so the methodology can
1686:    37	  patching-semantics quote, Willison mitigation.
1699:    50	  'Deploy version 2.1.4' but 'Update the spec and hope
1707:    58	- **Simon Willison mitigation** (attributed): leverage
1716:    67	<!-- lint-ok: no-citation -->
1729:    80	  (research workpad §2.3) cover exactly the surfaces
1734:    85	- Willison's hybrid mitigation (custom periphery +
1741:    92	<!-- lint-ok: no-citation -->
1751:   102	  Kruger, Willison) before being articulated as a
1764:   115	  /standardise-core (Willison) is a viable mitigation
1771:   122	  research questions (research §2.3) rather than
1784:   135	  methodology's reproducibility primitives (Nix,
1790:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "arc42|C4|ADR|Di[aá]taxis|12-factor|Helm|Nix|OCI|Sigstore|Symphony|Spec Kit|Kiro|OpenSpec|Oracle|Cucumber|OpenAPI|Structurizr|CycloneDX|SPDX|Pact|JSON Schema|CUE|Terraform|Score|SLSA|SLSA|SLSA|in-toto|Backstage|Dagger|devfile|Backstage|Reference Architecture|LeadDev|Bedrock|container" ../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
1800:/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/check-corpus-completeness.sh && printf '\\n### lint\\n' && nl -ba scripts/lint-spec.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
1838:    37	    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
1916:   115	printf 'check-corpus-completeness: PASS — %d sources, all complete\n' "$n_rows"
1919:### lint
1921:     2	# lint-spec.sh — v1 lint for IDEA.md and SPEC.md artefacts.
1935:    16	# Suppression markers (per SPEC.schema §2.5):
1936:    17	#   <!-- lint-ok: no-citation --> on a paragraph silences the citation audit.
1937:    18	#   <!-- lint-ok: no-rfc        --> on a line silences the lowercase RFC 2119 warning.
2059:   140	        # file://specs/<id>/IDEA.md cite in §1 or §13 passes lint by
2061:   142	        # in the spec-review skill (per-type gate), not in this lint,
2182:/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/*.md; do printf '%s\\n' \""'$f"; rg -n "''^fetch_outcome:|''^## 4'"\\.|"'^## 5'"\\.|methodology-claim:|quote|verbatim|NOT|not |no |does not|doesn't|MUST|endorses|viable|only|closest|strongest|state-of-practice|machine-readable|partial|primary-read-complete|bedrock|Bedrock|SPDX|CycloneDX|Pact|JSON Schema|CUE\" \""'$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
2185:8:fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
2186:13:  structure, the JSON Schema 2020-12 relationship, and
2187:34:  fields, JSON Schema relationship, interface/
2188:64:- **JSON Schema relationship** (verbatim): "Data types
2189:66:  JSON Schema Specification Draft 2020-12." The Schema
2190:67:  Object is "a superset of JSON Schema Specification
2197:94:- OpenAPI 3.1's adoption of JSON Schema 2020-12 means
2198:97:  (OpenAPI) can share JSON Schema as the validation
2203:122:  superset of JSON Schema 2020-12; the methodology's
2228:10:  Oracle Agent Spec is research §2.1's "closest to 'ship
2273:10:  Spec Kit is research §2.1's "closest spec-as-authoring
2302:10:  Symphony's SPEC.md is the only in-the-wild example of
2307:121:- methodology-claim: "Symphony's SPEC.md is the only
2308:125:- methodology-claim: "Symphony's three-profile
2309:129:- methodology-claim: "Symphony's tiered Definition-of-
2310:135:- methodology-claim: "Symphony §5 Workflow Specification
2317:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "arc42|C4|ADR|Di[aá]taxis|12-factor|Helm|Nix|OCI|Sigstore|Symphony|Spec Kit|Kiro|OpenSpec|Oracle|Cucumber|OpenAPI|Structurizr|CycloneDX|SPDX|Pact|JSON Schema|CUE|Terraform|Score|SLSA|in-toto|Backstage|devfile|LeadDev|Bedrock|Container-level|configuration|customization|deferral|patch|versioning|provenance|SBOM|SLSA" ../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
2330:    12	  - bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md
2331:    13	  - bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md
2448:   130	| Honest disclosure — failure modes + open questions visible | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
2581:   263	§2.3 SHALL be published as flagged-open; Product B MUST NOT
2594:   276	Decision; cross-family review BLOCKING per slice;
2644:46:  C4 / ADRs / Diátaxis / 12-factor / Symphony / Nix / Helm)
2648:70:Nix-flake reproducible substrate would cover ~80% of the
2654:118:## 3. Transferable Building Blocks (extracted from Symphony's SPEC.md)
2655:120:Symphony's 18-section SPEC at
2656:128:| Symphony section | Transferable pattern | Why universal |
2657:145:Symphony-specific (NOT transferable): §10 Agent Runner Protocol;
2658:153:Symphony's SPEC currently captures well:
2667:181:Symphony §2.2 does whole-product non-goals; §11.5 does
2670:204:OCI signing / Sigstore / Helm provenance exist for build
2675:226:    manifests / Nix flake / Docker compose — pick whichever
2682:236:  - `operations/` — failure classes × recovery (Symphony §14
2683:237:    pattern); observability layering (Symphony §13 pattern);
2684:238:    safety invariants (Symphony §9.5 pattern).
2687:247:  target (Symphony's Elixir choice is the pattern). NOT
2688:249:- **Signed bundle** — OCI artefact or similar; spec versions
2693:304:What does the spec parameterize vs. hard-code? Symphony's
2696:327:Symphony's "re-implement in 5 languages" doesn't trivially
2701:549:- The Symphony SPEC.md deep read fetched the primary source.
2751:    46	  C4 / ADRs / Diátaxis / 12-factor / Symphony / Nix / Helm)
2758:    53	### 2.1 The framing is novel in combination, not invention
2775:    70	Nix-flake reproducible substrate would cover ~80% of the
2778:    73	### 2.2 Closest published prior art is a critique
2782:    77	longer 'deploy 2.1.4' but 'update the spec and hope every
2786:    81	### 2.3 Seven open research questions the methodology has to flag
2823:   118	## 3. Transferable Building Blocks (extracted from Symphony's SPEC.md)
2825:   120	Symphony's 18-section SPEC at
2833:   128	| Symphony section | Transferable pattern | Why universal |
2850:   145	Symphony-specific (NOT transferable): §10 Agent Runner Protocol;
2858:   153	Symphony's SPEC currently captures well:
2886:   181	Symphony §2.2 does whole-product non-goals; §11.5 does
2909:   204	OCI signing / Sigstore / Helm provenance exist for build
2931:   226	    manifests / Nix flake / Docker compose — pick whichever
2941:   236	  - `operations/` — failure classes × recovery (Symphony §14
2942:   237	    pattern); observability layering (Symphony §13 pattern);
2943:   238	    safety invariants (Symphony §9.5 pattern).
2952:   247	  target (Symphony's Elixir choice is the pattern). NOT
2954:   249	- **Signed bundle** — OCI artefact or similar; spec versions
3014:   304	What does the spec parameterize vs. hard-code? Symphony's
3015:   305	single-file approach (the repo-owned `WORKFLOW.md` schema) is
3037:   327	Symphony's "re-implement in 5 languages" doesn't trivially
3059:   349	- Open research questions per §2.3 the methodology cannot
3069:   359	  showed 21/23 SPECs closed, lint 12/12 clean, hooks 33/33
3113:   403	  questions in §2.3 are not solved; the methodology helps
3151:   441	  in §2.3. (i) Publish all 7 as flagged open; (ii) attempt
3244:   534	| Q6 open research questions | **All 7 from §2.3 published as flagged open** | The honest posture demands disclosure. The methodology helps ADDRESS these questions; it does not pretend to RESOLVE them. |
3259:   549	- The Symphony SPEC.md deep read fetched the primary source.
3264:   554	- The seven open research questions in §2.3 are honestly
3272:   562	  through `lint-spec.sh` for spec-grade citation
3288:The sample is mostly coherent, but I’m already seeing two kinds of issues: source-list omissions that matter to the methodology’s own manifest/deployment claims, and a few §5 claims that turn a primary source into project endorsement or global uniqueness. I’m checking the non-sample rows for the same pattern before I write the gate result.
3379:    86	<!-- lint-ok: no-citation -->
3410:   117	<!-- lint-ok: no-citation -->
3549:    99	- The four-mode taxonomy is anchored verbatim with <!-- lint-ok: no-citation -->
3551:   101	- The two-axis structure (action-vs-cognition × study- <!-- lint-ok: no-citation -->
3555:   105	- The framework's posture as "systematic approach" not <!-- lint-ok: no-citation -->
3564:   114	- methodology-claim: "Diátaxis is a four-mode <!-- lint-ok: no-citation -->
3567:   117	- methodology-claim: "The four modes are structured <!-- lint-ok: no-citation -->
3571:   121	- methodology-claim: "Diátaxis prescribes that <!-- lint-ok: no-citation -->
3574:   124	- methodology-claim: "The methodology's published <!-- lint-ok: no-citation -->
3674:    74	<!-- lint-ok: no-citation -->
3699:    99	<!-- lint-ok: no-citation -->
3748:     8	fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
3753:    13	  structure, the JSON Schema 2020-12 relationship, and
3774:    34	  fields, JSON Schema relationship, interface/
3804:    64	- **JSON Schema relationship** (verbatim): "Data types
3806:    66	  JSON Schema Specification Draft 2020-12." The Schema
3807:    67	  Object is "a superset of JSON Schema Specification
3823:    83	<!-- lint-ok: no-citation -->
3834:    94	- OpenAPI 3.1's adoption of JSON Schema 2020-12 means
3837:    97	  (OpenAPI) can share JSON Schema as the validation
3852:   112	<!-- lint-ok: no-citation -->
3862:   122	  superset of JSON Schema 2020-12; the methodology's
3899:     3	source_name: "Nix Flakes — flake.nix + flake.lock"
3906:    10	  Nix flakes are research §5.1's "strongest reproducible-
3909:    13	  model, and Nix's reproducibility guarantees so the
3915:    19	# Nix Flakes
3919:    23	- Name: Nix flakes — the unit for packaging Nix code
3924:    28	- Specification authority: NixOS RFCs (RFC 49 for flakes
3950:    54	    input flake outputs, returning Nix values the flake
3969:    73	- **Reproducibility guarantee**: Nix automatically
3979:    83	<!-- lint-ok: no-citation -->
3981:    85	Nix flakes operationalize "reproducible-from-spec" at the
3994:    98	  open question (research §2.3.5) can cite Nix as the
4003:   107	<!-- lint-ok: no-citation -->
4008:   112	- methodology-claim: "Nix flakes ship a two-file model:
4014:   118	- methodology-claim: "Nix's reproducibility model is the
4025:   129	- Nix flakes are still officially "experimental" in
4026:   130	  stable Nix releases; the methodology should
4029:   133	- Whether Nix's content-hash reproducibility generalises
4030:   134	  to non-Nix language ecosystems (Helm? OCI? container
4031:   135	  images built outside Nix?) is an open methodology
4032:   136	  question. The methodology MAY recommend Nix-like
4033:   137	  reproducibility WITHOUT mandating Nix as the
4035:   139	- The relationship between flake.lock and OCI image
4037:   141	  point — Nix has filesystem-tree hashes; OCI has
4044:     3	source_name: "OCI Image Specification + Artifacts Guidance"
4049:     8	fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
4051:    10	  OCI artifacts are research §5.1's "spec-as-distribution-
4053:    12	  can be distributed as an OCI artifact for content-
4057:    16	  methodology can cite OCI precisely when prescribing the
4061:    20	# OCI Image Specification + Artifacts Guidance
4065:    24	- Name: OCI Image Specification.
4082:    41	- **OCI Image definition**: "This specification defines
4083:    42	  an OCI Image, consisting of an image manifest, an image
4105:    64	  signature, and unpacked into an OCI Runtime Bundle."
4107:    66	- **OCI Artifacts** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`):
4109:    68	  for packaging content other than OCI images" —
4110:    69	  indicating OCI registries can carry non-runtime
4116:    75	<!-- lint-ok: no-citation -->
4118:    77	OCI artifacts are the published-spec distribution
4124:    83	  bundle MAPS directly onto OCI: the manifest is the
4138:    97	<!-- lint-ok: no-citation -->
4143:   102	- methodology-claim: "OCI Image Spec defines a four-
4146:   105	- methodology-claim: "OCI Descriptors enable content-
4149:   108	- methodology-claim: "OCI Artifacts Guidance extends the
4153:   112	  bundle MAY be distributed as an OCI artifact: front-
4154:   113	  door manifest as OCI manifest; per-facet sub-specs as
4155:   114	  OCI layers; per-spec content-addressing by digest."
4159:   118	- The OCI Distribution Spec (separate from Image Spec)
4164:   123	- Helm v3 supports OCI registries natively; the
4165:   124	  intersection of OCI artifacts + Helm + Sigstore
4189:    14	  model, and the OCI-artifact signing process so the
4257:    82	<!-- lint-ok: no-citation -->
4266:    91	  as an OCI artifact (per `oci-artifacts` corpus entry),
4280:   105	<!-- lint-ok: no-citation -->
4374:    54	<!-- lint-ok: no-citation -->
4395:    75	<!-- lint-ok: no-citation -->
4445:    10	  Spec Kit is research §2.1's "closest spec-as-authoring
4519:    84	<!-- lint-ok: no-citation -->
4545:   110	<!-- lint-ok: no-citation -->
4599:    10	  Kiro is research §2.1's "spec-driven IDE" reference.
4656:    67	<!-- lint-ok: no-citation -->
4680:    91	<!-- lint-ok: no-citation -->
4708:   119	  worth comparing to Symphony's per-issue isolated
4788:    77	<!-- lint-ok: no-citation -->
4805:    94	<!-- lint-ok: no-citation -->
4853:    10	  Oracle Agent Spec is research §2.1's "closest to 'ship
4900:    57	<!-- lint-ok: no-citation -->
4925:    82	<!-- lint-ok: no-citation -->
5031:    65	<!-- lint-ok: no-citation -->
5053:    87	<!-- lint-ok: no-citation -->
5105:    13	  universal (reference architecture) vs what the
5141:    49	  reference architecture.
5168:    76	<!-- lint-ok: no-citation -->
5174:    82	  reference architecture (in methodology terms: the
5192:   100	<!-- lint-ok: no-citation -->
5199:   107	  reference architecture (universal, non-negotiable)
5245:/home/linuxbrew/.linuxbrew/bin/bash -c "bash scripts/lint-spec.sh research/primary-sources/arc42.md; printf 'exit=%s\\n' "'$?' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
5249:== lint-spec.sh summary ==
5262:check-corpus-completeness: PASS — 20 sources, all complete
5266:/home/linuxbrew/.linuxbrew/bin/bash -c "bash scripts/lint-spec.sh research/primary-sources/helm-values-schema.md; printf 'exit=%s\\n' "'$?' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
5268:== lint-spec.sh summary ==
5279:The lint impedance point is not just cosmetic. The corpus completeness script passes, but per-artefact lint on a sample shows real `fact-bearing paragraph lacks citation prefix` errors mixed with the known front-matter noise, which means §7.1’s “uncited-claim is blocking” rule is not currently enforceable by the accepted gate.
5281:/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; out=$(bash scripts/lint-spec.sh "$f" 2>&1 >/tmp/lint-out.$$); status=$?; uncited=$(printf '"'%s\\n' \""'$out" | rg -c '"'fact-bearing paragraph lacks citation prefix' || true); form="'$(printf '"'%s\\n' \""'$out" | rg -c '"'missing type/implies_spec_type|missing required section' || true); printf '%s exit=%s form=%s uncited=%s\\n' \""'$f" "$status" "$form" "$uncited"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
5297:/home/linuxbrew/.linuxbrew/bin/bash -c 'out=$(bash scripts/lint-spec.sh research/primary-sources/helm-values-schema.md 2>&1 >/tmp/lint-out-test); printf '"'OUT<<%s>>\\n' \""'$out"; printf '"'form='; printf '%s\\n' \""'$out" | rg -c '"'missing type/implies_spec_type|missing required section' || true; printf 'uncited='; printf '%s\\n' \""'$out" | rg -c '"'fact-bearing paragraph lacks citation prefix' || true; rm -f /tmp/lint-out-test" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
5299:OUT<</home/linuxbrew/.linuxbrew/bin/bash: line 1: /tmp/lint-out-test: Read-only file system>>
5302:/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; out=$(bash scripts/lint-spec.sh "$f" 2>&1); status=$?; uncited=$(printf '"'%s\\n' \""'$out" | rg -c '"'fact-bearing paragraph lacks citation prefix' || true); form="'$(printf '"'%s\\n' \""'$out" | rg -c '"'missing type/implies_spec_type|missing required section' || true); printf '%s exit=%s form=%s uncited=%s\\n' \""'$f" "$status" "$form" "$uncited"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
5329:web search: Cottmeyer Reference Architecture vs Reference Implementation The reference architecture holds universally reference implementation negotiable
5331:**Quality Gate Result**
5333:REQUEST CHANGES. I would not sign off the cross-family substance gate yet. The SPEC lint and completeness script pass, but the corpus still has status-truth, source-list, and citation-surface problems that can leak into downstream methodology claims. No mutations made.
5335:**Findings**
5337:- [SPEC.md:650](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:650): HIGH  
5338:  The lint-impedance handling is a hack in its current form. §7.1 says corpus lint exit 1 is advisory unless the failure is `uncited-claim`, which is blocking; the Completion Report waves off all corpus lint failures as front-matter/shape noise. I ran per-artefact lint read-only: all 20 exit 1, and 18 include `fact-bearing paragraph lacks citation prefix` errors. Example: [helm-values-schema.md:42](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md:42). Either add corpus-mode lint or make the completeness gate validate corpus citations directly.
5340:- [INDEX.md:18](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18): HIGH  
5343:- [SPEC.md:575](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:575): HIGH  
5344:  §17 treats JSON Schema, SPDX/SBOM/CycloneDX, Pact, and CUE as deferrable. I would not defer at least JSON Schema and SBOM/provenance for v1.0: Helm/OpenAPI claims already rely on JSON Schema, and the methodology’s manifest/audit/“what code was running” story needs an SBOM primary. Also consider Dev Container Spec, Pact/AsyncAPI/GraphQL, and SLSA/in-toto if the downstream methodology continues to claim those deployment, behavior, or provenance surfaces.
5346:- [oci-artifacts.md:28](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28): HIGH  
5347:  The SPEC’s source row calls for OCI Image Spec plus Artifact spec, but this artefact says the companion Artifacts Guidance was “not deep-read,” then §3/§5 licenses non-image payload claims: [oci-artifacts.md:66](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:66). Fetch/read the artifact guidance or downgrade the status/claim surface.
5349:- [c4-model.md:119](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/c4-model.md:119): MEDIUM  
5350:  §5 licenses “C4 Containers are applications and data stores, not Docker containers” even though §4/§6 explicitly says the Docker disambiguation was not found in the fetched text. Reframe as an inference from C4’s definition, or fetch the container-diagram page and cite that directly.
5352:- [symphony-spec.md:121](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:121): MEDIUM  
5353:  “Only published in-the-wild example” is a global uniqueness claim not licensed by Symphony’s SPEC itself. Make it “the only example identified by this project’s research” and cite the research workpad, or remove the uniqueness claim from the corpus entry.
5355:- [leaddev-agent-compiled.md:114](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md:114): MEDIUM  
5356:  The Willison quote supports “custom periphery + standardized core” as a suggested mitigation, but not “viable mitigation the methodology endorses for safety-critical paths.” That endorsement is methodology judgment, not LeadDev primary-source evidence.
5358:- [ref-arch-vs-solution-arch.md:60](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:60): MEDIUM  
5361:- [nix-flakes.md:118](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:118): MEDIUM  
5362:  “Strongest current implementation of build-from-spec” is comparative agent synthesis. The Nix primary supports lockfiles, exact revisions, and hashes; it does not establish a field-wide “strongest” ranking.
5366:Primary sources spot-checked: [arc42](https://docs.arc42.org/section-1/), [C4](https://c4model.com/), [Nygard ADR](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions), [Helm charts](https://helm.sh/docs/topics/charts/), [LeadDev](https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software), [OCI image/artifact guidance](https://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md).
5369:**Quality Gate Result**
5371:REQUEST CHANGES. I would not sign off the cross-family substance gate yet. The SPEC lint and completeness script pass, but the corpus still has status-truth, source-list, and citation-surface problems that can leak into downstream methodology claims. No mutations made.
5373:**Findings**
5375:- [SPEC.md:650](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:650): HIGH  
5376:  The lint-impedance handling is a hack in its current form. §7.1 says corpus lint exit 1 is advisory unless the failure is `uncited-claim`, which is blocking; the Completion Report waves off all corpus lint failures as front-matter/shape noise. I ran per-artefact lint read-only: all 20 exit 1, and 18 include `fact-bearing paragraph lacks citation prefix` errors. Example: [helm-values-schema.md:42](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md:42). Either add corpus-mode lint or make the completeness gate validate corpus citations directly.
5378:- [INDEX.md:18](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18): HIGH  
5381:- [SPEC.md:575](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:575): HIGH  
5382:  §17 treats JSON Schema, SPDX/SBOM/CycloneDX, Pact, and CUE as deferrable. I would not defer at least JSON Schema and SBOM/provenance for v1.0: Helm/OpenAPI claims already rely on JSON Schema, and the methodology’s manifest/audit/“what code was running” story needs an SBOM primary. Also consider Dev Container Spec, Pact/AsyncAPI/GraphQL, and SLSA/in-toto if the downstream methodology continues to claim those deployment, behavior, or provenance surfaces.
5384:- [oci-artifacts.md:28](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28): HIGH  
5385:  The SPEC’s source row calls for OCI Image Spec plus Artifact spec, but this artefact says the companion Artifacts Guidance was “not deep-read,” then §3/§5 licenses non-image payload claims: [oci-artifacts.md:66](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:66). Fetch/read the artifact guidance or downgrade the status/claim surface.
5387:- [c4-model.md:119](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/c4-model.md:119): MEDIUM  
5388:  §5 licenses “C4 Containers are applications and data stores, not Docker containers” even though §4/§6 explicitly says the Docker disambiguation was not found in the fetched text. Reframe as an inference from C4’s definition, or fetch the container-diagram page and cite that directly.
5390:- [symphony-spec.md:121](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:121): MEDIUM  
5391:  “Only published in-the-wild example” is a global uniqueness claim not licensed by Symphony’s SPEC itself. Make it “the only example identified by this project’s research” and cite the research workpad, or remove the uniqueness claim from the corpus entry.
5393:- [leaddev-agent-compiled.md:114](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md:114): MEDIUM  
5394:  The Willison quote supports “custom periphery + standardized core” as a suggested mitigation, but not “viable mitigation the methodology endorses for safety-critical paths.” That endorsement is methodology judgment, not LeadDev primary-source evidence.
5396:- [ref-arch-vs-solution-arch.md:60](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:60): MEDIUM  
5399:- [nix-flakes.md:118](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:118): MEDIUM  
5400:  “Strongest current implementation of build-from-spec” is comparative agent synthesis. The Nix primary supports lockfiles, exact revisions, and hashes; it does not establish a field-wide “strongest” ranking.
5404:Primary sources spot-checked: [arc42](https://docs.arc42.org/section-1/), [C4](https://c4model.com/), [Nygard ADR](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions), [Helm charts](https://helm.sh/docs/topics/charts/), [LeadDev](https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software), [OCI image/artifact guidance](https://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md).

codex
The remediation SPEC does bind §7.D to add `json-schema` and `cyclonedx-sbom`; the target SPEC has both rows and `SOURCE_LIST_VERSION: v1.1`, and the index has 22 rows. I’m now reading the remediated artefacts at their claim surfaces, especially the partial-status disclosures and any phrases that still turn source evidence into project judgment.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/adr-tools-state.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: adr-tools-state
     3	source_name: "adr.github.io — state of ADR practice"
     4	primary_url: "https://adr.github.io/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "partial"
     8	fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
     9	methodology_relevance: |
    10	  State-of-practice ADR ecosystem (MADR, Y-statements,
    11	  Nygard, adr-tools CLI) is the cross-check against
    12	  Nygard's 2011 origin. This corpus entry anchors
    13	  community framing and template diversity so the
    14	  methodology's decisions facet can survey current
    15	  practice rather than locking only on Nygard.
    16	---
    17	
    18	# adr.github.io — State of ADR Practice
    19	
    20	## 1. Source identity
    21	
    22	- Name: adr.github.io — community resource for
    23	  Architecture Decision Records.
    24	- Canonical URL: `url://adr.github.io/`.
    25	- Posture: community catalogue of ADR templates,
    26	  tooling, practices.
    27	- Linked sub-pages (not deep-read on this pass):
    28	  `/adr-templates/`, `/ad-practices/`,
    29	  `/adr-tooling/`.
    30	
    31	## 2. Fetch trace
    32	
    33	- `cmd://WebFetch url://adr.github.io/` — 2026-05-19;
    34	  returned ADR community definition, template family
    35	  references; specific template catalogs and CLI
    36	  conventions live on sub-pages not fetched in this
    37	  pass.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **ADR (community definition)**: "An Architectural
    42	  Decision Record (ADR) captures a single AD and its
    43	  rationale; Put it simply, ADR can help you
    44	  understand the reasons for a chosen architectural
    45	  decision, along with its trade-offs and consequences."
    46	  (`url://adr.github.io/`)
    47	
    48	- **Architectural Decision (community definition)**:
    49	  "a justified design choice that addresses a
    50	  functional or non-functional requirement that is
    51	  architecturally significant."
    52	
    53	- **Template families referenced** (per root page;
    54	  catalogue at `/adr-templates/`):
    55	  - **Nygard's template** — the foundational 2011
    56	    blog post template (corpus entry `adr-nygard`).
    57	  - **Y-statements** — from Zdun et al.'s "Sustainable
    58	    Architectural Decisions" paper.
    59	  - **MADR** (Markdown Architectural Decision Records)
    60	    — community-maintained richer template.
    61	  - Reference to "seven templates" comparison paper.
    62	
    63	## 4. Fact-link to methodology
    64	
    65	<!-- lint-ok: no-citation -->
    66	
    67	The state-of-practice ADR ecosystem confirms Nygard's
    68	template is foundational but no longer the only option.
    69	The methodology's decisions facet must choose between:
    70	
    71	- Mandating Nygard's exact 5-section template (most
    72	  restrictive; clearest);
    73	- Allowing the MADR richer template (more fields:
    74	  status, deciders, context-and-problem-statement,
    75	  considered-options, decision-outcome, pros-and-cons-
    76	  of-the-options);
    77	- Allowing Y-statements (one-line decision statements
    78	  with reasoning lattice);
    79	- Permitting any of the catalogued templates.
    80	
    81	The choice is a methodology design decision; this
    82	corpus entry provides the landscape from which the
    83	decision is made.
    84	
    85	## 5. Downstream-citation surface
    86	
    87	<!-- lint-ok: no-citation -->
    88	
    89	Methodology claims licensed by this entry (cite as
    90	`file://research/primary-sources/adr-tools-state.md
    91	§3`):
    92	
    93	- methodology-claim: "The state-of-practice ADR
    94	  ecosystem includes Nygard's template (origin),
    95	  MADR (community-rich), Y-statements (Zdun et al.),
    96	  and other templates catalogued at adr.github.io."
    97	- methodology-claim: "ADRs are community-defined as
    98	  'capturing a single AD and its rationale,
    99	  trade-offs, and consequences'."
   100	- methodology-claim: "An Architectural Decision is
   101	  'a justified design choice that addresses a
   102	  functional or non-functional requirement that is
   103	  architecturally significant'."
   104	- methodology-claim: "The methodology's decisions/
   105	  sub-spec MAY permit one or more catalogued ADR
   106	  templates; the choice is a methodology design
   107	  decision (not resolved by the community)."
   108	
   109	## 6. Open questions surfaced by the primary read
   110	
   111	- The adr.github.io root page references but does not
   112	  enumerate the full template catalogue;
   113	  `/adr-templates/` is the dedicated page. If
   114	  methodology mandates a specific template, fetch
   115	  that page.
   116	- adr-tools CLI conventions (file naming, directory
   117	  layout, `adr new`, `adr supersede` semantics) live
   118	  on `/adr-tooling/`; not deep-read in this pass. If
   119	  methodology adopts adr-tools-style conventions for
   120	  the decisions/ sub-spec, fetch separately.
   121	- The "seven templates" comparison paper is cited
   122	  but not named in the fetched content; the
   123	  methodology may want to find this paper for a
   124	  deeper template-survey citation.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/structurizr-dsl.md | sed -n '1,190p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: structurizr-dsl
     3	source_name: "Structurizr DSL — text-based C4 model definition"
     4	primary_url: "https://docs.structurizr.com/dsl"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "partial"
     8	fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
     9	methodology_relevance: |
    10	  Structurizr DSL is research §5.1's machine-readable
    11	  C4 implementation. This corpus entry anchors the
    12	  DSL's purpose and posture so the methodology can
    13	  cite it precisely as the architecture/ sub-spec's
    14	  preferred diagram-as-code primitive.
    15	---
    16	
    17	# Structurizr DSL
    18	
    19	## 1. Source identity
    20	
    21	- Name: Structurizr DSL — text-based domain-specific
    22	  language for defining C4-model architectures.
    23	- Author: Simon Brown (same author as C4 model).
    24	- Canonical URL: `url://docs.structurizr.com/dsl`.
    25	- Posture: architecture-as-code.
    26	
    27	## 2. Fetch trace
    28	
    29	- `cmd://WebFetch url://docs.structurizr.com/dsl` —
    30	  2026-05-19; primary-read of root page; definition +
    31	  C4 implementation confirmed; deep syntax (workspace
    32	  / model / views) not fully fetched on this pass.
    33	
    34	## 3. Verbatim claims this corpus depends on
    35	
    36	- **DSL definition** (`url://docs.structurizr.com/dsl`):
    37	  the Structurizr DSL provides "a way to define a
    38	  software architecture model (based upon the C4
    39	  model) using a text-based domain specific language
    40	  (DSL)."
    41	
    42	- **C4-model basis** (per same page): the DSL
    43	  implements the C4 model framework; the documentation
    44	  references diagram types across the C4 hierarchy:
    45	  system context, container, component, code.
    46	
    47	- **Architecture-as-code posture** (per same page):
    48	  "as code" philosophy — architecture definitions are
    49	  text-based artefacts, versionable + readable +
    50	  programmable.
    51	
    52	## 4. Fact-link to methodology
    53	
    54	<!-- lint-ok: no-citation -->
    55	
    56	Structurizr DSL is the architecture-as-code primitive
    57	that lets the methodology's architecture/ sub-spec
    58	ship machine-readable diagrams (not PNG renders or
    59	hand-drawn artefacts). Key shape implications:
    60	
    61	- The methodology's architecture/ sub-spec MAY ship
    62	  one or more `.dsl` files that define the C4 model
    63	  for the product; tooling (Structurizr Lite,
    64	  Structurizr Cloud, or third-party renderers like
    65	  c4-plantuml) renders them to diagrams at consumer
    66	  time.
    67	- Versionable + diff-able: architecture changes show
    68	  up in git diffs, not in opaque image binaries.
    69	- Pairs with C4 (separate corpus entry) — the
    70	  methodology cites C4 as the conceptual model and
    71	  Structurizr DSL as the preferred concrete encoding.
    72	
    73	## 5. Downstream-citation surface
    74	
    75	<!-- lint-ok: no-citation -->
    76	
    77	Methodology claims licensed by this entry (cite as
    78	`file://research/primary-sources/structurizr-dsl.md
    79	§3`):
    80	
    81	- methodology-claim: "Structurizr DSL is a text-based
    82	  DSL for defining C4-model architectures — diagrams
    83	  as code."
    84	- methodology-claim: "The methodology's architecture/
    85	  sub-spec MAY ship .dsl files as the canonical
    86	  diagram artefacts, renderable by Structurizr Lite /
    87	  Cloud / third-party tooling."
    88	- methodology-claim: "Structurizr DSL's architecture-as-
    89	  code posture aligns with the methodology's
    90	  preference for versionable + diff-able artefacts in
    91	  the SPEC bundle."
    92	
    93	## 6. Open questions surfaced by the primary read
    94	
    95	- The exact DSL syntax (workspace, model, views
    96	  keywords) was not deep-read in this pass — only the
    97	  top-level navigation. If the methodology's
    98	  architecture/ sub-spec sketches example .dsl
    99	  snippets, a deeper fetch of `docs.structurizr.com/dsl/language`
   100	  is needed.
   101	- Alternative architecture-as-code tools (Mermaid,
   102	  PlantUML with c4-plantuml, IcePanel, Likec4) cover
   103	  similar ground; the methodology should acknowledge
   104	  multiple options rather than mandating Structurizr.
   105	- Structurizr's hosting model (Lite for self-host,
   106	  Cloud for hosted) is a deployment choice for the
   107	  methodology's downstream tooling, not part of the
   108	  spec itself; flag for non-binding methodology
   109	  guidance.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
check-corpus-completeness: PASS — 22 sources, all complete

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/json-schema.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: json-schema
     3	source_name: "JSON Schema specification (Draft 2020-12)"
     4	primary_url: "https://json-schema.org/specification.html"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "partial"
     8	fetch_evidence: "fetched specification index page; vocabularies enumerated; conceptual definition + validation model NOT on the index page — both live on the actual spec drafts referenced from it"
     9	methodology_relevance: |
    10	  JSON Schema is the underlying validation primitive that
    11	  both Helm values-schema and OpenAPI 3.1 build on. The
    12	  methodology's customization sub-spec validates adopter
    13	  knob declarations against JSON Schema directly; citing
    14	  Helm + OpenAPI without anchoring JSON Schema is a
    15	  transitive citation gap codex remediation 2.3 closes.
    16	---
    17	
    18	# JSON Schema (Draft 2020-12)
    19	
    20	## 1. Source identity
    21	
    22	- Name: JSON Schema specification.
    23	- Canonical URL: `url://json-schema.org/specification.html`.
    24	- Maintainer: JSON Schema project (community-maintained
    25	  under json-schema.org).
    26	- Current version: Draft 2020-12 (previous: 2019-09).
    27	- License: documentation site is publicly published; the
    28	  specification drafts themselves are MIT-licensed.
    29	
    30	## 2. Fetch trace
    31	
    32	- `cmd://WebFetch url://json-schema.org/specification.html`
    33	  — 2026-05-19; returned the spec index page enumerating
    34	  the two-part spec structure + the eight vocabularies.
    35	  The index does NOT contain the conceptual definition
    36	  or the validation-model walkthrough; those live in the
    37	  Core + Validation drafts linked from the index.
    38	- Status `partial`: deep reads of the Core draft and
    39	  Validation draft are NOT performed in this pass.
    40	  Methodology MUST NOT quote specific validation keyword
    41	  semantics or vocabulary-resolution algorithms from
    42	  this entry until those follow-on reads land.
    43	
    44	## 3. Verbatim claims this corpus depends on
    45	
    46	- **Two-part spec structure** (`url://json-schema.org/specification.html`):
    47	  - **JSON Schema Core**: "defines the basic foundation
    48	    of JSON Schema."
    49	  - **JSON Schema Validation**: "defines the validation
    50	    keywords of JSON Schema."
    51	
    52	- **Current version**: Draft 2020-12 (previous: 2019-09).
    53	
    54	- **The eight single-vocabulary meta-schemas**:
    55	  1. Core Vocabulary
    56	  2. Applicator Vocabulary
    57	  3. Validation Vocabulary
    58	  4. Unevaluated Vocabulary
    59	  5. Format Annotation Vocabulary
    60	  6. Format Assertion Vocabulary
    61	  7. Content Vocabulary
    62	  8. Meta-Data Vocabulary
    63	
    64	## 4. Fact-link to methodology
    65	
    66	<!-- lint-ok: no-citation -->
    67	
    68	JSON Schema is the primitive other corpus entries cite
    69	transitively:
    70	
    71	- `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/helm-values-schema.md`
    72	  §3: Helm's `values.schema.json` uses JSON Schema for
    73	  validation.
    74	- `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/openapi-3-1.md`
    75	  §3: "Data types in the OAS are based on the types
    76	  supported by the JSON Schema Specification Draft
    77	  2020-12. The Schema Object is a superset of JSON
    78	  Schema Specification Draft 2020-12."
    79	
    80	The methodology's customization sub-spec
    81	(`url://github.com/buildepicshit/agentic-ops-framework/blob/main/spec-bundle/customization/contract.md`)
    82	adopts JSON Schema directly for its `knobs.schema.json`
    83	artefact; this corpus entry now grounds that adoption in
    84	the primary source rather than transiting through Helm
    85	or OpenAPI.
    86	
    87	## 5. Downstream-citation surface
    88	
    89	<!-- lint-ok: no-citation -->
    90	
    91	Methodology claims licensed by this entry (cite as
    92	`file://research/primary-sources/json-schema.md §3`):
    93	
    94	- methodology-claim: "JSON Schema Draft 2020-12 is the
    95	  primary validation primitive the methodology adopts;
    96	  Helm values-schema and OpenAPI 3.1 build on it."
    97	- methodology-claim: "JSON Schema is split into Core
    98	  (foundation) and Validation (keywords); the
    99	  methodology cites both as a unit."
   100	- methodology-claim: "Eight vocabularies (Core,
   101	  Applicator, Validation, Unevaluated, Format
   102	  Annotation, Format Assertion, Content, Meta-Data)
   103	  organise the spec; the methodology may reference
   104	  specific vocabularies once their drafts are deep-read."
   105	
   106	## 6. Open questions surfaced by the primary read
   107	
   108	- The index page does NOT contain the conceptual
   109	  definition of JSON Schema or the validation model.
   110	  Both live in the Core + Validation drafts. Deep reads
   111	  of those drafts are queued as a follow-on corpus
   112	  expansion (status: pending for the Core / Validation
   113	  draft sub-entries; this aggregate entry sits at
   114	  `partial`).
   115	- The relationship between JSON Schema 2020-12 and
   116	  earlier drafts (Draft 7, Draft 6) is not deep-read;
   117	  adopter tooling commonly pins older drafts, so the
   118	  methodology's customization sub-spec MAY need to
   119	  acknowledge multi-draft support.
   120	- The Format Assertion Vocabulary (separate from Format
   121	  Annotation) shifts format strings from advisory to
   122	  blocking; methodology MAY adopt format-assertion
   123	  semantics but the choice should be deliberate and
   124	  separately cited.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/oci-artifacts.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: oci-artifacts
     3	source_name: "OCI Image Specification + Artifacts Guidance"
     4	primary_url: "https://github.com/opencontainers/image-spec/blob/main/spec.md"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
     9	methodology_relevance: |
    10	  OCI artifacts are research §5.1's "spec-as-distribution-
    11	  artifact" packaging primitive — the published SPEC bundle
    12	  can be distributed as an OCI artifact for content-
    13	  addressed, signed delivery. This corpus entry anchors the
    14	  manifest+config+layers structure, the descriptor model,
    15	  and the artifacts-vs-images distinction so the
    16	  methodology can cite OCI precisely when prescribing the
    17	  SPEC bundle's distribution shape.
    18	---
    19	
    20	# OCI Image Specification + Artifacts Guidance
    21	
    22	## 1. Source identity
    23	
    24	- Name: OCI Image Specification.
    25	- Canonical URL: `url://github.com/opencontainers/image-spec/blob/main/spec.md`.
    26	- Maintainer: Open Container Initiative (Linux
    27	  Foundation).
    28	- Companion: Artifacts Guidance at
    29	  `url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`
    30	  (referenced from main spec; not deep-read in this
    31	  pass).
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://github.com/opencontainers/image-spec/blob/main/spec.md`
    36	  — 2026-05-19; returned spec scope + manifest/config/
    37	  layers + descriptor + artifacts-guidance reference.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **OCI Image definition**: "This specification defines
    42	  an OCI Image, consisting of an image manifest, an image
    43	  index (optional), a set of filesystem layers, and a
    44	  configuration." (`url://github.com/opencontainers/image-spec/blob/main/spec.md`)
    45	
    46	- **Image Manifest**: "a document describing the
    47	  components that make up a container image." The
    48	  manifest "contains metadata about the contents and
    49	  dependencies of the image including the
    50	  content-addressable identity of one or more filesystem
    51	  layer changeset archives."
    52	
    53	- **Image Configuration**: "a document determining layer
    54	  ordering and configuration of the image suitable for
    55	  translation into a runtime bundle."
    56	
    57	- **Filesystem Layer**: "a changeset that describes a
    58	  container's filesystem."
    59	
    60	- **Descriptor**: "a reference that describes the type,
    61	  metadata and content address of referenced content."
    62	  Descriptors enable images to be "discovered by name,
    63	  downloaded, verified by hash, trusted through a
    64	  signature, and unpacked into an OCI Runtime Bundle."
    65	
    66	- **OCI Artifacts Guidance** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`,
    67	  deep-read 2026-05-19 supplementary fetch):
    68	  - Verbatim: "Content other than OCI container images
    69	    MAY be packaged using the image manifest."
    70	  - Verbatim guidance on differentiating images from
    71	    artifacts: "the `config.mediaType` value should not
    72	    be a known OCI image config [media type]" and
    73	    instead use "values specific to the artifact in
    74	    `layer[*].mediaType`."
    75	  - Normative posture: the document is **guidance**,
    76	    not a formal specification; the only explicit
    77	    RFC 2119 verb is the permissive "MAY" on
    78	    artifact-via-image-manifest packaging. There is no
    79	    MUST/SHOULD requirement compelling artifact
    80	    packaging, only prescriptive guidance about media-
    81	    type selection.
    82	  - The historical non-conformant pattern
    83	    (`application/vnd.oci.image.config.v1+json` for
    84	    config with artifact-specific layer media types) is
    85	    explicitly discouraged.
    86	
    87	## 4. Fact-link to methodology
    88	
    89	<!-- lint-ok: no-citation -->
    90	
    91	OCI artifacts are the published-spec distribution
    92	primitive that the methodology's SPEC bundle MAY adopt.
    93	Key shape implications for the methodology's distribution
    94	posture:
    95	
    96	- A "front-door manifest + per-facet sub-specs" SPEC
    97	  bundle MAPS directly onto OCI: the manifest is the
    98	  bundle's front-door manifest; layers are the per-facet
    99	  sub-specs as separate blobs; descriptors give content-
   100	  addressing for each.
   101	- Content-addressing by hash gives the methodology its
   102	  "verifiable spec" affordance — the user-with-agent can
   103	  verify the spec bundle they fetched matches what the
   104	  developer published, by digest.
   105	- Artifacts guidance covers non-image payloads (SBOMs,
   106	  signatures, Helm charts) — the methodology's published
   107	  SPEC bundle fits naturally into this category.
   108	
   109	## 5. Downstream-citation surface
   110	
   111	<!-- lint-ok: no-citation -->
   112	
   113	Methodology claims licensed by this entry (cite as
   114	`file://research/primary-sources/oci-artifacts.md §3`):
   115	
   116	- methodology-claim: "OCI Image Spec defines a four-
   117	  component image: manifest, optional index, filesystem
   118	  layers, configuration."
   119	- methodology-claim: "OCI Descriptors enable content-
   120	  addressing — every component is referenced by type,
   121	  metadata, and content address; verification is by hash."
   122	- methodology-claim: "OCI Artifacts Guidance extends the
   123	  image spec to non-image payloads (SBOMs, signatures,
   124	  Helm charts, methodology spec bundles)."
   125	- methodology-claim: "The methodology's published SPEC
   126	  bundle MAY be distributed as an OCI artifact: front-
   127	  door manifest as OCI manifest; per-facet sub-specs as
   128	  OCI layers; per-spec content-addressing by digest."
   129	
   130	## 6. Open questions surfaced by the primary read
   131	
   132	- The OCI Distribution Spec (separate from Image Spec)
   133	  governs registry behaviour (push, pull, list, delete).
   134	  Not deep-read in this pass; if methodology specifies a
   135	  distribution channel, fetch as supplementary primary
   136	  read.
   137	- Helm v3 supports OCI registries natively; the
   138	  intersection of OCI artifacts + Helm + Sigstore
   139	  signing is a real-world precedent — the methodology
   140	  MAY recommend this exact stack but should anchor each
   141	  primitive separately rather than as a Helm-specific
   142	  recipe.
   143	- The Artifacts Guidance doc itself was not deep-read on
   144	  this pass; if methodology proposes specific media-type
   145	  conventions for SPEC bundle artefacts, fetch the
   146	  guidance for the type-naming conventions.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/cyclonedx-sbom.md | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: cyclonedx-sbom
     3	source_name: "CycloneDX Software Bill of Materials specification"
     4	primary_url: "https://cyclonedx.org/specification/overview/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched cyclonedx.org specification overview; definition + SBOM contents + format enumeration + supply-chain framing confirmed verbatim"
     9	methodology_relevance: |
    10	  CycloneDX is research §4.4's missing primary source for
    11	  the audit / provenance story. The methodology's
    12	  spec-as-distribution manifest (now expanding to include
    13	  digest + provenance fields per codex remediation 3.5)
    14	  carries SBOM references; without a primary SBOM source,
    15	  the manifest's provenance claim was hand-waving. The
    16	  LeadDev critique §3 "regulated environments" framing
    17	  needs an SBOM anchor for the methodology's compliance
    18	  posture.
    19	---
    20	
    21	# CycloneDX SBOM Specification
    22	
    23	## 1. Source identity
    24	
    25	- Name: CycloneDX — Software Bill of Materials
    26	  specification.
    27	- Canonical URL: `url://cyclonedx.org/specification/overview/`.
    28	- Maintainer: OWASP Foundation + Ecma International
    29	  (jointly developed; standardised as ECMA-424).
    30	- Current version: 1.7 (released 2025-10-21).
    31	
    32	## 2. Fetch trace
    33	
    34	- `cmd://WebFetch url://cyclonedx.org/specification/overview/`
    35	  — 2026-05-19; returned framework definition + SBOM
    36	  content enumeration + supported encoding formats +
    37	  supply-chain framing.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **Definition** (`url://cyclonedx.org/specification/overview/`):
    42	  CycloneDX is "a highly modular and extensible
    43	  framework designed to represent a broad range of supply
    44	  chain information with precision and flexibility."
    45	
    46	- **Joint maintenance**: developed jointly by the OWASP
    47	  Foundation and Ecma International, standardised as
    48	  ECMA-424.
    49	
    50	- **SBOM contents** (per spec):
    51	  - **Components**: "first-party and third-party
    52	    components" including "software, hardware devices,
    53	    machine learning models, source code, and
    54	    configurations."
    55	  - **Services**: "external APIs that the software may
    56	    call" with endpoint URIs and authentication details.
    57	  - **Dependencies**: both "direct and transitive
    58	    relationships" between components and services.
    59	  - **Vulnerabilities**: known and previously undisclosed
    60	    vulnerabilities affecting components and services.
    61	  - **Metadata**: supplier, manufacturer, tools used,
    62	    license information.
    63	  - **Additional elements**: compositions, formulations,
    64	    annotations, definitions, declarations, citations.
    65	
    66	- **Supported encoding formats** (three):
    67	  - JSON (`application/vnd.cyclonedx+json`)
    68	  - XML (`application/vnd.cyclonedx+xml`)
    69	  - Protocol Buffers (`application/x.vnd.cyclonedx+protobuf`)
    70	
    71	- **Supply-chain framing**: CycloneDX's role is
    72	  "supply chain transparency" and covers "vulnerability
    73	  management and license compliance to cryptographic
    74	  transparency and operational assurance."
    75	
    76	## 4. Fact-link to methodology
    77	
    78	<!-- lint-ok: no-citation -->
    79	
    80	CycloneDX is the methodology's grounding for the
    81	spec-as-distribution provenance story. Key shape
    82	implications:
    83	
    84	- The methodology's manifest schema (per codex
    85	  remediation 3.5) gains a `provenance` field that
    86	  carries SBOM references; CycloneDX is the canonical
    87	  format for those references.
    88	- The LeadDev critique
    89	  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
    90	  §3) raised regulated-environments compliance as a risk
    91	  surface; CycloneDX directly addresses it.
    92	- The three encoding formats (JSON / XML / Protobuf)
    93	  let the methodology recommend JSON as default while
    94	  acknowledging adopter environments may use XML for
    95	  regulated-industry tooling or Protobuf for
    96	  wire-efficient pipelines.
    97	- The component scope (software / hardware / ML models
    98	  / source / configurations) is broad enough that the
    99	  methodology's spec bundle itself can be enumerated as
   100	  an SBOM-tracked component when bundled into an OCI
   101	  artifact.
   102	
   103	## 5. Downstream-citation surface
   104	
   105	<!-- lint-ok: no-citation -->
   106	
   107	Methodology claims licensed by this entry (cite as
   108	`file://research/primary-sources/cyclonedx-sbom.md §3`):
   109	
   110	- methodology-claim: "CycloneDX is a jointly OWASP +
   111	  Ecma-maintained SBOM framework (ECMA-424; current
   112	  version 1.7) representing components, services,
   113	  dependencies, vulnerabilities, and metadata."
   114	- methodology-claim: "CycloneDX supports JSON, XML, and
   115	  Protocol Buffers encodings; the methodology
   116	  recommends JSON as the manifest-provenance default."
   117	- methodology-claim: "Component scope includes software,
   118	  hardware, ML models, source code, and configurations;
   119	  the methodology's spec bundle qualifies as a CycloneDX
   120	  component when distributed via OCI registry."
   121	- methodology-claim: "CycloneDX addresses the regulated-
   122	  environments compliance gap LeadDev's critique
   123	  identified; methodology's audit posture rests on
   124	  CycloneDX-format provenance for releases."
   125	
   126	## 6. Open questions surfaced by the primary read
   127	
   128	- SPDX is the other major SBOM format
   129	  (`url://spdx.dev/`); the methodology should
   130	  acknowledge it as an alternative and document why
   131	  CycloneDX is the recommended default (e.g.
   132	  finer-grained vulnerability handling, OWASP backing,
   133	  ECMA standardisation) — but a separate primary read
   134	  of SPDX is needed to do that justly.
   135	- NTIA minimum SBOM elements are referenced by some
   136	  CycloneDX adopters but the overview page does not
   137	  enumerate them; methodology compliance claims
   138	  against NTIA need a separate primary source.
   139	- Vulnerability Exploitability eXchange (VEX) is
   140	  related to CycloneDX vulnerability handling; if the
   141	  methodology covers vulnerability disclosure under
   142	  spec-as-distribution, VEX is a separate corpus
   143	  candidate.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/c4-model.md | sed -n '1,170p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: c4-model
     3	source_name: "The C4 model for visualising software architecture"
     4	primary_url: "https://c4model.com/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched c4model.com/ + c4model.com/abstractions; four-level hierarchy confirmed verbatim; notation+tooling independence confirmed"
     9	methodology_relevance: |
    10	  C4 is the methodology's primary reference for
    11	  architecture decomposition at the Container / Component
    12	  level, cited in the research workpad §5.1 packaging
    13	  recommendation. This corpus entry establishes the four
    14	  abstractions verbatim, the notation-independence
    15	  posture, and the boundary with code-level diagrams so
    16	  the methodology can cite C4 precisely when prescribing
    17	  the architecture/ sub-spec's diagram shape.
    18	---
    19	
    20	# C4 Model
    21	
    22	## 1. Source identity
    23	
    24	- Name: The C4 model for visualising software
    25	  architecture.
    26	- Author / maintainer: Simon Brown.
    27	- Canonical URL: `url://c4model.com/`; abstractions
    28	  detail at `url://c4model.com/abstractions`.
    29	- Posture: notation-independent, tooling-independent,
    30	  hierarchical.
    31	
    32	## 2. Fetch trace
    33	
    34	- `cmd://WebFetch url://c4model.com/` — 2026-05-19;
    35	  returned definition + four-abstraction hierarchy +
    36	  notation-independence statement.
    37	- `cmd://WebFetch url://c4model.com/abstractions` —
    38	  2026-05-19; returned per-level descriptions.
    39	
    40	## 3. Verbatim claims this corpus depends on
    41	
    42	- **Self-definition (homepage)**: "The C4 model is an
    43	  easy to learn, developer friendly approach to software
    44	  architecture diagramming." (`url://c4model.com/`
    45	  #the-c4-model-for-visualising-software-architecture)
    46	
    47	- **The four-abstraction hierarchy** (`url://c4model.com/`):
    48	  C4 comprises "a set of hierarchical abstractions"
    49	  consisting of:
    50	  1. Software systems
    51	  2. Containers
    52	  3. Components
    53	  4. Code
    54	
    55	- **Software System** (`url://c4model.com/abstractions`):
    56	  "A software system is made up of one or more containers
    57	  (applications and data stores)."
    58	
    59	- **Container** (`url://c4model.com/abstractions`):
    60	  containers "contain one or more components"; they are
    61	  "applications and data stores" — distinct from Docker
    62	  containers per the model's own terminology, though the
    63	  abstractions page does not contain an explicit
    64	  Docker-disambiguation sentence in the fetched excerpt.
    65	
    66	- **Component** (`url://c4model.com/abstractions`):
    67	  components are elements contained within containers
    68	  that "in turn are implemented by one or more code
    69	  elements."
    70	
    71	- **Code** (`url://c4model.com/abstractions`): the
    72	  lowest level — "classes, interfaces, objects,
    73	  functions, etc" that implement components.
    74	
    75	- **Notation independence** (`url://c4model.com/`
    76	  #diagrams/notation): C4 is "notation independent" —
    77	  the model does not prescribe UML, ArchiMate, or any
    78	  particular notation.
    79	
    80	- **Tooling independence** (`url://c4model.com/`
    81	  #tooling): C4 is "tooling independent" — works with
    82	  any diagramming tool.
    83	
    84	## 4. Gap from prior summary characterization
    85	
    86	Prior summary in
    87	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    88	§3 / §5.1 cited C4 as the architecture decomposition
    89	primitive at "Container-level (Structurizr DSL preferred
    90	for machine-readability)." This primary read closes the
    91	gap on:
    92	
    93	- The exact four-level hierarchy is now anchored verbatim, <!-- lint-ok: no-citation -->
    94	  not paraphrased.
    95	- The notation-independence and tooling-independence <!-- lint-ok: no-citation -->
    96	  postures are anchored to the homepage's own
    97	  headings — the methodology can cite these as
    98	  conformance properties C4 offers that other
    99	  decomposition frameworks (e.g. arc42, ADRs) do not.
   100	- The "Container" disambiguation was NOT found verbatim <!-- lint-ok: no-citation -->
   101	  on the fetched pages; the abstractions page implies the
   102	  distinction (Container = applications and data stores)
   103	  but does not state "Container is NOT a Docker
   104	  container" in the fetched text. This is an `open
   105	  question` for §6.
   106	
   107	## 5. Downstream-citation surface
   108	
   109	The following methodology claims are licensed by this
   110	entry (cite as
   111	`file://research/primary-sources/c4-model.md §3`):
   112	
   113	- methodology-claim: "C4 is a four-level hierarchical <!-- lint-ok: no-citation -->
   114	  architecture-visualisation model: Software Systems →
   115	  Containers → Components → Code."
   116	- methodology-claim: "C4 is notation-independent and <!-- lint-ok: no-citation -->
   117	  tooling-independent (per c4model.com homepage
   118	  #diagrams/notation, #tooling)."
   119	- methodology-claim: "C4 Containers are 'applications and
   120	  data stores' per the abstractions page (`url://c4model.com/abstractions`).
   121	  Whether the C4 docs explicitly disambiguate from Docker
   122	  containers in additional pages was NOT verified in
   123	  this primary read; downstream methodology MUST NOT
   124	  quote a 'NOT a Docker container' phrasing without
   125	  fetching `url://c4model.com/diagrams/container` and
   126	  citing that page directly." <!-- lint-ok: no-citation -->
   127	- methodology-claim: "Code-level (level 4) diagrams in C4 <!-- lint-ok: no-citation -->
   128	  represent classes, interfaces, objects, functions; the
   129	  methodology's architecture/ sub-spec MAY include
   130	  Container + Component diagrams but Code-level diagrams
   131	  are typically generated rather than authored."
   132	
   133	## 6. Open questions surfaced by the primary read
   134	
   135	- The exact "C4 Container is NOT a Docker container"
   136	  disambiguation sentence was not present in the fetched
   137	  excerpts. A deeper read of `url://c4model.com/diagrams/container`
   138	  may yield the verbatim disambiguation. The methodology's
   139	  prose draft should not put quote marks around a
   140	  Docker-disambiguation phrasing this corpus has not
   141	  anchored.
   142	- C4's relationship to UML / ArchiMate is implied by the
   143	  "notation independent" posture but not stated as a
   144	  comparison; if downstream methodology compares C4 to
   145	  UML decomposition, that comparison should be sourced
   146	  separately or framed as agent-synthesis.
   147	- Structurizr DSL (separate corpus entry slug:
   148	  `structurizr-dsl`) is C4's reference implementation;
   149	  the relationship between C4-as-model and Structurizr-
   150	  as-DSL is documented separately. Cross-reference at
   151	  artefact-completion time.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/symphony-spec.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: symphony-spec
     3	source_name: "OpenAI Symphony — SPEC.md (operating-model-as-SPEC)"
     4	primary_url: "https://github.com/openai/symphony/blob/main/SPEC.md"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
     9	methodology_relevance: |
    10	  Symphony's SPEC.md is the only in-the-wild example of
    11	  "operating-model-as-SPEC" — research §3 named it the
    12	  source of 14 transferable building blocks for the
    13	  methodology. This corpus entry anchors the 18-section
    14	  structure, the three-profile conformance model, and the
    15	  tiered Definition-of-Done so the methodology can cite
    16	  Symphony precisely when prescribing the SPEC bundle's
    17	  shape and conformance harness.
    18	---
    19	
    20	# OpenAI Symphony SPEC.md
    21	
    22	## 1. Source identity
    23	
    24	- Name: OpenAI Symphony SPEC.md.
    25	- Author: OpenAI (Symphony project).
    26	- Canonical URL: `url://github.com/openai/symphony/blob/main/SPEC.md`.
    27	- License: project license (OpenAI; not deep-read for
    28	  exact licence terms on this pass).
    29	- Status: in-the-wild operating-model-as-SPEC; cited as
    30	  prior art for the methodology.
    31	
    32	## 2. Fetch trace
    33	
    34	- `cmd://WebFetch url://github.com/openai/symphony/blob/main/SPEC.md`
    35	  — 2026-05-19; returned 18-section structure, §17
    36	  Conformance Profiles, §18 DoD subsection breakdown.
    37	
    38	## 3. Verbatim claims this corpus depends on
    39	
    40	- **Symphony definition** (`url://github.com/openai/symphony/blob/main/SPEC.md`
    41	  §1 Problem Statement): "Symphony is a long-running
    42	  automation service that continuously reads work from
    43	  an issue tracker (Linear in this specification
    44	  version), creates an isolated workspace for each
    45	  issue, and runs a coding agent session for that issue
    46	  inside the workspace."
    47	
    48	- **The 18-section structure**:
    49	  1. Problem Statement
    50	  2. Goals and Non-Goals
    51	  3. System Overview
    52	  4. Core Domain Model
    53	  5. Workflow Specification (Repository Contract)
    54	  6. Configuration Specification
    55	  7. Orchestration State Machine
    56	  8. Polling, Scheduling, and Reconciliation
    57	  9. Workspace Management and Safety
    58	  10. Agent Runner Protocol
    59	  11. Issue Tracker Integration Contract
    60	  12. Prompt Construction and Context Assembly
    61	  13. Logging, Status, and Observability
    62	  14. Failure Model and Recovery Strategy
    63	  15. Security and Operational Safety
    64	  16. Reference Algorithms
    65	  17. Test and Validation Matrix
    66	  18. Implementation Checklist
    67	
    68	- **§17 Conformance Profiles** — three profiles:
    69	  - **Core Conformance**: "Deterministic tests required
    70	    for all conforming implementations."
    71	  - **Extension Conformance**: "Required only for
    72	    optional features an implementation chooses to
    73	    ship."
    74	  - **Real Integration Profile**: "Environment-dependent
    75	    smoke/integration checks recommended before
    76	    production use."
    77	
    78	- **§18 Definition of Done** — three subsections aligned
    79	  with §17 profiles:
    80	  - §18.1 REQUIRED for Conformance: 23 mandatory
    81	    components (workflow loader, orchestrator, tracker
    82	    client, workspace manager, hooks, agent runner,
    83	    retry queue, reconciliation, observability).
    84	  - §18.2 RECOMMENDED Extensions: 4 optional
    85	    capabilities (HTTP server, Linear GraphQL tool,
    86	    persistence across restarts, pluggable tracker
    87	    adapters).
    88	  - §18.3 Operational Validation Before Production: 3
    89	    pre-deployment checks (integration testing, host OS
    90	    verification, HTTP server configuration).
    91	
    92	## 4. Fact-link to methodology
    93	
    94	<!-- lint-ok: no-citation -->
    95	
    96	The 18-section structure is the most concrete in-the-wild
    97	example of operating-model-as-SPEC the methodology can
    98	cite. Confirmed transferable building blocks from research
    99	§3 (14 named blocks): the per-section anchoring of
   100	domain model, workflow contract, configuration pipeline,
   101	state machine, idempotency rules, safety invariants,
   102	observability layering, failure-class × recovery matrix,
   103	trust boundary, conformance profiles, tiered Definition
   104	of Done.
   105	
   106	The Symphony-specific (non-transferable) sections:
   107	- §10 Agent Runner Protocol — agent-specific.
   108	- §11.1-§11.4 Issue Tracker Integration — Linear-bound.
   109	- §12 Prompt Construction — prompt-engineering-specific.
   110	- §16 Reference Algorithms — Symphony-specific
   111	  algorithms.
   112	- §4 entity content — Codex/Linear-specific.
   113	
   114	## 5. Downstream-citation surface
   115	
   116	<!-- lint-ok: no-citation -->
   117	
   118	Methodology claims licensed by this entry (cite as
   119	`file://research/primary-sources/symphony-spec.md §3`):
   120	
   121	- methodology-claim: "Symphony's SPEC.md is the only
   122	  example of an operating-model shipped as a versioned
   123	  18-section SPEC artefact (with three-profile
   124	  conformance harness + tiered DoD) **identified by
   125	  this project's research workpad** at
   126	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   127	  §3. Symphony's own SPEC.md does not assert global
   128	  uniqueness; the global-uniqueness claim is research-
   129	  workpad scoped, not primary-source licensed."
   130	- methodology-claim: "Symphony's three-profile
   131	  conformance model (Core / Extension / Real-Integration)
   132	  is reusable for the methodology's published SPEC
   133	  bundle conformance harness."
   134	- methodology-claim: "Symphony's tiered Definition-of-
   135	  Done (§18.1 REQUIRED + §18.2 RECOMMENDED + §18.3
   136	  pre-production checks) is the most directly portable
   137	  section in the document and the methodology's
   138	  SPEC-bundle Definition-of-Done MAY adopt the same
   139	  structure."
   140	- methodology-claim: "Symphony §5 Workflow Specification
   141	  (the repo-owned contract pattern with framework-
   142	  defined schema + free-form body + strict validation)
   143	  is the most novel-and-portable building block in the
   144	  Symphony document."
   145	
   146	## 6. Open questions surfaced by the primary read
   147	
   148	- Symphony's SPEC.md is bound to Linear as the issue
   149	  tracker; the methodology's framing is tracker-
   150	  agnostic. Citations of Symphony as prior art must
   151	  note this binding.
   152	- Symphony ships an Elixir reference implementation
   153	  (per external coverage) but the SPEC.md itself does
   154	  not bind to Elixir. Methodology may want to cite
   155	  Symphony as evidence of "single SPEC + multiple
   156	  language implementations" but should not put
   157	  reference-implementation language constraints on its
   158	  own SPEC bundle.
   159	- Symphony §17 Conformance Profiles + §18 DoD are
   160	  Symphony's quality bar; the methodology's SPEC bundle
   161	  conformance suite is a separate harness. The shape is
   162	  transferable but the contents are not.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/leaddev-agent-compiled.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: leaddev-agent-compiled
     3	source_name: "LeadDev — Can you trust the spec? The risky future of agent-compiled software"
     4	primary_url: "https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
     9	methodology_relevance: |
    10	  This is the closest published statement of the
    11	  agentic-installation hypothesis — framed as a RISK,
    12	  not as a method. The methodology Product B publishes
    13	  the same hypothesis as PROCEDURE (with the risks
    14	  named and acknowledged). This corpus entry anchors
    15	  the risk framing, the patching-semantics quote, and
    16	  Willison's hybrid mitigation so the methodology can
    17	  cite the LeadDev article precisely as the prior-art
    18	  critique it must address.
    19	---
    20	
    21	# LeadDev — Can You Trust the Spec?
    22	
    23	## 1. Source identity
    24	
    25	- Title: "Can you trust the spec? The risky future of
    26	  agent-compiled software".
    27	- Publisher: LeadDev.
    28	- Canonical URL: `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`.
    29	- Status: published critique; closest in-the-wild
    30	  articulation of the agentic-installation hypothesis
    31	  framed as a risk surface.
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
    36	  — 2026-05-19; returned core risk hypothesis,
    37	  patching-semantics quote, Willison mitigation.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **Core risk hypothesis** (verbatim from the article):
    42	  "In regulated environments, organizations must be
    43	  able to say with precision what code was running at
    44	  the time of an incident, demonstrate it was tested,
    45	  and show it was authorised."
    46	  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`)
    47	
    48	- **Patching-semantics quote** (attributed to Lukaas
    49	  Kruger, Klarus founder): "Patching is no longer
    50	  'Deploy version 2.1.4' but 'Update the spec and hope
    51	  every downstream compilation behaves consistently.'"
    52	
    53	- **Concrete failure mode** (verbatim): "If every
    54	  deployment compiles a slightly different agent-built
    55	  version from a shared spec, incident response becomes
    56	  an archaeology problem."
    57	
    58	- **Simon Willison mitigation** (attributed): leverage
    59	  "custom plugins and API integrations — which can be
    60	  vibe coded as much as you like, but benefit from
    61	  taking to a core system that's standardized and
    62	  tested and understood." Hybrid approach: customise
    63	  the periphery, standardise the core.
    64	
    65	## 4. Fact-link to methodology
    66	
    67	<!-- lint-ok: no-citation -->
    68	
    69	The LeadDev article is the methodology's most direct
    70	honest-posture obligation. The methodology Product B
    71	publishes the same hypothesis as procedure; it MUST
    72	address the risks LeadDev names rather than dismiss
    73	them.
    74	
    75	Implications for the methodology:
    76	
    77	- The §7 failure-modes section of the longread MUST
    78	  cite this article as the prior-art critique.
    79	- The methodology's seven open research questions
    80	  (research workpad §2.3) cover exactly the surfaces
    81	  LeadDev names — particularly Q3 (versioning and
    82	  patching semantics), Q4 (install-matches-intent
    83	  verification), Q5 (equivalence classes of valid
    84	  implementations).
    85	- Willison's hybrid mitigation (custom periphery +
    86	  standardised core) is the methodology's reference-
    87	  implementation/extensions split made concrete by
    88	  another voice.
    89	
    90	## 5. Downstream-citation surface
    91	
    92	<!-- lint-ok: no-citation -->
    93	
    94	Methodology claims licensed by this entry (cite as
    95	`file://research/primary-sources/leaddev-agent-compiled.md
    96	§3`):
    97	
    98	- methodology-claim: "The agentic-installation
    99	  hypothesis — that developers ship specs and users
   100	  agent-compile their own deployments — has been
   101	  articulated in published form as a risk (LeadDev,
   102	  Kruger, Willison) before being articulated as a
   103	  procedure."
   104	- methodology-claim: "In regulated environments, the
   105	  'what code was running at the time of incident'
   106	  obligation is unmet by agent-compiled software unless
   107	  the SPEC + compilation outcome is reproducibly
   108	  verifiable."
   109	- methodology-claim: "Patching semantics under
   110	  agentic-installation shift from 'deploy version X.Y.Z'
   111	  to 'update spec and verify downstream re-compilation
   112	  is consistent' — the methodology's versioning facet
   113	  must address this directly."
   114	- methodology-claim: "Hybrid customise-periphery /
   115	  standardise-core was articulated by Simon Willison in
   116	  the LeadDev article as a mitigation suggestion
   117	  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`).
   118	  Whether the methodology endorses it for safety-
   119	  critical paths is a separate **methodology
   120	  judgment** (`judgment://agent-synthesis` requiring
   121	  owner affirmation), not a claim licensed by Willison
   122	  or the LeadDev article alone."
   123	
   124	## 6. Open questions surfaced by the primary read
   125	
   126	- The article does not propose a solution; it names
   127	  the risks. The methodology takes the risks as open
   128	  research questions (research §2.3) rather than
   129	  claiming to resolve them — this corpus read confirms
   130	  the framing is appropriate.
   131	- The regulated-environments framing (audit, incident
   132	  response, authorisation traces) is more prominent in
   133	  the LeadDev article than in the dispositioned
   134	  research workpad. The methodology longread should
   135	  surface compliance + audit traceability as a
   136	  first-class concern, not bury it.
   137	- Kruger's "hope every downstream compilation behaves
   138	  consistently" phrasing is the methodology's
   139	  acknowledged tension: deterministic build-from-spec
   140	  is the goal; "hope it works" is the failure mode the
   141	  methodology's reproducibility primitives (Nix,
   142	  Sigstore-anchored bundle versioning) try to close.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/ref-arch-vs-solution-arch.md | sed -n '1,170p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: ref-arch-vs-solution-arch
     3	source_name: "Mike Cottmeyer — Reference Architecture vs Reference Implementation (LiminalArc, 2019)"
     4	primary_url: "https://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
     9	methodology_relevance: |
    10	  This is the closest existing articulation of the
    11	  methodology's cross-org ownership-split protocol
    12	  (research §4.3): what the developer publishes as
    13	  universal (reference architecture) vs what the
    14	  installer customises (reference implementation /
    15	  solution architecture). Mike Cottmeyer's distinction
    16	  is the methodology's vocabulary precursor.
    17	---
    18	
    19	# Reference Architecture vs Reference Implementation
    20	
    21	## 1. Source identity
    22	
    23	- Title: "Reference Architecture vs Reference
    24	  Implementation."
    25	- Author: Mike Cottmeyer.
    26	- Publisher: LiminalArc (Cottmeyer's consulting blog).
    27	- Date: 2019-05.
    28	- Canonical URL: `url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`.
    29	- Context: agile-transformation consulting; emerged
    30	  from observing organisations attempting to deploy
    31	  SAFe, LeSS, or Disciplined Agile Delivery verbatim.
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`
    36	  — 2026-05-19; returned Cottmeyer's distinction +
    37	  consulting context + universal-vs-negotiable framing.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **Reference architecture (Cottmeyer)**: comprises
    42	  "base patterns that... transcend any of the
    43	  methodologies." Key claim: "The reference
    44	  architecture holds universally."
    45	
    46	- **Reference implementation (Cottmeyer)**: "The
    47	  reference implementation is what is negotiable" —
    48	  contrasted directly with the universal nature of
    49	  reference architecture.
    50	
    51	- **Posture distinction (verbatim framing)**:
    52	  - Reference Architecture: universal, non-negotiable
    53	    foundational patterns (in Cottmeyer's domain:
    54	    teams, backlogs, working tested software,
    55	    dependency management).
    56	  - Reference Implementation: tailorable methodology
    57	    — the specific tools, techniques, and controls
    58	    selected based on context.
    59	
    60	- **Underlying thesis** (paraphrased from Cottmeyer, not
    61	  verbatim): the original article frames the underlying
    62	  point as understanding the immutable base patterns
    63	  that organisations cannot violate without losing
    64	  transformation viability. (See LiminalArc article
    65	  body; the surrounding quotation in this corpus entry
    66	  is a near-paraphrase based on the WebFetch summary —
    67	  treat as paraphrase unless the exact source wording is
    68	  later confirmed by a follow-on read.)
    69	
    70	- **Consulting context** (paraphrased from Cottmeyer):
    71	  the distinction emerged from practical agile-
    72	  transformation work where organisations attempt to
    73	  implement frameworks like SAFe, LeSS, or Disciplined
    74	  Agile Delivery. Cottmeyer's observation: blindly
    75	  deploying methodologies verbatim fails, but
    76	  understanding the immutable patterns beneath various
    77	  frameworks enables organisations to tailor their
    78	  approach while maintaining transformation viability.
    79	  (Both sentences are paraphrase based on the WebFetch
    80	  summary, not exact source wording; the canonical
    81	  article body is at the cited URL.)
    82	
    83	## 4. Fact-link to methodology
    84	
    85	<!-- lint-ok: no-citation -->
    86	
    87	Cottmeyer's distinction maps directly onto the
    88	methodology's cross-org ownership split:
    89	
    90	- **What the developer publishes universally** =
    91	  reference architecture (in methodology terms: the
    92	  front-door manifest + architecture/ + behavior/ +
    93	  decisions/ sub-specs; the "what" of the product).
    94	- **What the installer makes negotiable** = reference
    95	  implementation (in methodology terms: the
    96	  customization/ + deployment/ sub-specs as
    97	  parameterised; the "how" of the product in this
    98	  installer's environment).
    99	
   100	The vocabulary precedes the methodology and is
   101	useful as a citable label. The methodology
   102	generalises Cottmeyer's distinction from agile-
   103	transformation consulting (developer = framework
   104	author, installer = transforming organisation) to
   105	arbitrary product distribution.
   106	
   107	## 5. Downstream-citation surface
   108	
   109	<!-- lint-ok: no-citation -->
   110	
   111	Methodology claims licensed by this entry (cite as
   112	`file://research/primary-sources/ref-arch-vs-solution-arch.md
   113	§3`):
   114	
   115	- methodology-claim: "Cottmeyer (2019) distinguishes
   116	  reference architecture (universal, non-negotiable)
   117	  from reference implementation (tailorable,
   118	  negotiable) — a vocabulary precursor for the
   119	  methodology's cross-org ownership split."
   120	- methodology-claim: "The methodology's developer-
   121	  owns-intent / installer-owns-deployment ownership
   122	  split is a generalisation of Cottmeyer's
   123	  architecture-vs-implementation distinction, scaled
   124	  from agile-transformation consulting to product
   125	  distribution."
   126	- methodology-claim: "Reference architecture as
   127	  Cottmeyer defines it ('holds universally') is the
   128	  methodology's analogue for what the published SPEC
   129	  bundle's front-door manifest + intent sub-specs
   130	  contain; reference implementation as Cottmeyer
   131	  defines it ('what is negotiable') is the
   132	  methodology's analogue for the customization +
   133	  deployment sub-specs."
   134	- methodology-claim: "Cottmeyer's empirical
   135	  observation — 'blindly deploying methodologies
   136	  verbatim fails' — is the methodology's case for
   137	  non-prescriptive SPECs: prescription erodes the
   138	  installer's authority to tailor."
   139	
   140	## 6. Open questions surfaced by the primary read
   141	
   142	- Cottmeyer's frame is agile-transformation
   143	  consulting; the methodology generalises to
   144	  arbitrary product distribution. The
   145	  generalisability of Cottmeyer's "base patterns" to
   146	  software-product domains beyond agile-transformation
   147	  is not proven by his original frame — methodology
   148	  must own the generalisation explicitly.
   149	- Cottmeyer cites four base patterns (teams,
   150	  backlogs, working tested software, dependency
   151	  management) for agile transformation. The
   152	  methodology has not yet enumerated equivalent
   153	  "base patterns" for product distribution. This is
   154	  a methodology design open question.
   155	- Academic literature on reference-architecture-vs-
   156	  solution-architecture (Galster, Avgeriou, others)
   157	  is older than Cottmeyer's framing. If methodology
   158	  wants stronger academic anchoring, those primary
   159	  sources merit separate corpus entries.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/nix-flakes.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: nix-flakes
     3	source_name: "Nix Flakes — flake.nix + flake.lock"
     4	primary_url: "https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
     9	methodology_relevance: |
    10	  Nix flakes are research §5.1's "strongest reproducible-
    11	  from-spec primitive." This corpus entry anchors the
    12	  flake.nix file structure, the flake.lock content-hash
    13	  model, and Nix's reproducibility guarantees so the
    14	  methodology can cite the flake model precisely when
    15	  prescribing the deployment/ sub-spec's reproducibility
    16	  contract.
    17	---
    18	
    19	# Nix Flakes
    20	
    21	## 1. Source identity
    22	
    23	- Name: Nix flakes — the unit for packaging Nix code
    24	  reproducibly.
    25	- Canonical URL: `url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
    26	  (note: the older `url://nixos.org/manual/...` redirects
    27	  to nix.dev as of fetch date).
    28	- Specification authority: NixOS RFCs (RFC 49 for flakes
    29	  proposal); current implementation in `nix` CLI.
    30	
    31	## 2. Fetch trace
    32	
    33	- `cmd://WebFetch url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake`
    34	  — 2026-05-19; returned 302 redirect to nix.dev.
    35	- `cmd://WebFetch url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
    36	  — 2026-05-19; primary read; returned flake definition,
    37	  flake.nix structure, flake.lock semantics, repro
    38	  guarantees.
    39	
    40	## 3. Verbatim claims this corpus depends on
    41	
    42	- **Flake definition**: a flake is "a filesystem tree
    43	  (typically fetched from a Git repository or a tarball)
    44	  that contains a file named `flake.nix` in the root
    45	  directory." (`url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`)
    46	
    47	- **flake.nix attributes**:
    48	  - `inputs` — an attrset specifying dependencies,
    49	    mapping input names to flake references. "Each input
    50	    is fetched, evaluated and passed to the `outputs`
    51	    function as a set of attributes with the same name
    52	    as the corresponding input."
    53	  - `outputs` — a function receiving an attribute set of
    54	    input flake outputs, returning Nix values the flake
    55	    provides.
    56	  - `description` — one-line summary.
    57	
    58	- **Per-input metadata** passed to `outputs`:
    59	  - `outPath` — store path of the source tree.
    60	  - `rev` — commit hash if applicable.
    61	  - `lastModified` — commit time, seconds since epoch.
    62	  - `narHash` — SHA-256 hash in SRI format.
    63	
    64	- **flake.lock** is "a UTF-8 JSON file" containing "a
    65	  graph structure isomorphic to the graph of
    66	  dependencies of the root flake." Per-node fields:
    67	  - `inputs` — dependency mappings.
    68	  - `original` — unlocked specification from flake.nix.
    69	  - `locked` — resolved specification with exact
    70	    revision and `narHash`.
    71	  - `flake` — boolean (flake vs non-flake dep).
    72	
    73	- **Reproducibility guarantee**: Nix automatically
    74	  generates and maintains flake.lock. Locked
    75	  specifications contain exact revisions and content
    76	  hashes. "When we build this flake, the input
    77	  `nixpkgs` is mapped to revision [specific hash]."
    78	  Furthermore: "lock files transitively lock direct as
    79	  well as indirect dependencies."
    80	
    81	## 4. Fact-link to methodology
    82	
    83	<!-- lint-ok: no-citation -->
    84	
    85	Nix flakes operationalize "reproducible-from-spec" at the
    86	strongest current level: content-addressed inputs +
    87	transitive lock + reproducible outputs. Key shape
    88	implications for the methodology's deployment/ sub-spec:
    89	
    90	- The deployment/ sub-spec MAY adopt a flake-style
    91	  inputs/outputs structure as the contract shape: inputs
    92	  are the declared dependencies (the spec's deferral
    93	  contract); outputs are the materialized deployment
    94	  artefacts.
    95	- The flake.lock content-hash model is a strong
    96	  primitive for "two installs produce the same build
    97	  outputs"; the methodology's equivalence-classes open
    98	  question (research §2.3.5) can cite Nix as one
    99	  concrete example of equivalence-by-construction. (The
   100	  claim that Nix is "the strongest" reproducibility
   101	  primitive in the field is a comparative
   102	  `judgment://agent-synthesis`, not licensed by Nix's
   103	  own documentation; methodology prose should frame Nix
   104	  as "an example" rather than "the strongest" without
   105	  separate comparative evidence.)
   106	- The transitive-lock property — every direct and
   107	  indirect dependency pinned — is the methodology's
   108	  posture for the SPEC bundle's manifest: every cited
   109	  sub-spec is pinned by content hash, not version range.
   110	
   111	## 5. Downstream-citation surface
   112	
   113	<!-- lint-ok: no-citation -->
   114	
   115	Methodology claims licensed by this entry (cite as
   116	`file://research/primary-sources/nix-flakes.md §3`):
   117	
   118	- methodology-claim: "Nix flakes ship a two-file model:
   119	  flake.nix (declarative inputs + outputs) and flake.lock
   120	  (resolved + content-hashed dependency graph)."
   121	- methodology-claim: "flake.lock provides transitive
   122	  pin-by-content-hash; rebuild reproducibility holds
   123	  across direct and indirect dependencies."
   124	- methodology-claim: "Nix's reproducibility model is the
   125	  strongest current implementation of build-from-spec;
   126	  the methodology cites it as the upper bound on
   127	  equivalence-class-by-construction."
   128	- methodology-claim: "The methodology's deployment/
   129	  sub-spec MAY mirror flake's inputs/outputs shape,
   130	  treating inputs as the deferral contract and outputs
   131	  as the deployment artefact set."
   132	
   133	## 6. Open questions surfaced by the primary read
   134	
   135	- Nix flakes are still officially "experimental" in
   136	  stable Nix releases; the methodology should
   137	  acknowledge this when prescribing flake-style inputs/
   138	  outputs as a deployment-spec shape.
   139	- Whether Nix's content-hash reproducibility generalises
   140	  to non-Nix language ecosystems (Helm? OCI? container
   141	  images built outside Nix?) is an open methodology
   142	  question. The methodology MAY recommend Nix-like
   143	  reproducibility WITHOUT mandating Nix as the
   144	  underlying substrate.
   145	- The relationship between flake.lock and OCI image
   146	  content-addressing is a useful methodology comparison
   147	  point — Nix has filesystem-tree hashes; OCI has
   148	  layer-digest hashes. Different content addressing
   149	  models with similar reproducibility guarantees.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "only|strongest|viable|endorse|extends|not deep-read|NOT deep-read|deep-read|MUST NOT|canonical|qualifies|addresses|regulated|default|SPEC bundle" research/primary-sources/*.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/json-schema.md:40:  Methodology MUST NOT quote specific validation keyword
research/primary-sources/json-schema.md:104:  specific vocabularies once their drafts are deep-read."
research/primary-sources/json-schema.md:116:  earlier drafts (Draft 7, Draft 6) is not deep-read;
research/primary-sources/json-schema.md:117:  adopter tooling commonly pins older drafts, so the
research/primary-sources/symphony-spec.md:10:  Symphony's SPEC.md is the only in-the-wild example of
research/primary-sources/symphony-spec.md:16:  Symphony precisely when prescribing the SPEC bundle's
research/primary-sources/symphony-spec.md:27:- License: project license (OpenAI; not deep-read for
research/primary-sources/symphony-spec.md:71:  - **Extension Conformance**: "Required only for
research/primary-sources/symphony-spec.md:121:- methodology-claim: "Symphony's SPEC.md is the only
research/primary-sources/symphony-spec.md:158:  own SPEC bundle.
research/primary-sources/symphony-spec.md:160:  Symphony's quality bar; the methodology's SPEC bundle
research/primary-sources/structurizr-dsl.md:8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
research/primary-sources/structurizr-dsl.md:85:  sub-spec MAY ship .dsl files as the canonical
research/primary-sources/structurizr-dsl.md:91:  the SPEC bundle."
research/primary-sources/structurizr-dsl.md:96:  keywords) was not deep-read in this pass — only the
research/primary-sources/diataxis.md:13:  vs SPEC-bundle split (and within the SPEC bundle, the
research/primary-sources/diataxis.md:31:  openly; specific license terms not deep-read on this
research/primary-sources/diataxis.md:59:    addresses a real-world goal or problem, by providing
research/primary-sources/diataxis.md:125:  artefacts (longread + SPEC bundle) constitute, in
research/primary-sources/diataxis.md:127:  reference (SPEC bundle) — neither tutorial nor
research/primary-sources/cyclonedx-sbom.md:16:  LeadDev critique §3 "regulated environments" framing
research/primary-sources/cyclonedx-sbom.md:86:  carries SBOM references; CycloneDX is the canonical
research/primary-sources/cyclonedx-sbom.md:90:  §3) raised regulated-environments compliance as a risk
research/primary-sources/cyclonedx-sbom.md:91:  surface; CycloneDX directly addresses it.
research/primary-sources/cyclonedx-sbom.md:93:  let the methodology recommend JSON as default while
research/primary-sources/cyclonedx-sbom.md:95:  regulated-industry tooling or Protobuf for
research/primary-sources/cyclonedx-sbom.md:116:  recommends JSON as the manifest-provenance default."
research/primary-sources/cyclonedx-sbom.md:119:  the methodology's spec bundle qualifies as a CycloneDX
research/primary-sources/cyclonedx-sbom.md:121:- methodology-claim: "CycloneDX addresses the regulated-
research/primary-sources/cyclonedx-sbom.md:131:  CycloneDX is the recommended default (e.g.
research/primary-sources/ref-arch-vs-solution-arch.md:80:  summary, not exact source wording; the canonical
research/primary-sources/c4-model.md:123:  this primary read; downstream methodology MUST NOT
research/primary-sources/arc42.md:34:  link at `url://arc42.org/license` (not deep-read).
research/primary-sources/arc42.md:49:  documentation." It addresses "what should be documented
research/primary-sources/adr-tools-state.md:8:fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
research/primary-sources/adr-tools-state.md:15:  practice rather than locking only on Nygard.
research/primary-sources/adr-tools-state.md:27:- Linked sub-pages (not deep-read on this pass):
research/primary-sources/adr-tools-state.md:49:  "a justified design choice that addresses a
research/primary-sources/adr-tools-state.md:68:template is foundational but no longer the only option.
research/primary-sources/adr-tools-state.md:101:  'a justified design choice that addresses a
research/primary-sources/adr-tools-state.md:118:  on `/adr-tooling/`; not deep-read in this pass. If
research/primary-sources/oci-artifacts.md:11:  artifact" packaging primitive — the published SPEC bundle
research/primary-sources/oci-artifacts.md:17:  SPEC bundle's distribution shape.
research/primary-sources/oci-artifacts.md:30:  (referenced from main spec; not deep-read in this
research/primary-sources/oci-artifacts.md:67:  deep-read 2026-05-19 supplementary fetch):
research/primary-sources/oci-artifacts.md:76:    not a formal specification; the only explicit
research/primary-sources/oci-artifacts.md:80:    packaging, only prescriptive guidance about media-
research/primary-sources/oci-artifacts.md:92:primitive that the methodology's SPEC bundle MAY adopt.
research/primary-sources/oci-artifacts.md:107:  SPEC bundle fits naturally into this category.
research/primary-sources/oci-artifacts.md:122:- methodology-claim: "OCI Artifacts Guidance extends the
research/primary-sources/oci-artifacts.md:134:  Not deep-read in this pass; if methodology specifies a
research/primary-sources/oci-artifacts.md:143:- The Artifacts Guidance doc itself was not deep-read on
research/primary-sources/oci-artifacts.md:145:  conventions for SPEC bundle artefacts, fetch the
research/primary-sources/adr-nygard.md:14:  append-only, superseded-by-link" as the decisions
research/primary-sources/adr-nygard.md:85:§5.1 cited "ADRs (Nygard format), append-only,
research/primary-sources/nix-flakes.md:8:fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
research/primary-sources/nix-flakes.md:10:  Nix flakes are research §5.1's "strongest reproducible-
research/primary-sources/nix-flakes.md:86:strongest current level: content-addressed inputs +
research/primary-sources/nix-flakes.md:100:  claim that Nix is "the strongest" reproducibility
research/primary-sources/nix-flakes.md:104:  as "an example" rather than "the strongest" without
research/primary-sources/nix-flakes.md:108:  posture for the SPEC bundle's manifest: every cited
research/primary-sources/nix-flakes.md:125:  strongest current implementation of build-from-spec;
research/primary-sources/leaddev-agent-compiled.md:42:  "In regulated environments, organizations must be
research/primary-sources/leaddev-agent-compiled.md:104:- methodology-claim: "In regulated environments, the
research/primary-sources/leaddev-agent-compiled.md:118:  Whether the methodology endorses it for safety-
research/primary-sources/leaddev-agent-compiled.md:131:- The regulated-environments framing (audit, incident
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); strongest reproducibility primitive |
research/primary-sources/INDEX.md:23:| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
research/primary-sources/12-factor.md:15:  description, the canonical factor list, and the Config
research/primary-sources/12-factor.md:30:  deep-read on this pass).
research/primary-sources/12-factor.md:127:  prescribes only that configuration be stored in the
research/primary-sources/openapi-3-1.md:52:  - `servers` — Server Objects; defaults to `/`.
research/primary-sources/openapi-3-1.md:90:  behavior contract, not only HTTP. OpenAPI is one of
research/primary-sources/openapi-3-1.md:106:  methodology's own posture: the SPEC bundle describes
research/primary-sources/openapi-3-1.md:137:  methodology MAY support; not deep-read in this pass.
research/primary-sources/spec-kit.md:125:  artefact set is the published SPEC bundle distributed
research/primary-sources/spec-kit.md:143:  team consumption (vs in-team authoring only) is
research/primary-sources/kiro.md:120:  workspaces; not deep-read in this pass.
research/primary-sources/helm-values-schema.md:51:- **values.yaml** provides default configuration; users
research/primary-sources/helm-values-schema.md:78:- A two-file split — defaults (values.yaml) and contract
research/primary-sources/helm-values-schema.md:105:  surface across values.yaml (defaults) + values.schema.json
research/primary-sources/sigstore-cosign.md:16:  the SPEC bundle's signing + verification contract.
research/primary-sources/sigstore-cosign.md:52:- **Rekor**: "an immutable, append-only ledger" that
research/primary-sources/sigstore-cosign.md:85:agent verify the methodology SPEC bundle they fetched
research/primary-sources/sigstore-cosign.md:90:- The methodology's published SPEC bundle, distributed
research/primary-sources/sigstore-cosign.md:94:  manage long-lived signing keys for SPEC bundle
research/primary-sources/sigstore-cosign.md:101:  SPEC bundle's signing event is permanently logged.
research/primary-sources/sigstore-cosign.md:113:  only transparency log), and cosign (the signing
research/primary-sources/sigstore-cosign.md:123:  recommended signing model for SPEC bundle releases —
research/primary-sources/sigstore-cosign.md:136:  deep-read on this pass. If the methodology adopts
research/primary-sources/sigstore-cosign.md:143:  signature governance for SPEC bundles.
research/primary-sources/oracle-agent-spec.md:69:  is the methodology's framing for the SPEC bundle.
research/primary-sources/oracle-agent-spec.md:75:  can install from the SPEC bundle).
research/primary-sources/oracle-agent-spec.md:110:  were not deep-read on this pass. If the
research/primary-sources/cucumber-gherkin.md:80:- The methodology's published SPEC bundle MAY include
research/primary-sources/cucumber-gherkin.md:90:  spec. The methodology's SPEC bundle ships the
research/primary-sources/cucumber-gherkin.md:124:  (English keywords by default; other languages
research/primary-sources/cucumber-gherkin.md:125:  supported). The methodology's SPEC bundle should
research/primary-sources/cucumber-gherkin.md:126:  pin English as the canonical Gherkin language for
research/primary-sources/cucumber-gherkin.md:129:- Cucumber as the canonical runner is not the only

codex
Two remediation points are clean, but a couple of artefacts still carry stale or contradictory language outside the exact rewritten paragraph. I’m checking the gate script now because the index intentionally contains `partial` rows, and the completeness contract needs to agree with that.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/check-corpus-completeness.sh | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# check-corpus-completeness.sh — mechanical completeness gate for
     3	# the primary-source research corpus at research/primary-sources/.
     4	#
     5	# Authority:
     6	# file://specs/2026-05-19-primary-source-research-corpus/SPEC.md §7.2,
     7	# §9.1, §13 AC-4.
     8	#
     9	# Verifies:
    10	# 1. INDEX.md exists and parses.
    11	# 2. Every slug in INDEX has a matching <slug>.md file.
    12	# 3. Every <slug>.md file (other than INDEX.md) has a row in INDEX.
    13	# 4. Every status is one of:
    14	#    primary-read-complete | partial | access-blocked | superseded | pending.
    15	# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
    16	# 6. No row at status: pending (the corpus is closed when this script
    17	#    exits 0; pending rows mean incomplete work).
    18	# 7. Every access-blocked row has an alternative-source-found note OR
    19	#    an explicit unreachability disclaimer (heuristic: §6 Open Questions
    20	#    in the artefact mentions "alternative" or "unreachable").
    21	#
    22	# Exit 0 iff the corpus is complete; non-zero with diagnostics to stderr
    23	# otherwise.
    24	
    25	set -uo pipefail
    26	
    27	# Resolve repo root from script location.
    28	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    29	REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    30	CORPUS_DIR="$REPO_ROOT/research/primary-sources"
    31	INDEX_FILE="$CORPUS_DIR/INDEX.md"
    32	SPEC_FILE="$REPO_ROOT/specs/2026-05-19-primary-source-research-corpus/SPEC.md"
    33	
    34	EXPECTED_VERSION="v1.1"
    35	
    36	fail() {
    37	    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
    38	    exit 1
    39	}
    40	
    41	# 1. INDEX exists.
    42	if [ ! -f "$INDEX_FILE" ]; then
    43	    fail "INDEX.md not found at $INDEX_FILE"
    44	fi
    45	
    46	# 2. SOURCE_LIST_VERSION matches.
    47	actual_version="$(grep -E '^Source-list version:' "$INDEX_FILE" | head -1 | sed -E 's/^Source-list version:[[:space:]]+//')"
    48	if [ "$actual_version" != "$EXPECTED_VERSION" ]; then
    49	    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
    50	fi
    51	
    52	# 3. Parse INDEX rows.
    53	# Row format: | <slug> | <status> | <date-or-dash> | <summary> |
    54	# Skip header + separator lines (first two | lines).
    55	mapfile -t rows < <(grep -E '^\|' "$INDEX_FILE" | tail -n +3 | sed -E 's/^\|[[:space:]]*//;s/[[:space:]]*\|[[:space:]]*/|/g;s/[[:space:]]*\|$//')
    56	
    57	if [ ${#rows[@]} -eq 0 ]; then
    58	    fail "INDEX.md has no data rows"
    59	fi
    60	
    61	declare -A index_slugs
    62	declare -A index_status
    63	issues=()
    64	
    65	valid_statuses="primary-read-complete partial access-blocked superseded pending"
    66	
    67	for row in "${rows[@]}"; do
    68	    IFS='|' read -r slug status fetched_on summary <<<"$row"
    69	    [ -z "$slug" ] && continue
    70	    index_slugs["$slug"]=1
    71	    index_status["$slug"]="$status"
    72	
    73	    # 4. Status valid.
    74	    if ! printf '%s\n' $valid_statuses | grep -qFx "$status"; then
    75	        issues+=("invalid status '$status' for slug '$slug'")
    76	    fi
    77	
    78	    # 5. No pending.
    79	    if [ "$status" = "pending" ]; then
    80	        issues+=("slug '$slug' is still status: pending")
    81	    fi
    82	
    83	    # 6. Matching file exists.
    84	    if [ ! -f "$CORPUS_DIR/$slug.md" ]; then
    85	        issues+=("slug '$slug' in INDEX has no matching file at research/primary-sources/$slug.md")
    86	    fi
    87	
    88	    # 7. Access-blocked must record an alternative or unreachability note in §6.
    89	    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
    90	        if ! grep -qiE 'alternative|unreachable|fallback' "$CORPUS_DIR/$slug.md"; then
    91	            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
    92	        fi
    93	    fi
    94	done
    95	
    96	# 8. Orphan files (file exists but no INDEX row).
    97	for f in "$CORPUS_DIR"/*.md; do
    98	    [ -f "$f" ] || continue
    99	    base="$(basename "$f" .md)"
   100	    [ "$base" = "INDEX" ] && continue
   101	    if [ -z "${index_slugs[$base]:-}" ]; then
   102	        issues+=("orphan file: $base.md has no row in INDEX.md")
   103	    fi
   104	done
   105	
   106	if [ ${#issues[@]} -gt 0 ]; then
   107	    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
   108	    for i in "${issues[@]}"; do
   109	        printf '  - %s\n' "$i" >&2
   110	    done
   111	    exit 1
   112	fi
   113	
   114	n_rows=${#index_slugs[@]}
   115	printf 'check-corpus-completeness: PASS — %d sources, all complete\n' "$n_rows"
   116	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '331,350p;620,720p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   331	### 7.2 INDEX-driven check script
   332	
   333	`scripts/check-corpus-completeness.sh` MUST:
   334	
   335	1. Read INDEX.md and parse every row.
   336	2. For each row's slug, verify
   337	   `research/primary-sources/<slug>.md` exists.
   338	3. For each `<slug>.md` file, verify a row exists in
   339	   INDEX.md with matching slug.
   340	4. Verify every row's status is one of
   341	   `primary-read-complete | partial | access-blocked |
   342	   superseded | pending`.
   343	5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
   344	   version frozen in §6.1 of this SPEC.
   345	6. Exit 0 if every slug in INDEX.md is either
   346	   `primary-read-complete` or has a documented
   347	   `access-blocked` (with §6 alternative note); else
   348	   exit non-zero with diagnostic lines per gap.
   349	
   350	### 7.3 Corpus citation binding (downstream slices)
   620	  index; all 20 rows at status: primary-read-complete.
   621	- `research/primary-sources/*.md` — 20 per-source
   622	  artefacts, all conforming to §6.2 schema + §8.1
   623	  front-matter:
   624	  - arc42 (architecture documentation)
   625	  - c4-model (architecture model)
   626	  - adr-nygard (foundational ADR)
   627	  - adr-tools-state (state-of-practice ADR)
   628	  - diataxis (documentation taxonomy)
   629	  - 12-factor (cloud-native SaaS methodology)
   630	  - helm-values-schema (customization-affordance)
   631	  - nix-flakes (reproducibility)
   632	  - oci-artifacts (distribution packaging)
   633	  - sigstore-cosign (signing)
   634	  - symphony-spec (operating-model-as-SPEC)
   635	  - spec-kit (spec-as-authoring tool)
   636	  - kiro (agentic IDE)
   637	  - openspec (spec-driven dev tool)
   638	  - oracle-agent-spec (framework-agnostic agent
   639	    description)
   640	  - ref-arch-vs-solution-arch (ownership-split
   641	    precursor)
   642	  - leaddev-agent-compiled (published risk critique)
   643	  - cucumber-gherkin (executable behavior spec)
   644	  - openapi-3-1 (HTTP API contract)
   645	  - structurizr-dsl (architecture-as-code)
   646	- This SPEC's §15 Acceptance Criteria checkboxes
   647	  flipped to checked.
   648	
   649	### 19.2 Commands run
   650	
   651	- 23 `cmd://WebFetch` invocations across the 20 sources
   652	  (some sources required supplementary fetches; one
   653	  redirect was followed from nixos.org to nix.dev).
   654	- `cmd://bash scripts/lint-spec.sh
   655	  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   656	  — exit 0 (0 errors, 0 warnings, 47 citation hits).
   657	- `cmd://bash scripts/check-corpus-completeness.sh` —
   658	  exit 0; PASS — 20 sources, all complete.
   659	- Per-artefact `cmd://bash scripts/lint-spec.sh
   660	  research/primary-sources/<slug>.md` — exit 1 on each.
   661	  Two issue classes:
   662	  1. Front-matter shape: corpus artefacts use `slug:`
   663	     not `type:`, so lint reports "missing
   664	     type/implies_spec_type field" + "missing required
   665	     section: ##". These are misapplied checks — the
   666	     lint script is designed for SPEC artefacts.
   667	  2. Uncited-claim: 18 of 20 artefacts have
   668	     `fact-bearing paragraph lacks citation prefix`
   669	     errors in §4 / §5 / §6 — meta-commentary bullets
   670	     that reference §3 by section but lack an inline
   671	     prefix the script's paragraph scanner recognises.
   672	  **Cross-family review (codex finding 2.1) correctly
   673	  identified this as a hack**: SPEC §7.1 says
   674	  uncited-claim is BLOCKING on corpus artefacts, but
   675	  these failures were waved off as front-matter noise.
   676	  The honest reading is that the current lint is not
   677	  fit-for-purpose on corpus artefacts and the in-place
   678	  enforcement gap is a follow-on Task SPEC for a
   679	  corpus-mode lint extension (or a separate
   680	  `scripts/validate-corpus-citations.sh` script that
   681	  applies only the uncited-claim subset of the
   682	  citation grammar to corpus artefacts). Until that
   683	  Task SPEC executes, `check-corpus-completeness.sh`
   684	  is the authoritative mechanical gate and per-artefact
   685	  citation density is reviewer-enforced. The corpus
   686	  artefacts authored under this SPEC ARE densely cited
   687	  (17+ citation prefixes per artefact), but the
   688	  mechanical claim that uncited-claim is blocking
   689	  cannot currently be verified by the script.
   690	
   691	### 19.3 Verification result
   692	
   693	PASS. All §15 ACs met:
   694	
   695	- AC-1: SPEC.md lint clean (exit 0).
   696	- AC-2: INDEX.md present.
   697	- AC-3: check-corpus-completeness.sh present + executable.
   698	- AC-4: check-corpus-completeness.sh exits 0; all 20
   699	  slugs at status primary-read-complete.
   700	- AC-5: every §6.1 slug has corresponding `<slug>.md`
   701	  artefact.
   702	- AC-6: every artefact's front-matter conforms to
   703	  §8.1 schema (manual review).
   704	- AC-7: no verbatim §3 quote exceeds the 200-word
   705	  fair-use bound (manual review; longest excerpts are
   706	  the 18-section Symphony list and 12-factor's 12
   707	  named factors, both well under bound).
   708	- AC-8: this Completion Report records the per-source
   709	  fetch outcomes (all 20 primary-read-complete; zero
   710	  access-blocked) and the source-list discoveries
   711	  (Kiro Bedrock binding NOT confirmed by primary read;
   712	  was an inferred binding in the prior research
   713	  workpad).
   714	- AC-9: cross-family review deferred. Same-family
   715	  self-review performed; advisory recorded. Owner
   716	  directive 2026-05-18 ("base this all in deep
   717	  research, not make up bullshit") was the rigour bar;
   718	  the corpus's verbatim-quote anchoring is the
   719	  primary discharge of that obligation, with
   720	  cross-family review as a secondary check that can

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "partial|primary-read-complete|all complete|Completion Report|SOURCE_LIST_VERSION|AC-|lint|check-corpus|22|json-schema|cyclonedx|advisory" specs/2026-05-19-primary-source-research-corpus/SPEC.md scripts/check-corpus-completeness.sh research/primary-sources/INDEX.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/INDEX.md:10:check script `scripts/check-corpus-completeness.sh` enforces
research/primary-sources/INDEX.md:15:| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
research/primary-sources/INDEX.md:16:| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
research/primary-sources/INDEX.md:17:| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:19:| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
research/primary-sources/INDEX.md:20:| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
research/primary-sources/INDEX.md:21:| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); strongest reproducibility primitive |
research/primary-sources/INDEX.md:23:| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
research/primary-sources/INDEX.md:24:| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
research/primary-sources/INDEX.md:25:| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
research/primary-sources/INDEX.md:26:| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
research/primary-sources/INDEX.md:27:| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
research/primary-sources/INDEX.md:28:| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
research/primary-sources/INDEX.md:29:| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
research/primary-sources/INDEX.md:30:| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
research/primary-sources/INDEX.md:31:| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
research/primary-sources/INDEX.md:32:| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
research/primary-sources/INDEX.md:33:| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/INDEX.md:36:| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |
research/primary-sources/INDEX.md:41:- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
scripts/check-corpus-completeness.sh:2:# check-corpus-completeness.sh — mechanical completeness gate for
scripts/check-corpus-completeness.sh:7:# §9.1, §13 AC-4.
scripts/check-corpus-completeness.sh:14:#    primary-read-complete | partial | access-blocked | superseded | pending.
scripts/check-corpus-completeness.sh:15:# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
scripts/check-corpus-completeness.sh:37:    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
scripts/check-corpus-completeness.sh:46:# 2. SOURCE_LIST_VERSION matches.
scripts/check-corpus-completeness.sh:49:    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
scripts/check-corpus-completeness.sh:65:valid_statuses="primary-read-complete partial access-blocked superseded pending"
scripts/check-corpus-completeness.sh:107:    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
scripts/check-corpus-completeness.sh:115:printf 'check-corpus-completeness: PASS — %d sources, all complete\n' "$n_rows"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:12:  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md:14:  - bash scripts/check-corpus-completeness.sh
specs/2026-05-19-primary-source-research-corpus/SPEC.md:74:  (`scripts/check-corpus-completeness.sh`) so the corpus's
specs/2026-05-19-primary-source-research-corpus/SPEC.md:100:current status (`pending` / `primary-read-complete` /
specs/2026-05-19-primary-source-research-corpus/SPEC.md:104:(`scripts/check-corpus-completeness.sh`) walks the index and
specs/2026-05-19-primary-source-research-corpus/SPEC.md:112:a follow-on extension to `scripts/lint-spec.sh` (out of
specs/2026-05-19-primary-source-research-corpus/SPEC.md:154:- The check script `scripts/check-corpus-completeness.sh`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:156:  scripts/check-corpus-completeness.sh` exits non-zero
specs/2026-05-19-primary-source-research-corpus/SPEC.md:176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:193:`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
specs/2026-05-19-primary-source-research-corpus/SPEC.md:195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
specs/2026-05-19-primary-source-research-corpus/SPEC.md:216:fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:283:| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:284:| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:323:   `bash scripts/lint-spec.sh
specs/2026-05-19-primary-source-research-corpus/SPEC.md:325:   The lint may not be a perfect fit for non-SPEC
specs/2026-05-19-primary-source-research-corpus/SPEC.md:326:   artefacts; lint exit 1 on a corpus artefact is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:327:   advisory unless the failure is uncited-claim, which
specs/2026-05-19-primary-source-research-corpus/SPEC.md:333:`scripts/check-corpus-completeness.sh` MUST:
specs/2026-05-19-primary-source-research-corpus/SPEC.md:341:   `primary-read-complete | partial | access-blocked |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:343:5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:346:   `primary-read-complete` or has a documented
specs/2026-05-19-primary-source-research-corpus/SPEC.md:361:The lint extension to enforce this binding is out of
specs/2026-05-19-primary-source-research-corpus/SPEC.md:376:fetch_outcome:      # enum: primary-read-complete | partial |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:392:- `Status` is one of: `primary-read-complete`, `partial`,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:433:| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:477:- `check-corpus-completeness.sh` exit code + diagnostics
specs/2026-05-19-primary-source-research-corpus/SPEC.md:484:| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:485:| AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:486:| AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:487:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:488:| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:489:| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:490:| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:491:| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:492:| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:496:- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:497:      authored, executable, lint clean against shellcheck
specs/2026-05-19-primary-source-research-corpus/SPEC.md:505:- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:506:- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:507:      through AC-9 all pass.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:514:- [x] AC-1: `cmd://bash scripts/lint-spec.sh
specs/2026-05-19-primary-source-research-corpus/SPEC.md:517:- [x] AC-2: `cmd://test -f
specs/2026-05-19-primary-source-research-corpus/SPEC.md:519:- [x] AC-3: `cmd://test -x
specs/2026-05-19-primary-source-research-corpus/SPEC.md:520:      scripts/check-corpus-completeness.sh` exits 0.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:521:- [x] AC-4: `cmd://bash
specs/2026-05-19-primary-source-research-corpus/SPEC.md:522:      scripts/check-corpus-completeness.sh` exits 0 with
specs/2026-05-19-primary-source-research-corpus/SPEC.md:524:      `primary-read-complete` OR `access-blocked` + note.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:525:- [x] AC-5: Every §6.1 slug has a corresponding
specs/2026-05-19-primary-source-research-corpus/SPEC.md:527:- [x] AC-6: Every artefact's front-matter passes the §8.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:529:- [x] AC-7: No verbatim §3 quote exceeds the §6.3
specs/2026-05-19-primary-source-research-corpus/SPEC.md:532:- [x] AC-8: §17 Completion Report records per-source
specs/2026-05-19-primary-source-research-corpus/SPEC.md:534:- [x] AC-9: Cross-family review (BLOCKING per parent
specs/2026-05-19-primary-source-research-corpus/SPEC.md:570:- [ ] Q2: The corpus-citation-binding lint extension is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:572:      to add the lint extension as a follow-on Task SPEC
specs/2026-05-19-primary-source-research-corpus/SPEC.md:606:Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
specs/2026-05-19-primary-source-research-corpus/SPEC.md:609:  hypothesis space). <!-- lint-ok: no-citation -->
specs/2026-05-19-primary-source-research-corpus/SPEC.md:611:  the methodology actually rests on. <!-- lint-ok: no-citation -->
specs/2026-05-19-primary-source-research-corpus/SPEC.md:613:## 19. Completion Report
specs/2026-05-19-primary-source-research-corpus/SPEC.md:617:- `scripts/check-corpus-completeness.sh` — mechanical
specs/2026-05-19-primary-source-research-corpus/SPEC.md:620:  index; all 20 rows at status: primary-read-complete.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:654:- `cmd://bash scripts/lint-spec.sh
specs/2026-05-19-primary-source-research-corpus/SPEC.md:657:- `cmd://bash scripts/check-corpus-completeness.sh` —
specs/2026-05-19-primary-source-research-corpus/SPEC.md:658:  exit 0; PASS — 20 sources, all complete.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:659:- Per-artefact `cmd://bash scripts/lint-spec.sh
specs/2026-05-19-primary-source-research-corpus/SPEC.md:663:     not `type:`, so lint reports "missing
specs/2026-05-19-primary-source-research-corpus/SPEC.md:666:     lint script is designed for SPEC artefacts.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:676:  The honest reading is that the current lint is not
specs/2026-05-19-primary-source-research-corpus/SPEC.md:679:  corpus-mode lint extension (or a separate
specs/2026-05-19-primary-source-research-corpus/SPEC.md:683:  Task SPEC executes, `check-corpus-completeness.sh`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:695:- AC-1: SPEC.md lint clean (exit 0).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:696:- AC-2: INDEX.md present.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:697:- AC-3: check-corpus-completeness.sh present + executable.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:698:- AC-4: check-corpus-completeness.sh exits 0; all 20
specs/2026-05-19-primary-source-research-corpus/SPEC.md:699:  slugs at status primary-read-complete.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:700:- AC-5: every §6.1 slug has corresponding `<slug>.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:702:- AC-6: every artefact's front-matter conforms to
specs/2026-05-19-primary-source-research-corpus/SPEC.md:704:- AC-7: no verbatim §3 quote exceeds the 200-word
specs/2026-05-19-primary-source-research-corpus/SPEC.md:708:- AC-8: this Completion Report records the per-source
specs/2026-05-19-primary-source-research-corpus/SPEC.md:709:  fetch outcomes (all 20 primary-read-complete; zero
specs/2026-05-19-primary-source-research-corpus/SPEC.md:714:- AC-9: cross-family review deferred. Same-family
specs/2026-05-19-primary-source-research-corpus/SPEC.md:715:  self-review performed; advisory recorded. Owner
specs/2026-05-19-primary-source-research-corpus/SPEC.md:725:- **Per-artefact lint mismatch**: the lint script
specs/2026-05-19-primary-source-research-corpus/SPEC.md:728:  §7.1, this is advisory; the corpus-completeness
specs/2026-05-19-primary-source-research-corpus/SPEC.md:729:  check is the authoritative gate. If future lint
specs/2026-05-19-primary-source-research-corpus/SPEC.md:730:  evolution adds corpus-mode, the per-artefact lint
specs/2026-05-19-primary-source-research-corpus/SPEC.md:733:- **Three artefacts fetched as `partial` material but
specs/2026-05-19-primary-source-research-corpus/SPEC.md:734:  recorded `primary-read-complete` because the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:739:    the fetched page. Fetch outcome marked `partial`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:741:    primary-read-complete because the load-bearing
specs/2026-05-19-primary-source-research-corpus/SPEC.md:747:    sub-pages not fetched. Outcome `partial` in
specs/2026-05-19-primary-source-research-corpus/SPEC.md:748:    front-matter, `primary-read-complete` in INDEX —
specs/2026-05-19-primary-source-research-corpus/SPEC.md:783:- **Lint-vs-corpus impedance**: the SPEC's lint script
specs/2026-05-19-primary-source-research-corpus/SPEC.md:787:  spurious lint errors. Two paths: (a) extend
specs/2026-05-19-primary-source-research-corpus/SPEC.md:788:  lint-spec.sh with a corpus-mode (out of scope here);
specs/2026-05-19-primary-source-research-corpus/SPEC.md:789:  (b) accept lint as advisory for corpus per the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:791:  spec-evidence for future linter design: lints should

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/*.md; do printf '%s ' \""'$(basename "$f")"; rg -n "''^fetch_outcome:" "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor.md 7:fetch_outcome: "primary-read-complete"
INDEX.md adr-nygard.md 7:fetch_outcome: "primary-read-complete"
adr-tools-state.md 7:fetch_outcome: "partial"
arc42.md 7:fetch_outcome: "primary-read-complete"
c4-model.md 7:fetch_outcome: "primary-read-complete"
cucumber-gherkin.md 7:fetch_outcome: "primary-read-complete"
cyclonedx-sbom.md 7:fetch_outcome: "primary-read-complete"
diataxis.md 7:fetch_outcome: "primary-read-complete"
helm-values-schema.md 7:fetch_outcome: "primary-read-complete"
json-schema.md 7:fetch_outcome: "partial"
kiro.md 7:fetch_outcome: "primary-read-complete"
leaddev-agent-compiled.md 7:fetch_outcome: "primary-read-complete"
nix-flakes.md 7:fetch_outcome: "primary-read-complete"
oci-artifacts.md 7:fetch_outcome: "primary-read-complete"
openapi-3-1.md 7:fetch_outcome: "primary-read-complete"
openspec.md 7:fetch_outcome: "primary-read-complete"
oracle-agent-spec.md 7:fetch_outcome: "primary-read-complete"
ref-arch-vs-solution-arch.md 7:fetch_outcome: "primary-read-complete"
sigstore-cosign.md 7:fetch_outcome: "primary-read-complete"
spec-kit.md 7:fetch_outcome: "primary-read-complete"
structurizr-dsl.md 7:fetch_outcome: "partial"
symphony-spec.md 7:fetch_outcome: "primary-read-complete"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '720,810p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   720	  cross-family review as a secondary check that can
   721	  land before downstream slices.
   722	
   723	### 19.4 Residual risk
   724	
   725	- **Per-artefact lint mismatch**: the lint script
   726	  treats corpus artefacts as malformed SPECs (missing
   727	  `type:` field; missing standard SPEC sections). Per
   728	  §7.1, this is advisory; the corpus-completeness
   729	  check is the authoritative gate. If future lint
   730	  evolution adds corpus-mode, the per-artefact lint
   731	  warnings disappear; meanwhile they are documented
   732	  noise.
   733	- **Three artefacts fetched as `partial` material but
   734	  recorded `primary-read-complete` because the
   735	  primary URL returned substantive content**:
   736	  - `structurizr-dsl` — root page returned definition
   737	    + C4-implementation framing; deep syntax (workspace
   738	    / model / views keywords) was navigation-only on
   739	    the fetched page. Fetch outcome marked `partial`
   740	    in the artefact's front-matter; INDEX row still
   741	    primary-read-complete because the load-bearing
   742	    methodology claims (DSL purpose, architecture-as-
   743	    code posture, C4 implementation) were anchored.
   744	  - `adr-tools-state` — root page returned community
   745	    framing + template-family references but deep
   746	    template specifics + CLI conventions live on
   747	    sub-pages not fetched. Outcome `partial` in
   748	    front-matter, `primary-read-complete` in INDEX —
   749	    sub-pages are queued as open questions for
   750	    follow-on supplementary fetches if the methodology
   751	    mandates specific ADR templates.
   752	- **Kiro Bedrock binding correction**: prior summary
   753	  in the research workpad characterised Kiro as
   754	  "Bedrock-tethered"; the homepage primary read did
   755	  NOT confirm this. The artefact records the
   756	  correction in §4 Fact-link to methodology. The
   757	  methodology's published characterisation of Kiro
   758	  MUST cite the primary read, not the prior summary.
   759	- **The seven open research questions remain
   760	  unresolved**. This corpus closes the
   761	  primary-source-grounding gap (the methodology can
   762	  now cite arc42, C4, ADRs, etc. accurately) but does
   763	  not resolve the seven open questions from the
   764	  research workpad §2.3 (exhaustiveness vs.
   765	  prescription boundary; ambiguity handling; patching
   766	  semantics; install-matches-intent verification;
   767	  equivalence classes; capability floor; adversarial
   768	  consumption). Those remain published-as-flagged-open
   769	  per parent Decision §7.
   770	
   771	### 19.5 Spec evidence candidates
   772	
   773	- **Primary-read corpus pattern**: structured per-source
   774	  artefacts with verbatim claims, fetch trace, gap from
   775	  prior summary, downstream-citation surface, open
   776	  questions are a robust corpus shape for any
   777	  methodology that must ground claims in external
   778	  sources. Capture as a reusable pattern under the
   779	  `spec-evidence-governance` skill: "when the
   780	  methodology depends on external sources, a
   781	  primary-source corpus is the citable foundation —
   782	  agent summaries are not sufficient."
   783	- **Lint-vs-corpus impedance**: the SPEC's lint script
   784	  is designed for IDEA/SPEC artefacts; corpus
   785	  artefacts (with `slug:` front-matter and §
   786	  structure tuned to source characterisation) trigger
   787	  spurious lint errors. Two paths: (a) extend
   788	  lint-spec.sh with a corpus-mode (out of scope here);
   789	  (b) accept lint as advisory for corpus per the
   790	  SPEC's own §7.1 affordance. We took (b). Capture as
   791	  spec-evidence for future linter design: lints should
   792	  treat front-matter discriminator as the
   793	  artefact-type signal and apply mode-appropriate
   794	  checks rather than assuming SPEC shape.
   795	- **Verbatim-quote bounded excerpts are practical**:
   796	  the 200-word fair-use bound (§6.3) proved easy to
   797	  honour; the longest excerpts in the corpus
   798	  (Symphony's 18-section list, 12-factor's 12 factor
   799	  names) are well under bound and the artefact's
   800	  Methodology-relevance + Fact-link sections do the
   801	  characterisation work that would otherwise need
   802	  longer excerpts.
   803	- **Prior-summary corrections happen and matter**:
   804	  the Kiro "Bedrock-tethered" inferred binding was
   805	  contradicted by primary read; the diataxis four-mode
   806	  definitions were anchored verbatim rather than
   807	  paraphrased; arc42's 12-section list was confirmed
   808	  precisely. The corpus's §4 Gap-from-prior-summary
   809	  section captures these corrections explicitly,
   810	  giving the methodology's longread author the data

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '500,540p;560,585p;590,620p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   500	      with rows for every §6.1 slug; statuses set
   501	      accurately.
   502	- [ ] DoD-3: Per-source artefact authored at
   503	      `research/primary-sources/<slug>.md` for every §6.1
   504	      slug, conforming to §6.2 schema + §8.1 front-matter.
   505	- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
   506	- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
   507	      through AC-9 all pass.
   508	- [ ] DoD-6: This SPEC's §17 Open Questions are all
   509	      resolved or explicitly deferred to follow-on Task
   510	      SPECs.
   511	
   512	## 15. Acceptance Criteria
   513	
   514	- [x] AC-1: `cmd://bash scripts/lint-spec.sh
   515	      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   516	      exits 0.
   517	- [x] AC-2: `cmd://test -f
   518	      research/primary-sources/INDEX.md` exits 0.
   519	- [x] AC-3: `cmd://test -x
   520	      scripts/check-corpus-completeness.sh` exits 0.
   521	- [x] AC-4: `cmd://bash
   522	      scripts/check-corpus-completeness.sh` exits 0 with
   523	      every §6.1 slug at status
   524	      `primary-read-complete` OR `access-blocked` + note.
   525	- [x] AC-5: Every §6.1 slug has a corresponding
   526	      artefact file under `research/primary-sources/`.
   527	- [x] AC-6: Every artefact's front-matter passes the §8.1
   528	      schema check.
   529	- [x] AC-7: No verbatim §3 quote exceeds the §6.3
   530	      fair-use bound (or, if it does, the source's
   531	      license is recorded as permitting it).
   532	- [x] AC-8: §17 Completion Report records per-source
   533	      fetch outcomes + any access-blocked resolutions.
   534	- [x] AC-9: Cross-family review (BLOCKING per parent
   535	      Decision §7) signs off OR same-family-proxy is
   536	      recorded with the cross-family-deferral rationale.
   537	
   538	## 16. Rollback Plan
   539	
   540	The corpus is append-only; rollback is a directed-graph
   560	
   561	The corpus directory itself never has files deleted;
   562	provenance is preserved.
   563	
   564	## 17. Open Questions
   565	
   566	- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
   567	      Subsequent additions (a new primary source surfaces
   568	      during longread authoring) require a Contract SPEC
   569	      amendment per §16. Default: defer; not a blocker.
   570	- [ ] Q2: The corpus-citation-binding lint extension is
   571	      out of scope; reviewers enforce manually. Whether
   572	      to add the lint extension as a follow-on Task SPEC
   573	      is deferred; recommend yes once the corpus is
   574	      populated and the citation surface is concrete.
   575	- [ ] Q3: Cross-family review for THIS Contract SPEC.
   576	      The parent Decision §7 makes cross-family review
   577	      BLOCKING per slice. Same-family self-review is the
   578	      default fallback; Codex (or other non-Claude) pass
   579	      is the rigorous path. Owner directive applies
   580	      ("base this all in deep research" suggests rigour).
   581	      Default: same-family proxy with explicit caveat
   582	      recorded; if owner directs external cross-family,
   583	      escalate.
   584	- [ ] Q4: Are there primary sources missing from §6.1
   585	      that should land in v1.0? Specifically: SPDX/SBOM
   590	
   591	Neither Q1-Q4 is `owner-blocking`; all can land as
   592	follow-on Contract SPEC amendments without re-work of
   593	the corpus already produced.
   594	
   595	## 18. Migration / Coexistence
   596	
   597	The corpus is greenfield; nothing migrates from prior
   598	state. The 2026-05-17 dispositioned research workpad
   599	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   600	remains the upstream record of the field-state survey
   601	that motivated this corpus; it is NOT replaced by the
   602	corpus. The corpus supplements the workpad with
   603	primary-source rigor that the workpad explicitly flagged
   604	as missing (§12 Verification Caveats).
   605	
   606	Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
   607	
   608	- The workpad as the historical synthesis (the
   609	  hypothesis space). <!-- lint-ok: no-citation -->
   610	- The corpus as the primary-source-anchored evidence
   611	  the methodology actually rests on. <!-- lint-ok: no-citation -->
   612	
   613	## 19. Completion Report
   614	
   615	### 19.1 Files changed
   616	
   617	- `scripts/check-corpus-completeness.sh` — mechanical
   618	  corpus-completeness gate (new).
   619	- `research/primary-sources/INDEX.md` — v1.0 corpus
   620	  index; all 20 rows at status: primary-read-complete.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '584,594p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   584	- [ ] Q4: Are there primary sources missing from §6.1
   585	      that should land in v1.0? Specifically: SPDX/SBOM
   586	      (CycloneDX), Pact for contract testing, JSON
   587	      Schema (separately from Helm values), CUE
   588	      (configuration language). Defer to owner; not a
   589	      blocker for v1.0 if absent.
   590	
   591	Neither Q1-Q4 is `owner-blocking`; all can land as
   592	follow-on Contract SPEC amendments without re-work of
   593	the corpus already produced.
   594	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'wc -l research/primary-sources/*.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   155 research/primary-sources/12-factor.md
    44 research/primary-sources/INDEX.md
   139 research/primary-sources/adr-nygard.md
   124 research/primary-sources/adr-tools-state.md
   141 research/primary-sources/arc42.md
   151 research/primary-sources/c4-model.md
   138 research/primary-sources/cucumber-gherkin.md
   143 research/primary-sources/cyclonedx-sbom.md
   148 research/primary-sources/diataxis.md
   135 research/primary-sources/helm-values-schema.md
   124 research/primary-sources/json-schema.md
   120 research/primary-sources/kiro.md
   142 research/primary-sources/leaddev-agent-compiled.md
   149 research/primary-sources/nix-flakes.md
   146 research/primary-sources/oci-artifacts.md
   150 research/primary-sources/openapi-3-1.md
   130 research/primary-sources/openspec.md
   117 research/primary-sources/oracle-agent-spec.md
   159 research/primary-sources/ref-arch-vs-solution-arch.md
   143 research/primary-sources/sigstore-cosign.md
   152 research/primary-sources/spec-kit.md
   109 research/primary-sources/structurizr-dsl.md
   162 research/primary-sources/symphony-spec.md
  3121 total

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline e9268c1 22371e3 c1c9d95 --' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
e9268c1 fix(corpus): status truth + citation overreach (codex findings 2.2, 2.4-2.9)
 research/primary-sources/INDEX.md                  |  4 +--
 research/primary-sources/c4-model.md               | 12 +++++---
 research/primary-sources/leaddev-agent-compiled.md | 12 ++++++--
 research/primary-sources/nix-flakes.md             | 16 ++++++----
 research/primary-sources/oci-artifacts.md          | 26 ++++++++++++----
 .../primary-sources/ref-arch-vs-solution-arch.md   | 35 ++++++++++++++--------
 research/primary-sources/symphony-spec.md          | 11 +++++--
 7 files changed, 80 insertions(+), 36 deletions(-)
22371e3 spec(fix): corpus Completion Report acknowledges lint-impedance honestly (codex finding 2.1)
 .../SPEC.md                                        | 38 +++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)
c1c9d95 spec(verify): codex remediation Contract -> verified; corpus §6.1 amended to v1.1 (§7.D), 2 new sources (findings 2.3)
 research/primary-sources/INDEX.md                  |   4 +-
 research/primary-sources/cyclonedx-sbom.md         | 143 ++++++++++++++
 research/primary-sources/json-schema.md            | 124 ++++++++++++
 scripts/check-corpus-completeness.sh               |   2 +-
 .../SPEC.md                                        | 209 +++++++++++++++++++--
 .../SPEC.md                                        |  15 +-
 6 files changed, 478 insertions(+), 19 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-codex-remediation-amendments/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 546ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-codex-remediation-amendments/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  33
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

 succeeded in 784ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-primary-source-research-corpus/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  55
lowercase 2119 hits:   7 (advisory only)
errors:                0
warnings:              0

codex
**Quality Gate Result: REQUEST CHANGES**

**New Findings**

- HIGH: [scripts/check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:78) accepts `partial` rows and still prints “all complete”, while the SPEC says exit 0 only when every slug is `primary-read-complete` or documented `access-blocked`: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345). Current INDEX has three `partial` rows: `adr-tools-state`, `structurizr-dsl`, `json-schema`.

- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).

- MEDIUM: `cyclonedx-sbom` overreaches. It calls CycloneDX “canonical” for provenance at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:84), says it “directly addresses” the regulated-environments compliance gap at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:121), while §6 admits SPDX needs separate primary comparison at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:128). This should be softened to “a primary SBOM option relevant to” provenance/compliance.

**Remediation Verdicts**

- 2.1 lint impedance: PARTIAL. The Completion Report now admits the lint gap honestly, but no mechanical corpus citation gate exists yet.

- 2.2 status truth: PASS for INDEX. `adr-tools-state` and `structurizr-dsl` are now `partial`; `json-schema` is also correctly `partial`.

- 2.3 source-list expansion: PASS. `json-schema` and `cyclonedx-sbom` are added to §6.1, and `SOURCE_LIST_VERSION` is v1.1.

- 2.4 OCI artifacts: PARTIAL. §3 now contains Artifacts Guidance evidence that supports non-image payload claims, but stale contradictory text still says the guidance was not deep-read at [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28) and [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:143).

- 2.5 C4 Docker: PASS. The rewritten claim no longer quotes unverified “not Docker” language and adds the right citation caution.

- 2.6 Symphony uniqueness: PARTIAL. §5 is now scoped to “identified by this project’s research”, but front matter still asserts “only in-the-wild example” globally at [symphony-spec.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:10).

- 2.7 LeadDev / Willison: PASS. It now separates Willison’s mitigation suggestion from methodology endorsement.

- 2.8 ref-arch paraphrase: PARTIAL. §3 labels paraphrase, but §5 still quotes “blindly deploying methodologies verbatim fails” as if exact at [ref-arch-vs-solution-arch.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:134).

- 2.9 Nix strongest: FAIL. The caveat was added, but the unlicensed “strongest current implementation” claim remains in §5 at [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:124) and in INDEX at [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:22).

**Checks Run**

`lint-spec.sh` passes for the target SPEC and remediation SPEC. `check-corpus-completeness.sh` passes with “22 sources”, but that pass is part of the gate problem above because partial rows are accepted as complete.
tokens used
126,105
**Quality Gate Result: REQUEST CHANGES**

**New Findings**

- HIGH: [scripts/check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:78) accepts `partial` rows and still prints “all complete”, while the SPEC says exit 0 only when every slug is `primary-read-complete` or documented `access-blocked`: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345). Current INDEX has three `partial` rows: `adr-tools-state`, `structurizr-dsl`, `json-schema`.

- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).

- MEDIUM: `cyclonedx-sbom` overreaches. It calls CycloneDX “canonical” for provenance at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:84), says it “directly addresses” the regulated-environments compliance gap at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:121), while §6 admits SPDX needs separate primary comparison at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:128). This should be softened to “a primary SBOM option relevant to” provenance/compliance.

**Remediation Verdicts**

- 2.1 lint impedance: PARTIAL. The Completion Report now admits the lint gap honestly, but no mechanical corpus citation gate exists yet.

- 2.2 status truth: PASS for INDEX. `adr-tools-state` and `structurizr-dsl` are now `partial`; `json-schema` is also correctly `partial`.

- 2.3 source-list expansion: PASS. `json-schema` and `cyclonedx-sbom` are added to §6.1, and `SOURCE_LIST_VERSION` is v1.1.

- 2.4 OCI artifacts: PARTIAL. §3 now contains Artifacts Guidance evidence that supports non-image payload claims, but stale contradictory text still says the guidance was not deep-read at [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28) and [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:143).

- 2.5 C4 Docker: PASS. The rewritten claim no longer quotes unverified “not Docker” language and adds the right citation caution.

- 2.6 Symphony uniqueness: PARTIAL. §5 is now scoped to “identified by this project’s research”, but front matter still asserts “only in-the-wild example” globally at [symphony-spec.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:10).

- 2.7 LeadDev / Willison: PASS. It now separates Willison’s mitigation suggestion from methodology endorsement.

- 2.8 ref-arch paraphrase: PARTIAL. §3 labels paraphrase, but §5 still quotes “blindly deploying methodologies verbatim fails” as if exact at [ref-arch-vs-solution-arch.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:134).

- 2.9 Nix strongest: FAIL. The caveat was added, but the unlicensed “strongest current implementation” claim remains in §5 at [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:124) and in INDEX at [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:22).

**Checks Run**

`lint-spec.sh` passes for the target SPEC and remediation SPEC. `check-corpus-completeness.sh` passes with “22 sources”, but that pass is part of the gate problem above because partial rows are accepted as complete.
