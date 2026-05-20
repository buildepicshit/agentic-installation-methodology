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
session id: 019e42a5-2c35-7893-a436-aa60a0840943
--------
user
Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + 22 corpus artefacts + scripts/check-corpus-completeness.sh. Round-2 review at reviews/codex-2026-05-19-round2/02-corpus.md flagged 8 follow-ups: 2.4/2.6/2.8/2.9 incomplete remediations + HIGH check-script semantics + MEDIUM Completion Report stale + MEDIUM cyclonedx overreach + ADVISORY §10/§16. Round-3 remediation at commit 648e4a3. Verify each Round-2 follow-up is now RESOLVED; surface any new issues. Spot-check the updated nix-flakes/symphony-spec/cyclonedx-sbom/oci-artifacts/ref-arch artefacts for honest disclosure. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
codex
I’ll keep this read-only and treat it as a review gate: first I’m checking the Round 2 findings against the current tree and commit, then I’ll spot-check the named artefacts for disclosure regressions.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|Product B|agentic installation" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'pwd && git status --short && git rev-parse --show-toplevel && git rev-parse HEAD && git show --stat --oneline --decorate --no-renames --find-renames 648e4a3 --' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology
?? reviews/codex-2026-05-19-round3/
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology
648e4a3a71a20da765c52c56909b663e5c46119e
648e4a3 (HEAD -> main, origin/main, origin/HEAD) fix(corpus r2): close codex Round-2 corpus follow-ups (findings 2.4, 2.6, 2.8, 2.9, cyclonedx overreach, check-script semantics, Completion stale, advisory §10/§16)
 research/primary-sources/INDEX.md                  |  2 +-
 research/primary-sources/cyclonedx-sbom.md         | 17 +++++++--
 research/primary-sources/nix-flakes.md             | 13 +++++--
 research/primary-sources/oci-artifacts.md          | 20 +++++++---
 .../primary-sources/ref-arch-vs-solution-arch.md   |  5 ++-
 research/primary-sources/symphony-spec.md          | 21 +++++++----
 scripts/check-corpus-completeness.sh               | 23 ++++++++++-
 .../SPEC.md                                        |  7 +++-
 .../SPEC.md                                        | 44 ++++++++++++++--------
 9 files changed, 108 insertions(+), 44 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
reviews/codex-2026-05-19-round3/02-corpus.md
reviews/codex-2026-05-19-round3/01-parent-decision.md
scripts/check-corpus-completeness.sh
scripts/validate-longread-structure.sh
scripts/validate-skill-frontmatter.sh
scripts/lint-spec.sh
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
reviews/codex-2026-05-19-round2/03-v2-repack.md
reviews/codex-2026-05-19-round2/02-corpus.md
reviews/codex-2026-05-19-round2/01-parent-decision.md
templates/TASK.template.md
templates/SPEC.task.template.md
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
templates/SPEC.contract.template.md
templates/IDEA.template.md
reviews/codex-2026-05-19/00-SYNTHESIS.md
reviews/codex-2026-05-19/04-longread.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/01-parent-decision.md
schema/SPEC.schema.md
LICENSE
CONTRIBUTING.md
CODE_OF_CONDUCT.md
specs/2026-05-19-codex-remediation-amendments/SPEC.md
specs/2026-05-20-longread-structure/SPEC.md
research/primary-sources/cyclonedx-sbom.md
research/primary-sources/INDEX.md
research/primary-sources/nix-flakes.md
research/primary-sources/ref-arch-vs-solution-arch.md
research/primary-sources/symphony-spec.md
research/primary-sources/oci-artifacts.md
research/primary-sources/json-schema.md
research/primary-sources/leaddev-agent-compiled.md
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
specs/2026-05-19-primary-source-research-corpus/SPEC.md
AGENTS.md
README.md
specs/2026-05-18-repo-standup/SPEC.md
hooks/verify-reminder.sh
hooks/session-start-context.sh
hooks/block-verify-bypass.sh
hooks/block-push-to-main.sh
hooks/block-git-add-all.sh
hooks/block-edit-on-main.sh
hooks/block-ai-attribution.sh
tests/hooks/run-tests.sh
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/fixtures/msg-clean.txt

codex
The current checkout is already at `648e4a3a71a20da765c52c56909b663e5c46119e`; the only visible worktree noise is an untracked `reviews/codex-2026-05-19-round3/` directory, which I’ll leave untouched. Next I’m reading the prior findings and the remediated files side by side.
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' scripts/check-corpus-completeness.sh" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
#!/usr/bin/env bash
# check-corpus-completeness.sh — mechanical completeness gate for
# the primary-source research corpus at research/primary-sources/.
#
# Authority:
# file://specs/2026-05-19-primary-source-research-corpus/SPEC.md §7.2,
# §9.1, §13 AC-4.
#
# Verifies:
# 1. INDEX.md exists and parses.
# 2. Every slug in INDEX has a matching <slug>.md file.
# 3. Every <slug>.md file (other than INDEX.md) has a row in INDEX.
# 4. Every status is one of:
#    primary-read-complete | partial | access-blocked | superseded | pending.
# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
# 6. No row at status: pending (the corpus is closed when this script
#    exits 0; pending rows mean incomplete work).
# 7. Every access-blocked row has an alternative-source-found note OR
#    an explicit unreachability disclaimer (heuristic: §6 Open Questions
#    in the artefact mentions "alternative" or "unreachable").
#
# Exit 0 iff the corpus is complete; non-zero with diagnostics to stderr
# otherwise.

set -uo pipefail

# Resolve repo root from script location.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CORPUS_DIR="$REPO_ROOT/research/primary-sources"
INDEX_FILE="$CORPUS_DIR/INDEX.md"
SPEC_FILE="$REPO_ROOT/specs/2026-05-19-primary-source-research-corpus/SPEC.md"

EXPECTED_VERSION="v1.1"

fail() {
    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
    exit 1
}

# 1. INDEX exists.
if [ ! -f "$INDEX_FILE" ]; then
    fail "INDEX.md not found at $INDEX_FILE"
fi

# 2. SOURCE_LIST_VERSION matches.
actual_version="$(grep -E '^Source-list version:' "$INDEX_FILE" | head -1 | sed -E 's/^Source-list version:[[:space:]]+//')"
if [ "$actual_version" != "$EXPECTED_VERSION" ]; then
    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
fi

# 3. Parse INDEX rows.
# Row format: | <slug> | <status> | <date-or-dash> | <summary> |
# Skip header + separator lines (first two | lines).
mapfile -t rows < <(grep -E '^\|' "$INDEX_FILE" | tail -n +3 | sed -E 's/^\|[[:space:]]*//;s/[[:space:]]*\|[[:space:]]*/|/g;s/[[:space:]]*\|$//')

