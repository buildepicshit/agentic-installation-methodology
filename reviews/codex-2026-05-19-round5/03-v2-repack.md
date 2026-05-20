Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-ops-framework
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e4349-f5a7-7bf0-8650-de1d495c4795
--------
user
Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/. Round 4 flagged: BLOCKER 3.6 semantic containment, MEDIUM REQUIRED-field coverage, HIGH 3.3 final stale paths. R5 fixes at 61528c8 + self-audit §19.0 Amendment Log at 178cee3. Verify + surface remaining. Output Quality Gate Result. No mutations.
codex
I’ll stay read-only and treat this as a gate review: first confirm the repo state and target commits, then inspect the Round 5 deltas against the three Round 4 findings, then run only non-mutating validation commands.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git rev-parse --short HEAD' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
178cee3

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git log --oneline --decorate -8' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
178cee3 (HEAD -> main, origin/main) spec(amend): repack §19.0 Amendment Log + historical evidence labelled (self-audit)
61528c8 fix(v2 r4): validator semantic-containment + REQUIRED-field expansion + bare-path migration (codex R4)
e78b8a4 fix(v2 r3): validator inside-directory rule + REQUIRED v2.1 field presence + §6.1 v2.1 example + stale paths (codex Round-3)
380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
5f59f7b (tag: v2.0.0) spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"19\\.0|Amendment Log|semantic containment|REQUIRED|stale path|stale paths|3\\.6|3\\.3\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
scripts/validate-manifest.sh:64:# 3b. REQUIRED top-level field presence (codex Round-3 + Round-4).
scripts/validate-manifest.sh:65:# Per SPEC §8.1, the following are REQUIRED:
scripts/validate-manifest.sh:75:        err "REQUIRED top-level key missing: $required_key (per SPEC §8.1)"
scripts/validate-manifest.sh:79:# 3c. REQUIRED intent block fields (codex Round-4 finding).
scripts/validate-manifest.sh:86:        err "REQUIRED intent key missing: $required_intent_key (per SPEC §8.2)"
scripts/validate-manifest.sh:211:        err "facet '$facet' has no primary field in the manifest (per SPEC §8.3 primary is REQUIRED for every facet)"
scripts/validate-manifest.sh:222:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:245:            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:37:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:268:schema_uri: "<URL pin>"             # v2.1 REQUIRED; pin to immutable
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:270:source_commit: ""                   # v2.1 REQUIRED; populated by
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:299:    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:585:The manifest is YAML. Top-level keys (REQUIRED unless
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:628:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:632:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:638:finding 3.6)**: when `primary` is a directory path, the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:889:### 19.0 Amendment log (post-verification edits)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:892:§14.0 and the corpus SPEC §19.0, this Completion Report
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:896:manifest.sh (v2.1 enforcement + semantic containment),
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:900:are in this Amendment Log.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:908:| R4 fixes | 2026-05-20 | validator semantic-containment + REQUIRED-field expansion + final bare-path migration | `61528c8` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:918:  semantic-containment + 5 top-level REQUIRED + 3
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:919:  intent REQUIRED enforcement
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:990:  warnings, 50 citation hits; 66 current per §19.0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:991:  Amendment Log).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:995:  2.1.0 per §19.0 Amendment Log).
spec-bundle/skills/spec-authoring/SKILL.md:25:  are REQUIRED.
spec-bundle/skills/spec-authoring/SKILL.md:220:3. `spec-review` runs `lint-spec.sh` (REQUIRED for Contract,
spec-bundle/skills/agents-md-improver/SKILL.md:29:  tools per `url://https://agents.md`). REQUIRED sections:
spec-bundle/skills/spec-driven-development/SKILL.md:40:   candidate-comparison for Decision), runs `lint-spec.sh` (REQUIRED
spec-bundle/skills/spec-driven-development/SKILL.md:110:  ("the autonomous-dispatch runner-grade") with REQUIRED lint.
spec-bundle/skills/spec-driven-development/SKILL.md:203:- **Cross-family cross-validation is REQUIRED.** Each TASK.md MUST
spec-bundle/templates/TASK.template.md:105:### 3.3 Out of scope
spec-bundle/templates/IDEA.template.md:27:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/templates/SPEC.fastpath.template.md:41:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/templates/SPEC.decision.template.md:28:CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
spec-bundle/templates/SPEC.decision.template.md:40:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/skills/spec-review/SKILL.md:3:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
spec-bundle/skills/spec-review/SKILL.md:57:| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (the autonomous-dispatch runner-grade) | **REQUIRED** |
spec-bundle/skills/spec-review/SKILL.md:102:3. REQUIRED: the cited IDEA section MUST exist and contain at
spec-bundle/skills/spec-review/SKILL.md:144:- `spec_path` (string, REQUIRED).
spec-bundle/skills/spec-review/SKILL.md:145:- `type` (enum, REQUIRED) — `task` | `contract` | `decision`. For
spec-bundle/skills/spec-review/SKILL.md:147:- `bar` (enum, REQUIRED) — `b` | `c` | `b-plus-candidates`. For
spec-bundle/skills/spec-review/SKILL.md:149:- `pass` (boolean, REQUIRED) — `true` iff `failures` contains zero
spec-bundle/skills/spec-review/SKILL.md:151:- `failures` (list, REQUIRED, MAY be empty):
spec-bundle/skills/spec-review/SKILL.md:152:  - `criterion` (string, REQUIRED) — short slug (e.g.
spec-bundle/skills/spec-review/SKILL.md:156:  - `evidence` (string, REQUIRED) — file/line citation per
spec-bundle/skills/spec-review/SKILL.md:158:  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.
spec-bundle/templates/SPEC.contract.template.md:25:Quality gate: bar (c) "protocol-grade", with REQUIRED `lint-spec.sh`
spec-bundle/templates/SPEC.contract.template.md:37:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/templates/SPEC.contract.template.md:74:- REQUIRED: [Goal 1.]
spec-bundle/templates/SPEC.contract.template.md:75:- REQUIRED: [Goal 2.]
spec-bundle/templates/SPEC.contract.template.md:133:| `[field]` | [type] | REQUIRED \| OPTIONAL | [enum or `*`] | [notes] |
spec-bundle/templates/SPEC.contract.template.md:168:<!-- guidance: REQUIRED only when the contract defines schemas
spec-bundle/templates/SPEC.contract.template.md:176:| `[field]` | [type] | REQUIRED | [enum] | [notes] |
spec-bundle/templates/SPEC.contract.template.md:201:<!-- guidance: REQUIRED. Each failure class names cause, recovery,
spec-bundle/templates/SPEC.contract.template.md:218:<!-- guidance: REQUIRED. Identify the trust boundary, authority chain,
spec-bundle/templates/SPEC.contract.template.md:232:<!-- guidance: REQUIRED. How operators and verifiers see the system's
spec-bundle/templates/SPEC.contract.template.md:314:<!-- guidance: REQUIRED when prior versions exist; otherwise mark
spec-bundle/templates/SPEC.task.template.md:32:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/templates/SPEC.task.template.md:143:| `[field]` | [type] | REQUIRED \| OPTIONAL | [enum or `*`] | [notes] |
spec-bundle/templates/SPEC.task.template.md:213:- [ ] AC-3: [Docs or operating instructions updated where REQUIRED.]
spec-bundle/skills/spec-review/references/per-type-gates.md:21:- All REQUIRED IDEA sections (§9.1) present and non-empty (or
spec-bundle/skills/spec-review/references/per-type-gates.md:42:- All REQUIRED Task SPEC sections (§9.2) present and non-empty.
spec-bundle/operations/observability.md:7:## Tier 1: REQUIRED logging
spec-bundle/non-goals/INDEX.md:16:  REQUIRED.
spec-bundle/non-goals/INDEX.md:38:  framework has no API). OpenAPI is REQUIRED only for
spec-bundle/schema/SPEC.schema.md:13:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/schema/SPEC.schema.md:32:| `id` | string | REQUIRED | kebab-case slug | matches `<topic>` portion of spec_id |
spec-bundle/schema/SPEC.schema.md:33:| `spec_id` | string | REQUIRED | `<YYYY-MM-DD>-<id>` | id of the SPEC this IDEA feeds |
spec-bundle/schema/SPEC.schema.md:34:| `status` | enum | REQUIRED | `draft` \| `ready-for-spec` \| `owner-blocking` \| `archived` | initial value `draft` |
spec-bundle/schema/SPEC.schema.md:35:| `owner` | string | REQUIRED | owner identifier | e.g. `owner-A` |
spec-bundle/schema/SPEC.schema.md:36:| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `codex-gpt-5.5`, `claude-opus-4-7-1m`, or any other model:lane label |
spec-bundle/schema/SPEC.schema.md:37:| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-01-15` |
spec-bundle/schema/SPEC.schema.md:38:| `implies_spec_type` | enum | REQUIRED | `task` \| `contract` \| `decision` | drives template selection in `/author-spec` |
spec-bundle/schema/SPEC.schema.md:58:| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
spec-bundle/schema/SPEC.schema.md:59:| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` | state machine; only owner sets `approved`, `decomposed`, and `closed` |
spec-bundle/schema/SPEC.schema.md:60:| `type` | enum | REQUIRED | `task` \| `contract` \| `decision` | determines which template was used |
spec-bundle/schema/SPEC.schema.md:61:| `owner` | string | REQUIRED | owner identifier | |
spec-bundle/schema/SPEC.schema.md:62:| `repo` | string | REQUIRED | repo name | e.g. `your-policy-repo` |
spec-bundle/schema/SPEC.schema.md:63:| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
spec-bundle/schema/SPEC.schema.md:64:| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
spec-bundle/schema/SPEC.schema.md:65:| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
spec-bundle/schema/SPEC.schema.md:66:| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
spec-bundle/schema/SPEC.schema.md:67:| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
spec-bundle/schema/SPEC.schema.md:68:| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |
spec-bundle/schema/SPEC.schema.md:147:(`spec-review`) and citation grammar remain REQUIRED; only the
spec-bundle/schema/SPEC.schema.md:163:| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
spec-bundle/schema/SPEC.schema.md:164:| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
spec-bundle/schema/SPEC.schema.md:165:| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors tracker active states; only owner sets `done` |
spec-bundle/schema/SPEC.schema.md:166:| `owner` | string | REQUIRED | agent id or `unassigned` | |
spec-bundle/schema/SPEC.schema.md:167:| `model_route` | string | REQUIRED | model slug from your model-routing policy | primary execution lane |
spec-bundle/schema/SPEC.schema.md:168:| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
spec-bundle/schema/SPEC.schema.md:169:| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
spec-bundle/schema/SPEC.schema.md:170:| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
spec-bundle/schema/SPEC.schema.md:171:| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
spec-bundle/schema/SPEC.schema.md:172:| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
spec-bundle/schema/SPEC.schema.md:173:| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `your parallelism-and-routing SPEC` §7.1 |
spec-bundle/schema/SPEC.schema.md:174:| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
spec-bundle/schema/SPEC.schema.md:175:| `tracker_issue` | string \| null | REQUIRED | tracker identifier (e.g. `PROJ-123`) or `null` | null until decomposition reflected in tracker |
spec-bundle/schema/SPEC.schema.md:259:**Positive — citation REQUIRED:**
spec-bundle/schema/SPEC.schema.md:302:| `IDEA.md` | REQUIRED | constraints, recommendations, owner judgments |
spec-bundle/schema/SPEC.schema.md:303:| `SPEC.task.md` | REQUIRED | Desired Behavior, Acceptance Criteria, Test Plan, Safety Invariants |
spec-bundle/schema/SPEC.schema.md:304:| `SPEC.contract.md` | REQUIRED | throughout normative sections |
spec-bundle/schema/SPEC.schema.md:305:| `SPEC.decision.md` | REQUIRED only on §Decision Statement | **MUST NOT** appear outside the Decision Statement section |
spec-bundle/schema/SPEC.schema.md:332:- `## Normative Language` (preamble, RECOMMENDED in IDEA, REQUIRED in SPECs)
spec-bundle/schema/SPEC.schema.md:337:- `## Rollback Plan` (REQUIRED in Task, Contract; OPTIONAL in Decision)
spec-bundle/schema/SPEC.schema.md:352:3. Runs `lint-spec.sh` on the artefact (REQUIRED for `contract`,

codex
The current checkout is on `main` at `178cee3`, with `61528c8` immediately underneath it. I’m reading the governing spec/review material now so the gate result is judged against the repo’s own schema, not just the prior review labels.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' spec-bundle/manifest.yaml" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' OPERATING_MODEL.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec_version: "2.1.0"
bundle_version: "2.0.0"
conformance_profile: "core"
generated_on: "2026-05-19"
generator: "agentic-ops-framework"
# schema_uri pins the schema to a stable form. Populated by release
# tooling with the commit SHA of the SPEC at tag time. Between tags
# (current state) the value points at main as an honest placeholder
# with the explicit "this URL is mutable until release tooling pins"
# convention codified in the v2.0 repack SPEC §6.1 + §8.1.
# Codex Round-2 flagged the unpinned form as untrustworthy; the
# correct remediation is release-tooling integration, not a fake
# pin at authoring time.
schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"

# source_commit populated by release tooling at tag time. Empty
# between tags (current state). Release tooling MUST refuse to
# cut a tag with empty source_commit; in-development manifests
# acknowledge this explicitly by leaving the field empty rather
# than fabricating a value.
source_commit: ""

# source_tag empty between tags. The v2.0.0 tag predates the v2.1
# schema bump and has its own (older) manifest content; pointing
# at v2.0.0 from a v2.1-schema manifest would mislead. The next
# tagged release will be v2.1 with full v2.1 schema population
# including source_commit + source_tag at tag time.
source_tag: ""

intent:
  product_name: "agentic-ops-framework"
  product_purpose: |
    A framework for operating engineering work with coding
    agents under spec-first discipline: typed IDEA → SPEC
    artefacts with citation grammar, RFC 2119 scoping rules,
    a per-type quality gate, owner-only authority transitions,
    and a hermetic hook test harness. The framework eats its
    own dog food and is offered as honest experience from one
    studio's working internal practice.
  developer_authority:
    - role: "framework maintainer"
      identity: "HasNoBeef <github:HasNoBeef>"
  installer_authority:
    - role: "user-with-agent"
      capabilities_floor: "any-reasonably-capable-coding-agent"

facets:
  architecture:
    path: "architecture/"
    primary: "architecture/CONTEXT.md"
    media_type: "text/markdown"
    status: "complete"
  deployment:
    path: "deployment/"
    primary: "deployment/install.md"
    media_type: "text/markdown"
    status: "complete"
  behavior:
    path: "behavior/"
    primary: "behavior/features/"
    primary_index: "behavior/features/lint-citation-grammar.feature"
    media_type: "text/x.gherkin"
    status: "partial"            # 2 of N features authored at v2.0
  customization:
    path: "customization/"
    primary: "customization/contract.md"
    media_type: "text/markdown"
    status: "complete"
  decisions:
    path: "decisions/"
    primary: "decisions/INDEX.md"
    media_type: "text/markdown"
    status: "partial"            # INDEX only; per-decision ADRs reserved for v2.x
  quality:
    path: "quality/"
    primary: "quality/requirements.md"
    media_type: "text/markdown"
    status: "complete"
  operations:
    path: "operations/"
    primary: "operations/failures.md"
    media_type: "text/markdown"
    status: "complete"
  non-goals:
    path: "non-goals/"
    primary: "non-goals/INDEX.md"
    media_type: "text/markdown"
    status: "complete"

resources:
  schema:
    path: "schema/SPEC.schema.md"
    media_type: "text/markdown"
  templates:
    path: "templates/"
    media_type: "text/markdown"
  skills:
    path: "skills/"
    media_type: "text/markdown"
  conformance:
    path: "conformance/"
    media_type: "application/vnd.framework.conformance-suite"
    status: "reserved"           # conformance suite reserved for v2.x

provenance:
  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
  sbom_ref: ""                   # populated by release tooling
  slsa_level: ""                 # reserved; SLSA attestation lands when toolchain wired

signature:
  status: "unsigned"
  # When signed: cosign signature + Rekor inclusion proof per
  # https://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/sigstore-cosign.md §3

 succeeded in 0ms:
# Operating Model

The operating model the framework encodes. This document is the
high-level overview; the schema, templates, lint, and hooks are the
machine-enforced surface.

## Lifecycle

Non-trivial agent work follows thirteen phases:

1. **Preflight** — confirm the repo + workspace state is sane
   (workspace layout, hooks installed, MCP config sane).
2. **Orient** — read the entry docs, status, and any active
   spec; build a citable map of the work surface.
3. **Predict** — name the known-likely failure modes and the
   ambiguous owner intent up front.
4. **Ideate** — produce `IDEA.md` capturing problem, substance,
   constraints, approaches considered, recommendation, and any
   owner-blocking open questions.
5. **Author** — produce `SPEC.md` from a ready-for-spec IDEA,
   selecting the type (task / contract / decision) by the
   implied shape; fastpath is a separate type for trivial
   reversible work.
6. **Review** (BLOCKING) — run the per-type quality gate
   (`lint-spec.sh`) and structured review against bar criteria.
   Outcome: `needs-revision` or `approved-pending-owner`.
7. **Approve** — owner alone sets `approved`. Skills MUST NOT.
8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
   emit per-slice `TASK.md` artefacts. Each TASK.md pins
   `model_route`, `cross_validation_lane` (different family
   REQUIRED), and `verification_lane`. Owner alone flips
   `approved → decomposed`.
9. **Dispatch** — TASK.md artefacts feed your tracker / dispatch
   runtime. The framework doesn't dictate the runtime.
10. **Execute** — bounded implementation from an approved
    (and decomposed) spec.
11. **Cross-validate** (BLOCKING per task) — review on a model
    family different from the implementer. No exceptions.
12. **Verify** — run acceptance commands; fill the Completion
    Report; status moves to `verified`.
13. **Report + close** — owner alone sets `closed` after a
    spec-evidence-governance pass on durable lessons.

## Agent roles

Most non-trivial work passes through five roles. One agent MAY
fill more than one role across a session; an agent MUST NOT
fill conflicting roles within a single artefact.

- **Planner** — writes IDEA / SPEC from project facts and owner
  intent. Bounded by the citation grammar.
- **Spec reviewer** — runs the BLOCKING per-type quality gate.
  Rejects ambiguity, unsafe assumptions, and missing tests.
  Sets `needs-revision` or `approved-pending-owner`; never
  `approved`.
- **Executor** — edits code, configs, and directly-coupled
  tests/docs inside the approved scope. Reports scope drift
  rather than silently absorbing it.
- **Verifier** — runs acceptance commands and inspects diffs.
  Records fresh evidence. Cross-family verifier MUST run on a
  different model family from the executor for behavioral
  verification.
- **Archivist** — promotes durable lessons from completed work
  into spec evidence, backlog proposals, or operating-model
  amendments. Emits candidates; does not set `closed` on parent
  SPECs.

## Spec types

| Type | When |
|---|---|
| `task` | Concrete, scoped, verifiable work with a defined endpoint. Default when in doubt and the work is small. |
| `contract` | Stateful, multi-component, protocol-defining work. Lint required. |
| `decision` | Binding choice between named options. RFC 2119 keywords appear only in the Decision Statement section. |
| `fastpath` | Owner-directed trivial reversible work. One file, ≤50 lines, no public-contract impact. Lands at `status: closed` in the same commit as the work. No IDEA, no review gate, no decomposition. |

Capture-after exception (`status: verified` directly under
explicit decision-authority directive) is documented in the
schema for cases where work shipped before the spec was
authored.

## Workspace policy

- Use a separate branch or worktree for parallel write-capable
  agents. Multiple writers MUST NOT edit the same files
  concurrently without a worktree boundary.
- Stage files explicitly. The fleet-baseline hook rejects
  `git add .` and `git add -A`. Bulk staging quietly captures
  unrelated work and is a recurring source of failed reviews.
- Keep generated scratch, machine-local caches, and personal
  credentials out of tracked source. `.mcp.json` is machine-
  local and gitignored; the framework ships with no active
  MCP servers by default.
- Protected branches require an active SPEC declaring
  `branch_policy: main-direct` to allow direct edits and
  pushes. Without that declaration, hooks block both.
- Public OSS repos require extra release hygiene. Do not push
  doc-only agent-control churn to a public surface unless the
  owner approves a low-noise PR plan with explicit CI impact.

## Citation grammar

Every factual claim in any artefact carries a prefix:

| Prefix | Use |
|---|---|
| `file://` | Repository path. The most common cite. |
| `cmd://` | Shell or tool command, with the observed output recorded inline. |
| `url://` | External URL with a fetch date. |
| `decision-authority://<role>:<date>` | A binding directive from a named decision-holder (owner, product lead, tech lead, governance committee, etc.). |
| `owner://` | Shorthand for `decision-authority://owner:<date>` in single-owner studios. |
| `judgment://owner` | Owner-affirmed judgment. Paired with a `decision-authority://` cite. |
| `judgment://agent-synthesis` | Agent inference. MUST be paired with decision-authority affirmation. |

Agent memory and training data are LEGITIMATE INPUTS to ideation
and authoring reasoning. They are NOT citable evidence in
artefacts. If a claim cannot be backed by one of the prefixes
above, it does not belong in the artefact.

## Memory boundary

Long ideation conversations require active agent participation
using full context. In artefacts (IDEA.md, SPEC.md, completion
reports, spec evidence), every fact-bearing claim carries a
cite per the grammar above. The boundary is sharp: the
conversation is the input; the artefact is the evidence.

Practical implications:

- Agents draft options, inventories, and questions during
  ideation. Drafts are planning evidence only until the owner
  records the selected direction in an approved spec.
- Durable facts MUST cite their source. Restating training
  knowledge as a spec claim without a cite is a lint failure.
- Memory across sessions is carried by the SESSION_JOURNAL.md
  workpad and the spec corpus, not by agent-private memory
  stores.

## Owner-only state transitions

The status state machine has three transitions only the owner
sets:

- `approved-pending-owner → approved` (after a clean gate)
- `approved → decomposed` (after decomposition emits TASK.md)
- `verified → closed` (after a spec-evidence-governance pass)

Skills MUST NOT set any of these three. The gate-passing
`spec-review` skill sets `approved-pending-owner` on a clean
result; the `spec-evidence-governance` skill emits candidate
captures but does not flip `closed`.

## Lightweight ceremony modes

The 13-phase lifecycle is the default for non-trivial work. Two
lightweight modes coexist:

**Fastpath SPEC type** applies when ALL of: ≤1 file changed,
≤50 lines, single component, no public-contract or persisted-
state impact, reversible in one commit, explicit owner
directive. Skips IDEA, review, decomposition, cross-validation;
lands at `status: closed` in the same commit as the work. If
ANY threshold fails, escalate to task / contract / decision.

**Capture-after** on task / contract / decision SPECs is
permitted under explicit decision-authority directive when
(a) the artefacts pass lint and the per-type gate, (b) the SPEC
is filed before the next change to the affected surface, and
(c) the SPEC lands at `status: verified` with the Completion
Report filled. Reference: `schema/SPEC.schema.md` §1.3.

These modes exist because the 13-phase ceremony is heavier than
necessary for tiny but non-trivial work. They are NOT escape
hatches — thresholds are objective and lint-enforced.

## Parallel execution policy

Before substantial research, code review, verification, or
implementation, agents evaluate whether independent parts of
the task can run in parallel.

Fanout when:

- Subtasks are independent or file ownership is disjoint.
- Expected wall-clock savings exceed coordination cost.
- Write scope is `none` or `disjoint` (per the TASK.md
  `write_scope` field).
- Each worker has a bounded role, allowed files or read-only
  scope, and a defined output shape.
- One primary agent remains accountable for integration, final
  verification interpretation, and reporting.

Preferred fanout cases:

- Research / inventory / static analysis (read-only).
- Independent verification streams (lint + test + build).
- Code review on multiple independent diffs.
- Documentation audits across non-overlapping surfaces.

Implementation work MAY fan out only when write ownership is
disjoint or isolated by branch / worktree. Multiple write-
capable agents MUST NOT edit the same files concurrently.

Owner-interactive planning stays serial. Do not run multiple
unresolved owner-conversation tracks in parallel. Trivial local
commands, tightly-coupled single-file edits, urgent blocking
steps, and owner-interactive ideation remain local unless the
owner explicitly requests fanout.

Record the parallelism decision in the workpad or TASK.md
front-matter (`parallelism_evaluated: true`) before dispatch.

## Cross-family review

Decomposed work requires a cross-family review pass between
`in-progress` and `in-review` on every TASK.md. The reviewer
agent runs on a different model family from the implementer.
Findings are recorded in the workpad; the implementer addresses
them or pushes back explicitly per the PR feedback protocol.


exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' spec-bundle/schema/SPEC.schema.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
justified pushback) per `spec-bundle/skills/code-review/SKILL.md` and the
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' spec-bundle/architecture/CONTEXT.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
# Architecture — System Context

Per arc42 §3 Context and Scope
(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/arc42.md` §3) and
the C4 model System Context level
(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/c4-model.md` §3),
this file states what the framework is, who its users are,
and what surrounding systems it interacts with.

Note: the canonical research-primary-source corpus lives in
the sibling repo `agentic-installation-methodology` at
`research/primary-sources/`. Cross-repo `file://` paths in
this document resolve relative to that sibling.

## Product (system) under consideration

**agentic-ops-framework** — a framework for operating
engineering work with coding agents under spec-first
discipline.

Concretely, the framework ships:
- A typed SPEC schema with citation grammar, RFC 2119
  scoping, and a status state machine
  (`file://../schema/SPEC.schema.md`).
- Six templates (IDEA + 4 SPEC types + TASK) at
  `file://../templates/`.
- A lint script (`file://../../scripts/lint-spec.sh`) that
  enforces the schema per artefact type.
- A skill catalog (`file://../skills/`) covering the
  spec lifecycle plus multi-repo patterns.
- Seven PreToolUse hooks (`file://../../hooks/`) enforcing
  studio discipline (no AI attribution, no bulk staging,
  no verify-bypass, no push-to-protected-branch).
- A hermetic 33-case hook test harness
  (`file://../../tests/hooks/run-tests.sh`).
- Six worked IDEA+SPEC examples
  (`file://../../examples/`).
- A CI workflow (`file://../../.github/workflows/ci.yml`)
  that runs lint + skill-frontmatter + hook tests +
  manifest validation on every push.

## Users (per arc42 §3 stakeholder framing)

| User class | Goal | Authority |
|---|---|---|
| Framework adopter (a studio or team operating coding agents) | Install + customize the framework; author specs in their own repos | Owner-with-agent in their own context |
| Coding agent (Claude, Codex, Gemini, etc.) | Read the framework's discipline; author + execute against it | Bounded by the spec lifecycle + hook discipline |
| Framework maintainer (HasNoBeef) | Steward the framework's evolution; author spec changes | Final authority on framework direction |

## Surrounding systems

The framework does NOT include but interacts with:

- **GitHub** (or any git host) — the framework's own
  release artefacts + adopter repos live there.
- **Issue trackers** (Linear / GitHub Issues / others) —
  the framework's autonomous-issue-dispatch skill assumes
  a tracker exists; the contract is tracker-agnostic.
- **AI coding assistants** (Claude Code, Codex, Gemini CLI,
  Cursor, Aider, etc.) — the framework's AGENTS.md
  contract per `url://agents.md` is consumed by any
  AGENTS-aware tool.
- **Per-language toolchains** (the languages an adopter's
  product is implemented in) — out of scope of the
  framework itself; the framework is operating-model, not
  language-runtime.

## Boundary (what the framework does NOT cover)

- The framework does NOT prescribe a programming language.
- The framework does NOT bundle an agent runtime; agents
  are dispatched by the adopter's tooling (Claude Code
  CLI, Codex CLI, Symphony, etc.).
- The framework does NOT enforce a particular tracker;
  see Symphony for that pattern
  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/symphony-spec.md`
  §3).

See also: `solution-strategy.md` for arc42 §4 Solution
Strategy; `../non-goals/INDEX.md` for the formal facet-level
non-goal enumeration.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' spec-bundle/skills/spec-review/SKILL.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
---
name: spec-review
description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
---

# Spec Review

Authority: `file://examples/reference-procedure-spec`
§10, §11.3, §17.3. Shared schema:
`file://spec-bundle/schema/SPEC.schema.md` §5.

This skill is **BLOCKING**. A spec MUST NOT advance to
`approved-pending-owner` while any blocking criterion fails. The
skill MUST NOT set `status: approved` — only the owner does that
(SPEC §7.6, schema §1.3).

Per-type gate criteria live in
[`references/per-type-gates.md`](references/per-type-gates.md). Read
that file as part of running the gate; this SKILL.md governs
selection, mechanics, and output.

## When to use

- A primary or sub agent has just authored or revised a `SPEC.md`
  and needs the gate to determine whether the spec is ready for
  owner approval.
- A primary agent has just run `/idea-capture` and needs the IDEA
  gate (§10.1) to determine whether the IDEA can transition from
  `draft` to `ready-for-spec`.
- Any review-time event re-opens a previously-approved spec for
  owner reconsideration (rare; typically owner-driven via
  `status: needs-revision`).

Companion workflow: `agents/workflows/review-spec.md`
(`/review-spec`).

## Inputs

- `spec_path` — repo-relative path to the artefact under review.
  MUST be either `<spec-folder>/SPEC.md` or
  `<spec-folder>/IDEA.md`.
- Front-matter is parsed first. The skill REQUIRES:
  - `type` (`task` | `contract` | `decision`) for SPEC.md, OR
  - `implies_spec_type` (`task` | `contract` | `decision`) for
    IDEA.md.
  If front-matter is missing or malformed, the run aborts with a
  blocking failure of `criterion: front-matter-parse`.

## Gate selection

Per SPEC §10 and SPEC.schema §5:

| Artefact | Gate | Bar | Lint requirement |
|---|---|---|---|
| `IDEA.md` | §10.1 IDEA gate | n/a | RECOMMENDED |
| `SPEC.md` with `type: task` | §10.2 Task gate | `b` (verifiable) | RECOMMENDED |
| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (the autonomous-dispatch runner-grade) | **REQUIRED** |
| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |

Detailed per-type criteria, including fleet-principle additional
checks: see `references/per-type-gates.md`.

## Lint invocation

For `type: contract`, the skill MUST run:

```
bash scripts/lint-spec.sh <spec_path>
```

Exit-code mapping:

- `0` — pass; no lint failure recorded.
- `1` — blocking failure; record one entry per stderr diagnostic
  with `severity: blocking`.
- `2` — advisory only; record entries with `severity: advisory`.
  Does not block transition to `approved-pending-owner`.

For `type: task`, `type: decision`, and IDEA.md, lint is
RECOMMENDED. The skill SHOULD run it and record advisory entries;
it MUST NOT treat lint exit 1 as blocking for these types unless
the gate otherwise requires the underlying check.

## Contract capture-after defer-shorthand check

Per the ceremony-weight Decision (`judgment://agent-synthesis`),
Contract SPECs landing at `status: verified` via the
capture-after exception MAY use a one-paragraph defer-shorthand
in §1 Problem Statement and §13 Test and Validation Matrix. The
shorthand pattern: a single paragraph whose only substantive
content is a `file://specs/<id>/IDEA.md` cite pointing at the
producing IDEA's §1 / §13.

The Contract per-type gate MUST add the following BLOCKING
check when the SPEC under review has `status: verified` AND
either §1 or §13 body appears to be defer-shorthand
(≤ 3 non-blank non-comment lines, all citation-prefixed,
including a `file://specs/<id>/IDEA.md` cite):

1. Resolve the cited IDEA section by path.
2. Read its body.
3. REQUIRED: the cited IDEA section MUST exist and contain at
   least 5 non-blank non-comment lines of substantive content
   (the defer must resolve to real substance, not to another
   defer).
4. On failure: emit a blocking diagnostic
   `capture-after-defer-shorthand: cited IDEA §<n> does not
   resolve to substantive content`. Status: `needs-revision`.

For Contracts at any other status (`draft`, `approved`,
`in-execution`), defer-shorthand in §1 or §13 MUST be rejected
with: `capture-after-defer-shorthand: not permitted at status:
<status>; defer-shorthand requires status: verified`. Status:
`needs-revision`.

This check is BLOCKING per
`judgment://agent-synthesis` §7
"the Contract per-type gate verifying that any capture-after
defer-shorthand resolves to a cited IDEA section".

## Quality Gate Result

Output is a structured record per SPEC §6.1.4:

```yaml
spec_path: specs/<id>/SPEC.md         # or IDEA.md
type: contract                         # task | contract | decision
bar: c                                 # b | c | b-plus-candidates
pass: false
failures:
  - criterion: required-section-missing
    evidence: file://specs/<id>/SPEC.md missing "## 10. Failure Model"
    severity: blocking
  - criterion: lint
    evidence: cmd://bash scripts/lint-spec.sh specs/<id>/SPEC.md (exit 1, "uncited claim at SPEC.md:142")
    severity: blocking
  - criterion: rfc2119-uppercase
    evidence: file://specs/<id>/SPEC.md#L88 "must" lowercase in normative section
    severity: advisory
```

Schema:

- `spec_path` (string, REQUIRED).
- `type` (enum, REQUIRED) — `task` | `contract` | `decision`. For
  IDEA.md, use the IDEA's `implies_spec_type`.
- `bar` (enum, REQUIRED) — `b` | `c` | `b-plus-candidates`. For
  IDEA.md, use literal string `idea`.
- `pass` (boolean, REQUIRED) — `true` iff `failures` contains zero
  entries with `severity: blocking`.
- `failures` (list, REQUIRED, MAY be empty):
  - `criterion` (string, REQUIRED) — short slug (e.g.
    `required-section-missing`, `uncited-claim`, `lint`,
    `acceptance-criteria-orphan`,
    `decision-fewer-than-2-candidates`).
  - `evidence` (string, REQUIRED) — file/line citation per
    SPEC.schema §2 citation grammar.
  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.

Citation discipline applies to the result itself. Every `evidence`
field MUST use a citation prefix (`file://`, `cmd://`, etc.) so
the result is itself contract-grade.

## Status transitions

Pre-condition: `<spec_path>` exists with parseable front-matter and
a status appropriate for review (typically `draft` or
`needs-revision`).

Algorithm (per SPEC §17.3):

```
let result = run_per_type_gate(spec_path)
if type == "contract":
  let lint_exit = run_lint(spec_path)
  if lint_exit == 1: append failure(criterion="lint", severity="blocking", evidence=...)
  if lint_exit == 2: append failure(criterion="lint", severity="advisory", evidence=...)
let blocking = any(f.severity == "blocking" for f in result.failures)
if blocking:
  set front-matter status: needs-revision
  result.pass = false
else:
  set front-matter status: approved-pending-owner   # only for SPEC.md
  result.pass = true
emit result
```

Concrete transitions:

| Artefact | Status before | Blocking failure? | Status after |
|---|---|---|---|
| `SPEC.md` | `draft` | yes | `needs-revision` |
| `SPEC.md` | `draft` | no | `approved-pending-owner` |
| `SPEC.md` | `needs-revision` | yes | `needs-revision` (idempotent re-run) |
| `SPEC.md` | `needs-revision` | no | `approved-pending-owner` |
| `IDEA.md` | `draft` | yes | `draft` (no transition; surface failures) |
| `IDEA.md` | `draft` | no | `ready-for-spec` |
| `IDEA.md` | `owner-blocking` | (any) | `owner-blocking` (no transition; only owner moves out) |

The skill MUST NOT set `status: approved` on a SPEC.md under any
condition. The owner sets `approved` after reviewing the Quality
Gate Result and the SPEC (SPEC §7.6).

If front-matter status is already a terminal or post-approval
value (`approved`, `in-execution`, `verified`, `closed`), the skill
MUST refuse to run with a blocking failure of
`criterion: status-not-reviewable` and MUST NOT mutate the
artefact.

## Hard rules

- The skill MUST NOT set `status: approved`. Only the owner does.
- The skill MUST NOT silently revise spec content. It MAY only
  mutate front-matter `status` per the table above.
- The skill MUST surface every blocking failure with a file/line
  citation. "Vague" findings without citation are themselves a
  quality failure of the review.
- The skill MUST NOT allow implementation scope to hide inside
  Open Questions. Open Questions that imply substantive design
  choices MUST be flagged with
  `criterion: scope-hidden-in-open-question`, `severity: blocking`.
- The skill MUST NOT review for style before correctness and
  safety. Editorial polish is advisory at most.
- Lint exit 1 on a Contract SPEC is blocking even if the gate
  otherwise passes. Lint exit 2 is advisory.
- **Cross-family review.** When the SPEC was authored primarily by
  a model in one family (the agent runner / Claude), the spec-review pass
  SHOULD be performed by a model from a different family. Same-
  family review is structurally weaker. If the only available
  reviewer is from the same family as the author, record this in
  the Quality Gate Result `evidence` field as
  `same-family-review: <model>` and surface it as an `advisory`
  finding. See `file://your model-routing policy` "Routing Matrix"
  row for Spec review and
  `judgment://agent-synthesis`
  §7.3.

## Output to caller

After running the gate the skill MUST emit, in this order:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '240,420p' spec-bundle/skills/spec-review/SKILL.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
After running the gate the skill MUST emit, in this order:

1. The Quality Gate Result block (YAML, schema above).
2. A short prose summary leading with blocking findings, ordered
   by severity, each with a file/line citation.
3. A recommendation line, one of:
   - `approve-pending-owner` (status set to
     `approved-pending-owner`; owner now reviews).
   - `block-needs-revision` (status set to `needs-revision`;
     author addresses failures and re-runs review).
   - `idea-ready-for-spec` (IDEA-mode pass; status set to
     `ready-for-spec`).
   - `idea-blocked` (IDEA-mode failure; status unchanged at
     `draft` or `owner-blocking`).

## Cross-references

- Authority:
  `file://examples/reference-procedure-spec`
  §10, §11.3, §17.3.
- Per-type criteria:
  `file://spec-bundle/skills/spec-review/references/per-type-gates.md`.
- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
  (handoff), §1.3 (state machine), §2 (citation grammar), §3
  (RFC 2119).
- Companion workflow: `<adopter-policy-repo>/agents/workflows/review-spec.md` (fleet-baseline reference; bes-fleet-policy-layout-specific).
- Lint script: `file://scripts/lint-spec.sh` (if absent at
  the time of invocation, a Contract SPEC review MUST report
  `criterion: lint-unavailable`, `severity: blocking`).
- Authoring side: `file://spec-bundle/skills/spec-authoring/SKILL.md`.
- Lifecycle skill:
  `file://spec-bundle/skills/spec-driven-development/SKILL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' spec-bundle/skills/spec-review/references/per-type-gates.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
# Per-Type Gate Criteria

Detailed criteria for each gate type. Authority:
`file://examples/reference-procedure-spec` §10.
When this file and that SPEC diverge, the SPEC wins and this file
MUST be updated to match.

All criteria are **blocking** unless tagged `advisory`.

## Contents

- IDEA gate (§10.1)
- Task SPEC gate, bar (b) "verifiable" (§10.2)
- Contract SPEC gate, bar (c) "the autonomous-dispatch runner-grade" (§10.3)
- Decision SPEC gate, bar (b) + candidate-comparison (§10.4)
- Studio-principle Decision SPECs — additional verbatim-to-normative
  trace check

## IDEA gate (§10.1)

- All REQUIRED IDEA sections (§9.1) present and non-empty (or
  explicit `N/A: <reason>`).
- Every factual claim carries a citation prefix from the allowed
  grammar (`file://`, `cmd://`, `url://`, `owner://`,
  `judgment://owner`, `judgment://agent-synthesis`) per
  SPEC.schema §2.
- Every Owner Judgment in §7 is attributed with a verbatim
  transcript quote.
- Every `judgment://agent-synthesis` claim is paired with owner-
  affirmation in transcript.
- Every Open Question is either resolved or explicitly marked
  `owner-blocking` (the latter blocks transition to
  `ready-for-spec`).
- `implies_spec_type` front-matter is set to `task`, `contract`, or
  `decision`.
- RFC 2119 keywords used in the IDEA are uppercase. Lowercase
  variants in normative-feeling sentences are advisory (severity
  `advisory`).

## Task SPEC gate, bar (b) "verifiable" (§10.2)

- All REQUIRED Task SPEC sections (§9.2) present and non-empty.
- Every external fact cites a source per SPEC.schema §2.
- Every entity in the Domain Model section has a full schema
  (type, nullability; example RECOMMENDED).
- All Acceptance Criteria are checkbox items; each is paired with
  a Test Plan entry.
- Front-matter `acceptance_commands` is non-empty, OR set to `[]`
  with an explicit reason in the Acceptance Criteria section.
- All Open Questions resolved or marked `owner-blocking` (latter
  blocks approval).
- RFC 2119 keywords uppercase.

## Contract SPEC gate, bar (c) "the autonomous-dispatch runner-grade" (§10.3)

- All Task gate (bar b) criteria above, applied where they fit
  Contract sections.
- Normative Language preamble present.
- Test and Validation Matrix is 1:1 with Acceptance Criteria — no
  orphan tests, no unverified criteria.
- Definition of Done checklist mirrors the Test Matrix.
- When behavior is stateful, a state machine is named with states,
  transitions, triggers, and idempotency rules.
- Pseudocode for non-trivial algorithms.
- Failure Model section present with failure classes and recovery
  behavior.
- Observability section present.
- Trust Boundary / Security section present.
- `scripts/lint-spec.sh` exits 0 on this SPEC (exit 2 is
  advisory and does not block; exit 1 is blocking).

## Decision SPEC gate, bar (b) + candidate-comparison (§10.4)

- Task gate (bar b) criteria above, applied where they fit Decision
  sections.
- Candidate Options table has ≥ 2 candidates, each with all
  required fields (description, fit-with-substance,
  fit-with-constraints, cost, risk).
- Decision Criteria are sourced (substance citation or
  `judgment://owner`).
- Trade-off Comparison present.
- Decision Statement present, in RFC 2119 normative language. RFC
  2119 keywords MUST NOT appear elsewhere in a Decision SPEC
  (SPEC.schema §3).
- Locks section present (MAY state `no locks` with reason).
- Reversal Plan present (MAY state `irreversible: <reason>`).

### Fleet-principle Decision SPECs — additional check

When the SPEC slug matches `principle-*` (per
`file://spec-bundle/skills/spec-authoring/SKILL.md`), apply the
**verbatim-to-normative trace** check in addition to the standard
Decision gate:

- Every RFC 2119 clause in §7 Decision Statement MUST trace back
  to a specific owner verbatim (`owner://transcript-<date>` quote)
  or to a `judgment://owner` capture in the upstream IDEA.
- Failure mode: a normative clause with no upstream owner anchor
  signals the principle is being authored ahead of owner intent.
  Record as `criterion: principle-not-owner-anchored`,
  `severity: blocking`; route to `needs-revision`.
- Authority:
  `judgment://agent-synthesis`
  §5 ("Trace-from-verbatim-to-normative is the principle SPEC
  quality signature").

The check is the principle SPEC's quality signature; lint catches
the structural failure (uncited claims) but not the semantic walk
from owner verbatim through IDEA decomposition into the specific §7
clause. The walk is a `spec-review` responsibility for principle
SPECs.

codex
The target SPEC is a `contract` at `status: verified`, so the repo’s own review skill says lint is mandatory and capture-after shorthand has to resolve to substantive IDEA content. I’ll include those checks alongside the Round 4 regression checks.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,180p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
---
id: 2026-05-19-v2-manifest-catalog-repack
status: verified
type: contract
owner: HasNoBeef
repo: agentic-ops-framework
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
  - test -f spec-bundle/manifest.yaml
  - bash scripts/validate-manifest.sh
cites_decision: 2026-05-18-agentic-installation-methodology
---

# SPEC: Product A v2.0 — Manifest+Catalog Repack (Slice 2)

Status: Draft v1
Type: Contract
Purpose: govern the v1.1 → v2.0 reorganization of
agentic-ops-framework from a single-tree layout into a
front-door-manifest + per-facet-catalog shape that
exemplifies the methodology Product B publishes. Defines
the v2.0 directory layout, the manifest schema, the
per-facet sub-spec contracts (architecture / deployment /
behavior / customization / decisions / quality /
operations / non-goals), the migration path from v1.1, and
the v2.0 conformance suite. Every methodology primitive
cited here resolves to a primary-source artefact in the
sibling repo's
`research/primary-sources/<slug>.md` corpus.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

## 1. Problem Statement

The parent Decision SPEC at
`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7 binds the studio to repack the agentic-ops-framework
v1.1 (the worked-case-study product) into the
manifest+catalog shape the methodology advocates, as the
paired-release artefact accompanying Product B v1.0. The
methodology's recommended packaging
(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
§3 transferable building blocks;
`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
§3 manifest+descriptors+layers) is incompatible with
Product A v1.1's current single-tree layout. Without the
repack, Product B's longread would advocate manifest+catalog
while its worked example shipped as a single tree —
violating the rolls-royce dogfooding constraint
(`owner://transcript-2026-05-18`).

This SPEC defines the v2.0 layout, the front-door manifest
schema, the per-facet sub-spec contracts grounded in the
methodology's primary-source corpus, and the migration
path from v1.1 → v2.0. <!-- lint-ok: no-citation -->

## 2. Goals and Non-Goals

Goals:

- Define the v2.0 directory layout that exemplifies
  manifest+catalog packaging
  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
  §3).
