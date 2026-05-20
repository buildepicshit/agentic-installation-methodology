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
session id: 019e4310-dbb7-75a1-aa72-e8b01b4ae894
--------
user
Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/. Round 3 review at reviews/codex-2026-05-19-round3/02-corpus.md flagged: 2.9 nix-flakes front-matter/§4 partial, HIGH check-script vs SPEC §7.2 conflict, MEDIUM cyclonedx §5, MEDIUM Completion Report stale. Round 4 remediation at commit b9ec450. Verify + surface new. Quality Gate Result. No mutations.
codex
I’ll treat this as a read-only quality gate review: refresh the Round 3 findings, inspect the b9ec450 remediation, run the repo’s verification checks where possible, and only report findings.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
## main...origin/main
?? reviews/codex-2026-05-19-round4/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|agentic-ops-framework|Product B" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate --no-renames b9ec450' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
b9ec450 (HEAD -> main, origin/main, origin/HEAD) fix(corpus r3): nix front-matter/§4 + cyclonedx §5 overreach + SPEC §7.2 partial rule (codex Round-3)
 research/primary-sources/cyclonedx-sbom.md         | 14 ++++++++---
 research/primary-sources/nix-flakes.md             | 29 ++++++++++++++--------
 .../SPEC.md                                        | 21 +++++++++++++---
 3 files changed, 46 insertions(+), 18 deletions(-)

codex
The working tree is otherwise on `main` at `b9ec450`; there is an existing untracked `reviews/codex-2026-05-19-round4/` directory, which I will leave untouched. Memory had no direct hit for this repo/task, so I’m using the live repo artefacts.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' reviews/codex-2026-05-19-round3/02-corpus.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,320p' specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
reviews/codex-2026-05-19-round4/02-corpus.md
reviews/codex-2026-05-19-round4/01-parent-decision.md
reviews/codex-2026-05-19-round3/03-v2-repack.md
reviews/codex-2026-05-19-round3/02-corpus.md
reviews/codex-2026-05-19-round3/01-parent-decision.md
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
reviews/codex-2026-05-19-round2/03-v2-repack.md
reviews/codex-2026-05-19-round2/02-corpus.md
reviews/codex-2026-05-19-round2/01-parent-decision.md
reviews/codex-2026-05-19/00-SYNTHESIS.md
reviews/codex-2026-05-19/04-longread.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/01-parent-decision.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md
research/primary-sources/arc42.md
CLAUDE.md
AGENTS.md
README.md
research/primary-sources/12-factor.md
research/primary-sources/sigstore-cosign.md
research/primary-sources/helm-values-schema.md
research/primary-sources/diataxis.md
research/primary-sources/adr-nygard.md
research/primary-sources/cucumber-gherkin.md
research/primary-sources/kiro.md
research/primary-sources/openapi-3-1.md
research/primary-sources/spec-kit.md
research/primary-sources/oracle-agent-spec.md
research/primary-sources/structurizr-dsl.md
research/primary-sources/adr-tools-state.md
research/primary-sources/openspec.md
research/primary-sources/c4-model.md
research/primary-sources/leaddev-agent-compiled.md
LICENSE
research/primary-sources/cyclonedx-sbom.md
research/primary-sources/nix-flakes.md
research/primary-sources/INDEX.md
research/primary-sources/ref-arch-vs-solution-arch.md
research/primary-sources/symphony-spec.md
research/primary-sources/oci-artifacts.md
research/primary-sources/json-schema.md
scripts/check-corpus-completeness.sh
scripts/validate-longread-structure.sh
scripts/validate-skill-frontmatter.sh
scripts/lint-spec.sh
schema/SPEC.schema.md
templates/TASK.template.md
templates/SPEC.task.template.md
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
templates/SPEC.contract.template.md
templates/IDEA.template.md
tests/hooks/run-tests.sh
specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-19-codex-remediation-amendments/SPEC.md
specs/2026-05-18-repo-standup/SPEC.md
hooks/block-edit-on-main.sh
hooks/block-ai-attribution.sh
tests/hooks/fixtures/msg-with-coauthor.txt
hooks/block-git-add-all.sh
hooks/block-push-to-main.sh
tests/hooks/fixtures/msg-clean.txt
hooks/block-verify-bypass.sh
hooks/session-start-context.sh
hooks/verify-reminder.sh
specs/2026-05-20-longread-structure/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --no-ext-diff --unified=80 --no-renames b9ec450 -- specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources/nix-flakes.md research/primary-sources/cyclonedx-sbom.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
commit b9ec450d906aef79f3b119b4e8a515ec5dbd55ff
Author: HasNoBeef <alaindormehl@gmail.com>
Date:   Tue May 19 17:54:32 2026 -0700

    fix(corpus r3): nix front-matter/§4 + cyclonedx §5 overreach + SPEC §7.2 partial rule (codex Round-3)
    
    Round-3 codex re-review found that Round-2 fixes closed §5 / INDEX
    references but missed front-matter and §4 occurrences of the same
    overclaims.
    
    2.9 PARTIAL -> RESOLVED:
    - nix-flakes.md front-matter methodology_relevance: "strongest
      reproducible-from-spec primitive" -> "one of the reproducible-
      from-spec primitives the research workpad §5.1 surveyed" with
      explicit note that "strongest" was research-workpad framing,
      not licensed by Nix documentation.
    - nix-flakes.md §4 Fact-link to methodology: removed "strongest
      current level" comparative framing; reframed as "via content-
      addressed inputs + transitive lock + reproducible outputs"
      with the ranking explicitly removed.
    
    MEDIUM cyclonedx overreach -> RESOLVED:
    - cyclonedx-sbom.md §5 final methodology-claim: "directly
      addresses ... rests on CycloneDX-format provenance" ->
      "one primary SBOM option relevant to ... methodology's audit
      posture MAY use CycloneDX-format provenance". Explicit
      acknowledgement that SPDX comparison + NTIA elements + VEX
      are required for full compliance; CycloneDX alone is not
      sufficient.
    
    HIGH check-script vs SPEC contract conflict -> RESOLVED:
    - Corpus SPEC §7.2 (INDEX-driven check script behaviour) updated
      to enumerate three valid status terminals:
      (a) primary-read-complete
      (b) partial WITH deferred-reads note (new — aligns with v1.1
          source-list expansion that introduced legitimate partial
          sources)
      (c) access-blocked WITH alternative or unreachability note
    - Previously the SPEC said only complete or access-blocked
      qualified; the script was correctly more permissive but the
      SPEC text hadn't been updated to match. This commit aligns
      contract + tooling.
    
    Both corpus gate scripts continue to PASS:
    - bash scripts/lint-spec.sh on corpus SPEC -> 0 errors
    - bash scripts/check-corpus-completeness.sh -> PASS 22 (3 partial)

diff --git a/research/primary-sources/cyclonedx-sbom.md b/research/primary-sources/cyclonedx-sbom.md
index a95f798..80b4d07 100644
--- a/research/primary-sources/cyclonedx-sbom.md
+++ b/research/primary-sources/cyclonedx-sbom.md
@@ -50,103 +50,109 @@ methodology_relevance: |
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
-- methodology-claim: "CycloneDX addresses the regulated-
-  environments compliance gap LeadDev's critique
-  identified; methodology's audit posture rests on
-  CycloneDX-format provenance for releases."
+- methodology-claim: "CycloneDX is one primary SBOM option
+  relevant to the regulated-environments compliance gap
+  LeadDev's critique identified; the methodology's audit
+  posture MAY use CycloneDX-format provenance for releases.
+  Full compliance requires comparison against SPDX (§6
+  open question), NTIA minimum elements (§6 open question),
+  and VEX vulnerability handling (§6 open question);
+  CycloneDX alone is not sufficient. Wording softened from
+  'addresses' / 'rests on' per codex Round-3 cyclonedx-
+  overreach finding."
 
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
diff --git a/research/primary-sources/nix-flakes.md b/research/primary-sources/nix-flakes.md
index 85f874d..c12a0a8 100644
--- a/research/primary-sources/nix-flakes.md
+++ b/research/primary-sources/nix-flakes.md
@@ -1,154 +1,163 @@
 ---
 slug: nix-flakes
 source_name: "Nix Flakes — flake.nix + flake.lock"
 primary_url: "https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake"
 fetched_via: "WebFetch"
 fetched_on: 2026-05-19
 fetch_outcome: "primary-read-complete"
 fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
 methodology_relevance: |
-  Nix flakes are research §5.1's "strongest reproducible-
-  from-spec primitive." This corpus entry anchors the
-  flake.nix file structure, the flake.lock content-hash
-  model, and Nix's reproducibility guarantees so the
-  methodology can cite the flake model precisely when
-  prescribing the deployment/ sub-spec's reproducibility
-  contract.
+  Nix flakes are one of the reproducible-from-spec
+  primitives the research workpad §5.1 surveyed. (The
+  research workpad characterised Nix flakes as
+  "strongest"; that comparative ranking is judgment://
+  agent-synthesis not licensed by Nix documentation, so
+  this corpus entry treats Nix as one concrete example
+  rather than the strongest. Wording refined per codex
+  Round-2 + Round-3 findings.) This corpus entry anchors
+  the flake.nix file structure, the flake.lock content-
+  hash model, and Nix's reproducibility guarantees so
+  the methodology can cite the flake model precisely
+  when prescribing the deployment/ sub-spec's
+  reproducibility contract.
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
 
-Nix flakes operationalize "reproducible-from-spec" at the
-strongest current level: content-addressed inputs +
-transitive lock + reproducible outputs. Key shape
+Nix flakes operationalize "reproducible-from-spec" via
+content-addressed inputs + transitive lock + reproducible
+outputs. (Comparative "strongest current level" framing
+removed per codex Round-3 finding — ranking is
+judgment://agent-synthesis not licensed by Nix
+documentation.) Key shape
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
diff --git a/specs/2026-05-19-primary-source-research-corpus/SPEC.md b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
index e53b1b9..651c2d3 100644
--- a/specs/2026-05-19-primary-source-research-corpus/SPEC.md
+++ b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
@@ -265,164 +265,177 @@ paragraph of source text or (b) 200 words. The artefact
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
-6. Exit 0 if every slug in INDEX.md is either
-   `primary-read-complete` or has a documented
-   `access-blocked` (with §6 alternative note); else
-   exit non-zero with diagnostic lines per gap.
+6. Exit 0 if every slug in INDEX.md is one of:
+   (a) `primary-read-complete`, OR
+   (b) `partial` with a documented deferred-reads note
+       in the artefact §6 (the partial status is
+       acceptable iff the artefact discloses what was
+       NOT deep-read; per codex remediation Round 3 the
+       check script enforces this), OR
+   (c) `access-blocked` with a documented alternative-
+       source-found note (or explicit unreachability
+       disclaimer);
+   else exit non-zero with diagnostic lines per gap.
+   (Updated 2026-05-19 to align with the v1.1 source-
+   list expansion which introduced legitimate `partial`
+   sources requiring follow-on deep-reads on
+   sub-pages; previous §7.2 rule allowed only complete
+   or access-blocked which contradicted the v1.1
+   reality.)
 
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
 

