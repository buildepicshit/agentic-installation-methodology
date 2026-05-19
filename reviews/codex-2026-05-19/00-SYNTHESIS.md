# Codex cross-family review — synthesis (2026-05-19)

Reviewer: `gpt-5.5` via `codex exec --sandbox read-only`,
`model_reasoning_effort = xhigh` per local `~/.codex/config.toml`.
Author: `claude-opus-4-7` (same-family self-review previously
recorded as advisory).

Authority for the review request:
`decision-authority://owner:2026-05-19` ("can do a local claude
and codex read") + parent Decision SPEC §7 BLOCKING-per-slice
cross-family review rule.

Four SPECs reviewed in dependency order (parent → corpus →
repack → longread). Each saved to its own per-target file.
Total tokens used: ~643 691 across the four runs (157 952 +
243 233 + ~154 999 + 87 506).

## Aggregate verdict

**Four for four FAIL**. Same-family self-review missed
substantive issues at every SPEC. Cross-family review delivers
real value here; the rolls-royce posture is honoured by
acting on the findings rather than waving them off.

Total findings: **4 BLOCKING / 7 HIGH / 9 MAJOR / 7 MEDIUM = 27**.

## Per-SPEC findings

### 1. Parent Decision SPEC (`bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`)

Status before review: **verified**. Detailed review at
[`01-parent-decision.md`](./01-parent-decision.md).

| # | File:line | Severity | Finding |
|---|---|---|---|
| 1.1 | SPEC.md:135 | BLOCKING | §5 omits paper-style (arxiv/workshop) publication candidate from upstream research §9 Q1. IDEA also dropped it at IDEA.md:127. |
| 1.2 | SPEC.md:227 | BLOCKING | Conformance suite + signed bundle should be top-level facets; current SPEC keeps them as optional extras; "additional facets require amendment" compounds the mismatch. |
| 1.3 | SPEC.md:216 | MAJOR | "Honest disclosure" matrix row conflates with dogfooding + cross-family validation rows already separate. |
| 1.4 | SPEC.md:338 | MAJOR | Locks §9 don't foreclose SPEC-bundle-only (rejected 5.2 candidate) or paper-style (absent from candidate space). |

### 2. Primary-source corpus (`agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md` + 20 artefacts)

Status before review: **verified**. Detailed review at
[`02-corpus.md`](./02-corpus.md).

| # | File:line | Severity | Finding |
|---|---|---|---|
| 2.1 | SPEC.md:650 | HIGH | Lint-impedance handling is a hack. §7.1 says uncited-claim is BLOCKING; 18/20 artefacts have uncited-claim errors waved off as "noise." Either add corpus-mode lint or make completeness gate validate citations. |
| 2.2 | INDEX.md:18 + INDEX.md:34 | HIGH | Status-truth bug: INDEX says `primary-read-complete` while artefact front-matter says `partial` (adr-tools-state, structurizr-dsl). "20/20 complete" is materially untrue. |
| 2.3 | SPEC.md:575 | HIGH | Source-list incomplete for v1.0. At minimum JSON Schema and SBOM/CycloneDX should be in v1.0 (Helm/OpenAPI rely on JSON Schema; methodology's audit story needs SBOM). Also consider Dev Container Spec, Pact/AsyncAPI/GraphQL, SLSA/in-toto. |
| 2.4 | oci-artifacts.md:28+66 | HIGH | Source row calls for OCI Artifact spec but §2 says Artifacts Guidance was "not deep-read"; §3/§5 license non-image-payload claims regardless. Fetch the guidance or downgrade claim surface. |
| 2.5 | c4-model.md:119 | MEDIUM | §5 licenses Docker disambiguation despite §4 saying not found in fetched text. Reframe as inference or fetch the container-diagram page. |
| 2.6 | symphony-spec.md:121 | MEDIUM | "Only published in-the-wild example" is a global uniqueness claim not licensed by Symphony's own SPEC. Reframe as "only example identified by this project's research." |
| 2.7 | leaddev-agent-compiled.md:114 | MEDIUM | Willison quote supports the mitigation as suggested; the artefact says "viable mitigation the methodology endorses for safety-critical paths" — that's methodology judgment, not primary-source evidence. |
| 2.8 | ref-arch-vs-solution-arch.md:60+125 | MEDIUM | Artefact labels text as "verbatim, paraphrased close to source" (self-contradictory). Treat as paraphrase unless exact source supplied. |
| 2.9 | nix-flakes.md:118 | MEDIUM | "Strongest current implementation of build-from-spec" is comparative agent synthesis not licensed by the Nix primary. |

### 3. v2.0 repack Contract (`agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`)

Status before review: **verified** (v2.0.0 tagged + released).
Detailed review at [`03-v2-repack.md`](./03-v2-repack.md).

| # | File:line | Severity | Finding |
|---|---|---|---|
| 3.1 | SPEC.md:11 + lint-spec.sh:24 + ci.yml:54 | **BLOCKER** | SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as acceptance command. Command FAILS (lint only understands IDEA/SPEC front-matter). CI does not run it. `status: verified` is OVERSTATED. v2.0.0 tag predicated on a broken acceptance command. |
| 3.2 | CONTEXT.md:3 + SPEC.schema.md:211 | HIGH | spec-bundle/* facet files cite `file://../../research/primary-sources/...`; this repo has no `research/` directory. Cross-repo citations don't resolve under schema's file:// rule. |
| 3.3 | CONTRIBUTING.md:22 + TASK.template.md:50 + skill files | HIGH | v1.1 → v2.0 migration incomplete. Internal references still point at old `schema/`, `templates/`, `skills/`, `workflow/`, `agents/` paths. Followed citations break. |
| 3.4 | fleet-sync.sh:44 + README.md:121 | HIGH | `fleet-sync.sh` reads `$SOURCE/agents/...` but v2.0 layout has `spec-bundle/...`; **functional regression** — fleet-sync would copy nothing or fail. |
| 3.5 | manifest.yaml:24 + SPEC.md:579 | MEDIUM | Manifest schema under-specified for a published bundle. Missing: schema URI, source commit/tag binding, per-facet media type, digest/content hash, size, SBOM/provenance refs, explicit complete/reserved/scaffold status per facet. |
| 3.6 | manifest.yaml:31 + validate-manifest.sh:149 | MEDIUM | `behavior.primary` is a directory; schema says `primary` is a file. Validator silently allows it; schema drift creates an unstable entry point. |

### 4. Longread structure Contract (`agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md`)

Status before review: **in-execution** (validator authored;
chapters not yet). Detailed review at
[`04-longread.md`](./04-longread.md).

| # | File:line | Severity | Finding |
|---|---|---|---|
| 4.1 | SPEC.md:11 + validate-longread-structure.sh:64,148 | BLOCKING | Front-matter acceptance command runs validator in default (in-progress) mode (50 words/chapter min, 450 total). AC-6 says 8 000–12 000 words but command set doesn't prove it. |
| 4.2 | SPEC.md:250 + validate-longread-structure.sh:109 | BLOCKING | Corpus-citation discipline not mechanically enforceable. AC-8 explicit-manual; validator only checks file presence + word counts. Corpus SPEC §7.1 also defers corpus-citation lint. |
| 4.3 | SPEC.md:547 + parent SPEC.md:261 | BLOCKING | Chapter 08 acceptance requires 4+ failure modes; parent authority also requires ALL 7 open research questions be published as flagged-open. Local SPEC mentions them in §17 Q-roadmap prose, not in AC/DoD. |
| 4.4 | SPEC.md:219 + parent SPEC.md:227 | MAJOR | Per-chapter maxima sum to 12 400; parent longread bound is 12 000. The text claims "margin without breach" but actually breaches by 400. Release-mode validator max is 12 000. |
| 4.5 | SPEC.md:275 + research workpad §6 | MAJOR | Phase 7 per upstream is "for each phase, document failures + open questions." SPEC pushes failure modes solely into chapter 08. Should require per-chapter phase-local failure notes + chapter 08 as synthesis. |
| 4.6 | SPEC.md:312 + parent SPEC.md:254 | MAJOR | BES attribution rule says other product repos NOT named; SPEC itself names `ACTOCCATUD`, `Floom`, `IKTO` in the public contract text. Sanitization-scope language also wider than parent allows. |
| 4.7 | SPEC.md:229 + research §6 Phase 0 | MEDIUM | First-person voice rule too absolute for Phase 0 maturity rubric. As written, Phase 0 chapter risks awkward first-person or drift into forbidden vendor voice. Permit "we used this readiness test" + generalized criteria. |

## Highest-impact themes

The 27 findings cluster around four themes:

1. **Acceptance commands that don't actually prove the SPEC's claims** (findings 3.1, 4.1, 4.2). The most consequential category. These break the v1 procedure's mechanical-verification posture. A SPEC at `status: verified` should mean every acceptance command exits 0 AND those commands cover the load-bearing claims; we have neither.
2. **Status-truth gaps** (finding 2.2). INDEX claims `primary-read-complete` against artefacts whose own front-matter says `partial`. Trust surface erosion.
3. **Citations that don't resolve / aren't licensed** (findings 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3.2, 3.3). Either cross-repo paths don't resolve, or methodology-claim licensing overreaches the primary source. The "do not make up bullshit" directive is leaking.
4. **Missing scope / candidate-space gaps** (findings 1.1, 1.2, 2.3, 3.4, 3.5, 4.5). Paper-style omitted; conformance + signing as second-class; corpus missing JSON Schema/SBOM/SLSA/etc; fleet-sync functional regression; manifest schema thin; per-chapter failure notes missing.

## Remediation plan (proposed)

### Priority 1 — fix the broken acceptance gates (BLOCKER 3.1 + BLOCKING 4.1 + 4.2)

- **3.1**: amend the v2.0 repack SPEC's `acceptance_commands` to remove the misapplied `lint-spec.sh spec-bundle/manifest.yaml` line. Run the corrected acceptance commands. If they still pass, the existing verified status is salvageable; if not, the SPEC's verified flip needs to roll back to needs-revision until the underlying gates pass. Consider whether the v2.0.0 tag needs to be re-cut.
- **4.1**: change the longread Contract's acceptance commands to invoke `--release-mode` for the release-time gate; keep the default mode for in-progress validation under a separate command/flag.
- **4.2**: author a follow-on Task SPEC for a corpus-citation lint extension that enforces `file://research/primary-sources/<slug>.md §3` references in downstream artefacts. Until that lands, AC-8 stays manual but the SPEC documents this honestly.

### Priority 2 — fix status-truth + citation overreach (HIGH 2.1, 2.2, 2.4, 3.2, 3.3, 3.4 + MEDIUM 2.5–2.9)

- **2.2**: correct INDEX.md to mark `adr-tools-state` and `structurizr-dsl` as `partial` (not `primary-read-complete`). Update completeness-script semantics so `partial` is acceptable iff the artefact §6 records what was not deep-read.
- **2.1**: either add corpus-mode to `scripts/lint-spec.sh` OR add a separate `scripts/validate-corpus-citations.sh` that resolves only the uncited-claim subset on corpus artefacts. Make the Completion Report honest about which check enforces what.
- **2.4–2.9**: per-artefact rewrites to bring §3 quotes + §5 downstream-citation surfaces into honest alignment with what the primary source actually licenses. (Codex's review gives precise file:line targets.)
- **3.2 + 3.3**: bulk cross-reference rewrite: update internal cross-repo `file://` paths to either the corpus's sibling-repo-relative paths that actually resolve, OR rephrase as `url://` cites against the public GitHub repo URL. Audit + fix CONTRIBUTING.md, TASK.template.md, skill files referencing old paths.
- **3.4**: `fleet-sync.sh` rewrite to read from `$SOURCE/spec-bundle/...` (or document v2.0 incompatibility + bump major version of the script).

### Priority 3 — close candidate-space / scope gaps (BLOCKING 1.1, 1.2 + HIGH 2.3 + MEDIUM 3.5, 3.6 + MAJOR 1.3, 1.4, 4.4, 4.5, 4.6, 4.7)

These touch the verified parent Decision and require formal amendment SPECs:

- **1.1 + 1.2**: amend parent Decision §5 to add paper-style + bundle-only candidates with explicit rejection rationale; amend §6 + §7 to acknowledge conformance + signing as first-class facets (the v2.0 layout already treats them this way in `spec-bundle/conformance/` and the manifest's `signature` block; the SPEC text needs to catch up).
- **1.3 + 1.4**: amend §6 trade-off matrix to disambiguate honest-disclosure vs dogfooding; amend §9 Locks to add SPEC-bundle-only + paper-style to foreclosed list.
- **2.3**: amend corpus SPEC §6.1 to add JSON Schema + SBOM/CycloneDX (v1.0 mandatory); add Dev Container Spec + SLSA as v1.1 candidates.
- **3.5 + 3.6**: amend v2.0 repack SPEC §6.1 + §8 to expand manifest schema (schema URI, source commit, media types, digest, scaffold-status); fix `behavior.primary` field-vs-directory drift.
- **4.4–4.7**: revise longread Contract §6.2 word budgets to land under 12 000 total; revise §6.5 failure-mode rule to require per-chapter notes + chapter 08 synthesis; remove BES product-repo names from §6.6 prose; relax voice rule for Phase 0.

### Sequence

Recommend executing in this order:

1. **Bug-bash batch** (Priority 1 + 2 mechanical fixes): one batch slice that re-aligns acceptance commands + corrects INDEX status + fixes broken cross-repo citations + restores fleet-sync.sh. ~1-2 sessions of mechanical work.
2. **Parent Decision amendment SPEC** (Priority 3 §1.x findings): authored, reviewed cross-family, owner-approved, executed; supersedes the original parent Decision with the candidate-space + locks corrections.
3. **Corpus + repack amendment SPECs** (Priority 3 §2.x + §3.x findings): downstream-of-parent amendments.
4. **Longread Contract revision** (Priority 3 §4.x findings): edit in-place since status is in-execution (no formal supersede needed).
5. **Re-run cross-family review** on the amended state before any further forward motion (chapter authoring, v2.1 tag, etc.).

## What this confirms

The "deep research, not bullshit" owner directive of 2026-05-18
caught real bullshit. Same-family Claude-Opus-only review was
not sufficient; the rolls-royce path includes external Codex
review per slice, not as an optional add-on.

Capture as spec-evidence: **cross-family review is the gate
that distinguishes well-formed-and-citable from
well-formed-and-bullshit**.