- Author the front-door `spec-bundle/manifest.yaml`
  schema (machine-readable; lists spec_version,
  conformance_profile, pointers to per-facet sub-specs,
  signature placeholder).
- Author per-facet sub-spec contracts for the eight
  facets enumerated in research §5.1 (the methodology's
  packaging recommendation).
- Author a `scripts/validate-manifest.sh` mechanical
  gate that checks the manifest references every named
  sub-spec and every sub-spec is registered in the
  manifest.
- Define a v1.1 → v2.0 migration index: for each v1.1
  top-level entry, which v2.0 facet absorbs it (or which
  v2.0 entry replaces it).
- Preserve every v1.1 capability (lint, hooks, skills,
  CI) — v2.0 reorganizes; it MUST NOT regress
  functionality.

Non-goals:

- Renaming the framework (it remains
  `agentic-ops-framework`).
- Removing v1.1's `skills/` content (skills are a
  first-class facet of v2.0, just located under
  `spec-bundle/skills/` per the new layout).
- Adopting OCI-artifact distribution at v2.0 (the
  manifest's signature field is reserved but not
  populated; OCI-distribution lands at v2.x once
  Sigstore signing tooling is wired in).
- Cross-repo refactor of the sibling fleet repos that
  consume Product A's `.agents/` content via
  `fleet-sync.sh` (any consumer-side changes are
  separate Task SPECs in the fleet repos).