if [ ${#rows[@]} -eq 0 ]; then
    fail "INDEX.md has no data rows"
fi

declare -A index_slugs
declare -A index_status
issues=()

valid_statuses="primary-read-complete partial access-blocked superseded pending"

for row in "${rows[@]}"; do
    IFS='|' read -r slug status fetched_on summary <<<"$row"
    [ -z "$slug" ] && continue
    index_slugs["$slug"]=1
    index_status["$slug"]="$status"

    # 4. Status valid.
    if ! printf '%s\n' $valid_statuses | grep -qFx "$status"; then
        issues+=("invalid status '$status' for slug '$slug'")
    fi

    # 5. No pending.
    if [ "$status" = "pending" ]; then
        issues+=("slug '$slug' is still status: pending")
    fi

    # 6. Matching file exists.
    if [ ! -f "$CORPUS_DIR/$slug.md" ]; then
        issues+=("slug '$slug' in INDEX has no matching file at research/primary-sources/$slug.md")
    fi

    # 6b. Partial-status artefact MUST document what was NOT deep-read.
    # Per SPEC §7.2, partial is acceptable iff the artefact §6 records
    # the deferred-reads note (codex Round-2 finding: previously the
    # script silently accepted partial and printed "all complete").
    if [ "$status" = "partial" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
        if ! grep -qiE 'not deep-read|deep-read.*deferred|deferred to|sub-page.* NOT|reserved for v1\.|reserved for follow-on' "$CORPUS_DIR/$slug.md"; then
            issues+=("slug '$slug' is partial but artefact has no deferred-reads note in §6 (per SPEC §7.2 partial requires explicit disclosure of what was not deep-read)")
        fi
    fi

    # 7. Access-blocked must record an alternative or unreachability note in §6.
    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
        if ! grep -qiE 'alternative|unreachable|fallback' "$CORPUS_DIR/$slug.md"; then
            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
        fi
    fi
done

# 8. Orphan files (file exists but no INDEX row).
for f in "$CORPUS_DIR"/*.md; do
    [ -f "$f" ] || continue
    base="$(basename "$f" .md)"
    [ "$base" = "INDEX" ] && continue
    if [ -z "${index_slugs[$base]:-}" ]; then
        issues+=("orphan file: $base.md has no row in INDEX.md")
    fi
done

if [ ${#issues[@]} -gt 0 ]; then
    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
    for i in "${issues[@]}"; do
        printf '  - %s\n' "$i" >&2
    done
    exit 1
fi

n_rows=${#index_slugs[@]}
# Count partials for honest PASS reporting (codex Round-2 finding).
n_partial=0
for slug in "${!index_status[@]}"; do
    if [ "${index_status[$slug]}" = "partial" ]; then
        n_partial=$((n_partial + 1))
    fi
done
if [ $n_partial -gt 0 ]; then
    printf 'check-corpus-completeness: PASS — %d sources (%d partial with deferred-reads notes)\n' "$n_rows" "$n_partial"
else
    printf 'check-corpus-completeness: PASS — %d sources, all primary-read-complete\n' "$n_rows"
fi
exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' research/primary-sources/INDEX.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
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
/home/linuxbrew/.linuxbrew/bin/bash -c 'tail -n 220 reviews/codex-2026-05-19-round2/02-corpus.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '220,520p' specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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

| Slug | Status | Fetched on | Methodology summary |
|---|---|---|---|
| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
| ... | ... | ... | ... |
```

Every row's `Slug` MUST correspond to a `<slug>.md` file in
the directory; every `<slug>.md` file MUST have a row in
INDEX.md. The check script enforces both directions.

## 7. Behavior Specification

### 7.1 Per-source read procedure

For each in-scope source (§6.1):

1. **Identify primary URL.** Use §6.1's primary URL as
   starting point.
2. **Fetch via WebFetch.** Capture the response. If
   WebFetch returns content, set `fetched_via: WebFetch`.
3. **Fallback chain on failure.** If WebFetch fails:
   a. Retry with `curl -fsSL --max-time 30 <url>`.
   b. If primary URL is access-blocked, attempt
      `url://web.archive.org/web/<recent-snapshot>/<url>`
      via WebFetch.
   c. If all fail, set `fetch_outcome: access-blocked`
      and §2 Fetch trace records every attempted call.
      The slug remains in INDEX.md with that status; an
      alternative-source-found note is REQUIRED in §6
      Open Questions of that artefact OR the
      methodology MUST NOT cite primitives from that
      source in downstream slices.
4. **Extract verbatim claims** germane to the
   methodology's §3 / §4 / §5 from the research workpad
   (or the dispositioned-research §11.5 disposition
   table). Each quote is attributed and bounded per §6.3.
5. **Author the artefact** at
   `research/primary-sources/<slug>.md` per §6.2 schema.
6. **Update INDEX.md** to add the row (or update status
   if the slug already had a `pending` placeholder).
7. **Lint the artefact**:
   `bash scripts/lint-spec.sh
   research/primary-sources/<slug>.md` SHOULD exit 0.
   The lint may not be a perfect fit for non-SPEC
   artefacts; lint exit 1 on a corpus artefact is
   advisory unless the failure is uncited-claim, which
   IS blocking — corpus artefacts above all else MUST
   carry citations.

### 7.2 INDEX-driven check script

`scripts/check-corpus-completeness.sh` MUST:

1. Read INDEX.md and parse every row.
2. For each row's slug, verify
   `research/primary-sources/<slug>.md` exists.
3. For each `<slug>.md` file, verify a row exists in
   INDEX.md with matching slug.
4. Verify every row's status is one of
   `primary-read-complete | partial | access-blocked |
   superseded | pending`.
5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
   version frozen in §6.1 of this SPEC.
6. Exit 0 if every slug in INDEX.md is either
   `primary-read-complete` or has a documented
   `access-blocked` (with §6 alternative note); else
   exit non-zero with diagnostic lines per gap.

### 7.3 Corpus citation binding (downstream slices)

Downstream methodology slices (longread, SPEC bundle)
cite primitives from these sources via
`file://research/primary-sources/<slug>.md §<n>` or by
fully-qualified-URL-with-corpus-anchor
`file://research/primary-sources/<slug>.md` when the
whole entry is the relevance. Agent memory and prior
agent summaries are NOT citable for any claim drawn
from a source in §6.1's scope.

The lint extension to enforce this binding is out of
scope; it lands as a follow-on Task SPEC. In the
interim, reviewers (cross-family and same-family)
enforce manually.

## 8. Schema Specification

### 8.1 Per-source artefact front-matter (formal)

```yaml
slug:               # string; matches §6.1 row; required
source_name:        # string; required; full source name
primary_url:        # string; required; canonical URL
fetched_via:        # enum: WebFetch | curl | archive.org | manual
fetched_on:         # date: YYYY-MM-DD; required
fetch_outcome:      # enum: primary-read-complete | partial |
                    #       access-blocked
fetch_evidence:     # string; required; one-line digest
supersedes:         # string; optional; slug of prior entry
methodology_relevance: |  # string; multi-line; required
```

### 8.2 INDEX.md row schema (formal)

A pipe-delimited markdown table with columns:

| Slug | Status | Fetched on | Methodology summary |

Where:

- `Slug` is a kebab-case identifier matching §6.1.
- `Status` is one of: `primary-read-complete`, `partial`,
  `access-blocked`, `superseded`, `pending`.
- `Fetched on` is `YYYY-MM-DD` or `—` when status is
  `pending`.
- `Methodology summary` is a one-sentence summary.

## 9. Reference Algorithms

### 9.1 Completeness check (pseudocode)

```
function check_corpus_completeness():
  index = read_index_md()
  slugs_in_index = set(row.slug for row in index.rows)
  slugs_in_files = set(basename(f, ".md")
                       for f in glob("research/primary-sources/*.md")
                       if basename(f) != "INDEX.md")
  missing_files = slugs_in_index - slugs_in_files
  orphan_files = slugs_in_files - slugs_in_index
  pending = [row for row in index.rows
             if row.status == "pending"]
  blocked_without_note = [row for row in index.rows
                          if row.status == "access-blocked"
                          and not row_has_access_blocked_note(row)]
  if missing_files or orphan_files or pending or blocked_without_note:
    emit_diagnostics()
    exit 1
  if index.source_list_version != SPEC_FROZEN_VERSION:
    emit_diagnostic("source list drift")
    exit 1
  exit 0
```

## 10. Failure Model

### 10.1 Failure classes

| Class | Trigger | Recovery |
|---|---|---|
| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
| `quote-overrun` | Verbatim §3 quote exceeds the §6.3 fair-use bound | Reviewer rejects the artefact at corpus-completion review; author shortens to compliant excerpt |
| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
| `summary-without-primary` | A claim in INDEX.md's `Methodology summary` column is not anchored by a verbatim quote in the corresponding artefact's §3 | Reviewer rejects; author either anchors the claim or removes it from the summary |
| `slug-collision` | Two artefacts share a slug | Force-fix; one or both renamed; INDEX.md updated |
| `supersession-loop` | Artefact A is `supersedes: B` AND B is `supersedes: A` | Force-fix; the supersession DAG is acyclic |

### 10.2 Recovery posture

The corpus is forgiving on form, strict on substance. A
mis-formatted front-matter field is a recoverable bug; a
methodology claim without a primary anchor is a violation
of the owner directive and blocks the methodology body
from landing.

## 11. Trust Boundary / Security

### 11.1 Trust boundary

- The corpus consumes external content fetched from
  third-party URLs. Each fetch is treated as untrusted
  input: the agent (WebFetch / curl) returns content; the
  artefact author extracts text and attributes it; no
  fetched content is executed.
- The fetched URLs themselves are recorded; consumers of
  the corpus can re-fetch and verify.

### 11.2 Adversarial spec consumption (research §2.3.7)

The methodology Product B publishes flags adversarial spec
consumption as an open research question. The corpus
itself, by exposing the verbatim sources, INHERITS that
risk surface for any downstream agent that fetches the
corpus: a malicious primary URL could carry prompt
injection. Mitigation: the corpus's §2 Fetch trace records
the URL and content digest at fetch time; downstream
agents that re-fetch SHOULD verify the digest matches.
The methodology MUST flag this as an open risk for
agents consuming the SPEC bundle.

## 12. Observability

- Each artefact's §2 Fetch trace logs the agent tool
  invocation and outcome.
- INDEX.md is the single index surface; reading it gives
  the corpus's state.
- `check-corpus-completeness.sh` exit code + diagnostics
  is the mechanical observability surface.

## 13. Test and Validation Matrix

| AC | Test |
|---|---|
| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
| AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
| AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |

## 14. Implementation Checklist (Definition of Done)

- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
      authored, executable, lint clean against shellcheck
      defaults.
- [ ] DoD-2: `research/primary-sources/INDEX.md` authored
      with rows for every §6.1 slug; statuses set
      accurately.
- [ ] DoD-3: Per-source artefact authored at
      `research/primary-sources/<slug>.md` for every §6.1
      slug, conforming to §6.2 schema + §8.1 front-matter.
- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
      through AC-9 all pass.
- [ ] DoD-6: This SPEC's §17 Open Questions are all
      resolved or explicitly deferred to follow-on Task
      SPECs.

## 15. Acceptance Criteria

- [x] AC-1: `cmd://bash scripts/lint-spec.sh
      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
      exits 0.
- [x] AC-2: `cmd://test -f
      research/primary-sources/INDEX.md` exits 0.
- [x] AC-3: `cmd://test -x
      scripts/check-corpus-completeness.sh` exits 0.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' research/primary-sources/nix-flakes.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: nix-flakes
source_name: "Nix Flakes — flake.nix + flake.lock"
primary_url: "https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
methodology_relevance: |
  Nix flakes are research §5.1's "strongest reproducible-
  from-spec primitive." This corpus entry anchors the
  flake.nix file structure, the flake.lock content-hash
  model, and Nix's reproducibility guarantees so the
  methodology can cite the flake model precisely when
  prescribing the deployment/ sub-spec's reproducibility
  contract.
---

# Nix Flakes

## 1. Source identity

- Name: Nix flakes — the unit for packaging Nix code
  reproducibly.
- Canonical URL: `url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
  (note: the older `url://nixos.org/manual/...` redirects
  to nix.dev as of fetch date).
- Specification authority: NixOS RFCs (RFC 49 for flakes
  proposal); current implementation in `nix` CLI.

## 2. Fetch trace

- `cmd://WebFetch url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake`
  — 2026-05-19; returned 302 redirect to nix.dev.
- `cmd://WebFetch url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
  — 2026-05-19; primary read; returned flake definition,
  flake.nix structure, flake.lock semantics, repro
  guarantees.

## 3. Verbatim claims this corpus depends on

- **Flake definition**: a flake is "a filesystem tree
  (typically fetched from a Git repository or a tarball)
  that contains a file named `flake.nix` in the root
  directory." (`url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`)

- **flake.nix attributes**:
  - `inputs` — an attrset specifying dependencies,
    mapping input names to flake references. "Each input
    is fetched, evaluated and passed to the `outputs`
    function as a set of attributes with the same name
    as the corresponding input."
  - `outputs` — a function receiving an attribute set of
    input flake outputs, returning Nix values the flake
    provides.
  - `description` — one-line summary.

- **Per-input metadata** passed to `outputs`:
  - `outPath` — store path of the source tree.
  - `rev` — commit hash if applicable.
  - `lastModified` — commit time, seconds since epoch.
  - `narHash` — SHA-256 hash in SRI format.

- **flake.lock** is "a UTF-8 JSON file" containing "a
  graph structure isomorphic to the graph of
  dependencies of the root flake." Per-node fields:
  - `inputs` — dependency mappings.
  - `original` — unlocked specification from flake.nix.
  - `locked` — resolved specification with exact
    revision and `narHash`.
  - `flake` — boolean (flake vs non-flake dep).

- **Reproducibility guarantee**: Nix automatically
  generates and maintains flake.lock. Locked
  specifications contain exact revisions and content
  hashes. "When we build this flake, the input
  `nixpkgs` is mapped to revision [specific hash]."
  Furthermore: "lock files transitively lock direct as
  well as indirect dependencies."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Nix flakes operationalize "reproducible-from-spec" at the
strongest current level: content-addressed inputs +
transitive lock + reproducible outputs. Key shape
implications for the methodology's deployment/ sub-spec:

- The deployment/ sub-spec MAY adopt a flake-style
  inputs/outputs structure as the contract shape: inputs
  are the declared dependencies (the spec's deferral
  contract); outputs are the materialized deployment
  artefacts.
- The flake.lock content-hash model is a strong
  primitive for "two installs produce the same build
  outputs"; the methodology's equivalence-classes open
  question (research §2.3.5) can cite Nix as one
  concrete example of equivalence-by-construction. (The
  claim that Nix is "the strongest" reproducibility
  primitive in the field is a comparative
  `judgment://agent-synthesis`, not licensed by Nix's
  own documentation; methodology prose should frame Nix
  as "an example" rather than "the strongest" without
  separate comparative evidence.)
- The transitive-lock property — every direct and
  indirect dependency pinned — is the methodology's
  posture for the SPEC bundle's manifest: every cited
  sub-spec is pinned by content hash, not version range.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/nix-flakes.md §3`):

- methodology-claim: "Nix flakes ship a two-file model:
  flake.nix (declarative inputs + outputs) and flake.lock
  (resolved + content-hashed dependency graph)."
- methodology-claim: "flake.lock provides transitive
  pin-by-content-hash; rebuild reproducibility holds
  across direct and indirect dependencies."
- methodology-claim: "Nix's reproducibility model is one
  concrete implementation of build-from-spec; the
  methodology cites it as an example of equivalence-
  class-by-construction. (Earlier 'strongest current
  implementation' framing removed per codex Round-2
  finding 2.9 FAIL — comparative ranking is
  judgment://agent-synthesis not licensed by Nix
  documentation; the §4 caveat is now reflected here
  for consistency.)"
- methodology-claim: "The methodology's deployment/
  sub-spec MAY mirror flake's inputs/outputs shape,
  treating inputs as the deferral contract and outputs
  as the deployment artefact set."

## 6. Open questions surfaced by the primary read

- Nix flakes are still officially "experimental" in
  stable Nix releases; the methodology should
  acknowledge this when prescribing flake-style inputs/
  outputs as a deployment-spec shape.
- Whether Nix's content-hash reproducibility generalises
  to non-Nix language ecosystems (Helm? OCI? container
  images built outside Nix?) is an open methodology
  question. The methodology MAY recommend Nix-like
  reproducibility WITHOUT mandating Nix as the
  underlying substrate.
- The relationship between flake.lock and OCI image
  content-addressing is a useful methodology comparison
  point — Nix has filesystem-tree hashes; OCI has
  layer-digest hashes. Different content addressing
  models with similar reproducibility guarantees.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' research/primary-sources/symphony-spec.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: symphony-spec
source_name: "OpenAI Symphony — SPEC.md (operating-model-as-SPEC)"
primary_url: "https://github.com/openai/symphony/blob/main/SPEC.md"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
methodology_relevance: |
  Symphony's SPEC.md is the only example of
  "operating-model-as-SPEC" identified by this project's
  research workpad — research §3 named it the source of
  14 transferable building blocks for the methodology.
  (Note: the "only" framing is project-research-scoped,
  not a globally-licensed uniqueness claim — fixed per
  codex Round-2 finding 2.6 PARTIAL: Symphony's own
  SPEC.md does not assert global uniqueness.) This corpus
  entry anchors the 18-section structure, the three-
  profile conformance model, and the tiered
  Definition-of-Done so the methodology can cite Symphony
  precisely when prescribing the SPEC bundle's shape and
  conformance harness.
---

# OpenAI Symphony SPEC.md

## 1. Source identity

- Name: OpenAI Symphony SPEC.md.
- Author: OpenAI (Symphony project).
- Canonical URL: `url://github.com/openai/symphony/blob/main/SPEC.md`.
- License: project license (OpenAI; not deep-read for
  exact licence terms on this pass).
- Status: in-the-wild operating-model-as-SPEC; cited as
  prior art for the methodology.

## 2. Fetch trace

- `cmd://WebFetch url://github.com/openai/symphony/blob/main/SPEC.md`
  — 2026-05-19; returned 18-section structure, §17
  Conformance Profiles, §18 DoD subsection breakdown.

## 3. Verbatim claims this corpus depends on

- **Symphony definition** (`url://github.com/openai/symphony/blob/main/SPEC.md`
  §1 Problem Statement): "Symphony is a long-running
  automation service that continuously reads work from
  an issue tracker (Linear in this specification
  version), creates an isolated workspace for each
  issue, and runs a coding agent session for that issue
  inside the workspace."

- **The 18-section structure**:
  1. Problem Statement
  2. Goals and Non-Goals
  3. System Overview
  4. Core Domain Model
  5. Workflow Specification (Repository Contract)
  6. Configuration Specification
  7. Orchestration State Machine
  8. Polling, Scheduling, and Reconciliation
  9. Workspace Management and Safety
  10. Agent Runner Protocol
  11. Issue Tracker Integration Contract
  12. Prompt Construction and Context Assembly
  13. Logging, Status, and Observability
  14. Failure Model and Recovery Strategy
  15. Security and Operational Safety
  16. Reference Algorithms
  17. Test and Validation Matrix
  18. Implementation Checklist

- **§17 Conformance Profiles** — three profiles:
  - **Core Conformance**: "Deterministic tests required
    for all conforming implementations."
  - **Extension Conformance**: "Required only for
    optional features an implementation chooses to
    ship."
  - **Real Integration Profile**: "Environment-dependent
    smoke/integration checks recommended before
    production use."

- **§18 Definition of Done** — three subsections aligned
  with §17 profiles:
  - §18.1 REQUIRED for Conformance: 23 mandatory
    components (workflow loader, orchestrator, tracker
    client, workspace manager, hooks, agent runner,
    retry queue, reconciliation, observability).
  - §18.2 RECOMMENDED Extensions: 4 optional
    capabilities (HTTP server, Linear GraphQL tool,
    persistence across restarts, pluggable tracker
    adapters).
  - §18.3 Operational Validation Before Production: 3
    pre-deployment checks (integration testing, host OS
    verification, HTTP server configuration).

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

The 18-section structure is the most concrete in-the-wild
example of operating-model-as-SPEC the methodology can
cite. Confirmed transferable building blocks from research
§3 (14 named blocks): the per-section anchoring of
domain model, workflow contract, configuration pipeline,
state machine, idempotency rules, safety invariants,
observability layering, failure-class × recovery matrix,
trust boundary, conformance profiles, tiered Definition
of Done.

The Symphony-specific (non-transferable) sections:
- §10 Agent Runner Protocol — agent-specific.
- §11.1-§11.4 Issue Tracker Integration — Linear-bound.
- §12 Prompt Construction — prompt-engineering-specific.
- §16 Reference Algorithms — Symphony-specific
  algorithms.
- §4 entity content — Codex/Linear-specific.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/symphony-spec.md §3`):

- methodology-claim: "Symphony's SPEC.md is the only
  example of an operating-model shipped as a versioned
  18-section SPEC artefact (with three-profile
  conformance harness + tiered DoD) **identified by
  this project's research workpad** at
  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §3. Symphony's own SPEC.md does not assert global
  uniqueness; the global-uniqueness claim is research-
  workpad scoped, not primary-source licensed."
- methodology-claim: "Symphony's three-profile
  conformance model (Core / Extension / Real-Integration)
  is reusable for the methodology's published SPEC
  bundle conformance harness."
- methodology-claim: "Symphony's tiered Definition-of-
  Done (§18.1 REQUIRED + §18.2 RECOMMENDED + §18.3
  pre-production checks) is the most directly portable
  section in the document and the methodology's
  SPEC-bundle Definition-of-Done MAY adopt the same
  structure."
- methodology-claim: "Symphony §5 Workflow Specification
  (the repo-owned contract pattern with framework-
  defined schema + free-form body + strict validation)
  is the most novel-and-portable building block in the
  Symphony document."

## 6. Open questions surfaced by the primary read

- Symphony's SPEC.md is bound to Linear as the issue
  tracker; the methodology's framing is tracker-
  agnostic. Citations of Symphony as prior art must
  note this binding.
- Symphony ships an Elixir reference implementation
  (per external coverage) but the SPEC.md itself does
  not bind to Elixir. Methodology may want to cite
  Symphony as evidence of "single SPEC + multiple
  language implementations" but should not put
  reference-implementation language constraints on its
  own SPEC bundle.
- Symphony §17 Conformance Profiles + §18 DoD are
  Symphony's quality bar; the methodology's SPEC bundle
  conformance suite is a separate harness. The shape is
  transferable but the contents are not.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' research/primary-sources/cyclonedx-sbom.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: cyclonedx-sbom
source_name: "CycloneDX Software Bill of Materials specification"
primary_url: "https://cyclonedx.org/specification/overview/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched cyclonedx.org specification overview; definition + SBOM contents + format enumeration + supply-chain framing confirmed verbatim"
methodology_relevance: |
  CycloneDX is research §4.4's missing primary source for
  the audit / provenance story. The methodology's
  spec-as-distribution manifest (now expanding to include
  digest + provenance fields per codex remediation 3.5)
  carries SBOM references; without a primary SBOM source,
  the manifest's provenance claim was hand-waving. The
  LeadDev critique §3 "regulated environments" framing
  needs an SBOM anchor for the methodology's compliance
  posture.
---

# CycloneDX SBOM Specification

## 1. Source identity

- Name: CycloneDX — Software Bill of Materials
  specification.
- Canonical URL: `url://cyclonedx.org/specification/overview/`.
- Maintainer: OWASP Foundation + Ecma International
  (jointly developed; standardised as ECMA-424).
- Current version: 1.7 (released 2025-10-21).

## 2. Fetch trace

- `cmd://WebFetch url://cyclonedx.org/specification/overview/`
  — 2026-05-19; returned framework definition + SBOM
  content enumeration + supported encoding formats +
  supply-chain framing.

## 3. Verbatim claims this corpus depends on

- **Definition** (`url://cyclonedx.org/specification/overview/`):
  CycloneDX is "a highly modular and extensible
  framework designed to represent a broad range of supply
  chain information with precision and flexibility."

- **Joint maintenance**: developed jointly by the OWASP
  Foundation and Ecma International, standardised as
  ECMA-424.

- **SBOM contents** (per spec):
  - **Components**: "first-party and third-party
    components" including "software, hardware devices,
    machine learning models, source code, and
    configurations."
  - **Services**: "external APIs that the software may
    call" with endpoint URIs and authentication details.
  - **Dependencies**: both "direct and transitive
    relationships" between components and services.
  - **Vulnerabilities**: known and previously undisclosed
    vulnerabilities affecting components and services.
  - **Metadata**: supplier, manufacturer, tools used,
    license information.
  - **Additional elements**: compositions, formulations,
    annotations, definitions, declarations, citations.

- **Supported encoding formats** (three):
  - JSON (`application/vnd.cyclonedx+json`)
  - XML (`application/vnd.cyclonedx+xml`)
  - Protocol Buffers (`application/x.vnd.cyclonedx+protobuf`)

- **Supply-chain framing**: CycloneDX's role is
  "supply chain transparency" and covers "vulnerability
  management and license compliance to cryptographic
  transparency and operational assurance."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

CycloneDX is the methodology's grounding for the
spec-as-distribution provenance story. Key shape
implications:

- The methodology's manifest schema (per codex
  remediation 3.5) gains a `provenance` field that
  carries SBOM references; CycloneDX is a primary SBOM
  option for those references. (SPDX is the other major
  format and warrants comparison; see §6 — the
  "canonical" framing was reduced to "primary option"
  per codex Round-2 finding on cyclonedx overreach.)
- The LeadDev critique
  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
  §3) raised regulated-environments compliance as a
  risk surface; CycloneDX is one primary SBOM option
  relevant to that compliance gap. ("Directly addresses"
  was reduced to "relevant to" per codex Round-2 finding
  on cyclonedx overreach — full compliance requires more
  than an SBOM format; SPDX comparison + NTIA element
  mapping + VEX vulnerability handling are companion
  pieces.)
- The three encoding formats (JSON / XML / Protobuf)
  let the methodology recommend JSON as default while
  acknowledging adopter environments may use XML for
  regulated-industry tooling or Protobuf for
  wire-efficient pipelines.
- The component scope (software / hardware / ML models
  / source / configurations) is broad enough that the
  methodology's spec bundle itself can be enumerated as
  an SBOM-tracked component when bundled into an OCI
  artifact.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/cyclonedx-sbom.md §3`):

- methodology-claim: "CycloneDX is a jointly OWASP +
  Ecma-maintained SBOM framework (ECMA-424; current
  version 1.7) representing components, services,
  dependencies, vulnerabilities, and metadata."
- methodology-claim: "CycloneDX supports JSON, XML, and
  Protocol Buffers encodings; the methodology
  recommends JSON as the manifest-provenance default."
- methodology-claim: "Component scope includes software,
  hardware, ML models, source code, and configurations;
  the methodology's spec bundle qualifies as a CycloneDX
  component when distributed via OCI registry."
- methodology-claim: "CycloneDX addresses the regulated-
  environments compliance gap LeadDev's critique
  identified; methodology's audit posture rests on
  CycloneDX-format provenance for releases."

## 6. Open questions surfaced by the primary read

- SPDX is the other major SBOM format
  (`url://spdx.dev/`); the methodology should
  acknowledge it as an alternative and document why
  CycloneDX is the recommended default (e.g.
  finer-grained vulnerability handling, OWASP backing,
  ECMA standardisation) — but a separate primary read
  of SPDX is needed to do that justly.
- NTIA minimum SBOM elements are referenced by some
  CycloneDX adopters but the overview page does not
  enumerate them; methodology compliance claims
  against NTIA need a separate primary source.
- Vulnerability Exploitability eXchange (VEX) is
  related to CycloneDX vulnerability handling; if the
  methodology covers vulnerability disclosure under
  spec-as-distribution, VEX is a separate corpus
  candidate.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' research/primary-sources/oci-artifacts.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: oci-artifacts
source_name: "OCI Image Specification + Artifacts Guidance"
primary_url: "https://github.com/opencontainers/image-spec/blob/main/spec.md"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
methodology_relevance: |
  OCI artifacts are research §5.1's "spec-as-distribution-
  artifact" packaging primitive — the published SPEC bundle
  can be distributed as an OCI artifact for content-
  addressed, signed delivery. This corpus entry anchors the
  manifest+config+layers structure, the descriptor model,
  and the artifacts-vs-images distinction so the
  methodology can cite OCI precisely when prescribing the
  SPEC bundle's distribution shape.
---

# OCI Image Specification + Artifacts Guidance

## 1. Source identity

- Name: OCI Image Specification.
- Canonical URL: `url://github.com/opencontainers/image-spec/blob/main/spec.md`.
- Maintainer: Open Container Initiative (Linux
  Foundation).
- Companion: Artifacts Guidance at
  `url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`
  (deep-read 2026-05-19 supplementary fetch per codex
  remediation finding 2.4; verbatim quotes incorporated in
  §3).

## 2. Fetch trace

- `cmd://WebFetch url://github.com/opencontainers/image-spec/blob/main/spec.md`
  — 2026-05-19; returned spec scope + manifest/config/
  layers + descriptor + artifacts-guidance reference.

## 3. Verbatim claims this corpus depends on

- **OCI Image definition**: "This specification defines
  an OCI Image, consisting of an image manifest, an image
  index (optional), a set of filesystem layers, and a
  configuration." (`url://github.com/opencontainers/image-spec/blob/main/spec.md`)

- **Image Manifest**: "a document describing the
  components that make up a container image." The
  manifest "contains metadata about the contents and
  dependencies of the image including the
  content-addressable identity of one or more filesystem
  layer changeset archives."

- **Image Configuration**: "a document determining layer
  ordering and configuration of the image suitable for
  translation into a runtime bundle."

- **Filesystem Layer**: "a changeset that describes a
  container's filesystem."

- **Descriptor**: "a reference that describes the type,
  metadata and content address of referenced content."
  Descriptors enable images to be "discovered by name,
  downloaded, verified by hash, trusted through a
  signature, and unpacked into an OCI Runtime Bundle."

- **OCI Artifacts Guidance** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`,
  deep-read 2026-05-19 supplementary fetch):
  - Verbatim: "Content other than OCI container images
    MAY be packaged using the image manifest."
  - Verbatim guidance on differentiating images from
    artifacts: "the `config.mediaType` value should not
    be a known OCI image config [media type]" and
    instead use "values specific to the artifact in
    `layer[*].mediaType`."
  - Normative posture: the document is **guidance**,
    not a formal specification; the only explicit
    RFC 2119 verb is the permissive "MAY" on
    artifact-via-image-manifest packaging. There is no
    MUST/SHOULD requirement compelling artifact
    packaging, only prescriptive guidance about media-
    type selection.
  - The historical non-conformant pattern
    (`application/vnd.oci.image.config.v1+json` for
    config with artifact-specific layer media types) is
    explicitly discouraged.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

OCI artifacts are the published-spec distribution
primitive that the methodology's SPEC bundle MAY adopt.
Key shape implications for the methodology's distribution
posture:

- A "front-door manifest + per-facet sub-specs" SPEC
  bundle MAPS directly onto OCI: the manifest is the
  bundle's front-door manifest; layers are the per-facet
  sub-specs as separate blobs; descriptors give content-
  addressing for each.
- Content-addressing by hash gives the methodology its
  "verifiable spec" affordance — the user-with-agent can
  verify the spec bundle they fetched matches what the
  developer published, by digest.
- Artifacts guidance covers non-image payloads (SBOMs,
  signatures, Helm charts) — the methodology's published
  SPEC bundle fits naturally into this category.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/oci-artifacts.md §3`):

- methodology-claim: "OCI Image Spec defines a four-
  component image: manifest, optional index, filesystem
  layers, configuration."
- methodology-claim: "OCI Descriptors enable content-
  addressing — every component is referenced by type,
  metadata, and content address; verification is by hash."
- methodology-claim: "OCI Artifacts Guidance extends the
  image spec to non-image payloads (SBOMs, signatures,
  Helm charts, methodology spec bundles)."
- methodology-claim: "The methodology's published SPEC
  bundle MAY be distributed as an OCI artifact: front-
  door manifest as OCI manifest; per-facet sub-specs as
  OCI layers; per-spec content-addressing by digest."

## 6. Open questions surfaced by the primary read

- The OCI Distribution Spec (separate from Image Spec)
  governs registry behaviour (push, pull, list, delete).
  Not deep-read in this pass; if methodology specifies a
  distribution channel, fetch as supplementary primary
  read.
- Helm v3 supports OCI registries natively; the
  intersection of OCI artifacts + Helm + Sigstore
  signing is a real-world precedent — the methodology
  MAY recommend this exact stack but should anchor each
  primitive separately rather than as a Helm-specific
  recipe.
- The Artifacts Guidance doc was deep-read on the
  2026-05-19 supplementary fetch (§3 last bullet
  block). The remaining open question is media-type
  naming for SPEC bundle artefacts specifically — the
  guidance permits non-OCI config media types but does
  not catalogue community conventions for
  methodology / spec-bundle artefacts. Methodology
  proposing specific media-type strings (e.g.
  `application/vnd.agentic-installation.spec-bundle+json`)
  needs an IANA-style convention proposal, not a
  further fetch of OCI guidance.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' research/primary-sources/ref-arch-vs-solution-arch.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: ref-arch-vs-solution-arch
source_name: "Mike Cottmeyer — Reference Architecture vs Reference Implementation (LiminalArc, 2019)"
primary_url: "https://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
methodology_relevance: |
  This is the closest existing articulation of the
  methodology's cross-org ownership-split protocol
  (research §4.3): what the developer publishes as
  universal (reference architecture) vs what the
  installer customises (reference implementation /
  solution architecture). Mike Cottmeyer's distinction
  is the methodology's vocabulary precursor.
---

# Reference Architecture vs Reference Implementation

## 1. Source identity

- Title: "Reference Architecture vs Reference
  Implementation."
- Author: Mike Cottmeyer.
- Publisher: LiminalArc (Cottmeyer's consulting blog).
- Date: 2019-05.
- Canonical URL: `url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`.
- Context: agile-transformation consulting; emerged
  from observing organisations attempting to deploy
  SAFe, LeSS, or Disciplined Agile Delivery verbatim.

## 2. Fetch trace

- `cmd://WebFetch url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`
  — 2026-05-19; returned Cottmeyer's distinction +
  consulting context + universal-vs-negotiable framing.

## 3. Verbatim claims this corpus depends on

- **Reference architecture (Cottmeyer)**: comprises
  "base patterns that... transcend any of the
  methodologies." Key claim: "The reference
  architecture holds universally."

- **Reference implementation (Cottmeyer)**: "The
  reference implementation is what is negotiable" —
  contrasted directly with the universal nature of
  reference architecture.

- **Posture distinction (verbatim framing)**:
  - Reference Architecture: universal, non-negotiable
    foundational patterns (in Cottmeyer's domain:
    teams, backlogs, working tested software,
    dependency management).
  - Reference Implementation: tailorable methodology
    — the specific tools, techniques, and controls
    selected based on context.

- **Underlying thesis** (paraphrased from Cottmeyer, not
  verbatim): the original article frames the underlying
  point as understanding the immutable base patterns
  that organisations cannot violate without losing
  transformation viability. (See LiminalArc article
  body; the surrounding quotation in this corpus entry
  is a near-paraphrase based on the WebFetch summary —
  treat as paraphrase unless the exact source wording is
  later confirmed by a follow-on read.)

- **Consulting context** (paraphrased from Cottmeyer):
  the distinction emerged from practical agile-
  transformation work where organisations attempt to
  implement frameworks like SAFe, LeSS, or Disciplined
  Agile Delivery. Cottmeyer's observation: blindly
  deploying methodologies verbatim fails, but
  understanding the immutable patterns beneath various
  frameworks enables organisations to tailor their
  approach while maintaining transformation viability.
  (Both sentences are paraphrase based on the WebFetch
  summary, not exact source wording; the canonical
  article body is at the cited URL.)

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Cottmeyer's distinction maps directly onto the
methodology's cross-org ownership split:

- **What the developer publishes universally** =
  reference architecture (in methodology terms: the
  front-door manifest + architecture/ + behavior/ +
  decisions/ sub-specs; the "what" of the product).
- **What the installer makes negotiable** = reference
  implementation (in methodology terms: the
  customization/ + deployment/ sub-specs as
  parameterised; the "how" of the product in this
  installer's environment).

The vocabulary precedes the methodology and is
useful as a citable label. The methodology
generalises Cottmeyer's distinction from agile-
transformation consulting (developer = framework
author, installer = transforming organisation) to
arbitrary product distribution.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/ref-arch-vs-solution-arch.md
§3`):

- methodology-claim: "Cottmeyer (2019) distinguishes
  reference architecture (universal, non-negotiable)
  from reference implementation (tailorable,
  negotiable) — a vocabulary precursor for the
  methodology's cross-org ownership split."
- methodology-claim: "The methodology's developer-
  owns-intent / installer-owns-deployment ownership
  split is a generalisation of Cottmeyer's
  architecture-vs-implementation distinction, scaled
  from agile-transformation consulting to product
  distribution."
- methodology-claim: "Reference architecture as
  Cottmeyer defines it ('holds universally') is the
  methodology's analogue for what the published SPEC
  bundle's front-door manifest + intent sub-specs
  contain; reference implementation as Cottmeyer
  defines it ('what is negotiable') is the
  methodology's analogue for the customization +
  deployment sub-specs."
- methodology-claim: "Cottmeyer's empirical
  observation (paraphrased: blindly deploying
  methodologies verbatim fails) — is the methodology's
  case for <!-- "blindly deploying" is paraphrase per §3, not verbatim source quote (codex Round-2 finding 2.8) -->
  non-prescriptive SPECs: prescription erodes the
  installer's authority to tailor."

## 6. Open questions surfaced by the primary read

- Cottmeyer's frame is agile-transformation
  consulting; the methodology generalises to
  arbitrary product distribution. The
  generalisability of Cottmeyer's "base patterns" to
  software-product domains beyond agile-transformation
  is not proven by his original frame — methodology
  must own the generalisation explicitly.
- Cottmeyer cites four base patterns (teams,
  backlogs, working tested software, dependency
  management) for agile transformation. The
  methodology has not yet enumerated equivalent
  "base patterns" for product distribution. This is
  a methodology design open question.
- Academic literature on reference-architecture-vs-
  solution-architecture (Galster, Avgeriou, others)
  is older than Cottmeyer's framing. If methodology
  wants stronger academic anchoring, those primary
  sources merit separate corpus entries.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' research/primary-sources/json-schema.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: json-schema
source_name: "JSON Schema specification (Draft 2020-12)"
primary_url: "https://json-schema.org/specification.html"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "partial"
fetch_evidence: "fetched specification index page; vocabularies enumerated; conceptual definition + validation model NOT on the index page — both live on the actual spec drafts referenced from it"
methodology_relevance: |
  JSON Schema is the underlying validation primitive that
  both Helm values-schema and OpenAPI 3.1 build on. The
  methodology's customization sub-spec validates adopter
  knob declarations against JSON Schema directly; citing
  Helm + OpenAPI without anchoring JSON Schema is a
  transitive citation gap codex remediation 2.3 closes.
---

# JSON Schema (Draft 2020-12)

## 1. Source identity

- Name: JSON Schema specification.
- Canonical URL: `url://json-schema.org/specification.html`.
- Maintainer: JSON Schema project (community-maintained
  under json-schema.org).
- Current version: Draft 2020-12 (previous: 2019-09).
- License: documentation site is publicly published; the
  specification drafts themselves are MIT-licensed.

## 2. Fetch trace

- `cmd://WebFetch url://json-schema.org/specification.html`
  — 2026-05-19; returned the spec index page enumerating
  the two-part spec structure + the eight vocabularies.
  The index does NOT contain the conceptual definition
  or the validation-model walkthrough; those live in the
  Core + Validation drafts linked from the index.
- Status `partial`: deep reads of the Core draft and
  Validation draft are NOT performed in this pass.
  Methodology MUST NOT quote specific validation keyword
  semantics or vocabulary-resolution algorithms from
  this entry until those follow-on reads land.

## 3. Verbatim claims this corpus depends on

- **Two-part spec structure** (`url://json-schema.org/specification.html`):
  - **JSON Schema Core**: "defines the basic foundation
    of JSON Schema."
  - **JSON Schema Validation**: "defines the validation
    keywords of JSON Schema."

- **Current version**: Draft 2020-12 (previous: 2019-09).

- **The eight single-vocabulary meta-schemas**:
  1. Core Vocabulary
  2. Applicator Vocabulary
  3. Validation Vocabulary
  4. Unevaluated Vocabulary
  5. Format Annotation Vocabulary
  6. Format Assertion Vocabulary
  7. Content Vocabulary
  8. Meta-Data Vocabulary

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

JSON Schema is the primitive other corpus entries cite
transitively:

- `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/helm-values-schema.md`
  §3: Helm's `values.schema.json` uses JSON Schema for
  validation.
- `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/openapi-3-1.md`
  §3: "Data types in the OAS are based on the types
  supported by the JSON Schema Specification Draft
  2020-12. The Schema Object is a superset of JSON
  Schema Specification Draft 2020-12."

The methodology's customization sub-spec
(`url://github.com/buildepicshit/agentic-ops-framework/blob/main/spec-bundle/customization/contract.md`)
adopts JSON Schema directly for its `knobs.schema.json`
artefact; this corpus entry now grounds that adoption in
the primary source rather than transiting through Helm
or OpenAPI.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/json-schema.md §3`):

- methodology-claim: "JSON Schema Draft 2020-12 is the
  primary validation primitive the methodology adopts;
  Helm values-schema and OpenAPI 3.1 build on it."
- methodology-claim: "JSON Schema is split into Core
  (foundation) and Validation (keywords); the
  methodology cites both as a unit."
- methodology-claim: "Eight vocabularies (Core,
  Applicator, Validation, Unevaluated, Format
  Annotation, Format Assertion, Content, Meta-Data)
  organise the spec; the methodology may reference
  specific vocabularies once their drafts are deep-read."

## 6. Open questions surfaced by the primary read

- The index page does NOT contain the conceptual
  definition of JSON Schema or the validation model.
  Both live in the Core + Validation drafts. Deep reads
  of those drafts are queued as a follow-on corpus
  expansion (status: pending for the Core / Validation
  draft sub-entries; this aggregate entry sits at
  `partial`).
- The relationship between JSON Schema 2020-12 and
  earlier drafts (Draft 7, Draft 6) is not deep-read;
  adopter tooling commonly pins older drafts, so the
  methodology's customization sub-spec MAY need to
  acknowledge multi-draft support.
- The Format Assertion Vocabulary (separate from Format
  Annotation) shifts format strings from advisory to
  blocking; methodology MAY adopt format-assertion
  semantics but the choice should be deliberate and
  separately cited.

codex
The obvious Round 2 hotspots were edited in this commit. I’m now checking whether the edits made the contracts internally consistent, not just whether the offending phrases disappeared.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '330,380p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '500,700p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
   541	problem.
   542	
   543	Triggers for rollback:
   544	
   545	- A fetched primary source is later proven misattributed
   546	  (e.g. the URL we fetched was a spoof; the real source
   547	  contradicts it).
   548	- The source-list version drifts because §6.1 is
   549	  amended (a §6.1 amendment is a Contract SPEC
   550	  amendment under the v1 procedure).
   551	
   552	Exit procedure:
   553	
   554	1. The affected slug's artefact is superseded by a vN
   555	   entry citing the misattribution evidence.
   556	2. INDEX.md row is updated to point to the new vN slug.
   557	3. Downstream methodology slices that cited the
   558	   superseded artefact MUST be re-reviewed against the
   559	   new vN.
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
   586	      (CycloneDX), Pact for contract testing, JSON
   587	      Schema (separately from Helm values), CUE
   588	      (configuration language). Defer to owner; not a
   589	      blocker for v1.0 if absent.
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
   619	- `research/primary-sources/INDEX.md` — v1.1 corpus
   620	  index (bumped from v1.0 per codex remediation §7.D);
   621	  22 rows total: 19 at status: primary-read-complete, 3
   622	  at status: partial with deferred-reads notes per
   623	  SPEC §7.2 (adr-tools-state, structurizr-dsl,
   624	  json-schema).
   625	- `research/primary-sources/*.md` — 22 per-source
   626	  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   627	  cyclonedx-sbom), all conforming to §6.2 schema +
   628	  §8.1 front-matter:
   629	  - arc42 (architecture documentation)
   630	  - c4-model (architecture model)
   631	  - adr-nygard (foundational ADR)
   632	  - adr-tools-state (state-of-practice ADR)
   633	  - diataxis (documentation taxonomy)
   634	  - 12-factor (cloud-native SaaS methodology)
   635	  - helm-values-schema (customization-affordance)
   636	  - nix-flakes (reproducibility)
   637	  - oci-artifacts (distribution packaging)
   638	  - sigstore-cosign (signing)
   639	  - symphony-spec (operating-model-as-SPEC)
   640	  - spec-kit (spec-as-authoring tool)
   641	  - kiro (agentic IDE)
   642	  - openspec (spec-driven dev tool)
   643	  - oracle-agent-spec (framework-agnostic agent
   644	    description)
   645	  - ref-arch-vs-solution-arch (ownership-split
   646	    precursor)
   647	  - leaddev-agent-compiled (published risk critique)
   648	  - cucumber-gherkin (executable behavior spec)
   649	  - openapi-3-1 (HTTP API contract)
   650	  - structurizr-dsl (architecture-as-code)
   651	- This SPEC's §15 Acceptance Criteria checkboxes
   652	  flipped to checked.
   653	
   654	### 19.2 Commands run
   655	
   656	- 25 `cmd://WebFetch` invocations across the 22 sources
   657	  (some sources required supplementary fetches; one
   658	  redirect was followed from nixos.org to nix.dev; 2
   659	  v1.1 fetches added: json-schema + cyclonedx-sbom per
   660	  codex remediation §7.D).
   661	- `cmd://bash scripts/lint-spec.sh
   662	  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   663	  — exit 0 (0 errors, 0 warnings, 47 citation hits).
   664	- `cmd://bash scripts/check-corpus-completeness.sh` —
   665	  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
   666	- Per-artefact `cmd://bash scripts/lint-spec.sh
   667	  research/primary-sources/<slug>.md` — exit 1 on each.
   668	  Two issue classes:
   669	  1. Front-matter shape: corpus artefacts use `slug:`
   670	     not `type:`, so lint reports "missing
   671	     type/implies_spec_type field" + "missing required
   672	     section: ##". These are misapplied checks — the
   673	     lint script is designed for SPEC artefacts.
   674	  2. Uncited-claim: 18 of 22 artefacts have
   675	     `fact-bearing paragraph lacks citation prefix`
   676	     errors in §4 / §5 / §6 — meta-commentary bullets
   677	     that reference §3 by section but lack an inline
   678	     prefix the script's paragraph scanner recognises.
   679	  **Cross-family review (codex finding 2.1) correctly
   680	  identified this as a hack**: SPEC §7.1 says
   681	  uncited-claim is BLOCKING on corpus artefacts, but
   682	  these failures were waved off as front-matter noise.
   683	  The honest reading is that the current lint is not
   684	  fit-for-purpose on corpus artefacts and the in-place
   685	  enforcement gap is a follow-on Task SPEC for a
   686	  corpus-mode lint extension (or a separate
   687	  `scripts/validate-corpus-citations.sh` script that
   688	  applies only the uncited-claim subset of the
   689	  citation grammar to corpus artefacts). Until that
   690	  Task SPEC executes, `check-corpus-completeness.sh`
   691	  is the authoritative mechanical gate and per-artefact
   692	  citation density is reviewer-enforced. The corpus
   693	  artefacts authored under this SPEC ARE densely cited
   694	  (17+ citation prefixes per artefact), but the
   695	  mechanical claim that uncited-claim is blocking
   696	  cannot currently be verified by the script.
   697	
   698	### 19.3 Verification result
   699	
   700	PASS. All §15 ACs met:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
check-corpus-completeness: PASS — 22 sources (3 partial with deferred-reads notes)

 succeeded in 889ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-primary-source-research-corpus/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  55
lowercase 2119 hits:   7 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '700,780p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   700	PASS. All §15 ACs met:
   701	
   702	- AC-1: SPEC.md lint clean (exit 0).
   703	- AC-2: INDEX.md present.
   704	- AC-3: check-corpus-completeness.sh present + executable.
   705	- AC-4: check-corpus-completeness.sh exits 0; 22
   706	  slugs total (19 primary-read-complete + 3 partial
   707	  with deferred-reads notes per the §7.2 partial
   708	  rule; codex remediation §7.D added json-schema +
   709	  cyclonedx-sbom; codex Round-2 added the partial
   710	  status-truth check to the script).
   711	- AC-5: every §6.1 slug has corresponding `<slug>.md`
   712	  artefact.
   713	- AC-6: every artefact's front-matter conforms to
   714	  §8.1 schema (manual review).
   715	- AC-7: no verbatim §3 quote exceeds the 200-word
   716	  fair-use bound (manual review; longest excerpts are
   717	  the 18-section Symphony list and 12-factor's 12
   718	  named factors, both well under bound).
   719	- AC-8: this Completion Report records the per-source
   720	  fetch outcomes (19 primary-read-complete + 3 partial
   721	  with deferred-reads notes — adr-tools-state,
   722	  structurizr-dsl, json-schema; zero access-blocked)
   723	  and the source-list discoveries (Kiro Bedrock binding
   724	  NOT confirmed by primary read; was an inferred
   725	  binding in the prior research workpad).
   726	- AC-9: cross-family review deferred. Same-family
   727	  self-review performed; advisory recorded. Owner
   728	  directive 2026-05-18 ("base this all in deep
   729	  research, not make up bullshit") was the rigour bar;
   730	  the corpus's verbatim-quote anchoring is the
   731	  primary discharge of that obligation, with
   732	  cross-family review as a secondary check that can
   733	  land before downstream slices.
   734	
   735	### 19.4 Residual risk
   736	
   737	- **Per-artefact lint mismatch**: the lint script
   738	  treats corpus artefacts as malformed SPECs (missing
   739	  `type:` field; missing standard SPEC sections). Per
   740	  §7.1, this is advisory; the corpus-completeness
   741	  check is the authoritative gate. If future lint
   742	  evolution adds corpus-mode, the per-artefact lint
   743	  warnings disappear; meanwhile they are documented
   744	  noise.
   745	- **Three artefacts fetched as `partial` material but
   746	  recorded `primary-read-complete` because the
   747	  primary URL returned substantive content**:
   748	  - `structurizr-dsl` — root page returned definition
   749	    + C4-implementation framing; deep syntax (workspace
   750	    / model / views keywords) was navigation-only on
   751	    the fetched page. Fetch outcome marked `partial`
   752	    in the artefact's front-matter; INDEX row still
   753	    primary-read-complete because the load-bearing
   754	    methodology claims (DSL purpose, architecture-as-
   755	    code posture, C4 implementation) were anchored.
   756	  - `adr-tools-state` — root page returned community
   757	    framing + template-family references but deep
   758	    template specifics + CLI conventions live on
   759	    sub-pages not fetched. Outcome `partial` in
   760	    front-matter, `primary-read-complete` in INDEX —
   761	    sub-pages are queued as open questions for
   762	    follow-on supplementary fetches if the methodology
   763	    mandates specific ADR templates.
   764	- **Kiro Bedrock binding correction**: prior summary
   765	  in the research workpad characterised Kiro as
   766	  "Bedrock-tethered"; the homepage primary read did
   767	  NOT confirm this. The artefact records the
   768	  correction in §4 Fact-link to methodology. The
   769	  methodology's published characterisation of Kiro
   770	  MUST cite the primary read, not the prior summary.
   771	- **The seven open research questions remain
   772	  unresolved**. This corpus closes the
   773	  primary-source-grounding gap (the methodology can
   774	  now cite arc42, C4, ADRs, etc. accurately) but does
   775	  not resolve the seven open questions from the
   776	  research workpad §2.3 (exhaustiveness vs.
   777	  prescription boundary; ambiguity handling; patching
   778	  semantics; install-matches-intent verification;
   779	  equivalence classes; capability floor; adversarial
   780	  consumption). Those remain published-as-flagged-open

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '430,470p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   430	|---|---|---|
   431	| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
   432	| `quote-overrun` | Verbatim §3 quote exceeds the §6.3 fair-use bound | Reviewer rejects the artefact at corpus-completion review; author shortens to compliant excerpt |
   433	| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
   434	| `summary-without-primary` | A claim in INDEX.md's `Methodology summary` column is not anchored by a verbatim quote in the corresponding artefact's §3 | Reviewer rejects; author either anchors the claim or removes it from the summary |
   435	| `slug-collision` | Two artefacts share a slug | Force-fix; one or both renamed; INDEX.md updated |
   436	| `supersession-loop` | Artefact A is `supersedes: B` AND B is `supersedes: A` | Force-fix; the supersession DAG is acyclic |
   437	
   438	### 10.2 Recovery posture
   439	
   440	The corpus is forgiving on form, strict on substance. A
   441	mis-formatted front-matter field is a recoverable bug; a
   442	methodology claim without a primary anchor is a violation
   443	of the owner directive and blocks the methodology body
   444	from landing.
   445	
   446	## 11. Trust Boundary / Security
   447	
   448	### 11.1 Trust boundary
   449	
   450	- The corpus consumes external content fetched from
   451	  third-party URLs. Each fetch is treated as untrusted
   452	  input: the agent (WebFetch / curl) returns content; the
   453	  artefact author extracts text and attributes it; no
   454	  fetched content is executed.
   455	- The fetched URLs themselves are recorded; consumers of
   456	  the corpus can re-fetch and verify.
   457	
   458	### 11.2 Adversarial spec consumption (research §2.3.7)
   459	
   460	The methodology Product B publishes flags adversarial spec
   461	consumption as an open research question. The corpus
   462	itself, by exposing the verbatim sources, INHERITS that
   463	risk surface for any downstream agent that fetches the
   464	corpus: a malicious primary URL could carry prompt
   465	injection. Mitigation: the corpus's §2 Fetch trace records
   466	the URL and content digest at fetch time; downstream
   467	agents that re-fetch SHOULD verify the digest matches.
   468	The methodology MUST flag this as an open risk for
   469	agents consuming the SPEC bundle.
   470	

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
    88	    # 6b. Partial-status artefact MUST document what was NOT deep-read.
    89	    # Per SPEC §7.2, partial is acceptable iff the artefact §6 records
    90	    # the deferred-reads note (codex Round-2 finding: previously the
    91	    # script silently accepted partial and printed "all complete").
    92	    if [ "$status" = "partial" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
    93	        if ! grep -qiE 'not deep-read|deep-read.*deferred|deferred to|sub-page.* NOT|reserved for v1\.|reserved for follow-on' "$CORPUS_DIR/$slug.md"; then
    94	            issues+=("slug '$slug' is partial but artefact has no deferred-reads note in §6 (per SPEC §7.2 partial requires explicit disclosure of what was not deep-read)")
    95	        fi
    96	    fi
    97	
    98	    # 7. Access-blocked must record an alternative or unreachability note in §6.
    99	    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
   100	        if ! grep -qiE 'alternative|unreachable|fallback' "$CORPUS_DIR/$slug.md"; then
   101	            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
   102	        fi
   103	    fi
   104	done
   105	
   106	# 8. Orphan files (file exists but no INDEX row).
   107	for f in "$CORPUS_DIR"/*.md; do
   108	    [ -f "$f" ] || continue
   109	    base="$(basename "$f" .md)"
   110	    [ "$base" = "INDEX" ] && continue
   111	    if [ -z "${index_slugs[$base]:-}" ]; then
   112	        issues+=("orphan file: $base.md has no row in INDEX.md")
   113	    fi
   114	done
   115	
   116	if [ ${#issues[@]} -gt 0 ]; then
   117	    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
   118	    for i in "${issues[@]}"; do
   119	        printf '  - %s\n' "$i" >&2
   120	    done
   121	    exit 1
   122	fi
   123	
   124	n_rows=${#index_slugs[@]}
   125	# Count partials for honest PASS reporting (codex Round-2 finding).
   126	n_partial=0
   127	for slug in "${!index_status[@]}"; do
   128	    if [ "${index_status[$slug]}" = "partial" ]; then
   129	        n_partial=$((n_partial + 1))
   130	    fi
   131	done
   132	if [ $n_partial -gt 0 ]; then
   133	    printf 'check-corpus-completeness: PASS — %d sources (%d partial with deferred-reads notes)\n' "$n_rows" "$n_partial"
   134	else
   135	    printf 'check-corpus-completeness: PASS — %d sources, all primary-read-complete\n' "$n_rows"
   136	fi
   137	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/INDEX.md | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
    22	| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
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

codex
A couple of contract mismatches are still present: the script now reports partials honestly, but the SPEC clauses it cites still define success without `partial`. I’m checking whether that’s the only remaining blocker or whether the artefact text still overclaims.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' research/primary-sources/c4-model.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: c4-model
source_name: "The C4 model for visualising software architecture"
primary_url: "https://c4model.com/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched c4model.com/ + c4model.com/abstractions; four-level hierarchy confirmed verbatim; notation+tooling independence confirmed"
methodology_relevance: |
  C4 is the methodology's primary reference for
  architecture decomposition at the Container / Component
  level, cited in the research workpad §5.1 packaging
  recommendation. This corpus entry establishes the four
  abstractions verbatim, the notation-independence
  posture, and the boundary with code-level diagrams so
  the methodology can cite C4 precisely when prescribing
  the architecture/ sub-spec's diagram shape.
---

# C4 Model

## 1. Source identity

- Name: The C4 model for visualising software
  architecture.
- Author / maintainer: Simon Brown.
- Canonical URL: `url://c4model.com/`; abstractions
  detail at `url://c4model.com/abstractions`.
- Posture: notation-independent, tooling-independent,
  hierarchical.

## 2. Fetch trace

- `cmd://WebFetch url://c4model.com/` — 2026-05-19;
  returned definition + four-abstraction hierarchy +
  notation-independence statement.
- `cmd://WebFetch url://c4model.com/abstractions` —
  2026-05-19; returned per-level descriptions.

## 3. Verbatim claims this corpus depends on

- **Self-definition (homepage)**: "The C4 model is an
  easy to learn, developer friendly approach to software
  architecture diagramming." (`url://c4model.com/`
  #the-c4-model-for-visualising-software-architecture)

- **The four-abstraction hierarchy** (`url://c4model.com/`):
  C4 comprises "a set of hierarchical abstractions"
  consisting of:
  1. Software systems
  2. Containers
  3. Components
  4. Code

- **Software System** (`url://c4model.com/abstractions`):
  "A software system is made up of one or more containers
  (applications and data stores)."

- **Container** (`url://c4model.com/abstractions`):
  containers "contain one or more components"; they are
  "applications and data stores" — distinct from Docker
  containers per the model's own terminology, though the
  abstractions page does not contain an explicit
  Docker-disambiguation sentence in the fetched excerpt.

- **Component** (`url://c4model.com/abstractions`):
  components are elements contained within containers
  that "in turn are implemented by one or more code
  elements."

- **Code** (`url://c4model.com/abstractions`): the
  lowest level — "classes, interfaces, objects,
  functions, etc" that implement components.

- **Notation independence** (`url://c4model.com/`
  #diagrams/notation): C4 is "notation independent" —
  the model does not prescribe UML, ArchiMate, or any
  particular notation.

- **Tooling independence** (`url://c4model.com/`
  #tooling): C4 is "tooling independent" — works with
  any diagramming tool.

## 4. Gap from prior summary characterization

Prior summary in
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§3 / §5.1 cited C4 as the architecture decomposition
primitive at "Container-level (Structurizr DSL preferred
for machine-readability)." This primary read closes the
gap on:

- The exact four-level hierarchy is now anchored verbatim, <!-- lint-ok: no-citation -->
  not paraphrased.
- The notation-independence and tooling-independence <!-- lint-ok: no-citation -->
  postures are anchored to the homepage's own
  headings — the methodology can cite these as
  conformance properties C4 offers that other
  decomposition frameworks (e.g. arc42, ADRs) do not.
- The "Container" disambiguation was NOT found verbatim <!-- lint-ok: no-citation -->
  on the fetched pages; the abstractions page implies the
  distinction (Container = applications and data stores)
  but does not state "Container is NOT a Docker
  container" in the fetched text. This is an `open
  question` for §6.

## 5. Downstream-citation surface

The following methodology claims are licensed by this
entry (cite as
`file://research/primary-sources/c4-model.md §3`):

- methodology-claim: "C4 is a four-level hierarchical <!-- lint-ok: no-citation -->
  architecture-visualisation model: Software Systems →
  Containers → Components → Code."
- methodology-claim: "C4 is notation-independent and <!-- lint-ok: no-citation -->
  tooling-independent (per c4model.com homepage
  #diagrams/notation, #tooling)."
- methodology-claim: "C4 Containers are 'applications and
  data stores' per the abstractions page (`url://c4model.com/abstractions`).
  Whether the C4 docs explicitly disambiguate from Docker
  containers in additional pages was NOT verified in
  this primary read; downstream methodology MUST NOT
  quote a 'NOT a Docker container' phrasing without
  fetching `url://c4model.com/diagrams/container` and
  citing that page directly." <!-- lint-ok: no-citation -->
- methodology-claim: "Code-level (level 4) diagrams in C4 <!-- lint-ok: no-citation -->
  represent classes, interfaces, objects, functions; the
  methodology's architecture/ sub-spec MAY include
  Container + Component diagrams but Code-level diagrams
  are typically generated rather than authored."

## 6. Open questions surfaced by the primary read

- The exact "C4 Container is NOT a Docker container"
  disambiguation sentence was not present in the fetched
  excerpts. A deeper read of `url://c4model.com/diagrams/container`
  may yield the verbatim disambiguation. The methodology's
  prose draft should not put quote marks around a
  Docker-disambiguation phrasing this corpus has not
  anchored.
- C4's relationship to UML / ArchiMate is implied by the
  "notation independent" posture but not stated as a
  comparison; if downstream methodology compares C4 to
  UML decomposition, that comparison should be sourced
  separately or framed as agent-synthesis.
- Structurizr DSL (separate corpus entry slug:
  `structurizr-dsl`) is C4's reference implementation;
  the relationship between C4-as-model and Structurizr-
  as-DSL is documented separately. Cross-reference at
  artefact-completion time.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' research/primary-sources/leaddev-agent-compiled.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: leaddev-agent-compiled
source_name: "LeadDev — Can you trust the spec? The risky future of agent-compiled software"
primary_url: "https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
methodology_relevance: |
  This is the closest published statement of the
  agentic-installation hypothesis — framed as a RISK,
  not as a method. The methodology Product B publishes
  the same hypothesis as PROCEDURE (with the risks
  named and acknowledged). This corpus entry anchors
  the risk framing, the patching-semantics quote, and
  Willison's hybrid mitigation so the methodology can
  cite the LeadDev article precisely as the prior-art
  critique it must address.
---

# LeadDev — Can You Trust the Spec?

## 1. Source identity

- Title: "Can you trust the spec? The risky future of
  agent-compiled software".
- Publisher: LeadDev.
- Canonical URL: `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`.
- Status: published critique; closest in-the-wild
  articulation of the agentic-installation hypothesis
  framed as a risk surface.

## 2. Fetch trace

- `cmd://WebFetch url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
  — 2026-05-19; returned core risk hypothesis,
  patching-semantics quote, Willison mitigation.

## 3. Verbatim claims this corpus depends on

- **Core risk hypothesis** (verbatim from the article):
  "In regulated environments, organizations must be
  able to say with precision what code was running at
  the time of an incident, demonstrate it was tested,
  and show it was authorised."
  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`)

- **Patching-semantics quote** (attributed to Lukaas
  Kruger, Klarus founder): "Patching is no longer
  'Deploy version 2.1.4' but 'Update the spec and hope
  every downstream compilation behaves consistently.'"

- **Concrete failure mode** (verbatim): "If every
  deployment compiles a slightly different agent-built
  version from a shared spec, incident response becomes
  an archaeology problem."

- **Simon Willison mitigation** (attributed): leverage
  "custom plugins and API integrations — which can be
  vibe coded as much as you like, but benefit from
  taking to a core system that's standardized and
  tested and understood." Hybrid approach: customise
  the periphery, standardise the core.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

The LeadDev article is the methodology's most direct
honest-posture obligation. The methodology Product B
publishes the same hypothesis as procedure; it MUST
address the risks LeadDev names rather than dismiss
them.

Implications for the methodology:

- The §7 failure-modes section of the longread MUST
  cite this article as the prior-art critique.
- The methodology's seven open research questions
  (research workpad §2.3) cover exactly the surfaces
  LeadDev names — particularly Q3 (versioning and
  patching semantics), Q4 (install-matches-intent
  verification), Q5 (equivalence classes of valid
  implementations).
- Willison's hybrid mitigation (custom periphery +
  standardised core) is the methodology's reference-
  implementation/extensions split made concrete by
  another voice.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/leaddev-agent-compiled.md
§3`):

- methodology-claim: "The agentic-installation
  hypothesis — that developers ship specs and users
  agent-compile their own deployments — has been
  articulated in published form as a risk (LeadDev,
  Kruger, Willison) before being articulated as a
  procedure."
- methodology-claim: "In regulated environments, the
  'what code was running at the time of incident'
  obligation is unmet by agent-compiled software unless
  the SPEC + compilation outcome is reproducibly
  verifiable."
- methodology-claim: "Patching semantics under
  agentic-installation shift from 'deploy version X.Y.Z'
  to 'update spec and verify downstream re-compilation
  is consistent' — the methodology's versioning facet
  must address this directly."
- methodology-claim: "Hybrid customise-periphery /
  standardise-core was articulated by Simon Willison in
  the LeadDev article as a mitigation suggestion
  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`).
  Whether the methodology endorses it for safety-
  critical paths is a separate **methodology
  judgment** (`judgment://agent-synthesis` requiring
  owner affirmation), not a claim licensed by Willison
  or the LeadDev article alone."

## 6. Open questions surfaced by the primary read

- The article does not propose a solution; it names
  the risks. The methodology takes the risks as open
  research questions (research §2.3) rather than
  claiming to resolve them — this corpus read confirms
  the framing is appropriate.
- The regulated-environments framing (audit, incident
  response, authorisation traces) is more prominent in
  the LeadDev article than in the dispositioned
  research workpad. The methodology longread should
  surface compliance + audit traceability as a
  first-class concern, not bury it.
- Kruger's "hope every downstream compilation behaves
  consistently" phrasing is the methodology's
  acknowledged tension: deterministic build-from-spec
  is the goal; "hope it works" is the failure mode the
  methodology's reproducibility primitives (Nix,
  Sigstore-anchored bundle versioning) try to close.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "strongest|only example|only in-the-wild|blindly|directly addresses|addresses the regulated|canonical|not deep-read|NOT deep-read|partial rule|primary-read-complete|20 rows|22 rows|Q4|SPDX|CycloneDX|JSON Schema|Artifacts Guidance" specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
specs/2026-05-19-primary-source-research-corpus/SPEC.md:100:current status (`pending` / `primary-read-complete` /
specs/2026-05-19-primary-source-research-corpus/SPEC.md:190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:197:mandatory (deferred to corpus §17 Q4 v1.2 expansion):
specs/2026-05-19-primary-source-research-corpus/SPEC.md:216:fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:228:1. **§1 Source identity** — name, canonical URL,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:283:| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:284:| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:341:   `primary-read-complete | partial | access-blocked |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:346:   `primary-read-complete` or has a documented
specs/2026-05-19-primary-source-research-corpus/SPEC.md:373:primary_url:        # string; required; canonical URL
specs/2026-05-19-primary-source-research-corpus/SPEC.md:376:fetch_outcome:      # enum: primary-read-complete | partial |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:392:- `Status` is one of: `primary-read-complete`, `partial`,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:489:| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:524:      `primary-read-complete` OR `access-blocked` + note.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:584:- [ ] Q4: Are there primary sources missing from §6.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:585:      that should land in v1.0? Specifically: SPDX/SBOM
specs/2026-05-19-primary-source-research-corpus/SPEC.md:586:      (CycloneDX), Pact for contract testing, JSON
specs/2026-05-19-primary-source-research-corpus/SPEC.md:591:Neither Q1-Q4 is `owner-blocking`; all can land as
specs/2026-05-19-primary-source-research-corpus/SPEC.md:621:  22 rows total: 19 at status: primary-read-complete, 3
specs/2026-05-19-primary-source-research-corpus/SPEC.md:706:  slugs total (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:720:  fetch outcomes (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:746:  recorded `primary-read-complete` because the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:753:    primary-read-complete because the load-bearing
specs/2026-05-19-primary-source-research-corpus/SPEC.md:760:    front-matter, `primary-read-complete` in INDEX —
research/primary-sources/structurizr-dsl.md:8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
research/primary-sources/structurizr-dsl.md:85:  sub-spec MAY ship .dsl files as the canonical
research/primary-sources/structurizr-dsl.md:96:  keywords) was not deep-read in this pass — only the
research/primary-sources/cyclonedx-sbom.md:3:source_name: "CycloneDX Software Bill of Materials specification"
research/primary-sources/cyclonedx-sbom.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cyclonedx-sbom.md:10:  CycloneDX is research §4.4's missing primary source for
research/primary-sources/cyclonedx-sbom.md:21:# CycloneDX SBOM Specification
research/primary-sources/cyclonedx-sbom.md:25:- Name: CycloneDX — Software Bill of Materials
research/primary-sources/cyclonedx-sbom.md:42:  CycloneDX is "a highly modular and extensible
research/primary-sources/cyclonedx-sbom.md:71:- **Supply-chain framing**: CycloneDX's role is
research/primary-sources/cyclonedx-sbom.md:80:CycloneDX is the methodology's grounding for the
research/primary-sources/cyclonedx-sbom.md:86:  carries SBOM references; CycloneDX is a primary SBOM
research/primary-sources/cyclonedx-sbom.md:87:  option for those references. (SPDX is the other major
research/primary-sources/cyclonedx-sbom.md:89:  "canonical" framing was reduced to "primary option"
research/primary-sources/cyclonedx-sbom.md:94:  risk surface; CycloneDX is one primary SBOM option
research/primary-sources/cyclonedx-sbom.md:98:  than an SBOM format; SPDX comparison + NTIA element
research/primary-sources/cyclonedx-sbom.md:119:- methodology-claim: "CycloneDX is a jointly OWASP +
research/primary-sources/cyclonedx-sbom.md:123:- methodology-claim: "CycloneDX supports JSON, XML, and
research/primary-sources/cyclonedx-sbom.md:128:  the methodology's spec bundle qualifies as a CycloneDX
research/primary-sources/cyclonedx-sbom.md:130:- methodology-claim: "CycloneDX addresses the regulated-
research/primary-sources/cyclonedx-sbom.md:133:  CycloneDX-format provenance for releases."
research/primary-sources/cyclonedx-sbom.md:137:- SPDX is the other major SBOM format
research/primary-sources/cyclonedx-sbom.md:140:  CycloneDX is the recommended default (e.g.
research/primary-sources/cyclonedx-sbom.md:143:  of SPDX is needed to do that justly.
research/primary-sources/cyclonedx-sbom.md:145:  CycloneDX adopters but the overview page does not
research/primary-sources/cyclonedx-sbom.md:149:  related to CycloneDX vulnerability handling; if the
research/primary-sources/INDEX.md:15:| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
research/primary-sources/INDEX.md:16:| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
research/primary-sources/INDEX.md:17:| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:19:| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
research/primary-sources/INDEX.md:20:| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
research/primary-sources/INDEX.md:21:| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
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
research/primary-sources/json-schema.md:3:source_name: "JSON Schema specification (Draft 2020-12)"
research/primary-sources/json-schema.md:10:  JSON Schema is the underlying validation primitive that
research/primary-sources/json-schema.md:13:  knob declarations against JSON Schema directly; citing
research/primary-sources/json-schema.md:14:  Helm + OpenAPI without anchoring JSON Schema is a
research/primary-sources/json-schema.md:18:# JSON Schema (Draft 2020-12)
research/primary-sources/json-schema.md:22:- Name: JSON Schema specification.
research/primary-sources/json-schema.md:24:- Maintainer: JSON Schema project (community-maintained
research/primary-sources/json-schema.md:47:  - **JSON Schema Core**: "defines the basic foundation
research/primary-sources/json-schema.md:48:    of JSON Schema."
research/primary-sources/json-schema.md:49:  - **JSON Schema Validation**: "defines the validation
research/primary-sources/json-schema.md:50:    keywords of JSON Schema."
research/primary-sources/json-schema.md:68:JSON Schema is the primitive other corpus entries cite
research/primary-sources/json-schema.md:72:  §3: Helm's `values.schema.json` uses JSON Schema for
research/primary-sources/json-schema.md:76:  supported by the JSON Schema Specification Draft
research/primary-sources/json-schema.md:82:adopts JSON Schema directly for its `knobs.schema.json`
research/primary-sources/json-schema.md:94:- methodology-claim: "JSON Schema Draft 2020-12 is the
research/primary-sources/json-schema.md:97:- methodology-claim: "JSON Schema is split into Core
research/primary-sources/json-schema.md:109:  definition of JSON Schema or the validation model.
research/primary-sources/json-schema.md:115:- The relationship between JSON Schema 2020-12 and
research/primary-sources/json-schema.md:116:  earlier drafts (Draft 7, Draft 6) is not deep-read;
research/primary-sources/nix-flakes.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/nix-flakes.md:8:fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
research/primary-sources/nix-flakes.md:10:  Nix flakes are research §5.1's "strongest reproducible-
research/primary-sources/nix-flakes.md:86:strongest current level: content-addressed inputs +
research/primary-sources/nix-flakes.md:100:  claim that Nix is "the strongest" reproducibility
research/primary-sources/nix-flakes.md:104:  as "an example" rather than "the strongest" without
research/primary-sources/nix-flakes.md:127:  class-by-construction. (Earlier 'strongest current
research/primary-sources/leaddev-agent-compiled.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/leaddev-agent-compiled.md:82:  patching semantics), Q4 (install-matches-intent
research/primary-sources/symphony-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/symphony-spec.md:10:  Symphony's SPEC.md is the only example of
research/primary-sources/symphony-spec.md:32:- License: project license (OpenAI; not deep-read for
research/primary-sources/ref-arch-vs-solution-arch.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/ref-arch-vs-solution-arch.md:74:  Agile Delivery. Cottmeyer's observation: blindly
research/primary-sources/ref-arch-vs-solution-arch.md:80:  summary, not exact source wording; the canonical
research/primary-sources/ref-arch-vs-solution-arch.md:135:  observation (paraphrased: blindly deploying
research/primary-sources/ref-arch-vs-solution-arch.md:137:  case for <!-- "blindly deploying" is paraphrase per §3, not verbatim source quote (codex Round-2 finding 2.8) -->
research/primary-sources/c4-model.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oci-artifacts.md:3:source_name: "OCI Image Specification + Artifacts Guidance"
research/primary-sources/oci-artifacts.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oci-artifacts.md:20:# OCI Image Specification + Artifacts Guidance
research/primary-sources/oci-artifacts.md:28:- Companion: Artifacts Guidance at
research/primary-sources/oci-artifacts.md:67:- **OCI Artifacts Guidance** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`,
research/primary-sources/oci-artifacts.md:123:- methodology-claim: "OCI Artifacts Guidance extends the
research/primary-sources/oci-artifacts.md:144:- The Artifacts Guidance doc was deep-read on the
research/primary-sources/adr-tools-state.md:8:fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
research/primary-sources/adr-tools-state.md:27:- Linked sub-pages (not deep-read on this pass):
research/primary-sources/adr-tools-state.md:118:  on `/adr-tooling/`; not deep-read in this pass. If
research/primary-sources/cucumber-gherkin.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cucumber-gherkin.md:126:  pin English as the canonical Gherkin language for
research/primary-sources/cucumber-gherkin.md:129:- Cucumber as the canonical runner is not the only
research/primary-sources/spec-kit.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/sigstore-cosign.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/12-factor.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/12-factor.md:15:  description, the canonical factor list, and the Config
research/primary-sources/openspec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/adr-nygard.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/helm-values-schema.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/helm-values-schema.md:55:- **values.schema.json** implements JSON Schema
research/primary-sources/helm-values-schema.md:106:  (JSON Schema validation contract)."
research/primary-sources/helm-values-schema.md:121:- JSON Schema (the underlying validation language Helm
research/primary-sources/helm-values-schema.md:124:  customization facet specifies a particular JSON Schema
research/primary-sources/kiro.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/kiro.md:120:  workspaces; not deep-read in this pass.
research/primary-sources/openapi-3-1.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openapi-3-1.md:8:fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
research/primary-sources/openapi-3-1.md:13:  structure, the JSON Schema 2020-12 relationship, and
research/primary-sources/openapi-3-1.md:34:  fields, JSON Schema relationship, interface/
research/primary-sources/openapi-3-1.md:64:- **JSON Schema relationship** (verbatim): "Data types
research/primary-sources/openapi-3-1.md:66:  JSON Schema Specification Draft 2020-12." The Schema
research/primary-sources/openapi-3-1.md:67:  Object is "a superset of JSON Schema Specification
research/primary-sources/openapi-3-1.md:94:- OpenAPI 3.1's adoption of JSON Schema 2020-12 means
research/primary-sources/openapi-3-1.md:97:  (OpenAPI) can share JSON Schema as the validation
research/primary-sources/openapi-3-1.md:122:  superset of JSON Schema 2020-12; the methodology's
research/primary-sources/openapi-3-1.md:137:  methodology MAY support; not deep-read in this pass.
research/primary-sources/arc42.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/arc42.md:34:  link at `url://arc42.org/license` (not deep-read).
research/primary-sources/oracle-agent-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oracle-agent-spec.md:110:  were not deep-read on this pass. If the
research/primary-sources/diataxis.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/diataxis.md:31:  openly; specific license terms not deep-read on this

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --stat 648e4a3''^ 648e4a3 -- specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
 research/primary-sources/INDEX.md                  |  2 +-
 research/primary-sources/cyclonedx-sbom.md         | 17 +++++++--
 research/primary-sources/nix-flakes.md             | 13 +++++--
 research/primary-sources/oci-artifacts.md          | 20 +++++++---
 .../primary-sources/ref-arch-vs-solution-arch.md   |  5 ++-
 research/primary-sources/symphony-spec.md          | 21 +++++++----
 scripts/check-corpus-completeness.sh               | 23 ++++++++++-
 .../SPEC.md                                        | 44 ++++++++++++++--------
 8 files changed, 103 insertions(+), 42 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,150p' research/primary-sources/adr-tools-state.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: adr-tools-state
source_name: "adr.github.io — state of ADR practice"
primary_url: "https://adr.github.io/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "partial"
fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
methodology_relevance: |
  State-of-practice ADR ecosystem (MADR, Y-statements,
  Nygard, adr-tools CLI) is the cross-check against
  Nygard's 2011 origin. This corpus entry anchors
  community framing and template diversity so the
  methodology's decisions facet can survey current
  practice rather than locking only on Nygard.
---

# adr.github.io — State of ADR Practice

## 1. Source identity

- Name: adr.github.io — community resource for
  Architecture Decision Records.
- Canonical URL: `url://adr.github.io/`.
- Posture: community catalogue of ADR templates,
  tooling, practices.
- Linked sub-pages (not deep-read on this pass):
  `/adr-templates/`, `/ad-practices/`,
  `/adr-tooling/`.

## 2. Fetch trace

- `cmd://WebFetch url://adr.github.io/` — 2026-05-19;
  returned ADR community definition, template family
  references; specific template catalogs and CLI
  conventions live on sub-pages not fetched in this
  pass.

## 3. Verbatim claims this corpus depends on

- **ADR (community definition)**: "An Architectural
  Decision Record (ADR) captures a single AD and its
  rationale; Put it simply, ADR can help you
  understand the reasons for a chosen architectural
  decision, along with its trade-offs and consequences."
  (`url://adr.github.io/`)

- **Architectural Decision (community definition)**:
  "a justified design choice that addresses a
  functional or non-functional requirement that is
  architecturally significant."

- **Template families referenced** (per root page;
  catalogue at `/adr-templates/`):
  - **Nygard's template** — the foundational 2011
    blog post template (corpus entry `adr-nygard`).
  - **Y-statements** — from Zdun et al.'s "Sustainable
    Architectural Decisions" paper.
  - **MADR** (Markdown Architectural Decision Records)
    — community-maintained richer template.
  - Reference to "seven templates" comparison paper.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

The state-of-practice ADR ecosystem confirms Nygard's
template is foundational but no longer the only option.
The methodology's decisions facet must choose between:

- Mandating Nygard's exact 5-section template (most
  restrictive; clearest);
- Allowing the MADR richer template (more fields:
  status, deciders, context-and-problem-statement,
  considered-options, decision-outcome, pros-and-cons-
  of-the-options);
- Allowing Y-statements (one-line decision statements
  with reasoning lattice);
- Permitting any of the catalogued templates.

The choice is a methodology design decision; this
corpus entry provides the landscape from which the
decision is made.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/adr-tools-state.md
§3`):

- methodology-claim: "The state-of-practice ADR
  ecosystem includes Nygard's template (origin),
  MADR (community-rich), Y-statements (Zdun et al.),
  and other templates catalogued at adr.github.io."
- methodology-claim: "ADRs are community-defined as
  'capturing a single AD and its rationale,
  trade-offs, and consequences'."
- methodology-claim: "An Architectural Decision is
  'a justified design choice that addresses a
  functional or non-functional requirement that is
  architecturally significant'."
- methodology-claim: "The methodology's decisions/
  sub-spec MAY permit one or more catalogued ADR
  templates; the choice is a methodology design
  decision (not resolved by the community)."

## 6. Open questions surfaced by the primary read

- The adr.github.io root page references but does not
  enumerate the full template catalogue;
  `/adr-templates/` is the dedicated page. If
  methodology mandates a specific template, fetch
  that page.
- adr-tools CLI conventions (file naming, directory
  layout, `adr new`, `adr supersede` semantics) live
  on `/adr-tooling/`; not deep-read in this pass. If
  methodology adopts adr-tools-style conventions for
  the decisions/ sub-spec, fetch separately.
- The "seven templates" comparison paper is cited
  but not named in the fetched content; the
  methodology may want to find this paper for a
  deeper template-survey citation.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,140p' research/primary-sources/structurizr-dsl.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
---
slug: structurizr-dsl
source_name: "Structurizr DSL — text-based C4 model definition"
primary_url: "https://docs.structurizr.com/dsl"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "partial"
fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
methodology_relevance: |
  Structurizr DSL is research §5.1's machine-readable
  C4 implementation. This corpus entry anchors the
  DSL's purpose and posture so the methodology can
  cite it precisely as the architecture/ sub-spec's
  preferred diagram-as-code primitive.
---

# Structurizr DSL

## 1. Source identity

- Name: Structurizr DSL — text-based domain-specific
  language for defining C4-model architectures.
- Author: Simon Brown (same author as C4 model).
- Canonical URL: `url://docs.structurizr.com/dsl`.
- Posture: architecture-as-code.

## 2. Fetch trace

- `cmd://WebFetch url://docs.structurizr.com/dsl` —
  2026-05-19; primary-read of root page; definition +
  C4 implementation confirmed; deep syntax (workspace
  / model / views) not fully fetched on this pass.

## 3. Verbatim claims this corpus depends on

- **DSL definition** (`url://docs.structurizr.com/dsl`):
  the Structurizr DSL provides "a way to define a
  software architecture model (based upon the C4
  model) using a text-based domain specific language
  (DSL)."

- **C4-model basis** (per same page): the DSL
  implements the C4 model framework; the documentation
  references diagram types across the C4 hierarchy:
  system context, container, component, code.

- **Architecture-as-code posture** (per same page):
  "as code" philosophy — architecture definitions are
  text-based artefacts, versionable + readable +
  programmable.

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Structurizr DSL is the architecture-as-code primitive
that lets the methodology's architecture/ sub-spec
ship machine-readable diagrams (not PNG renders or
hand-drawn artefacts). Key shape implications:

- The methodology's architecture/ sub-spec MAY ship
  one or more `.dsl` files that define the C4 model
  for the product; tooling (Structurizr Lite,
  Structurizr Cloud, or third-party renderers like
  c4-plantuml) renders them to diagrams at consumer
  time.
- Versionable + diff-able: architecture changes show
  up in git diffs, not in opaque image binaries.
- Pairs with C4 (separate corpus entry) — the
  methodology cites C4 as the conceptual model and
  Structurizr DSL as the preferred concrete encoding.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/structurizr-dsl.md
§3`):

- methodology-claim: "Structurizr DSL is a text-based
  DSL for defining C4-model architectures — diagrams
  as code."
- methodology-claim: "The methodology's architecture/
  sub-spec MAY ship .dsl files as the canonical
  diagram artefacts, renderable by Structurizr Lite /
  Cloud / third-party tooling."
- methodology-claim: "Structurizr DSL's architecture-as-
  code posture aligns with the methodology's
  preference for versionable + diff-able artefacts in
  the SPEC bundle."

## 6. Open questions surfaced by the primary read

- The exact DSL syntax (workspace, model, views
  keywords) was not deep-read in this pass — only the
  top-level navigation. If the methodology's
  architecture/ sub-spec sketches example .dsl
  snippets, a deeper fetch of `docs.structurizr.com/dsl/language`
  is needed.
- Alternative architecture-as-code tools (Mermaid,
  PlantUML with c4-plantuml, IcePanel, Likec4) cover
  similar ground; the methodology should acknowledge
  multiple options rather than mandating Structurizr.
- Structurizr's hosting model (Lite for self-host,
  Cloud for hosted) is a deployment choice for the
  methodology's downstream tooling, not part of the
  spec itself; flag for non-binding methodology
  guidance.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/nix-flakes.md | sed -n '1,150p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
   124	- methodology-claim: "Nix's reproducibility model is one
   125	  concrete implementation of build-from-spec; the
   126	  methodology cites it as an example of equivalence-
   127	  class-by-construction. (Earlier 'strongest current
   128	  implementation' framing removed per codex Round-2
   129	  finding 2.9 FAIL — comparative ranking is
   130	  judgment://agent-synthesis not licensed by Nix
   131	  documentation; the §4 caveat is now reflected here
   132	  for consistency.)"
   133	- methodology-claim: "The methodology's deployment/
   134	  sub-spec MAY mirror flake's inputs/outputs shape,
   135	  treating inputs as the deferral contract and outputs
   136	  as the deployment artefact set."
   137	
   138	## 6. Open questions surfaced by the primary read
   139	
   140	- Nix flakes are still officially "experimental" in
   141	  stable Nix releases; the methodology should
   142	  acknowledge this when prescribing flake-style inputs/
   143	  outputs as a deployment-spec shape.
   144	- Whether Nix's content-hash reproducibility generalises
   145	  to non-Nix language ecosystems (Helm? OCI? container
   146	  images built outside Nix?) is an open methodology
   147	  question. The methodology MAY recommend Nix-like
   148	  reproducibility WITHOUT mandating Nix as the
   149	  underlying substrate.
   150	- The relationship between flake.lock and OCI image

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/cyclonedx-sbom.md | sed -n '1,160p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
    86	  carries SBOM references; CycloneDX is a primary SBOM
    87	  option for those references. (SPDX is the other major
    88	  format and warrants comparison; see §6 — the
    89	  "canonical" framing was reduced to "primary option"
    90	  per codex Round-2 finding on cyclonedx overreach.)
    91	- The LeadDev critique
    92	  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
    93	  §3) raised regulated-environments compliance as a
    94	  risk surface; CycloneDX is one primary SBOM option
    95	  relevant to that compliance gap. ("Directly addresses"
    96	  was reduced to "relevant to" per codex Round-2 finding
    97	  on cyclonedx overreach — full compliance requires more
    98	  than an SBOM format; SPDX comparison + NTIA element
    99	  mapping + VEX vulnerability handling are companion
   100	  pieces.)
   101	- The three encoding formats (JSON / XML / Protobuf)
   102	  let the methodology recommend JSON as default while
   103	  acknowledging adopter environments may use XML for
   104	  regulated-industry tooling or Protobuf for
   105	  wire-efficient pipelines.
   106	- The component scope (software / hardware / ML models
   107	  / source / configurations) is broad enough that the
   108	  methodology's spec bundle itself can be enumerated as
   109	  an SBOM-tracked component when bundled into an OCI
   110	  artifact.
   111	
   112	## 5. Downstream-citation surface
   113	
   114	<!-- lint-ok: no-citation -->
   115	
   116	Methodology claims licensed by this entry (cite as
   117	`file://research/primary-sources/cyclonedx-sbom.md §3`):
   118	
   119	- methodology-claim: "CycloneDX is a jointly OWASP +
   120	  Ecma-maintained SBOM framework (ECMA-424; current
   121	  version 1.7) representing components, services,
   122	  dependencies, vulnerabilities, and metadata."
   123	- methodology-claim: "CycloneDX supports JSON, XML, and
   124	  Protocol Buffers encodings; the methodology
   125	  recommends JSON as the manifest-provenance default."
   126	- methodology-claim: "Component scope includes software,
   127	  hardware, ML models, source code, and configurations;
   128	  the methodology's spec bundle qualifies as a CycloneDX
   129	  component when distributed via OCI registry."
   130	- methodology-claim: "CycloneDX addresses the regulated-
   131	  environments compliance gap LeadDev's critique
   132	  identified; methodology's audit posture rests on
   133	  CycloneDX-format provenance for releases."
   134	
   135	## 6. Open questions surfaced by the primary read
   136	
   137	- SPDX is the other major SBOM format
   138	  (`url://spdx.dev/`); the methodology should
   139	  acknowledge it as an alternative and document why
   140	  CycloneDX is the recommended default (e.g.
   141	  finer-grained vulnerability handling, OWASP backing,
   142	  ECMA standardisation) — but a separate primary read
   143	  of SPDX is needed to do that justly.
   144	- NTIA minimum SBOM elements are referenced by some
   145	  CycloneDX adopters but the overview page does not
   146	  enumerate them; methodology compliance claims
   147	  against NTIA need a separate primary source.
   148	- Vulnerability Exploitability eXchange (VEX) is
   149	  related to CycloneDX vulnerability handling; if the
   150	  methodology covers vulnerability disclosure under
   151	  spec-as-distribution, VEX is a separate corpus
   152	  candidate.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "ADVISORY|Advisory|advisory|§10|§16|Rollback|Failure Model" reviews/codex-2026-05-19-round2/02-corpus.md specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
specs/2026-05-19-primary-source-research-corpus/SPEC.md:327:   advisory unless the failure is uncited-claim, which
specs/2026-05-19-primary-source-research-corpus/SPEC.md:425:## 10. Failure Model
specs/2026-05-19-primary-source-research-corpus/SPEC.md:538:## 16. Rollback Plan
specs/2026-05-19-primary-source-research-corpus/SPEC.md:569:      amendment per §16. Default: defer; not a blocker.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:727:  self-review performed; advisory recorded. Owner
specs/2026-05-19-primary-source-research-corpus/SPEC.md:740:  §7.1, this is advisory; the corpus-completeness
specs/2026-05-19-primary-source-research-corpus/SPEC.md:801:  (b) accept lint as advisory for corpus per the
reviews/codex-2026-05-19-round2/02-corpus.md:519:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
reviews/codex-2026-05-19-round2/02-corpus.md:985:   327	   advisory unless the failure is uncited-claim, which
reviews/codex-2026-05-19-round2/02-corpus.md:1104:    14	Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
reviews/codex-2026-05-19-round2/02-corpus.md:1480:   126	- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
reviews/codex-2026-05-19-round2/02-corpus.md:1639:14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
reviews/codex-2026-05-19-round2/02-corpus.md:1688:841:   758	  (b) accept lint as advisory for corpus per the
reviews/codex-2026-05-19-round2/02-corpus.md:1744:1600:   110	- §16 Reference Algorithms — Symphony-specific
reviews/codex-2026-05-19-round2/02-corpus.md:1809:2657:145:Symphony-specific (NOT transferable): §10 Agent Runner Protocol;
reviews/codex-2026-05-19-round2/02-corpus.md:1831:2850:   145	Symphony-specific (NOT transferable): §10 Agent Runner Protocol;
reviews/codex-2026-05-19-round2/02-corpus.md:1965:5338:  The lint-impedance handling is a hack in its current form. §7.1 says corpus lint exit 1 is advisory unless the failure is `uncited-claim`, which is blocking; the Completion Report waves off all corpus lint failures as front-matter/shape noise. I ran per-artefact lint read-only: all 20 exit 1, and 18 include `fact-bearing paragraph lacks citation prefix` errors. Example: [helm-values-schema.md:42](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md:42). Either add corpus-mode lint or make the completeness gate validate corpus citations directly.
reviews/codex-2026-05-19-round2/02-corpus.md:1985:5376:  The lint-impedance handling is a hack in its current form. §7.1 says corpus lint exit 1 is advisory unless the failure is `uncited-claim`, which is blocking; the Completion Report waves off all corpus lint failures as front-matter/shape noise. I ran per-artefact lint read-only: all 20 exit 1, and 18 include `fact-bearing paragraph lacks citation prefix` errors. Example: [helm-values-schema.md:42](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md:42). Either add corpus-mode lint or make the completeness gate validate corpus citations directly.
reviews/codex-2026-05-19-round2/02-corpus.md:2373:   121	  Annotation) shifts format strings from advisory to
reviews/codex-2026-05-19-round2/02-corpus.md:2894:    62	  14. Failure Model and Recovery Strategy
reviews/codex-2026-05-19-round2/02-corpus.md:2939:   107	- §10 Agent Runner Protocol — agent-specific.
reviews/codex-2026-05-19-round2/02-corpus.md:2942:   110	- §16 Reference Algorithms — Symphony-specific
reviews/codex-2026-05-19-round2/02-corpus.md:3806:   715	  self-review performed; advisory recorded. Owner
reviews/codex-2026-05-19-round2/02-corpus.md:3814:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "partial|primary-read-complete|all complete|Completion Report|SOURCE_LIST_VERSION|AC-|lint|check-corpus|22|json-schema|cyclonedx|advisory" specs/2026-05-19-primary-source-research-corpus/SPEC.md scripts/check-corpus-completeness.sh research/primary-sources/INDEX.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
reviews/codex-2026-05-19-round2/02-corpus.md:3870:specs/2026-05-19-primary-source-research-corpus/SPEC.md:327:   advisory unless the failure is uncited-claim, which
reviews/codex-2026-05-19-round2/02-corpus.md:3934:specs/2026-05-19-primary-source-research-corpus/SPEC.md:715:  self-review performed; advisory recorded. Owner
reviews/codex-2026-05-19-round2/02-corpus.md:3936:specs/2026-05-19-primary-source-research-corpus/SPEC.md:728:  §7.1, this is advisory; the corpus-completeness
reviews/codex-2026-05-19-round2/02-corpus.md:3948:specs/2026-05-19-primary-source-research-corpus/SPEC.md:789:  (b) accept lint as advisory for corpus per the
reviews/codex-2026-05-19-round2/02-corpus.md:3988:   728	  §7.1, this is advisory; the corpus-completeness
reviews/codex-2026-05-19-round2/02-corpus.md:4049:   789	  (b) accept lint as advisory for corpus per the
reviews/codex-2026-05-19-round2/02-corpus.md:4113:   538	## 16. Rollback Plan
reviews/codex-2026-05-19-round2/02-corpus.md:4125:   569	      amendment per §16. Default: defer; not a blocker.
reviews/codex-2026-05-19-round2/02-corpus.md:4251:lowercase 2119 hits:   0 (advisory only)
reviews/codex-2026-05-19-round2/02-corpus.md:4261:lowercase 2119 hits:   7 (advisory only)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba reviews/codex-2026-05-19-round2/02-corpus.md | sed -n '4260,4330p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
  4260	citation-prefix hits:  55
  4261	lowercase 2119 hits:   7 (advisory only)
  4262	errors:                0
  4263	warnings:              0
  4264	
  4265	codex
  4266	**Quality Gate Result: REQUEST CHANGES**
  4267	
  4268	**New Findings**
  4269	
  4270	- HIGH: [scripts/check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:78) accepts `partial` rows and still prints “all complete”, while the SPEC says exit 0 only when every slug is `primary-read-complete` or documented `access-blocked`: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345). Current INDEX has three `partial` rows: `adr-tools-state`, `structurizr-dsl`, `json-schema`.
  4271	
  4272	- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
  4273	
  4274	- MEDIUM: `cyclonedx-sbom` overreaches. It calls CycloneDX “canonical” for provenance at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:84), says it “directly addresses” the regulated-environments compliance gap at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:121), while §6 admits SPDX needs separate primary comparison at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:128). This should be softened to “a primary SBOM option relevant to” provenance/compliance.
  4275	
  4276	**Remediation Verdicts**
  4277	
  4278	- 2.1 lint impedance: PARTIAL. The Completion Report now admits the lint gap honestly, but no mechanical corpus citation gate exists yet.
  4279	
  4280	- 2.2 status truth: PASS for INDEX. `adr-tools-state` and `structurizr-dsl` are now `partial`; `json-schema` is also correctly `partial`.
  4281	
  4282	- 2.3 source-list expansion: PASS. `json-schema` and `cyclonedx-sbom` are added to §6.1, and `SOURCE_LIST_VERSION` is v1.1.
  4283	
  4284	- 2.4 OCI artifacts: PARTIAL. §3 now contains Artifacts Guidance evidence that supports non-image payload claims, but stale contradictory text still says the guidance was not deep-read at [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28) and [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:143).
  4285	
  4286	- 2.5 C4 Docker: PASS. The rewritten claim no longer quotes unverified “not Docker” language and adds the right citation caution.
  4287	
  4288	- 2.6 Symphony uniqueness: PARTIAL. §5 is now scoped to “identified by this project’s research”, but front matter still asserts “only in-the-wild example” globally at [symphony-spec.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:10).
  4289	
  4290	- 2.7 LeadDev / Willison: PASS. It now separates Willison’s mitigation suggestion from methodology endorsement.
  4291	
  4292	- 2.8 ref-arch paraphrase: PARTIAL. §3 labels paraphrase, but §5 still quotes “blindly deploying methodologies verbatim fails” as if exact at [ref-arch-vs-solution-arch.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:134).
  4293	
  4294	- 2.9 Nix strongest: FAIL. The caveat was added, but the unlicensed “strongest current implementation” claim remains in §5 at [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:124) and in INDEX at [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:22).
  4295	
  4296	**Checks Run**
  4297	
  4298	`lint-spec.sh` passes for the target SPEC and remediation SPEC. `check-corpus-completeness.sh` passes with “22 sources”, but that pass is part of the gate problem above because partial rows are accepted as complete.
  4299	tokens used
  4300	126,105
  4301	**Quality Gate Result: REQUEST CHANGES**
  4302	
  4303	**New Findings**
  4304	
  4305	- HIGH: [scripts/check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:78) accepts `partial` rows and still prints “all complete”, while the SPEC says exit 0 only when every slug is `primary-read-complete` or documented `access-blocked`: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345). Current INDEX has three `partial` rows: `adr-tools-state`, `structurizr-dsl`, `json-schema`.
  4306	
  4307	- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
  4308	
  4309	- MEDIUM: `cyclonedx-sbom` overreaches. It calls CycloneDX “canonical” for provenance at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:84), says it “directly addresses” the regulated-environments compliance gap at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:121), while §6 admits SPDX needs separate primary comparison at [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:128). This should be softened to “a primary SBOM option relevant to” provenance/compliance.
  4310	
  4311	**Remediation Verdicts**
  4312	
  4313	- 2.1 lint impedance: PARTIAL. The Completion Report now admits the lint gap honestly, but no mechanical corpus citation gate exists yet.
  4314	
  4315	- 2.2 status truth: PASS for INDEX. `adr-tools-state` and `structurizr-dsl` are now `partial`; `json-schema` is also correctly `partial`.
  4316	
  4317	- 2.3 source-list expansion: PASS. `json-schema` and `cyclonedx-sbom` are added to §6.1, and `SOURCE_LIST_VERSION` is v1.1.
  4318	
  4319	- 2.4 OCI artifacts: PARTIAL. §3 now contains Artifacts Guidance evidence that supports non-image payload claims, but stale contradictory text still says the guidance was not deep-read at [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28) and [oci-artifacts.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:143).
  4320	
  4321	- 2.5 C4 Docker: PASS. The rewritten claim no longer quotes unverified “not Docker” language and adds the right citation caution.
  4322	
  4323	- 2.6 Symphony uniqueness: PARTIAL. §5 is now scoped to “identified by this project’s research”, but front matter still asserts “only in-the-wild example” globally at [symphony-spec.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:10).
  4324	
  4325	- 2.7 LeadDev / Willison: PASS. It now separates Willison’s mitigation suggestion from methodology endorsement.
  4326	
  4327	- 2.8 ref-arch paraphrase: PARTIAL. §3 labels paraphrase, but §5 still quotes “blindly deploying methodologies verbatim fails” as if exact at [ref-arch-vs-solution-arch.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:134).
  4328	
  4329	- 2.9 Nix strongest: FAIL. The caveat was added, but the unlicensed “strongest current implementation” claim remains in §5 at [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:124) and in INDEX at [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:22).
  4330	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '780,830p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   780	  consumption). Those remain published-as-flagged-open
   781	  per parent Decision §7.
   782	
   783	### 19.5 Spec evidence candidates
   784	
   785	- **Primary-read corpus pattern**: structured per-source
   786	  artefacts with verbatim claims, fetch trace, gap from
   787	  prior summary, downstream-citation surface, open
   788	  questions are a robust corpus shape for any
   789	  methodology that must ground claims in external
   790	  sources. Capture as a reusable pattern under the
   791	  `spec-evidence-governance` skill: "when the
   792	  methodology depends on external sources, a
   793	  primary-source corpus is the citable foundation —
   794	  agent summaries are not sufficient."
   795	- **Lint-vs-corpus impedance**: the SPEC's lint script
   796	  is designed for IDEA/SPEC artefacts; corpus
   797	  artefacts (with `slug:` front-matter and §
   798	  structure tuned to source characterisation) trigger
   799	  spurious lint errors. Two paths: (a) extend
   800	  lint-spec.sh with a corpus-mode (out of scope here);
   801	  (b) accept lint as advisory for corpus per the
   802	  SPEC's own §7.1 affordance. We took (b). Capture as
   803	  spec-evidence for future linter design: lints should
   804	  treat front-matter discriminator as the
   805	  artefact-type signal and apply mode-appropriate
   806	  checks rather than assuming SPEC shape.
   807	- **Verbatim-quote bounded excerpts are practical**:
   808	  the 200-word fair-use bound (§6.3) proved easy to
   809	  honour; the longest excerpts in the corpus
   810	  (Symphony's 18-section list, 12-factor's 12 factor
   811	  names) are well under bound and the artefact's
   812	  Methodology-relevance + Fact-link sections do the
   813	  characterisation work that would otherwise need
   814	  longer excerpts.
   815	- **Prior-summary corrections happen and matter**:
   816	  the Kiro "Bedrock-tethered" inferred binding was
   817	  contradicted by primary read; the diataxis four-mode
   818	  definitions were anchored verbatim rather than
   819	  paraphrased; arc42's 12-section list was confirmed
   820	  precisely. The corpus's §4 Gap-from-prior-summary
   821	  section captures these corrections explicitly,
   822	  giving the methodology's longread author the data
   823	  to write honestly about what the research workpad
   824	  got right and what needed correction.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "corpus|02-corpus|§10|§16|ADVISORY|advisory" reviews/codex-2026-05-19-round2/00-SYNTHESIS.md reviews/codex-2026-05-19-round2/01-parent-decision.md reviews/codex-2026-05-19-round2/03-v2-repack.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
reviews/codex-2026-05-19-round2/01-parent-decision.md:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round2/01-parent-decision.md:109:| `2026-05-17-contract-corpus-retrospective-audit` | task | closed (SE1/SE2/SE3 dispositioned) |
reviews/codex-2026-05-19-round2/01-parent-decision.md:136:| `2026-05-17-contract-corpus-retrospective-audit` | task | closed |
reviews/codex-2026-05-19-round2/01-parent-decision.md:168:- `2026-05-17-contract-corpus-retrospective-audit` Task IDEA;
reviews/codex-2026-05-19-round2/01-parent-decision.md:181:  related finding: zero TASK.md artefacts in corpus; the
reviews/codex-2026-05-19-round2/01-parent-decision.md:210:- `2026-05-17-contract-corpus-retrospective-audit`
reviews/codex-2026-05-19-round2/01-parent-decision.md:250:| Cross-repo informational message channel | LANDED — `AGENT_INBOX.md` per-repo append-only inbox; `agents/skills/agent-inbox/` skill (read on session start + send via helper); `agents/scripts/send-fleet-message.sh`; `/send-message` slash command; bootstrapped from template on first sync; auditor advisory for missing inbox files |
reviews/codex-2026-05-19-round2/01-parent-decision.md:758:§10, §11.3, §17.3. Shared schema:
reviews/codex-2026-05-19-round2/01-parent-decision.md:777:  gate (§10.1) to determine whether the IDEA can transition from
reviews/codex-2026-05-19-round2/01-parent-decision.md:800:Per SPEC §10 and SPEC.schema §5:
reviews/codex-2026-05-19-round2/01-parent-decision.md:804:| `IDEA.md` | §10.1 IDEA gate | n/a | RECOMMENDED |
reviews/codex-2026-05-19-round2/01-parent-decision.md:805:| `SPEC.md` with `type: task` | §10.2 Task gate | `b` (verifiable) | RECOMMENDED |
reviews/codex-2026-05-19-round2/01-parent-decision.md:806:| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (Symphony-grade) | **REQUIRED** |
reviews/codex-2026-05-19-round2/01-parent-decision.md:807:| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |
reviews/codex-2026-05-19-round2/01-parent-decision.md:825:- `2` — advisory only; record entries with `severity: advisory`.
reviews/codex-2026-05-19-round2/01-parent-decision.md:829:RECOMMENDED. The skill SHOULD run it and record advisory entries;
reviews/codex-2026-05-19-round2/01-parent-decision.md:888:    severity: advisory
reviews/codex-2026-05-19-round2/01-parent-decision.md:907:  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.
reviews/codex-2026-05-19-round2/01-parent-decision.md:926:  if lint_exit == 2: append failure(criterion="lint", severity="advisory", evidence=...)
reviews/codex-2026-05-19-round2/01-parent-decision.md:972:  safety. Editorial polish is advisory at most.
reviews/codex-2026-05-19-round2/01-parent-decision.md:974:  otherwise passes. Lint exit 2 is advisory.
reviews/codex-2026-05-19-round2/01-parent-decision.md:981:  `same-family-review: <model>` and surface it as an `advisory`
reviews/codex-2026-05-19-round2/01-parent-decision.md:1008:  §10, §11.3, §17.3.
reviews/codex-2026-05-19-round2/01-parent-decision.md:1034:specs/2026-05-17-contract-corpus-retrospective-audit/SPEC.md
reviews/codex-2026-05-19-round2/01-parent-decision.md:1541:- Check 3: Locks (§9) and Reversal Plan (§10) are populated
reviews/codex-2026-05-19-round2/01-parent-decision.md:1555:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round2/01-parent-decision.md:1592:  family proxy; recorded as `severity: advisory`) →
reviews/codex-2026-05-19-round2/01-parent-decision.md:1601:gate passed (with same-family-proxy advisory recorded).
reviews/codex-2026-05-19-round2/01-parent-decision.md:1670:`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §10.
reviews/codex-2026-05-19-round2/01-parent-decision.md:1674:All criteria are **blocking** unless tagged `advisory`.
reviews/codex-2026-05-19-round2/01-parent-decision.md:1678:- IDEA gate (§10.1)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1679:- Task SPEC gate, bar (b) "verifiable" (§10.2)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1680:- Contract SPEC gate, bar (c) "Symphony-grade" (§10.3)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1681:- Decision SPEC gate, bar (b) + candidate-comparison (§10.4)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1685:## IDEA gate (§10.1)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1703:  variants in normative-feeling sentences are advisory (severity
reviews/codex-2026-05-19-round2/01-parent-decision.md:1704:  `advisory`).
reviews/codex-2026-05-19-round2/01-parent-decision.md:1706:## Task SPEC gate, bar (b) "verifiable" (§10.2)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1720:## Contract SPEC gate, bar (c) "Symphony-grade" (§10.3)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1736:  advisory and does not block; exit 1 is blocking).
reviews/codex-2026-05-19-round2/01-parent-decision.md:1738:## Decision SPEC gate, bar (b) + candidate-comparison (§10.4)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1786:§6.1, §8, §10.
reviews/codex-2026-05-19-round2/01-parent-decision.md:2261:/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19-round2/01-parent-decision.md:2265:/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh
reviews/codex-2026-05-19-round2/01-parent-decision.md:2271:/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md
reviews/codex-2026-05-19-round2/01-parent-decision.md:2671:   489	- Check 3: Locks (§9) and Reversal Plan (§10) are populated
reviews/codex-2026-05-19-round2/01-parent-decision.md:2685:   503	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round2/01-parent-decision.md:2720:    14	Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19-round2/01-parent-decision.md:2742:    36	123:- when the user asks to “reorientate” and “do an audit on the full project retrospectively” and to “reopen all the previous spec documents” so the agent can produce “the individuals tasks and roadmap and all the artifacts we missed previously” -> start with retrospective authority/spec-corpus review before implementation [Task 1][Task 2][Task 3]
reviews/codex-2026-05-19-round2/01-parent-decision.md:2986:    16	  - ../2026-05-19-primary-source-research-corpus/SPEC.md
reviews/codex-2026-05-19-round2/01-parent-decision.md:3028:    58	  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`:
reviews/codex-2026-05-19-round2/01-parent-decision.md:3035:    65	  corpus-citation lint extension) which this Contract names
reviews/codex-2026-05-19-round2/01-parent-decision.md:3060:    90	- Authoring the corpus-citation lint extension itself
reviews/codex-2026-05-19-round2/01-parent-decision.md:3093:   123	  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
reviews/codex-2026-05-19-round2/01-parent-decision.md:3096:   126	- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
reviews/codex-2026-05-19-round2/01-parent-decision.md:3128:   158	3. **Source-list expansion** (corpus §6.1): finding 2.3.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3203:   233	`file://../2026-05-19-primary-source-research-corpus/SPEC.md`
reviews/codex-2026-05-19-round2/01-parent-decision.md:3225:   255	mandatory (deferred to v1.1 corpus expansion):
reviews/codex-2026-05-19-round2/01-parent-decision.md:3255:14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3298:1323:   235	  - `quality/` — arc42 §10 + 15-factor conformance overlay.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3349:2192:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:235:  - `quality/` — arc42 §10 + 15-factor conformance overlay.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3357:2240:   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3361:2265:   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3593:   123	  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
reviews/codex-2026-05-19-round2/01-parent-decision.md:3596:   126	- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
reviews/codex-2026-05-19-round2/01-parent-decision.md:3629:  2240	   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3654:  2265	   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3700:   235	  - `quality/` — arc42 §10 + 15-factor conformance overlay.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3809:   379	    (`file://specs/2026-05-17-contract-corpus-retrospective-audit/REPORT.md`).
reviews/codex-2026-05-19-round2/01-parent-decision.md:3867:489:- Check 3: Locks (§9) and Reversal Plan (§10) are populated
reviews/codex-2026-05-19-round2/01-parent-decision.md:3869:503:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3882:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"SPEC-bundle-only|paper-style|eight catalogued|§6 above|signed-distribution|signature|conformance|compares 4|6 × 4|Candidates 5\\.1-5\\.4|§16 Reversal\" specs/2026-05-18-agentic-installation-methodology/SPEC.md /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round2/01-parent-decision.md:3884:/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126:- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
reviews/codex-2026-05-19-round2/01-parent-decision.md:3974:lowercase 2119 hits:   0 (advisory only)
reviews/codex-2026-05-19-round2/01-parent-decision.md:3984:lowercase 2119 hits:   0 (advisory only)
reviews/codex-2026-05-19-round2/01-parent-decision.md:4041:ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
reviews/codex-2026-05-19-round2/01-parent-decision.md:4072:ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:22:| Parent Decision | 2 RESOLVED, 2 PARTIAL | 3 (2 MAJOR + 1 ADVISORY) |
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:62:- **ADVISORY** remediation Contract §126: references parent
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:63:  Decision §16 Reversal Plan, but the actual section is §10.
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:67:Detailed review: [`02-corpus.md`](./02-corpus.md).
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:73:| 2.1 | PARTIAL | Completion Report now admits the lint gap honestly; no mechanical corpus citation gate exists yet (queued §7.G) |
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:85:- **HIGH** scripts/check-corpus-completeness.sh §78: accepts
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:89:- **MEDIUM** corpus SPEC §619 + §521: Completion Report and
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:183:### Priority 3 — Stale text + carry-through (MAJOR + HIGH parent + corpus + repack)
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:192:  remediation Contract §126 (§16 → §10).
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:218:- §7.G corpus-citation lint extension (Round-1 finding 4.2)
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:220:- §2.1 lint impedance is partial-by-design; corpus-mode
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:243:- Machine gates (lint, validate-manifest, check-corpus-
reviews/codex-2026-05-19-round2/03-v2-repack.md:167:  workpad and the spec corpus, not by agent-private memory
reviews/codex-2026-05-19-round2/03-v2-repack.md:341:  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
reviews/codex-2026-05-19-round2/03-v2-repack.md:651:`research/primary-sources/<slug>.md` corpus.
reviews/codex-2026-05-19-round2/03-v2-repack.md:681:methodology's primary-source corpus, and the migration
reviews/codex-2026-05-19-round2/03-v2-repack.md:789:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
reviews/codex-2026-05-19-round2/03-v2-repack.md:790:  (status: verified) — the primary-source corpus this
reviews/codex-2026-05-19-round2/03-v2-repack.md:795:Active primary-source citations (corpus-grounded):
reviews/codex-2026-05-19-round2/03-v2-repack.md:1046:Quality requirements + conformance gates per arc42 §10
reviews/codex-2026-05-19-round2/03-v2-repack.md:1996:847:   172	  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
reviews/codex-2026-05-19-round2/03-v2-repack.md:2185:5708:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:135:- `file://schema/SPEC.schema.md` — citation grammar,
reviews/codex-2026-05-19-round2/03-v2-repack.md:2186:5713:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:177:| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2187:5714:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:178:| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2188:5716:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:188:| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2223:6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
reviews/codex-2026-05-19-round2/03-v2-repack.md:2230:6068:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:172:file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md
reviews/codex-2026-05-19-round2/03-v2-repack.md:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2570:643:| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2625:86:  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
reviews/codex-2026-05-19-round2/03-v2-repack.md:2668:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:33:`research/primary-sources/<slug>.md` corpus.
reviews/codex-2026-05-19-round2/03-v2-repack.md:2674:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
reviews/codex-2026-05-19-round2/03-v2-repack.md:2744:spec-bundle/skills/spec-review/SKILL.md:51:Per SPEC §10 and SPEC.schema §5:
reviews/codex-2026-05-19-round2/03-v2-repack.md:2766:spec-bundle/skills/spec-authoring/SKILL.md:217:2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
reviews/codex-2026-05-19-round2/03-v2-repack.md:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:3124:    86	  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
reviews/codex-2026-05-19-round2/03-v2-repack.md:3168:    33	`research/primary-sources/<slug>.md` corpus.
reviews/codex-2026-05-19-round2/03-v2-repack.md:3198:    63	methodology's primary-source corpus, and the migration
reviews/codex-2026-05-19-round2/03-v2-repack.md:3357:   641	| `sbom_format` | enum | OPTIONAL | `cyclonedx` \| `spdx` (default `cyclonedx` per the corpus entry `cyclonedx-sbom.md` §3) |
reviews/codex-2026-05-19-round2/03-v2-repack.md:3359:   643	| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
reviews/codex-2026-05-19-round2/03-v2-repack.md:3553:lowercase 2119 hits:   1 (advisory only)
reviews/codex-2026-05-19-round2/03-v2-repack.md:4154:   217	2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
reviews/codex-2026-05-19-round2/03-v2-repack.md:4155:   218	   authority spec; for SPEC.md it is §10.2 (task), §10.3 (contract),
reviews/codex-2026-05-19-round2/03-v2-repack.md:4156:   219	   or §10.4 (decision).
reviews/codex-2026-05-19-round2/03-v2-repack.md:4195:     9	§10, §11.3, §17.3. Shared schema:
reviews/codex-2026-05-19-round2/03-v2-repack.md:4214:    28	  gate (§10.1) to determine whether the IDEA can transition from
reviews/codex-2026-05-19-round2/03-v2-repack.md:4237:    51	Per SPEC §10 and SPEC.schema §5:
reviews/codex-2026-05-19-round2/03-v2-repack.md:4241:    55	| `IDEA.md` | §10.1 IDEA gate | n/a | RECOMMENDED |
reviews/codex-2026-05-19-round2/03-v2-repack.md:4242:    56	| `SPEC.md` with `type: task` | §10.2 Task gate | `b` (verifiable) | RECOMMENDED |
reviews/codex-2026-05-19-round2/03-v2-repack.md:4243:    57	| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (the autonomous-dispatch runner-grade) | **REQUIRED** |
reviews/codex-2026-05-19-round2/03-v2-repack.md:4244:    58	| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |
reviews/codex-2026-05-19-round2/03-v2-repack.md:4262:    76	- `2` — advisory only; record entries with `severity: advisory`.
reviews/codex-2026-05-19-round2/03-v2-repack.md:4266:    80	RECOMMENDED. The skill SHOULD run it and record advisory entries;
reviews/codex-2026-05-19-round2/03-v2-repack.md:4325:   139	    severity: advisory
reviews/codex-2026-05-19-round2/03-v2-repack.md:4344:   158	  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.
reviews/codex-2026-05-19-round2/03-v2-repack.md:4363:   177	  if lint_exit == 2: append failure(criterion="lint", severity="advisory", evidence=...)
reviews/codex-2026-05-19-round2/03-v2-repack.md:4409:   223	  safety. Editorial polish is advisory at most.
reviews/codex-2026-05-19-round2/03-v2-repack.md:4411:   225	  otherwise passes. Lint exit 2 is advisory.
reviews/codex-2026-05-19-round2/03-v2-repack.md:4418:   232	  `same-family-review: <model>` and surface it as an `advisory`
reviews/codex-2026-05-19-round2/03-v2-repack.md:4445:   259	  §10, §11.3, §17.3.
reviews/codex-2026-05-19-round2/03-v2-repack.md:4487:    10	Note: the canonical research-primary-source corpus lives in
reviews/codex-2026-05-19-round2/03-v2-repack.md:4648:    86	- The lint exit-2 (advisory) threshold (whether CI
reviews/codex-2026-05-19-round2/03-v2-repack.md:4684:    29	  Scenario: Lowercase RFC 2119 keyword in normative section is advisory
reviews/codex-2026-05-19-round2/03-v2-repack.md:4841:   117	Knob: whether the adopter treats lint advisory (exit 2)
reviews/codex-2026-05-19-round2/03-v2-repack.md:4844:   120	Default: exit 2 is advisory (CI passes; reviewer notes).
reviews/codex-2026-05-19-round2/03-v2-repack.md:4915:     3	Per arc42 §10 Quality
reviews/codex-2026-05-19-round2/03-v2-repack.md:5004:    92	Gemini / etc.) runs the §10.3 Contract gate; same-
reviews/codex-2026-05-19-round2/03-v2-repack.md:5234:    73	  models. Quality scenarios per arc42 §10 are the
reviews/codex-2026-05-19-round2/03-v2-repack.md:5425:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "Status:|all 20|20 rows|primary-read-complete because|per the §7.2 partial|partial rule|json-schema|cyclonedx-sbom" specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
20:Status: Draft v1
176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
624:  json-schema).
626:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
627:  cyclonedx-sbom), all conforming to §6.2 schema +
659:  v1.1 fetches added: json-schema + cyclonedx-sbom per
707:  with deferred-reads notes per the §7.2 partial
708:  rule; codex remediation §7.D added json-schema +
709:  cyclonedx-sbom; codex Round-2 added the partial
722:  structurizr-dsl, json-schema; zero access-blocked)
753:    primary-read-complete because the load-bearing

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba reviews/codex-2026-05-19-round2/00-SYNTHESIS.md | sed -n '70,105p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
    70	
    71	| # | Verdict | Note |
    72	|---|---|---|
    73	| 2.1 | PARTIAL | Completion Report now admits the lint gap honestly; no mechanical corpus citation gate exists yet (queued §7.G) |
    74	| 2.2 | PASS | INDEX status truth fixed for adr-tools-state + structurizr-dsl + json-schema |
    75	| 2.3 | PASS | json-schema + cyclonedx-sbom added correctly; SOURCE_LIST_VERSION v1.1 |
    76	| 2.4 | PARTIAL | oci-artifacts §3 now has Artifacts Guidance evidence, but stale "not deep-read" text in §2 + §6 contradicts §3 |
    77	| 2.5 | PASS | C4 Docker disambiguation correctly downgraded |
    78	| 2.6 | PARTIAL | §5 scoped to "identified by this project's research", but front-matter still says "only in-the-wild example" globally |
    79	| 2.7 | PASS | Willison endorsement strength corrected |
    80	| 2.8 | PARTIAL | §3 labels paraphrase, but §5 still quotes "blindly deploying methodologies verbatim fails" as if exact |
    81	| 2.9 | FAIL | Caveat added, but unlicensed "strongest current implementation" claim still present in nix-flakes §5 and INDEX summary |
    82	
    83	**New findings**:
    84	
    85	- **HIGH** scripts/check-corpus-completeness.sh §78: accepts
    86	  `partial` rows and still prints "all complete", contradicting
    87	  SPEC §7.2 which says exit 0 only when every slug is
    88	  `primary-read-complete` or documented `access-blocked`.
    89	- **MEDIUM** corpus SPEC §619 + §521: Completion Report and
    90	  AC-4 still say "20 rows" / "all 20 rows at status:
    91	  primary-read-complete" despite v1.1 expansion to 22 sources
    92	  with 3 at `partial`.
    93	- **MEDIUM** cyclonedx-sbom §84 + §121: overreaches with
    94	  "canonical" and "directly addresses" while §6 admits SPDX
    95	  needs separate primary comparison.
    96	
    97	### 3. v2.0 Repack
    98	
    99	Detailed review: [`03-v2-repack.md`](./03-v2-repack.md).
   100	
   101	**Remediation verdicts**:
   102	
   103	| # | Verdict | Note |
   104	|---|---|---|
   105	| 3.1 | RESOLVED | Acceptance commands now all pass |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '110,140p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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
   126	- Parent Decision SPEC §10 Reversal Plan triggers <!-- lint-ok: no-citation -->
   127	  ("External cross-family validation pass surfaces a
   128	  structural flaw") authorising amendment of the parent
   129	  Decision via this follow-on Contract. (Section number
   130	  corrected from §16 to §10 per codex Round-2 advisory
   131	  finding; §10 is the actual Reversal Plan in the parent
   132	  SPEC's section numbering.)
   133	
   134	Stale, superseded, or evidence-only sources: none specific
   135	to this Contract.
   136	
   137	Owner decisions required before implementation:
   138	
   139	- [ ] Approve the seven sub-amendments as a batch
   140	      (`approved-pending-owner` → `approved` on this

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
?? reviews/codex-2026-05-19-round3/

codex
**Quality Gate Result: REQUEST CHANGES**

**Findings**

- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.

- MEDIUM: Completion Report is still stale/internally inconsistent. It now says 22 rows, but later claims partial artefacts are recorded `primary-read-complete` in INDEX, which is false, and it cites a “§7.2 partial rule” that does not exist. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:705), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:745).

- MEDIUM: `cyclonedx-sbom` still overreaches in §5. §4 now correctly says CycloneDX is “one primary SBOM option,” but §5 still says it “addresses” the regulated-environments compliance gap and that audit posture “rests on CycloneDX-format provenance,” while §6 admits SPDX/NTIA/VEX need separate reads. See [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:130), [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:137).

- MEDIUM: `nix-flakes` still carries the unsupported comparative “strongest” framing in front matter and §4, even though §5 and INDEX were softened. See [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:10), [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:85).

**Round-2 Verdicts**

- 2.4 OCI artifacts: RESOLVED. Artifacts Guidance is now deep-read and the guidance/non-spec posture is disclosed.
- 2.6 Symphony uniqueness: RESOLVED. “Only” is now scoped to this project’s research, not global uniqueness.
- 2.8 ref-arch paraphrase: RESOLVED. The “blindly deploying” claim is now explicitly marked paraphrase.
- 2.9 Nix strongest: PARTIALLY RESOLVED. INDEX/§5 fixed; front matter and §4 still overclaim.
- HIGH check-script semantics: NOT RESOLVED. Script behavior and SPEC contract still conflict.
- MEDIUM Completion Report stale: PARTIALLY RESOLVED. 20-row text fixed; residual-risk/AC text still stale.
- MEDIUM cyclonedx overreach: PARTIALLY RESOLVED. §4 fixed; §5 still overclaims.
- ADVISORY §10/§16: RESOLVED. Remediation SPEC now correctly references parent Decision §10, not §16, at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).

**Spot Checks**

`json-schema` honestly discloses partial status and deferred Core/Validation reads. `oci-artifacts`, `symphony-spec`, and `ref-arch-vs-solution-arch` look honest after remediation. `nix-flakes` and `cyclonedx-sbom` still need the overclaim cleanup above.

Checks run read-only: `bash scripts/check-corpus-completeness.sh` passed with `22 sources (3 partial...)`; target SPEC lint passed. No mutations; worktree still only shows pre-existing `?? reviews/codex-2026-05-19-round3/`.
tokens used
125,773
**Quality Gate Result: REQUEST CHANGES**

**Findings**

- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.

- MEDIUM: Completion Report is still stale/internally inconsistent. It now says 22 rows, but later claims partial artefacts are recorded `primary-read-complete` in INDEX, which is false, and it cites a “§7.2 partial rule” that does not exist. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:705), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:745).

- MEDIUM: `cyclonedx-sbom` still overreaches in §5. §4 now correctly says CycloneDX is “one primary SBOM option,” but §5 still says it “addresses” the regulated-environments compliance gap and that audit posture “rests on CycloneDX-format provenance,” while §6 admits SPDX/NTIA/VEX need separate reads. See [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:130), [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:137).

- MEDIUM: `nix-flakes` still carries the unsupported comparative “strongest” framing in front matter and §4, even though §5 and INDEX were softened. See [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:10), [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:85).

**Round-2 Verdicts**

- 2.4 OCI artifacts: RESOLVED. Artifacts Guidance is now deep-read and the guidance/non-spec posture is disclosed.
- 2.6 Symphony uniqueness: RESOLVED. “Only” is now scoped to this project’s research, not global uniqueness.
- 2.8 ref-arch paraphrase: RESOLVED. The “blindly deploying” claim is now explicitly marked paraphrase.
- 2.9 Nix strongest: PARTIALLY RESOLVED. INDEX/§5 fixed; front matter and §4 still overclaim.
- HIGH check-script semantics: NOT RESOLVED. Script behavior and SPEC contract still conflict.
- MEDIUM Completion Report stale: PARTIALLY RESOLVED. 20-row text fixed; residual-risk/AC text still stale.
- MEDIUM cyclonedx overreach: PARTIALLY RESOLVED. §4 fixed; §5 still overclaims.
- ADVISORY §10/§16: RESOLVED. Remediation SPEC now correctly references parent Decision §10, not §16, at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).

**Spot Checks**

`json-schema` honestly discloses partial status and deferred Core/Validation reads. `oci-artifacts`, `symphony-spec`, and `ref-arch-vs-solution-arch` look honest after remediation. `nix-flakes` and `cyclonedx-sbom` still need the overclaim cleanup above.

Checks run read-only: `bash scripts/check-corpus-completeness.sh` passed with `22 sources (3 partial...)`; target SPEC lint passed. No mutations; worktree still only shows pre-existing `?? reviews/codex-2026-05-19-round3/`.