codex
The remediation commit did touch exactly the three Round 3 areas: `nix-flakes.md`, `cyclonedx-sbom.md`, and the SPEC’s §7.2 rule. I’m checking whether the mechanical gates and the surrounding contract text agree, not just the lines changed in the commit.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'nl -ba reviews/codex-2026-05-19-round3/02-corpus.md | tail -n 220' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
  4166	reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:218:- §7.G corpus-citation lint extension (Round-1 finding 4.2)
  4167	reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:220:- §2.1 lint impedance is partial-by-design; corpus-mode
  4168	reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:243:- Machine gates (lint, validate-manifest, check-corpus-
  4169	reviews/codex-2026-05-19-round2/03-v2-repack.md:167:  workpad and the spec corpus, not by agent-private memory
  4170	reviews/codex-2026-05-19-round2/03-v2-repack.md:341:  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
  4171	reviews/codex-2026-05-19-round2/03-v2-repack.md:651:`research/primary-sources/<slug>.md` corpus.
  4172	reviews/codex-2026-05-19-round2/03-v2-repack.md:681:methodology's primary-source corpus, and the migration
  4173	reviews/codex-2026-05-19-round2/03-v2-repack.md:789:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  4174	reviews/codex-2026-05-19-round2/03-v2-repack.md:790:  (status: verified) — the primary-source corpus this
  4175	reviews/codex-2026-05-19-round2/03-v2-repack.md:795:Active primary-source citations (corpus-grounded):
  4176	reviews/codex-2026-05-19-round2/03-v2-repack.md:1046:Quality requirements + conformance gates per arc42 §10
  4177	reviews/codex-2026-05-19-round2/03-v2-repack.md:1996:847:   172	  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  4178	reviews/codex-2026-05-19-round2/03-v2-repack.md:2185:5708:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:135:- `file://schema/SPEC.schema.md` — citation grammar,
  4179	reviews/codex-2026-05-19-round2/03-v2-repack.md:2186:5713:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:177:| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
  4180	reviews/codex-2026-05-19-round2/03-v2-repack.md:2187:5714:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:178:| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
  4181	reviews/codex-2026-05-19-round2/03-v2-repack.md:2188:5716:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:188:| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
  4182	reviews/codex-2026-05-19-round2/03-v2-repack.md:2223:6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
  4183	reviews/codex-2026-05-19-round2/03-v2-repack.md:2230:6068:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:172:file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md
  4184	reviews/codex-2026-05-19-round2/03-v2-repack.md:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
  4185	reviews/codex-2026-05-19-round2/03-v2-repack.md:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
  4186	reviews/codex-2026-05-19-round2/03-v2-repack.md:2570:643:| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
  4187	reviews/codex-2026-05-19-round2/03-v2-repack.md:2625:86:  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
  4188	reviews/codex-2026-05-19-round2/03-v2-repack.md:2668:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:33:`research/primary-sources/<slug>.md` corpus.
  4189	reviews/codex-2026-05-19-round2/03-v2-repack.md:2674:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  4190	reviews/codex-2026-05-19-round2/03-v2-repack.md:2744:spec-bundle/skills/spec-review/SKILL.md:51:Per SPEC §10 and SPEC.schema §5:
  4191	reviews/codex-2026-05-19-round2/03-v2-repack.md:2766:spec-bundle/skills/spec-authoring/SKILL.md:217:2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
  4192	reviews/codex-2026-05-19-round2/03-v2-repack.md:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
  4193	reviews/codex-2026-05-19-round2/03-v2-repack.md:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
  4194	reviews/codex-2026-05-19-round2/03-v2-repack.md:3124:    86	  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
  4195	reviews/codex-2026-05-19-round2/03-v2-repack.md:3168:    33	`research/primary-sources/<slug>.md` corpus.
  4196	reviews/codex-2026-05-19-round2/03-v2-repack.md:3198:    63	methodology's primary-source corpus, and the migration
  4197	reviews/codex-2026-05-19-round2/03-v2-repack.md:3357:   641	| `sbom_format` | enum | OPTIONAL | `cyclonedx` \| `spdx` (default `cyclonedx` per the corpus entry `cyclonedx-sbom.md` §3) |
  4198	reviews/codex-2026-05-19-round2/03-v2-repack.md:3359:   643	| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
  4199	reviews/codex-2026-05-19-round2/03-v2-repack.md:3553:lowercase 2119 hits:   1 (advisory only)
  4200	reviews/codex-2026-05-19-round2/03-v2-repack.md:4154:   217	2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
  4201	reviews/codex-2026-05-19-round2/03-v2-repack.md:4155:   218	   authority spec; for SPEC.md it is §10.2 (task), §10.3 (contract),
  4202	reviews/codex-2026-05-19-round2/03-v2-repack.md:4156:   219	   or §10.4 (decision).
  4203	reviews/codex-2026-05-19-round2/03-v2-repack.md:4195:     9	§10, §11.3, §17.3. Shared schema:
  4204	reviews/codex-2026-05-19-round2/03-v2-repack.md:4214:    28	  gate (§10.1) to determine whether the IDEA can transition from
  4205	reviews/codex-2026-05-19-round2/03-v2-repack.md:4237:    51	Per SPEC §10 and SPEC.schema §5:
  4206	reviews/codex-2026-05-19-round2/03-v2-repack.md:4241:    55	| `IDEA.md` | §10.1 IDEA gate | n/a | RECOMMENDED |
  4207	reviews/codex-2026-05-19-round2/03-v2-repack.md:4242:    56	| `SPEC.md` with `type: task` | §10.2 Task gate | `b` (verifiable) | RECOMMENDED |
  4208	reviews/codex-2026-05-19-round2/03-v2-repack.md:4243:    57	| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (the autonomous-dispatch runner-grade) | **REQUIRED** |
  4209	reviews/codex-2026-05-19-round2/03-v2-repack.md:4244:    58	| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |
  4210	reviews/codex-2026-05-19-round2/03-v2-repack.md:4262:    76	- `2` — advisory only; record entries with `severity: advisory`.
  4211	reviews/codex-2026-05-19-round2/03-v2-repack.md:4266:    80	RECOMMENDED. The skill SHOULD run it and record advisory entries;
  4212	reviews/codex-2026-05-19-round2/03-v2-repack.md:4325:   139	    severity: advisory
  4213	reviews/codex-2026-05-19-round2/03-v2-repack.md:4344:   158	  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.
  4214	reviews/codex-2026-05-19-round2/03-v2-repack.md:4363:   177	  if lint_exit == 2: append failure(criterion="lint", severity="advisory", evidence=...)
  4215	reviews/codex-2026-05-19-round2/03-v2-repack.md:4409:   223	  safety. Editorial polish is advisory at most.
  4216	reviews/codex-2026-05-19-round2/03-v2-repack.md:4411:   225	  otherwise passes. Lint exit 2 is advisory.
  4217	reviews/codex-2026-05-19-round2/03-v2-repack.md:4418:   232	  `same-family-review: <model>` and surface it as an `advisory`
  4218	reviews/codex-2026-05-19-round2/03-v2-repack.md:4445:   259	  §10, §11.3, §17.3.
  4219	reviews/codex-2026-05-19-round2/03-v2-repack.md:4487:    10	Note: the canonical research-primary-source corpus lives in
  4220	reviews/codex-2026-05-19-round2/03-v2-repack.md:4648:    86	- The lint exit-2 (advisory) threshold (whether CI
  4221	reviews/codex-2026-05-19-round2/03-v2-repack.md:4684:    29	  Scenario: Lowercase RFC 2119 keyword in normative section is advisory
  4222	reviews/codex-2026-05-19-round2/03-v2-repack.md:4841:   117	Knob: whether the adopter treats lint advisory (exit 2)
  4223	reviews/codex-2026-05-19-round2/03-v2-repack.md:4844:   120	Default: exit 2 is advisory (CI passes; reviewer notes).
  4224	reviews/codex-2026-05-19-round2/03-v2-repack.md:4915:     3	Per arc42 §10 Quality
  4225	reviews/codex-2026-05-19-round2/03-v2-repack.md:5004:    92	Gemini / etc.) runs the §10.3 Contract gate; same-
  4226	reviews/codex-2026-05-19-round2/03-v2-repack.md:5234:    73	  models. Quality scenarios per arc42 §10 are the
  4227	reviews/codex-2026-05-19-round2/03-v2-repack.md:5425:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  4228	
  4229	exec
  4230	/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "Status:|all 20|20 rows|primary-read-complete because|per the §7.2 partial|partial rule|json-schema|cyclonedx-sbom" specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
  4231	 succeeded in 0ms:
  4232	20:Status: Draft v1
  4233	176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
  4234	190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
  4235	191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
  4236	195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
  4237	624:  json-schema).
  4238	626:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
  4239	627:  cyclonedx-sbom), all conforming to §6.2 schema +
  4240	659:  v1.1 fetches added: json-schema + cyclonedx-sbom per
  4241	707:  with deferred-reads notes per the §7.2 partial
  4242	708:  rule; codex remediation §7.D added json-schema +
  4243	709:  cyclonedx-sbom; codex Round-2 added the partial
  4244	722:  structurizr-dsl, json-schema; zero access-blocked)
  4245	753:    primary-read-complete because the load-bearing
  4246	
  4247	exec
  4248	/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba reviews/codex-2026-05-19-round2/00-SYNTHESIS.md | sed -n '70,105p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
  4249	 succeeded in 0ms:
  4250	    70	
  4251	    71	| # | Verdict | Note |
  4252	    72	|---|---|---|
  4253	    73	| 2.1 | PARTIAL | Completion Report now admits the lint gap honestly; no mechanical corpus citation gate exists yet (queued §7.G) |
  4254	    74	| 2.2 | PASS | INDEX status truth fixed for adr-tools-state + structurizr-dsl + json-schema |
  4255	    75	| 2.3 | PASS | json-schema + cyclonedx-sbom added correctly; SOURCE_LIST_VERSION v1.1 |
  4256	    76	| 2.4 | PARTIAL | oci-artifacts §3 now has Artifacts Guidance evidence, but stale "not deep-read" text in §2 + §6 contradicts §3 |
  4257	    77	| 2.5 | PASS | C4 Docker disambiguation correctly downgraded |
  4258	    78	| 2.6 | PARTIAL | §5 scoped to "identified by this project's research", but front-matter still says "only in-the-wild example" globally |
  4259	    79	| 2.7 | PASS | Willison endorsement strength corrected |
  4260	    80	| 2.8 | PARTIAL | §3 labels paraphrase, but §5 still quotes "blindly deploying methodologies verbatim fails" as if exact |
  4261	    81	| 2.9 | FAIL | Caveat added, but unlicensed "strongest current implementation" claim still present in nix-flakes §5 and INDEX summary |
  4262	    82	
  4263	    83	**New findings**:
  4264	    84	
  4265	    85	- **HIGH** scripts/check-corpus-completeness.sh §78: accepts
  4266	    86	  `partial` rows and still prints "all complete", contradicting
  4267	    87	  SPEC §7.2 which says exit 0 only when every slug is
  4268	    88	  `primary-read-complete` or documented `access-blocked`.
  4269	    89	- **MEDIUM** corpus SPEC §619 + §521: Completion Report and
  4270	    90	  AC-4 still say "20 rows" / "all 20 rows at status:
  4271	    91	  primary-read-complete" despite v1.1 expansion to 22 sources
  4272	    92	  with 3 at `partial`.
  4273	    93	- **MEDIUM** cyclonedx-sbom §84 + §121: overreaches with
  4274	    94	  "canonical" and "directly addresses" while §6 admits SPDX
  4275	    95	  needs separate primary comparison.
  4276	    96	
  4277	    97	### 3. v2.0 Repack
  4278	    98	
  4279	    99	Detailed review: [`03-v2-repack.md`](./03-v2-repack.md).
  4280	   100	
  4281	   101	**Remediation verdicts**:
  4282	   102	
  4283	   103	| # | Verdict | Note |
  4284	   104	|---|---|---|
  4285	   105	| 3.1 | RESOLVED | Acceptance commands now all pass |
  4286	
  4287	exec
  4288	/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '110,140p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
  4289	 succeeded in 0ms:
  4290	   110	history.
  4291	   111	
  4292	   112	## 4. Authority Map
  4293	   113	
  4294	   114	Active authority:
  4295	   115	
  4296	   116	- `decision-authority://owner:2026-05-19` — owner directive
  4297	   117	  "okay we should addreess all of these" authorising
  4298	   118	  remediation across all 27 codex findings.
  4299	   119	- Codex cross-family review evidence at
  4300	   120	  `file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
  4301	   121	  + per-target review at
  4302	   122	  `file://../../reviews/codex-2026-05-19/01-parent-decision.md`,
  4303	   123	  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
  4304	   124	  `file://../../reviews/codex-2026-05-19/03-v2-repack.md`,
  4305	   125	  `file://../../reviews/codex-2026-05-19/04-longread.md`.
  4306	   126	- Parent Decision SPEC §10 Reversal Plan triggers <!-- lint-ok: no-citation -->
  4307	   127	  ("External cross-family validation pass surfaces a
  4308	   128	  structural flaw") authorising amendment of the parent
  4309	   129	  Decision via this follow-on Contract. (Section number
  4310	   130	  corrected from §16 to §10 per codex Round-2 advisory
  4311	   131	  finding; §10 is the actual Reversal Plan in the parent
  4312	   132	  SPEC's section numbering.)
  4313	   133	
  4314	   134	Stale, superseded, or evidence-only sources: none specific
  4315	   135	to this Contract.
  4316	   136	
  4317	   137	Owner decisions required before implementation:
  4318	   138	
  4319	   139	- [ ] Approve the seven sub-amendments as a batch
  4320	   140	      (`approved-pending-owner` → `approved` on this
  4321	
  4322	exec
  4323	/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
  4324	 succeeded in 0ms:
  4325	?? reviews/codex-2026-05-19-round3/
  4326	
  4327	codex
  4328	**Quality Gate Result: REQUEST CHANGES**
  4329	
  4330	**Findings**
  4331	
  4332	- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.
  4333	
  4334	- MEDIUM: Completion Report is still stale/internally inconsistent. It now says 22 rows, but later claims partial artefacts are recorded `primary-read-complete` in INDEX, which is false, and it cites a “§7.2 partial rule” that does not exist. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:705), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:745).
  4335	
  4336	- MEDIUM: `cyclonedx-sbom` still overreaches in §5. §4 now correctly says CycloneDX is “one primary SBOM option,” but §5 still says it “addresses” the regulated-environments compliance gap and that audit posture “rests on CycloneDX-format provenance,” while §6 admits SPDX/NTIA/VEX need separate reads. See [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:130), [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:137).
  4337	
  4338	- MEDIUM: `nix-flakes` still carries the unsupported comparative “strongest” framing in front matter and §4, even though §5 and INDEX were softened. See [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:10), [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:85).
  4339	
  4340	**Round-2 Verdicts**
  4341	
  4342	- 2.4 OCI artifacts: RESOLVED. Artifacts Guidance is now deep-read and the guidance/non-spec posture is disclosed.
  4343	- 2.6 Symphony uniqueness: RESOLVED. “Only” is now scoped to this project’s research, not global uniqueness.
  4344	- 2.8 ref-arch paraphrase: RESOLVED. The “blindly deploying” claim is now explicitly marked paraphrase.
  4345	- 2.9 Nix strongest: PARTIALLY RESOLVED. INDEX/§5 fixed; front matter and §4 still overclaim.
  4346	- HIGH check-script semantics: NOT RESOLVED. Script behavior and SPEC contract still conflict.
  4347	- MEDIUM Completion Report stale: PARTIALLY RESOLVED. 20-row text fixed; residual-risk/AC text still stale.
  4348	- MEDIUM cyclonedx overreach: PARTIALLY RESOLVED. §4 fixed; §5 still overclaims.
  4349	- ADVISORY §10/§16: RESOLVED. Remediation SPEC now correctly references parent Decision §10, not §16, at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
  4350	
  4351	**Spot Checks**
  4352	
  4353	`json-schema` honestly discloses partial status and deferred Core/Validation reads. `oci-artifacts`, `symphony-spec`, and `ref-arch-vs-solution-arch` look honest after remediation. `nix-flakes` and `cyclonedx-sbom` still need the overclaim cleanup above.
  4354	
  4355	Checks run read-only: `bash scripts/check-corpus-completeness.sh` passed with `22 sources (3 partial...)`; target SPEC lint passed. No mutations; worktree still only shows pre-existing `?? reviews/codex-2026-05-19-round3/`.
  4356	tokens used
  4357	125,773
  4358	**Quality Gate Result: REQUEST CHANGES**
  4359	
  4360	**Findings**
  4361	
  4362	- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.
  4363	
  4364	- MEDIUM: Completion Report is still stale/internally inconsistent. It now says 22 rows, but later claims partial artefacts are recorded `primary-read-complete` in INDEX, which is false, and it cites a “§7.2 partial rule” that does not exist. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:705), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:745).
  4365	
  4366	- MEDIUM: `cyclonedx-sbom` still overreaches in §5. §4 now correctly says CycloneDX is “one primary SBOM option,” but §5 still says it “addresses” the regulated-environments compliance gap and that audit posture “rests on CycloneDX-format provenance,” while §6 admits SPDX/NTIA/VEX need separate reads. See [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:130), [cyclonedx-sbom.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md:137).
  4367	
  4368	- MEDIUM: `nix-flakes` still carries the unsupported comparative “strongest” framing in front matter and §4, even though §5 and INDEX were softened. See [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:10), [nix-flakes.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:85).
  4369	
  4370	**Round-2 Verdicts**
  4371	
  4372	- 2.4 OCI artifacts: RESOLVED. Artifacts Guidance is now deep-read and the guidance/non-spec posture is disclosed.
  4373	- 2.6 Symphony uniqueness: RESOLVED. “Only” is now scoped to this project’s research, not global uniqueness.
  4374	- 2.8 ref-arch paraphrase: RESOLVED. The “blindly deploying” claim is now explicitly marked paraphrase.
  4375	- 2.9 Nix strongest: PARTIALLY RESOLVED. INDEX/§5 fixed; front matter and §4 still overclaim.
  4376	- HIGH check-script semantics: NOT RESOLVED. Script behavior and SPEC contract still conflict.
  4377	- MEDIUM Completion Report stale: PARTIALLY RESOLVED. 20-row text fixed; residual-risk/AC text still stale.
  4378	- MEDIUM cyclonedx overreach: PARTIALLY RESOLVED. §4 fixed; §5 still overclaims.
  4379	- ADVISORY §10/§16: RESOLVED. Remediation SPEC now correctly references parent Decision §10, not §16, at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
  4380	
  4381	**Spot Checks**
  4382	
  4383	`json-schema` honestly discloses partial status and deferred Core/Validation reads. `oci-artifacts`, `symphony-spec`, and `ref-arch-vs-solution-arch` look honest after remediation. `nix-flakes` and `cyclonedx-sbom` still need the overclaim cleanup above.
  4384	
  4385	Checks run read-only: `bash scripts/check-corpus-completeness.sh` passed with `22 sources (3 partial...)`; target SPEC lint passed. No mutations; worktree still only shows pre-existing `?? reviews/codex-2026-05-19-round3/`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '250,470p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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
   345	6. Exit 0 if every slug in INDEX.md is one of:
   346	   (a) `primary-read-complete`, OR
   347	   (b) `partial` with a documented deferred-reads note
   348	       in the artefact §6 (the partial status is
   349	       acceptable iff the artefact discloses what was
   350	       NOT deep-read; per codex remediation Round 3 the
   351	       check script enforces this), OR
   352	   (c) `access-blocked` with a documented alternative-
   353	       source-found note (or explicit unreachability
   354	       disclaimer);
   355	   else exit non-zero with diagnostic lines per gap.
   356	   (Updated 2026-05-19 to align with the v1.1 source-
   357	   list expansion which introduced legitimate `partial`
   358	   sources requiring follow-on deep-reads on
   359	   sub-pages; previous §7.2 rule allowed only complete
   360	   or access-blocked which contradicted the v1.1
   361	   reality.)
   362	
   363	### 7.3 Corpus citation binding (downstream slices)
   364	
   365	Downstream methodology slices (longread, SPEC bundle)
   366	cite primitives from these sources via
   367	`file://research/primary-sources/<slug>.md §<n>` or by
   368	fully-qualified-URL-with-corpus-anchor
   369	`file://research/primary-sources/<slug>.md` when the
   370	whole entry is the relevance. Agent memory and prior
   371	agent summaries are NOT citable for any claim drawn
   372	from a source in §6.1's scope.
   373	
   374	The lint extension to enforce this binding is out of
   375	scope; it lands as a follow-on Task SPEC. In the
   376	interim, reviewers (cross-family and same-family)
   377	enforce manually.
   378	
   379	## 8. Schema Specification
   380	
   381	### 8.1 Per-source artefact front-matter (formal)
   382	
   383	```yaml
   384	slug:               # string; matches §6.1 row; required
   385	source_name:        # string; required; full source name
   386	primary_url:        # string; required; canonical URL
   387	fetched_via:        # enum: WebFetch | curl | archive.org | manual
   388	fetched_on:         # date: YYYY-MM-DD; required
   389	fetch_outcome:      # enum: primary-read-complete | partial |
   390	                    #       access-blocked
   391	fetch_evidence:     # string; required; one-line digest
   392	supersedes:         # string; optional; slug of prior entry
   393	methodology_relevance: |  # string; multi-line; required
   394	```
   395	
   396	### 8.2 INDEX.md row schema (formal)
   397	
   398	A pipe-delimited markdown table with columns:
   399	
   400	| Slug | Status | Fetched on | Methodology summary |
   401	
   402	Where:
   403	
   404	- `Slug` is a kebab-case identifier matching §6.1.
   405	- `Status` is one of: `primary-read-complete`, `partial`,
   406	  `access-blocked`, `superseded`, `pending`.
   407	- `Fetched on` is `YYYY-MM-DD` or `—` when status is
   408	  `pending`.
   409	- `Methodology summary` is a one-sentence summary.
   410	
   411	## 9. Reference Algorithms
   412	
   413	### 9.1 Completeness check (pseudocode)
   414	
   415	```
   416	function check_corpus_completeness():
   417	  index = read_index_md()
   418	  slugs_in_index = set(row.slug for row in index.rows)
   419	  slugs_in_files = set(basename(f, ".md")
   420	                       for f in glob("research/primary-sources/*.md")
   421	                       if basename(f) != "INDEX.md")
   422	  missing_files = slugs_in_index - slugs_in_files
   423	  orphan_files = slugs_in_files - slugs_in_index
   424	  pending = [row for row in index.rows
   425	             if row.status == "pending"]
   426	  blocked_without_note = [row for row in index.rows
   427	                          if row.status == "access-blocked"
   428	                          and not row_has_access_blocked_note(row)]
   429	  if missing_files or orphan_files or pending or blocked_without_note:
   430	    emit_diagnostics()
   431	    exit 1
   432	  if index.source_list_version != SPEC_FROZEN_VERSION:
   433	    emit_diagnostic("source list drift")
   434	    exit 1
   435	  exit 0
   436	```
   437	
   438	## 10. Failure Model
   439	
   440	### 10.1 Failure classes
   441	
   442	| Class | Trigger | Recovery |
   443	|---|---|---|
   444	| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
   445	| `quote-overrun` | Verbatim §3 quote exceeds the §6.3 fair-use bound | Reviewer rejects the artefact at corpus-completion review; author shortens to compliant excerpt |
   446	| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
   447	| `summary-without-primary` | A claim in INDEX.md's `Methodology summary` column is not anchored by a verbatim quote in the corresponding artefact's §3 | Reviewer rejects; author either anchors the claim or removes it from the summary |
   448	| `slug-collision` | Two artefacts share a slug | Force-fix; one or both renamed; INDEX.md updated |
   449	| `supersession-loop` | Artefact A is `supersedes: B` AND B is `supersedes: A` | Force-fix; the supersession DAG is acyclic |
   450	
   451	### 10.2 Recovery posture
   452	
   453	The corpus is forgiving on form, strict on substance. A
   454	mis-formatted front-matter field is a recoverable bug; a
   455	methodology claim without a primary anchor is a violation
   456	of the owner directive and blocks the methodology body
   457	from landing.
   458	
   459	## 11. Trust Boundary / Security
   460	
   461	### 11.1 Trust boundary
   462	
   463	- The corpus consumes external content fetched from
   464	  third-party URLs. Each fetch is treated as untrusted
   465	  input: the agent (WebFetch / curl) returns content; the
   466	  artefact author extracts text and attributes it; no
   467	  fetched content is executed.
   468	- The fetched URLs themselves are recorded; consumers of
   469	  the corpus can re-fetch and verify.
   470	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/check-corpus-completeness.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/INDEX.md | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '500,780p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
   501	| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
   502	| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
   503	| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
   504	| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
   505	| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
   506	
   507	## 14. Implementation Checklist (Definition of Done)
   508	
   509	- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
   510	      authored, executable, lint clean against shellcheck
   511	      defaults.
   512	- [ ] DoD-2: `research/primary-sources/INDEX.md` authored
   513	      with rows for every §6.1 slug; statuses set
   514	      accurately.
   515	- [ ] DoD-3: Per-source artefact authored at
   516	      `research/primary-sources/<slug>.md` for every §6.1
   517	      slug, conforming to §6.2 schema + §8.1 front-matter.
   518	- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
   519	- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
   520	      through AC-9 all pass.
   521	- [ ] DoD-6: This SPEC's §17 Open Questions are all
   522	      resolved or explicitly deferred to follow-on Task
   523	      SPECs.
   524	
   525	## 15. Acceptance Criteria
   526	
   527	- [x] AC-1: `cmd://bash scripts/lint-spec.sh
   528	      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   529	      exits 0.
   530	- [x] AC-2: `cmd://test -f
   531	      research/primary-sources/INDEX.md` exits 0.
   532	- [x] AC-3: `cmd://test -x
   533	      scripts/check-corpus-completeness.sh` exits 0.
   534	- [x] AC-4: `cmd://bash
   535	      scripts/check-corpus-completeness.sh` exits 0 with
   536	      every §6.1 slug at status
   537	      `primary-read-complete` OR `access-blocked` + note.
   538	- [x] AC-5: Every §6.1 slug has a corresponding
   539	      artefact file under `research/primary-sources/`.
   540	- [x] AC-6: Every artefact's front-matter passes the §8.1
   541	      schema check.
   542	- [x] AC-7: No verbatim §3 quote exceeds the §6.3
   543	      fair-use bound (or, if it does, the source's
   544	      license is recorded as permitting it).
   545	- [x] AC-8: §17 Completion Report records per-source
   546	      fetch outcomes + any access-blocked resolutions.
   547	- [x] AC-9: Cross-family review (BLOCKING per parent
   548	      Decision §7) signs off OR same-family-proxy is
   549	      recorded with the cross-family-deferral rationale.
   550	
   551	## 16. Rollback Plan
   552	
   553	The corpus is append-only; rollback is a directed-graph
   554	problem.
   555	
   556	Triggers for rollback:
   557	
   558	- A fetched primary source is later proven misattributed
   559	  (e.g. the URL we fetched was a spoof; the real source
   560	  contradicts it).
   561	- The source-list version drifts because §6.1 is
   562	  amended (a §6.1 amendment is a Contract SPEC
   563	  amendment under the v1 procedure).
   564	
   565	Exit procedure:
   566	
   567	1. The affected slug's artefact is superseded by a vN
   568	   entry citing the misattribution evidence.
   569	2. INDEX.md row is updated to point to the new vN slug.
   570	3. Downstream methodology slices that cited the
   571	   superseded artefact MUST be re-reviewed against the
   572	   new vN.
   573	
   574	The corpus directory itself never has files deleted;
   575	provenance is preserved.
   576	
   577	## 17. Open Questions
   578	
   579	- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
   580	      Subsequent additions (a new primary source surfaces
   581	      during longread authoring) require a Contract SPEC
   582	      amendment per §16. Default: defer; not a blocker.
   583	- [ ] Q2: The corpus-citation-binding lint extension is
   584	      out of scope; reviewers enforce manually. Whether
   585	      to add the lint extension as a follow-on Task SPEC
   586	      is deferred; recommend yes once the corpus is
   587	      populated and the citation surface is concrete.
   588	- [ ] Q3: Cross-family review for THIS Contract SPEC.
   589	      The parent Decision §7 makes cross-family review
   590	      BLOCKING per slice. Same-family self-review is the
   591	      default fallback; Codex (or other non-Claude) pass
   592	      is the rigorous path. Owner directive applies
   593	      ("base this all in deep research" suggests rigour).
   594	      Default: same-family proxy with explicit caveat
   595	      recorded; if owner directs external cross-family,
   596	      escalate.
   597	- [ ] Q4: Are there primary sources missing from §6.1
   598	      that should land in v1.0? Specifically: SPDX/SBOM
   599	      (CycloneDX), Pact for contract testing, JSON
   600	      Schema (separately from Helm values), CUE
   601	      (configuration language). Defer to owner; not a
   602	      blocker for v1.0 if absent.
   603	
   604	Neither Q1-Q4 is `owner-blocking`; all can land as
   605	follow-on Contract SPEC amendments without re-work of
   606	the corpus already produced.
   607	
   608	## 18. Migration / Coexistence
   609	
   610	The corpus is greenfield; nothing migrates from prior
   611	state. The 2026-05-17 dispositioned research workpad
   612	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   613	remains the upstream record of the field-state survey
   614	that motivated this corpus; it is NOT replaced by the
   615	corpus. The corpus supplements the workpad with
   616	primary-source rigor that the workpad explicitly flagged
   617	as missing (§12 Verification Caveats).
   618	
   619	Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
   620	
   621	- The workpad as the historical synthesis (the
   622	  hypothesis space). <!-- lint-ok: no-citation -->
   623	- The corpus as the primary-source-anchored evidence
   624	  the methodology actually rests on. <!-- lint-ok: no-citation -->
   625	
   626	## 19. Completion Report
   627	
   628	### 19.1 Files changed
   629	
   630	- `scripts/check-corpus-completeness.sh` — mechanical
   631	  corpus-completeness gate (new).
   632	- `research/primary-sources/INDEX.md` — v1.1 corpus
   633	  index (bumped from v1.0 per codex remediation §7.D);
   634	  22 rows total: 19 at status: primary-read-complete, 3
   635	  at status: partial with deferred-reads notes per
   636	  SPEC §7.2 (adr-tools-state, structurizr-dsl,
   637	  json-schema).
   638	- `research/primary-sources/*.md` — 22 per-source
   639	  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   640	  cyclonedx-sbom), all conforming to §6.2 schema +
   641	  §8.1 front-matter:
   642	  - arc42 (architecture documentation)
   643	  - c4-model (architecture model)
   644	  - adr-nygard (foundational ADR)
   645	  - adr-tools-state (state-of-practice ADR)
   646	  - diataxis (documentation taxonomy)
   647	  - 12-factor (cloud-native SaaS methodology)
   648	  - helm-values-schema (customization-affordance)
   649	  - nix-flakes (reproducibility)
   650	  - oci-artifacts (distribution packaging)
   651	  - sigstore-cosign (signing)
   652	  - symphony-spec (operating-model-as-SPEC)
   653	  - spec-kit (spec-as-authoring tool)
   654	  - kiro (agentic IDE)
   655	  - openspec (spec-driven dev tool)
   656	  - oracle-agent-spec (framework-agnostic agent
   657	    description)
   658	  - ref-arch-vs-solution-arch (ownership-split
   659	    precursor)
   660	  - leaddev-agent-compiled (published risk critique)
   661	  - cucumber-gherkin (executable behavior spec)
   662	  - openapi-3-1 (HTTP API contract)
   663	  - structurizr-dsl (architecture-as-code)
   664	- This SPEC's §15 Acceptance Criteria checkboxes
   665	  flipped to checked.
   666	
   667	### 19.2 Commands run
   668	
   669	- 25 `cmd://WebFetch` invocations across the 22 sources
   670	  (some sources required supplementary fetches; one
   671	  redirect was followed from nixos.org to nix.dev; 2
   672	  v1.1 fetches added: json-schema + cyclonedx-sbom per
   673	  codex remediation §7.D).
   674	- `cmd://bash scripts/lint-spec.sh
   675	  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   676	  — exit 0 (0 errors, 0 warnings, 47 citation hits).
   677	- `cmd://bash scripts/check-corpus-completeness.sh` —
   678	  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
   679	- Per-artefact `cmd://bash scripts/lint-spec.sh
   680	  research/primary-sources/<slug>.md` — exit 1 on each.
   681	  Two issue classes:
   682	  1. Front-matter shape: corpus artefacts use `slug:`
   683	     not `type:`, so lint reports "missing
   684	     type/implies_spec_type field" + "missing required
   685	     section: ##". These are misapplied checks — the
   686	     lint script is designed for SPEC artefacts.
   687	  2. Uncited-claim: 18 of 22 artefacts have
   688	     `fact-bearing paragraph lacks citation prefix`
   689	     errors in §4 / §5 / §6 — meta-commentary bullets
   690	     that reference §3 by section but lack an inline
   691	     prefix the script's paragraph scanner recognises.
   692	  **Cross-family review (codex finding 2.1) correctly
   693	  identified this as a hack**: SPEC §7.1 says
   694	  uncited-claim is BLOCKING on corpus artefacts, but
   695	  these failures were waved off as front-matter noise.
   696	  The honest reading is that the current lint is not
   697	  fit-for-purpose on corpus artefacts and the in-place
   698	  enforcement gap is a follow-on Task SPEC for a
   699	  corpus-mode lint extension (or a separate
   700	  `scripts/validate-corpus-citations.sh` script that
   701	  applies only the uncited-claim subset of the
   702	  citation grammar to corpus artefacts). Until that
   703	  Task SPEC executes, `check-corpus-completeness.sh`
   704	  is the authoritative mechanical gate and per-artefact
   705	  citation density is reviewer-enforced. The corpus
   706	  artefacts authored under this SPEC ARE densely cited
   707	  (17+ citation prefixes per artefact), but the
   708	  mechanical claim that uncited-claim is blocking
   709	  cannot currently be verified by the script.
   710	
   711	### 19.3 Verification result
   712	
   713	PASS. All §15 ACs met:
   714	
   715	- AC-1: SPEC.md lint clean (exit 0).
   716	- AC-2: INDEX.md present.
   717	- AC-3: check-corpus-completeness.sh present + executable.
   718	- AC-4: check-corpus-completeness.sh exits 0; 22
   719	  slugs total (19 primary-read-complete + 3 partial
   720	  with deferred-reads notes per the §7.2 partial
   721	  rule; codex remediation §7.D added json-schema +
   722	  cyclonedx-sbom; codex Round-2 added the partial
   723	  status-truth check to the script).
   724	- AC-5: every §6.1 slug has corresponding `<slug>.md`
   725	  artefact.
   726	- AC-6: every artefact's front-matter conforms to
   727	  §8.1 schema (manual review).
   728	- AC-7: no verbatim §3 quote exceeds the 200-word
   729	  fair-use bound (manual review; longest excerpts are
   730	  the 18-section Symphony list and 12-factor's 12
   731	  named factors, both well under bound).
   732	- AC-8: this Completion Report records the per-source
   733	  fetch outcomes (19 primary-read-complete + 3 partial
   734	  with deferred-reads notes — adr-tools-state,
   735	  structurizr-dsl, json-schema; zero access-blocked)
   736	  and the source-list discoveries (Kiro Bedrock binding
   737	  NOT confirmed by primary read; was an inferred
   738	  binding in the prior research workpad).
   739	- AC-9: cross-family review deferred. Same-family
   740	  self-review performed; advisory recorded. Owner
   741	  directive 2026-05-18 ("base this all in deep
   742	  research, not make up bullshit") was the rigour bar;
   743	  the corpus's verbatim-quote anchoring is the
   744	  primary discharge of that obligation, with
   745	  cross-family review as a secondary check that can
   746	  land before downstream slices.
   747	
   748	### 19.4 Residual risk
   749	
   750	- **Per-artefact lint mismatch**: the lint script
   751	  treats corpus artefacts as malformed SPECs (missing
   752	  `type:` field; missing standard SPEC sections). Per
   753	  §7.1, this is advisory; the corpus-completeness
   754	  check is the authoritative gate. If future lint
   755	  evolution adds corpus-mode, the per-artefact lint
   756	  warnings disappear; meanwhile they are documented
   757	  noise.
   758	- **Three artefacts fetched as `partial` material but
   759	  recorded `primary-read-complete` because the
   760	  primary URL returned substantive content**:
   761	  - `structurizr-dsl` — root page returned definition
   762	    + C4-implementation framing; deep syntax (workspace
   763	    / model / views keywords) was navigation-only on
   764	    the fetched page. Fetch outcome marked `partial`
   765	    in the artefact's front-matter; INDEX row still
   766	    primary-read-complete because the load-bearing
   767	    methodology claims (DSL purpose, architecture-as-
   768	    code posture, C4 implementation) were anchored.
   769	  - `adr-tools-state` — root page returned community
   770	    framing + template-family references but deep
   771	    template specifics + CLI conventions live on
   772	    sub-pages not fetched. Outcome `partial` in
   773	    front-matter, `primary-read-complete` in INDEX —
   774	    sub-pages are queued as open questions for
   775	    follow-on supplementary fetches if the methodology
   776	    mandates specific ADR templates.
   777	- **Kiro Bedrock binding correction**: prior summary
   778	  in the research workpad characterised Kiro as
   779	  "Bedrock-tethered"; the homepage primary read did
   780	  NOT confirm this. The artefact records the

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
    10	  Nix flakes are one of the reproducible-from-spec
    11	  primitives the research workpad §5.1 surveyed. (The
    12	  research workpad characterised Nix flakes as
    13	  "strongest"; that comparative ranking is judgment://
    14	  agent-synthesis not licensed by Nix documentation, so
    15	  this corpus entry treats Nix as one concrete example
    16	  rather than the strongest. Wording refined per codex
    17	  Round-2 + Round-3 findings.) This corpus entry anchors
    18	  the flake.nix file structure, the flake.lock content-
    19	  hash model, and Nix's reproducibility guarantees so
    20	  the methodology can cite the flake model precisely
    21	  when prescribing the deployment/ sub-spec's
    22	  reproducibility contract.
    23	---
    24	
    25	# Nix Flakes
    26	
    27	## 1. Source identity
    28	
    29	- Name: Nix flakes — the unit for packaging Nix code
    30	  reproducibly.
    31	- Canonical URL: `url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
    32	  (note: the older `url://nixos.org/manual/...` redirects
    33	  to nix.dev as of fetch date).
    34	- Specification authority: NixOS RFCs (RFC 49 for flakes
    35	  proposal); current implementation in `nix` CLI.
    36	
    37	## 2. Fetch trace
    38	
    39	- `cmd://WebFetch url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake`
    40	  — 2026-05-19; returned 302 redirect to nix.dev.
    41	- `cmd://WebFetch url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
    42	  — 2026-05-19; primary read; returned flake definition,
    43	  flake.nix structure, flake.lock semantics, repro
    44	  guarantees.
    45	
    46	## 3. Verbatim claims this corpus depends on
    47	
    48	- **Flake definition**: a flake is "a filesystem tree
    49	  (typically fetched from a Git repository or a tarball)
    50	  that contains a file named `flake.nix` in the root
    51	  directory." (`url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`)
    52	
    53	- **flake.nix attributes**:
    54	  - `inputs` — an attrset specifying dependencies,
    55	    mapping input names to flake references. "Each input
    56	    is fetched, evaluated and passed to the `outputs`
    57	    function as a set of attributes with the same name
    58	    as the corresponding input."
    59	  - `outputs` — a function receiving an attribute set of
    60	    input flake outputs, returning Nix values the flake
    61	    provides.
    62	  - `description` — one-line summary.
    63	
    64	- **Per-input metadata** passed to `outputs`:
    65	  - `outPath` — store path of the source tree.
    66	  - `rev` — commit hash if applicable.
    67	  - `lastModified` — commit time, seconds since epoch.
    68	  - `narHash` — SHA-256 hash in SRI format.
    69	
    70	- **flake.lock** is "a UTF-8 JSON file" containing "a
    71	  graph structure isomorphic to the graph of
    72	  dependencies of the root flake." Per-node fields:
    73	  - `inputs` — dependency mappings.
    74	  - `original` — unlocked specification from flake.nix.
    75	  - `locked` — resolved specification with exact
    76	    revision and `narHash`.
    77	  - `flake` — boolean (flake vs non-flake dep).
    78	
    79	- **Reproducibility guarantee**: Nix automatically
    80	  generates and maintains flake.lock. Locked
    81	  specifications contain exact revisions and content
    82	  hashes. "When we build this flake, the input
    83	  `nixpkgs` is mapped to revision [specific hash]."
    84	  Furthermore: "lock files transitively lock direct as
    85	  well as indirect dependencies."
    86	
    87	## 4. Fact-link to methodology
    88	
    89	<!-- lint-ok: no-citation -->
    90	
    91	Nix flakes operationalize "reproducible-from-spec" via
    92	content-addressed inputs + transitive lock + reproducible
    93	outputs. (Comparative "strongest current level" framing
    94	removed per codex Round-3 finding — ranking is
    95	judgment://agent-synthesis not licensed by Nix
    96	documentation.) Key shape
    97	implications for the methodology's deployment/ sub-spec:
    98	
    99	- The deployment/ sub-spec MAY adopt a flake-style
   100	  inputs/outputs structure as the contract shape: inputs
   101	  are the declared dependencies (the spec's deferral
   102	  contract); outputs are the materialized deployment
   103	  artefacts.
   104	- The flake.lock content-hash model is a strong
   105	  primitive for "two installs produce the same build
   106	  outputs"; the methodology's equivalence-classes open
   107	  question (research §2.3.5) can cite Nix as one
   108	  concrete example of equivalence-by-construction. (The
   109	  claim that Nix is "the strongest" reproducibility
   110	  primitive in the field is a comparative
   111	  `judgment://agent-synthesis`, not licensed by Nix's
   112	  own documentation; methodology prose should frame Nix
   113	  as "an example" rather than "the strongest" without
   114	  separate comparative evidence.)
   115	- The transitive-lock property — every direct and
   116	  indirect dependency pinned — is the methodology's
   117	  posture for the SPEC bundle's manifest: every cited
   118	  sub-spec is pinned by content hash, not version range.
   119	
   120	## 5. Downstream-citation surface
   121	
   122	<!-- lint-ok: no-citation -->
   123	
   124	Methodology claims licensed by this entry (cite as
   125	`file://research/primary-sources/nix-flakes.md §3`):
   126	
   127	- methodology-claim: "Nix flakes ship a two-file model:
   128	  flake.nix (declarative inputs + outputs) and flake.lock
   129	  (resolved + content-hashed dependency graph)."
   130	- methodology-claim: "flake.lock provides transitive
   131	  pin-by-content-hash; rebuild reproducibility holds
   132	  across direct and indirect dependencies."
   133	- methodology-claim: "Nix's reproducibility model is one
   134	  concrete implementation of build-from-spec; the
   135	  methodology cites it as an example of equivalence-
   136	  class-by-construction. (Earlier 'strongest current
   137	  implementation' framing removed per codex Round-2
   138	  finding 2.9 FAIL — comparative ranking is
   139	  judgment://agent-synthesis not licensed by Nix
   140	  documentation; the §4 caveat is now reflected here
   141	  for consistency.)"
   142	- methodology-claim: "The methodology's deployment/
   143	  sub-spec MAY mirror flake's inputs/outputs shape,
   144	  treating inputs as the deferral contract and outputs
   145	  as the deployment artefact set."
   146	
   147	## 6. Open questions surfaced by the primary read
   148	
   149	- Nix flakes are still officially "experimental" in
   150	  stable Nix releases; the methodology should
   151	  acknowledge this when prescribing flake-style inputs/
   152	  outputs as a deployment-spec shape.
   153	- Whether Nix's content-hash reproducibility generalises
   154	  to non-Nix language ecosystems (Helm? OCI? container
   155	  images built outside Nix?) is an open methodology
   156	  question. The methodology MAY recommend Nix-like
   157	  reproducibility WITHOUT mandating Nix as the
   158	  underlying substrate.
   159	- The relationship between flake.lock and OCI image
   160	  content-addressing is a useful methodology comparison
   161	  point — Nix has filesystem-tree hashes; OCI has
   162	  layer-digest hashes. Different content addressing
   163	  models with similar reproducibility guarantees.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/cyclonedx-sbom.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
   130	- methodology-claim: "CycloneDX is one primary SBOM option
   131	  relevant to the regulated-environments compliance gap
   132	  LeadDev's critique identified; the methodology's audit
   133	  posture MAY use CycloneDX-format provenance for releases.
   134	  Full compliance requires comparison against SPDX (§6
   135	  open question), NTIA minimum elements (§6 open question),
   136	  and VEX vulnerability handling (§6 open question);
   137	  CycloneDX alone is not sufficient. Wording softened from
   138	  'addresses' / 'rests on' per codex Round-3 cyclonedx-
   139	  overreach finding."
   140	
   141	## 6. Open questions surfaced by the primary read
   142	
   143	- SPDX is the other major SBOM format
   144	  (`url://spdx.dev/`); the methodology should
   145	  acknowledge it as an alternative and document why
   146	  CycloneDX is the recommended default (e.g.
   147	  finer-grained vulnerability handling, OWASP backing,
   148	  ECMA standardisation) — but a separate primary read
   149	  of SPDX is needed to do that justly.
   150	- NTIA minimum SBOM elements are referenced by some
   151	  CycloneDX adopters but the overview page does not
   152	  enumerate them; methodology compliance claims
   153	  against NTIA need a separate primary source.
   154	- Vulnerability Exploitability eXchange (VEX) is
   155	  related to CycloneDX vulnerability handling; if the
   156	  methodology covers vulnerability disclosure under
   157	  spec-as-distribution, VEX is a separate corpus
   158	  candidate.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "strongest|only in-the-wild|blindly deploying|canonical|directly addresses|rests on|all 20|20 rows|partial rule|primary-read-complete because|partial" specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
specs/2026-05-19-primary-source-research-corpus/SPEC.md:216:fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:228:1. **§1 Source identity** — name, canonical URL,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:341:   `primary-read-complete | partial | access-blocked |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:347:   (b) `partial` with a documented deferred-reads note
specs/2026-05-19-primary-source-research-corpus/SPEC.md:348:       in the artefact §6 (the partial status is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:357:   list expansion which introduced legitimate `partial`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:386:primary_url:        # string; required; canonical URL
specs/2026-05-19-primary-source-research-corpus/SPEC.md:389:fetch_outcome:      # enum: primary-read-complete | partial |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:405:- `Status` is one of: `primary-read-complete`, `partial`,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:502:| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:624:  the methodology actually rests on. <!-- lint-ok: no-citation -->
specs/2026-05-19-primary-source-research-corpus/SPEC.md:635:  at status: partial with deferred-reads notes per
specs/2026-05-19-primary-source-research-corpus/SPEC.md:678:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:719:  slugs total (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:720:  with deferred-reads notes per the §7.2 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:722:  cyclonedx-sbom; codex Round-2 added the partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:733:  fetch outcomes (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:758:- **Three artefacts fetched as `partial` material but
specs/2026-05-19-primary-source-research-corpus/SPEC.md:764:    the fetched page. Fetch outcome marked `partial`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:766:    primary-read-complete because the load-bearing
specs/2026-05-19-primary-source-research-corpus/SPEC.md:772:    sub-pages not fetched. Outcome `partial` in
research/primary-sources/cyclonedx-sbom.md:89:  "canonical" framing was reduced to "primary option"
research/primary-sources/cyclonedx-sbom.md:138:  'addresses' / 'rests on' per codex Round-3 cyclonedx-
research/primary-sources/nix-flakes.md:8:fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
research/primary-sources/nix-flakes.md:13:  "strongest"; that comparative ranking is judgment://
research/primary-sources/nix-flakes.md:16:  rather than the strongest. Wording refined per codex
research/primary-sources/nix-flakes.md:93:outputs. (Comparative "strongest current level" framing
research/primary-sources/nix-flakes.md:109:  claim that Nix is "the strongest" reproducibility
research/primary-sources/nix-flakes.md:113:  as "an example" rather than "the strongest" without
research/primary-sources/nix-flakes.md:136:  class-by-construction. (Earlier 'strongest current
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
research/primary-sources/cucumber-gherkin.md:126:  pin English as the canonical Gherkin language for
research/primary-sources/cucumber-gherkin.md:129:- Cucumber as the canonical runner is not the only
research/primary-sources/ref-arch-vs-solution-arch.md:80:  summary, not exact source wording; the canonical
research/primary-sources/ref-arch-vs-solution-arch.md:135:  observation (paraphrased: blindly deploying
research/primary-sources/ref-arch-vs-solution-arch.md:137:  case for <!-- "blindly deploying" is paraphrase per §3, not verbatim source quote (codex Round-2 finding 2.8) -->
research/primary-sources/adr-tools-state.md:7:fetch_outcome: "partial"
research/primary-sources/json-schema.md:7:fetch_outcome: "partial"
research/primary-sources/json-schema.md:38:- Status `partial`: deep reads of the Core draft and
research/primary-sources/json-schema.md:114:  `partial`).
research/primary-sources/12-factor.md:15:  description, the canonical factor list, and the Config
research/primary-sources/structurizr-dsl.md:7:fetch_outcome: "partial"
research/primary-sources/structurizr-dsl.md:85:  sub-spec MAY ship .dsl files as the canonical

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '748,825p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   748	### 19.4 Residual risk
   749	
   750	- **Per-artefact lint mismatch**: the lint script
   751	  treats corpus artefacts as malformed SPECs (missing
   752	  `type:` field; missing standard SPEC sections). Per
   753	  §7.1, this is advisory; the corpus-completeness
   754	  check is the authoritative gate. If future lint
   755	  evolution adds corpus-mode, the per-artefact lint
   756	  warnings disappear; meanwhile they are documented
   757	  noise.
   758	- **Three artefacts fetched as `partial` material but
   759	  recorded `primary-read-complete` because the
   760	  primary URL returned substantive content**:
   761	  - `structurizr-dsl` — root page returned definition
   762	    + C4-implementation framing; deep syntax (workspace
   763	    / model / views keywords) was navigation-only on
   764	    the fetched page. Fetch outcome marked `partial`
   765	    in the artefact's front-matter; INDEX row still
   766	    primary-read-complete because the load-bearing
   767	    methodology claims (DSL purpose, architecture-as-
   768	    code posture, C4 implementation) were anchored.
   769	  - `adr-tools-state` — root page returned community
   770	    framing + template-family references but deep
   771	    template specifics + CLI conventions live on
   772	    sub-pages not fetched. Outcome `partial` in
   773	    front-matter, `primary-read-complete` in INDEX —
   774	    sub-pages are queued as open questions for
   775	    follow-on supplementary fetches if the methodology
   776	    mandates specific ADR templates.
   777	- **Kiro Bedrock binding correction**: prior summary
   778	  in the research workpad characterised Kiro as
   779	  "Bedrock-tethered"; the homepage primary read did
   780	  NOT confirm this. The artefact records the
   781	  correction in §4 Fact-link to methodology. The
   782	  methodology's published characterisation of Kiro
   783	  MUST cite the primary read, not the prior summary.
   784	- **The seven open research questions remain
   785	  unresolved**. This corpus closes the
   786	  primary-source-grounding gap (the methodology can
   787	  now cite arc42, C4, ADRs, etc. accurately) but does
   788	  not resolve the seven open questions from the
   789	  research workpad §2.3 (exhaustiveness vs.
   790	  prescription boundary; ambiguity handling; patching
   791	  semantics; install-matches-intent verification;
   792	  equivalence classes; capability floor; adversarial
   793	  consumption). Those remain published-as-flagged-open
   794	  per parent Decision §7.
   795	
   796	### 19.5 Spec evidence candidates
   797	
   798	- **Primary-read corpus pattern**: structured per-source
   799	  artefacts with verbatim claims, fetch trace, gap from
   800	  prior summary, downstream-citation surface, open
   801	  questions are a robust corpus shape for any
   802	  methodology that must ground claims in external
   803	  sources. Capture as a reusable pattern under the
   804	  `spec-evidence-governance` skill: "when the
   805	  methodology depends on external sources, a
   806	  primary-source corpus is the citable foundation —
   807	  agent summaries are not sufficient."
   808	- **Lint-vs-corpus impedance**: the SPEC's lint script
   809	  is designed for IDEA/SPEC artefacts; corpus
   810	  artefacts (with `slug:` front-matter and §
   811	  structure tuned to source characterisation) trigger
   812	  spurious lint errors. Two paths: (a) extend
   813	  lint-spec.sh with a corpus-mode (out of scope here);
   814	  (b) accept lint as advisory for corpus per the
   815	  SPEC's own §7.1 affordance. We took (b). Capture as
   816	  spec-evidence for future linter design: lints should
   817	  treat front-matter discriminator as the
   818	  artefact-type signal and apply mode-appropriate
   819	  checks rather than assuming SPEC shape.
   820	- **Verbatim-quote bounded excerpts are practical**:
   821	  the 200-word fair-use bound (§6.3) proved easy to
   822	  honour; the longest excerpts in the corpus
   823	  (Symphony's 18-section list, 12-factor's 12 factor
   824	  names) are well under bound and the artefact's
   825	  Methodology-relevance + Fact-link sections do the

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/adr-tools-state.md | sed -n '1,160p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/structurizr-dsl.md | sed -n '1,160p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/json-schema.md | sed -n '1,170p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

codex
The main Round 3 fixes now look present, but I found stale acceptance/completion text adjacent to the fixed §7.2. I’m running the declared gates now so the result separates “mechanically passes” from “review still has consistency findings.”
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f research/primary-sources/INDEX.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
## main...origin/main
?? reviews/codex-2026-05-19-round4/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
check-corpus-completeness: PASS — 22 sources (3 partial with deferred-reads notes)

 succeeded in 938ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-primary-source-research-corpus/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  55
lowercase 2119 hits:   7 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"v1\\.0|v1\\.1|SPDX|CycloneDX|JSON Schema|json-schema|cyclonedx\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
85:- Repacking Product A v1.1 into manifest+catalog v2.0
146:      for v1.0; subsequent additions land as follow-on
166:### 6.1 In-scope sources (v1.0)
176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
193:`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
196:baseline. Two further candidates flagged but NOT v1.1
278:Source-list version: v1.0
356:   (Updated 2026-05-19 to align with the v1.1 source-
360:   or access-blocked which contradicted the v1.1
579:- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
598:      that should land in v1.0? Specifically: SPDX/SBOM
599:      (CycloneDX), Pact for contract testing, JSON
602:      blocker for v1.0 if absent.
632:- `research/primary-sources/INDEX.md` — v1.1 corpus
633:  index (bumped from v1.0 per codex remediation §7.D);
637:  json-schema).
639:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
640:  cyclonedx-sbom), all conforming to §6.2 schema +
672:  v1.1 fetches added: json-schema + cyclonedx-sbom per
678:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
721:  rule; codex remediation §7.D added json-schema +
722:  cyclonedx-sbom; codex Round-2 added the partial
735:  structurizr-dsl, json-schema; zero access-blocked)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "only|strongest|canonical|directly|rests on|global|unique|verbatim|paraphrase|compliance" research/primary-sources/*.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/json-schema.md:13:  knob declarations against JSON Schema directly; citing
research/primary-sources/json-schema.md:82:adopts JSON Schema directly for its `knobs.schema.json`
research/primary-sources/json-schema.md:117:  adopter tooling commonly pins older drafts, so the
research/primary-sources/structurizr-dsl.md:85:  sub-spec MAY ship .dsl files as the canonical
research/primary-sources/structurizr-dsl.md:96:  keywords) was not deep-read in this pass — only the
research/primary-sources/symphony-spec.md:8:fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
research/primary-sources/symphony-spec.md:10:  Symphony's SPEC.md is the only example of
research/primary-sources/symphony-spec.md:14:  (Note: the "only" framing is project-research-scoped,
research/primary-sources/symphony-spec.md:15:  not a globally-licensed uniqueness claim — fixed per
research/primary-sources/symphony-spec.md:17:  SPEC.md does not assert global uniqueness.) This corpus
research/primary-sources/symphony-spec.md:76:  - **Extension Conformance**: "Required only for
research/primary-sources/symphony-spec.md:126:- methodology-claim: "Symphony's SPEC.md is the only
research/primary-sources/symphony-spec.md:132:  §3. Symphony's own SPEC.md does not assert global
research/primary-sources/symphony-spec.md:133:  uniqueness; the global-uniqueness claim is research-
research/primary-sources/symphony-spec.md:141:  pre-production checks) is the most directly portable
research/primary-sources/spec-kit.md:8:fetch_evidence: "fetched github/spec-kit repository README; six-command lifecycle + artefact set + posture verbatim"
research/primary-sources/spec-kit.md:44:- **Spec-Driven Development thesis** (verbatim):
research/primary-sources/spec-kit.md:47:  become executable, directly generating working
research/primary-sources/spec-kit.md:143:  team consumption (vs in-team authoring only) is
research/primary-sources/sigstore-cosign.md:8:fetch_evidence: "fetched Sigstore docs root; Fulcio + Rekor + cosign architecture and keyless model verbatim"
research/primary-sources/sigstore-cosign.md:52:- **Rekor**: "an immutable, append-only ledger" that
research/primary-sources/sigstore-cosign.md:113:  only transparency log), and cosign (the signing
research/primary-sources/diataxis.md:8:fetch_evidence: "fetched diataxis.fr/ + diataxis.fr/start-here/; four-mode taxonomy + two-axis structure confirmed verbatim"
research/primary-sources/diataxis.md:15:  four modes verbatim and the two-axis structure
research/primary-sources/diataxis.md:39:  2026-05-19; returned per-mode verbatim definitions +
research/primary-sources/diataxis.md:53:  - **Tutorials** — verbatim: "A tutorial is a lesson,
research/primary-sources/diataxis.md:58:  - **How-to guides** — verbatim: "A how-to guide
research/primary-sources/diataxis.md:62:  - **Reference** — verbatim: "Reference guides contain
research/primary-sources/diataxis.md:67:  - **Explanation** — verbatim: "Explanatory guides
research/primary-sources/diataxis.md:99:- The four-mode taxonomy is anchored verbatim with <!-- lint-ok: no-citation -->
research/primary-sources/diataxis.md:100:  source-provided definitions, not paraphrased.
research/primary-sources/diataxis.md:148:  doesn't directly model.
research/primary-sources/cyclonedx-sbom.md:8:fetch_evidence: "fetched cyclonedx.org specification overview; definition + SBOM contents + format enumeration + supply-chain framing confirmed verbatim"
research/primary-sources/cyclonedx-sbom.md:17:  needs an SBOM anchor for the methodology's compliance
research/primary-sources/cyclonedx-sbom.md:73:  management and license compliance to cryptographic
research/primary-sources/cyclonedx-sbom.md:89:  "canonical" framing was reduced to "primary option"
research/primary-sources/cyclonedx-sbom.md:93:  §3) raised regulated-environments compliance as a
research/primary-sources/cyclonedx-sbom.md:95:  relevant to that compliance gap. ("Directly addresses"
research/primary-sources/cyclonedx-sbom.md:97:  on cyclonedx overreach — full compliance requires more
research/primary-sources/cyclonedx-sbom.md:131:  relevant to the regulated-environments compliance gap
research/primary-sources/cyclonedx-sbom.md:134:  Full compliance requires comparison against SPDX (§6
research/primary-sources/cyclonedx-sbom.md:138:  'addresses' / 'rests on' per codex Round-3 cyclonedx-
research/primary-sources/cyclonedx-sbom.md:152:  enumerate them; methodology compliance claims
research/primary-sources/ref-arch-vs-solution-arch.md:8:fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
research/primary-sources/ref-arch-vs-solution-arch.md:31:  SAFe, LeSS, or Disciplined Agile Delivery verbatim.
research/primary-sources/ref-arch-vs-solution-arch.md:48:  contrasted directly with the universal nature of
research/primary-sources/ref-arch-vs-solution-arch.md:51:- **Posture distinction (verbatim framing)**:
research/primary-sources/ref-arch-vs-solution-arch.md:60:- **Underlying thesis** (paraphrased from Cottmeyer, not
research/primary-sources/ref-arch-vs-solution-arch.md:61:  verbatim): the original article frames the underlying
research/primary-sources/ref-arch-vs-solution-arch.md:66:  is a near-paraphrase based on the WebFetch summary —
research/primary-sources/ref-arch-vs-solution-arch.md:67:  treat as paraphrase unless the exact source wording is
research/primary-sources/ref-arch-vs-solution-arch.md:70:- **Consulting context** (paraphrased from Cottmeyer):
research/primary-sources/ref-arch-vs-solution-arch.md:75:  deploying methodologies verbatim fails, but
research/primary-sources/ref-arch-vs-solution-arch.md:79:  (Both sentences are paraphrase based on the WebFetch
research/primary-sources/ref-arch-vs-solution-arch.md:80:  summary, not exact source wording; the canonical
research/primary-sources/ref-arch-vs-solution-arch.md:87:Cottmeyer's distinction maps directly onto the
research/primary-sources/ref-arch-vs-solution-arch.md:135:  observation (paraphrased: blindly deploying
research/primary-sources/ref-arch-vs-solution-arch.md:136:  methodologies verbatim fails) — is the methodology's
research/primary-sources/ref-arch-vs-solution-arch.md:137:  case for <!-- "blindly deploying" is paraphrase per §3, not verbatim source quote (codex Round-2 finding 2.8) -->
research/primary-sources/oracle-agent-spec.md:8:fetch_evidence: "fetched oracle/agent-spec README; framework-agnostic declarative language definition + JSON/YAML serialization + multi-SDK conformance verbatim"
research/primary-sources/oracle-agent-spec.md:41:- **Scope** (verbatim): Agent Spec "defines building
research/primary-sources/cucumber-gherkin.md:8:fetch_evidence: "fetched cucumber.io gherkin reference; Given/When/Then + Feature/Scenario/Background structure + executable-spec characterisation verbatim"
research/primary-sources/cucumber-gherkin.md:126:  pin English as the canonical Gherkin language for
research/primary-sources/cucumber-gherkin.md:129:- Cucumber as the canonical runner is not the only
research/primary-sources/c4-model.md:8:fetch_evidence: "fetched c4model.com/ + c4model.com/abstractions; four-level hierarchy confirmed verbatim; notation+tooling independence confirmed"
research/primary-sources/c4-model.md:14:  abstractions verbatim, the notation-independence
research/primary-sources/c4-model.md:93:- The exact four-level hierarchy is now anchored verbatim, <!-- lint-ok: no-citation -->
research/primary-sources/c4-model.md:94:  not paraphrased.
research/primary-sources/c4-model.md:100:- The "Container" disambiguation was NOT found verbatim <!-- lint-ok: no-citation -->
research/primary-sources/c4-model.md:126:  citing that page directly." <!-- lint-ok: no-citation -->
research/primary-sources/c4-model.md:138:  may yield the verbatim disambiguation. The methodology's
research/primary-sources/openspec.md:8:fetch_evidence: "fetched Fission-AI/OpenSpec README; three-command workflow + artefact set + lighter-than-Spec-Kit posture verbatim"
research/primary-sources/openspec.md:41:- **Philosophy** (verbatim): "fluid not rigid →
research/primary-sources/openapi-3-1.md:8:fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
research/primary-sources/openapi-3-1.md:64:- **JSON Schema relationship** (verbatim): "Data types
research/primary-sources/openapi-3-1.md:70:- **Multi-document support** (verbatim): "An OpenAPI
research/primary-sources/openapi-3-1.md:75:- **Interface vs implementation** (verbatim): "the API
research/primary-sources/openapi-3-1.md:90:  behavior contract, not only HTTP. OpenAPI is one of
research/primary-sources/adr-tools-state.md:15:  practice rather than locking only on Nygard.
research/primary-sources/adr-tools-state.md:68:template is foundational but no longer the only option.
research/primary-sources/arc42.md:69:- **Section 1.0 (Introduction and Goals)** — verbatim:
research/primary-sources/arc42.md:74:- **Section 1.2 (Quality Goals)** — verbatim: "The top
research/primary-sources/arc42.md:93:  by name and position (not paraphrased).
research/primary-sources/arc42.md:95:  communication and documentation") is anchored verbatim
research/primary-sources/oci-artifacts.md:8:fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
research/primary-sources/oci-artifacts.md:31:  remediation finding 2.4; verbatim quotes incorporated in
research/primary-sources/oci-artifacts.md:77:    not a formal specification; the only explicit
research/primary-sources/oci-artifacts.md:81:    packaging, only prescriptive guidance about media-
research/primary-sources/oci-artifacts.md:98:  bundle MAPS directly onto OCI: the manifest is the
research/primary-sources/adr-nygard.md:8:fetch_evidence: "fetched Cognitect blog post directly; ADR template + rationale + lightweight thesis confirmed verbatim"
research/primary-sources/adr-nygard.md:14:  append-only, superseded-by-link" as the decisions
research/primary-sources/adr-nygard.md:17:  thesis, and the supersession model verbatim so the
research/primary-sources/adr-nygard.md:68:- **Why ADRs matter** (verbatim): "One of the hardest
research/primary-sources/adr-nygard.md:72:- **Lightweight thesis** (verbatim): "Large documents
research/primary-sources/adr-nygard.md:77:- **Length target** (verbatim guidance): ADRs are
research/primary-sources/adr-nygard.md:85:§5.1 cited "ADRs (Nygard format), append-only,
research/primary-sources/adr-nygard.md:86:superseded-by-link" without the verbatim template
research/primary-sources/adr-nygard.md:91:  / Consequences / Status) is anchored verbatim.
research/primary-sources/adr-nygard.md:99:  paraphrased.
research/primary-sources/nix-flakes.md:8:fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
research/primary-sources/nix-flakes.md:13:  "strongest"; that comparative ranking is judgment://
research/primary-sources/nix-flakes.md:16:  rather than the strongest. Wording refined per codex
research/primary-sources/nix-flakes.md:93:outputs. (Comparative "strongest current level" framing
research/primary-sources/nix-flakes.md:109:  claim that Nix is "the strongest" reproducibility
research/primary-sources/nix-flakes.md:113:  as "an example" rather than "the strongest" without
research/primary-sources/nix-flakes.md:136:  class-by-construction. (Earlier 'strongest current
research/primary-sources/leaddev-agent-compiled.md:8:fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
research/primary-sources/leaddev-agent-compiled.md:41:- **Core risk hypothesis** (verbatim from the article):
research/primary-sources/leaddev-agent-compiled.md:53:- **Concrete failure mode** (verbatim): "If every
research/primary-sources/leaddev-agent-compiled.md:113:  must address this directly."
research/primary-sources/leaddev-agent-compiled.md:135:  surface compliance + audit traceability as a
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:41:- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
research/primary-sources/12-factor.md:8:fetch_evidence: "fetched 12factor.net root; methodology characterisation + 12 factor names verbatim + Factor III headline"
research/primary-sources/12-factor.md:15:  description, the canonical factor list, and the Config
research/primary-sources/12-factor.md:16:  factor verbatim so the methodology can cite 12-factor
research/primary-sources/12-factor.md:81:- **Factor III (Config)** — verbatim headline: "Store
research/primary-sources/12-factor.md:96:verbatim minimal statement ("Store config in the
research/primary-sources/12-factor.md:108:  methodology's weakness if applied directly: 12-factor
research/primary-sources/12-factor.md:127:  prescribes only that configuration be stored in the
research/primary-sources/kiro.md:8:fetch_evidence: "fetched kiro.dev root; three-phase workflow (requirements / design / implementation) + EARS notation reference verbatim"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"status: partial|fetch_outcome: \\\"partial\\\"|NOT deep-read|not deep-read|deep-read|deferred|primary-read-complete because|INDEX row still\" research/primary-sources specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
specs/2026-05-19-primary-source-research-corpus/SPEC.md:113:scope for this SPEC; deferred to a follow-on Task SPEC).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:197:mandatory (deferred to corpus §17 Q4 v1.2 expansion):
specs/2026-05-19-primary-source-research-corpus/SPEC.md:347:   (b) `partial` with a documented deferred-reads note
specs/2026-05-19-primary-source-research-corpus/SPEC.md:350:       NOT deep-read; per codex remediation Round 3 the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:358:   sources requiring follow-on deep-reads on
specs/2026-05-19-primary-source-research-corpus/SPEC.md:522:      resolved or explicitly deferred to follow-on Task
specs/2026-05-19-primary-source-research-corpus/SPEC.md:586:      is deferred; recommend yes once the corpus is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:635:  at status: partial with deferred-reads notes per
specs/2026-05-19-primary-source-research-corpus/SPEC.md:678:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:720:  with deferred-reads notes per the §7.2 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:734:  with deferred-reads notes — adr-tools-state,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:739:- AC-9: cross-family review deferred. Same-family
specs/2026-05-19-primary-source-research-corpus/SPEC.md:765:    in the artefact's front-matter; INDEX row still
specs/2026-05-19-primary-source-research-corpus/SPEC.md:766:    primary-read-complete because the load-bearing
research/primary-sources/kiro.md:120:  workspaces; not deep-read in this pass.
research/primary-sources/openapi-3-1.md:137:  methodology MAY support; not deep-read in this pass.
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/12-factor.md:30:  deep-read on this pass).
research/primary-sources/sigstore-cosign.md:136:  deep-read on this pass. If the methodology adopts
research/primary-sources/symphony-spec.md:32:- License: project license (OpenAI; not deep-read for
research/primary-sources/diataxis.md:31:  openly; specific license terms not deep-read on this
research/primary-sources/oci-artifacts.md:30:  (deep-read 2026-05-19 supplementary fetch per codex
research/primary-sources/oci-artifacts.md:68:  deep-read 2026-05-19 supplementary fetch):
research/primary-sources/oci-artifacts.md:135:  Not deep-read in this pass; if methodology specifies a
research/primary-sources/oci-artifacts.md:144:- The Artifacts Guidance doc was deep-read on the
research/primary-sources/json-schema.md:7:fetch_outcome: "partial"
research/primary-sources/json-schema.md:104:  specific vocabularies once their drafts are deep-read."
research/primary-sources/json-schema.md:116:  earlier drafts (Draft 7, Draft 6) is not deep-read;
research/primary-sources/arc42.md:34:  link at `url://arc42.org/license` (not deep-read).
research/primary-sources/oracle-agent-spec.md:110:  were not deep-read on this pass. If the
research/primary-sources/structurizr-dsl.md:7:fetch_outcome: "partial"
research/primary-sources/structurizr-dsl.md:8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
research/primary-sources/structurizr-dsl.md:96:  keywords) was not deep-read in this pass — only the
research/primary-sources/adr-tools-state.md:7:fetch_outcome: "partial"
research/primary-sources/adr-tools-state.md:8:fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
research/primary-sources/adr-tools-state.md:27:- Linked sub-pages (not deep-read on this pass):
research/primary-sources/adr-tools-state.md:118:  on `/adr-tooling/`; not deep-read in this pass. If

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '470,510p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   470	
   471	### 11.2 Adversarial spec consumption (research §2.3.7)
   472	
   473	The methodology Product B publishes flags adversarial spec
   474	consumption as an open research question. The corpus
   475	itself, by exposing the verbatim sources, INHERITS that
   476	risk surface for any downstream agent that fetches the
   477	corpus: a malicious primary URL could carry prompt
   478	injection. Mitigation: the corpus's §2 Fetch trace records
   479	the URL and content digest at fetch time; downstream
   480	agents that re-fetch SHOULD verify the digest matches.
   481	The methodology MUST flag this as an open risk for
   482	agents consuming the SPEC bundle.
   483	
   484	## 12. Observability
   485	
   486	- Each artefact's §2 Fetch trace logs the agent tool
   487	  invocation and outcome.
   488	- INDEX.md is the single index surface; reading it gives
   489	  the corpus's state.
   490	- `check-corpus-completeness.sh` exit code + diagnostics
   491	  is the mechanical observability surface.
   492	
   493	## 13. Test and Validation Matrix
   494	
   495	| AC | Test |
   496	|---|---|
   497	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
   498	| AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
   499	| AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
   501	| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
   502	| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
   503	| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
   504	| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
   505	| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
   506	
   507	## 14. Implementation Checklist (Definition of Done)
   508	
   509	- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
   510	      authored, executable, lint clean against shellcheck

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/symphony-spec.md | sed -n '1,170p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
    10	  Symphony's SPEC.md is the only example of
    11	  "operating-model-as-SPEC" identified by this project's
    12	  research workpad — research §3 named it the source of
    13	  14 transferable building blocks for the methodology.
    14	  (Note: the "only" framing is project-research-scoped,
    15	  not a globally-licensed uniqueness claim — fixed per
    16	  codex Round-2 finding 2.6 PARTIAL: Symphony's own
    17	  SPEC.md does not assert global uniqueness.) This corpus
    18	  entry anchors the 18-section structure, the three-
    19	  profile conformance model, and the tiered
    20	  Definition-of-Done so the methodology can cite Symphony
    21	  precisely when prescribing the SPEC bundle's shape and
    22	  conformance harness.
    23	---
    24	
    25	# OpenAI Symphony SPEC.md
    26	
    27	## 1. Source identity
    28	
    29	- Name: OpenAI Symphony SPEC.md.
    30	- Author: OpenAI (Symphony project).
    31	- Canonical URL: `url://github.com/openai/symphony/blob/main/SPEC.md`.
    32	- License: project license (OpenAI; not deep-read for
    33	  exact licence terms on this pass).
    34	- Status: in-the-wild operating-model-as-SPEC; cited as
    35	  prior art for the methodology.
    36	
    37	## 2. Fetch trace
    38	
    39	- `cmd://WebFetch url://github.com/openai/symphony/blob/main/SPEC.md`
    40	  — 2026-05-19; returned 18-section structure, §17
    41	  Conformance Profiles, §18 DoD subsection breakdown.
    42	
    43	## 3. Verbatim claims this corpus depends on
    44	
    45	- **Symphony definition** (`url://github.com/openai/symphony/blob/main/SPEC.md`
    46	  §1 Problem Statement): "Symphony is a long-running
    47	  automation service that continuously reads work from
    48	  an issue tracker (Linear in this specification
    49	  version), creates an isolated workspace for each
    50	  issue, and runs a coding agent session for that issue
    51	  inside the workspace."
    52	
    53	- **The 18-section structure**:
    54	  1. Problem Statement
    55	  2. Goals and Non-Goals
    56	  3. System Overview
    57	  4. Core Domain Model
    58	  5. Workflow Specification (Repository Contract)
    59	  6. Configuration Specification
    60	  7. Orchestration State Machine
    61	  8. Polling, Scheduling, and Reconciliation
    62	  9. Workspace Management and Safety
    63	  10. Agent Runner Protocol
    64	  11. Issue Tracker Integration Contract
    65	  12. Prompt Construction and Context Assembly
    66	  13. Logging, Status, and Observability
    67	  14. Failure Model and Recovery Strategy
    68	  15. Security and Operational Safety
    69	  16. Reference Algorithms
    70	  17. Test and Validation Matrix
    71	  18. Implementation Checklist
    72	
    73	- **§17 Conformance Profiles** — three profiles:
    74	  - **Core Conformance**: "Deterministic tests required
    75	    for all conforming implementations."
    76	  - **Extension Conformance**: "Required only for
    77	    optional features an implementation chooses to
    78	    ship."
    79	  - **Real Integration Profile**: "Environment-dependent
    80	    smoke/integration checks recommended before
    81	    production use."
    82	
    83	- **§18 Definition of Done** — three subsections aligned
    84	  with §17 profiles:
    85	  - §18.1 REQUIRED for Conformance: 23 mandatory
    86	    components (workflow loader, orchestrator, tracker
    87	    client, workspace manager, hooks, agent runner,
    88	    retry queue, reconciliation, observability).
    89	  - §18.2 RECOMMENDED Extensions: 4 optional
    90	    capabilities (HTTP server, Linear GraphQL tool,
    91	    persistence across restarts, pluggable tracker
    92	    adapters).
    93	  - §18.3 Operational Validation Before Production: 3
    94	    pre-deployment checks (integration testing, host OS
    95	    verification, HTTP server configuration).
    96	
    97	## 4. Fact-link to methodology
    98	
    99	<!-- lint-ok: no-citation -->
   100	
   101	The 18-section structure is the most concrete in-the-wild
   102	example of operating-model-as-SPEC the methodology can
   103	cite. Confirmed transferable building blocks from research
   104	§3 (14 named blocks): the per-section anchoring of
   105	domain model, workflow contract, configuration pipeline,
   106	state machine, idempotency rules, safety invariants,
   107	observability layering, failure-class × recovery matrix,
   108	trust boundary, conformance profiles, tiered Definition
   109	of Done.
   110	
   111	The Symphony-specific (non-transferable) sections:
   112	- §10 Agent Runner Protocol — agent-specific.
   113	- §11.1-§11.4 Issue Tracker Integration — Linear-bound.
   114	- §12 Prompt Construction — prompt-engineering-specific.
   115	- §16 Reference Algorithms — Symphony-specific
   116	  algorithms.
   117	- §4 entity content — Codex/Linear-specific.
   118	
   119	## 5. Downstream-citation surface
   120	
   121	<!-- lint-ok: no-citation -->
   122	
   123	Methodology claims licensed by this entry (cite as
   124	`file://research/primary-sources/symphony-spec.md §3`):
   125	
   126	- methodology-claim: "Symphony's SPEC.md is the only
   127	  example of an operating-model shipped as a versioned
   128	  18-section SPEC artefact (with three-profile
   129	  conformance harness + tiered DoD) **identified by
   130	  this project's research workpad** at
   131	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   132	  §3. Symphony's own SPEC.md does not assert global
   133	  uniqueness; the global-uniqueness claim is research-
   134	  workpad scoped, not primary-source licensed."
   135	- methodology-claim: "Symphony's three-profile
   136	  conformance model (Core / Extension / Real-Integration)
   137	  is reusable for the methodology's published SPEC
   138	  bundle conformance harness."
   139	- methodology-claim: "Symphony's tiered Definition-of-
   140	  Done (§18.1 REQUIRED + §18.2 RECOMMENDED + §18.3
   141	  pre-production checks) is the most directly portable
   142	  section in the document and the methodology's
   143	  SPEC-bundle Definition-of-Done MAY adopt the same
   144	  structure."
   145	- methodology-claim: "Symphony §5 Workflow Specification
   146	  (the repo-owned contract pattern with framework-
   147	  defined schema + free-form body + strict validation)
   148	  is the most novel-and-portable building block in the
   149	  Symphony document."
   150	
   151	## 6. Open questions surfaced by the primary read
   152	
   153	- Symphony's SPEC.md is bound to Linear as the issue
   154	  tracker; the methodology's framing is tracker-
   155	  agnostic. Citations of Symphony as prior art must
   156	  note this binding.
   157	- Symphony ships an Elixir reference implementation
   158	  (per external coverage) but the SPEC.md itself does
   159	  not bind to Elixir. Methodology may want to cite
   160	  Symphony as evidence of "single SPEC + multiple
   161	  language implementations" but should not put
   162	  reference-implementation language constraints on its
   163	  own SPEC bundle.
   164	- Symphony §17 Conformance Profiles + §18 DoD are
   165	  Symphony's quality bar; the methodology's SPEC bundle
   166	  conformance suite is a separate harness. The shape is
   167	  transferable but the contents are not.

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
   135	  observation (paraphrased: blindly deploying
   136	  methodologies verbatim fails) — is the methodology's
   137	  case for <!-- "blindly deploying" is paraphrase per §3, not verbatim source quote (codex Round-2 finding 2.8) -->
   138	  non-prescriptive SPECs: prescription erodes the
   139	  installer's authority to tailor."
   140	
   141	## 6. Open questions surfaced by the primary read
   142	
   143	- Cottmeyer's frame is agile-transformation
   144	  consulting; the methodology generalises to
   145	  arbitrary product distribution. The
   146	  generalisability of Cottmeyer's "base patterns" to
   147	  software-product domains beyond agile-transformation
   148	  is not proven by his original frame — methodology
   149	  must own the generalisation explicitly.
   150	- Cottmeyer cites four base patterns (teams,
   151	  backlogs, working tested software, dependency
   152	  management) for agile transformation. The
   153	  methodology has not yet enumerated equivalent
   154	  "base patterns" for product distribution. This is
   155	  a methodology design open question.
   156	- Academic literature on reference-architecture-vs-
   157	  solution-architecture (Galster, Avgeriou, others)
   158	  is older than Cottmeyer's framing. If methodology
   159	  wants stronger academic anchoring, those primary
   160	  sources merit separate corpus entries.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/oci-artifacts.md | sed -n '1,170p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
    30	  (deep-read 2026-05-19 supplementary fetch per codex
    31	  remediation finding 2.4; verbatim quotes incorporated in
    32	  §3).
    33	
    34	## 2. Fetch trace
    35	
    36	- `cmd://WebFetch url://github.com/opencontainers/image-spec/blob/main/spec.md`
    37	  — 2026-05-19; returned spec scope + manifest/config/
    38	  layers + descriptor + artifacts-guidance reference.
    39	
    40	## 3. Verbatim claims this corpus depends on
    41	
    42	- **OCI Image definition**: "This specification defines
    43	  an OCI Image, consisting of an image manifest, an image
    44	  index (optional), a set of filesystem layers, and a
    45	  configuration." (`url://github.com/opencontainers/image-spec/blob/main/spec.md`)
    46	
    47	- **Image Manifest**: "a document describing the
    48	  components that make up a container image." The
    49	  manifest "contains metadata about the contents and
    50	  dependencies of the image including the
    51	  content-addressable identity of one or more filesystem
    52	  layer changeset archives."
    53	
    54	- **Image Configuration**: "a document determining layer
    55	  ordering and configuration of the image suitable for
    56	  translation into a runtime bundle."
    57	
    58	- **Filesystem Layer**: "a changeset that describes a
    59	  container's filesystem."
    60	
    61	- **Descriptor**: "a reference that describes the type,
    62	  metadata and content address of referenced content."
    63	  Descriptors enable images to be "discovered by name,
    64	  downloaded, verified by hash, trusted through a
    65	  signature, and unpacked into an OCI Runtime Bundle."
    66	
    67	- **OCI Artifacts Guidance** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`,
    68	  deep-read 2026-05-19 supplementary fetch):
    69	  - Verbatim: "Content other than OCI container images
    70	    MAY be packaged using the image manifest."
    71	  - Verbatim guidance on differentiating images from
    72	    artifacts: "the `config.mediaType` value should not
    73	    be a known OCI image config [media type]" and
    74	    instead use "values specific to the artifact in
    75	    `layer[*].mediaType`."
    76	  - Normative posture: the document is **guidance**,
    77	    not a formal specification; the only explicit
    78	    RFC 2119 verb is the permissive "MAY" on
    79	    artifact-via-image-manifest packaging. There is no
    80	    MUST/SHOULD requirement compelling artifact
    81	    packaging, only prescriptive guidance about media-
    82	    type selection.
    83	  - The historical non-conformant pattern
    84	    (`application/vnd.oci.image.config.v1+json` for
    85	    config with artifact-specific layer media types) is
    86	    explicitly discouraged.
    87	
    88	## 4. Fact-link to methodology
    89	
    90	<!-- lint-ok: no-citation -->
    91	
    92	OCI artifacts are the published-spec distribution
    93	primitive that the methodology's SPEC bundle MAY adopt.
    94	Key shape implications for the methodology's distribution
    95	posture:
    96	
    97	- A "front-door manifest + per-facet sub-specs" SPEC
    98	  bundle MAPS directly onto OCI: the manifest is the
    99	  bundle's front-door manifest; layers are the per-facet
   100	  sub-specs as separate blobs; descriptors give content-
   101	  addressing for each.
   102	- Content-addressing by hash gives the methodology its
   103	  "verifiable spec" affordance — the user-with-agent can
   104	  verify the spec bundle they fetched matches what the
   105	  developer published, by digest.
   106	- Artifacts guidance covers non-image payloads (SBOMs,
   107	  signatures, Helm charts) — the methodology's published
   108	  SPEC bundle fits naturally into this category.
   109	
   110	## 5. Downstream-citation surface
   111	
   112	<!-- lint-ok: no-citation -->
   113	
   114	Methodology claims licensed by this entry (cite as
   115	`file://research/primary-sources/oci-artifacts.md §3`):
   116	
   117	- methodology-claim: "OCI Image Spec defines a four-
   118	  component image: manifest, optional index, filesystem
   119	  layers, configuration."
   120	- methodology-claim: "OCI Descriptors enable content-
   121	  addressing — every component is referenced by type,
   122	  metadata, and content address; verification is by hash."
   123	- methodology-claim: "OCI Artifacts Guidance extends the
   124	  image spec to non-image payloads (SBOMs, signatures,
   125	  Helm charts, methodology spec bundles)."
   126	- methodology-claim: "The methodology's published SPEC
   127	  bundle MAY be distributed as an OCI artifact: front-
   128	  door manifest as OCI manifest; per-facet sub-specs as
   129	  OCI layers; per-spec content-addressing by digest."
   130	
   131	## 6. Open questions surfaced by the primary read
   132	
   133	- The OCI Distribution Spec (separate from Image Spec)
   134	  governs registry behaviour (push, pull, list, delete).
   135	  Not deep-read in this pass; if methodology specifies a
   136	  distribution channel, fetch as supplementary primary
   137	  read.
   138	- Helm v3 supports OCI registries natively; the
   139	  intersection of OCI artifacts + Helm + Sigstore
   140	  signing is a real-world precedent — the methodology
   141	  MAY recommend this exact stack but should anchor each
   142	  primitive separately rather than as a Helm-specific
   143	  recipe.
   144	- The Artifacts Guidance doc was deep-read on the
   145	  2026-05-19 supplementary fetch (§3 last bullet
   146	  block). The remaining open question is media-type
   147	  naming for SPEC bundle artefacts specifically — the
   148	  guidance permits non-OCI config media types but does
   149	  not catalogue community conventions for
   150	  methodology / spec-bundle artefacts. Methodology
   151	  proposing specific media-type strings (e.g.
   152	  `application/vnd.agentic-installation.spec-bundle+json`)
   153	  needs an IANA-style convention proposal, not a
   154	  further fetch of OCI guidance.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -x scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
codex
The declared gates pass. One attempted scratch redirect failed because this sandbox is fully read-only, so I’m relying on the direct command outputs already captured rather than writing temporary output files.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --stat' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
## main...origin/main
?? reviews/codex-2026-05-19-round4/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"\\[ \\] DoD-|\\[x\\] AC-|status: verified|Status: Draft\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
3:status: verified
20:Status: Draft v1
509:- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
512:- [ ] DoD-2: `research/primary-sources/INDEX.md` authored
515:- [ ] DoD-3: Per-source artefact authored at
518:- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
519:- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
521:- [ ] DoD-6: This SPEC's §17 Open Questions are all
527:- [x] AC-1: `cmd://bash scripts/lint-spec.sh
530:- [x] AC-2: `cmd://test -f
532:- [x] AC-3: `cmd://test -x
534:- [x] AC-4: `cmd://bash
538:- [x] AC-5: Every §6.1 slug has a corresponding
540:- [x] AC-6: Every artefact's front-matter passes the §8.1
542:- [x] AC-7: No verbatim §3 quote exceeds the §6.3
545:- [x] AC-8: §17 Completion Report records per-source
547:- [x] AC-9: Cross-family review (BLOCKING per parent

codex
**Quality Gate Result: REQUEST CHANGES**

**Findings**

- MEDIUM: AC-4 is still stale after the §7.2 fix. It is checked as passing with every slug at `primary-read-complete` or `access-blocked`, but the live INDEX has three valid `partial` rows under the new §7.2 rule. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34).

- MEDIUM: Completion Report residual risk is still false. It says three partial-material artefacts are recorded `primary-read-complete`, lists only two, and both listed rows are actually `partial` in INDEX; `json-schema` is omitted from that residual-risk bullet. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:758).

- LOW: §17/Q4 still describes CycloneDX/SBOM and JSON Schema as possible missing v1.0 additions even though both are already in the v1.1 source list. This is stale governance text, not a corpus-completeness failure. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:597), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:190).

**Round 3 Verdicts**

- 2.9 nix front-matter/§4: RESOLVED. Remaining “strongest” mentions are explicitly framed as prior unsupported wording, not active licensed claims.
- HIGH check-script vs SPEC §7.2: RESOLVED for §7.2. Script and §7.2 now both allow `partial` with deferred-read disclosure.
- MEDIUM cyclonedx §5: RESOLVED. §5 now says CycloneDX is one SBOM option, `MAY` be used, and is not sufficient alone.
- MEDIUM Completion Report stale: PARTIAL. Main 22-source count is fixed, but residual-risk text remains stale as above.

**Verification**

Passed:
- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md`
- `test -f research/primary-sources/INDEX.md`
- `test -x scripts/check-corpus-completeness.sh`
- `bash scripts/check-corpus-completeness.sh` → `PASS — 22 sources (3 partial with deferred-reads notes)`

No tracked mutations. Worktree still only shows the pre-existing untracked `reviews/codex-2026-05-19-round4/`.
tokens used
111,963
**Quality Gate Result: REQUEST CHANGES**

**Findings**

- MEDIUM: AC-4 is still stale after the §7.2 fix. It is checked as passing with every slug at `primary-read-complete` or `access-blocked`, but the live INDEX has three valid `partial` rows under the new §7.2 rule. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34).

- MEDIUM: Completion Report residual risk is still false. It says three partial-material artefacts are recorded `primary-read-complete`, lists only two, and both listed rows are actually `partial` in INDEX; `json-schema` is omitted from that residual-risk bullet. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:758).

- LOW: §17/Q4 still describes CycloneDX/SBOM and JSON Schema as possible missing v1.0 additions even though both are already in the v1.1 source list. This is stale governance text, not a corpus-completeness failure. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:597), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:190).

**Round 3 Verdicts**

- 2.9 nix front-matter/§4: RESOLVED. Remaining “strongest” mentions are explicitly framed as prior unsupported wording, not active licensed claims.
- HIGH check-script vs SPEC §7.2: RESOLVED for §7.2. Script and §7.2 now both allow `partial` with deferred-read disclosure.
- MEDIUM cyclonedx §5: RESOLVED. §5 now says CycloneDX is one SBOM option, `MAY` be used, and is not sufficient alone.
- MEDIUM Completion Report stale: PARTIAL. Main 22-source count is fixed, but residual-risk text remains stale as above.

**Verification**

Passed:
- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md`
- `test -f research/primary-sources/INDEX.md`
- `test -x scripts/check-corpus-completeness.sh`
- `bash scripts/check-corpus-completeness.sh` → `PASS — 22 sources (3 partial with deferred-reads notes)`

No tracked mutations. Worktree still only shows the pre-existing untracked `reviews/codex-2026-05-19-round4/`.