- Authoring the methodology longread or per-facet
  sub-spec CONTENT for Product B itself — that is
  slice 3 / 4 of the parent Decision.

## 3. System Overview

The v2.0 framework reorganizes around a front-door
manifest plus eight per-facet sub-spec directories:

```
agentic-ops-framework/
├── LICENSE
├── README.md                          # v2.0 entry + migration note
├── AGENTS.md
├── CLAUDE.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── CHANGELOG.md                       # v2.0 entry added
├── OPERATING_MODEL.md                 # remains; canonical operating-model
├── spec-bundle/
│   ├── manifest.yaml                  # front-door manifest
│   ├── architecture/
│   ├── deployment/
│   ├── behavior/
│   ├── customization/
│   ├── decisions/
│   ├── quality/
│   ├── operations/
│   ├── non-goals/
│   ├── skills/                        # the framework's own skills (was /skills/)
│   ├── templates/                     # SPEC templates (was /templates/)
│   ├── schema/                        # SPEC.schema.md (was /schema/)
│   └── conformance/                   # executable conformance suite
├── scripts/                           # lint-spec, validate-manifest, etc.
├── hooks/                             # PreToolUse hooks (unchanged in scope)
├── tests/                             # hook tests + future facet tests
├── specs/                             # internal SPECs (framework's own ledger)
├── examples/                          # worked IDEA+SPEC examples (unchanged)
├── workflow/                          # UNIVERSAL.md (unchanged)
├── workpads/                          # workpad templates (unchanged)
└── .github/workflows/                 # CI (updated to validate manifest)
```

Top-level keeps the OSS-repo conventional set (LICENSE,
README, CONTRIBUTING, etc.) plus existing scripts/, hooks/,
tests/, specs/, examples/. The new `spec-bundle/`
directory is the actual manifest+catalog artefact — what a
consumer fetches if they want only the methodology
artefact, not the framework's git history.

## 4. Authority Map

Active authority for this contract:

- `decision-authority://owner:2026-05-18` — owner
  directive ("Do what is the rolls royce" + "base this
  all in deep research, not make up bullshit"); binds
  the repack as the methodology's worked-example
  dogfood.
- Parent Decision SPEC
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — names this slice; §9 Locks unlock the repack
  upon Decision approval.
- Sibling Contract SPEC
  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  (status: verified) — the primary-source corpus this
  repack draws methodology primitives from.
- `file://schema/SPEC.schema.md` — citation grammar,
  RFC 2119 scoping, front-matter schema.

Active primary-source citations (corpus-grounded):

- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
  §3 — operating-model-as-SPEC; 18-section pattern.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '240,340p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
pattern).

There is no `manifest.yaml` in v1.1. v2.0 introduces it as
the front-door artefact. <!-- lint-ok: no-citation -->

Skills, templates, schema currently live at top-level
(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
them under `spec-bundle/` so the manifest can address
them as per-facet sub-spec resources. <!-- lint-ok: no-citation -->

## 6. Domain Model

### 6.1 Front-door manifest (spec-bundle/manifest.yaml)

The manifest is the bundle's single source of truth for
what the bundle contains and what conformance profile it
claims. Schema:

```yaml
# spec-bundle/manifest.yaml — v2.1.0 schema example
# (updated from v2.0.0 per codex remediation §7.E / §7.F;
# Round-3 finding flagged the original v2.0.0 example here
# as stale relative to §8.1 v2.1.0 formal schema)
spec_version: "2.1.0"               # semver; this manifest schema version
bundle_version: "2.0.0"             # semver; this specific bundle release
conformance_profile: "core"         # core | extension | real-integration
generated_on: "YYYY-MM-DD"          # ISO date the bundle was assembled
generator: "agentic-ops-framework"  # source repo identifier
schema_uri: "<URL pin>"             # v2.1 REQUIRED; pin to immutable
                                    # commit / tag at release time
source_commit: ""                   # v2.1 REQUIRED; populated by
                                    # release tooling at tag time
source_tag: ""                      # v2.1 OPTIONAL; empty between tags

intent:
  product_name: "agentic-ops-framework"
  product_purpose: |
    <one-paragraph statement of what the product is for>
  developer_authority:
    - role: "framework maintainer"
      identity: "HasNoBeef <github:HasNoBeef>"
  installer_authority:
    - role: "user-with-agent"
      capabilities_floor: "any-reasonably-capable-coding-agent"

facets:
  architecture:
    path: "architecture/"
    primary: "architecture/CONTEXT.md"
    media_type: "text/markdown"     # v2.1 RECOMMENDED
    status: "complete"              # v2.1 RECOMMENDED: complete | partial | reserved
  deployment:
    path: "deployment/"
    primary: "deployment/install.md"
    media_type: "text/markdown"
    status: "complete"
  behavior:
    path: "behavior/"
    primary: "behavior/features/"
    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
    media_type: "text/x.gherkin"
    status: "complete"
  customization:
    path: "customization/"
    primary: "customization/contract.md"
    media_type: "text/markdown"
    status: "complete"
  decisions:
    path: "decisions/"
    primary: "decisions/INDEX.md"
    media_type: "text/markdown"
    status: "complete"
  quality:
    path: "quality/"
    primary: "quality/requirements.md"
    media_type: "text/markdown"
    status: "complete"
  operations:
    path: "operations/"
    primary: "operations/failures.md"
    media_type: "text/markdown"
    status: "complete"
  non-goals:
    path: "non-goals/"
    primary: "non-goals/INDEX.md"
    media_type: "text/markdown"
    status: "complete"

resources:
  schema:
    path: "schema/SPEC.schema.md"
    media_type: "text/markdown"
  templates:
    path: "templates/"
    media_type: "text/markdown"
  skills:
    path: "skills/"
    media_type: "text/markdown"
  conformance:
    path: "conformance/"
    media_type: "application/vnd.framework.conformance-suite"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '560,670p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
9. Add `CHANGELOG.md` v2.0 entry documenting the
   reorganization.
10. Tag `v2.0.0` once `validate-manifest` + lint +
    hook-tests all pass on the repacked tree.

### 7.3 Migration semantics

v2.0 is a **breaking** change to top-level layout. Consumers
who fetched v1.1 by file paths under `schema/`,
`templates/`, `skills/`, `workflow/`, `workpads/` will need
to update their paths. The `CHANGELOG.md` v2.0 entry and
the v2.0 README's migration note enumerate the path
changes.

For the fleet-sync.sh consumers (the eight BES repos
that consume Product A's content via `fleet-files.txt`),
the manifest in `fleet-files.txt` is updated to point at
the new `spec-bundle/<facet>/` paths. This is a separate
Task SPEC in `bes-fleet-policy` once v2.0 lands; it is
explicitly out of scope here.

## 8. Schema Specification

### 8.1 Manifest schema (formal — v2.1.0)

The manifest is YAML. Top-level keys (REQUIRED unless
noted). Fields marked **(v2.1)** were added per the codex
remediation amendment at
`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
§7.E (finding 3.5) — manifest spec_version bumped from
2.0.0 to 2.1.0.

| Field | Type | Required | Notes |
|---|---|---|---|
| `spec_version` | string (semver) | yes | This manifest schema's version |
| `bundle_version` | string (semver) | yes | This bundle release |
| `conformance_profile` | enum | yes | `core` \| `extension` \| `real-integration` |
| `generated_on` | string (ISO date) | yes | YYYY-MM-DD |
| `generator` | string | yes | Source repo identifier |
| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
| `intent` | object | yes | See §8.2 |
| `facets` | object | yes | See §8.3 |
| `resources` | object | OPTIONAL | See §8.4 |
| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
| `signature` | object | OPTIONAL | See §8.5 |

### 8.2 `intent` block

| Field | Type | Required |
|---|---|---|
| `product_name` | string | yes |
| `product_purpose` | string (multi-line) | yes |
| `developer_authority` | list[role+identity] | yes |
| `installer_authority` | list[role+capabilities_floor] | yes |

### 8.3 `facets` block

A map from facet name to facet record. Recognized facet
names: `architecture`, `deployment`, `behavior`,
`customization`, `decisions`, `quality`, `operations`,
`non-goals`. Each facet record:

| Field | Type | Required |
|---|---|---|
| `path` | string (relative) | yes |
| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
| `digest` | string | RECOMMENDED **(v2.1)** | `algorithm:hex` form per OCI Descriptor convention; lets consumers verify by hash |
| `size` | integer | OPTIONAL **(v2.1)** | Size in bytes |
| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |

Additional facets MAY appear; `validate-manifest.sh`
allows extensions but warns.

**v2.1 facet.primary directory rule (codex remediation
finding 3.6)**: when `primary` is a directory path, the
validator enforces that the directory exists AND that
the file named by `primary_index` exists inside it AND
(if `media_type` is set) at least one file in the
directory matches the media type's file extension
convention (`text/x.gherkin` → `*.feature`,
`text/markdown` → `*.md`, etc.). The pre-v2.1 silent-
allow on directory primaries is replaced with this
explicit branch.

### 8.4 `resources` block

| Field | Type |
|---|---|
| `schema` | object with `path` |
| `templates` | object with `path` |
| `skills` | object with `path` |
| `conformance` | object with `path` |

Resource records MAY also include `media_type`,
`digest`, `size`, `status` fields (same semantics as
§8.3 facet record).

### 8.5 `signature` block

At v2.0 launch:
- `status: unsigned` is the default.
- Signed fields (`cosign_signature`, `rekor_inclusion`,
  `signing_identity`) are reserved; populate at v2.x
  when Sigstore tooling is wired in.

### 8.6 `provenance` block (v2.1)


exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '860,1020p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
      escalate if owner directs.
- [ ] Q4: Should `fleet-sync.sh` (in `bes-fleet-policy`)
      be updated in lockstep with v2.0 launch, or
      announce-then-update? Default: announce-then-
      update; the fleet repos pin v1.1 paths until a
      separate Task SPEC migrates them.

None of Q1-Q4 is `owner-blocking`; all can be deferred
to follow-on Task SPECs.

## 18. Migration / Coexistence

v2.0 supersedes v1.1's top-level layout. Coexistence
strategy: <!-- lint-ok: no-citation -->

- v1.1 remains the tagged release; consumers continue
  to fetch v1.1 by tag until they choose to upgrade. <!-- lint-ok: no-citation -->
- v2.0 ships under the same repo URL; the v2.0.0 tag
  marks the breaking-layout boundary. <!-- lint-ok: no-citation -->
- The CHANGELOG.md v2.0 entry contains the migration
  index (§7.1 above) so consumers can find their
  artefacts' new homes. <!-- lint-ok: no-citation -->
- For 30 days after v2.0 release, the repo MAY keep
  symlinks from old paths (`schema/SPEC.schema.md` →
  `spec-bundle/schema/SPEC.schema.md`) to ease
  transition. After 30 days, symlinks are removed. <!-- lint-ok: no-citation -->

## 19. Completion Report

### 19.0 Amendment log (post-verification edits)

Per the pattern established in the parent Decision SPEC
§14.0 and the corpus SPEC §19.0, this Completion Report
was filled at original verification 2026-05-19 (v2.0.0
release tag). Subsequent codex cross-family remediation
rounds amended §6.1 / §8 (v2.1 schema bump), validate-
manifest.sh (v2.1 enforcement + semantic containment),
spec-bundle/manifest.yaml (v2.1 fields populated), and
template/skill cross-references. §19.1 + §19.2 retain
the original-verification state; current-state values
are in this Amendment Log.

| Round | Date | Notable | Commit |
|---|---|---|---|
| Original | 2026-05-19 | v2.0 layout repack + v2.0.0 tag | `1104e3a` + `5f59f7b` |
| §7.E/F | 2026-05-19 | v2.1 schema bump | `ad36bda` |
| R2 fixes | 2026-05-19 | validator v2.1 + provenance honesty + path migration | `9fef966`, `380db29` |
| R3 fixes | 2026-05-19 | validator inside-directory + v2.1 example + bare-path migration | `e78b8a4` |
| R4 fixes | 2026-05-20 | validator semantic-containment + REQUIRED-field expansion + final bare-path migration | `61528c8` |

Current-state evidence supersedes §19.2:
- repack-SPEC citation-prefix hits: 66 (per current
  `lint-spec.sh` invocation; was 50 at original
  verification)
- manifest spec_version: `2.1.0` (was `2.0.0` at
  original verification; v2.0.0 release tag stays at
  `2.0.0`)
- validate-manifest: PASS at v2.1.0 schema with
  semantic-containment + 5 top-level REQUIRED + 3
  intent REQUIRED enforcement

### 19.1 Files changed (historical; original verification)

60 files changed in commit `1104e3a`
(2016 insertions / 72 deletions):

**Created** (24 new files):
- `AGENTS.md` (new top-level entry doc)
- `CLAUDE.md` (new Claude Code entry doc; imports AGENTS.md)
- `scripts/validate-manifest.sh` (mechanical completeness
  gate)
- `spec-bundle/manifest.yaml` (front-door manifest)
- `spec-bundle/architecture/CONTEXT.md` +
  `solution-strategy.md`
- `spec-bundle/deployment/install.md` +
  `requirements.md`
- `spec-bundle/behavior/features/lint-citation-grammar.feature`
  + `hook-blocks-ai-attribution.feature`
- `spec-bundle/customization/contract.md` +
  `knobs.schema.json`
- `spec-bundle/decisions/INDEX.md`
- `spec-bundle/quality/requirements.md` +
  `12-factor-overlay.md`
- `spec-bundle/operations/failures.md` +
  `observability.md` + `safety-invariants.md`
- `spec-bundle/non-goals/INDEX.md`

**Renamed** (33 files via `git mv`; history preserved):
- `schema/SPEC.schema.md` →
  `spec-bundle/schema/SPEC.schema.md`
- `templates/*.template.md` (6 files) →
  `spec-bundle/templates/*.template.md`
- `skills/<name>/SKILL.md` (20 skills) →
  `spec-bundle/skills/<name>/SKILL.md`
- `skills/<name>/references/*.md` (4 references) →
  `spec-bundle/skills/<name>/references/*.md`
- `workflow/UNIVERSAL.md` →
  `spec-bundle/operations/workflow-universal.md`
- `workpads/*.template.md` (3 files) →
  `spec-bundle/templates/workpads/*.template.md`

**Modified** (4 files):
- `.github/workflows/ci.yml` — adds `validate-manifest`
  job (5 jobs total now)
- `CHANGELOG.md` — v2.0 entry with migration index
- `README.md` — rewritten for v2.0 with v1.x migration
  table
- `scripts/validate-skill-frontmatter.sh` — scans
  `spec-bundle/skills/` (was `skills/`)

**Removed**:
- `docs/` (was empty)
- `workflow/` (after UNIVERSAL.md moved)

### 19.2 Commands run

- `cmd://mkdir -p spec-bundle/{architecture,deployment,
  behavior/features,customization/profiles,decisions,
  quality,operations,non-goals,conformance}`.
- `cmd://git mv schema spec-bundle/schema` +
  `templates spec-bundle/templates` +
  `skills spec-bundle/skills` +
  `workpads spec-bundle/templates/workpads`.
- `cmd://mv workflow/UNIVERSAL.md
  spec-bundle/operations/workflow-universal.md` +
  `git rm -r workflow` + `rmdir docs`.
- `cmd://chmod +x scripts/validate-manifest.sh`.
- `cmd://bash scripts/lint-spec.sh
  specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
  — exit 0 at original verification (0 errors, 0
  warnings, 50 citation hits; 66 current per §19.0
  Amendment Log).
- `cmd://bash scripts/validate-manifest.sh` — exit 0
  at original verification (PASS — manifest schema
  2.0.0, conformance core, 8 facets; current schema is
  2.1.0 per §19.0 Amendment Log).
- `cmd://bash scripts/validate-skill-frontmatter.sh` —
  exit 0 (clean; 20 skills under spec-bundle/skills/).
- `cmd://bash tests/hooks/run-tests.sh` — 33 pass /
  0 fail.
- `cmd://node --check scripts/preflight.mjs` — clean.
- Per-example lint: 7 examples × `bash scripts/lint-spec.sh
  examples/*/IDEA.md examples/*/SPEC.md` — all exit 0.
- `cmd://git add` (explicit; no bulk staging) + commit
  + `git push origin main`.
- `cmd://gh -R buildepicshit/agentic-ops-framework run
  list --limit 1` — CI run `26074043565` reports
  `conclusion: success`.

### 19.3 Verification result

PASS. All 9 ACs met except AC-8 (v2.0.0 tag) which is
pending immediately after this commit lands. CI is
green on the v2.0 repack commit (`1104e3a`); five jobs
pass (lint-spec, validate-skills, test-hooks,
validate-manifest, preflight-self-check).

The manifest+catalog packaging successfully exemplifies
the methodology the sibling repo
`agentic-installation-methodology` publishes. The
worked-case-study contract is discharged: Product A's

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,320p' scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
#!/usr/bin/env bash
# validate-manifest.sh — mechanical gate for spec-bundle/manifest.yaml.
#
# Authority: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
#   §6.1 (manifest schema), §8 (formal schema), §9.1 (validation
#   algorithm pseudocode).
#
# Checks:
# 1. spec-bundle/manifest.yaml exists and parses.
# 2. spec_version matches the schema version in this script
#    (currently 2.0.0).
# 3. conformance_profile is one of {core, extension, real-integration}.
# 4. Every facet listed has its directory and primary file.
# 5. Every directory under spec-bundle/ (except resource dirs) is
#    listed in facets.
# 6. intent.product_name matches the repo identifier.
#
# Exit 0 iff valid; non-zero with diagnostics to stderr.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BUNDLE_DIR="$REPO_ROOT/spec-bundle"
MANIFEST="$BUNDLE_DIR/manifest.yaml"

EXPECTED_SPEC_VERSION="2.1.0"
EXPECTED_PRODUCT_NAME="agentic-ops-framework"
VALID_PROFILES="core extension real-integration"

# Directories under spec-bundle/ that are resources, not facets.
RESOURCE_DIRS=("schema" "templates" "skills" "conformance")

errors=()

err() {
    errors+=("$1")
}

if [ ! -f "$MANIFEST" ]; then
    printf 'validate-manifest: FAIL — manifest not found at %s\n' "$MANIFEST" >&2
    exit 1
fi

# Extract scalar fields via grep + sed (no yq dependency).
get_field() {
    local field="$1"
    grep -E "^${field}:" "$MANIFEST" | head -1 | sed -E "s/^${field}:[[:space:]]*//;s/^\"//;s/\"$//"
}

actual_spec_version="$(get_field 'spec_version')"
actual_conformance="$(get_field 'conformance_profile')"

# 2. spec_version match.
if [ "$actual_spec_version" != "$EXPECTED_SPEC_VERSION" ]; then
    err "spec_version mismatch: expected $EXPECTED_SPEC_VERSION, got '$actual_spec_version'"
fi

# 3. conformance_profile valid.
if ! printf '%s\n' $VALID_PROFILES | grep -qFx "$actual_conformance"; then
    err "conformance_profile invalid: got '$actual_conformance'; expected one of {$VALID_PROFILES}"
fi

# 3b. REQUIRED top-level field presence (codex Round-3 + Round-4).
# Per SPEC §8.1, the following are REQUIRED:
# - v2.0 baseline: spec_version, bundle_version, conformance_profile,
#   generated_on, generator (spec_version + conformance_profile
#   already validated above).
# - v2.1 additions: schema_uri, source_commit.
# Field values MAY be empty string at authoring time per the
# codex Round-2 honest-disclosure pattern; validator checks only
# presence of the key, not non-emptiness. source_tag stays OPTIONAL.
for required_key in bundle_version generated_on generator schema_uri source_commit; do
    if ! grep -qE "^${required_key}:" "$MANIFEST"; then
        err "REQUIRED top-level key missing: $required_key (per SPEC §8.1)"
    fi
done

# 3c. REQUIRED intent block fields (codex Round-4 finding).
# Per SPEC §8.2, intent MUST have product_name, product_purpose,
# developer_authority, installer_authority. product_name already
# validated above via actual_product_name check; here we verify
# the other three keys are declared inside the intent block.
for required_intent_key in product_purpose developer_authority installer_authority; do
    if ! grep -qE "^[[:space:]]+${required_intent_key}:" "$MANIFEST"; then
        err "REQUIRED intent key missing: $required_intent_key (per SPEC §8.2)"
    fi
done

# 6. product_name match (search for product_name under intent).
actual_product_name="$(grep -E '^[[:space:]]+product_name:' "$MANIFEST" | head -1 | sed -E 's/^[[:space:]]+product_name:[[:space:]]*//;s/^"//;s/"$//')"
if [ "$actual_product_name" != "$EXPECTED_PRODUCT_NAME" ]; then
    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
fi

# 4 + 5. Parse facets block; extract slugs.
# Match lines indented two spaces under "facets:" that end with ":".
declare -a facet_slugs=()
in_facets=0
in_facets_record=""
while IFS= read -r line; do
    if [[ "$line" =~ ^facets: ]]; then
        in_facets=1
        continue
    fi
    if [ $in_facets -eq 1 ]; then
        # Top-level key (no indent) ends facets block.
        if [[ "$line" =~ ^[a-z_-] ]]; then
            in_facets=0
            continue
        fi
        # Two-space-indented key with no further indent is a facet name.
        if [[ "$line" =~ ^[[:space:]]{2}[a-z_-]+:[[:space:]]*$ ]]; then
            slug="${line//[[:space:]]/}"
            slug="${slug%:}"
            facet_slugs+=("$slug")
        fi
    fi
done < "$MANIFEST"

if [ ${#facet_slugs[@]} -eq 0 ]; then
    err "facets block empty or unparseable"
fi

# Build set of fs facet dirs.
declare -a fs_dirs=()
if [ -d "$BUNDLE_DIR" ]; then
    while IFS= read -r dir; do
        base="$(basename "$dir")"
        # Skip resource dirs.
        is_resource=0
        for r in "${RESOURCE_DIRS[@]}"; do
            if [ "$base" = "$r" ]; then
                is_resource=1
                break
            fi
        done
        if [ $is_resource -eq 0 ]; then
            fs_dirs+=("$base")
        fi
    done < <(find "$BUNDLE_DIR" -mindepth 1 -maxdepth 1 -type d | sort)
fi

# Compare facet slugs vs fs dirs.
for slug in "${facet_slugs[@]}"; do
    found=0
    for d in "${fs_dirs[@]}"; do
        [ "$d" = "$slug" ] && found=1 && break
    done
    if [ $found -eq 0 ]; then
        err "facet '$slug' listed in manifest but no directory at spec-bundle/$slug/"
    fi
done

for d in "${fs_dirs[@]}"; do
    found=0
    for slug in "${facet_slugs[@]}"; do
        [ "$slug" = "$d" ] && found=1 && break
    done
    if [ $found -eq 0 ]; then
        err "directory spec-bundle/$d/ exists but not listed in manifest facets"
    fi
done

# Check each facet's primary file exists.
# Parse primary + primary_index + media_type per facet per the v2.1
# schema (codex Round-2 BLOCKER finding closed: previously the script
# accepted directory primaries silently without verifying primary_index
# or media-type-extension conventions; this branch now enforces the
# v2.1 binding).
current_facet=""
declare -A facet_primary
declare -A facet_primary_index
declare -A facet_media_type
while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
        current_facet="${BASH_REMATCH[1]}"
    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
        primary="${BASH_REMATCH[1]}"
        primary="${primary%\"}"
        facet_primary["$current_facet"]="$primary"
    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
        pi="${BASH_REMATCH[1]}"
        pi="${pi%\"}"
        facet_primary_index["$current_facet"]="$pi"
    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
        mt="${BASH_REMATCH[1]}"
        mt="${mt%\"}"
        facet_media_type["$current_facet"]="$mt"
    elif [[ "$line" =~ ^[a-z_-] ]]; then
        current_facet=""
    fi
done < "$MANIFEST"

# Media-type → file-extension expectations (v2.1 schema §8.3).
media_type_extension() {
    case "$1" in
        text/markdown) printf '.md' ;;
        text/x.gherkin) printf '.feature' ;;
        application/vnd.framework.conformance-suite) printf '' ;;  # any
        *) printf '' ;;
    esac
}

