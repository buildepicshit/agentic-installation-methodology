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
session id: 019e4385-8a90-7f92-86c5-b2b22a8ed560
--------
user
Cross-family re-review Round 6 (gpt-5.5; final convergence). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/ + scripts/check-corpus-completeness.sh. R5 left: §15 AC-4 sibling, §3 status enum, §19.1 artefact list. R6 fix at 5138fef. Verify + surface MAJOR-or-higher remaining issues. Output Quality Gate Result. No mutations.
codex
I’ll keep this read-only and treat it as a quality-gate review: first confirm the current commit and authority docs, then inspect the R6 target areas plus the corpus completeness script/output.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git rev-parse --short HEAD && git status --short' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
5138fef
?? reviews/codex-2026-05-19-round6/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"primary-source-research-corpus|SPEC.schema|status:|AC-4|15|19\\.1|artefact|artifact\" /home/hasnobeef/.codex/memories/MEMORY.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
9:- rollout_summaries/2026-05-09T19-49-15-DK7w-actooccatud_m5_movement_and_branch_cleanup.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T12-49-15-019e0e49-75f2-7c40-b317-bcc2b27944f2.jsonl, updated_at=2026-05-19T03:32:42+00:00, thread_id=019e0e49-75f2-7c40-b317-bcc2b27944f2, authority-doc audit plus spec-corpus inventory)
19:- rollout_summaries/2026-05-09T19-49-15-DK7w-actooccatud_m5_movement_and_branch_cleanup.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T12-49-15-019e0e49-75f2-7c40-b317-bcc2b27944f2.jsonl, updated_at=2026-05-19T03:32:42+00:00, thread_id=019e0e49-75f2-7c40-b317-bcc2b27944f2, T-02 parser/validation slice plus closeout surfaces)
29:- rollout_summaries/2026-05-09T19-49-15-DK7w-actooccatud_m5_movement_and_branch_cleanup.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T12-49-15-019e0e49-75f2-7c40-b317-bcc2b27944f2.jsonl, updated_at=2026-05-19T03:32:42+00:00, thread_id=019e0e49-75f2-7c40-b317-bcc2b27944f2, STATUS-plus-ledger answer for how many specs remain)
39:- rollout_summaries/2026-05-09T19-49-15-DK7w-actooccatud_m5_movement_and_branch_cleanup.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T12-49-15-019e0e49-75f2-7c40-b317-bcc2b27944f2.jsonl, updated_at=2026-05-19T03:32:42+00:00, thread_id=019e0e49-75f2-7c40-b317-bcc2b27944f2, local branch cleanup and worktree prune)
59:- rollout_summaries/2026-05-01T15-04-51-axqW-actoccatud_bes_policy_reorient_and_approve_hull_contracts.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/01/rollout-2026-05-01T08-04-51-019de412-3303-7d91-bb37-28ccb91ad0da.jsonl, updated_at=2026-05-09T15:24:34+00:00, thread_id=019de412-3303-7d91-bb37-28ccb91ad0da, fast policy reorientation)
69:- rollout_summaries/2026-05-01T15-04-51-axqW-actoccatud_bes_policy_reorient_and_approve_hull_contracts.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/01/rollout-2026-05-01T08-04-51-019de412-3303-7d91-bb37-28ccb91ad0da.jsonl, updated_at=2026-05-09T15:24:34+00:00, thread_id=019de412-3303-7d91-bb37-28ccb91ad0da, owner approval transition and verification)
73:- approved-pending-owner, status: approved, Wormwright, Signal Wraith, Forked Admiral, Blood Siren, lint-spec.sh, verify-local.sh, be3f0e8
77:- when the user asks to “reorientate” and “do an audit on the full project retrospectively” and to “reopen all the previous spec documents” so the agent can produce “the individuals tasks and roadmap and all the artifacts we missed previously” -> start with retrospective authority/spec-corpus review before implementation [Task 1][Task 5]
78:- when the user’s emphasis is on “artifacts” and “roadmap” -> turn the audit into durable repo outputs once the route is clear, not just discussion [Task 1][Task 5]
92:- `WORKFLOW.md` treats missing `TASK.md` artifacts as a real execution gap, while `approved-spec-decomposition` and `.agents/workflows/decompose-approved-spec.md` make `TASK.md` the authoritative executable bridge after approval [Task 5]
93:- `MODEL_ROUTING.md` lagged behind the newer TASK-based workflow in the recorded orientation run; when those docs conflict, privilege `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow/skill [Task 5]
97:- `STATUS.md` is the quickest live source for the current movement-slice state, while `.agents/specs/2026-05-16-m4-to-m5-architecture-contract/SPEC.md` §7.7 is the authority for the broader production ownership matrix and remaining spec-artifact count [Task 3]
98:- For future “how many left?” questions, split the answer into “current task chain” versus “remaining spec artifacts” instead of giving a single blended number [Task 3]
101:- A green-room evaluation packet remains the intended staging artifact before roadmap work becomes actionable in this repo’s operating model [Task 5]
109:- Symptom: older routing docs contradict the TASK-based workflow. Cause: `MODEL_ROUTING.md` drifted behind `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow. Fix: privilege the newer TASK authority docs and flag the mismatch for upstream repair [Task 5]
202:- rollout_summaries/2026-05-09T16-03-47-u4Kd-ikto_orient_and_assets_murmuration_swarm_checkpoint.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T09-03-47-019e0d7b-0702-7d23-85d3-79c313cdb1b1.jsonl, updated_at=2026-05-15T14:46:30+00:00, thread_id=019e0d7b-0702-7d23-85d3-79c313cdb1b1, step-(d) plan, clean worktree snapshot, and hold behavior)
222:- `.agents/specs/2026-05-13-ikto-prototype-architecture-decisions/research/2026-05-15-step-d-research-plan.md` is the correct place to capture day-0 readiness, candidate lanes, local tool readiness, and initial spike order; it is not the architecture decision itself [Task 2]
230:- Symptom: silent implementation despite conflicting `decomposed` authority. Cause: not comparing workflow wording against `SPEC.schema.md` and the decomposition skill. Fix: rely on the stricter schema / decomposition-skill rule until the workflow template is fixed upstream [Task 2]
241:- rollout_summaries/2026-05-09T16-03-47-u4Kd-ikto_orient_and_assets_murmuration_swarm_checkpoint.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T09-03-47-019e0d7b-0702-7d23-85d3-79c313cdb1b1.jsonl, updated_at=2026-05-15T14:46:30+00:00, thread_id=019e0d7b-0702-7d23-85d3-79c313cdb1b1, IKTO-thread cross-repo checkpoint covering Assets swarm labs)
251:- rollout_summaries/2026-05-09T16-03-47-u4Kd-ikto_orient_and_assets_murmuration_swarm_checkpoint.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T09-03-47-019e0d7b-0702-7d23-85d3-79c313cdb1b1.jsonl, updated_at=2026-05-15T14:46:30+00:00, thread_id=019e0d7b-0702-7d23-85d3-79c313cdb1b1, cross-repo next-step framing from Assets evidence into IKTO gates)
292:## Task 2: Close the current decision artefact cleanly, success
300:- status: closed, acceptance criteria, completion report, separate commits, .gitignore, f508e21, 5384d8e, clean closeout
317:- when the user says "No lets close out cleanly - what is the state of the current open artefact ?" -> switch from expansion to administrative closure, report exact artefact state, and finish the current item before starting the next [Task 2]
319:- the interaction favored "close -> verify -> then start next artefact" rather than mixing planning and execution; once the user has approved the next step, move forward without prolonged debate [Task 2][Task 3]
325:- The approved decision artefacts live at `.agents/specs/2026-05-03-ikto-core-fantasy-and-control-model/{IDEA,SPEC}.md`; the next likely specs were first playable thesis, base topology model, direct deity actions, and threat model contract [Task 1]
326:- In this repo, a decision artefact is not really done until `status` is terminal, acceptance criteria are checked, and the completion report is filled; the schema accepted `closed` as the terminal status for that SPEC [Task 2]
336:- Symptom: an artefact is called "done" while still `approved` with blank checklists/reporting. Cause: conflating substantive approval with administrative closure. Fix: inspect front matter, checklist state, and completion report before claiming closeout [Task 2]
337:- Symptom: unrelated local work gets mixed into artefact closure. Cause: not preserving commit boundaries. Fix: stage by explicit path and commit unrelated cleanup separately [Task 2]
349:- rollout_summaries/2026-05-08T03-07-59-evfA-procedural_objects_stylized_asteroid_research_redo.md (cwd=/var/home/hasnobeef/buildepicshit/Assets, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/07/rollout-2026-05-07T20-07-59-019e058e-6a05-7912-8698-5f9619bf58a2.jsonl, updated_at=2026-05-09T15:18:16+00:00, thread_id=019e058e-6a05-7912-8698-5f9619bf58a2, engine-agnostic procedural-objects spec)
359:- rollout_summaries/2026-05-08T03-07-59-evfA-procedural_objects_stylized_asteroid_research_redo.md (cwd=/var/home/hasnobeef/buildepicshit/Assets, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/07/rollout-2026-05-07T20-07-59-019e058e-6a05-7912-8698-5f9619bf58a2.jsonl, updated_at=2026-05-09T15:18:16+00:00, thread_id=019e058e-6a05-7912-8698-5f9619bf58a2, researched stylized asteroid baseline)
377:- The owner-approved contract artifacts are `.agents/specs/2026-05-08-procedural-objects-shaders/{IDEA,SPEC}.md`, and the closeout note emphasized explicit file staging only if the owner later wants these preserved in git [Task 1]
387:- Symptom: a bare-mode Claude invocation is mistaken for account state. Cause: invocation artifacts were overinterpreted. Fix: do not infer login state from `--bare` failures alone [Task 2]
401:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
480:- in foundation-level discussions, the user preferred concise reflection and pressure-test loops before artifact capture; reflect back the working thesis before drafting the IDEA [Task 1]
506:- rollout_summaries/2026-05-02T00-57-30-MTZH-floom_orient_revalidate_reground_and_hospital_wfc_proof.md (cwd=/var/home/hasnobeef/buildepicshit/Floom, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/01/rollout-2026-05-01T17-57-30-019de630-c932-7de2-a469-966647275c4d.jsonl, updated_at=2026-05-03T16:15:34+00:00, thread_id=019de630-c932-7de2-a469-966647275c4d, orientation plus health revalidation)
516:- rollout_summaries/2026-05-02T00-57-30-MTZH-floom_orient_revalidate_reground_and_hospital_wfc_proof.md (cwd=/var/home/hasnobeef/buildepicshit/Floom, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/01/rollout-2026-05-01T17-57-30-019de630-c932-7de2-a469-966647275c4d.jsonl, updated_at=2026-05-03T16:15:34+00:00, thread_id=019de630-c932-7de2-a469-966647275c4d, source-aware hospital-room proof)
535:- The concrete proof used `samples/hospital/single-room.floom` plus `src/Floom.Compiler/HospitalRoomRealization.fs` to emit deterministic Godot evidence at `artifacts/hospital/single-room/room.tscn` with the stable command `dotnet run --no-build --no-restore --project src/Floom.Cli -- compile samples/hospital/single-room.floom --seed 42 --target godot --out artifacts/hospital/single-room/room.tscn --format json` [Task 2]
536:- Verification included direct artifact inspection with `rg` for `HospitalRoom`, `hospital.room.review-proxy.v0`, and visible module anchors, not just build/test success [Task 2]

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
`partial` / `access-blocked` / `superseded`), and a one-line summary of
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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' schema/SPEC.schema.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
# SPEC.schema.md — Shared schema for spec-driven framework

Status: v1.

This document is the single source of truth for cross-template
conventions used by IDEA.md and the four SPEC.md types
(Task / Contract / Decision / Fastpath). The four SPEC templates
and the IDEA / TASK templates reference this schema instead of
duplicating it.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

`Implementation-defined` means the behavior is part of the contract
but this schema does not prescribe a single universal policy. The
implementation MUST document the selected behavior in the affected
artefact.

## 1. Front-matter schema

Every IDEA.md and SPEC.md MUST begin with a YAML front-matter block
delimited by `---` on its own line.

### 1.1 IDEA.md front-matter

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | kebab-case slug | matches `<topic>` portion of spec_id |
| `spec_id` | string | REQUIRED | `<YYYY-MM-DD>-<id>` | id of the SPEC this IDEA feeds |
| `status` | enum | REQUIRED | `draft` \| `ready-for-spec` \| `owner-blocking` \| `archived` | initial value `draft` |
| `owner` | string | REQUIRED | owner identifier | e.g. `owner-A` |
| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `codex-gpt-5.5`, `claude-opus-4-7-1m`, or any other model:lane label |
| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-01-15` |
| `implies_spec_type` | enum | REQUIRED | `task` \| `contract` \| `decision` | drives template selection in `/author-spec` |

Example:

```yaml
---
id: example-procedure-v1
spec_id: 2026-01-15-example-procedure-v1
status: ready-for-spec
owner: owner-A
brainstormed_by: codex-gpt-5.5  # or claude-opus-4-7-1m, etc. — any model:lane label
brainstormed_on: 2026-01-15
implies_spec_type: contract
---
```

### 1.2 SPEC.md front-matter (shared across all three types)

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` | state machine; only owner sets `approved`, `decomposed`, and `closed` |
| `type` | enum | REQUIRED | `task` \| `contract` \| `decision` | determines which template was used |
| `owner` | string | REQUIRED | owner identifier | |
| `repo` | string | REQUIRED | repo name | e.g. `your-policy-repo` |
| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |

Example (Contract SPEC):

```yaml
---
id: 2026-01-15-example-procedure-v1
status: approved
type: contract
owner: owner-A
repo: your-policy-repo
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
ideated_in: specs/2026-01-15-example-procedure-v1/IDEA.md
acceptance_commands:
  - test -f templates/SPEC.task.template.md
  - bash scripts/lint-spec.sh specs/<id>/SPEC.md
---
```

### 1.3 Status state machine

```text
                  /idea-capture (gate pass)
IDEA.draft ─────────────────────────────► IDEA.ready-for-spec
   ▲                                              │
   │ owner returns                                │ /author-spec
   └─────────────── IDEA.draft ◄──┐               ▼
                                  │      SPEC.draft
                                  │           │
                                  │           │ /review-spec
                                  │           ▼
                                  │   SPEC.needs-revision ─── revise+rerun ─┐
                                  │           ▲                              │
                                  │           │ owner returns                │
                                  │           │                              │
                                  │   SPEC.approved-pending-owner ◄──────────┘
                                  │           │
                                  │           │ owner sets status: approved
                                  │           ▼
                                  │   SPEC.approved
                                  │           │
                                  │           │ /decompose-approved-spec
                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
                                  │           │ emits specs/<id>/tasks/T*.md
                                  │           ▼
                                  │   SPEC.<owner sets decomposed>
                                  │           │
                                  │           │ tracker issues created from TASK.md set;
                                  │           │ dispatcher picks them up; execution begins
                                  │           ▼
                                  │   SPEC.in-execution
                                  │           │
                                  │           │ acceptance_commands pass + Completion Report filled
                                  │           ▼
                                  │   SPEC.verified
                                  │           │
                                  │           │ spec evidence captured
                                  │           ▼
                                  │   SPEC.closed
```

Idempotency: status transitions are monotonic except for the explicit
`needs-revision` and `owner-blocking` reverse edges. `approved`,
`decomposed`, and `closed` MUST NOT revert without owner action.
Owner alone sets `approved`, `decomposed`, and `closed`. The
`spec-review` skill MUST NOT set `approved`. The
`approved-spec-decomposition` skill MUST NOT set `decomposed`. The
`spec-evidence-governance` skill MUST NOT set `closed`. Skills MAY set
`approved-pending-owner` on a clean gate result.

**Capture-after exception (decision-authority only).** A Contract
or Decision SPEC MAY land directly at `status: verified` in the
same change-set as the work it specifies, when the work was
implemented before the SPEC was authored under explicit
decision-authority directive (`decision-authority://<role>:<date>`
or `owner://transcript-<date>`). The per-type quality gate
(`spec-review`) and citation grammar remain REQUIRED; only the
temporal precedence of SPEC-before-work is waived. Capture-after
is an exception path; routine work follows the normal lifecycle
so the BLOCKING review gate runs before approval.

### 1.4 TASK.md front-matter

TASK.md is the per-slice executable artefact emitted by the
`approved-spec-decomposition` skill from an approved SPEC's §11
Execution Plan (Task) or §11 / §14 / §15 (Contract). One TASK.md
== one tracker issue == one isolated workspace run. The parent
SPEC remains the immutable execution authority; TASK.md files
are NOT peer authorities.

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors tracker active states; only owner sets `done` |
| `owner` | string | REQUIRED | agent id or `unassigned` | |
| `model_route` | string | REQUIRED | model slug from your model-routing policy | primary execution lane |
| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `your parallelism-and-routing SPEC` §7.1 |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
| `tracker_issue` | string \| null | REQUIRED | tracker identifier (e.g. `PROJ-123`) or `null` | null until decomposition reflected in tracker |

TASK.md status state machine:

```text
todo ──► in-progress ──► in-review ──► <owner sets done>
   │                          ▲
   ▼                          │
blocked ──── unblock ─────────┘
```

Idempotency: `done` is monotonic and owner-set. `blocked` is the
only reverse edge from `in-progress`.

Cross-validation gate: `in-progress → in-review` requires findings
from `cross_validation_lane` to be addressed (or explicit
justified pushback) per `skills/code-review/SKILL.md` and the
spec-review skill in your harness.

Integration gate: when ALL TASK.md in a parent SPEC's `tasks/`
directory reach `done`, the parent SPEC MAY flip
`decomposed → in-execution → verified` after running the parent's
full `acceptance_commands`. The parent SPEC's §17 / §19 Completion
Report aggregates per-task evidence.

## 2. Citation grammar

Every factual claim in IDEA.md or SPEC.md MUST carry a citation
prefix from the table below. Memory and training are NOT citable
evidence (per OPERATING_MODEL Memory Policy, input-vs-artefact
distinction).

### 2.1 Allowed prefixes

| Prefix | Form | Required surrounding context |
|---|---|---|
| `file://` | `file://<repo-relative-or-absolute-path>` | MAY include `#<line>` or `§<section>` suffix; path MUST exist at the cited commit |
| `cmd://` | `cmd://<command>` | surrounding prose MUST include the observed result or output excerpt |
| `url://` | `url://<full-url>` | surrounding prose MUST include fetch-date, OR pair with a `file://` cache reference |
| `decision-authority://<role>:<date>` | `<role>` ∈ {`owner`, `product-lead`, `tech-lead`, `governance-committee`, `<your-role>`} | binding directive; surrounding prose MUST include the verbatim quote or directive record |
| `owner://` | `owner://transcript-<YYYY-MM-DD>` | shorthand for `decision-authority://owner:<date>` in single-owner studios; surrounding prose MUST include verbatim quote |
| `judgment://owner` | literal | binding by ownership not external evidence; MUST be attributable to a decision-authority record |
| `judgment://agent-synthesis` | literal | MUST be paired with decision-authority affirmation captured via `decision-authority://` or `owner://` |

Repo-relative `file://` paths are RECOMMENDED. Absolute paths are
RECOMMENDED only when the cited file is outside the repo.