# Iterate every facet from the manifest, not just those that parsed a
# primary value. This closes the codex Round-3 BLOCKER where facets
# without a parsed primary silently escaped the check branch.
for facet in "${facet_slugs[@]}"; do
    primary="${facet_primary[$facet]:-}"
    if [ -z "$primary" ]; then
        err "facet '$facet' has no primary field in the manifest (per SPEC §8.3 primary is REQUIRED for every facet)"
        continue
    fi
    if [[ "$primary" == */ ]]; then
        # Directory primary — v2.1 requires primary_index.
        if [ ! -d "$BUNDLE_DIR/$primary" ]; then
            err "facet '$facet' primary directory missing: $primary"
            continue
        fi
        pi="${facet_primary_index[$facet]:-}"
        if [ -z "$pi" ]; then
            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
            continue
        fi
        # primary_index MUST be INSIDE the primary directory
        # (codex Round-3 + Round-4: the string-prefix check was
        # fooled by path traversal like "behavior/features/../../
        # architecture/CONTEXT.md" which prefix-matched but
        # resolved outside the primary directory. Semantic
        # containment via canonicalised paths is the fix.)
        if [[ "$pi" != "$primary"* ]]; then
            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment (lexical prefix check)"
            continue
        fi
        # Semantic-containment check: canonicalise both paths and
        # verify the canonicalised primary_index sits inside the
        # canonicalised primary directory. Defeats ../ traversal.
        canon_primary="$(cd "$BUNDLE_DIR/$primary" 2>/dev/null && pwd)"
        canon_pi_dir="$(cd "$BUNDLE_DIR/$(dirname "$pi")" 2>/dev/null && pwd)"
        if [ -z "$canon_primary" ] || [ -z "$canon_pi_dir" ]; then
            err "facet '$facet' primary or primary_index cannot be canonicalised (primary=$primary, primary_index=$pi)"
            continue
        fi
        if [[ "$canon_pi_dir" != "$canon_primary"* ]]; then
            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
            continue
        fi
        if [ ! -f "$BUNDLE_DIR/$pi" ]; then
            err "facet '$facet' primary_index file missing: $pi"
        fi
        # Media-type extension conformance (v2.1 §8.3).
        mt="${facet_media_type[$facet]:-}"
        ext="$(media_type_extension "$mt")"
        if [ -n "$ext" ]; then
            n_matching=$(find "$BUNDLE_DIR/$primary" -maxdepth 1 -name "*$ext" -type f 2>/dev/null | wc -l)
            if [ "$n_matching" -eq 0 ]; then
                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
            fi
        fi
    else
        # File primary.
        if [ ! -f "$BUNDLE_DIR/$primary" ]; then
            err "facet '$facet' primary file missing: $primary"
        fi
    fi
done

if [ ${#errors[@]} -gt 0 ]; then
    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline 178cee3' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
178cee3 spec(amend): repack §19.0 Amendment Log + historical evidence labelled (self-audit)
 .../2026-05-19-v2-manifest-catalog-repack/SPEC.md  | 43 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline 61528c8' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
61528c8 fix(v2 r4): validator semantic-containment + REQUIRED-field expansion + bare-path migration (codex R4)
 scripts/validate-manifest.sh                       | 53 +++++++++++++++++-----
 spec-bundle/schema/SPEC.schema.md                  | 18 ++++----
 .../cross-repo-informational-channel/SKILL.md      |  2 +-
 spec-bundle/skills/spec-authoring/SKILL.md         |  6 +--
 .../skills/spec-driven-development/SKILL.md        |  4 +-
 .../templates/workpads/SESSION_JOURNAL.template.md |  2 +-
 6 files changed, 58 insertions(+), 27 deletions(-)

codex
The acceptance surface is narrow and should be safe: `lint-spec.sh`, existence of the manifest, and `validate-manifest.sh`. I’m running those now, then I’ll do targeted static checks for the Round 4 fixes that passing acceptance alone would not exercise.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --exit-code -- specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
validate-manifest: PASS — manifest schema 2.1.0, conformance core, 8 facets

 succeeded in 893ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  66
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find spec-bundle -maxdepth 3 -type f | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/architecture/CONTEXT.md
spec-bundle/architecture/solution-strategy.md
spec-bundle/behavior/features/hook-blocks-ai-attribution.feature
spec-bundle/behavior/features/lint-citation-grammar.feature
spec-bundle/customization/contract.md
spec-bundle/customization/knobs.schema.json
spec-bundle/decisions/INDEX.md
spec-bundle/deployment/install.md
spec-bundle/deployment/requirements.md
spec-bundle/manifest.yaml
spec-bundle/non-goals/INDEX.md
spec-bundle/operations/failures.md
spec-bundle/operations/observability.md
spec-bundle/operations/safety-invariants.md
spec-bundle/operations/workflow-universal.md
spec-bundle/quality/12-factor-overlay.md
spec-bundle/quality/requirements.md
spec-bundle/schema/SPEC.schema.md
spec-bundle/skills/agent-feedback/SKILL.md
spec-bundle/skills/agents-md-improver/SKILL.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md
spec-bundle/skills/autonomous-issue-dispatch/SKILL.md
spec-bundle/skills/caveman/SKILL.md
spec-bundle/skills/code-review/SKILL.md
spec-bundle/skills/cross-repo-informational-channel/SKILL.md
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md
spec-bundle/skills/diagnosis/SKILL.md
spec-bundle/skills/fast-path/SKILL.md
spec-bundle/skills/implementation-execution/SKILL.md
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md
spec-bundle/skills/release-pr/SKILL.md
spec-bundle/skills/repo-orientation/SKILL.md
spec-bundle/skills/spec-authoring/SKILL.md
spec-bundle/skills/spec-driven-development/SKILL.md
spec-bundle/skills/spec-evidence-governance/SKILL.md
spec-bundle/skills/spec-review/SKILL.md
spec-bundle/skills/tdd/SKILL.md
spec-bundle/skills/verification/SKILL.md
spec-bundle/templates/IDEA.template.md
spec-bundle/templates/SPEC.contract.template.md
spec-bundle/templates/SPEC.decision.template.md
spec-bundle/templates/SPEC.fastpath.template.md
spec-bundle/templates/SPEC.task.template.md
spec-bundle/templates/TASK.template.md
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-manifest.sh | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# validate-manifest.sh — mechanical gate for spec-bundle/manifest.yaml.
     3	#
     4	# Authority: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
     5	#   §6.1 (manifest schema), §8 (formal schema), §9.1 (validation
     6	#   algorithm pseudocode).
     7	#
     8	# Checks:
     9	# 1. spec-bundle/manifest.yaml exists and parses.
    10	# 2. spec_version matches the schema version in this script
    11	#    (currently 2.0.0).
    12	# 3. conformance_profile is one of {core, extension, real-integration}.
    13	# 4. Every facet listed has its directory and primary file.
    14	# 5. Every directory under spec-bundle/ (except resource dirs) is
    15	#    listed in facets.
    16	# 6. intent.product_name matches the repo identifier.
    17	#
    18	# Exit 0 iff valid; non-zero with diagnostics to stderr.
    19	
    20	set -uo pipefail
    21	
    22	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    23	REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    24	BUNDLE_DIR="$REPO_ROOT/spec-bundle"
    25	MANIFEST="$BUNDLE_DIR/manifest.yaml"
    26	
    27	EXPECTED_SPEC_VERSION="2.1.0"
    28	EXPECTED_PRODUCT_NAME="agentic-ops-framework"
    29	VALID_PROFILES="core extension real-integration"
    30	
    31	# Directories under spec-bundle/ that are resources, not facets.
    32	RESOURCE_DIRS=("schema" "templates" "skills" "conformance")
    33	
    34	errors=()
    35	
    36	err() {
    37	    errors+=("$1")
    38	}
    39	
    40	if [ ! -f "$MANIFEST" ]; then
    41	    printf 'validate-manifest: FAIL — manifest not found at %s\n' "$MANIFEST" >&2
    42	    exit 1
    43	fi
    44	
    45	# Extract scalar fields via grep + sed (no yq dependency).
    46	get_field() {
    47	    local field="$1"
    48	    grep -E "^${field}:" "$MANIFEST" | head -1 | sed -E "s/^${field}:[[:space:]]*//;s/^\"//;s/\"$//"
    49	}
    50	
    51	actual_spec_version="$(get_field 'spec_version')"
    52	actual_conformance="$(get_field 'conformance_profile')"
    53	
    54	# 2. spec_version match.
    55	if [ "$actual_spec_version" != "$EXPECTED_SPEC_VERSION" ]; then
    56	    err "spec_version mismatch: expected $EXPECTED_SPEC_VERSION, got '$actual_spec_version'"
    57	fi
    58	
    59	# 3. conformance_profile valid.
    60	if ! printf '%s\n' $VALID_PROFILES | grep -qFx "$actual_conformance"; then
    61	    err "conformance_profile invalid: got '$actual_conformance'; expected one of {$VALID_PROFILES}"
    62	fi
    63	
    64	# 3b. REQUIRED top-level field presence (codex Round-3 + Round-4).
    65	# Per SPEC §8.1, the following are REQUIRED:
    66	# - v2.0 baseline: spec_version, bundle_version, conformance_profile,
    67	#   generated_on, generator (spec_version + conformance_profile
    68	#   already validated above).
    69	# - v2.1 additions: schema_uri, source_commit.
    70	# Field values MAY be empty string at authoring time per the
    71	# codex Round-2 honest-disclosure pattern; validator checks only
    72	# presence of the key, not non-emptiness. source_tag stays OPTIONAL.
    73	for required_key in bundle_version generated_on generator schema_uri source_commit; do
    74	    if ! grep -qE "^${required_key}:" "$MANIFEST"; then
    75	        err "REQUIRED top-level key missing: $required_key (per SPEC §8.1)"
    76	    fi
    77	done
    78	
    79	# 3c. REQUIRED intent block fields (codex Round-4 finding).
    80	# Per SPEC §8.2, intent MUST have product_name, product_purpose,
    81	# developer_authority, installer_authority. product_name already
    82	# validated above via actual_product_name check; here we verify
    83	# the other three keys are declared inside the intent block.
    84	for required_intent_key in product_purpose developer_authority installer_authority; do
    85	    if ! grep -qE "^[[:space:]]+${required_intent_key}:" "$MANIFEST"; then
    86	        err "REQUIRED intent key missing: $required_intent_key (per SPEC §8.2)"
    87	    fi
    88	done
    89	
    90	# 6. product_name match (search for product_name under intent).
    91	actual_product_name="$(grep -E '^[[:space:]]+product_name:' "$MANIFEST" | head -1 | sed -E 's/^[[:space:]]+product_name:[[:space:]]*//;s/^"//;s/"$//')"
    92	if [ "$actual_product_name" != "$EXPECTED_PRODUCT_NAME" ]; then
    93	    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
    94	fi
    95	
    96	# 4 + 5. Parse facets block; extract slugs.
    97	# Match lines indented two spaces under "facets:" that end with ":".
    98	declare -a facet_slugs=()
    99	in_facets=0
   100	in_facets_record=""
   101	while IFS= read -r line; do
   102	    if [[ "$line" =~ ^facets: ]]; then
   103	        in_facets=1
   104	        continue
   105	    fi
   106	    if [ $in_facets -eq 1 ]; then
   107	        # Top-level key (no indent) ends facets block.
   108	        if [[ "$line" =~ ^[a-z_-] ]]; then
   109	            in_facets=0
   110	            continue
   111	        fi
   112	        # Two-space-indented key with no further indent is a facet name.
   113	        if [[ "$line" =~ ^[[:space:]]{2}[a-z_-]+:[[:space:]]*$ ]]; then
   114	            slug="${line//[[:space:]]/}"
   115	            slug="${slug%:}"
   116	            facet_slugs+=("$slug")
   117	        fi
   118	    fi
   119	done < "$MANIFEST"
   120	
   121	if [ ${#facet_slugs[@]} -eq 0 ]; then
   122	    err "facets block empty or unparseable"
   123	fi
   124	
   125	# Build set of fs facet dirs.
   126	declare -a fs_dirs=()
   127	if [ -d "$BUNDLE_DIR" ]; then
   128	    while IFS= read -r dir; do
   129	        base="$(basename "$dir")"
   130	        # Skip resource dirs.
   131	        is_resource=0
   132	        for r in "${RESOURCE_DIRS[@]}"; do
   133	            if [ "$base" = "$r" ]; then
   134	                is_resource=1
   135	                break
   136	            fi
   137	        done
   138	        if [ $is_resource -eq 0 ]; then
   139	            fs_dirs+=("$base")
   140	        fi
   141	    done < <(find "$BUNDLE_DIR" -mindepth 1 -maxdepth 1 -type d | sort)
   142	fi
   143	
   144	# Compare facet slugs vs fs dirs.
   145	for slug in "${facet_slugs[@]}"; do
   146	    found=0
   147	    for d in "${fs_dirs[@]}"; do
   148	        [ "$d" = "$slug" ] && found=1 && break
   149	    done
   150	    if [ $found -eq 0 ]; then
   151	        err "facet '$slug' listed in manifest but no directory at spec-bundle/$slug/"
   152	    fi
   153	done
   154	
   155	for d in "${fs_dirs[@]}"; do
   156	    found=0
   157	    for slug in "${facet_slugs[@]}"; do
   158	        [ "$slug" = "$d" ] && found=1 && break
   159	    done
   160	    if [ $found -eq 0 ]; then
   161	        err "directory spec-bundle/$d/ exists but not listed in manifest facets"
   162	    fi
   163	done
   164	
   165	# Check each facet's primary file exists.
   166	# Parse primary + primary_index + media_type per facet per the v2.1
   167	# schema (codex Round-2 BLOCKER finding closed: previously the script
   168	# accepted directory primaries silently without verifying primary_index
   169	# or media-type-extension conventions; this branch now enforces the
   170	# v2.1 binding).
   171	current_facet=""
   172	declare -A facet_primary
   173	declare -A facet_primary_index
   174	declare -A facet_media_type
   175	while IFS= read -r line; do
   176	    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
   177	        current_facet="${BASH_REMATCH[1]}"
   178	    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   179	        primary="${BASH_REMATCH[1]}"
   180	        primary="${primary%\"}"
   181	        facet_primary["$current_facet"]="$primary"
   182	    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   183	        pi="${BASH_REMATCH[1]}"
   184	        pi="${pi%\"}"
   185	        facet_primary_index["$current_facet"]="$pi"
   186	    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   187	        mt="${BASH_REMATCH[1]}"
   188	        mt="${mt%\"}"
   189	        facet_media_type["$current_facet"]="$mt"
   190	    elif [[ "$line" =~ ^[a-z_-] ]]; then
   191	        current_facet=""
   192	    fi
   193	done < "$MANIFEST"
   194	
   195	# Media-type → file-extension expectations (v2.1 schema §8.3).
   196	media_type_extension() {
   197	    case "$1" in
   198	        text/markdown) printf '.md' ;;
   199	        text/x.gherkin) printf '.feature' ;;
   200	        application/vnd.framework.conformance-suite) printf '' ;;  # any
   201	        *) printf '' ;;
   202	    esac
   203	}
   204	
   205	# Iterate every facet from the manifest, not just those that parsed a
   206	# primary value. This closes the codex Round-3 BLOCKER where facets
   207	# without a parsed primary silently escaped the check branch.
   208	for facet in "${facet_slugs[@]}"; do
   209	    primary="${facet_primary[$facet]:-}"
   210	    if [ -z "$primary" ]; then
   211	        err "facet '$facet' has no primary field in the manifest (per SPEC §8.3 primary is REQUIRED for every facet)"
   212	        continue
   213	    fi
   214	    if [[ "$primary" == */ ]]; then
   215	        # Directory primary — v2.1 requires primary_index.
   216	        if [ ! -d "$BUNDLE_DIR/$primary" ]; then
   217	            err "facet '$facet' primary directory missing: $primary"
   218	            continue
   219	        fi
   220	        pi="${facet_primary_index[$facet]:-}"
   221	        if [ -z "$pi" ]; then
   222	            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
   223	            continue
   224	        fi
   225	        # primary_index MUST be INSIDE the primary directory
   226	        # (codex Round-3 + Round-4: the string-prefix check was
   227	        # fooled by path traversal like "behavior/features/../../
   228	        # architecture/CONTEXT.md" which prefix-matched but
   229	        # resolved outside the primary directory. Semantic
   230	        # containment via canonicalised paths is the fix.)
   231	        if [[ "$pi" != "$primary"* ]]; then
   232	            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment (lexical prefix check)"
   233	            continue
   234	        fi
   235	        # Semantic-containment check: canonicalise both paths and
   236	        # verify the canonicalised primary_index sits inside the
   237	        # canonicalised primary directory. Defeats ../ traversal.
   238	        canon_primary="$(cd "$BUNDLE_DIR/$primary" 2>/dev/null && pwd)"
   239	        canon_pi_dir="$(cd "$BUNDLE_DIR/$(dirname "$pi")" 2>/dev/null && pwd)"
   240	        if [ -z "$canon_primary" ] || [ -z "$canon_pi_dir" ]; then
   241	            err "facet '$facet' primary or primary_index cannot be canonicalised (primary=$primary, primary_index=$pi)"
   242	            continue
   243	        fi
   244	        if [[ "$canon_pi_dir" != "$canon_primary"* ]]; then
   245	            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
   246	            continue
   247	        fi
   248	        if [ ! -f "$BUNDLE_DIR/$pi" ]; then
   249	            err "facet '$facet' primary_index file missing: $pi"
   250	        fi
   251	        # Media-type extension conformance (v2.1 §8.3).
   252	        mt="${facet_media_type[$facet]:-}"
   253	        ext="$(media_type_extension "$mt")"
   254	        if [ -n "$ext" ]; then
   255	            n_matching=$(find "$BUNDLE_DIR/$primary" -maxdepth 1 -name "*$ext" -type f 2>/dev/null | wc -l)
   256	            if [ "$n_matching" -eq 0 ]; then
   257	                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
   258	            fi
   259	        fi
   260	    else
   261	        # File primary.
   262	        if [ ! -f "$BUNDLE_DIR/$primary" ]; then
   263	            err "facet '$facet' primary file missing: $primary"
   264	        fi
   265	    fi
   266	done
   267	
   268	if [ ${#errors[@]} -gt 0 ]; then
   269	    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
   270	    for e in "${errors[@]}"; do
   271	        printf '  - %s\n' "$e" >&2
   272	    done
   273	    exit 1
   274	fi
   275	
   276	printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
   277	    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
   278	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "file://(schema|templates|skills|workflow|workpads)(/|$)|`/(schema|templates|skills|workflow|workpads)/|`(schema|templates|skills|workflow|workpads)/|'"\\b(schema|templates|skills|workflow|workpads)/\" spec-bundle specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/home/linuxbrew/.linuxbrew/bin/bash: command substitution: line 1: syntax error near unexpected token `schema'
/home/linuxbrew/.linuxbrew/bin/bash: command substitution: line 1: `/(schema|templates|skills|workflow|workpads)/|'
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:96:- Removing v1.1's `skills/` content (skills are a
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:98:  `spec-bundle/skills/` per the new layout).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:136:│   ├── skills/                        # the framework's own skills (was /skills/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:137:│   ├── templates/                     # SPEC templates (was /templates/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:138:│   ├── schema/                        # SPEC.schema.md (was /schema/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:145:├── workflow/                          # UNIVERSAL.md (unchanged)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:146:├── workpads/                          # workpad templates (unchanged)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:174:- `file://schema/SPEC.schema.md` — citation grammar,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:246:(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:330:    path: "schema/SPEC.schema.md"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:333:    path: "templates/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:336:    path: "skills/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:518:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:519:| `templates/` | `spec-bundle/templates/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:520:| `skills/` | `spec-bundle/skills/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:526:| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:527:| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:568:who fetched v1.1 by file paths under `schema/`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:569:`templates/`, `skills/`, `workflow/`, `workpads/` will need
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:844:- [ ] Q1: Should `spec-bundle/skills/` (relocated from
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:845:      `skills/`) require any content sanitization
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:883:  symlinks from old paths (`schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:884:  `spec-bundle/schema/SPEC.schema.md`) to ease
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:948:- `schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:949:  `spec-bundle/schema/SPEC.schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:950:- `templates/*.template.md` (6 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:951:  `spec-bundle/templates/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:952:- `skills/<name>/SKILL.md` (20 skills) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:953:  `spec-bundle/skills/<name>/SKILL.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:954:- `skills/<name>/references/*.md` (4 references) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:955:  `spec-bundle/skills/<name>/references/*.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:956:- `workflow/UNIVERSAL.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:958:- `workpads/*.template.md` (3 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:959:  `spec-bundle/templates/workpads/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:968:  `spec-bundle/skills/` (was `skills/`)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:972:- `workflow/` (after UNIVERSAL.md moved)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:982:  `workpads spec-bundle/templates/workpads`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:983:- `cmd://mv workflow/UNIVERSAL.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:997:  exit 0 (clean; 20 skills under spec-bundle/skills/).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1036:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1037:  `file://templates/...`, `file://skills/...` paths
spec-bundle/manifest.yaml:92:    path: "schema/SPEC.schema.md"
spec-bundle/manifest.yaml:95:    path: "templates/"
spec-bundle/manifest.yaml:98:    path: "skills/"
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:85:`spec-bundle/skills/repo-orientation/SKILL.md`). Each entry tells you
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/operations/workflow-universal.md:10:   EVIDENCE. See `spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/operations/workflow-universal.md:17:   (`spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/operations/workflow-universal.md:25:   `spec-bundle/skills/agent-feedback/SKILL.md`.
spec-bundle/operations/workflow-universal.md:35:   `spec-bundle/schema/SPEC.schema.md`.
spec-bundle/operations/workflow-universal.md:39:   `spec-bundle/templates/workpads/SESSION_JOURNAL.template.md`.
spec-bundle/operations/workflow-universal.md:42:   `spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/operations/workflow-universal.md:53:  `spec-bundle/skills/fast-path/SKILL.md` for thresholds.
spec-bundle/operations/workflow-universal.md:57:  closes. See `spec-bundle/skills/spec-driven-development/SKILL.md`.
spec-bundle/operations/workflow-universal.md:134:`spec-bundle/skills/code-review/SKILL.md` "Hard Rules" for the
spec-bundle/operations/workflow-universal.md:146:   `spec-bundle/skills/approved-spec-decomposition/SKILL.md`).
spec-bundle/operations/workflow-universal.md:186:Available in `spec-bundle/skills/`:
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:66:test -f .agents/templates/AGENT_INBOX.template.md && \
spec-bundle/templates/TASK.template.md:50:  `file://spec-bundle/skills/approved-spec-decomposition/SKILL.md`
spec-bundle/templates/TASK.template.md:70:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/templates/IDEA.template.md:13:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.task.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/skills/spec-authoring/SKILL.md:67:- `spec-bundle/templates/IDEA.template.md` — the IDEA artefact.
spec-bundle/skills/spec-authoring/SKILL.md:68:- `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped, verifiable
spec-bundle/skills/spec-authoring/SKILL.md:70:- `spec-bundle/templates/SPEC.contract.template.md` — stateful, multi-component,
spec-bundle/skills/spec-authoring/SKILL.md:72:- `spec-bundle/templates/SPEC.decision.template.md` — binding choice between
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `spec-bundle/schema/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `spec-bundle/skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:153:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) MAY use a
spec-bundle/skills/spec-authoring/SKILL.md:191:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:203:`file://spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly; pervasive
spec-bundle/skills/spec-authoring/SKILL.md:210:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and
spec-bundle/skills/spec-authoring/SKILL.md:239:  `spec-bundle/schema/SPEC.schema.md` first.
spec-bundle/templates/SPEC.fastpath.template.md:17:`file://spec-bundle/skills/fast-path/SKILL.md` "Thresholds" are met. If
spec-bundle/templates/SPEC.fastpath.template.md:23:(`file://spec-bundle/skills/spec-driven-development/SKILL.md`
spec-bundle/skills/agent-feedback/SKILL.md:14:`file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:43:   from `file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:67:    `file://spec-bundle/skills/fleet-enforce/SKILL.md`.
spec-bundle/skills/agent-feedback/SKILL.md:86:  `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/customization/contract.md:19:  (`file://../templates/`).
spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
spec-bundle/customization/contract.md:50:adopts in their repo's `.agents/skills/` (or equivalent).
spec-bundle/customization/contract.md:111:(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
spec-bundle/templates/SPEC.decision.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.contract.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.contract.template.md:54:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and the 2026-01-15
spec-bundle/templates/SPEC.contract.template.md:253:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) and the validation
spec-bundle/skills/spec-authoring/references/reference-architecture.md:26:   `owner://` prefix per `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/references/reference-architecture.md:61:4. **`workpads/<tool>.<ext>.template`** project-level
spec-bundle/skills/agents-md-improver/SKILL.md:42:  `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) (or
spec-bundle/skills/agents-md-improver/SKILL.md:43:  `.workpads/WORKFLOW.body.md` in a child repo).
spec-bundle/skills/spec-authoring/references/studio-principles.md:35:`file://spec-bundle/skills/spec-review/SKILL.md` under "Decision spec
spec-bundle/templates/workpads/AGENT_INBOX.template.md:18:`file://spec-bundle/skills/cross-repo-informational-channel/SKILL.md`;
spec-bundle/templates/workpads/AGENT_INBOX.template.md:19:`file://spec-bundle/skills/cross-repo-informational-channel/SKILL.md`.
spec-bundle/templates/workpads/AGENT_INBOX.template.md:25:`file://spec-bundle/skills/repo-orientation/SKILL.md` Step 3). Each
spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:  (`file://spec-bundle/schema/SPEC.schema.md` §2).
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:16:`file://spec-bundle/skills/repo-orientation/SKILL.md` Step 2.
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:4. For each slice, copy `file://spec-bundle/templates/TASK.template.md` to
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/fast-path/SKILL.md:16:`file://spec-bundle/templates/SPEC.fastpath.template.md`.
spec-bundle/skills/fast-path/SKILL.md:48:   `file://spec-bundle/templates/SPEC.fastpath.template.md`. Status:
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:8:`file://spec-bundle/skills/agent-feedback/SKILL.md`;
spec-bundle/architecture/solution-strategy.md:18:   `../schema/SPEC.schema.md` §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:9:    And the schema at spec-bundle/schema/SPEC.schema.md
spec-bundle/skills/repo-orientation/SKILL.md:26:   `.workpads/SESSION_JOURNAL.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:29:   `.workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:33:   `.workpads/AGENT_INBOX.template.md`. See
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:61:   discipline applies (see `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific)).
spec-bundle/skills/spec-driven-development/SKILL.md:75:    posts justified pushback. See `file://spec-bundle/skills/code-review/SKILL.md`
spec-bundle/skills/spec-driven-development/SKILL.md:76:    and `file://spec-bundle/skills/spec-review/SKILL.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:95:`file://spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md`
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:105:- `task` → `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped,
spec-bundle/skills/spec-driven-development/SKILL.md:107:- `contract` → `spec-bundle/templates/SPEC.contract.template.md` — specifies
spec-bundle/skills/spec-driven-development/SKILL.md:111:- `decision` → `spec-bundle/templates/SPEC.decision.template.md` — chooses
spec-bundle/skills/spec-driven-development/SKILL.md:116:`spec-bundle/schema/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:117:`spec-bundle/templates/IDEA.template.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `spec-bundle/schema/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:179:  `.claude/skills/<name>/SKILL.md`, the registry row in
spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
spec-bundle/architecture/CONTEXT.md:29:- A skill catalog (`file://../skills/`) covering the
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:4:`file://spec-bundle/skills/approved-spec-decomposition/SKILL.md` per
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:17:`file://spec-bundle/skills/approved-spec-decomposition/SKILL.md`;
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:   `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) "PR feedback
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:44:`file://spec-bundle/skills/code-review/SKILL.md` and the
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:46:`file://spec-bundle/skills/spec-review/SKILL.md` are the executors
spec-bundle/deployment/install.md:26:cp -r spec-bundle/skills     "$TARGET/.agents/skills/"
spec-bundle/deployment/install.md:32:#    file://../skills/agents-md-improver/SKILL.md
spec-bundle/deployment/install.md:45:(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
spec-bundle/deployment/install.md:46:`file://../skills/cross-repo-informational-channel/SKILL.md`)
spec-bundle/skills/spec-review/SKILL.md:10:`file://spec-bundle/schema/SPEC.schema.md` §5.
spec-bundle/skills/spec-review/SKILL.md:261:  `file://spec-bundle/skills/spec-review/references/per-type-gates.md`.
spec-bundle/skills/spec-review/SKILL.md:262:- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
spec-bundle/skills/spec-review/SKILL.md:269:- Authoring side: `file://spec-bundle/skills/spec-authoring/SKILL.md`.
spec-bundle/skills/spec-review/SKILL.md:271:  `file://spec-bundle/skills/spec-driven-development/SKILL.md`.
spec-bundle/schema/SPEC.schema.md:85:  - test -f templates/SPEC.task.template.md
spec-bundle/schema/SPEC.schema.md:191:justified pushback) per `spec-bundle/skills/code-review/SKILL.md` and the
spec-bundle/schema/SPEC.schema.md:365:- Templates: `spec-bundle/templates/SPEC.task.template.md`,
spec-bundle/schema/SPEC.schema.md:366:  `spec-bundle/templates/SPEC.contract.template.md`,
spec-bundle/schema/SPEC.schema.md:367:  `spec-bundle/templates/SPEC.decision.template.md`,
spec-bundle/schema/SPEC.schema.md:368:  `spec-bundle/templates/SPEC.fastpath.template.md`,
spec-bundle/schema/SPEC.schema.md:369:  `templates/IDEA.template.md`,
spec-bundle/schema/SPEC.schema.md:370:  `templates/TASK.template.md`.
spec-bundle/schema/SPEC.schema.md:373:- Procedure-only skills: `spec-bundle/skills/verification/SKILL.md`,
spec-bundle/schema/SPEC.schema.md:374:  `spec-bundle/skills/code-review/SKILL.md`, `spec-bundle/skills/release-pr/SKILL.md`,
spec-bundle/schema/SPEC.schema.md:375:  `spec-bundle/skills/spec-evidence-governance/SKILL.md`,
spec-bundle/schema/SPEC.schema.md:376:  `spec-bundle/skills/diagnosis/SKILL.md`, `spec-bundle/skills/tdd/SKILL.md`.
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:4:`file://spec-bundle/skills/spec-driven-development/SKILL.md` per the
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:4:`file://spec-bundle/skills/spec-driven-development/SKILL.md` per the
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:8:Authority: `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:9:exception (owner-only)"; `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:22:`file://spec-bundle/skills/spec-driven-development/SKILL.md`
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:31:work (see `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:66:  `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-review/references/per-type-gates.md:91:`file://spec-bundle/skills/spec-authoring/SKILL.md`), apply the

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '580,650p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   580	
   581	## 8. Schema Specification
   582	
   583	### 8.1 Manifest schema (formal — v2.1.0)
   584	
   585	The manifest is YAML. Top-level keys (REQUIRED unless
   586	noted). Fields marked **(v2.1)** were added per the codex
   587	remediation amendment at
   588	`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   589	§7.E (finding 3.5) — manifest spec_version bumped from
   590	2.0.0 to 2.1.0.
   591	
   592	| Field | Type | Required | Notes |
   593	|---|---|---|---|
   594	| `spec_version` | string (semver) | yes | This manifest schema's version |
   595	| `bundle_version` | string (semver) | yes | This bundle release |
   596	| `conformance_profile` | enum | yes | `core` \| `extension` \| `real-integration` |
   597	| `generated_on` | string (ISO date) | yes | YYYY-MM-DD |
   598	| `generator` | string | yes | Source repo identifier |
   599	| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
   600	| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
   601	| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
   602	| `intent` | object | yes | See §8.2 |
   603	| `facets` | object | yes | See §8.3 |
   604	| `resources` | object | OPTIONAL | See §8.4 |
   605	| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
   606	| `signature` | object | OPTIONAL | See §8.5 |
   607	
   608	### 8.2 `intent` block
   609	
   610	| Field | Type | Required |
   611	|---|---|---|
   612	| `product_name` | string | yes |
   613	| `product_purpose` | string (multi-line) | yes |
   614	| `developer_authority` | list[role+identity] | yes |
   615	| `installer_authority` | list[role+capabilities_floor] | yes |
   616	
   617	### 8.3 `facets` block
   618	
   619	A map from facet name to facet record. Recognized facet
   620	names: `architecture`, `deployment`, `behavior`,
   621	`customization`, `decisions`, `quality`, `operations`,
   622	`non-goals`. Each facet record:
   623	
   624	| Field | Type | Required |
   625	|---|---|---|
   626	| `path` | string (relative) | yes |
   627	| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
   628	| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
   629	| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
   630	| `digest` | string | RECOMMENDED **(v2.1)** | `algorithm:hex` form per OCI Descriptor convention; lets consumers verify by hash |
   631	| `size` | integer | OPTIONAL **(v2.1)** | Size in bytes |
   632	| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
   633	
   634	Additional facets MAY appear; `validate-manifest.sh`
   635	allows extensions but warns.
   636	
   637	**v2.1 facet.primary directory rule (codex remediation
   638	finding 3.6)**: when `primary` is a directory path, the
   639	validator enforces that the directory exists AND that
   640	the file named by `primary_index` exists inside it AND
   641	(if `media_type` is set) at least one file in the
   642	directory matches the media type's file extension
   643	convention (`text/x.gherkin` → `*.feature`,
   644	`text/markdown` → `*.md`, etc.). The pre-v2.1 silent-
   645	allow on directory primaries is replaced with this
   646	explicit branch.
   647	
   648	### 8.4 `resources` block
   649	
   650	| Field | Type |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/manifest.yaml | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	spec_version: "2.1.0"
     2	bundle_version: "2.0.0"
     3	conformance_profile: "core"
     4	generated_on: "2026-05-19"
     5	generator: "agentic-ops-framework"
     6	# schema_uri pins the schema to a stable form. Populated by release
     7	# tooling with the commit SHA of the SPEC at tag time. Between tags
     8	# (current state) the value points at main as an honest placeholder
     9	# with the explicit "this URL is mutable until release tooling pins"
    10	# convention codified in the v2.0 repack SPEC §6.1 + §8.1.
    11	# Codex Round-2 flagged the unpinned form as untrustworthy; the
    12	# correct remediation is release-tooling integration, not a fake
    13	# pin at authoring time.
    14	schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
    15	
    16	# source_commit populated by release tooling at tag time. Empty
    17	# between tags (current state). Release tooling MUST refuse to
    18	# cut a tag with empty source_commit; in-development manifests
    19	# acknowledge this explicitly by leaving the field empty rather
    20	# than fabricating a value.
    21	source_commit: ""
    22	
    23	# source_tag empty between tags. The v2.0.0 tag predates the v2.1
    24	# schema bump and has its own (older) manifest content; pointing
    25	# at v2.0.0 from a v2.1-schema manifest would mislead. The next
    26	# tagged release will be v2.1 with full v2.1 schema population
    27	# including source_commit + source_tag at tag time.
    28	source_tag: ""
    29	
    30	intent:
    31	  product_name: "agentic-ops-framework"
    32	  product_purpose: |
    33	    A framework for operating engineering work with coding
    34	    agents under spec-first discipline: typed IDEA → SPEC
    35	    artefacts with citation grammar, RFC 2119 scoping rules,
    36	    a per-type quality gate, owner-only authority transitions,
    37	    and a hermetic hook test harness. The framework eats its
    38	    own dog food and is offered as honest experience from one
    39	    studio's working internal practice.
    40	  developer_authority:
    41	    - role: "framework maintainer"
    42	      identity: "HasNoBeef <github:HasNoBeef>"
    43	  installer_authority:
    44	    - role: "user-with-agent"
    45	      capabilities_floor: "any-reasonably-capable-coding-agent"
    46	
    47	facets:
    48	  architecture:
    49	    path: "architecture/"
    50	    primary: "architecture/CONTEXT.md"
    51	    media_type: "text/markdown"
    52	    status: "complete"
    53	  deployment:
    54	    path: "deployment/"
    55	    primary: "deployment/install.md"
    56	    media_type: "text/markdown"
    57	    status: "complete"
    58	  behavior:
    59	    path: "behavior/"
    60	    primary: "behavior/features/"
    61	    primary_index: "behavior/features/lint-citation-grammar.feature"
    62	    media_type: "text/x.gherkin"
    63	    status: "partial"            # 2 of N features authored at v2.0
    64	  customization:
    65	    path: "customization/"
    66	    primary: "customization/contract.md"
    67	    media_type: "text/markdown"
    68	    status: "complete"
    69	  decisions:
    70	    path: "decisions/"
    71	    primary: "decisions/INDEX.md"
    72	    media_type: "text/markdown"
    73	    status: "partial"            # INDEX only; per-decision ADRs reserved for v2.x
    74	  quality:
    75	    path: "quality/"
    76	    primary: "quality/requirements.md"
    77	    media_type: "text/markdown"
    78	    status: "complete"
    79	  operations:
    80	    path: "operations/"
    81	    primary: "operations/failures.md"
    82	    media_type: "text/markdown"
    83	    status: "complete"
    84	  non-goals:
    85	    path: "non-goals/"
    86	    primary: "non-goals/INDEX.md"
    87	    media_type: "text/markdown"
    88	    status: "complete"
    89	
    90	resources:
    91	  schema:
    92	    path: "schema/SPEC.schema.md"
    93	    media_type: "text/markdown"
    94	  templates:
    95	    path: "templates/"
    96	    media_type: "text/markdown"
    97	  skills:
    98	    path: "skills/"
    99	    media_type: "text/markdown"
   100	  conformance:
   101	    path: "conformance/"
   102	    media_type: "application/vnd.framework.conformance-suite"
   103	    status: "reserved"           # conformance suite reserved for v2.x
   104	
   105	provenance:
   106	  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
   107	  sbom_ref: ""                   # populated by release tooling
   108	  slsa_level: ""                 # reserved; SLSA attestation lands when toolchain wired
   109	
   110	signature:
   111	  status: "unsigned"
   112	  # When signed: cosign signature + Rekor inclusion proof per
   113	  # https://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/sigstore-cosign.md §3

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f schema/SPEC.schema.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/schema/SPEC.schema.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '160,180p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   160	
   161	- `decision-authority://owner:2026-05-18` — owner
   162	  directive ("Do what is the rolls royce" + "base this
   163	  all in deep research, not make up bullshit"); binds
   164	  the repack as the methodology's worked-example
   165	  dogfood.
   166	- Parent Decision SPEC
   167	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   168	  §7 — names this slice; §9 Locks unlock the repack
   169	  upon Decision approval.
   170	- Sibling Contract SPEC
   171	  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   172	  (status: verified) — the primary-source corpus this
   173	  repack draws methodology primitives from.
   174	- `file://schema/SPEC.schema.md` — citation grammar,
   175	  RFC 2119 scoping, front-matter schema.
   176	
   177	Active primary-source citations (corpus-grounded):
   178	
   179	- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   180	  §3 — operating-model-as-SPEC; 18-section pattern.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'file://(schema|templates|skills|workflow|workpads)(/|"'$)|`(schema|templates|skills|workflow|workpads)/|'"\\b(schema|templates|skills|workflow|workpads)/' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:96:- Removing v1.1's `skills/` content (skills are a
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:98:  `spec-bundle/skills/` per the new layout).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:136:│   ├── skills/                        # the framework's own skills (was /skills/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:137:│   ├── templates/                     # SPEC templates (was /templates/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:138:│   ├── schema/                        # SPEC.schema.md (was /schema/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:145:├── workflow/                          # UNIVERSAL.md (unchanged)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:146:├── workpads/                          # workpad templates (unchanged)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:174:- `file://schema/SPEC.schema.md` — citation grammar,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:246:(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:330:    path: "schema/SPEC.schema.md"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:333:    path: "templates/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:336:    path: "skills/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:518:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:519:| `templates/` | `spec-bundle/templates/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:520:| `skills/` | `spec-bundle/skills/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:526:| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:527:| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:568:who fetched v1.1 by file paths under `schema/`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:569:`templates/`, `skills/`, `workflow/`, `workpads/` will need
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:844:- [ ] Q1: Should `spec-bundle/skills/` (relocated from
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:845:      `skills/`) require any content sanitization
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:883:  symlinks from old paths (`schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:884:  `spec-bundle/schema/SPEC.schema.md`) to ease
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:948:- `schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:949:  `spec-bundle/schema/SPEC.schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:950:- `templates/*.template.md` (6 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:951:  `spec-bundle/templates/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:952:- `skills/<name>/SKILL.md` (20 skills) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:953:  `spec-bundle/skills/<name>/SKILL.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:954:- `skills/<name>/references/*.md` (4 references) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:955:  `spec-bundle/skills/<name>/references/*.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:956:- `workflow/UNIVERSAL.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:958:- `workpads/*.template.md` (3 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:959:  `spec-bundle/templates/workpads/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:968:  `spec-bundle/skills/` (was `skills/`)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:972:- `workflow/` (after UNIVERSAL.md moved)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:982:  `workpads spec-bundle/templates/workpads`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:983:- `cmd://mv workflow/UNIVERSAL.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:997:  exit 0 (clean; 20 skills under spec-bundle/skills/).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1036:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1037:  `file://templates/...`, `file://skills/...` paths
spec-bundle/manifest.yaml:92:    path: "schema/SPEC.schema.md"
spec-bundle/manifest.yaml:95:    path: "templates/"
spec-bundle/manifest.yaml:98:    path: "skills/"
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:85:`spec-bundle/skills/repo-orientation/SKILL.md`). Each entry tells you
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/operations/workflow-universal.md:10:   EVIDENCE. See `spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/operations/workflow-universal.md:17:   (`spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/operations/workflow-universal.md:25:   `spec-bundle/skills/agent-feedback/SKILL.md`.
spec-bundle/operations/workflow-universal.md:35:   `spec-bundle/schema/SPEC.schema.md`.
spec-bundle/operations/workflow-universal.md:39:   `spec-bundle/templates/workpads/SESSION_JOURNAL.template.md`.
spec-bundle/operations/workflow-universal.md:42:   `spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/operations/workflow-universal.md:53:  `spec-bundle/skills/fast-path/SKILL.md` for thresholds.
spec-bundle/operations/workflow-universal.md:57:  closes. See `spec-bundle/skills/spec-driven-development/SKILL.md`.
spec-bundle/operations/workflow-universal.md:134:`spec-bundle/skills/code-review/SKILL.md` "Hard Rules" for the
spec-bundle/operations/workflow-universal.md:146:   `spec-bundle/skills/approved-spec-decomposition/SKILL.md`).
spec-bundle/operations/workflow-universal.md:186:Available in `spec-bundle/skills/`:
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:66:test -f .agents/templates/AGENT_INBOX.template.md && \
spec-bundle/customization/contract.md:19:  (`file://../templates/`).
spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
spec-bundle/customization/contract.md:50:adopts in their repo's `.agents/skills/` (or equivalent).
spec-bundle/customization/contract.md:111:(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
spec-bundle/skills/fast-path/SKILL.md:16:`file://spec-bundle/templates/SPEC.fastpath.template.md`.
spec-bundle/skills/fast-path/SKILL.md:48:   `file://spec-bundle/templates/SPEC.fastpath.template.md`. Status:
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:4. For each slice, copy `file://spec-bundle/templates/TASK.template.md` to
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/agent-feedback/SKILL.md:14:`file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:43:   from `file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:67:    `file://spec-bundle/skills/fleet-enforce/SKILL.md`.
spec-bundle/skills/agent-feedback/SKILL.md:86:  `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/templates/TASK.template.md:50:  `file://spec-bundle/skills/approved-spec-decomposition/SKILL.md`
spec-bundle/templates/TASK.template.md:70:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:9:    And the schema at spec-bundle/schema/SPEC.schema.md
spec-bundle/templates/IDEA.template.md:13:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:4:`file://spec-bundle/skills/approved-spec-decomposition/SKILL.md` per
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:17:`file://spec-bundle/skills/approved-spec-decomposition/SKILL.md`;
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:   `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) "PR feedback
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:44:`file://spec-bundle/skills/code-review/SKILL.md` and the
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:46:`file://spec-bundle/skills/spec-review/SKILL.md` are the executors
spec-bundle/templates/SPEC.fastpath.template.md:17:`file://spec-bundle/skills/fast-path/SKILL.md` "Thresholds" are met. If
spec-bundle/templates/SPEC.fastpath.template.md:23:(`file://spec-bundle/skills/spec-driven-development/SKILL.md`
spec-bundle/skills/agents-md-improver/SKILL.md:42:  `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) (or
spec-bundle/skills/agents-md-improver/SKILL.md:43:  `.workpads/WORKFLOW.body.md` in a child repo).
spec-bundle/skills/spec-review/SKILL.md:10:`file://spec-bundle/schema/SPEC.schema.md` §5.
spec-bundle/skills/spec-review/SKILL.md:261:  `file://spec-bundle/skills/spec-review/references/per-type-gates.md`.
spec-bundle/skills/spec-review/SKILL.md:262:- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
spec-bundle/skills/spec-review/SKILL.md:269:- Authoring side: `file://spec-bundle/skills/spec-authoring/SKILL.md`.
spec-bundle/skills/spec-review/SKILL.md:271:  `file://spec-bundle/skills/spec-driven-development/SKILL.md`.
spec-bundle/templates/SPEC.decision.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/deployment/install.md:26:cp -r spec-bundle/skills     "$TARGET/.agents/skills/"
spec-bundle/deployment/install.md:32:#    file://../skills/agents-md-improver/SKILL.md
spec-bundle/deployment/install.md:45:(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
spec-bundle/deployment/install.md:46:`file://../skills/cross-repo-informational-channel/SKILL.md`)
spec-bundle/templates/SPEC.contract.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.contract.template.md:54:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and the 2026-01-15
spec-bundle/templates/SPEC.contract.template.md:253:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) and the validation
spec-bundle/skills/spec-review/references/per-type-gates.md:91:`file://spec-bundle/skills/spec-authoring/SKILL.md`), apply the
spec-bundle/templates/workpads/AGENT_INBOX.template.md:18:`file://spec-bundle/skills/cross-repo-informational-channel/SKILL.md`;
spec-bundle/templates/workpads/AGENT_INBOX.template.md:19:`file://spec-bundle/skills/cross-repo-informational-channel/SKILL.md`.
spec-bundle/templates/workpads/AGENT_INBOX.template.md:25:`file://spec-bundle/skills/repo-orientation/SKILL.md` Step 3). Each
spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:  (`file://spec-bundle/schema/SPEC.schema.md` §2).
spec-bundle/skills/spec-driven-development/SKILL.md:61:   discipline applies (see `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific)).
spec-bundle/skills/spec-driven-development/SKILL.md:75:    posts justified pushback. See `file://spec-bundle/skills/code-review/SKILL.md`
spec-bundle/skills/spec-driven-development/SKILL.md:76:    and `file://spec-bundle/skills/spec-review/SKILL.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:95:`file://spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md`
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:105:- `task` → `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped,
spec-bundle/skills/spec-driven-development/SKILL.md:107:- `contract` → `spec-bundle/templates/SPEC.contract.template.md` — specifies
spec-bundle/skills/spec-driven-development/SKILL.md:111:- `decision` → `spec-bundle/templates/SPEC.decision.template.md` — chooses
spec-bundle/skills/spec-driven-development/SKILL.md:116:`spec-bundle/schema/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:117:`spec-bundle/templates/IDEA.template.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `spec-bundle/schema/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:179:  `.claude/skills/<name>/SKILL.md`, the registry row in
spec-bundle/architecture/solution-strategy.md:18:   `../schema/SPEC.schema.md` §2.
spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
spec-bundle/architecture/CONTEXT.md:29:- A skill catalog (`file://../skills/`) covering the
spec-bundle/templates/SPEC.task.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:8:`file://spec-bundle/skills/agent-feedback/SKILL.md`;
spec-bundle/skills/repo-orientation/SKILL.md:26:   `.workpads/SESSION_JOURNAL.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:29:   `.workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:33:   `.workpads/AGENT_INBOX.template.md`. See
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:16:`file://spec-bundle/skills/repo-orientation/SKILL.md` Step 2.
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:67:- `spec-bundle/templates/IDEA.template.md` — the IDEA artefact.
spec-bundle/skills/spec-authoring/SKILL.md:68:- `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped, verifiable
spec-bundle/skills/spec-authoring/SKILL.md:70:- `spec-bundle/templates/SPEC.contract.template.md` — stateful, multi-component,
spec-bundle/skills/spec-authoring/SKILL.md:72:- `spec-bundle/templates/SPEC.decision.template.md` — binding choice between
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `spec-bundle/schema/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `spec-bundle/skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:153:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) MAY use a
spec-bundle/skills/spec-authoring/SKILL.md:191:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:203:`file://spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly; pervasive
spec-bundle/skills/spec-authoring/SKILL.md:210:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and
spec-bundle/skills/spec-authoring/SKILL.md:239:  `spec-bundle/schema/SPEC.schema.md` first.
spec-bundle/schema/SPEC.schema.md:85:  - test -f templates/SPEC.task.template.md
spec-bundle/schema/SPEC.schema.md:191:justified pushback) per `spec-bundle/skills/code-review/SKILL.md` and the
spec-bundle/schema/SPEC.schema.md:365:- Templates: `spec-bundle/templates/SPEC.task.template.md`,
spec-bundle/schema/SPEC.schema.md:366:  `spec-bundle/templates/SPEC.contract.template.md`,
spec-bundle/schema/SPEC.schema.md:367:  `spec-bundle/templates/SPEC.decision.template.md`,
spec-bundle/schema/SPEC.schema.md:368:  `spec-bundle/templates/SPEC.fastpath.template.md`,
spec-bundle/schema/SPEC.schema.md:369:  `templates/IDEA.template.md`,
spec-bundle/schema/SPEC.schema.md:370:  `templates/TASK.template.md`.
spec-bundle/schema/SPEC.schema.md:373:- Procedure-only skills: `spec-bundle/skills/verification/SKILL.md`,
spec-bundle/schema/SPEC.schema.md:374:  `spec-bundle/skills/code-review/SKILL.md`, `spec-bundle/skills/release-pr/SKILL.md`,
spec-bundle/schema/SPEC.schema.md:375:  `spec-bundle/skills/spec-evidence-governance/SKILL.md`,
spec-bundle/schema/SPEC.schema.md:376:  `spec-bundle/skills/diagnosis/SKILL.md`, `spec-bundle/skills/tdd/SKILL.md`.
spec-bundle/skills/spec-authoring/references/studio-principles.md:35:`file://spec-bundle/skills/spec-review/SKILL.md` under "Decision spec
spec-bundle/skills/spec-authoring/references/reference-architecture.md:26:   `owner://` prefix per `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/references/reference-architecture.md:61:4. **`workpads/<tool>.<ext>.template`** project-level
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:4:`file://spec-bundle/skills/spec-driven-development/SKILL.md` per the
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:4:`file://spec-bundle/skills/spec-driven-development/SKILL.md` per the
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:8:Authority: `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:9:exception (owner-only)"; `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:22:`file://spec-bundle/skills/spec-driven-development/SKILL.md`
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:31:work (see `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:66:  `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/schema/SPEC.schema.md | sed -n '70,95p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    70	Example (Contract SPEC):
    71	
    72	```yaml
    73	---
    74	id: 2026-01-15-example-procedure-v1
    75	status: approved
    76	type: contract
    77	owner: owner-A
    78	repo: your-policy-repo
    79	branch_policy: main-direct
    80	risk: medium
    81	requires_network: false
    82	requires_secrets: []
    83	ideated_in: specs/2026-01-15-example-procedure-v1/IDEA.md
    84	acceptance_commands:
    85	  - test -f templates/SPEC.task.template.md
    86	  - bash scripts/lint-spec.sh specs/<id>/SPEC.md
    87	---
    88	```
    89	
    90	### 1.3 Status state machine
    91	
    92	```text
    93	                  /idea-capture (gate pass)
    94	IDEA.draft ─────────────────────────────► IDEA.ready-for-spec
    95	   ▲                                              │

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/schema/SPEC.schema.md | sed -n '350,378p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   350	2. Selects the per-type quality gate
   351	   (`task` → bar b, `contract` → bar c, `decision` → bar b + candidates).
   352	3. Runs `lint-spec.sh` on the artefact (REQUIRED for `contract`,
   353	   RECOMMENDED for `task` and `decision`).
   354	4. Produces a structured Quality Gate Result with `pass`, `failures`
   355	   (with `criterion`, `evidence`, `severity`).
   356	5. Sets `status: needs-revision` on any blocking failure;
   357	   `status: approved-pending-owner` on a clean pass.
   358	6. Owner sets `status: approved` after reviewing the Quality Gate
   359	   Result and the SPEC.
   360	
   361	The `spec-review` skill MUST NOT set `status: approved`.
   362	
   363	## 6. Cross-references
   364	
   365	- Templates: `spec-bundle/templates/SPEC.task.template.md`,
   366	  `spec-bundle/templates/SPEC.contract.template.md`,
   367	  `spec-bundle/templates/SPEC.decision.template.md`,
   368	  `spec-bundle/templates/SPEC.fastpath.template.md`,
   369	  `templates/IDEA.template.md`,
   370	  `templates/TASK.template.md`.
   371	- Lint script: `scripts/lint-spec.sh`.
   372	- Skill validator: `scripts/validate-skill-frontmatter.sh`.
   373	- Procedure-only skills: `spec-bundle/skills/verification/SKILL.md`,
   374	  `spec-bundle/skills/code-review/SKILL.md`, `spec-bundle/skills/release-pr/SKILL.md`,
   375	  `spec-bundle/skills/spec-evidence-governance/SKILL.md`,
   376	  `spec-bundle/skills/diagnosis/SKILL.md`, `spec-bundle/skills/tdd/SKILL.md`.
   377	- Operating model: `OPERATING_MODEL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/cross-repo-informational-channel/SKILL.md | sed -n '108,122p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   108	## Hard rules
   109	
   110	- Inbox entries are immutable once written. Acknowledgements
   111	  append below the original entry; do not edit the original.
   112	- Owner alone archives entries older than 90 days to
   113	  `AGENT_INBOX.archive.md`.
   114	- Truncate the file to the most recent 50 entries on
   115	  archival pass; do not let it grow unboundedly.
   116	- Entries citing facts MUST use the framework citation
   117	  grammar (`schema/SPEC.schema.md` §2).
   118	- Do NOT include secrets, credentials, or third-party private
   119	  data. Inboxes are git-tracked or working-tree visible to
   120	  any agent landing locally.
   121	- Do NOT write to your own repo's inbox. Use
   122	  `AGENT_FEEDBACK.md` for outgoing-to-fleet content or another

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/references/reference-architecture.md | sed -n '50,65p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    50	   the upstream repo + docs in §4 Authority Map; trade-off matrix
    51	   in §6 covers the fleet-specific criteria (procedure binding,
    52	   coexistence with existing tooling, citation+authority
    53	   preservation, OSS posture, agent skill surface, maintenance
    54	   cost).
    55	2. **Task SPEC** executing the deliverables. Lists the artefact
    56	   set in §17.1 Files Changed.
    57	3. **`skills/<tool>/SKILL.md`** mirroring upstream's
    58	   SKILL.md if one exists, adding bindings (citation grammar,
    59	   owner-only authority, propagation contract, hard rules against
    60	   bypassing existing fleet surfaces).
    61	4. **`workpads/<tool>.<ext>.template`** project-level
    62	   config bound to procedure via the tool's hook surface
    63	   (lint-spec on staged artefacts, parent-SPEC acceptance on
    64	   merge, evidence reminders, removal guards).
    65	5. **`OPERATING_MODEL.md`** section documenting the tool

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/repo-orientation/SKILL.md | sed -n '20,38p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    20	   parallel mode** (when running under `wt`). Interactive
    21	   sessions read Section 1 only; do NOT install the tracker or
    22	   the autonomous-dispatch runner.
    23	3. Read `SESSION_JOURNAL.md` at the repo root (last 3 entries).
    24	   It tells you what the previous agent did, what was left dirty,
    25	   and what to pick up. If absent, copy from
    26	   `.workpads/SESSION_JOURNAL.template.md`.
    27	4. Read `AGENT_FEEDBACK.md` for open friction entries relevant
    28	   to your work. If absent, copy from
    29	   `.workpads/AGENT_FEEDBACK.template.md`.
    30	5. Read `AGENT_INBOX.md` — the top 5 entries (newest first).
    31	   Acknowledge any `Expects ack: true` entries with an ack line
    32	   below the original. If absent, copy from
    33	   `.workpads/AGENT_INBOX.template.md`. See
    34	   `.skills/agent-inbox/SKILL.md`.
    35	6. Before dispatch, delegation, model-specific work, or
    36	   multi-agent review, read `your model-routing policy` or the
    37	   propagated `.your model-routing policy`.
    38	7. Check git state with `git status --short --branch`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '730,830p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   730	    exit 1
   731	  exit 0
   732	```
   733	
   734	## 10. Failure Model
   735	
   736	| Class | Trigger | Recovery |
   737	|---|---|---|
   738	| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
   739	| `facet-fs-mismatch` | Facet listed in manifest has no directory, or directory exists with no manifest entry | Author reconciles; either populate the directory or remove the facet entry |
   740	| `facet-primary-missing` | A facet's `primary` file does not exist | Author creates the file (with placeholder content if needed) and re-runs |
   741	| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
   742	| `conformance-suite-regression` | A previously passing conformance test now fails after the repack | Author fixes the regression OR reverts the touch that caused it (the repack must preserve v1.1 functional capabilities) |
   743	
   744	## 11. Trust Boundary / Security
   745	
   746	- The repack does not introduce new attack surface. The
   747	  manifest is read-only data; `validate-manifest.sh` is
   748	  a read-only check.
   749	- The signature field is reserved unsigned at v2.0.
   750	  Sigstore signing
   751	  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
   752	  §3) lands at v2.x as a follow-on Task SPEC.
   753	- The migration does not delete user-created files; only
   754	  framework-owned artefacts are relocated. Anything
   755	  under user's gitignored paths is untouched.
   756	- No secrets are introduced; no requires_secrets in
   757	  front-matter.
   758	
   759	## 12. Observability
   760	
   761	- `validate-manifest.sh` prints diagnostic lines to
   762	  stderr per failed check; exit 0 iff all checks pass.
   763	- CI job `validate-manifest` runs on every push +
   764	  pull request; CI status is the observability surface
   765	  for bundle health.
   766	- The bundle's `spec_version` field is the
   767	  user-observable schema version; consumers can pin
   768	  against a specific schema version.
   769	
   770	## 13. Test and Validation Matrix
   771	
   772	| AC | Test |
   773	|---|---|
   774	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` exits 0 |
   775	| AC-2 | `cmd://test -f spec-bundle/manifest.yaml` exits 0 |
   776	| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
   777	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
   778	| AC-5 | `cmd://bash tests/hooks/run-tests.sh` reports 33 pass / 0 fail (no regressions from repack) |
   779	| AC-6 | `cmd://bash scripts/lint-spec.sh examples/*/IDEA.md examples/*/SPEC.md` lint clean on every example (no regressions) |
   780	| AC-7 | `cmd://gh -R buildepicshit/agentic-ops-framework run list --limit 1` shows post-repack CI run with conclusion: success |
   781	| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
   782	| AC-9 | `CHANGELOG.md` contains a `## v2.0` entry documenting the reorganization + breaking-changes index |
   783	
   784	## 14. Implementation Checklist (Definition of Done)
   785	
   786	- [ ] DoD-1: `spec-bundle/manifest.yaml` authored
   787	      conforming to §6.1 / §8 schema.
   788	- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
   789	      `cmd://bash scripts/validate-manifest.sh` exits 0
   790	      against the populated bundle.
   791	- [ ] DoD-3: §7.1 migration index executed; every v1.1
   792	      artefact accounted for (moved, removed, or
   793	      retained-at-top-level).
   794	- [ ] DoD-4: Each of the eight facets per §6.2 has a
   795	      `<facet>/<primary>` file (initially MAY be a
   796	      stub with cross-references; v2.x slices populate
   797	      richer content).
   798	- [ ] DoD-5: `AGENTS.md` authored at top level per §3
   799	      and §6.2's repo-owned-contract pattern.
   800	- [ ] DoD-6: `CHANGELOG.md` v2.0 entry added with
   801	      migration index summary.
   802	- [ ] DoD-7: CI workflow updated to include
   803	      `validate-manifest` job; all CI jobs pass on the
   804	      repacked main.
   805	- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
   806	      DoD-1 through DoD-7 are met.
   807	
   808	## 15. Acceptance Criteria
   809	
   810	(See §13 for tests; checkboxes are the post-execution
   811	verification list.)
   812	
   813	- [x] AC-1: SPEC lint clean
   814	- [x] AC-2: manifest exists
   815	- [x] AC-3: validate-manifest exits 0
   816	- [x] AC-4: every facet has primary file
   817	- [x] AC-5: hook tests 33/33 pass (no regression)
   818	- [x] AC-6: example lint clean (no regression)
   819	- [x] AC-7: CI green post-repack
   820	- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
   821	- [x] AC-9: CHANGELOG v2.0 entry present
   822	
   823	## 16. Rollback Plan
   824	
   825	If the repack surfaces a critical regression:
   826	
   827	1. The repack is a single PR (or coordinated commit
   828	   series); revert that PR via `git revert`.
   829	2. v1.1 remains the tagged release; consumers who
   830	   pinned v1.1 are unaffected.

codex
Acceptance commands pass, and the worktree stayed clean. I found at least one remaining stale repo-local citation in the SPEC; I’m checking whether that is isolated or part of a broader path-migration residue before finalizing the gate.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' tests/hooks/run-tests.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
#!/usr/bin/env bash
# Hook test harness. Exits 0 if all pass, 1 on failure.
#
# Each test feeds a synthesized PreToolUse(Bash | Edit) JSON envelope to a
# hook and asserts the exit code (and optionally stderr / stdout content).
#
# All "should block" tests for branch-aware hooks run from a sandbox git
# repo with no main-direct SPEC, so the hook's SPEC walk falls through to
# the block. "Should allow" tests use a sandbox repo that DOES declare
# main-direct, exercising the allow path.

set -u
HOOK_DIR="$(cd "$(dirname "$(readlink -f "$0")")/../../hooks" && pwd)"
FIXTURES="$(cd "$(dirname "$(readlink -f "$0")")/fixtures" && pwd)"
PASS=0; FAIL=0; FAILURES=()

run() {
    local name="$1" hook="$2" expected_exit="$3" json="$4" cwd="${5:-}"
    local actual stderr
    if [ -n "$cwd" ]; then
        stderr=$(cd "$cwd" && printf '%s' "$json" | "$HOOK_DIR/$hook" 2>&1 >/dev/null)
    else
        stderr=$(printf '%s' "$json" | "$HOOK_DIR/$hook" 2>&1 >/dev/null)
    fi
    actual=$?
    if [ "$actual" = "$expected_exit" ]; then
        PASS=$((PASS+1))
        printf 'PASS %-55s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit, got $actual; stderr=$stderr")
        printf 'FAIL %-55s [%s]: expected %s got %s\n' "$name" "$hook" "$expected_exit" "$actual"
    fi
}

run_stdout() {
    local name="$1" hook="$2" expected_exit="$3" expected_substr="$4" json="$5"
    local actual stdout
    stdout=$(printf '%s' "$json" | "$HOOK_DIR/$hook" 2>/dev/null)
    actual=$?
    if [ "$actual" = "$expected_exit" ] && printf '%s' "$stdout" | grep -qF "$expected_substr"; then
        PASS=$((PASS+1))
        printf 'PASS %-55s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit + stdout containing '$expected_substr'; got exit $actual")
        printf 'FAIL %-55s [%s]\n' "$name" "$hook"
    fi
}

# --- sandbox repos ---

# SANDBOX_NO_SPEC: git repo on main, no SPEC declaring main-direct.
# Used for "should block" tests of branch-aware hooks.
SANDBOX_NO_SPEC="$(mktemp -d)"
( cd "$SANDBOX_NO_SPEC" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && git -c user.email=t@t -c user.name=t commit -q --allow-empty -m init )

# SANDBOX_MAIN_DIRECT: git repo on main WITH a main-direct SPEC.
# Used for "should allow" tests of branch-aware hooks.
SANDBOX_MAIN_DIRECT="$(mktemp -d)"
( cd "$SANDBOX_MAIN_DIRECT" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && mkdir -p specs/fixture \
    && printf -- '---\nid: fixture\ntype: contract\nstatus: closed\nbranch_policy: main-direct\n---\n' > specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t add specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t commit -q -m init )

# NON_GIT: a non-git tmpdir for hooks that bail out when not in a git repo.
NON_GIT="$(mktemp -d)"

trap 'rm -rf "$SANDBOX_NO_SPEC" "$SANDBOX_MAIN_DIRECT" "$NON_GIT"' EXIT

# --- helpers ---

JB() {
    # PreToolUse(Bash) envelope.
    local cmd="$1"
    printf '{"tool_input":{"command":%s}}' "$(printf '%s' "$cmd" | jq -Rs .)"
}

JE() {
    # PreToolUse(Edit) envelope.
    local file_path="$1"
    printf '{"tool_input":{"file_path":"%s"}}' "$file_path"
}

# --- block-push-to-main.sh ---
run "real push to main blocked"               block-push-to-main.sh   2 "$(JB 'git push origin main')" "$SANDBOX_NO_SPEC"
run "real push to feature branch allowed"     block-push-to-main.sh   0 "$(JB 'git push origin feature/x')"
run "real push -u origin main blocked"        block-push-to-main.sh   2 "$(JB 'git push -u origin main')" "$SANDBOX_NO_SPEC"
run "real push to main-rework allowed"        block-push-to-main.sh   0 "$(JB 'git push origin feature/main-rework')"
run "no push (commit only) allowed"           block-push-to-main.sh   0 "$(JB 'git commit -m "fix bug"')"
run "commit msg mentions git push to main"    block-push-to-main.sh   0 "$(JB 'git commit -m "describe what git push to main does"')"
run "heredoc body mentions git push to main"  block-push-to-main.sh   0 "$(JB $'cat > /tmp/msg <<EOF\nrefuses git push to main\nEOF\ngit commit -F /tmp/msg')"
run "chain: cd && git push origin main"       block-push-to-main.sh   2 "$(JB 'cd /repo && git push origin main')" "$SANDBOX_NO_SPEC"
run "main-direct SPEC allows push to main"    block-push-to-main.sh   0 "$(JB 'git push origin main')" "$SANDBOX_MAIN_DIRECT"
run "main-direct SPEC allows push -u main"    block-push-to-main.sh   0 "$(JB 'git push -u origin main')" "$SANDBOX_MAIN_DIRECT"

# --- block-git-add-all.sh ---
run "real git add . blocked"                  block-git-add-all.sh    2 "$(JB 'git add .')"
run "real git add -A blocked"                 block-git-add-all.sh    2 "$(JB 'git add -A')"
run "git add --all blocked"                   block-git-add-all.sh    2 "$(JB 'git add --all')"
run "git add filename allowed"                block-git-add-all.sh    0 "$(JB 'git add foo.txt')"
run "msg mentions git add . allowed"          block-git-add-all.sh    0 "$(JB 'git commit -m "stop using git add ."')"
run "heredoc with git add ."                  block-git-add-all.sh    0 "$(JB $'cat > /tmp/msg <<EOF\ngit add . is banned\nEOF')"

# --- block-verify-bypass.sh ---
run "real --no-verify on commit blocked"      block-verify-bypass.sh  2 "$(JB 'git commit --no-verify -m "x"')"
run "real --no-gpg-sign on push blocked"      block-verify-bypass.sh  2 "$(JB 'git push --no-gpg-sign')"
run "git log --no-merges allowed"             block-verify-bypass.sh  0 "$(JB 'git log --no-merges')"
run "msg mentions --no-verify"                block-verify-bypass.sh  0 "$(JB 'git commit -m "this hook blocks --no-verify"')"
run "heredoc body with --no-verify"           block-verify-bypass.sh  0 "$(JB $'cat > /tmp/msg <<EOF\nrefuses --no-verify\nEOF\ngit commit -F /tmp/msg')"

# --- block-ai-attribution.sh ---
run "commit -m with Co-Authored-By blocked"   block-ai-attribution.sh 2 "$(JB 'git commit -m "fix\n\nCo-Authored-By: Claude <x>"')"
run "commit -m clean allowed"                 block-ai-attribution.sh 0 "$(JB 'git commit -m "clean message"')"
run "commit -F file with co-author blocked"   block-ai-attribution.sh 2 "$(JB "git commit -F $FIXTURES/msg-with-coauthor.txt")"
run "commit -F file clean allowed"            block-ai-attribution.sh 0 "$(JB "git commit -F $FIXTURES/msg-clean.txt")"
run "non-commit (push) allowed"               block-ai-attribution.sh 0 "$(JB 'git push origin feature/x')"

# --- block-edit-on-main.sh ---
run "edit on main blocked (no main-direct)"   block-edit-on-main.sh   2 "$(JE 'foo.md')" "$SANDBOX_NO_SPEC"
run "edit on main allowed (main-direct SPEC)" block-edit-on-main.sh   0 "$(JE 'foo.md')" "$SANDBOX_MAIN_DIRECT"
run "edit in non-git dir allowed"             block-edit-on-main.sh   0 "$(JE 'foo.md')" "$NON_GIT"

# --- session-start-context.sh (stdout-as-context per Claude Code docs) ---
run_stdout "session-start emits Session-init context header" \
    session-start-context.sh 0 "Session-init context" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits Repo: line" \
    session-start-context.sh 0 "Repo:" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits Recent commits section" \
    session-start-context.sh 0 "Recent commits" \
    '{"hook_event_name":"SessionStart"}'

# --- verify-reminder.sh ---
run "verify-reminder.sh emits 0 on Stop"      verify-reminder.sh      0 '{"hook_event_name":"Stop"}'

# --- summary ---
printf '\n=== %d pass / %d fail ===\n' "$PASS" "$FAIL"
if [ "$FAIL" -gt 0 ]; then
    printf '\nFailures:\n'
    for line in "${FAILURES[@]}"; do printf '  - %s\n' "$line"; done
    exit 1
fi
exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' scripts/validate-skill-frontmatter.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
#!/usr/bin/env bash
# validate-skill-frontmatter.sh — sanity-check SKILL.md YAML frontmatter
# across all skill directories present in the cwd repo.
#
# Scans whichever of these exist:
#   spec-bundle/skills/  (framework source as of v2.0; was skills/ in v1.x)
#   .claude/skills/      (Claude Code mirror, if present)
#
# Catches the most common breakage: unquoted scalar values containing
# `: ` (colon-space), which strict YAML parsers reject.
#
# Exit: 0 clean, 1 issues found.

set -uo pipefail
fail=0

scan_dir() {
    local dir="$1"
    [ -d "$dir" ] || return 0
    while IFS= read -r -d '' f; do
        fm=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit; next} c==1' "$f")
        if [ -z "$fm" ]; then
            printf '%s: NO frontmatter\n' "$f" >&2
            fail=1; continue
        fi
        while IFS= read -r line; do
            case "$line" in
                ''|'#'*) continue ;;
            esac
            if [[ "$line" =~ ^([a-zA-Z_][a-zA-Z0-9_-]*):[[:space:]]*(.*)$ ]]; then
                key="${BASH_REMATCH[1]}"
                val="${BASH_REMATCH[2]}"
                val="${val#"${val%%[![:space:]]*}"}"
                val="${val%"${val##*[![:space:]]}"}"
                case "$val" in
                    '"'*|"'"*|'>'*|'|'*|'['*|'{'*) continue ;;
                    '') continue ;;
                esac
                if printf '%s' "$val" | grep -qE ': '; then
                    printf '%s: unquoted "%s:" value contains ": " (will break strict YAML)\n' "$f" "$key" >&2
                    fail=1
                fi
            fi
        done < <(printf '%s\n' "$fm")
    done < <(find "$dir" -name SKILL.md -type f -print0)
}

scan_dir spec-bundle/skills/
scan_dir .claude/skills

if [ "$fail" = "0" ]; then
    echo "skill frontmatter: clean"
fi
exit "$fail"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' scripts/lint-spec.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
#!/usr/bin/env bash
# lint-spec.sh — v1 lint for IDEA.md and SPEC.md artefacts.
#
# Authority: file://OPERATING_MODEL.md §"Spec Lifecycle" and
#   file://templates/SPEC.schema.md (citation grammar, RFC 2119
#   scoping rules, front-matter schema).
#
# Behavior is non-mutating and offline. The script reads the target
# file, prints a summary to stdout, prints diagnostics to stderr, and
# exits with one of:
#   0 — clean
#   1 — blocking errors
#   2 — advisory-only warnings
#   64 — usage error
#
# Suppression markers (per SPEC.schema §2.5):
#   <!-- lint-ok: no-citation --> on a paragraph silences the citation audit.
#   <!-- lint-ok: no-rfc        --> on a line silences the lowercase RFC 2119 warning.

set -eu

PROG="$(basename "$0")"

usage() {
    printf 'usage: %s <path-to-IDEA.md-or-SPEC.md>\n' "$PROG" >&2
    exit 64
}

[[ $# -eq 1 ]] || usage
TARGET="$1"
[[ -f "$TARGET" ]] || { printf '%s: not a file: %s\n' "$PROG" "$TARGET" >&2; exit 64; }

BASENAME="$(basename "$TARGET")"

errors=()
warnings=()

emit_err()  { errors+=("$1");  printf '%s:%s: %s\n' "$TARGET" "$2" "$3" >&2; }
emit_warn() { warnings+=("$1"); printf '%s:%s: warning: %s\n' "$TARGET" "$2" "$3" >&2; }

# ---------- Front-matter parse ----------
fm_start=0; fm_end=0
mapfile -t LINES < "$TARGET"
total_lines=${#LINES[@]}

if [[ $total_lines -gt 0 && "${LINES[0]}" == "---" ]]; then
    fm_start=1
    for ((i=1; i<total_lines; i++)); do
        if [[ "${LINES[$i]}" == "---" ]]; then
            fm_end=$((i+1))
            break
        fi
    done
fi

if [[ $fm_start -eq 0 || $fm_end -eq 0 ]]; then
    emit_err "front-matter" 1 "missing or unterminated YAML front-matter block"
fi

declare -A FM
if [[ $fm_end -gt 0 ]]; then
    for ((i=1; i<fm_end-1; i++)); do
        line="${LINES[$i]}"
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// }" ]] && continue
        [[ "$line" =~ ^[[:space:]]*-[[:space:]] ]] && continue
        if [[ "$line" =~ ^([A-Za-z_][A-Za-z0-9_]*):[[:space:]]*(.*)$ ]]; then
            key="${BASH_REMATCH[1]}"
            val="${BASH_REMATCH[2]}"
            val="${val%%[[:space:]]#*}"
            FM[$key]="$val"
        fi
    done
fi

# ---------- Type detection ----------
ARTEFACT="spec"
[[ "$BASENAME" == "IDEA.md" ]] && ARTEFACT="idea"

if [[ "$ARTEFACT" == "idea" ]]; then
    TYPE="${FM[implies_spec_type]:-}"
else
    TYPE="${FM[type]:-}"
fi
case "$TYPE" in
    task|contract|decision|fastpath) ;;
    "") emit_err "front-matter" "$fm_end" "missing type/implies_spec_type field" ;;
    *)  emit_err "front-matter" "$fm_end" "unknown type: $TYPE" ;;
esac

# ---------- Required-section presence ----------
# Per SPEC.schema §4.1, section IDENTITY is its title; section number is
# informational. We strip leading "<digits>. " from both required and
# observed before comparing.
required_sections=()
case "$ARTEFACT-$TYPE" in
    idea-*)
        required_sections=(
            "Normative Language"
            "Problem Seed"
            "Substance Citations"
            "Constraints & Non-Negotiables"
            "Approaches Considered"
            "Recommendation"
            "Open Questions for Owner"
            "Owner Judgments"
        ) ;;
    spec-task)
        required_sections=(
            "Normative Language"
            "Problem" "North Star / Product Promise" "Goals" "Non-Goals"
            "Current System Facts" "Authority Map" "Code/Docs Reality Check"
            "Desired Behavior" "Domain Model / Contract" "Interfaces and Files"
            "Execution Plan" "Safety / Scope Invariants" "Test Plan"
            "Acceptance Criteria" "Rollback Plan" "Open Questions"
            "Completion Report"
        ) ;;
    spec-contract)
        # "Open Questions" is OPTIONAL when empty — omitted from the
        # required list. Authors MAY drop the heading entirely when no
        # open questions remain. Existing Contracts that retain the
        # section with substantive content remain unaffected (existing
        # per-section citation checks still apply when present).
        required_sections=(
            "Normative Language"
            "Problem Statement" "Goals and Non-Goals" "System Overview"
            "Authority Map" "Code/Docs Reality Check" "Domain Model"
            "Schema Specification" "Reference Algorithms" "Failure Model"
            "Trust Boundary / Security" "Observability"
            "Test and Validation Matrix" "Implementation Checklist"
            "Acceptance Criteria" "Rollback Plan"
            "Completion Report"
        )
        # Per Decision SPEC §7 (d), capture-after defer-shorthand for §1
        # Problem Statement and §13 Test and Validation Matrix is
        # PERMITTED only when front-matter status: verified AND the
        # producing IDEA is cited. Enforcement note: the existing §2
        # citation-grammar rule already requires every fact-bearing
        # paragraph to carry a cite, so a single-paragraph
        # file://specs/<id>/IDEA.md cite in §1 or §13 passes lint by
        # construction. The "shorthand requires verified" check lives
        # in the spec-review skill (per-type gate), not in this lint,
        # to keep the script's conditional logic small.
        ;;
    spec-decision)
        required_sections=(
            "Problem" "Substance Citations" "Authority Map"
            "Decision Criteria" "Candidate Options" "Trade-off Comparison"
            "Decision Statement" "Decision Rationale" "Locks"
            "Reversal Plan" "Validation Plan" "Acceptance Criteria"
            "Open Questions" "Completion Report"
        ) ;;
    spec-fastpath)
        # Fastpath SPECs are intentionally minimal. Required sections only.
        required_sections=(
            "Normative Language"
            "Problem" "Files changed" "Owner directive"
            "Acceptance commands" "Completion Report"
        ) ;;
esac

# Strip "<digits or digits.digits>. " prefix from a section title.
strip_section_number() {
    local t="$1"
    if [[ "$t" =~ ^[0-9]+(\.[0-9]+)*[.][[:space:]]+(.*)$ ]]; then
        printf '%s' "${BASH_REMATCH[2]}"
    else
        printf '%s' "$t"
    fi
}

# Collect observed top-level (## ) section titles, with line numbers.
observed_titles=()
observed_title_lines=()
for ((i=fm_end; i<total_lines; i++)); do
    line="${LINES[$i]}"
    if [[ "$line" =~ ^##[[:space:]](.+)$ ]]; then
        title="${BASH_REMATCH[1]}"
        observed_titles+=("$title")
        observed_title_lines+=($((i+1)))
    fi
done

section_present() {
    local needle="$1" t bare_needle bare_t
    bare_needle="$(strip_section_number "$needle")"
    for t in "${observed_titles[@]:-}"; do
        bare_t="$(strip_section_number "$t")"
        # Title-only prefix match: handles "Implementation Checklist
        # (Definition of Done)" matching "Implementation Checklist" and
        # similar parenthetical extensions.
        [[ "$bare_t" == "$bare_needle" || "$bare_t" == "$bare_needle "* || "$bare_t" == "$bare_needle("* ]] && return 0
    done
    return 1
}

for s in "${required_sections[@]:-}"; do
    if ! section_present "$s"; then
        emit_err "section" "$fm_end" "missing required section: ## $s"
    fi
done

# ---------- Build per-section line ranges ----------
section_starts=()
section_ends=()
section_titles_all=()
for ((idx=0; idx<${#observed_titles[@]}; idx++)); do
    section_titles_all+=("${observed_titles[$idx]}")
    section_starts+=($((observed_title_lines[$idx]-1)))
done
for ((idx=0; idx<${#section_starts[@]}; idx++)); do
    if (( idx+1 < ${#section_starts[@]} )); then
        section_ends+=($((section_starts[idx+1]-1)))
    else
        section_ends+=($((total_lines-1)))
    fi
done

is_normative_title() {
    local t="$1"

codex
The stale-path issue is real: `schema/SPEC.schema.md` no longer exists, while `spec-bundle/schema/SPEC.schema.md` does. I’m running the remaining read-only CI-style checks now so the final result can separate mechanical green status from review failures.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh examples/reference-procedure-spec/IDEA.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 64 in 0ms:
lint-spec.sh: not a file: examples/reference-procedure-spec/IDEA.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'node --check scripts/preflight.mjs' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-skill-frontmatter.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
skill frontmatter: clean

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash tests/hooks/run-tests.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 1096ms:
PASS commit msg mentions git push to main                    [block-push-to-main.sh]
PASS heredoc body mentions git push to main                  [block-push-to-main.sh]
FAIL chain: cd && git push origin main                       [block-push-to-main.sh]: expected 2 got 0
PASS main-direct SPEC allows push to main                    [block-push-to-main.sh]
PASS main-direct SPEC allows push -u main                    [block-push-to-main.sh]
PASS real git add . blocked                                  [block-git-add-all.sh]
PASS real git add -A blocked                                 [block-git-add-all.sh]
PASS git add --all blocked                                   [block-git-add-all.sh]
PASS git add filename allowed                                [block-git-add-all.sh]
PASS msg mentions git add . allowed                          [block-git-add-all.sh]
PASS heredoc with git add .                                  [block-git-add-all.sh]
PASS real --no-verify on commit blocked                      [block-verify-bypass.sh]
PASS real --no-gpg-sign on push blocked                      [block-verify-bypass.sh]
PASS git log --no-merges allowed                             [block-verify-bypass.sh]
PASS msg mentions --no-verify                                [block-verify-bypass.sh]
PASS heredoc body with --no-verify                           [block-verify-bypass.sh]
PASS commit -m with Co-Authored-By blocked                   [block-ai-attribution.sh]
PASS commit -m clean allowed                                 [block-ai-attribution.sh]
PASS commit -F file with co-author blocked                   [block-ai-attribution.sh]
PASS commit -F file clean allowed                            [block-ai-attribution.sh]
PASS non-commit (push) allowed                               [block-ai-attribution.sh]
FAIL edit on main blocked (no main-direct)                   [block-edit-on-main.sh]: expected 2 got 0
PASS edit on main allowed (main-direct SPEC)                 [block-edit-on-main.sh]
PASS edit in non-git dir allowed                             [block-edit-on-main.sh]
PASS session-start emits Session-init context header         [session-start-context.sh]
PASS session-start emits Repo: line                          [session-start-context.sh]
PASS session-start emits Recent commits section              [session-start-context.sh]
PASS verify-reminder.sh emits 0 on Stop                      [verify-reminder.sh]

=== 29 pass / 4 fail ===

Failures:
  - real push to main blocked [block-push-to-main.sh]: expected exit 2, got 0; stderr=
  - real push -u origin main blocked [block-push-to-main.sh]: expected exit 2, got 0; stderr=
  - chain: cd && git push origin main [block-push-to-main.sh]: expected exit 2, got 0; stderr=
  - edit on main blocked (no main-direct) [block-edit-on-main.sh]: expected exit 2, got 0; stderr=

codex
Two verification attempts were environment-limited rather than product failures: hook tests could not create `/tmp` sandbox repos under the current read-only sandbox, and my first example-lint probe used a non-existent fixture path. I’m correcting the example lint invocation against the actual examples and rechecking repo cleanliness after the failed temp attempt.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find examples -maxdepth 2 -type f | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
examples/README.md
examples/contract-webhook-signing/IDEA.md
examples/contract-webhook-signing/SPEC.md
examples/decision-conventional-commits/IDEA.md
examples/decision-conventional-commits/SPEC.md
examples/fastpath-fix-readme-typo/SPEC.md
examples/task-add-structured-logging/IDEA.md
examples/task-add-structured-logging/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n '"'^---|''^type:|''^implies_spec_type:'"' examples" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
examples/fastpath-fix-readme-typo/SPEC.md:1:---
examples/fastpath-fix-readme-typo/SPEC.md:4:type: fastpath
examples/fastpath-fix-readme-typo/SPEC.md:15:---
examples/task-add-structured-logging/IDEA.md:1:---
examples/task-add-structured-logging/IDEA.md:8:implies_spec_type: task
examples/task-add-structured-logging/IDEA.md:9:---
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:1:---
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:18:---
examples/contract-webhook-signing/IDEA.md:1:---
examples/contract-webhook-signing/IDEA.md:8:implies_spec_type: contract
examples/contract-webhook-signing/IDEA.md:9:---
examples/task-add-structured-logging/SPEC.md:1:---
examples/task-add-structured-logging/SPEC.md:4:type: task
examples/task-add-structured-logging/SPEC.md:17:---
examples/decision-conventional-commits/SPEC.md:1:---
examples/decision-conventional-commits/SPEC.md:4:type: decision
examples/decision-conventional-commits/SPEC.md:14:---
examples/decision-conventional-commits/IDEA.md:1:---
examples/decision-conventional-commits/IDEA.md:8:implies_spec_type: decision
examples/decision-conventional-commits/IDEA.md:9:---
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:1:---
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:18:---
examples/contract-webhook-signing/SPEC.md:1:---
examples/contract-webhook-signing/SPEC.md:4:type: contract
examples/contract-webhook-signing/SPEC.md:17:---

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in examples/*/IDEA.md examples/*/SPEC.md; do bash scripts/lint-spec.sh "$f" >/dev/null || exit $?; done' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 4947ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --exit-code -- specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '1020,1045p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
  1020	worked-case-study contract is discharged: Product A's
  1021	v2.0 IS the manifest+catalog shape Product B
  1022	advocates.
  1023	
  1024	### 19.4 Residual risk
  1025	
  1026	- **Scaffold-grade content in several facets**: the
  1027	  spec-bundle/conformance/ directory is empty;
  1028	  per-decision ADRs at spec-bundle/decisions/ADR-NNN-
  1029	  <slug>.md are not yet authored (only INDEX is); the
  1030	  Structurizr DSL diagrams at
  1031	  spec-bundle/architecture/*.dsl are not yet authored.
  1032	  This is explicitly documented in CHANGELOG v2.0 as
  1033	  "reserved for v2.x". The bundle is structurally
  1034	  complete but content-thin in those facets.
  1035	- **Cross-reference rot**: existing internal SPECs
  1036	  under specs/ that referenced `file://schema/...`,
  1037	  `file://templates/...`, `file://skills/...` paths
  1038	  now point at locations that no longer exist. The
  1039	  lint script does not validate file:// paths deeply,
  1040	  so these are not caught by CI. They are historical
  1041	  artefacts; consumers who follow the references will
  1042	  hit 404s. Acceptable per the SPEC §10 F-4 failure
  1043	  class; a follow-on cross-reference validator script
  1044	  could close this gap in v2.x.
  1045	- **No symlink shims**: the SPEC §18 mentioned

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'file://schema/|file://templates/|file://skills/' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:174:- `file://schema/SPEC.schema.md` — citation grammar,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1036:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1037:  `file://templates/...`, `file://skills/...` paths

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '680,732p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   680	## 9. Reference Algorithms
   681	
   682	### 9.1 validate-manifest (pseudocode)
   683	
   684	```
   685	function validate_manifest():
   686	  manifest = parse_yaml("spec-bundle/manifest.yaml")
   687	  errors = []
   688	
   689	  # 1. Schema version match.
   690	  if manifest.spec_version != "2.1.0":
   691	    errors.append("spec_version: expected 2.1.0, got " + manifest.spec_version)
   692	
   693	  # 2. Conformance profile valid.
   694	  if manifest.conformance_profile not in ["core", "extension", "real-integration"]:
   695	    errors.append("conformance_profile invalid")
   696	
   697	  # 3. Required top-level fields.
   698	  for field in ["bundle_version", "generated_on", "generator",
   699	                "intent", "facets"]:
   700	    if field not in manifest:
   701	      errors.append("missing field: " + field)
   702	
   703	  # 4. intent block well-formed.
   704	  for f in ["product_name", "product_purpose",
   705	            "developer_authority", "installer_authority"]:
   706	    if f not in manifest.intent:
   707	      errors.append("intent missing: " + f)
   708	
   709	  # 5. Facets bijection: every listed facet has a directory
   710	  #    with the named primary file; every spec-bundle/
   711	  #    subdir (except resource subdirs) is listed.
   712	  listed_facets = set(manifest.facets.keys())
   713	  fs_subdirs = set(filter(is_dir, ls("spec-bundle/"))) - RESOURCE_DIRS
   714	  if listed_facets != fs_subdirs:
   715	    errors.append("facets mismatch: listed but not on fs " +
   716	                  str(listed_facets - fs_subdirs) +
   717	                  "; on fs but not listed " +
   718	                  str(fs_subdirs - listed_facets))
   719	
   720	  for fname, fdef in manifest.facets.items():
   721	    if not exists("spec-bundle/" + fdef.primary):
   722	      errors.append("facet " + fname + " primary file missing: " + fdef.primary)
   723	
   724	  # 6. Product name matches repo.
   725	  if manifest.intent.product_name != "agentic-ops-framework":
   726	    errors.append("intent.product_name mismatch")
   727	
   728	  if errors:
   729	    print_errors(errors)
   730	    exit 1
   731	  exit 0
   732	```

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find spec-bundle -maxdepth 1 -type d | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle
spec-bundle/architecture
spec-bundle/behavior
spec-bundle/conformance
spec-bundle/customization
spec-bundle/decisions
spec-bundle/deployment
spec-bundle/non-goals
spec-bundle/operations
spec-bundle/quality
spec-bundle/schema
spec-bundle/skills
spec-bundle/templates

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "ruby -e 'require \"yaml\"; YAML.load_file(\"spec-bundle/manifest.yaml\"); puts \"yaml parse: ok\"'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 127 in 0ms:
/home/linuxbrew/.linuxbrew/bin/bash: line 1: ruby: command not found

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "python3 -c 'import yaml, sys; yaml.safe_load(open(\"spec-bundle/manifest.yaml\")); print(\"yaml parse: ok\")'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 119ms:
Traceback (most recent call last):
  File "<string>", line 1, in <module>
    import yaml, sys; yaml.safe_load(open("spec-bundle/manifest.yaml")); print("yaml parse: ok")
    ^^^^^^^^^^^^^^^^
ModuleNotFoundError: No module named 'yaml'

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git tag --list v2.0.0' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
v2.0.0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n '"'^## v2'"\\.0|v2\\.0' CHANGELOG.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
8:## v2.0 — 2026-05-19
67:- **Directory moves** (the v1.x → v2.0 migration index):
76:- `README.md` rewritten for v2.0 with migration table.
77:- `CLAUDE.md` rewritten to reference v2.0 layout with a
85:Product A v2.0 + Product B v1.0 release) and the slice 2
89:Every methodology primitive adopted in v2.0 is grounded
93:for any methodology claim in v2.0 artefacts.
105:  unsigned` at v2.0; populates when cosign + Rekor
113:methodology's recommended packaging on itself, the v2.0
115:methodology repo references. Honest disclosure: v2.0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --exit-code' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f templates/IDEA.template.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/templates/IDEA.template.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f templates/TASK.template.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/templates/TASK.template.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f templates/SPEC.task.template.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/templates/SPEC.task.template.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
codex
```yaml
spec_path: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
type: contract
bar: c
pass: false
failures:
  - criterion: manifest-semantic-containment-prefix-boundary
    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
    severity: blocking
  - criterion: stale-file-citation
    evidence: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L174 cites file://schema/SPEC.schema.md; cmd://test -f schema/SPEC.schema.md exited 1, while cmd://test -f spec-bundle/schema/SPEC.schema.md exited 0.
    severity: blocking
  - criterion: stale-bare-paths
    evidence: file://spec-bundle/schema/SPEC.schema.md#L85 and file://spec-bundle/schema/SPEC.schema.md#L369-L370 still reference templates/... paths that no longer exist; spec-bundle/templates/... exists.
    severity: advisory
  - criterion: required-field-coverage-structure
    evidence: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L685-L707 specifies parse_yaml plus intent/facets structural checks; file://scripts/validate-manifest.sh#L45-L93 uses grep-based key scans and does not actually parse YAML or explicitly validate top-level intent structure.
    severity: advisory
```

Mechanical checks run: target `lint-spec.sh` passed, `test -f spec-bundle/manifest.yaml` passed, `validate-manifest.sh` passed, skill-frontmatter validation passed, `node --check scripts/preflight.mjs` passed, example SPEC/IDEA lint loop passed, `v2.0.0` tag exists, and the worktree stayed clean.

`tests/hooks/run-tests.sh` was inconclusive in this sandbox: it failed because `/tmp` is read-only and the harness could not create sandbox repos, not because of a repo regression.

Recommendation: `block-needs-revision`. R5 is improved but not final convergence.
tokens used
124,606
```yaml
spec_path: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
type: contract
bar: c
pass: false
failures:
  - criterion: manifest-semantic-containment-prefix-boundary
    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
    severity: blocking
  - criterion: stale-file-citation
    evidence: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L174 cites file://schema/SPEC.schema.md; cmd://test -f schema/SPEC.schema.md exited 1, while cmd://test -f spec-bundle/schema/SPEC.schema.md exited 0.
    severity: blocking
  - criterion: stale-bare-paths
    evidence: file://spec-bundle/schema/SPEC.schema.md#L85 and file://spec-bundle/schema/SPEC.schema.md#L369-L370 still reference templates/... paths that no longer exist; spec-bundle/templates/... exists.
    severity: advisory
  - criterion: required-field-coverage-structure
    evidence: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L685-L707 specifies parse_yaml plus intent/facets structural checks; file://scripts/validate-manifest.sh#L45-L93 uses grep-based key scans and does not actually parse YAML or explicitly validate top-level intent structure.
    severity: advisory
```

Mechanical checks run: target `lint-spec.sh` passed, `test -f spec-bundle/manifest.yaml` passed, `validate-manifest.sh` passed, skill-frontmatter validation passed, `node --check scripts/preflight.mjs` passed, example SPEC/IDEA lint loop passed, `v2.0.0` tag exists, and the worktree stayed clean.

`tests/hooks/run-tests.sh` was inconclusive in this sandbox: it failed because `/tmp` is read-only and the harness could not create sandbox repos, not because of a repo regression.

Recommendation: `block-needs-revision`. R5 is improved but not final convergence.