codex
The worktree is at `5138fef` as requested. There is an untracked `reviews/codex-2026-05-19-round6/` directory already present; I will not touch it.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
   101	`partial` / `access-blocked` / `superseded`), and a one-line summary of
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/check-corpus-completeness.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '261,620p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

 succeeded in 0ms:
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
   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
   501	| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
   502	| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
   503	| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
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
   536	      every §6.1 slug at status: (a) `primary-read-
   537	      complete`, (b) `partial` with deferred-reads note
   538	      per §7.2 (the partial-with-note rule, v1.1
   539	      alignment), OR (c) `access-blocked` with
   540	      alternative-source-found or unreachability note.
   541	      Updated per codex Round-5 finding that the prior
   542	      "complete OR access-blocked + note" wording was
   543	      stale relative to §13 AC-4 + §7.2 + INDEX reality.
   544	- [x] AC-5: Every §6.1 slug has a corresponding
   545	      artefact file under `research/primary-sources/`.
   546	- [x] AC-6: Every artefact's front-matter passes the §8.1
   547	      schema check.
   548	- [x] AC-7: No verbatim §3 quote exceeds the §6.3
   549	      fair-use bound (or, if it does, the source's
   550	      license is recorded as permitting it).
   551	- [x] AC-8: §17 Completion Report records per-source
   552	      fetch outcomes + any access-blocked resolutions.
   553	- [x] AC-9: Cross-family review (BLOCKING per parent
   554	      Decision §7) signs off OR same-family-proxy is
   555	      recorded with the cross-family-deferral rationale.
   556	
   557	## 16. Rollback Plan
   558	
   559	The corpus is append-only; rollback is a directed-graph
   560	problem.
   561	
   562	Triggers for rollback:
   563	
   564	- A fetched primary source is later proven misattributed
   565	  (e.g. the URL we fetched was a spoof; the real source
   566	  contradicts it).
   567	- The source-list version drifts because §6.1 is
   568	  amended (a §6.1 amendment is a Contract SPEC
   569	  amendment under the v1 procedure).
   570	
   571	Exit procedure:
   572	
   573	1. The affected slug's artefact is superseded by a vN
   574	   entry citing the misattribution evidence.
   575	2. INDEX.md row is updated to point to the new vN slug.
   576	3. Downstream methodology slices that cited the
   577	   superseded artefact MUST be re-reviewed against the
   578	   new vN.
   579	
   580	The corpus directory itself never has files deleted;
   581	provenance is preserved.
   582	
   583	## 17. Open Questions
   584	
   585	- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
   586	      Subsequent additions (a new primary source surfaces
   587	      during longread authoring) require a Contract SPEC
   588	      amendment per §16. Default: defer; not a blocker.
   589	- [ ] Q2: The corpus-citation-binding lint extension is
   590	      out of scope; reviewers enforce manually. Whether
   591	      to add the lint extension as a follow-on Task SPEC
   592	      is deferred; recommend yes once the corpus is
   593	      populated and the citation surface is concrete.
   594	- [ ] Q3: Cross-family review for THIS Contract SPEC.
   595	      The parent Decision §7 makes cross-family review
   596	      BLOCKING per slice. Same-family self-review is the
   597	      default fallback; Codex (or other non-Claude) pass
   598	      is the rigorous path. Owner directive applies
   599	      ("base this all in deep research" suggests rigour).
   600	      Default: same-family proxy with explicit caveat
   601	      recorded; if owner directs external cross-family,
   602	      escalate.
   603	- [x] Q4: Are there primary sources missing from §6.1?
   604	      RESOLVED 2026-05-19 (codex remediation §7.D
   605	      brought JSON Schema + CycloneDX SBOM into v1.1
   606	      source list; `SOURCE_LIST_VERSION` bumped to
   607	      v1.1). REMAINING v1.2 candidates: SPDX (alternate
   608	      SBOM format), Pact (contract testing), CUE
   609	      (configuration language), Dev Container Spec,
   610	      SLSA/in-toto (supply-chain attestation). Defer
   611	      to follow-on Contract SPEC amendment; not a
   612	      blocker for v1.1 corpus closure.
   613	
   614	Neither Q1-Q4 is `owner-blocking`; all can land as
   615	follow-on Contract SPEC amendments without re-work of
   616	the corpus already produced.
   617	
   618	## 18. Migration / Coexistence
   619	
   620	The corpus is greenfield; nothing migrates from prior

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find research/primary-sources -maxdepth 1 -type f -printf '%f\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor.md
INDEX.md
adr-nygard.md
adr-tools-state.md
arc42.md
c4-model.md
cucumber-gherkin.md
cyclonedx-sbom.md
diataxis.md
helm-values-schema.md
json-schema.md
kiro.md
leaddev-agent-compiled.md
nix-flakes.md
oci-artifacts.md
openapi-3-1.md
openspec.md
oracle-agent-spec.md
ref-arch-vs-solution-arch.md
sigstore-cosign.md
spec-kit.md
structurizr-dsl.md
symphony-spec.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '620,920p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   620	The corpus is greenfield; nothing migrates from prior
   621	state. The 2026-05-17 dispositioned research workpad
   622	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   623	remains the upstream record of the field-state survey
   624	that motivated this corpus; it is NOT replaced by the
   625	corpus. The corpus supplements the workpad with
   626	primary-source rigor that the workpad explicitly flagged
   627	as missing (§12 Verification Caveats).
   628	
   629	Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
   630	
   631	- The workpad as the historical synthesis (the
   632	  hypothesis space). <!-- lint-ok: no-citation -->
   633	- The corpus as the primary-source-anchored evidence
   634	  the methodology actually rests on. <!-- lint-ok: no-citation -->
   635	
   636	## 19. Completion Report
   637	
   638	### 19.1 Files changed
   639	
   640	- `scripts/check-corpus-completeness.sh` — mechanical
   641	  corpus-completeness gate (new).
   642	- `research/primary-sources/INDEX.md` — v1.1 corpus
   643	  index (bumped from v1.0 per codex remediation §7.D);
   644	  22 rows total: 19 at status: primary-read-complete, 3
   645	  at status: partial with deferred-reads notes per
   646	  SPEC §7.2 (adr-tools-state, structurizr-dsl,
   647	  json-schema).
   648	- `research/primary-sources/*.md` — 22 per-source
   649	  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   650	  cyclonedx-sbom), all conforming to §6.2 schema +
   651	  §8.1 front-matter:
   652	  - arc42 (architecture documentation)
   653	  - c4-model (architecture model)
   654	  - adr-nygard (foundational ADR)
   655	  - adr-tools-state (state-of-practice ADR)
   656	  - diataxis (documentation taxonomy)
   657	  - 12-factor (cloud-native SaaS methodology)
   658	  - helm-values-schema (customization-affordance)
   659	  - nix-flakes (reproducibility)
   660	  - oci-artifacts (distribution packaging)
   661	  - sigstore-cosign (signing)
   662	  - symphony-spec (operating-model-as-SPEC)
   663	  - spec-kit (spec-as-authoring tool)
   664	  - kiro (agentic IDE)
   665	  - openspec (spec-driven dev tool)
   666	  - oracle-agent-spec (framework-agnostic agent
   667	    description)
   668	  - ref-arch-vs-solution-arch (ownership-split
   669	    precursor)
   670	  - leaddev-agent-compiled (published risk critique)
   671	  - cucumber-gherkin (executable behavior spec)
   672	  - openapi-3-1 (HTTP API contract)
   673	  - structurizr-dsl (architecture-as-code)
   674	  - json-schema (added at v1.1 per §7.D; validation
   675	    primitive Helm + OpenAPI build on)
   676	  - cyclonedx-sbom (added at v1.1 per §7.D; SBOM
   677	    primary for the manifest's provenance facet)
   678	- This SPEC's §15 Acceptance Criteria checkboxes
   679	  flipped to checked.
   680	
   681	### 19.0 Amendment log (post-verification edits)
   682	
   683	Per the pattern established in the parent Decision SPEC
   684	§14.0, this Completion Report was filled at original
   685	verification 2026-05-19 (v1.0 source list, 20 sources).
   686	Subsequent codex cross-family remediation rounds amended
   687	§6.1 (v1.1 source-list expansion adding json-schema +
   688	cyclonedx-sbom), §7.2 (partial-with-note rule),
   689	research/primary-sources/* (overreach + status-truth
   690	fixes), and the check script (partial enforcement).
   691	Historical evidence values in §19.2 reflect original-
   692	verification state, NOT current state.
   693	
   694	| Round | Date | Notable | Current evidence |
   695	|---|---|---|---|
   696	| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
   697	| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
   698	| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
   699	
   700	Current-state evidence values supersede §19.2:
   701	- corpus-SPEC citation-prefix hits: 55 (per current
   702	  `lint-spec.sh` invocation)
   703	- corpus row count: 22 (19 primary-read-complete +
   704	  3 partial)
   705	- script check: PASS — 22 sources (3 partial with
   706	  deferred-reads notes)
   707	
   708	### 19.2 Commands run (historical; original verification)
   709	
   710	- 25 `cmd://WebFetch` invocations across the 22 sources
   711	  (some sources required supplementary fetches; one
   712	  redirect was followed from nixos.org to nix.dev; 2
   713	  v1.1 fetches added: json-schema + cyclonedx-sbom per
   714	  codex remediation §7.D).
   715	- `cmd://bash scripts/lint-spec.sh
   716	  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   717	  — exit 0 (0 errors, 0 warnings, 47 citation hits at
   718	  original verification; 55 current per §19.0 Amendment
   719	  Log).
   720	- `cmd://bash scripts/check-corpus-completeness.sh` —
   721	  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
   722	- Per-artefact `cmd://bash scripts/lint-spec.sh
   723	  research/primary-sources/<slug>.md` — exit 1 on each.
   724	  Two issue classes:
   725	  1. Front-matter shape: corpus artefacts use `slug:`
   726	     not `type:`, so lint reports "missing
   727	     type/implies_spec_type field" + "missing required
   728	     section: ##". These are misapplied checks — the
   729	     lint script is designed for SPEC artefacts.
   730	  2. Uncited-claim: 18 of 22 artefacts have
   731	     `fact-bearing paragraph lacks citation prefix`
   732	     errors in §4 / §5 / §6 — meta-commentary bullets
   733	     that reference §3 by section but lack an inline
   734	     prefix the script's paragraph scanner recognises.
   735	  **Cross-family review (codex finding 2.1) correctly
   736	  identified this as a hack**: SPEC §7.1 says
   737	  uncited-claim is BLOCKING on corpus artefacts, but
   738	  these failures were waved off as front-matter noise.
   739	  The honest reading is that the current lint is not
   740	  fit-for-purpose on corpus artefacts and the in-place
   741	  enforcement gap is a follow-on Task SPEC for a
   742	  corpus-mode lint extension (or a separate
   743	  `scripts/validate-corpus-citations.sh` script that
   744	  applies only the uncited-claim subset of the
   745	  citation grammar to corpus artefacts). Until that
   746	  Task SPEC executes, `check-corpus-completeness.sh`
   747	  is the authoritative mechanical gate and per-artefact
   748	  citation density is reviewer-enforced. The corpus
   749	  artefacts authored under this SPEC ARE densely cited
   750	  (17+ citation prefixes per artefact), but the
   751	  mechanical claim that uncited-claim is blocking
   752	  cannot currently be verified by the script.
   753	
   754	### 19.3 Verification result
   755	
   756	PASS. All §15 ACs met:
   757	
   758	- AC-1: SPEC.md lint clean (exit 0).
   759	- AC-2: INDEX.md present.
   760	- AC-3: check-corpus-completeness.sh present + executable.
   761	- AC-4: check-corpus-completeness.sh exits 0; 22
   762	  slugs total (19 primary-read-complete + 3 partial
   763	  with deferred-reads notes per the §7.2 partial
   764	  rule; codex remediation §7.D added json-schema +
   765	  cyclonedx-sbom; codex Round-2 added the partial
   766	  status-truth check to the script).
   767	- AC-5: every §6.1 slug has corresponding `<slug>.md`
   768	  artefact.
   769	- AC-6: every artefact's front-matter conforms to
   770	  §8.1 schema (manual review).
   771	- AC-7: no verbatim §3 quote exceeds the 200-word
   772	  fair-use bound (manual review; longest excerpts are
   773	  the 18-section Symphony list and 12-factor's 12
   774	  named factors, both well under bound).
   775	- AC-8: this Completion Report records the per-source
   776	  fetch outcomes (19 primary-read-complete + 3 partial
   777	  with deferred-reads notes — adr-tools-state,
   778	  structurizr-dsl, json-schema; zero access-blocked)
   779	  and the source-list discoveries (Kiro Bedrock binding
   780	  NOT confirmed by primary read; was an inferred
   781	  binding in the prior research workpad).
   782	- AC-9: cross-family review deferred. Same-family
   783	  self-review performed; advisory recorded. Owner
   784	  directive 2026-05-18 ("base this all in deep
   785	  research, not make up bullshit") was the rigour bar;
   786	  the corpus's verbatim-quote anchoring is the
   787	  primary discharge of that obligation, with
   788	  cross-family review as a secondary check that can
   789	  land before downstream slices.
   790	
   791	### 19.4 Residual risk
   792	
   793	- **Per-artefact lint mismatch**: the lint script
   794	  treats corpus artefacts as malformed SPECs (missing
   795	  `type:` field; missing standard SPEC sections). Per
   796	  §7.1, this is advisory; the corpus-completeness
   797	  check is the authoritative gate. If future lint
   798	  evolution adds corpus-mode, the per-artefact lint
   799	  warnings disappear; meanwhile they are documented
   800	  noise.
   801	- **Three artefacts at `partial` status, with INDEX
   802	  rows now correctly showing `partial` per the v1.1 +
   803	  v1.2-pending status-truth alignment** (codex Round-2
   804	  finding 2.2 closed this gap; original residual-risk
   805	  text below labelled them "recorded primary-read-
   806	  complete" which was false — the INDEX now matches the
   807	  artefact front-matter):
   808	  - `structurizr-dsl` — root page returned definition
   809	    + C4-implementation framing; deep syntax (workspace
   810	    / model / views keywords) was navigation-only on
   811	    the fetched page. Fetch outcome `partial` in both
   812	    artefact front-matter AND INDEX row. The load-
   813	    bearing methodology claims (DSL purpose,
   814	    architecture-as-code posture, C4 implementation)
   815	    were anchored; deep syntax remains a deferred read.
   816	  - `adr-tools-state` — root page returned community
   817	    framing + template-family references but deep
   818	    template specifics + CLI conventions live on
   819	    sub-pages not fetched. Outcome `partial` in both
   820	    front-matter AND INDEX row (INDEX flipped from
   821	    `primary-read-complete` to `partial` per codex
   822	    remediation 2.2). Sub-pages queued as open
   823	    questions for follow-on supplementary fetches.
   824	  - `json-schema` — added at v1.1 source-list
   825	    expansion (codex remediation §7.D). Spec index
   826	    page deep-read; per-vocabulary drafts (Core +
   827	    Validation) NOT deep-read. Outcome `partial` in
   828	    both front-matter AND INDEX row.
   829	- **Kiro Bedrock binding correction**: prior summary
   830	  in the research workpad characterised Kiro as
   831	  "Bedrock-tethered"; the homepage primary read did
   832	  NOT confirm this. The artefact records the
   833	  correction in §4 Fact-link to methodology. The
   834	  methodology's published characterisation of Kiro
   835	  MUST cite the primary read, not the prior summary.
   836	- **The seven open research questions remain
   837	  unresolved**. This corpus closes the
   838	  primary-source-grounding gap (the methodology can
   839	  now cite arc42, C4, ADRs, etc. accurately) but does
   840	  not resolve the seven open questions from the
   841	  research workpad §2.3 (exhaustiveness vs.
   842	  prescription boundary; ambiguity handling; patching
   843	  semantics; install-matches-intent verification;
   844	  equivalence classes; capability floor; adversarial
   845	  consumption). Those remain published-as-flagged-open
   846	  per parent Decision §7.
   847	
   848	### 19.5 Spec evidence candidates
   849	
   850	- **Primary-read corpus pattern**: structured per-source
   851	  artefacts with verbatim claims, fetch trace, gap from
   852	  prior summary, downstream-citation surface, open
   853	  questions are a robust corpus shape for any
   854	  methodology that must ground claims in external
   855	  sources. Capture as a reusable pattern under the
   856	  `spec-evidence-governance` skill: "when the
   857	  methodology depends on external sources, a
   858	  primary-source corpus is the citable foundation —
   859	  agent summaries are not sufficient."
   860	- **Lint-vs-corpus impedance**: the SPEC's lint script
   861	  is designed for IDEA/SPEC artefacts; corpus
   862	  artefacts (with `slug:` front-matter and §
   863	  structure tuned to source characterisation) trigger
   864	  spurious lint errors. Two paths: (a) extend
   865	  lint-spec.sh with a corpus-mode (out of scope here);
   866	  (b) accept lint as advisory for corpus per the
   867	  SPEC's own §7.1 affordance. We took (b). Capture as
   868	  spec-evidence for future linter design: lints should
   869	  treat front-matter discriminator as the
   870	  artefact-type signal and apply mode-appropriate
   871	  checks rather than assuming SPEC shape.
   872	- **Verbatim-quote bounded excerpts are practical**:
   873	  the 200-word fair-use bound (§6.3) proved easy to
   874	  honour; the longest excerpts in the corpus
   875	  (Symphony's 18-section list, 12-factor's 12 factor
   876	  names) are well under bound and the artefact's
   877	  Methodology-relevance + Fact-link sections do the
   878	  characterisation work that would otherwise need
   879	  longer excerpts.
   880	- **Prior-summary corrections happen and matter**:
   881	  the Kiro "Bedrock-tethered" inferred binding was
   882	  contradicted by primary read; the diataxis four-mode
   883	  definitions were anchored verbatim rather than
   884	  paraphrased; arc42's 12-section list was confirmed
   885	  precisely. The corpus's §4 Gap-from-prior-summary
   886	  section captures these corrections explicitly,
   887	  giving the methodology's longread author the data
   888	  to write honestly about what the research workpad
   889	  got right and what needed correction.

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
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
check-corpus-completeness: PASS — 22 sources (3 partial with deferred-reads notes)

 succeeded in 836ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-primary-source-research-corpus/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  55
lowercase 2119 hits:   7 (advisory only)
errors:                0
warnings:              0

codex
The two declared mechanical gates pass at `5138fef`: `lint-spec.sh` reports zero errors/warnings, and `check-corpus-completeness.sh` reports 22 sources with 3 partial entries carrying deferred-read notes. I’m now checking whether the three R5 deltas are actually reconciled in the SPEC and corpus, rather than only passing the script.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find reviews -maxdepth 3 -type f -printf '%p\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
reviews/codex-2026-05-19-round2/01-parent-decision.md
reviews/codex-2026-05-19-round2/02-corpus.md
reviews/codex-2026-05-19-round2/03-v2-repack.md
reviews/codex-2026-05-19-round3/01-parent-decision.md
reviews/codex-2026-05-19-round3/02-corpus.md
reviews/codex-2026-05-19-round3/03-v2-repack.md
reviews/codex-2026-05-19-round4/01-parent-decision.md
reviews/codex-2026-05-19-round4/02-corpus.md
reviews/codex-2026-05-19-round4/03-v2-repack.md
reviews/codex-2026-05-19-round5/01-parent-decision.md
reviews/codex-2026-05-19-round5/02-corpus.md
reviews/codex-2026-05-19-round5/03-v2-repack.md
reviews/codex-2026-05-19-round6/01-parent-decision.md
reviews/codex-2026-05-19-round6/02-corpus.md
reviews/codex-2026-05-19/00-SYNTHESIS.md
reviews/codex-2026-05-19/01-parent-decision.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/04-longread.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate --no-renames 5138fef' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
5138fef (HEAD -> main, origin/main, origin/HEAD) fix(corpus r5): §15 AC-4 sibling + §3 status enum + §19.1 artefact list (codex R5)
 specs/2026-05-19-primary-source-research-corpus/SPEC.md | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --name-only --format=fuller 5138fef -- specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
commit 5138fef8f7a159f9a1649b841c2a9ff2e37e7342
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 20:36:33 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 20:36:33 2026 -0700

    fix(corpus r5): §15 AC-4 sibling + §3 status enum + §19.1 artefact list (codex R5)
    
    Three small carry-through fixes from R5:
    
    MEDIUM §15 AC-4 sibling: §13 AC-4 was updated in R4 to
    enumerate the three valid status terminals, but §15 had
    a sibling AC-4 line still saying "complete OR
    access-blocked + note". Both AC-4 lines now consistent
    with §7.2 partial-with-note rule.
    
    LOW §3 System Overview status enum: omitted "partial"
    from the inline enum list. Now included.
    
    LOW §19.1 artefact list: count was correct (22) but
    explicit artefact list enumerated only 20 of them
    (missing json-schema + cyclonedx-sbom). Now lists all
    22 with v1.1 additions marked.
    
    Pattern: R5 was the round of "I fixed §X but not its
    sibling §Y." Self-audit category 4 (front-matter vs body
    consistency).

specs/2026-05-19-primary-source-research-corpus/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "R5|Round-5|round 5|AC-4|sibling|status enum|artefact list|artifact list|MAJOR|CRITICAL|BLOCK" reviews specs research scripts' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
scripts/check-corpus-completeness.sh:7:# §9.1, §13 AC-4.
specs/2026-05-19-codex-remediation-amendments/SPEC.md:396:| AC-4 | The validate-manifest.sh script exits 0 post-§7.E + §7.F (against amended v2.1 schema) |
specs/2026-05-19-codex-remediation-amendments/SPEC.md:425:- [x] AC-4: validate-manifest clean post-§7.E+§7.F
specs/2026-05-19-codex-remediation-amendments/SPEC.md:571:- AC-4: validate-manifest PASS at v2.1.0 schema.
specs/2026-05-19-codex-remediation-amendments/SPEC.md:602:  BLOCKING) remain manual-review-enforced.
specs/2026-05-19-codex-remediation-amendments/SPEC.md:622:  4 BLOCKING + 7 HIGH + 9 MAJOR + 7 MEDIUM). Captured
specs/2026-05-19-codex-remediation-amendments/SPEC.md:626:  bearing gate the v1 procedure §10.3 BLOCKING-per-
reviews/codex-2026-05-19-round6/02-corpus.md:14:Cross-family re-review Round 6 (gpt-5.5; final convergence). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/ + scripts/check-corpus-completeness.sh. R5 left: §15 AC-4 sibling, §3 status enum, §19.1 artefact list. R6 fix at 5138fef. Verify + surface MAJOR-or-higher remaining issues. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/02-corpus.md:24:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"primary-source-research-corpus|SPEC.schema|status:|AC-4|15|19\\.1|artefact|artifact\" /home/hasnobeef/.codex/memories/MEMORY.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
reviews/codex-2026-05-19-round6/02-corpus.md:154:  (sibling slice).
reviews/codex-2026-05-19-round6/02-corpus.md:445:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round6/02-corpus.md:482:so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19-round6/02-corpus.md:644:    86	  (sibling slice).
reviews/codex-2026-05-19-round6/02-corpus.md:831:     7	# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round6/02-corpus.md:1203:   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round6/02-corpus.md:1237:   534	- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round6/02-corpus.md:1244:   541	      Updated per codex Round-5 finding that the prior
reviews/codex-2026-05-19-round6/02-corpus.md:1246:   543	      stale relative to §13 AC-4 + §7.2 + INDEX reality.
reviews/codex-2026-05-19-round6/02-corpus.md:1256:   553	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round6/02-corpus.md:1299:   596	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round6/02-corpus.md:1433:   698	| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
reviews/codex-2026-05-19-round6/02-corpus.md:1472:   737	  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round6/02-corpus.md:1496:   761	- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round6/02-corpus.md:1692:The two declared mechanical gates pass at `5138fef`: `lint-spec.sh` reports zero errors/warnings, and `check-corpus-completeness.sh` reports 22 sources with 3 partial entries carrying deferred-read notes. I’m now checking whether the three R5 deltas are actually reconciled in the SPEC and corpus, rather than only passing the script.
reviews/codex-2026-05-19-round6/02-corpus.md:1720:5138fef (HEAD -> main, origin/main, origin/HEAD) fix(corpus r5): §15 AC-4 sibling + §3 status enum + §19.1 artefact list (codex R5)
reviews/codex-2026-05-19-round6/01-parent-decision.md:14:Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:243:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round6/01-parent-decision.md:267:| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
reviews/codex-2026-05-19-round6/01-parent-decision.md:324:  as BLOCKING.
reviews/codex-2026-05-19-round6/01-parent-decision.md:678:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round6/01-parent-decision.md:768:16f9c8d (HEAD -> main, origin/main, origin/HEAD) spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
reviews/codex-2026-05-19-round6/01-parent-decision.md:779:    spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
reviews/codex-2026-05-19-round6/01-parent-decision.md:821: - [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round6/01-parent-decision.md:969:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round6/01-parent-decision.md:978:This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19-round6/01-parent-decision.md:1060:The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19-round6/01-parent-decision.md:1082:This check is BLOCKING per
reviews/codex-2026-05-19-round6/01-parent-decision.md:1387:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
reviews/codex-2026-05-19-round6/01-parent-decision.md:1400:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
reviews/codex-2026-05-19-round6/01-parent-decision.md:1664:    62	  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19-round6/01-parent-decision.md:1975:   368	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round6/01-parent-decision.md:2158:   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round6/01-parent-decision.md:2783:   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round6/01-parent-decision.md:2822:Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3051:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round6/01-parent-decision.md:3071:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "PARTIAL|MAJOR|BLOCK|64|65|Quality Gate|pass:" ../agentic-installation-methodology/reviews/codex-2026-05-19-round5 ../agentic-installation-methodology/reviews/codex-2026-05-19-round6' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round6/01-parent-decision.md:3073:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/ + scripts/check-corpus-completeness.sh. Round 4 flagged: MEDIUM AC-4 wording stale, MEDIUM Completion Report residual-risk partial truth (3 of 3 needed), LOW §17 Q4 stale. R5 fixes at afc2ba0 + self-audit §19.0 Amendment Log at c9adcc6. Verify + surface remaining. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3075:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:285:- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round6/01-parent-decision.md:3076:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:328:      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round6/01-parent-decision.md:3077:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:465:  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round6/01-parent-decision.md:3078:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:695:   547	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round6/01-parent-decision.md:3081:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:738:   590	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round6/01-parent-decision.md:3104:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:875:   727	  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round6/01-parent-decision.md:3118:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1899: - [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round6/01-parent-decision.md:3119:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1942:       BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round6/01-parent-decision.md:3120:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2056:   uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round6/01-parent-decision.md:3122:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2398:   uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round6/01-parent-decision.md:3128:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2733:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3130:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2753:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3132:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:14:Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3134:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:243:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round6/01-parent-decision.md:3135:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:324:  as BLOCKING.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3136:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:678:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round6/01-parent-decision.md:3137:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:768:16f9c8d (HEAD -> main, origin/main, origin/HEAD) spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3138:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:779:    spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3147:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:969:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round6/01-parent-decision.md:3148:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:978:This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19-round6/01-parent-decision.md:3149:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1060:The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19-round6/01-parent-decision.md:3150:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1082:This check is BLOCKING per
reviews/codex-2026-05-19-round6/01-parent-decision.md:3155:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1387:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3156:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1400:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
reviews/codex-2026-05-19-round6/01-parent-decision.md:3171:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1975:   368	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round6/01-parent-decision.md:3233:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2822:Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3235:../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:3051:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round6/01-parent-decision.md:3237:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/. Round 4 flagged: BLOCKER 3.6 semantic containment, MEDIUM REQUIRED-field coverage, HIGH 3.3 final stale paths. R5 fixes at 61528c8 + self-audit §19.0 Amendment Log at 178cee3. Verify + surface remaining. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3238:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:33:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3239:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:36:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3242:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:79:spec-bundle/skills/spec-review/SKILL.md:3:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round6/01-parent-decision.md:3247:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:296:6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round6/01-parent-decision.md:3248:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:300:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round6/01-parent-decision.md:3249:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:309:11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round6/01-parent-decision.md:3250:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:324:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3251:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:609:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3252:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:646:so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3253:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:808:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round6/01-parent-decision.md:3254:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:817:This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19-round6/01-parent-decision.md:3255:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:899:The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19-round6/01-parent-decision.md:3256:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:921:This check is BLOCKING per
reviews/codex-2026-05-19-round6/01-parent-decision.md:3262:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1938:# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round6/01-parent-decision.md:3263:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1977:# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round6/01-parent-decision.md:3268:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2315:   167	# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round6/01-parent-decision.md:3269:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2354:   206	# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round6/01-parent-decision.md:3306:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3939:    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3308:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3966:    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3341:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:335:The R4 review file is in the sibling `buildepicshit/agentic-installation-methodology` tree, not at the literal `../../` path from the repo root. One live inconsistency already surfaced in §14: the new §14.0 says 65, while two historical notes still say “current state 64 per §14.0”; I’m checking whether that is in scope for this gate and running the repo lint now.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3342:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:531:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round6/01-parent-decision.md:3343:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:612:  as BLOCKING.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3344:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:946:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round6/01-parent-decision.md:3345:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1044:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3347:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1071:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3349:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1092:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3350:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1095:    - MAJOR: §11 Check 1 said "Candidates 5.1-5.6 real and distinct"
reviews/codex-2026-05-19-round6/01-parent-decision.md:3383:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1573:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3385:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1575:41:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3387:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1577:62:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3402:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1599:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3418:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1619:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round6/01-parent-decision.md:3419:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1620:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3439:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1650:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3441:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1652:1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3443:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1654:1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3460:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1676:2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3467:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1683:2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3471:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1689:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3475:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1694:2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round6/01-parent-decision.md:3476:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1695:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3478:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1697:2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3481:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1702:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3489:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1711:2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3493:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1716:2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3497:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1829:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3498:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1842:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
reviews/codex-2026-05-19-round6/01-parent-decision.md:3499:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1855:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3503:../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1872:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3536:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "MAJOR|BLOCKING|NOT RESOLVED|PARTIAL|PARTIALLY" ../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md | tail -n 40' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round6/01-parent-decision.md:3538:1619:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round6/01-parent-decision.md:3539:1620:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3553:1650:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3554:1652:1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3555:1654:1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3556:1676:2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3559:1683:2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3560:1689:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3561:1694:2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round6/01-parent-decision.md:3562:1695:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3564:1697:2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3565:1702:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3568:1711:2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3570:1716:2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3572:1829:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
reviews/codex-2026-05-19-round6/01-parent-decision.md:3573:1842:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
reviews/codex-2026-05-19-round6/01-parent-decision.md:3574:1855:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3576:1872:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round6/01-parent-decision.md:3591:No MAJOR-or-higher issues remain.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3593:R5 PARTIAL is closed: §14.0, §14.1, and §14.2 now consistently report current SPEC lint at `65` citation hits: [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:580), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:591), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:605). Targeted grep found no remaining stale `64` current-state references.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3616:No MAJOR-or-higher issues remain.
reviews/codex-2026-05-19-round6/01-parent-decision.md:3618:R5 PARTIAL is closed: §14.0, §14.1, and §14.2 now consistently report current SPEC lint at `65` citation hits: [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:580), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:591), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:605). Targeted grep found no remaining stale `64` current-state references.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:86:  (sibling slice).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:534:- [x] AC-4: `cmd://bash
specs/2026-05-19-primary-source-research-corpus/SPEC.md:541:      Updated per codex Round-5 finding that the prior
specs/2026-05-19-primary-source-research-corpus/SPEC.md:543:      stale relative to §13 AC-4 + §7.2 + INDEX reality.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:553:- [x] AC-9: Cross-family review (BLOCKING per parent
specs/2026-05-19-primary-source-research-corpus/SPEC.md:596:      BLOCKING per slice. Same-family self-review is the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:698:| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:737:  uncited-claim is BLOCKING on corpus artefacts, but
specs/2026-05-19-primary-source-research-corpus/SPEC.md:761:- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:22:| Parent Decision | 2 RESOLVED, 2 PARTIAL | 3 (2 MAJOR + 1 ADVISORY) |
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:24:| v2.0 Repack | 2 RESOLVED, 2 PARTIAL, 2 OPEN | 3 (1 BLOCKER + 2 HIGH) |
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:52:- **MAJOR** parent SPEC §370: §7 still says "additional sub-spec
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:58:- **MAJOR** parent SPEC §478: §11 Validation Plan + §12 AC
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:90:  AC-4 still say "20 rows" / "all 20 rows at status:
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:114:- **BLOCKER** validate-manifest.sh §139: does not enforce v2.1
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:135:1. **Validator gap mirrors the Round-1 BLOCKER pattern**.
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:161:### Priority 1 — Validator gap (BLOCKER 3.x v2.1 primary_index enforcement)
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:183:### Priority 3 — Stale text + carry-through (MAJOR + HIGH parent + corpus + repack)
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:194:  rows including 3 partial"). Update AC-4 to acknowledge
reviews/codex-2026-05-19-round3/03-v2-repack.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round-2 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md flagged: BLOCKER 3.6 validator gap, HIGH provenance, HIGH 3.3 path migration. Round-3 remediation at commit 380db29. Verify: (a) BLOCKER 3.6 — does validate-manifest.sh now enforce primary_index + media_type extension conventions per v2.1 §8.3? (b) HIGH provenance — are source_commit/source_tag/schema_uri now honestly disclosed (empty between tags with documentation rather than fabricated values)? (c) HIGH 3.3 — are remaining stale paths in templates + skills now spec-bundle/-rooted or explicitly adopter-qualified? Surface new issues. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round3/03-v2-repack.md:30:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round3/03-v2-repack.md:33:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round3/03-v2-repack.md:64:6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round3/03-v2-repack.md:68:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round3/03-v2-repack.md:77:11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round3/03-v2-repack.md:92:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round3/03-v2-repack.md:266:BLOCKING rule; it documents a deferral that owner-led external
reviews/codex-2026-05-19-round3/03-v2-repack.md:397:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round3/03-v2-repack.md:434:so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19-round3/03-v2-repack.md:559:the sibling repo `agentic-installation-methodology` at
reviews/codex-2026-05-19-round3/03-v2-repack.md:561:this document resolve relative to that sibling.
reviews/codex-2026-05-19-round3/03-v2-repack.md:647:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
reviews/codex-2026-05-19-round3/03-v2-repack.md:657:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round3/03-v2-repack.md:688:6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round3/03-v2-repack.md:692:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round3/03-v2-repack.md:701:11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round3/03-v2-repack.md:716:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round3/03-v2-repack.md:929:    32	sibling repo's
reviews/codex-2026-05-19-round3/03-v2-repack.md:1000:   103	- Cross-repo refactor of the sibling fleet repos that
reviews/codex-2026-05-19-round3/03-v2-repack.md:1302:   141	# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round3/03-v2-repack.md:2041:   742	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2080:   781	- [x] AC-4: every facet has primary file
reviews/codex-2026-05-19-round3/03-v2-repack.md:2120:   821	      Decision §7, cross-family review is BLOCKING per
reviews/codex-2026-05-19-round3/03-v2-repack.md:2315:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"BLOCKER|HIGH|3\\.6|3\\.3|provenance|primary_index|media_type|source_commit|source_tag|schema_uri|stale\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
reviews/codex-2026-05-19-round3/03-v2-repack.md:2317:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
reviews/codex-2026-05-19-round3/03-v2-repack.md:2320:24:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round3/03-v2-repack.md:2349:1983:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"3\\.[1-6]|Finding|BLOCKER|Major|Minor|file://|url://github.com|Quality Gate\" ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
reviews/codex-2026-05-19-round3/03-v2-repack.md:2353:2525:6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2354:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2355:2529:6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2356:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2388:2816:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2389:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2394:2839:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2395:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2435:5469:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2438:5477:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2443:5495:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
reviews/codex-2026-05-19-round3/03-v2-repack.md:2446:5503:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
reviews/codex-2026-05-19-round3/03-v2-repack.md:3033:    28	CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
reviews/codex-2026-05-19-round3/03-v2-repack.md:3447:380db29 (HEAD -> main, origin/main) fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round3/03-v2-repack.md:3469:fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round3/03-v2-repack.md:3598:| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
reviews/codex-2026-05-19-round3/03-v2-repack.md:3606:| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
reviews/codex-2026-05-19-round3/03-v2-repack.md:3612:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
reviews/codex-2026-05-19-round3/03-v2-repack.md:3618:| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
reviews/codex-2026-05-19-round3/03-v2-repack.md:3626:| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
reviews/codex-2026-05-19-round3/03-v2-repack.md:3632:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
reviews/codex-2026-05-19-round5/03-v2-repack.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/. Round 4 flagged: BLOCKER 3.6 semantic containment, MEDIUM REQUIRED-field coverage, HIGH 3.3 final stale paths. R5 fixes at 61528c8 + self-audit §19.0 Amendment Log at 178cee3. Verify + surface remaining. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/03-v2-repack.md:33:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round5/03-v2-repack.md:36:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round5/03-v2-repack.md:77:spec-bundle/templates/SPEC.decision.template.md:28:CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
reviews/codex-2026-05-19-round5/03-v2-repack.md:79:spec-bundle/skills/spec-review/SKILL.md:3:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round5/03-v2-repack.md:296:6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round5/03-v2-repack.md:300:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round5/03-v2-repack.md:309:11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round5/03-v2-repack.md:324:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round5/03-v2-repack.md:609:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round5/03-v2-repack.md:646:so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19-round5/03-v2-repack.md:731:the sibling repo `agentic-installation-methodology` at
reviews/codex-2026-05-19-round5/03-v2-repack.md:733:this document resolve relative to that sibling.
reviews/codex-2026-05-19-round5/03-v2-repack.md:808:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round5/03-v2-repack.md:817:This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19-round5/03-v2-repack.md:899:The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19-round5/03-v2-repack.md:921:This check is BLOCKING per
reviews/codex-2026-05-19-round5/03-v2-repack.md:1234:sibling repo's
reviews/codex-2026-05-19-round5/03-v2-repack.md:1305:- Cross-repo refactor of the sibling fleet repos that
reviews/codex-2026-05-19-round5/03-v2-repack.md:1765:the methodology the sibling repo
reviews/codex-2026-05-19-round5/03-v2-repack.md:1938:# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round5/03-v2-repack.md:1977:# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round5/03-v2-repack.md:2315:   167	# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round5/03-v2-repack.md:2354:   206	# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round5/03-v2-repack.md:3163:   777	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
reviews/codex-2026-05-19-round5/03-v2-repack.md:3202:   816	- [x] AC-4: every facet has primary file
reviews/codex-2026-05-19-round5/03-v2-repack.md:3939:    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
reviews/codex-2026-05-19-round5/03-v2-repack.md:3956:Recommendation: `block-needs-revision`. R5 is improved but not final convergence.
reviews/codex-2026-05-19-round5/03-v2-repack.md:3966:    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
reviews/codex-2026-05-19-round5/03-v2-repack.md:3983:Recommendation: `block-needs-revision`. R5 is improved but not final convergence.
reviews/codex-2026-05-19-round5/01-parent-decision.md:239:   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round5/01-parent-decision.md:335:The R4 review file is in the sibling `buildepicshit/agentic-installation-methodology` tree, not at the literal `../../` path from the repo root. One live inconsistency already surfaced in §14: the new §14.0 says 65, while two historical notes still say “current state 64 per §14.0”; I’m checking whether that is in scope for this gate and running the repo lint now.
reviews/codex-2026-05-19-round5/01-parent-decision.md:531:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round5/01-parent-decision.md:555:| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
reviews/codex-2026-05-19-round5/01-parent-decision.md:612:  as BLOCKING.
reviews/codex-2026-05-19-round5/01-parent-decision.md:946:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round5/01-parent-decision.md:1044:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1071:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1092:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1095:    - MAJOR: §11 Check 1 said "Candidates 5.1-5.6 real and distinct"
reviews/codex-2026-05-19-round5/01-parent-decision.md:1280:  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19-round5/01-parent-decision.md:1533:   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1573:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1575:41:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1577:62:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1599:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1619:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round5/01-parent-decision.md:1620:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1650:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1652:1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1654:1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1676:2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1683:2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1689:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1694:2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round5/01-parent-decision.md:1695:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1697:2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1702:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1711:2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round5/01-parent-decision.md:1716:2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round5/01-parent-decision.md:1829:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1842:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
reviews/codex-2026-05-19-round5/01-parent-decision.md:1855:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round5/01-parent-decision.md:1872:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:41:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round4/01-parent-decision.md:62:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round4/01-parent-decision.md:65:    - MAJOR: §11 Check 1 said "Candidates 5.1-5.6 real and distinct"
reviews/codex-2026-05-19-round4/01-parent-decision.md:250:  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19-round4/01-parent-decision.md:561:Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round4/01-parent-decision.md:744:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:1238:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round4/01-parent-decision.md:1262:| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
reviews/codex-2026-05-19-round4/01-parent-decision.md:1319:  as BLOCKING.
reviews/codex-2026-05-19-round4/01-parent-decision.md:1630:   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:1732:749:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round4/01-parent-decision.md:1757:1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1758:1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1759:1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1760:1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1765:1975:  4037	MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1766:1977:  4039	MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1773:2006:  4068	MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1774:2008:  4070	MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1804:2858:MAJOR: §11 now overclaims that Candidates 5.1-5.6 are “real and distinct,” but §5.6 is explicitly an alias/duplicate of §5.2, with “Identical reasoning to 5.2.” That makes Validation Check 1 false as written. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:162), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:245), and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1813:2885:MAJOR: §11 now overclaims that Candidates 5.1-5.6 are “real and distinct,” but §5.6 is explicitly an alias/duplicate of §5.2, with “Identical reasoning to 5.2.” That makes Validation Check 1 false as written. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:162), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:245), and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round4/01-parent-decision.md:1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round4/01-parent-decision.md:1885:    - MAJOR: §11 Check 1 said "Candidates 5.1-5.6 real and distinct"
reviews/codex-2026-05-19-round4/01-parent-decision.md:2083:   538	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round4/01-parent-decision.md:2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
reviews/codex-2026-05-19-round4/01-parent-decision.md:2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round4/01-parent-decision.md:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:2327:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1757:1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2328:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1758:1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2329:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1759:1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2330:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1760:1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/01-parent-decision.md:2378:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2379:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2381:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2382:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2556:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round4/01-parent-decision.md:2802:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
reviews/codex-2026-05-19-round4/01-parent-decision.md:2815:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
reviews/codex-2026-05-19-round4/01-parent-decision.md:2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round4/01-parent-decision.md:2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round5/02-corpus.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/ + scripts/check-corpus-completeness.sh. Round 4 flagged: MEDIUM AC-4 wording stale, MEDIUM Completion Report residual-risk partial truth (3 of 3 needed), LOW §17 Q4 stale. R5 fixes at afc2ba0 + self-audit §19.0 Amendment Log at c9adcc6. Verify + surface remaining. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/02-corpus.md:28:afc2ba0 fix(corpus r4): AC-4 wording + Completion Report partial truth + §17 Q4 close (codex R4)
reviews/codex-2026-05-19-round5/02-corpus.md:34:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"AC-4|Completion Report|residual|Residual|Q4|19\\.0|Amendment Log|Round 5|afc2ba0|c9adcc6\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
reviews/codex-2026-05-19-round5/02-corpus.md:37:500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round5/02-corpus.md:39:534:- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round5/02-corpus.md:47:751:- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round5/02-corpus.md:61:# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round5/02-corpus.md:238:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round5/02-corpus.md:272:- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round5/02-corpus.md:285:- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round5/02-corpus.md:328:      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round5/02-corpus.md:426:| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
reviews/codex-2026-05-19-round5/02-corpus.md:465:  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round5/02-corpus.md:489:- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round5/02-corpus.md:611:afc2ba0 fix(corpus r4): AC-4 wording + Completion Report partial truth + §17 Q4 close (codex R4)
reviews/codex-2026-05-19-round5/02-corpus.md:624:The mechanical corpus gate passes: `22 sources (3 partial with deferred-reads notes)`. One inconsistency is already visible, though: §13 AC-4 was updated, but §15’s checked AC-4 still only allows `primary-read-complete` or `access-blocked + note`, which conflicts with the current 3 partial rows.
reviews/codex-2026-05-19-round5/02-corpus.md:648:   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round5/02-corpus.md:682:   534	- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round5/02-corpus.md:695:   547	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round5/02-corpus.md:738:   590	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round5/02-corpus.md:836:   688	| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
reviews/codex-2026-05-19-round5/02-corpus.md:875:   727	  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round5/02-corpus.md:899:   751	- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round5/02-corpus.md:1083:specs/2026-05-19-primary-source-research-corpus/SPEC.md:500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round5/02-corpus.md:1093:specs/2026-05-19-primary-source-research-corpus/SPEC.md:688:| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
reviews/codex-2026-05-19-round5/02-corpus.md:1278:    86	  (sibling slice).
reviews/codex-2026-05-19-round5/02-corpus.md:1741:    fix(corpus r4): AC-4 wording + Completion Report partial truth + §17 Q4 close (codex R4)
reviews/codex-2026-05-19-round5/02-corpus.md:1745:    MEDIUM AC-4 stale wording -> RESOLVED:
reviews/codex-2026-05-19-round5/02-corpus.md:1746:    - AC-4 + AC-7 wording now enumerates the three valid status
reviews/codex-2026-05-19-round5/02-corpus.md:1850:-| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
reviews/codex-2026-05-19-round5/02-corpus.md:1851:+| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round5/02-corpus.md:1886: - [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round5/02-corpus.md:1899: - [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round5/02-corpus.md:1942:       BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round5/02-corpus.md:2056:   uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round5/02-corpus.md:2080: - AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round5/02-corpus.md:2242:      amendment rounds (§7.D v1.1 expansion + R3-R5 fixes) with
reviews/codex-2026-05-19-round5/02-corpus.md:2358:+| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
reviews/codex-2026-05-19-round5/02-corpus.md:2398:   uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round5/02-corpus.md:2422: - AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round5/02-corpus.md:2698:500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
reviews/codex-2026-05-19-round5/02-corpus.md:2729:- **MEDIUM**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534) §15 AC-4 is still stale. It only permits `primary-read-complete` or `access-blocked + note`, but the current corpus has three valid `partial` rows: [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:35). §13 AC-4 and §19.3 are aligned, but literal §15 still makes “All §15 ACs met” untrue.
reviews/codex-2026-05-19-round5/02-corpus.md:2731:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:99) System Overview omits `partial` from the status enum. Related stale v1.0 wording remains in the §6.1 heading and Q1.
reviews/codex-2026-05-19-round5/02-corpus.md:2733:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.
reviews/codex-2026-05-19-round5/02-corpus.md:2749:- **MEDIUM**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534) §15 AC-4 is still stale. It only permits `primary-read-complete` or `access-blocked + note`, but the current corpus has three valid `partial` rows: [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:35). §13 AC-4 and §19.3 are aligned, but literal §15 still makes “All §15 ACs met” untrue.
reviews/codex-2026-05-19-round5/02-corpus.md:2751:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:99) System Overview omits `partial` from the status enum. Related stale v1.0 wording remains in the §6.1 heading and Q1.
reviews/codex-2026-05-19-round5/02-corpus.md:2753:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.
reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round3/01-parent-decision.md:314:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round3/01-parent-decision.md:338:| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
reviews/codex-2026-05-19-round3/01-parent-decision.md:395:  as BLOCKING.
reviews/codex-2026-05-19-round3/01-parent-decision.md:749:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round3/01-parent-decision.md:1115: - [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round3/01-parent-decision.md:1537:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round3/01-parent-decision.md:1561:| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
reviews/codex-2026-05-19-round3/01-parent-decision.md:1650:   368	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round3/01-parent-decision.md:1824:   538	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round3/01-parent-decision.md:1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round3/01-parent-decision.md:1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round3/01-parent-decision.md:1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round3/01-parent-decision.md:1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round3/01-parent-decision.md:1975:  4037	MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round3/01-parent-decision.md:1977:  4039	MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round3/01-parent-decision.md:2006:  4068	MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round3/01-parent-decision.md:2008:  4070	MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round3/01-parent-decision.md:2079:538:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round3/01-parent-decision.md:2160:  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19-round3/01-parent-decision.md:2484:   425	- [x] AC-4: validate-manifest clean post-§7.E+§7.F
reviews/codex-2026-05-19-round3/01-parent-decision.md:2858:MAJOR: §11 now overclaims that Candidates 5.1-5.6 are “real and distinct,” but §5.6 is explicitly an alias/duplicate of §5.2, with “Identical reasoning to 5.2.” That makes Validation Check 1 false as written. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:162), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:245), and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round3/01-parent-decision.md:2885:MAJOR: §11 now overclaims that Candidates 5.1-5.6 are “real and distinct,” but §5.6 is explicitly an alias/duplicate of §5.2, with “Identical reasoning to 5.2.” That makes Validation Check 1 false as written. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:162), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:245), and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
reviews/codex-2026-05-19-round3/02-corpus.md:462:  (sibling slice).
reviews/codex-2026-05-19-round3/02-corpus.md:647:# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round3/02-corpus.md:849:   577	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round3/02-corpus.md:988:- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
reviews/codex-2026-05-19-round3/02-corpus.md:1023:- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
reviews/codex-2026-05-19-round3/02-corpus.md:1321:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
reviews/codex-2026-05-19-round3/02-corpus.md:2372:   521	- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round3/02-corpus.md:2385:   534	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round3/02-corpus.md:2428:   577	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round3/02-corpus.md:2532:   681	  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round3/02-corpus.md:2578:   705	- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round3/02-corpus.md:2709:     7	# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round3/02-corpus.md:3968:  4272	- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
reviews/codex-2026-05-19-round3/02-corpus.md:4003:  4307	- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
reviews/codex-2026-05-19-round3/02-corpus.md:4105:reviews/codex-2026-05-19-round2/01-parent-decision.md:1555:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round3/02-corpus.md:4126:reviews/codex-2026-05-19-round2/01-parent-decision.md:2685:   503	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round3/02-corpus.md:4127:reviews/codex-2026-05-19-round2/01-parent-decision.md:2720:    14	Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19-round3/02-corpus.md:4138:reviews/codex-2026-05-19-round2/01-parent-decision.md:3255:14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19-round3/02-corpus.md:4150:reviews/codex-2026-05-19-round2/01-parent-decision.md:3869:503:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round3/02-corpus.md:4157:reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:22:| Parent Decision | 2 RESOLVED, 2 PARTIAL | 3 (2 MAJOR + 1 ADVISORY) |
reviews/codex-2026-05-19-round3/02-corpus.md:4164:reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:183:### Priority 3 — Stale text + carry-through (MAJOR + HIGH parent + corpus + repack)
reviews/codex-2026-05-19-round3/02-corpus.md:4182:reviews/codex-2026-05-19-round2/03-v2-repack.md:2223:6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
reviews/codex-2026-05-19-round3/02-corpus.md:4184:reviews/codex-2026-05-19-round2/03-v2-repack.md:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/02-corpus.md:4185:reviews/codex-2026-05-19-round2/03-v2-repack.md:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/02-corpus.md:4192:reviews/codex-2026-05-19-round2/03-v2-repack.md:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/02-corpus.md:4193:reviews/codex-2026-05-19-round2/03-v2-repack.md:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round3/02-corpus.md:4270:    90	  AC-4 still say "20 rows" / "all 20 rows at status:
reviews/codex-2026-05-19-round3/02-corpus.md:4332:- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.
reviews/codex-2026-05-19-round3/02-corpus.md:4362:- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.
reviews/codex-2026-05-19-round2/01-parent-decision.md:228:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round2/01-parent-decision.md:252:| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
reviews/codex-2026-05-19-round2/01-parent-decision.md:309:  as BLOCKING.
reviews/codex-2026-05-19-round2/01-parent-decision.md:663:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round2/01-parent-decision.md:752:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round2/01-parent-decision.md:761:This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19-round2/01-parent-decision.md:843:The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19-round2/01-parent-decision.md:865:This check is BLOCKING per
reviews/codex-2026-05-19-round2/01-parent-decision.md:1110:  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19-round2/01-parent-decision.md:1410:Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round2/01-parent-decision.md:1555:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round2/01-parent-decision.md:1895:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round2/01-parent-decision.md:1934:normal lifecycle so the BLOCKING review gate runs before
reviews/codex-2026-05-19-round2/01-parent-decision.md:2540:   358	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round2/01-parent-decision.md:2685:   503	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round2/01-parent-decision.md:2720:    14	Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19-round2/01-parent-decision.md:2826:   120	/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "cross-family|family|review|BLOCKING|Decision|RFC 2119|MUST|SHOULD|MAY|candidate|Rolls|rolls|reversal|lock" agents/MODEL_ROUTING.md agents/OPERATING_MODEL.md STATUS.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19-round2/01-parent-decision.md:2853:   147	STATUS.md:193:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19-round2/01-parent-decision.md:2858:   152	STATUS.md:233:- `spec-review` (BLOCKING; + `references/per-type-gates.md`)
reviews/codex-2026-05-19-round2/01-parent-decision.md:2868:   162	STATUS.md:338:8. Decompose (BLOCKING for Contract/Task with ≥ 2 slices) via
reviews/codex-2026-05-19-round2/01-parent-decision.md:2870:   164	STATUS.md:343:10. Cross-validate (BLOCKING) on a different model family before
reviews/codex-2026-05-19-round2/01-parent-decision.md:2876:   170	agents/OPERATING_MODEL.md:50:  as BLOCKING.
reviews/codex-2026-05-19-round2/01-parent-decision.md:2957:   251	agents/MODEL_ROUTING.md:140:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round2/01-parent-decision.md:3255:14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19-round2/01-parent-decision.md:3268:602:    62	  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19-round2/01-parent-decision.md:3397:   251	agents/MODEL_ROUTING.md:140:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19-round2/01-parent-decision.md:3446:   300	   276	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round2/01-parent-decision.md:3619:  2230	1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3622:  2233	2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3625:  2236	3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3628:  2239	4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3644:  2255	1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3647:  2258	2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3650:  2261	3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3653:  2264	4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
reviews/codex-2026-05-19-round2/01-parent-decision.md:3869:503:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
reviews/codex-2026-05-19-round2/02-corpus.md:309:  (sibling slice).
reviews/codex-2026-05-19-round2/02-corpus.md:674:    86	  (sibling slice).
reviews/codex-2026-05-19-round2/02-corpus.md:1259:   169	    86	  (sibling slice).
reviews/codex-2026-05-19-round2/02-corpus.md:1637:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"2\\.[1-9]|Finding|Quality Gate|FAIL|PASS|severity|BLOCK|MEDIUM|HIGH|LOW|lint|status truth|source-list|OCI|Docker|Symphony|Willison|reference architecture|Nix|CycloneDX|JSON Schema\" reviews/codex-2026-05-19/02-corpus.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
reviews/codex-2026-05-19-round2/02-corpus.md:1663:608:   525	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round2/02-corpus.md:1667:651:   568	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round2/02-corpus.md:1803:2594:   276	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19-round2/02-corpus.md:3577:     7	# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round2/02-corpus.md:3765:   674	  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round2/02-corpus.md:3789:   698	- AC-4: check-corpus-completeness.sh exits 0; all 20
reviews/codex-2026-05-19-round2/02-corpus.md:3842:scripts/check-corpus-completeness.sh:7:# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round2/02-corpus.md:3883:specs/2026-05-19-primary-source-research-corpus/SPEC.md:487:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
reviews/codex-2026-05-19-round2/02-corpus.md:3898:specs/2026-05-19-primary-source-research-corpus/SPEC.md:521:- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round2/02-corpus.md:3905:specs/2026-05-19-primary-source-research-corpus/SPEC.md:534:- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round2/02-corpus.md:3926:specs/2026-05-19-primary-source-research-corpus/SPEC.md:698:- AC-4: check-corpus-completeness.sh exits 0; all 20
reviews/codex-2026-05-19-round2/02-corpus.md:4096:   521	- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round2/02-corpus.md:4109:   534	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round2/02-corpus.md:4133:   577	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round2/02-corpus.md:4272:- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
reviews/codex-2026-05-19-round2/02-corpus.md:4307:- MEDIUM: Completion/acceptance text in the target SPEC is stale after v1.1. It still says “20 rows” and “all 20 rows at status: primary-read-complete” at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:619), and AC-4 still claims every slug is complete/access-blocked at [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521).
reviews/codex-2026-05-19/01-parent-decision.md:14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
reviews/codex-2026-05-19/01-parent-decision.md:120:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "cross-family|family|review|BLOCKING|Decision|RFC 2119|MUST|SHOULD|MAY|candidate|Rolls|rolls|reversal|lock" agents/MODEL_ROUTING.md agents/OPERATING_MODEL.md STATUS.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
reviews/codex-2026-05-19/01-parent-decision.md:147:STATUS.md:193:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
reviews/codex-2026-05-19/01-parent-decision.md:152:STATUS.md:233:- `spec-review` (BLOCKING; + `references/per-type-gates.md`)
reviews/codex-2026-05-19/01-parent-decision.md:162:STATUS.md:338:8. Decompose (BLOCKING for Contract/Task with ≥ 2 slices) via
reviews/codex-2026-05-19/01-parent-decision.md:164:STATUS.md:343:10. Cross-validate (BLOCKING) on a different model family before
reviews/codex-2026-05-19/01-parent-decision.md:170:agents/OPERATING_MODEL.md:50:  as BLOCKING.
reviews/codex-2026-05-19/01-parent-decision.md:251:agents/MODEL_ROUTING.md:140:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19/01-parent-decision.md:300:   276	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19/01-parent-decision.md:431:   407	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
reviews/codex-2026-05-19/01-parent-decision.md:602:    62	  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19/01-parent-decision.md:869:    65	  — sibling workpad (Product A); the framework artefact that
reviews/codex-2026-05-19/01-parent-decision.md:1093:     9	sibling: 2026-05-17-sanitized-framework-publication
reviews/codex-2026-05-19/01-parent-decision.md:1603:   511	  (sibling — Product A)
reviews/codex-2026-05-19/01-parent-decision.md:1773:   114	                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19/01-parent-decision.md:1812:   153	normal lifecycle so the BLOCKING review gate runs before
reviews/codex-2026-05-19/01-parent-decision.md:1864:   140	**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
reviews/codex-2026-05-19/01-parent-decision.md:2230:1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
reviews/codex-2026-05-19/01-parent-decision.md:2233:2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
reviews/codex-2026-05-19/01-parent-decision.md:2236:3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
reviews/codex-2026-05-19/01-parent-decision.md:2239:4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
reviews/codex-2026-05-19/01-parent-decision.md:2255:1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
reviews/codex-2026-05-19/01-parent-decision.md:2258:2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
reviews/codex-2026-05-19/01-parent-decision.md:2261:3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
reviews/codex-2026-05-19/01-parent-decision.md:2264:4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
specs/2026-05-18-repo-standup/SPEC.md:70:- Repacking Product A — that is a sibling Contract SPEC.
specs/2026-05-18-repo-standup/SPEC.md:98:  — the bes-fleet-policy-housed sibling SPEC that planned this
specs/2026-05-18-repo-standup/SPEC.md:178:  repo working tree (those are sibling concerns governed by
specs/2026-05-18-repo-standup/SPEC.md:251:- [x] AC-4: Repo posture is public + Apache-2.0 (verified by
specs/2026-05-18-repo-standup/SPEC.md:353:- **Cross-repo capture-after sibling pattern.** This in-repo
reviews/codex-2026-05-19-round2/03-v2-repack.md:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
reviews/codex-2026-05-19-round2/03-v2-repack.md:24:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round2/03-v2-repack.md:55:6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round2/03-v2-repack.md:59:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round2/03-v2-repack.md:68:11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round2/03-v2-repack.md:83:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round2/03-v2-repack.md:465:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round2/03-v2-repack.md:502:so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19-round2/03-v2-repack.md:650:sibling repo's
reviews/codex-2026-05-19-round2/03-v2-repack.md:721:- Cross-repo refactor of the sibling fleet repos that
reviews/codex-2026-05-19-round2/03-v2-repack.md:1911:    24	6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round2/03-v2-repack.md:1915:    28	8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round2/03-v2-repack.md:1924:    37	11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round2/03-v2-repack.md:1939:    52	- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round2/03-v2-repack.md:1983:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"3\\.[1-6]|Finding|BLOCKER|Major|Minor|file://|url://github.com|Quality Gate\" ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
reviews/codex-2026-05-19-round2/03-v2-repack.md:2223:6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
reviews/codex-2026-05-19-round2/03-v2-repack.md:2499:6479:     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round2/03-v2-repack.md:2525:6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2529:6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2656:spec-bundle/architecture/CONTEXT.md:11:the sibling repo `agentic-installation-methodology` at
reviews/codex-2026-05-19-round2/03-v2-repack.md:2723:spec-bundle/skills/code-review/SKILL.md:3:description: "Use for reviewing local diffs, branches, or PRs. Prioritises bugs, regressions, missing tests, unsafe assumptions, and broken repo contracts over surface polish. Do not use to author or review SPEC.md / IDEA.md artefacts — use spec-review for that BLOCKING gate."
reviews/codex-2026-05-19-round2/03-v2-repack.md:2751:spec-bundle/skills/spec-authoring/SKILL.md:3:description: "Use when capturing an IDEA (/idea-capture) or authoring a SPEC.md (/author-spec) under the spec-first model. Owns templates, type selection (fastpath / task / contract / decision), shared schema, citation discipline, IDEA-conversation tactics. Hands off to spec-review for the BLOCKING gate. Do not use to review existing specs (spec-review) or implement approved specs (implementation-execution)."
reviews/codex-2026-05-19-round2/03-v2-repack.md:2816:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2839:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round2/03-v2-repack.md:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round2/03-v2-repack.md:3167:    32	sibling repo's
reviews/codex-2026-05-19-round2/03-v2-repack.md:3238:   103	- Cross-repo refactor of the sibling fleet repos that
reviews/codex-2026-05-19-round2/03-v2-repack.md:3449:   742	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
reviews/codex-2026-05-19-round2/03-v2-repack.md:3516:   948	the methodology the sibling repo
reviews/codex-2026-05-19-round2/03-v2-repack.md:3840:     3	description: "BLOCKING. Use after a SPEC.md is approved and before in-execution to emit one TASK.md per executable slice into specs/<id>/tasks/. Each TASK.md binds a tracker issue 1:1, carries primary/cross-validation/verification model lanes, and gates the parent SPEC's transition approved -> decomposed -> in-execution. Tasks become the source-of-truth dispatchable units; agents and autonomous dispatch runners anchor on them."
reviews/codex-2026-05-19-round2/03-v2-repack.md:4189:     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round2/03-v2-repack.md:4198:    12	This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19-round2/03-v2-repack.md:4280:    94	The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19-round2/03-v2-repack.md:4302:   116	This check is BLOCKING per
reviews/codex-2026-05-19-round2/03-v2-repack.md:4488:    11	the sibling repo `agentic-installation-methodology` at
reviews/codex-2026-05-19-round2/03-v2-repack.md:4490:    13	this document resolve relative to that sibling.
reviews/codex-2026-05-19-round2/03-v2-repack.md:4619:    57	at the sibling
reviews/codex-2026-05-19-round2/03-v2-repack.md:4887:    19	| ADR-007 | Cross-family review BLOCKING per slice | accepted | 2026-05-04 |
reviews/codex-2026-05-19-round2/03-v2-repack.md:5267:   106	  products are distributed; the sibling repo
reviews/codex-2026-05-19-round2/03-v2-repack.md:5469:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
reviews/codex-2026-05-19-round2/03-v2-repack.md:5477:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
reviews/codex-2026-05-19-round2/03-v2-repack.md:5495:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
reviews/codex-2026-05-19-round2/03-v2-repack.md:5503:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:10:and codex read") + parent Decision SPEC §7 BLOCKING-per-slice
reviews/codex-2026-05-19/00-SYNTHESIS.md:25:Total findings: **4 BLOCKING / 7 HIGH / 9 MAJOR / 7 MEDIUM = 27**.
reviews/codex-2026-05-19/00-SYNTHESIS.md:36:| 1.1 | SPEC.md:135 | BLOCKING | §5 omits paper-style (arxiv/workshop) publication candidate from upstream research §9 Q1. IDEA also dropped it at IDEA.md:127. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:37:| 1.2 | SPEC.md:227 | BLOCKING | Conformance suite + signed bundle should be top-level facets; current SPEC keeps them as optional extras; "additional facets require amendment" compounds the mismatch. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:38:| 1.3 | SPEC.md:216 | MAJOR | "Honest disclosure" matrix row conflates with dogfooding + cross-family validation rows already separate. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:39:| 1.4 | SPEC.md:338 | MAJOR | Locks §9 don't foreclose SPEC-bundle-only (rejected 5.2 candidate) or paper-style (absent from candidate space). |
reviews/codex-2026-05-19/00-SYNTHESIS.md:48:| 2.1 | SPEC.md:650 | HIGH | Lint-impedance handling is a hack. §7.1 says uncited-claim is BLOCKING; 18/20 artefacts have uncited-claim errors waved off as "noise." Either add corpus-mode lint or make completeness gate validate citations. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:65:| 3.1 | SPEC.md:11 + lint-spec.sh:24 + ci.yml:54 | **BLOCKER** | SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as acceptance command. Command FAILS (lint only understands IDEA/SPEC front-matter). CI does not run it. `status: verified` is OVERSTATED. v2.0.0 tag predicated on a broken acceptance command. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:80:| 4.1 | SPEC.md:11 + validate-longread-structure.sh:64,148 | BLOCKING | Front-matter acceptance command runs validator in default (in-progress) mode (50 words/chapter min, 450 total). AC-6 says 8 000–12 000 words but command set doesn't prove it. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:81:| 4.2 | SPEC.md:250 + validate-longread-structure.sh:109 | BLOCKING | Corpus-citation discipline not mechanically enforceable. AC-8 explicit-manual; validator only checks file presence + word counts. Corpus SPEC §7.1 also defers corpus-citation lint. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:82:| 4.3 | SPEC.md:547 + parent SPEC.md:261 | BLOCKING | Chapter 08 acceptance requires 4+ failure modes; parent authority also requires ALL 7 open research questions be published as flagged-open. Local SPEC mentions them in §17 Q-roadmap prose, not in AC/DoD. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:83:| 4.4 | SPEC.md:219 + parent SPEC.md:227 | MAJOR | Per-chapter maxima sum to 12 400; parent longread bound is 12 000. The text claims "margin without breach" but actually breaches by 400. Release-mode validator max is 12 000. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:84:| 4.5 | SPEC.md:275 + research workpad §6 | MAJOR | Phase 7 per upstream is "for each phase, document failures + open questions." SPEC pushes failure modes solely into chapter 08. Should require per-chapter phase-local failure notes + chapter 08 as synthesis. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:85:| 4.6 | SPEC.md:312 + parent SPEC.md:254 | MAJOR | BES attribution rule says other product repos NOT named; SPEC itself names `ACTOCCATUD`, `Floom`, `IKTO` in the public contract text. Sanitization-scope language also wider than parent allows. |
reviews/codex-2026-05-19/00-SYNTHESIS.md:99:### Priority 1 — fix the broken acceptance gates (BLOCKER 3.1 + BLOCKING 4.1 + 4.2)
reviews/codex-2026-05-19/00-SYNTHESIS.md:110:- **3.2 + 3.3**: bulk cross-reference rewrite: update internal cross-repo `file://` paths to either the corpus's sibling-repo-relative paths that actually resolve, OR rephrase as `url://` cites against the public GitHub repo URL. Audit + fix CONTRIBUTING.md, TASK.template.md, skill files referencing old paths.
reviews/codex-2026-05-19/00-SYNTHESIS.md:113:### Priority 3 — close candidate-space / scope gaps (BLOCKING 1.1, 1.2 + HIGH 2.3 + MEDIUM 3.5, 3.6 + MAJOR 1.3, 1.4, 4.4, 4.5, 4.6, 4.7)
specs/2026-05-20-longread-structure/SPEC.md:47:landed at v2.0 of the sibling Product A repo. The
specs/2026-05-20-longread-structure/SPEC.md:402:done (Product A v2.0 §6.2 facets at the sibling repo);
specs/2026-05-20-longread-structure/SPEC.md:588:| AC-4 | For each chapter file in §6.1: `cmd://test -f longread/<filename>` exits 0 |
specs/2026-05-20-longread-structure/SPEC.md:623:- [ ] AC-4: all 9 chapter files exist
specs/2026-05-20-longread-structure/SPEC.md:671:      Decision §7, cross-family review is BLOCKING per
reviews/codex-2026-05-19/04-longread.md:110:    20	The sibling repo
reviews/codex-2026-05-19/04-longread.md:148:    58	6. Review (BLOCKING) — per-type quality gate; never sets
reviews/codex-2026-05-19/04-longread.md:156:    66	11. Cross-validate (BLOCKING per task) — different-model-
reviews/codex-2026-05-19/04-longread.md:340:   113	                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19/04-longread.md:377:   150	so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19/04-longread.md:536:    45	landed at v2.0 of the sibling Product A repo. The
reviews/codex-2026-05-19/04-longread.md:1023:   356	done (Product A v2.0 §6.2 facets at the sibling repo);
reviews/codex-2026-05-19/04-longread.md:1209:   542	| AC-4 | For each chapter file in §6.1: `cmd://test -f longread/<filename>` exits 0 |
reviews/codex-2026-05-19/04-longread.md:1244:   577	- [ ] AC-4: all 9 chapter files exist
reviews/codex-2026-05-19/04-longread.md:1475:    62	  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19/04-longread.md:1686:     9	sibling: 2026-05-17-sanitized-framework-publication
reviews/codex-2026-05-19/04-longread.md:1999:   276	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19/04-longread.md:2339:   511	  (sibling — Product A)
reviews/codex-2026-05-19/04-longread.md:2438:    86	  (sibling slice).
reviews/codex-2026-05-19/04-longread.md:2724:   623	      Decision §7, cross-family review is BLOCKING per
reviews/codex-2026-05-19/04-longread.md:2786:1. `specs/2026-05-20-longread-structure/SPEC.md:539`: BLOCKING  
reviews/codex-2026-05-19/04-longread.md:2789:2. `specs/2026-05-20-longread-structure/SPEC.md:250`: BLOCKING  
reviews/codex-2026-05-19/04-longread.md:2792:3. `specs/2026-05-20-longread-structure/SPEC.md:547`: BLOCKING  
reviews/codex-2026-05-19/04-longread.md:2795:4. `specs/2026-05-20-longread-structure/SPEC.md:219`: MAJOR  
reviews/codex-2026-05-19/04-longread.md:2798:5. `specs/2026-05-20-longread-structure/SPEC.md:275`: MAJOR  
reviews/codex-2026-05-19/04-longread.md:2801:6. `specs/2026-05-20-longread-structure/SPEC.md:312`: MAJOR  
reviews/codex-2026-05-19/04-longread.md:2820:1. `specs/2026-05-20-longread-structure/SPEC.md:539`: BLOCKING  
reviews/codex-2026-05-19/04-longread.md:2823:2. `specs/2026-05-20-longread-structure/SPEC.md:250`: BLOCKING  
reviews/codex-2026-05-19/04-longread.md:2826:3. `specs/2026-05-20-longread-structure/SPEC.md:547`: BLOCKING  
reviews/codex-2026-05-19/04-longread.md:2829:4. `specs/2026-05-20-longread-structure/SPEC.md:219`: MAJOR  
reviews/codex-2026-05-19/04-longread.md:2832:5. `specs/2026-05-20-longread-structure/SPEC.md:275`: MAJOR  
reviews/codex-2026-05-19/04-longread.md:2835:6. `specs/2026-05-20-longread-structure/SPEC.md:312`: MAJOR  
reviews/codex-2026-05-19-round4/03-v2-repack.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round 3 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md flagged: BLOCKER 3.6 partial (primary_index inside-directory + missing-primary), HIGH 3.3 path migration still open (IDEA.template:13, TASK.template:50, spec-authoring:67, fast-path:16), MEDIUM §6.1 v2.0.0 example, MEDIUM validator REQUIRED-field presence. Round 4 remediation at commit e78b8a4. Verify + surface new. Output Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/03-v2-repack.md:40:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round-2 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md flagged: BLOCKER 3.6 validator gap, HIGH provenance, HIGH 3.3 path migration. Round-3 remediation at commit 380db29. Verify: (a) BLOCKER 3.6 — does validate-manifest.sh now enforce primary_index + media_type extension conventions per v2.1 §8.3? (b) HIGH provenance — are source_commit/source_tag/schema_uri now honestly disclosed (empty between tags with documentation rather than fabricated values)? (c) HIGH 3.3 — are remaining stale paths in templates + skills now spec-bundle/-rooted or explicitly adopter-qualified? Surface new issues. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/03-v2-repack.md:56:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round4/03-v2-repack.md:59:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round4/03-v2-repack.md:90:6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19-round4/03-v2-repack.md:94:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19-round4/03-v2-repack.md:103:11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19-round4/03-v2-repack.md:118:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19-round4/03-v2-repack.md:406:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19-round4/03-v2-repack.md:443:so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19-round4/03-v2-repack.md:826:# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round4/03-v2-repack.md:865:# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round4/03-v2-repack.md:885:        # (codex Round-3 BLOCKER refinement: previously the script
reviews/codex-2026-05-19-round4/03-v2-repack.md:957:sibling repo's
reviews/codex-2026-05-19-round4/03-v2-repack.md:1028:- Cross-repo refactor of the sibling fleet repos that
reviews/codex-2026-05-19-round4/03-v2-repack.md:1188:The prior review file in the sibling repo appears to be a captured transcript rather than a short Markdown report, but it contains the Round 3 task and outputs. I’m now checking the actual remediated surfaces directly, including negative cases for the validator gap.
reviews/codex-2026-05-19-round4/03-v2-repack.md:1713:spec-bundle/templates/SPEC.decision.template.md:28:CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
reviews/codex-2026-05-19-round4/03-v2-repack.md:1719:spec-bundle/skills/spec-review/SKILL.md:3:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19-round4/03-v2-repack.md:1950:     3	description: "Use when capturing an IDEA (/idea-capture) or authoring a SPEC.md (/author-spec) under the spec-first model. Owns templates, type selection (fastpath / task / contract / decision), shared schema, citation discipline, IDEA-conversation tactics. Hands off to spec-review for the BLOCKING gate. Do not use to review existing specs (spec-review) or implement approved specs (implementation-execution)."
reviews/codex-2026-05-19-round4/03-v2-repack.md:2222:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"BLOCKER|HIGH|MEDIUM|Quality Gate|3\\.6|3\\.3|6\\.1|REQUIRED|primary_index|missing-primary\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
reviews/codex-2026-05-19-round4/03-v2-repack.md:2224:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round-2 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md flagged: BLOCKER 3.6 validator gap, HIGH provenance, HIGH 3.3 path migration. Round-3 remediation at commit 380db29. Verify: (a) BLOCKER 3.6 — does validate-manifest.sh now enforce primary_index + media_type extension conventions per v2.1 §8.3? (b) HIGH provenance — are source_commit/source_tag/schema_uri now honestly disclosed (empty between tags with documentation rather than fabricated values)? (c) HIGH 3.3 — are remaining stale paths in templates + skills now spec-bundle/-rooted or explicitly adopter-qualified? Surface new issues. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round4/03-v2-repack.md:2226:30:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round4/03-v2-repack.md:2229:33:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round4/03-v2-repack.md:2265:647:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
reviews/codex-2026-05-19-round4/03-v2-repack.md:2268:657:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round4/03-v2-repack.md:2274:1302:   141	# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round4/03-v2-repack.md:2307:2315:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"BLOCKER|HIGH|3\\.6|3\\.3|provenance|primary_index|media_type|source_commit|source_tag|schema_uri|stale\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
reviews/codex-2026-05-19-round4/03-v2-repack.md:2308:2317:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
reviews/codex-2026-05-19-round4/03-v2-repack.md:2311:2320:24:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
reviews/codex-2026-05-19-round4/03-v2-repack.md:2318:2349:1983:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"3\\.[1-6]|Finding|BLOCKER|Major|Minor|file://|url://github.com|Quality Gate\" ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
reviews/codex-2026-05-19-round4/03-v2-repack.md:2322:2353:2525:6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2323:2354:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2324:2355:2529:6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2325:2356:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2333:2388:2816:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2334:2389:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2338:2394:2839:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2339:2395:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2354:2435:5469:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2357:2438:5477:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2361:2443:5495:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2364:2446:5503:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2376:3033:    28	CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
reviews/codex-2026-05-19-round4/03-v2-repack.md:2379:3447:380db29 (HEAD -> main, origin/main) fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round4/03-v2-repack.md:2380:3469:fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
reviews/codex-2026-05-19-round4/03-v2-repack.md:2391:3598:| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2395:3606:| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2398:3612:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
reviews/codex-2026-05-19-round4/03-v2-repack.md:2399:3618:| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2403:3626:| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
reviews/codex-2026-05-19-round4/03-v2-repack.md:2406:3632:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
reviews/codex-2026-05-19-round4/03-v2-repack.md:2538:   152	# schema (codex Round-2 BLOCKER finding closed: previously the script
reviews/codex-2026-05-19-round4/03-v2-repack.md:2577:   191	# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round4/03-v2-repack.md:2597:   211	        # (codex Round-3 BLOCKER refinement: previously the script
reviews/codex-2026-05-19-round4/03-v2-repack.md:3368:191:# primary value. This closes the codex Round-3 BLOCKER where facets
reviews/codex-2026-05-19-round4/03-v2-repack.md:3451:| BLOCKER | `validate-manifest.sh` still does not semantically enforce that `primary_index` stays inside the directory named by `primary`. The new check is string-prefix only, so `behavior/features/../../architecture/CONTEXT.md` passes the lexical containment test and resolves to an existing file outside `behavior/features/`. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:637) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:213). |
reviews/codex-2026-05-19-round4/03-v2-repack.md:3457:- BLOCKER 3.6: PARTIAL / OPEN. Missing `primary` and direct outside-directory cases are improved, but semantic inside-directory enforcement still fails.
reviews/codex-2026-05-19-round4/03-v2-repack.md:3472:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 containment gap and open HIGH 3.3 path migration issue.
reviews/codex-2026-05-19-round4/03-v2-repack.md:3479:| BLOCKER | `validate-manifest.sh` still does not semantically enforce that `primary_index` stays inside the directory named by `primary`. The new check is string-prefix only, so `behavior/features/../../architecture/CONTEXT.md` passes the lexical containment test and resolves to an existing file outside `behavior/features/`. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:637) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:213). |
reviews/codex-2026-05-19-round4/03-v2-repack.md:3485:- BLOCKER 3.6: PARTIAL / OPEN. Missing `primary` and direct outside-directory cases are improved, but semantic inside-directory enforcement still fails.
reviews/codex-2026-05-19-round4/03-v2-repack.md:3500:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 containment gap and open HIGH 3.3 path migration issue.
reviews/codex-2026-05-19/03-v2-repack.md:171:    24	6. **Review** (BLOCKING) — run the per-type quality gate
reviews/codex-2026-05-19/03-v2-repack.md:175:    28	8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
reviews/codex-2026-05-19/03-v2-repack.md:184:    37	11. **Cross-validate** (BLOCKING per task) — review on a model
reviews/codex-2026-05-19/03-v2-repack.md:199:    52	- **Spec reviewer** — runs the BLOCKING per-type quality gate.
reviews/codex-2026-05-19/03-v2-repack.md:373:   226	BLOCKING rule; it documents a deferral that owner-led external
reviews/codex-2026-05-19/03-v2-repack.md:524:   113	                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
reviews/codex-2026-05-19/03-v2-repack.md:561:   150	so the BLOCKING review gate runs before approval.
reviews/codex-2026-05-19/03-v2-repack.md:708:    33	sibling repo's
reviews/codex-2026-05-19/03-v2-repack.md:779:   104	- Cross-repo refactor of the sibling fleet repos that
reviews/codex-2026-05-19/03-v2-repack.md:1030:    11	the sibling repo `agentic-installation-methodology` at
reviews/codex-2026-05-19/03-v2-repack.md:1032:    13	this document resolve relative to that sibling.
reviews/codex-2026-05-19/03-v2-repack.md:1469:   701	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
reviews/codex-2026-05-19/03-v2-repack.md:1508:   740	- [x] AC-4: every facet has primary file
reviews/codex-2026-05-19/03-v2-repack.md:1870:   780	      Decision §7, cross-family review is BLOCKING per
reviews/codex-2026-05-19/03-v2-repack.md:1997:   907	the methodology the sibling repo
reviews/codex-2026-05-19/03-v2-repack.md:2157:    57	at the sibling
reviews/codex-2026-05-19/03-v2-repack.md:2442:    19	| ADR-007 | Cross-family review BLOCKING per slice | accepted | 2026-05-04 |
reviews/codex-2026-05-19/03-v2-repack.md:2846:   106	  products are distributed; the sibling repo
reviews/codex-2026-05-19/03-v2-repack.md:3080:    27	5. **Cross-family review is BLOCKING per slice.**
reviews/codex-2026-05-19/03-v2-repack.md:3150:    12	methodology the sibling repo
reviews/codex-2026-05-19/03-v2-repack.md:3228:    90	in a primary-source corpus entry in the sibling repo at
reviews/codex-2026-05-19/03-v2-repack.md:3252:   114	release becomes the worked case study the sibling
reviews/codex-2026-05-19/03-v2-repack.md:3377:    15	the sibling repo
reviews/codex-2026-05-19/03-v2-repack.md:3444:    82	shape the sibling
reviews/codex-2026-05-19/03-v2-repack.md:3544:    15	methodology the sibling repo
reviews/codex-2026-05-19/03-v2-repack.md:3568:    39	   (sibling repo) — primary-source artefacts that
reviews/codex-2026-05-19/03-v2-repack.md:3644:   115	(BLOCKING) → Approve (owner-only) → Decompose (BLOCKING
reviews/codex-2026-05-19/03-v2-repack.md:3646:   117	Cross-validate (BLOCKING) → Verify → Report + Close
reviews/codex-2026-05-19/03-v2-repack.md:4075:    itself, v2.0 becomes the worked case study the sibling
reviews/codex-2026-05-19/03-v2-repack.md:4636:scripts/audit-entry-docs.sh:119:            printf '%s/WORKFLOW.md:1: BLOCKING — fleet-baseline body drift; missing marker(s):%s. Body source: agents/templates/WORKFLOW.body.md (or .agents/templates/WORKFLOW.body.md). Recompose: per-repo YAML + intro + fleet body verbatim.\n' "$repo_name" "$missing_markers" >&2
reviews/codex-2026-05-19/03-v2-repack.md:4905:    70	Out of scope for this slice (covered by sibling tasks):
reviews/codex-2026-05-19/03-v2-repack.md:4966:    72	Out of scope for this slice (covered by sibling tasks):
reviews/codex-2026-05-19/03-v2-repack.md:5473:    68	        printf '%s/AGENTS.md:1: BLOCKING — missing AGENTS.md (canonical entry doc per OPERATING_MODEL Source Of Truth)\n' "$repo_name" >&2
reviews/codex-2026-05-19/03-v2-repack.md:5524:   119	            printf '%s/WORKFLOW.md:1: BLOCKING — fleet-baseline body drift; missing marker(s):%s. Body source: agents/templates/WORKFLOW.body.md (or .agents/templates/WORKFLOW.body.md). Recompose: per-repo YAML + intro + fleet body verbatim.\n' "$repo_name" "$missing_markers" >&2
reviews/codex-2026-05-19/03-v2-repack.md:5536:   131	            printf '%s/CLAUDE.md:1: BLOCKING — does not import @AGENTS.md (must in first 10 lines)\n' "$repo_name" >&2
reviews/codex-2026-05-19/03-v2-repack.md:5544:   139	            printf '%s/GEMINI.md:1: BLOCKING — does not import @AGENTS.md (must in first 10 lines)\n' "$repo_name" >&2
reviews/codex-2026-05-19/03-v2-repack.md:5705:../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:356:done (Product A v2.0 §6.2 facets at the sibling repo);
reviews/codex-2026-05-19/03-v2-repack.md:6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
reviews/codex-2026-05-19/03-v2-repack.md:6479:     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
reviews/codex-2026-05-19/03-v2-repack.md:6488:    12	This skill is **BLOCKING**. A spec MUST NOT advance to
reviews/codex-2026-05-19/03-v2-repack.md:6521:    94	The Contract per-type gate MUST add the following BLOCKING
reviews/codex-2026-05-19/03-v2-repack.md:6534:     3	description: "BLOCKING. Use after a SPEC.md is approved and before in-execution to emit one TASK.md per executable slice into specs/<id>/tasks/. Each TASK.md binds a tracker issue 1:1, carries primary/cross-validation/verification model lanes, and gates the parent SPEC's transition approved -> decomposed -> in-execution. Tasks become the source-of-truth dispatchable units; agents and autonomous dispatch runners anchor on them."
reviews/codex-2026-05-19/03-v2-repack.md:6635:    14	  family (BLOCKING rule per the parent skill).
reviews/codex-2026-05-19/03-v2-repack.md:6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19/03-v2-repack.md:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19/03-v2-repack.md:6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
reviews/codex-2026-05-19/03-v2-repack.md:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19/02-corpus.md:169:    86	  (sibling slice).
reviews/codex-2026-05-19/02-corpus.md:561:   478	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
reviews/codex-2026-05-19/02-corpus.md:595:   512	- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19/02-corpus.md:608:   525	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19/02-corpus.md:651:   568	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19/02-corpus.md:750:   667	- AC-4: check-corpus-completeness.sh exits 0; all 20
reviews/codex-2026-05-19/02-corpus.md:1808:     7	# §9.1, §13 AC-4.
reviews/codex-2026-05-19/02-corpus.md:2380:    62	  — sibling Product A workpad; Product A v1.1 is the worked
reviews/codex-2026-05-19/02-corpus.md:2594:   276	Decision; cross-family review BLOCKING per slice;
reviews/codex-2026-05-19/02-corpus.md:2714:     9	sibling: 2026-05-17-sanitized-framework-publication
reviews/codex-2026-05-19/02-corpus.md:3221:   511	  (sibling — Product A)
reviews/codex-2026-05-19-round4/02-corpus.md:389:  (sibling slice).
reviews/codex-2026-05-19-round4/02-corpus.md:1251:  4182	reviews/codex-2026-05-19-round2/03-v2-repack.md:2223:6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
reviews/codex-2026-05-19-round4/02-corpus.md:1253:  4184	reviews/codex-2026-05-19-round2/03-v2-repack.md:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/02-corpus.md:1254:  4185	reviews/codex-2026-05-19-round2/03-v2-repack.md:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/02-corpus.md:1261:  4192	reviews/codex-2026-05-19-round2/03-v2-repack.md:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/02-corpus.md:1262:  4193	reviews/codex-2026-05-19-round2/03-v2-repack.md:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
reviews/codex-2026-05-19-round4/02-corpus.md:1339:  4270	    90	  AC-4 still say "20 rows" / "all 20 rows at status:
reviews/codex-2026-05-19-round4/02-corpus.md:1401:  4332	- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.
reviews/codex-2026-05-19-round4/02-corpus.md:1431:  4362	- HIGH: `check-corpus-completeness.sh` still disagrees with the governing SPEC. The script now allows `partial` rows with deferred-read notes, but SPEC §7.2 and AC-4 still define success as only `primary-read-complete` or documented `access-blocked`. See [check-corpus-completeness.sh](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh:88), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:345), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:521). Current INDEX has 3 partials.
reviews/codex-2026-05-19-round4/02-corpus.md:1690:     7	# §9.1, §13 AC-4.
reviews/codex-2026-05-19-round4/02-corpus.md:1873:   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
reviews/codex-2026-05-19-round4/02-corpus.md:1907:   534	- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round4/02-corpus.md:1920:   547	- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round4/02-corpus.md:1963:   590	      BLOCKING per slice. Same-family self-review is the
reviews/codex-2026-05-19-round4/02-corpus.md:2067:   694	  uncited-claim is BLOCKING on corpus artefacts, but
reviews/codex-2026-05-19-round4/02-corpus.md:2091:   718	- AC-4: check-corpus-completeness.sh exits 0; 22
reviews/codex-2026-05-19-round4/02-corpus.md:3247:   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
reviews/codex-2026-05-19-round4/02-corpus.md:3780:534:- [x] AC-4: `cmd://bash
reviews/codex-2026-05-19-round4/02-corpus.md:3785:547:- [x] AC-9: Cross-family review (BLOCKING per parent
reviews/codex-2026-05-19-round4/02-corpus.md:3792:- MEDIUM: AC-4 is still stale after the §7.2 fix. It is checked as passing with every slug at `primary-read-complete` or `access-blocked`, but the live INDEX has three valid `partial` rows under the new §7.2 rule. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34).
reviews/codex-2026-05-19-round4/02-corpus.md:3820:- MEDIUM: AC-4 is still stale after the §7.2 fix. It is checked as passing with every slug at `primary-read-complete` or `access-blocked`, but the live INDEX has three valid `partial` rows under the new §7.2 rule. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'tail -n 80 reviews/codex-2026-05-19-round5/02-corpus.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"v1\\.0|v1\\.1|§17 Completion Report|Completion Report|Status: Draft\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
20:Status: Draft v1
85:- Repacking Product A v1.1 into manifest+catalog v2.0
146:      for v1.0; subsequent additions land as follow-on
166:### 6.1 In-scope sources (v1.0)
190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
193:`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
196:baseline. Two further candidates flagged but NOT v1.1
278:Source-list version: v1.0
356:   (Updated 2026-05-19 to align with the v1.1 source-
360:   or access-blocked which contradicted the v1.1
500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
503:| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
505:| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
545:- [x] AC-8: §17 Completion Report records per-source
579:- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
599:      brought JSON Schema + CycloneDX SBOM into v1.1
601:      v1.1). REMAINING v1.2 candidates: SPDX (alternate
606:      blocker for v1.1 corpus closure.
630:## 19. Completion Report
636:- `research/primary-sources/INDEX.md` — v1.1 corpus
637:  index (bumped from v1.0 per codex remediation §7.D);
643:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
674:§14.0, this Completion Report was filled at original
675:verification 2026-05-19 (v1.0 source list, 20 sources).
677:§6.1 (v1.1 source-list expansion adding json-schema +
686:| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
687:| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
703:  v1.1 fetches added: json-schema + cyclonedx-sbom per
711:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
765:- AC-8: this Completion Report records the per-source
792:  rows now correctly showing `partial` per the v1.1 +
814:  - `json-schema` — added at v1.1 source-list

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
codex
**Quality Gate Result: FAIL**

Findings:

- **MEDIUM**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534) §15 AC-4 is still stale. It only permits `primary-read-complete` or `access-blocked + note`, but the current corpus has three valid `partial` rows: [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:35). §13 AC-4 and §19.3 are aligned, but literal §15 still makes “All §15 ACs met” untrue.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:99) System Overview omits `partial` from the status enum. Related stale v1.0 wording remains in the §6.1 heading and Q1.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.

Verification run:

- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` passed: 0 errors, 0 warnings, 55 citation hits.
- `bash scripts/check-corpus-completeness.sh` passed: 22 sources, 3 partial with deferred-reads notes.
- Presence/executable checks passed.
- `git diff --check` passed.
- `shellcheck` was not available in this environment.
- No mutations made. Current HEAD observed at `c9adcc6`; `afc2ba0` is present immediately below it.
tokens used
93,368
**Quality Gate Result: FAIL**

Findings:

- **MEDIUM**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534) §15 AC-4 is still stale. It only permits `primary-read-complete` or `access-blocked + note`, but the current corpus has three valid `partial` rows: [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:35). §13 AC-4 and §19.3 are aligned, but literal §15 still makes “All §15 ACs met” untrue.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:99) System Overview omits `partial` from the status enum. Related stale v1.0 wording remains in the §6.1 heading and Q1.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.

Verification run:

- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` passed: 0 errors, 0 warnings, 55 citation hits.
- `bash scripts/check-corpus-completeness.sh` passed: 22 sources, 3 partial with deferred-reads notes.
- Presence/executable checks passed.
- `git diff --check` passed.
- `shellcheck` was not available in this environment.
- No mutations made. Current HEAD observed at `c9adcc6`; `afc2ba0` is present immediately below it.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --unified=40 --no-ext-diff --no-renames 5138fef -- specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
commit 5138fef8f7a159f9a1649b841c2a9ff2e37e7342
Author: HasNoBeef <alaindormehl@gmail.com>
Date:   Tue May 19 20:36:33 2026 -0700

    fix(corpus r5): §15 AC-4 sibling + §3 status enum + §19.1 artefact list (codex R5)
    
    Three small carry-through fixes from R5:
    
    MEDIUM §15 AC-4 sibling: §13 AC-4 was updated in R4 to
    enumerate the three valid status terminals, but §15 had
    a sibling AC-4 line still saying "complete OR
    access-blocked + note". Both AC-4 lines now consistent
    with §7.2 partial-with-note rule.
    
    LOW §3 System Overview status enum: omitted "partial"
    from the inline enum list. Now included.
    
    LOW §19.1 artefact list: count was correct (22) but
    explicit artefact list enumerated only 20 of them
    (missing json-schema + cyclonedx-sbom). Now lists all
    22 with v1.1 additions marked.
    
    Pattern: R5 was the round of "I fixed §X but not its
    sibling §Y." Self-audit category 4 (front-matter vs body
    consistency).

diff --git a/specs/2026-05-19-primary-source-research-corpus/SPEC.md b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
index 5610dc5..6059240 100644
--- a/specs/2026-05-19-primary-source-research-corpus/SPEC.md
+++ b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
@@ -61,81 +61,81 @@ artefact template, the completeness gate, and the citation
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
-`access-blocked` / `superseded`), and a one-line summary of
+`partial` / `access-blocked` / `superseded`), and a one-line summary of
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
@@ -496,82 +496,88 @@ agents consuming the SPEC bundle.
 |---|---|
 | AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
 | AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
 | AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
 | AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
 | AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
 | AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
 | AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
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
 - [x] AC-4: `cmd://bash
       scripts/check-corpus-completeness.sh` exits 0 with
-      every §6.1 slug at status
-      `primary-read-complete` OR `access-blocked` + note.
+      every §6.1 slug at status: (a) `primary-read-
+      complete`, (b) `partial` with deferred-reads note
+      per §7.2 (the partial-with-note rule, v1.1
+      alignment), OR (c) `access-blocked` with
+      alternative-source-found or unreachability note.
+      Updated per codex Round-5 finding that the prior
+      "complete OR access-blocked + note" wording was
+      stale relative to §13 AC-4 + §7.2 + INDEX reality.
 - [x] AC-5: Every §6.1 slug has a corresponding
       artefact file under `research/primary-sources/`.
 - [x] AC-6: Every artefact's front-matter passes the §8.1
       schema check.
 - [x] AC-7: No verbatim §3 quote exceeds the §6.3
       fair-use bound (or, if it does, the source's
       license is recorded as permitting it).
 - [x] AC-8: §17 Completion Report records per-source
       fetch outcomes + any access-blocked resolutions.
 - [x] AC-9: Cross-family review (BLOCKING per parent
       Decision §7) signs off OR same-family-proxy is
       recorded with the cross-family-deferral rationale.
 
 ## 16. Rollback Plan
 
 The corpus is append-only; rollback is a directed-graph
 problem.
 
 Triggers for rollback:
 
 - A fetched primary source is later proven misattributed
   (e.g. the URL we fetched was a spoof; the real source
   contradicts it).
 - The source-list version drifts because §6.1 is
   amended (a §6.1 amendment is a Contract SPEC
   amendment under the v1 procedure).
 
 Exit procedure:
 
 1. The affected slug's artefact is superseded by a vN
    entry citing the misattribution evidence.
 2. INDEX.md row is updated to point to the new vN slug.
 3. Downstream methodology slices that cited the
    superseded artefact MUST be re-reviewed against the
    new vN.
 
 The corpus directory itself never has files deleted;
 provenance is preserved.
 
 ## 17. Open Questions
@@ -628,80 +634,84 @@ Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
   the methodology actually rests on. <!-- lint-ok: no-citation -->
 
 ## 19. Completion Report
 
 ### 19.1 Files changed
 
 - `scripts/check-corpus-completeness.sh` — mechanical
   corpus-completeness gate (new).
 - `research/primary-sources/INDEX.md` — v1.1 corpus
   index (bumped from v1.0 per codex remediation §7.D);
   22 rows total: 19 at status: primary-read-complete, 3
   at status: partial with deferred-reads notes per
   SPEC §7.2 (adr-tools-state, structurizr-dsl,
   json-schema).
 - `research/primary-sources/*.md` — 22 per-source
   artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   cyclonedx-sbom), all conforming to §6.2 schema +
   §8.1 front-matter:
   - arc42 (architecture documentation)
   - c4-model (architecture model)
   - adr-nygard (foundational ADR)
   - adr-tools-state (state-of-practice ADR)
   - diataxis (documentation taxonomy)
   - 12-factor (cloud-native SaaS methodology)
   - helm-values-schema (customization-affordance)
   - nix-flakes (reproducibility)
   - oci-artifacts (distribution packaging)
   - sigstore-cosign (signing)
   - symphony-spec (operating-model-as-SPEC)
   - spec-kit (spec-as-authoring tool)
   - kiro (agentic IDE)
   - openspec (spec-driven dev tool)
   - oracle-agent-spec (framework-agnostic agent
     description)
   - ref-arch-vs-solution-arch (ownership-split
     precursor)
   - leaddev-agent-compiled (published risk critique)
   - cucumber-gherkin (executable behavior spec)
   - openapi-3-1 (HTTP API contract)
   - structurizr-dsl (architecture-as-code)
+  - json-schema (added at v1.1 per §7.D; validation
+    primitive Helm + OpenAPI build on)
+  - cyclonedx-sbom (added at v1.1 per §7.D; SBOM
+    primary for the manifest's provenance facet)
 - This SPEC's §15 Acceptance Criteria checkboxes
   flipped to checked.
 
 ### 19.0 Amendment log (post-verification edits)
 
 Per the pattern established in the parent Decision SPEC
 §14.0, this Completion Report was filled at original
 verification 2026-05-19 (v1.0 source list, 20 sources).
 Subsequent codex cross-family remediation rounds amended
 §6.1 (v1.1 source-list expansion adding json-schema +
 cyclonedx-sbom), §7.2 (partial-with-note rule),
 research/primary-sources/* (overreach + status-truth
 fixes), and the check script (partial enforcement).
 Historical evidence values in §19.2 reflect original-
 verification state, NOT current state.
 
 | Round | Date | Notable | Current evidence |
 |---|---|---|---|
 | Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
 | §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
 | R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
 
 Current-state evidence values supersede §19.2:
 - corpus-SPEC citation-prefix hits: 55 (per current
   `lint-spec.sh` invocation)
 - corpus row count: 22 (19 primary-read-complete +
   3 partial)
 - script check: PASS — 22 sources (3 partial with
   deferred-reads notes)
 
 ### 19.2 Commands run (historical; original verification)
 
 - 25 `cmd://WebFetch` invocations across the 22 sources
   (some sources required supplementary fetches; one
   redirect was followed from nixos.org to nix.dev; 2
   v1.1 fetches added: json-schema + cyclonedx-sbom per
   codex remediation §7.D).
 - `cmd://bash scripts/lint-spec.sh
   specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   — exit 0 (0 errors, 0 warnings, 47 citation hits at

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"primary-read-complete|partial|access-blocked|22|20|json-schema|cyclonedx-sbom|complete OR|complete or|all 20|all 22|v1\\.0|v1\\.1|SOURCE_LIST_VERSION\" specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources/INDEX.md scripts/check-corpus-completeness.sh" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
scripts/check-corpus-completeness.sh:6:# file://specs/2026-05-19-primary-source-research-corpus/SPEC.md §7.2,
scripts/check-corpus-completeness.sh:14:#    primary-read-complete | partial | access-blocked | superseded | pending.
scripts/check-corpus-completeness.sh:15:# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
scripts/check-corpus-completeness.sh:18:# 7. Every access-blocked row has an alternative-source-found note OR
scripts/check-corpus-completeness.sh:32:SPEC_FILE="$REPO_ROOT/specs/2026-05-19-primary-source-research-corpus/SPEC.md"
scripts/check-corpus-completeness.sh:34:EXPECTED_VERSION="v1.1"
scripts/check-corpus-completeness.sh:46:# 2. SOURCE_LIST_VERSION matches.
scripts/check-corpus-completeness.sh:49:    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
scripts/check-corpus-completeness.sh:65:valid_statuses="primary-read-complete partial access-blocked superseded pending"
scripts/check-corpus-completeness.sh:89:    # Per SPEC §7.2, partial is acceptable iff the artefact §6 records
scripts/check-corpus-completeness.sh:91:    # script silently accepted partial and printed "all complete").
scripts/check-corpus-completeness.sh:92:    if [ "$status" = "partial" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
scripts/check-corpus-completeness.sh:94:            issues+=("slug '$slug' is partial but artefact has no deferred-reads note in §6 (per SPEC §7.2 partial requires explicit disclosure of what was not deep-read)")
scripts/check-corpus-completeness.sh:99:    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
scripts/check-corpus-completeness.sh:101:            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
scripts/check-corpus-completeness.sh:125:# Count partials for honest PASS reporting (codex Round-2 finding).
scripts/check-corpus-completeness.sh:126:n_partial=0
scripts/check-corpus-completeness.sh:128:    if [ "${index_status[$slug]}" = "partial" ]; then
scripts/check-corpus-completeness.sh:129:        n_partial=$((n_partial + 1))
scripts/check-corpus-completeness.sh:132:if [ $n_partial -gt 0 ]; then
scripts/check-corpus-completeness.sh:133:    printf 'check-corpus-completeness: PASS — %d sources (%d partial with deferred-reads notes)\n' "$n_rows" "$n_partial"
scripts/check-corpus-completeness.sh:135:    printf 'check-corpus-completeness: PASS — %d sources, all primary-read-complete\n' "$n_rows"
research/primary-sources/INDEX.md:3:Source-list version: v1.1
research/primary-sources/INDEX.md:4:Last updated: 2026-05-19
research/primary-sources/INDEX.md:7:`file://../../specs/2026-05-19-primary-source-research-corpus/SPEC.md`
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
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
research/primary-sources/INDEX.md:43:- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:2:id: 2026-05-19-primary-source-research-corpus
specs/2026-05-19-primary-source-research-corpus/SPEC.md:12:  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md:15:cites_decision: 2026-05-18-agentic-installation-methodology
specs/2026-05-19-primary-source-research-corpus/SPEC.md:41:The 2026-05-17 research workpad
specs/2026-05-19-primary-source-research-corpus/SPEC.md:42:(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:44:`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:51:`decision-authority://owner:2026-05-18` ("base this all in
specs/2026-05-19-primary-source-research-corpus/SPEC.md:85:- Repacking Product A v1.1 into manifest+catalog v2.0
specs/2026-05-19-primary-source-research-corpus/SPEC.md:100:current status (`pending` / `primary-read-complete` /
specs/2026-05-19-primary-source-research-corpus/SPEC.md:101:`partial` / `access-blocked` / `superseded`), and a one-line summary of
specs/2026-05-19-primary-source-research-corpus/SPEC.md:105:reports gaps (`pending` entries, `access-blocked` entries
specs/2026-05-19-primary-source-research-corpus/SPEC.md:123:- `decision-authority://owner:2026-05-18` — owner directive
specs/2026-05-19-primary-source-research-corpus/SPEC.md:128:  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:132:  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:140:- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:146:      for v1.0; subsequent additions land as follow-on
specs/2026-05-19-primary-source-research-corpus/SPEC.md:162:  access-blocked fallback.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:166:### 6.1 In-scope sources (v1.0)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:172:| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:185:| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:193:`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
specs/2026-05-19-primary-source-research-corpus/SPEC.md:194:`file://../2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
specs/2026-05-19-primary-source-research-corpus/SPEC.md:196:baseline. Two further candidates flagged but NOT v1.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:216:fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:242:   the 2026-05-17 research workpad (or earlier agent
specs/2026-05-19-primary-source-research-corpus/SPEC.md:264:paragraph of source text or (b) 200 words. The artefact
specs/2026-05-19-primary-source-research-corpus/SPEC.md:278:Source-list version: v1.0
specs/2026-05-19-primary-source-research-corpus/SPEC.md:283:| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:284:| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:304:   b. If primary URL is access-blocked, attempt
specs/2026-05-19-primary-source-research-corpus/SPEC.md:307:   c. If all fail, set `fetch_outcome: access-blocked`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:341:   `primary-read-complete | partial | access-blocked |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:343:5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
specs/2026-05-19-primary-source-research-corpus/SPEC.md:346:   (a) `primary-read-complete`, OR
specs/2026-05-19-primary-source-research-corpus/SPEC.md:347:   (b) `partial` with a documented deferred-reads note
specs/2026-05-19-primary-source-research-corpus/SPEC.md:348:       in the artefact §6 (the partial status is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:352:   (c) `access-blocked` with a documented alternative-
specs/2026-05-19-primary-source-research-corpus/SPEC.md:356:   (Updated 2026-05-19 to align with the v1.1 source-
specs/2026-05-19-primary-source-research-corpus/SPEC.md:357:   list expansion which introduced legitimate `partial`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:360:   or access-blocked which contradicted the v1.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:389:fetch_outcome:      # enum: primary-read-complete | partial |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:390:                    #       access-blocked
specs/2026-05-19-primary-source-research-corpus/SPEC.md:405:- `Status` is one of: `primary-read-complete`, `partial`,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:406:  `access-blocked`, `superseded`, `pending`.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:427:                          if row.status == "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:444:| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:446:| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:497:| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:502:| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:503:| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:504:| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:505:| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:528:      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:537:      complete`, (b) `partial` with deferred-reads note
specs/2026-05-19-primary-source-research-corpus/SPEC.md:538:      per §7.2 (the partial-with-note rule, v1.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:539:      alignment), OR (c) `access-blocked` with
specs/2026-05-19-primary-source-research-corpus/SPEC.md:542:      "complete OR access-blocked + note" wording was
specs/2026-05-19-primary-source-research-corpus/SPEC.md:552:      fetch outcomes + any access-blocked resolutions.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:585:- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:604:      RESOLVED 2026-05-19 (codex remediation §7.D
specs/2026-05-19-primary-source-research-corpus/SPEC.md:605:      brought JSON Schema + CycloneDX SBOM into v1.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:606:      source list; `SOURCE_LIST_VERSION` bumped to
specs/2026-05-19-primary-source-research-corpus/SPEC.md:607:      v1.1). REMAINING v1.2 candidates: SPDX (alternate
specs/2026-05-19-primary-source-research-corpus/SPEC.md:612:      blocker for v1.1 corpus closure.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:621:state. The 2026-05-17 dispositioned research workpad
specs/2026-05-19-primary-source-research-corpus/SPEC.md:622:(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:642:- `research/primary-sources/INDEX.md` — v1.1 corpus
specs/2026-05-19-primary-source-research-corpus/SPEC.md:643:  index (bumped from v1.0 per codex remediation §7.D);
specs/2026-05-19-primary-source-research-corpus/SPEC.md:644:  22 rows total: 19 at status: primary-read-complete, 3
specs/2026-05-19-primary-source-research-corpus/SPEC.md:645:  at status: partial with deferred-reads notes per
specs/2026-05-19-primary-source-research-corpus/SPEC.md:647:  json-schema).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:648:- `research/primary-sources/*.md` — 22 per-source
specs/2026-05-19-primary-source-research-corpus/SPEC.md:649:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:650:  cyclonedx-sbom), all conforming to §6.2 schema +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:674:  - json-schema (added at v1.1 per §7.D; validation
specs/2026-05-19-primary-source-research-corpus/SPEC.md:676:  - cyclonedx-sbom (added at v1.1 per §7.D; SBOM
specs/2026-05-19-primary-source-research-corpus/SPEC.md:685:verification 2026-05-19 (v1.0 source list, 20 sources).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:687:§6.1 (v1.1 source-list expansion adding json-schema +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:688:cyclonedx-sbom), §7.2 (partial-with-note rule),
specs/2026-05-19-primary-source-research-corpus/SPEC.md:690:fixes), and the check script (partial enforcement).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:696:| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:697:| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:698:| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:703:- corpus row count: 22 (19 primary-read-complete +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:704:  3 partial)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:705:- script check: PASS — 22 sources (3 partial with
specs/2026-05-19-primary-source-research-corpus/SPEC.md:710:- 25 `cmd://WebFetch` invocations across the 22 sources
specs/2026-05-19-primary-source-research-corpus/SPEC.md:713:  v1.1 fetches added: json-schema + cyclonedx-sbom per
specs/2026-05-19-primary-source-research-corpus/SPEC.md:716:  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:721:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:730:  2. Uncited-claim: 18 of 22 artefacts have
specs/2026-05-19-primary-source-research-corpus/SPEC.md:761:- AC-4: check-corpus-completeness.sh exits 0; 22
specs/2026-05-19-primary-source-research-corpus/SPEC.md:762:  slugs total (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:763:  with deferred-reads notes per the §7.2 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:764:  rule; codex remediation §7.D added json-schema +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:765:  cyclonedx-sbom; codex Round-2 added the partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:771:- AC-7: no verbatim §3 quote exceeds the 200-word
specs/2026-05-19-primary-source-research-corpus/SPEC.md:776:  fetch outcomes (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:778:  structurizr-dsl, json-schema; zero access-blocked)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:784:  directive 2026-05-18 ("base this all in deep
specs/2026-05-19-primary-source-research-corpus/SPEC.md:801:- **Three artefacts at `partial` status, with INDEX
specs/2026-05-19-primary-source-research-corpus/SPEC.md:802:  rows now correctly showing `partial` per the v1.1 +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:811:    the fetched page. Fetch outcome `partial` in both
specs/2026-05-19-primary-source-research-corpus/SPEC.md:819:    sub-pages not fetched. Outcome `partial` in both
specs/2026-05-19-primary-source-research-corpus/SPEC.md:821:    `primary-read-complete` to `partial` per codex
specs/2026-05-19-primary-source-research-corpus/SPEC.md:824:  - `json-schema` — added at v1.1 source-list
specs/2026-05-19-primary-source-research-corpus/SPEC.md:827:    Validation) NOT deep-read. Outcome `partial` in
specs/2026-05-19-primary-source-research-corpus/SPEC.md:873:  the 200-word fair-use bound (§6.3) proved easy to

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; printf '"'%s ' \""'$(basename "$f" .md)"; awk '"'NR==1,/"'^---$/{if ($1=="fetch_outcome:") print $2}'"' \""'$f" | tail -1; done | sort' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor adr-nygard adr-tools-state arc42 c4-model cucumber-gherkin cyclonedx-sbom diataxis helm-values-schema json-schema kiro leaddev-agent-compiled nix-flakes oci-artifacts openapi-3-1 openspec oracle-agent-spec ref-arch-vs-solution-arch sigstore-cosign spec-kit structurizr-dsl symphony-spec 

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^fetch_outcome:" research/primary-sources/*.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/json-schema.md:7:fetch_outcome: "partial"
research/primary-sources/symphony-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/helm-values-schema.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/diataxis.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/structurizr-dsl.md:7:fetch_outcome: "partial"
research/primary-sources/spec-kit.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/ref-arch-vs-solution-arch.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/sigstore-cosign.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cucumber-gherkin.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cyclonedx-sbom.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oracle-agent-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/c4-model.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/arc42.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openapi-3-1.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/adr-tools-state.md:7:fetch_outcome: "partial"
research/primary-sources/oci-artifacts.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openspec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/adr-nygard.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/nix-flakes.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/leaddev-agent-compiled.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/kiro.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/12-factor.md:7:fetch_outcome: "primary-read-complete"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^slug:|''^source_name:|''^primary_url:|''^fetched_via:|''^fetched_on:|''^fetch_outcome:|''^fetch_evidence:|''^methodology_relevance:" research/primary-sources/*.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/helm-values-schema.md:2:slug: helm-values-schema
research/primary-sources/helm-values-schema.md:3:source_name: "Helm Charts — values.yaml + values.schema.json"
research/primary-sources/helm-values-schema.md:4:primary_url: "https://helm.sh/docs/topics/charts/"
research/primary-sources/helm-values-schema.md:5:fetched_via: "WebFetch"
research/primary-sources/helm-values-schema.md:6:fetched_on: 2026-05-19
research/primary-sources/helm-values-schema.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/helm-values-schema.md:8:fetch_evidence: "fetched Helm docs/topics/charts/; Chart.yaml + values.yaml + schema validation behaviour confirmed"
research/primary-sources/helm-values-schema.md:9:methodology_relevance: |
research/primary-sources/json-schema.md:2:slug: json-schema
research/primary-sources/json-schema.md:3:source_name: "JSON Schema specification (Draft 2020-12)"
research/primary-sources/json-schema.md:4:primary_url: "https://json-schema.org/specification.html"
research/primary-sources/json-schema.md:5:fetched_via: "WebFetch"
research/primary-sources/json-schema.md:6:fetched_on: 2026-05-19
research/primary-sources/json-schema.md:7:fetch_outcome: "partial"
research/primary-sources/json-schema.md:8:fetch_evidence: "fetched specification index page; vocabularies enumerated; conceptual definition + validation model NOT on the index page — both live on the actual spec drafts referenced from it"
research/primary-sources/json-schema.md:9:methodology_relevance: |
research/primary-sources/structurizr-dsl.md:2:slug: structurizr-dsl
research/primary-sources/structurizr-dsl.md:3:source_name: "Structurizr DSL — text-based C4 model definition"
research/primary-sources/structurizr-dsl.md:4:primary_url: "https://docs.structurizr.com/dsl"
research/primary-sources/structurizr-dsl.md:5:fetched_via: "WebFetch"
research/primary-sources/structurizr-dsl.md:6:fetched_on: 2026-05-19
research/primary-sources/structurizr-dsl.md:7:fetch_outcome: "partial"
research/primary-sources/structurizr-dsl.md:8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
research/primary-sources/structurizr-dsl.md:9:methodology_relevance: |
research/primary-sources/symphony-spec.md:2:slug: symphony-spec
research/primary-sources/symphony-spec.md:3:source_name: "OpenAI Symphony — SPEC.md (operating-model-as-SPEC)"
research/primary-sources/symphony-spec.md:4:primary_url: "https://github.com/openai/symphony/blob/main/SPEC.md"
research/primary-sources/symphony-spec.md:5:fetched_via: "WebFetch"
research/primary-sources/symphony-spec.md:6:fetched_on: 2026-05-19
research/primary-sources/symphony-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/symphony-spec.md:8:fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
research/primary-sources/symphony-spec.md:9:methodology_relevance: |
research/primary-sources/spec-kit.md:2:slug: spec-kit
research/primary-sources/spec-kit.md:3:source_name: "GitHub Spec Kit — Spec-Driven Development toolkit"
research/primary-sources/spec-kit.md:4:primary_url: "https://github.com/github/spec-kit"
research/primary-sources/spec-kit.md:5:fetched_via: "WebFetch"
research/primary-sources/spec-kit.md:6:fetched_on: 2026-05-19
research/primary-sources/spec-kit.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/spec-kit.md:8:fetch_evidence: "fetched github/spec-kit repository README; six-command lifecycle + artefact set + posture verbatim"
research/primary-sources/spec-kit.md:9:methodology_relevance: |
research/primary-sources/diataxis.md:2:slug: diataxis
research/primary-sources/diataxis.md:3:source_name: "Diátaxis — a systematic framework for technical documentation authoring"
research/primary-sources/diataxis.md:4:primary_url: "https://diataxis.fr/"
research/primary-sources/diataxis.md:5:fetched_via: "WebFetch"
research/primary-sources/diataxis.md:6:fetched_on: 2026-05-19
research/primary-sources/diataxis.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/diataxis.md:8:fetch_evidence: "fetched diataxis.fr/ + diataxis.fr/start-here/; four-mode taxonomy + two-axis structure confirmed verbatim"
research/primary-sources/diataxis.md:9:methodology_relevance: |
research/primary-sources/cyclonedx-sbom.md:2:slug: cyclonedx-sbom
research/primary-sources/cyclonedx-sbom.md:3:source_name: "CycloneDX Software Bill of Materials specification"
research/primary-sources/cyclonedx-sbom.md:4:primary_url: "https://cyclonedx.org/specification/overview/"
research/primary-sources/cyclonedx-sbom.md:5:fetched_via: "WebFetch"
research/primary-sources/cyclonedx-sbom.md:6:fetched_on: 2026-05-19
research/primary-sources/cyclonedx-sbom.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cyclonedx-sbom.md:8:fetch_evidence: "fetched cyclonedx.org specification overview; definition + SBOM contents + format enumeration + supply-chain framing confirmed verbatim"
research/primary-sources/cyclonedx-sbom.md:9:methodology_relevance: |
research/primary-sources/sigstore-cosign.md:2:slug: sigstore-cosign
research/primary-sources/sigstore-cosign.md:3:source_name: "Sigstore + cosign — keyless signing for software supply chain"
research/primary-sources/sigstore-cosign.md:4:primary_url: "https://docs.sigstore.dev/"
research/primary-sources/sigstore-cosign.md:5:fetched_via: "WebFetch"
research/primary-sources/sigstore-cosign.md:6:fetched_on: 2026-05-19
research/primary-sources/sigstore-cosign.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/sigstore-cosign.md:8:fetch_evidence: "fetched Sigstore docs root; Fulcio + Rekor + cosign architecture and keyless model verbatim"
research/primary-sources/sigstore-cosign.md:9:methodology_relevance: |
research/primary-sources/ref-arch-vs-solution-arch.md:2:slug: ref-arch-vs-solution-arch
research/primary-sources/ref-arch-vs-solution-arch.md:3:source_name: "Mike Cottmeyer — Reference Architecture vs Reference Implementation (LiminalArc, 2019)"
research/primary-sources/ref-arch-vs-solution-arch.md:4:primary_url: "https://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/"
research/primary-sources/ref-arch-vs-solution-arch.md:5:fetched_via: "WebFetch"
research/primary-sources/ref-arch-vs-solution-arch.md:6:fetched_on: 2026-05-19
research/primary-sources/ref-arch-vs-solution-arch.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/ref-arch-vs-solution-arch.md:8:fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
research/primary-sources/ref-arch-vs-solution-arch.md:9:methodology_relevance: |
research/primary-sources/oracle-agent-spec.md:2:slug: oracle-agent-spec
research/primary-sources/oracle-agent-spec.md:3:source_name: "Oracle Open Agent Spec (Agent Spec)"
research/primary-sources/oracle-agent-spec.md:4:primary_url: "https://github.com/oracle/agent-spec"
research/primary-sources/oracle-agent-spec.md:5:fetched_via: "WebFetch"
research/primary-sources/oracle-agent-spec.md:6:fetched_on: 2026-05-19
research/primary-sources/oracle-agent-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oracle-agent-spec.md:8:fetch_evidence: "fetched oracle/agent-spec README; framework-agnostic declarative language definition + JSON/YAML serialization + multi-SDK conformance verbatim"
research/primary-sources/oracle-agent-spec.md:9:methodology_relevance: |
research/primary-sources/cucumber-gherkin.md:2:slug: cucumber-gherkin
research/primary-sources/cucumber-gherkin.md:3:source_name: "Cucumber / Gherkin — executable specifications"
research/primary-sources/cucumber-gherkin.md:4:primary_url: "https://cucumber.io/docs/gherkin/reference"
research/primary-sources/cucumber-gherkin.md:5:fetched_via: "WebFetch"
research/primary-sources/cucumber-gherkin.md:6:fetched_on: 2026-05-19
research/primary-sources/cucumber-gherkin.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cucumber-gherkin.md:8:fetch_evidence: "fetched cucumber.io gherkin reference; Given/When/Then + Feature/Scenario/Background structure + executable-spec characterisation verbatim"
research/primary-sources/cucumber-gherkin.md:9:methodology_relevance: |
research/primary-sources/c4-model.md:2:slug: c4-model
research/primary-sources/c4-model.md:3:source_name: "The C4 model for visualising software architecture"
research/primary-sources/c4-model.md:4:primary_url: "https://c4model.com/"
research/primary-sources/c4-model.md:5:fetched_via: "WebFetch"
research/primary-sources/c4-model.md:6:fetched_on: 2026-05-19
research/primary-sources/c4-model.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/c4-model.md:8:fetch_evidence: "fetched c4model.com/ + c4model.com/abstractions; four-level hierarchy confirmed verbatim; notation+tooling independence confirmed"
research/primary-sources/c4-model.md:9:methodology_relevance: |
research/primary-sources/openspec.md:2:slug: openspec
research/primary-sources/openspec.md:3:source_name: "OpenSpec — Spec-driven development for AI coding assistants"
research/primary-sources/openspec.md:4:primary_url: "https://github.com/Fission-AI/OpenSpec"
research/primary-sources/openspec.md:5:fetched_via: "WebFetch"
research/primary-sources/openspec.md:6:fetched_on: 2026-05-19
research/primary-sources/openspec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openspec.md:8:fetch_evidence: "fetched Fission-AI/OpenSpec README; three-command workflow + artefact set + lighter-than-Spec-Kit posture verbatim"
research/primary-sources/openspec.md:9:methodology_relevance: |
research/primary-sources/arc42.md:2:slug: arc42
research/primary-sources/arc42.md:3:source_name: "arc42 — template for architecture communication and documentation"
research/primary-sources/arc42.md:4:primary_url: "https://docs.arc42.org/section-1/"
research/primary-sources/arc42.md:5:fetched_via: "WebFetch"
research/primary-sources/arc42.md:6:fetched_on: 2026-05-19
research/primary-sources/arc42.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/arc42.md:8:fetch_evidence: "fetched docs.arc42.org/section-1/ and arc42.org/overview/; section list + maintainers + license confirmed"
research/primary-sources/arc42.md:9:methodology_relevance: |
research/primary-sources/adr-tools-state.md:2:slug: adr-tools-state
research/primary-sources/adr-tools-state.md:3:source_name: "adr.github.io — state of ADR practice"
research/primary-sources/adr-tools-state.md:4:primary_url: "https://adr.github.io/"
research/primary-sources/adr-tools-state.md:5:fetched_via: "WebFetch"
research/primary-sources/adr-tools-state.md:6:fetched_on: 2026-05-19
research/primary-sources/adr-tools-state.md:7:fetch_outcome: "partial"
research/primary-sources/adr-tools-state.md:8:fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
research/primary-sources/adr-tools-state.md:9:methodology_relevance: |
research/primary-sources/oci-artifacts.md:2:slug: oci-artifacts
research/primary-sources/oci-artifacts.md:3:source_name: "OCI Image Specification + Artifacts Guidance"
research/primary-sources/oci-artifacts.md:4:primary_url: "https://github.com/opencontainers/image-spec/blob/main/spec.md"
research/primary-sources/oci-artifacts.md:5:fetched_via: "WebFetch"
research/primary-sources/oci-artifacts.md:6:fetched_on: 2026-05-19
research/primary-sources/oci-artifacts.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oci-artifacts.md:8:fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
research/primary-sources/oci-artifacts.md:9:methodology_relevance: |
research/primary-sources/adr-nygard.md:2:slug: adr-nygard
research/primary-sources/adr-nygard.md:3:source_name: "Documenting Architecture Decisions — Michael Nygard (2011)"
research/primary-sources/adr-nygard.md:4:primary_url: "https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions"
research/primary-sources/adr-nygard.md:5:fetched_via: "WebFetch"
research/primary-sources/adr-nygard.md:6:fetched_on: 2026-05-19
research/primary-sources/adr-nygard.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/adr-nygard.md:8:fetch_evidence: "fetched Cognitect blog post directly; ADR template + rationale + lightweight thesis confirmed verbatim"
research/primary-sources/adr-nygard.md:9:methodology_relevance: |
research/primary-sources/openapi-3-1.md:2:slug: openapi-3-1
research/primary-sources/openapi-3-1.md:3:source_name: "OpenAPI Specification 3.1.0"
research/primary-sources/openapi-3-1.md:4:primary_url: "https://spec.openapis.org/oas/v3.1.0"
research/primary-sources/openapi-3-1.md:5:fetched_via: "WebFetch"
research/primary-sources/openapi-3-1.md:6:fetched_on: 2026-05-19
research/primary-sources/openapi-3-1.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openapi-3-1.md:8:fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
research/primary-sources/openapi-3-1.md:9:methodology_relevance: |
research/primary-sources/nix-flakes.md:2:slug: nix-flakes
research/primary-sources/nix-flakes.md:3:source_name: "Nix Flakes — flake.nix + flake.lock"
research/primary-sources/nix-flakes.md:4:primary_url: "https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake"
research/primary-sources/nix-flakes.md:5:fetched_via: "WebFetch"
research/primary-sources/nix-flakes.md:6:fetched_on: 2026-05-19
research/primary-sources/nix-flakes.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/nix-flakes.md:8:fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
research/primary-sources/nix-flakes.md:9:methodology_relevance: |
research/primary-sources/leaddev-agent-compiled.md:2:slug: leaddev-agent-compiled
research/primary-sources/leaddev-agent-compiled.md:3:source_name: "LeadDev — Can you trust the spec? The risky future of agent-compiled software"
research/primary-sources/leaddev-agent-compiled.md:4:primary_url: "https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software"
research/primary-sources/leaddev-agent-compiled.md:5:fetched_via: "WebFetch"
research/primary-sources/leaddev-agent-compiled.md:6:fetched_on: 2026-05-19
research/primary-sources/leaddev-agent-compiled.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/leaddev-agent-compiled.md:8:fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
research/primary-sources/leaddev-agent-compiled.md:9:methodology_relevance: |
research/primary-sources/12-factor.md:2:slug: 12-factor
research/primary-sources/12-factor.md:3:source_name: "The Twelve-Factor App"
research/primary-sources/12-factor.md:4:primary_url: "https://12factor.net/"
research/primary-sources/12-factor.md:5:fetched_via: "WebFetch"
research/primary-sources/12-factor.md:6:fetched_on: 2026-05-19
research/primary-sources/12-factor.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/12-factor.md:8:fetch_evidence: "fetched 12factor.net root; methodology characterisation + 12 factor names verbatim + Factor III headline"
research/primary-sources/12-factor.md:9:methodology_relevance: |
research/primary-sources/kiro.md:2:slug: kiro
research/primary-sources/kiro.md:3:source_name: "Kiro — agentic AI coding IDE with spec-driven workflow"
research/primary-sources/kiro.md:4:primary_url: "https://kiro.dev/"
research/primary-sources/kiro.md:5:fetched_via: "WebFetch"
research/primary-sources/kiro.md:6:fetched_on: 2026-05-19
research/primary-sources/kiro.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/kiro.md:8:fetch_evidence: "fetched kiro.dev root; three-phase workflow (requirements / design / implementation) + EARS notation reference verbatim"
research/primary-sources/kiro.md:9:methodology_relevance: |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'shellcheck scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 127 in 0ms:
/home/linuxbrew/.linuxbrew/bin/bash: line 1: shellcheck: command not found

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; printf '"'%s\\n' \"--- "'$(basename "$f")"; rg -n "not deep-read|deep-read.*deferred|deferred to|sub-page.* NOT|reserved for v1'"\\.|reserved for follow-on|alternative|unreachable|fallback\" \""'$f" | head -5; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 286ms:
--- json-schema.md
116:  earlier drafts (Draft 7, Draft 6) is not deep-read;
--- kiro.md
120:  workspaces; not deep-read in this pass.
--- leaddev-agent-compiled.md
--- nix-flakes.md
--- oci-artifacts.md
--- openapi-3-1.md
137:  methodology MAY support; not deep-read in this pass.
--- openspec.md
--- oracle-agent-spec.md
110:  were not deep-read on this pass. If the
--- ref-arch-vs-solution-arch.md
--- sigstore-cosign.md
--- spec-kit.md
--- structurizr-dsl.md
8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
96:  keywords) was not deep-read in this pass — only the
--- symphony-spec.md
32:- License: project license (OpenAI; not deep-read for

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f research/primary-sources/INDEX.md && test -x scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "comm -3 <(awk -F'|' '/"'^'"\\| [a-z0-9-]+ / { gsub(/"'^ +| +$/, "", $2); print $2 }'"' research/primary-sources/INDEX.md | sort) <(find research/primary-sources -maxdepth 1 -type f -name '*.md' "'! -name INDEX.md -printf '"'%f\\n' | sed 's/\\.md"'$//'"' | sort)" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
?? reviews/codex-2026-05-19-round6/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "comm -3 <(awk -F'|' '/"'^'"\\| [a-z0-9-]+ / { gsub(/"'^ +| +$/, "", $2); print $2 }'"' specs/2026-05-19-primary-source-research-corpus/SPEC.md | sort) <(awk -F'|' '/"'^'"\\| [a-z0-9-]+ / { gsub(/"'^ +| +$/, "", $2); print $2 }'"' research/primary-sources/INDEX.md | sort)" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
arc42
c4-model

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"Status: Draft v1|status: verified|approved-pending-owner|same-family|cross-family|R5|Round-5|complete OR|only complete|all primary-read-complete|all 20|20 rows|v1\\.0 frozen|v1\\.0\\)\" specs/2026-05-19-primary-source-research-corpus/SPEC.md research/primary-sources scripts/check-corpus-completeness.sh" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
scripts/check-corpus-completeness.sh:135:    printf 'check-corpus-completeness: PASS — %d sources, all primary-read-complete\n' "$n_rows"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:3:status: verified
specs/2026-05-19-primary-source-research-corpus/SPEC.md:20:Status: Draft v1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:166:### 6.1 In-scope sources (v1.0)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:359:   sub-pages; previous §7.2 rule allowed only complete
specs/2026-05-19-primary-source-research-corpus/SPEC.md:376:interim, reviewers (cross-family and same-family)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:541:      Updated per codex Round-5 finding that the prior
specs/2026-05-19-primary-source-research-corpus/SPEC.md:542:      "complete OR access-blocked + note" wording was
specs/2026-05-19-primary-source-research-corpus/SPEC.md:554:      Decision §7) signs off OR same-family-proxy is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:555:      recorded with the cross-family-deferral rationale.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:585:- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:595:      The parent Decision §7 makes cross-family review
specs/2026-05-19-primary-source-research-corpus/SPEC.md:600:      Default: same-family proxy with explicit caveat
specs/2026-05-19-primary-source-research-corpus/SPEC.md:601:      recorded; if owner directs external cross-family,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:686:Subsequent codex cross-family remediation rounds amended
specs/2026-05-19-primary-source-research-corpus/SPEC.md:698:| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:782:- AC-9: cross-family review deferred. Same-family
specs/2026-05-19-primary-source-research-corpus/SPEC.md:788:  cross-family review as a secondary check that can

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; missing=0; for s in "## §1 Source identity" "## §2 Fetch trace" "## §3 Verbatim claims this corpus depends on" "## §4 Gap from prior summary characterization" "## §5 Downstream-citation surface" "## §6 Open questions surfaced by the primary read"; do if ! rg -q "''^${s//'"\\/\\\\}\" \""'$f"; then echo "$(basename "$f"): missing $s"; missing=1; fi; done; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; slug=$(basename "$f" .md); fm_slug=$(awk -F'"': *' '"'$1=="slug" {print $2; exit}'"' \""'$f"); [ "$slug" = "$fm_slug" ] || echo "$slug file has slug $fm_slug"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
 succeeded in 742ms:
arc42.md: missing ## §6 Open questions surfaced by the primary read
c4-model.md: missing ## §1 Source identity
c4-model.md: missing ## §2 Fetch trace
c4-model.md: missing ## §3 Verbatim claims this corpus depends on
c4-model.md: missing ## §4 Gap from prior summary characterization
c4-model.md: missing ## §5 Downstream-citation surface
c4-model.md: missing ## §6 Open questions surfaced by the primary read
cucumber-gherkin.md: missing ## §1 Source identity
cucumber-gherkin.md: missing ## §2 Fetch trace
cucumber-gherkin.md: missing ## §3 Verbatim claims this corpus depends on
cucumber-gherkin.md: missing ## §4 Gap from prior summary characterization
cucumber-gherkin.md: missing ## §5 Downstream-citation surface
cucumber-gherkin.md: missing ## §6 Open questions surfaced by the primary read
cyclonedx-sbom.md: missing ## §1 Source identity
cyclonedx-sbom.md: missing ## §2 Fetch trace
cyclonedx-sbom.md: missing ## §3 Verbatim claims this corpus depends on
cyclonedx-sbom.md: missing ## §4 Gap from prior summary characterization
cyclonedx-sbom.md: missing ## §5 Downstream-citation surface
cyclonedx-sbom.md: missing ## §6 Open questions surfaced by the primary read
diataxis.md: missing ## §1 Source identity
diataxis.md: missing ## §2 Fetch trace
diataxis.md: missing ## §3 Verbatim claims this corpus depends on
diataxis.md: missing ## §4 Gap from prior summary characterization
diataxis.md: missing ## §5 Downstream-citation surface
diataxis.md: missing ## §6 Open questions surfaced by the primary read
helm-values-schema.md: missing ## §1 Source identity
helm-values-schema.md: missing ## §2 Fetch trace
helm-values-schema.md: missing ## §3 Verbatim claims this corpus depends on
helm-values-schema.md: missing ## §4 Gap from prior summary characterization
helm-values-schema.md: missing ## §5 Downstream-citation surface
helm-values-schema.md: missing ## §6 Open questions surfaced by the primary read
json-schema.md: missing ## §1 Source identity
json-schema.md: missing ## §2 Fetch trace
json-schema.md: missing ## §3 Verbatim claims this corpus depends on
json-schema.md: missing ## §4 Gap from prior summary characterization
json-schema.md: missing ## §5 Downstream-citation surface
json-schema.md: missing ## §6 Open questions surfaced by the primary read
kiro.md: missing ## §1 Source identity
kiro.md: missing ## §2 Fetch trace
kiro.md: missing ## §3 Verbatim claims this corpus depends on
kiro.md: missing ## §4 Gap from prior summary characterization
kiro.md: missing ## §5 Downstream-citation surface
kiro.md: missing ## §6 Open questions surfaced by the primary read
leaddev-agent-compiled.md: missing ## §1 Source identity
leaddev-agent-compiled.md: missing ## §2 Fetch trace
leaddev-agent-compiled.md: missing ## §3 Verbatim claims this corpus depends on
leaddev-agent-compiled.md: missing ## §4 Gap from prior summary characterization
leaddev-agent-compiled.md: missing ## §5 Downstream-citation surface
leaddev-agent-compiled.md: missing ## §6 Open questions surfaced by the primary read
nix-flakes.md: missing ## §1 Source identity
nix-flakes.md: missing ## §2 Fetch trace
nix-flakes.md: missing ## §3 Verbatim claims this corpus depends on
nix-flakes.md: missing ## §4 Gap from prior summary characterization
nix-flakes.md: missing ## §5 Downstream-citation surface
nix-flakes.md: missing ## §6 Open questions surfaced by the primary read
oci-artifacts.md: missing ## §1 Source identity
oci-artifacts.md: missing ## §2 Fetch trace
oci-artifacts.md: missing ## §3 Verbatim claims this corpus depends on
oci-artifacts.md: missing ## §4 Gap from prior summary characterization
oci-artifacts.md: missing ## §5 Downstream-citation surface
oci-artifacts.md: missing ## §6 Open questions surfaced by the primary read
openapi-3-1.md: missing ## §1 Source identity
openapi-3-1.md: missing ## §2 Fetch trace
openapi-3-1.md: missing ## §3 Verbatim claims this corpus depends on
openapi-3-1.md: missing ## §4 Gap from prior summary characterization
openapi-3-1.md: missing ## §5 Downstream-citation surface
openapi-3-1.md: missing ## §6 Open questions surfaced by the primary read
openspec.md: missing ## §1 Source identity
openspec.md: missing ## §2 Fetch trace
openspec.md: missing ## §3 Verbatim claims this corpus depends on
openspec.md: missing ## §4 Gap from prior summary characterization
openspec.md: missing ## §5 Downstream-citation surface
openspec.md: missing ## §6 Open questions surfaced by the primary read
oracle-agent-spec.md: missing ## §1 Source identity
oracle-agent-spec.md: missing ## §2 Fetch trace
oracle-agent-spec.md: missing ## §3 Verbatim claims this corpus depends on
oracle-agent-spec.md: missing ## §4 Gap from prior summary characterization
oracle-agent-spec.md: missing ## §5 Downstream-citation surface
oracle-agent-spec.md: missing ## §6 Open questions surfaced by the primary read
ref-arch-vs-solution-arch.md: missing ## §1 Source identity
ref-arch-vs-solution-arch.md: missing ## §2 Fetch trace
ref-arch-vs-solution-arch.md: missing ## §3 Verbatim claims this corpus depends on
ref-arch-vs-solution-arch.md: missing ## §4 Gap from prior summary characterization
ref-arch-vs-solution-arch.md: missing ## §5 Downstream-citation surface
ref-arch-vs-solution-arch.md: missing ## §6 Open questions surfaced by the primary read
sigstore-cosign.md: missing ## §1 Source identity
sigstore-cosign.md: missing ## §2 Fetch trace
sigstore-cosign.md: missing ## §3 Verbatim claims this corpus depends on
sigstore-cosign.md: missing ## §4 Gap from prior summary characterization
sigstore-cosign.md: missing ## §5 Downstream-citation surface
sigstore-cosign.md: missing ## §6 Open questions surfaced by the primary read
spec-kit.md: missing ## §1 Source identity
spec-kit.md: missing ## §2 Fetch trace
spec-kit.md: missing ## §3 Verbatim claims this corpus depends on
spec-kit.md: missing ## §4 Gap from prior summary characterization
spec-kit.md: missing ## §5 Downstream-citation surface
spec-kit.md: missing ## §6 Open questions surfaced by the primary read
structurizr-dsl.md: missing ## §1 Source identity
structurizr-dsl.md: missing ## §2 Fetch trace
structurizr-dsl.md: missing ## §3 Verbatim claims this corpus depends on
structurizr-dsl.md: missing ## §4 Gap from prior summary characterization
structurizr-dsl.md: missing ## §5 Downstream-citation surface
structurizr-dsl.md: missing ## §6 Open questions surfaced by the primary read
symphony-spec.md: missing ## §1 Source identity
symphony-spec.md: missing ## §2 Fetch trace
symphony-spec.md: missing ## §3 Verbatim claims this corpus depends on
symphony-spec.md: missing ## §4 Gap from prior summary characterization
symphony-spec.md: missing ## §5 Downstream-citation surface
symphony-spec.md: missing ## §6 Open questions surfaced by the primary read

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/arc42.md | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	slug: arc42
     3	source_name: "arc42 — template for architecture communication and documentation"
     4	primary_url: "https://docs.arc42.org/section-1/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched docs.arc42.org/section-1/ and arc42.org/overview/; section list + maintainers + license confirmed"
     9	methodology_relevance: |
    10	  arc42 is the most-cited prior-art template for architecture
    11	  documentation in the methodology's research workpad §3 / §4.
    12	  This corpus entry establishes arc42's 12-section structure,
    13	  its self-description ("template for architecture communication
    14	  and documentation"), and its maintenance posture, so the
    15	  methodology can cite arc42 sections precisely (e.g. §8
    16	  Crosscutting Concepts vs §9 Architectural Decisions) when
    17	  comparing decomposition primitives.
    18	---
    19	
    20	# arc42
    21	
    22	## 1. Source identity
    23	
    24	- Name: arc42 — Template for Architecture Communication and
    25	  Documentation.
    26	- Canonical URL: `url://docs.arc42.org/` (primary template
    27	  chapters at `/section-1/` through `/section-12/`); overview
    28	  at `url://arc42.org/overview/`.
    29	- Maintainers: Dr. Peter Hruschka and Dr. Gernot Starke
    30	  (`url://arc42.org/overview/`).
    31	- Supporters: Per Starke Web Development; innoQ
    32	  (`url://arc42.org/overview/`).
    33	- License posture: open-source-friendly; explicit licence
    34	  link at `url://arc42.org/license` (not deep-read).
    35	
    36	## 2. Fetch trace
    37	
    38	- `cmd://WebFetch url://docs.arc42.org/section-1/` —
    39	  2026-05-19; returned section listing + section-1
    40	  excerpts; primary read.
    41	- `cmd://WebFetch url://arc42.org/overview/` — 2026-05-19;
    42	  returned definition, maintainers, license link;
    43	  supplementary primary read.
    44	
    45	## 3. Verbatim claims this corpus depends on
    46	
    47	- **Self-definition (overview page)**: arc42 describes
    48	  itself as "a template for architecture communication and
    49	  documentation." It addresses "what should be documented
    50	  about your architecture, and how it should be
    51	  communicated." (`url://arc42.org/overview/`)
    52	
    53	- **The 12 sections** of the arc42 template
    54	  (`url://docs.arc42.org/section-1/` navigation), in order:
    55	
    56	  1. Introduction and Goals
    57	  2. Constraints
    58	  3. Context and scope
    59	  4. Solution strategy
    60	  5. Building block view
    61	  6. Runtime view
    62	  7. Deployment view
    63	  8. Concepts
    64	  9. Architecture decisions
    65	  10. Quality
    66	  11. Risks and technical debt
    67	  12. Glossary
    68	
    69	- **Section 1.0 (Introduction and Goals)** — verbatim:
    70	  "Describes the relevant requirements and the driving
    71	  forces that software architects and development team
    72	  must consider." (`url://docs.arc42.org/section-1/`)
    73	
    74	- **Section 1.2 (Quality Goals)** — verbatim: "The top
    75	  three (max five) quality goals for the architecture
    76	  whose fulfillment is of highest importance to the major
    77	  stakeholders." (`url://docs.arc42.org/section-1/`)
    78	
    79	- **Posture** (overview): the template "presents itself
    80	  as pragmatic and tailored to your specific needs."

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^##" research/primary-sources/arc42.md research/primary-sources/json-schema.md research/primary-sources/adr-tools-state.md research/primary-sources/structurizr-dsl.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/structurizr-dsl.md:19:## 1. Source identity
research/primary-sources/structurizr-dsl.md:27:## 2. Fetch trace
research/primary-sources/structurizr-dsl.md:34:## 3. Verbatim claims this corpus depends on
research/primary-sources/structurizr-dsl.md:52:## 4. Fact-link to methodology
research/primary-sources/structurizr-dsl.md:73:## 5. Downstream-citation surface
research/primary-sources/structurizr-dsl.md:93:## 6. Open questions surfaced by the primary read
research/primary-sources/json-schema.md:20:## 1. Source identity
research/primary-sources/json-schema.md:30:## 2. Fetch trace
research/primary-sources/json-schema.md:44:## 3. Verbatim claims this corpus depends on
research/primary-sources/json-schema.md:64:## 4. Fact-link to methodology
research/primary-sources/json-schema.md:87:## 5. Downstream-citation surface
research/primary-sources/json-schema.md:106:## 6. Open questions surfaced by the primary read
research/primary-sources/adr-tools-state.md:20:## 1. Source identity
research/primary-sources/adr-tools-state.md:31:## 2. Fetch trace
research/primary-sources/adr-tools-state.md:39:## 3. Verbatim claims this corpus depends on
research/primary-sources/adr-tools-state.md:63:## 4. Fact-link to methodology
research/primary-sources/adr-tools-state.md:85:## 5. Downstream-citation surface
research/primary-sources/adr-tools-state.md:109:## 6. Open questions surfaced by the primary read
research/primary-sources/arc42.md:22:## 1. Source identity
research/primary-sources/arc42.md:36:## 2. Fetch trace
research/primary-sources/arc42.md:45:## 3. Verbatim claims this corpus depends on
research/primary-sources/arc42.md:85:## 4. Gap from prior summary characterization
research/primary-sources/arc42.md:103:## 5. Downstream-citation surface
research/primary-sources/arc42.md:126:## 6. Open questions surfaced by the primary read

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "comm -3 <(sed -n '/"'^### 6'"\\.1 /,/"'^### 6'"\\.2 /p' specs/2026-05-19-primary-source-research-corpus/SPEC.md | awk -F'|' '/"'^'"\\| [a-z0-9-]+ / { gsub(/"'^ +| +$/, "", $2); print $2 }'"' | sort) <(awk -F'|' '/"'^'"\\| [a-z0-9-]+ / { gsub(/"'^ +| +$/, "", $2); print $2 }'"' research/primary-sources/INDEX.md | sort)" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; for s in "## 1. Source identity" "## 2. Fetch trace" "## 3. Verbatim claims this corpus depends on" "## 5. Downstream-citation surface" "## 6. Open questions surfaced by the primary read"; do if ! rg -q "''^$s$" "$f"; then echo "$(basename "$f"): missing $s"; fi; done; if ! rg -q "''^## 4'"\\. (Gap from prior summary characterization|Fact-link to methodology)"'$" "$f"; then echo "$(basename "$f"): missing accepted §4 heading"; fi; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 587ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^## 4'"\\.\" research/primary-sources/*.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/json-schema.md:64:## 4. Fact-link to methodology
research/primary-sources/symphony-spec.md:97:## 4. Fact-link to methodology
research/primary-sources/structurizr-dsl.md:52:## 4. Fact-link to methodology
research/primary-sources/helm-values-schema.md:69:## 4. Fact-link to methodology
research/primary-sources/sigstore-cosign.md:80:## 4. Fact-link to methodology
research/primary-sources/diataxis.md:91:## 4. Gap from prior summary characterization
research/primary-sources/cyclonedx-sbom.md:76:## 4. Fact-link to methodology
research/primary-sources/spec-kit.md:82:## 4. Fact-link to methodology
research/primary-sources/ref-arch-vs-solution-arch.md:83:## 4. Fact-link to methodology
research/primary-sources/oracle-agent-spec.md:55:## 4. Fact-link to methodology
research/primary-sources/c4-model.md:84:## 4. Gap from prior summary characterization
research/primary-sources/cucumber-gherkin.md:72:## 4. Fact-link to methodology
research/primary-sources/arc42.md:85:## 4. Gap from prior summary characterization
research/primary-sources/openapi-3-1.md:81:## 4. Fact-link to methodology
research/primary-sources/adr-tools-state.md:63:## 4. Fact-link to methodology
research/primary-sources/openspec.md:75:## 4. Fact-link to methodology
research/primary-sources/oci-artifacts.md:88:## 4. Fact-link to methodology
research/primary-sources/adr-nygard.md:81:## 4. Gap from prior summary characterization
research/primary-sources/nix-flakes.md:87:## 4. Fact-link to methodology
research/primary-sources/leaddev-agent-compiled.md:65:## 4. Fact-link to methodology
research/primary-sources/kiro.md:65:## 4. Fact-link to methodology
research/primary-sources/12-factor.md:84:## 4. Fact-link to methodology

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/json-schema.md | sed -n '60,115p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/arc42.md | sed -n '80,135p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
    80	  as pragmatic and tailored to your specific needs."
    81	  arc42 is intended as "a comprehensive, adaptable
    82	  approach to architecture documentation rather than a
    83	  prescriptive mandate." (`url://arc42.org/overview/`)
    84	
    85	## 4. Gap from prior summary characterization
    86	
    87	Prior summary in
    88	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    89	§12 noted arc42 as "access-denied and characterized via
    90	WebSearch summaries." This primary read closes that gap:
    91	
    92	- The exact 12-section list is now confirmed and citable <!-- lint-ok: no-citation -->
    93	  by name and position (not paraphrased).
    94	- arc42's self-description ("template for architecture <!-- lint-ok: no-citation -->
    95	  communication and documentation") is anchored verbatim
    96	  rather than inferred.
    97	- arc42's adaptable-not-prescriptive posture is confirmed <!-- lint-ok: no-citation -->
    98	  by the overview page, supporting the research workpad's
    99	  characterization of arc42 as decomposition prior art
   100	  whose customization model is implicit rather than
   101	  formalized.
   102	
   103	## 5. Downstream-citation surface
   104	
   105	The following methodology claims are now licensed by this
   106	corpus entry (downstream cite as
   107	`file://research/primary-sources/arc42.md §3`):
   108	
   109	- methodology-claim: "arc42 ships a 12-section structure <!-- lint-ok: no-citation -->
   110	  covering introduction-and-goals, constraints, context,
   111	  solution strategy, building-block view, runtime view,
   112	  deployment view, concepts, architecture decisions,
   113	  quality, risks-and-technical-debt, glossary."
   114	- methodology-claim: "arc42 §9 Architecture Decisions <!-- lint-ok: no-citation -->
   115	  exists as a separate section — decisions are first-class
   116	  in arc42's decomposition, not buried inside design
   117	  rationale."
   118	- methodology-claim: "arc42 is pragmatic and adaptable, not <!-- lint-ok: no-citation -->
   119	  a prescriptive mandate — author self-description."
   120	- methodology-claim: "arc42 §8 Concepts covers crosscutting <!-- lint-ok: no-citation -->
   121	  technical concerns; the agentic-installation methodology
   122	  proposes additional decomposition primitives (customization
   123	  catalog, deferral contract) that arc42 does not natively
   124	  model."
   125	
   126	## 6. Open questions surfaced by the primary read
   127	
   128	- arc42 §9 Architecture Decisions does not specify an
   129	  artefact shape (no ADR-template binding); a deeper read
   130	  of arc42's published examples is needed to know whether
   131	  arc42 §9 typically defers to Nygard-format ADRs or has
   132	  its own preferred structure.
   133	- arc42 §10 Quality and §11 Risks-and-Technical-Debt are
   134	  named separately from §8 Concepts; the methodology's
   135	  proposed "quality" facet (research §5.1) needs to

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "Fact-link to methodology|Gap from prior summary|§4" specs/2026-05-19-primary-source-research-corpus/SPEC.md reviews/codex-2026-05-19-round2 reviews/codex-2026-05-19-round3 reviews/codex-2026-05-19-round4 reviews/codex-2026-05-19-round5 | head -80' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
specs/2026-05-19-primary-source-research-corpus/SPEC.md:50:§4, §5). Owner directive
specs/2026-05-19-primary-source-research-corpus/SPEC.md:170:| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:174:| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:175:| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:179:| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:185:| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:241:4. **§4 Gap from prior summary characterization** — what
specs/2026-05-19-primary-source-research-corpus/SPEC.md:315:   methodology's §3 / §4 / §5 from the research workpad
specs/2026-05-19-primary-source-research-corpus/SPEC.md:732:     errors in §4 / §5 / §6 — meta-commentary bullets
specs/2026-05-19-primary-source-research-corpus/SPEC.md:833:  correction in §4 Fact-link to methodology. The
specs/2026-05-19-primary-source-research-corpus/SPEC.md:885:  precisely. The corpus's §4 Gap-from-prior-summary
reviews/codex-2026-05-19-round5/03-v2-repack.md:799:See also: `solution-strategy.md` for arc42 §4 Solution
reviews/codex-2026-05-19-round5/03-v2-repack.md:3073:    50	   the upstream repo + docs in §4 Authority Map; trade-off matrix
reviews/codex-2026-05-19-round5/03-v2-repack.md:3527:# Per SPEC.schema §4.1, section IDENTITY is its title; section number is
reviews/codex-2026-05-19-round4/03-v2-repack.md:1323:- `solution-strategy.md` — arc42 §4 Solution Strategy
reviews/codex-2026-05-19-round4/03-v2-repack.md:1357:The novel facet (research §4.1; not natively modelled by
reviews/codex-2026-05-19-round4/03-v2-repack.md:1368:  (research §4.1's "starter profiles" with trade-offs
reviews/codex-2026-05-19-round4/03-v2-repack.md:1416:The second novel facet (research §4.2). Carries:
reviews/codex-2026-05-19-round4/03-v2-repack.md:1921:    68	Citation discipline applies: every factual claim in §3 (Scope), §4
reviews/codex-2026-05-19-round4/03-v2-repack.md:2002:    55	cite it in §4 Authority Map and mirror its contract shape rather
reviews/codex-2026-05-19-round4/03-v2-repack.md:2927:    50	   the upstream repo + docs in §4 Authority Map; trade-off matrix
reviews/codex-2026-05-19-round5/02-corpus.md:30:b9ec450 fix(corpus r3): nix front-matter/§4 + cyclonedx §5 overreach + SPEC §7.2 partial rule (codex Round-3)
reviews/codex-2026-05-19-round5/02-corpus.md:460:     errors in §4 / §5 / §6 — meta-commentary bullets
reviews/codex-2026-05-19-round5/02-corpus.md:870:   722	     errors in §4 / §5 / §6 — meta-commentary bullets
reviews/codex-2026-05-19-round5/02-corpus.md:1242:    50	§4, §5). Owner directive
reviews/codex-2026-05-19-round5/02-corpus.md:1362:   170	| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
reviews/codex-2026-05-19-round5/02-corpus.md:1366:   174	| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
reviews/codex-2026-05-19-round5/02-corpus.md:1367:   175	| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
reviews/codex-2026-05-19-round5/02-corpus.md:1368:   176	| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
reviews/codex-2026-05-19-round5/02-corpus.md:1371:   179	| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
reviews/codex-2026-05-19-round5/02-corpus.md:1377:   185	| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
reviews/codex-2026-05-19-round5/02-corpus.md:1383:   191	| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
reviews/codex-2026-05-19-round5/02-corpus.md:1433:   241	4. **§4 Gap from prior summary characterization** — what
reviews/codex-2026-05-19-round5/02-corpus.md:1507:   315	   methodology's §3 / §4 / §5 from the research workpad
reviews/codex-2026-05-19-round5/02-corpus.md:2051:      errors in §4 / §5 / §6 — meta-commentary bullets
reviews/codex-2026-05-19-round5/02-corpus.md:2165:   correction in §4 Fact-link to methodology. The
reviews/codex-2026-05-19-round5/02-corpus.md:2217:   precisely. The corpus's §4 Gap-from-prior-summary
reviews/codex-2026-05-19-round5/02-corpus.md:2393:      errors in §4 / §5 / §6 — meta-commentary bullets
reviews/codex-2026-05-19-round5/02-corpus.md:2586:   823	  correction in §4 Fact-link to methodology. The
reviews/codex-2026-05-19-round5/02-corpus.md:2691:191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
reviews/codex-2026-05-19-round5/01-parent-decision.md:194:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: [-64.-]{+65.+} |
reviews/codex-2026-05-19-round5/01-parent-decision.md:212:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:260:   567	rounds amended §4-§12 of this Decision; the historical
reviews/codex-2026-05-19-round5/01-parent-decision.md:269:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:319:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1157:+rounds amended §4-§12 of this Decision; the historical
reviews/codex-2026-05-19-round5/01-parent-decision.md:1166:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1276:  blocks; §4 missing facets; §5 packaging shape; §6
reviews/codex-2026-05-19-round5/01-parent-decision.md:1488:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: [-64.-]{+65.+} |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1506:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1554:   567	rounds amended §4-§12 of this Decision; the historical
reviews/codex-2026-05-19-round5/01-parent-decision.md:1583:136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1592:774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1599:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1613:1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1620:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1621:1733:837:2496545 (HEAD -> main, origin/main, origin/HEAD) spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1622:1734:846:    spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1660:1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1669:2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1677:2264:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1681:2281:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
reviews/codex-2026-05-19-round5/01-parent-decision.md:1685:2295:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1686:2299:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:765:rounds amended §4-§12 of this Decision; the historical
reviews/codex-2026-05-19-round5/01-parent-decision.md:1688:2301:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1689:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1690:2318:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1651:   567	rounds amended §4-§12 of this Decision; the historical
reviews/codex-2026-05-19-round5/01-parent-decision.md:1692:2320:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1695:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1699:2339:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1701:2343:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1702:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
reviews/codex-2026-05-19-round5/01-parent-decision.md:1708:2391:specs/2026-05-18-agentic-installation-methodology/SPEC.md:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1904:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
reviews/codex-2026-05-19-round5/01-parent-decision.md:1925:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:46:| 1.2 | PARTIAL | §7 + §9 name conformance + signing first-class, but §4 Decision Criteria doesn't list/weight the new criterion; §7 also allows unsigned at v1.0 which conflicts with "first-class at v1.0" wording |
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:58:- **MAJOR** parent SPEC §478: §11 Validation Plan + §12 AC
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md:142:   sections (§4 Decision Criteria, §11 Validation Plan, §12 AC,

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/12-factor.md | sed -n '80,118p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
    80	
    81	- **Factor III (Config)** — verbatim headline: "Store
    82	  config in the environment."
    83	
    84	## 4. Fact-link to methodology
    85	
    86	<!-- lint-ok: no-citation -->
    87	
    88	12-factor is the lightest-weight customization-grammar
    89	prior art: it says configuration exists in environment
    90	variables, not which environment variables the
    91	installer needs to set or what their valid
    92	combinations are. Research §4.1 characterised it as
    93	"says env vars exist, not which knobs the installer is
    94	expected to turn." This corpus read confirms the
    95	characterisation by anchoring Factor III to its
    96	verbatim minimal statement ("Store config in the
    97	environment") — no schema, no enumeration, no
    98	deferral contract.
    99	
   100	Implications for the methodology's customization/
   101	sub-spec:
   102	
   103	- The methodology's customization grammar is a strict
   104	  superset of 12-factor's posture: it declares WHICH
   105	  knobs the installer is expected to turn, with what
   106	  validation, and under what compositional constraints.
   107	- 12-factor's strength — minimalism — is the
   108	  methodology's weakness if applied directly: 12-factor
   109	  is excellent for the operating-system-boundary
   110	  contract (Factor III enables env-var-based
   111	  configuration) but insufficient for the
   112	  application-domain customization grammar the
   113	  methodology proposes.
   114	
   115	## 5. Downstream-citation surface
   116	
   117	<!-- lint-ok: no-citation -->
   118	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/kiro.md | sed -n '60,125p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
    60	
    61	- **Model options**: "Claude Sonnet 4.5" or "Auto"
    62	  models (per homepage); no explicit Bedrock binding
    63	  found in fetched content.
    64	
    65	## 4. Fact-link to methodology
    66	
    67	<!-- lint-ok: no-citation -->
    68	
    69	Kiro is a spec-as-authoring tool — specs live inside
    70	the developer's environment, drive code generation
    71	inside the same environment. Same authoring-vs-
    72	distribution distinction as Spec Kit.
    73	
    74	EARS notation (Easy Approach to Requirements Syntax) is
    75	the acceptance-criteria primitive Kiro adopts. The
    76	methodology may reference EARS as a candidate
    77	acceptance-criteria format for the behavior/ sub-spec,
    78	but EARS itself is a separate specification (Mavin et
    79	al.) that would merit its own corpus entry if
    80	methodology mandates it.
    81	
    82	The prior research workpad (§11 References)
    83	characterised Kiro as "Bedrock-tethered." The primary
    84	homepage read does NOT confirm this binding; the
    85	homepage names Claude Sonnet 4.5 as a model option.
    86	This is a gap-from-prior-summary correction worth
    87	noting.
    88	
    89	## 5. Downstream-citation surface
    90	
    91	<!-- lint-ok: no-citation -->
    92	
    93	Methodology claims licensed by this entry (cite as
    94	`file://research/primary-sources/kiro.md §3`):
    95	
    96	- methodology-claim: "Kiro is an agentic AI IDE/CLI/
    97	  web environment with a three-phase spec-driven
    98	  workflow: Requirements → Design → Implementation."
    99	- methodology-claim: "Kiro adopts EARS notation for
   100	  acceptance criteria — a candidate primitive the
   101	  methodology's behavior/ sub-spec MAY reference."
   102	- methodology-claim: "Kiro is a spec-as-authoring
   103	  tool (in-developer-environment); the methodology's
   104	  spec-as-distribution-artefact posture is a different
   105	  use case."
   106	
   107	## 6. Open questions surfaced by the primary read
   108	
   109	- The "Bedrock-tethered" characterisation in the prior
   110	  research workpad was not confirmed by this primary
   111	  read of the homepage. A deeper read of Kiro's
   112	  enterprise / model-routing docs may be needed if
   113	  methodology cites Kiro's hosting posture.
   114	- EARS notation is a separate primary source
   115	  (Mavin et al., 2009); if the methodology mandates
   116	  EARS-format acceptance criteria, EARS deserves its
   117	  own corpus entry.
   118	- Kiro's CLI mode + agent dispatch model may be
   119	  worth comparing to Symphony's per-issue isolated
   120	  workspaces; not deep-read in this pass.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/cyclonedx-sbom.md | sed -n '72,112p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/helm-values-schema.md | sed -n '66,104p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
    66	  "particularly useful in air-gapped environments with
    67	  remote schema references."
    68	
    69	## 4. Fact-link to methodology
    70	
    71	<!-- lint-ok: no-citation -->
    72	
    73	Helm's schema-bound customization is the closest published
    74	prior art for the methodology's customization-affordances
    75	facet. Key shape implications for the methodology's
    76	customization/ sub-spec design:
    77	
    78	- A two-file split — defaults (values.yaml) and contract
    79	  (values.schema.json) — is reusable for the methodology's
    80	  customization grammar.
    81	- Validation lifecycle hooks (install/upgrade/lint/
    82	  template equivalents) give the customization contract
    83	  enforcement surface.
    84	- Bypass mode (`--skip-schema-validation`) is a meaningful
    85	  precedent: the methodology MAY want a "permissive mode"
    86	  for cases where the installer knows better than the
    87	  schema.
    88	- The gap research §4.1 identified — "Helm values schemas
    89	  come closest in practice but describe what is
    90	  configurable, not what compositional patterns exist" —
    91	  is now anchored against Helm's actual surface: Helm's
    92	  schema is per-field validation, not per-composition
    93	  validation. The methodology's deferral contract IS
    94	  about composition-level deferrals.
    95	
    96	## 5. Downstream-citation surface
    97	
    98	<!-- lint-ok: no-citation -->
    99	
   100	Methodology claims licensed by this entry (cite as
   101	`file://research/primary-sources/helm-values-schema.md
   102	§3`):
   103	
   104	- methodology-claim: "Helm charts split customization

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '340,420p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
nl: ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md: No such file or directory

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "cross-family|Primary-Source|primary-source|five slices|research corpus|corpus" ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 2 in 0ms:
rg: ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md: IO error for operation on ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md: No such file or directory (os error 2)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "cross-family|Primary-Source|primary-source|five slices|research corpus|corpus|slice" ../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
90:  flagged, external cross-family validation gate).
148:  ships both. External cross-family validation pass gates
156:  including Product A repack + cross-family validation
167:  cross-family validation still required.
182:  Product A repack. No cross-family validation gate (nothing
199:  No SPEC artefact. No Product A repack. No cross-family
208:  cross-family content lands in parts 5-7 for a smaller
324:(Sigstore tooling wiring is a v1.x slice); the manifest's
334:Phase 5 cross-family agent walkthrough; Phase 6 ship; Phase 7
358:An external cross-family agent validation pass — a
365:procedure: each follow-on slice (repo standup, repack,
368:Decision; cross-family review BLOCKING per slice;
372:slices to be authored against Product A's existing v1.1
435:- External cross-family validation engagement as a follow-on
463:- Publishing Product B before the external cross-family
479:- External cross-family validation pass surfaces a structural
499:   cross-family validation engagement.
566:2026-05-18. Subsequent codex cross-family remediation
613:  Amendment Log; cross-family Quality Gate evidence in
625:SPECs that author the slices named in §7 (repo standup,
641:  slice classes (standup, repack, longread, SPEC-bundle,
645:  slice exceeds its bound, escalate via a follow-on Decision
649:  external cross-family pass a publication gate. The engagement
660:  correctly refused to emit TASK.md slices against this
664:  becomes the slice list for follow-on Task / Contract SPECs
677:- **Decision Statement as slice enumerator.** §7 enumerates
678:  the slice list (standup, repack, longread, SPEC-bundle,

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '330,410p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   330	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   331	§6 (Phase 0 maturity check; Phase 1 facet inventory and
   332	classification; Phase 2 parameterization surface; Phase 3
   333	sanitization bar; Phase 4 manifest + catalog composition;
   334	Phase 5 cross-family agent walkthrough; Phase 6 ship; Phase 7
   335	failure modes as first-class content).
   336	
   337	The Product A repo `agentic-ops-framework` SHALL be repacked
   338	into the manifest+catalog shape as v2.0 in parallel with
   339	Product B v1.0 authoring; the two artefacts SHALL ship as a
   340	paired release.
   341	
   342	BES SHALL be named directly throughout Product B's published
   343	artefacts; the case-study density REQUIRED by research §7
   344	forecloses anonymization.
   345	
   346	All four-plus failure modes catalogued in
   347	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   348	§7 SHALL be published as case data, with sanitization
   349	limited to specific internal SPEC identifiers and
   350	transcripts; the failure-mode patterns themselves are the
   351	value.
   352	
   353	All seven open research questions catalogued in
   354	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   355	§2.3 SHALL be published as flagged-open; Product B MUST NOT
   356	claim to resolve them.
   357	
   358	An external cross-family agent validation pass — a
   359	different-family agent attempting to deploy Product A from
   360	the published SPEC bundle alone — SHALL gate Product B
   361	publication. Same-family proxy results MAY inform authoring
   362	but MUST NOT substitute for the external pass.
   363	
   364	Product B's authoring MUST itself follow the v1 BES spec
   365	procedure: each follow-on slice (repo standup, repack,
   366	longread authoring, SPEC-bundle authoring, validation pass)
   367	authored as a Task or Contract SPEC under the parent
   368	Decision; cross-family review BLOCKING per slice;
   369	verification gates each before merge.
   370	
   371	Implementations of this Decision SHOULD prefer earlier-phase
   372	slices to be authored against Product A's existing v1.1
   373	artefacts (so the repack work in Phase 4 is informed by the
   374	Phase 1-2 facet inventory rather than the other way around).
   375	
   376	Implementations MAY parallelize Phase 0-2 (analysis) across
   377	agents while keeping Phase 3-6 (composition + validation) on
   378	a single coordinating agent to preserve voice consistency.
   379	
   380	Implementations MAY adopt additional sub-spec facets beyond
   381	the eight catalogued in the §7 Decision Statement above
   382	(architecture, deployment, behavior, customization,
   383	decisions, quality, operations, non-goals) and the two
   384	first-class structural facets added per codex remediation
   385	finding 1.2 (conformance, signed-distribution) when the
   386	case-study work surfaces them, provided the additions are
   387	catalogued in the front-door manifest and named explicitly
   388	in a follow-on Decision SPEC amendment. (Note: §6 is the
   389	trade-off comparison matrix, NOT a facet catalogue; the
   390	authoritative facet list lives here in §7. Fixed per
   391	codex Round-2 stale-reference finding.)
   392	
   393	## 8. Decision Rationale
   394	
   395	Candidate 5.1 was chosen because it is the only candidate
   396	that simultaneously satisfies the dogfooding constraint,
   397	the reader-on-ramp constraint, the failure-mode +
   398	open-question publication-surface constraint, and the
   399	executable-conformance + signed-distribution-surface
   400	constraint (§6 trade-off matrix rows 1-4 post-codex-
   401	remediation 1.2 + 1.3). The cost differential (~4-6
   402	weeks vs. ~2-3 weeks for 5.3) is acceptable given the
   403	strategic value of a paired release that demonstrates the
   404	methodology applied to itself. Owner directive
   405	`owner://transcript-2026-05-18` ("Do what is the
   406	rolls royce") affirms this trade.
   407	
   408	Candidate 5.2 was rejected because it sacrifices the
   409	case-study narrative that motivates the methodology in the
   410	first place; research §7 lists the BES failure-mode density

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash -n scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^## 13|''^## 15|''^## 19|''^### 19'"\\.3|cross-family review deferred|same-family\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
376:interim, reviewers (cross-family and same-family)
493:## 13. Test and Validation Matrix
525:## 15. Acceptance Criteria
554:      Decision §7) signs off OR same-family-proxy is
600:      Default: same-family proxy with explicit caveat
636:## 19. Completion Report
754:### 19.3 Verification result
782:- AC-9: cross-family review deferred. Same-family

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "SHALL gate Product B|MUST NOT substitute|cross-family review BLOCKING" ../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
360:the published SPEC bundle alone — SHALL gate Product B
362:but MUST NOT substitute for the external pass.
368:Decision; cross-family review BLOCKING per slice;

codex
**Quality Gate Result: PASS**

No MAJOR-or-higher remaining issues found for `5138fef`.

R5 carry-through check:
- §15 AC-4 sibling is now aligned with §7.2 / §13 AC-4 and permits `partial` with deferred-read notes.
- §3 status enum now includes `partial`.
- §19.1 now lists all 22 artefacts, including `json-schema` and `cyclonedx-sbom`.

Verification run:
- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` passed: 0 errors, 0 warnings, 55 citation hits.
- `bash scripts/check-corpus-completeness.sh` passed: 22 sources, 3 partial with deferred-reads notes.
- `test -f research/primary-sources/INDEX.md && test -x scripts/check-corpus-completeness.sh` passed.
- Spec §6.1 slugs, INDEX rows, and corpus files are bijective.
- `bash -n scripts/check-corpus-completeness.sh` passed.
- `git diff --check` passed.
- `shellcheck` is not installed in this environment.

No mutations made. Current worktree still shows the pre-existing untracked `reviews/codex-2026-05-19-round6/` directory.
tokens used
201,599
**Quality Gate Result: PASS**

No MAJOR-or-higher remaining issues found for `5138fef`.

R5 carry-through check:
- §15 AC-4 sibling is now aligned with §7.2 / §13 AC-4 and permits `partial` with deferred-read notes.
- §3 status enum now includes `partial`.
- §19.1 now lists all 22 artefacts, including `json-schema` and `cyclonedx-sbom`.

Verification run:
- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` passed: 0 errors, 0 warnings, 55 citation hits.
- `bash scripts/check-corpus-completeness.sh` passed: 22 sources, 3 partial with deferred-reads notes.
- `test -f research/primary-sources/INDEX.md && test -x scripts/check-corpus-completeness.sh` passed.
- Spec §6.1 slugs, INDEX rows, and corpus files are bijective.
- `bash -n scripts/check-corpus-completeness.sh` passed.
- `git diff --check` passed.
- `shellcheck` is not installed in this environment.

No mutations made. Current worktree still shows the pre-existing untracked `reviews/codex-2026-05-19-round6/` directory.
