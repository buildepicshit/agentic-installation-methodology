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
session id: 019e4231-ed24-7a90-870b-e7aaa344d098
--------
user
Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
codex
I’ll do this as a read-only review: first confirm the active artefact state and Round 1 claims, then run the acceptance commands that are safe in this sandbox, and inspect the schema/manifest/script carry-through points directly.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'pwd && git status --short && git rev-parse --show-toplevel && git log --oneline -6' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-ops-framework
/var/home/hasnobeef/buildepicshit/agentic-ops-framework
ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
5f59f7b spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled
1104e3a feat(v2.0)!: repack into manifest+catalog packaging
be0f503 spec(execute): Slice 2 -> in-execution; owner directive 2026-05-18 'yes go'

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' OPERATING_MODEL.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' spec-bundle/manifest.yaml" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec_version: "2.1.0"
bundle_version: "2.0.0"
conformance_profile: "core"
generated_on: "2026-05-19"
generator: "agentic-ops-framework"
schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
source_commit: ""              # populated by release tooling at tag time
source_tag: "v2.0.0"

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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' spec-bundle/schema/SPEC.schema.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

**Precondition.** The citation grammar presumes the studio has a
named decision-authority (single owner, named product lead, or
governance committee) that produces attributable directives.
Multi-stakeholder organizations without a named decision-authority
SHOULD define one before adopting the schema.

### 2.2 What constitutes a citable claim

A *citable claim* is any statement of fact, constraint, decision,
behavior, or requirement that an executor or verifier MUST rely on.
Examples: counts, file paths, line numbers, owner directives,
constraints, behavioral requirements, design decisions.

### 2.3 What does NOT require citation

The following SHALL NOT be flagged as missing citations:

- **Section headers and document structure** — `## 1. Problem` is not
  a claim.
- **Editorial framing and transitions** — "The following sections
  specify ...", "We now turn to ...".
- **Restatements within a paragraph of an already-cited claim** —
  one citation at the source statement; subsequent references in the
  same paragraph or list inherit it.
- **Definitions internal to the spec** — when the spec defines a
  term, the definition does not need an external citation.
- **References to other sections of the same document** — "see §7.6"
  is not a claim.
- **Pseudocode and reference algorithms** — line-level pseudocode
  does not require per-line citation; the algorithm as a whole is
  authored synthesis.
- **Domain model field declarations** — once declared in the Domain
  Model section, downstream sections may reference fields without
  citation.

### 2.4 Examples

**Positive — citation REQUIRED:**


codex
The current head includes the three remediation commits named in the request. I’m reading the active SPEC and the validator/scripts now, then I’ll execute the listed acceptance commands exactly as the SPEC records them.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
  §3 — manifest+descriptors+layers.
- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
  §3 — 12-section architecture-documentation template.
- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
  §3 — four-level architecture hierarchy.
- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
  §3 — Nygard ADR template.
- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
  §3 — customization-affordance prior art.
- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
  §3 — reproducibility primitive.
- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
  §3 — behavioural-acceptance primitive.
- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
  §3 — operating-system-boundary contract.
- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
  §3 — architecture-as-code DSL.

Stale, superseded, or evidence-only sources:

- `file://CHANGELOG.md` v1.0 / v1.1 entries — describe
  the current state being repacked, not the target.

Owner decisions required before implementation:

- [ ] Confirm `spec-bundle/` is the right top-level
      directory name (alternatives: `bundle/`, `spec/`,
      `dist/`). Default: `spec-bundle/`.
- [ ] Confirm v2.0 is a breaking change worth advertising
      (vs. continuous-add at v1.x). Default: yes, v2.0;
      the parent Decision binds the dogfooding posture
      that a v1.x cosmetic update cannot satisfy.

## 5. Code/Docs Reality Check

Existing v1.1 top-level (verified by
`cmd://ls /var/home/hasnobeef/buildepicshit/agentic-ops-framework/`):

- `LICENSE`, `README.md`, `AGENTS.md` is absent in v1.1
  but is the canonical entry doc per the methodology
  (note: v1.1 has `OPERATING_MODEL.md` instead; both
  exist in v2.0). <!-- lint-ok: no-citation -->

Hmm — actually checking
`cmd://ls /var/home/hasnobeef/buildepicshit/agentic-ops-framework/`:
top-level is `CHANGELOG.md`, `CODE_OF_CONDUCT.md`,
`CONTRIBUTING.md`, `docs`, `examples`, `hooks`, `LICENSE`,
`OPERATING_MODEL.md`, `README.md`, `schema`, `scripts`,
`skills`, `specs`, `templates`, `tests`, `workflow`,
`workpads`.

(`judgment://agent-synthesis` from filesystem listing at
authoring time.)

There is no `AGENTS.md` in v1.1's top-level. v2.0 adds it
per the methodology's AGENTS-aware tool guidance
(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
§3 transferable building block 5 — repo-owned contract
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
# spec-bundle/manifest.yaml
spec_version: "2.0.0"               # semver; this manifest schema version

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '260,620p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec_version: "2.0.0"               # semver; this manifest schema version
bundle_version: "2.0.0"             # semver; this specific bundle release
conformance_profile: "core"         # core | extension | real-integration
generated_on: "YYYY-MM-DD"          # ISO date the bundle was assembled
generator: "agentic-ops-framework"   # source repo identifier

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
  deployment:
    path: "deployment/"
    primary: "deployment/install.md"
  behavior:
    path: "behavior/"
    primary: "behavior/features/"
  customization:
    path: "customization/"
    primary: "customization/contract.md"
  decisions:
    path: "decisions/"
    primary: "decisions/INDEX.md"
  quality:
    path: "quality/"
    primary: "quality/requirements.md"
  operations:
    path: "operations/"
    primary: "operations/failures.md"
  non-goals:
    path: "non-goals/"
    primary: "non-goals/INDEX.md"

resources:
  schema:
    path: "schema/SPEC.schema.md"
  templates:
    path: "templates/"
  skills:
    path: "skills/"
  conformance:
    path: "conformance/"

signature:
  status: "unsigned"                # signed | unsigned
  # When signed: cosign signature + Rekor inclusion proof
  # populated per
  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
```

Manifest validation rules (enforced by
`scripts/validate-manifest.sh`):

1. `spec_version` matches the schema version this SPEC
   §6.1 defines (currently `2.1.0` post the codex
   remediation amendment at
   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   §7.E + §7.F; was `2.0.0` at v2.0.0 release).
2. `conformance_profile` is one of {`core`, `extension`,
   `real-integration`}
   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   §3 three-profile model).
3. Every facet listed in `facets:` has a corresponding
   directory under `spec-bundle/<facet>/` containing the
   named `primary` file.
4. Every directory under `spec-bundle/` (except
   `resources/` items) is listed in `facets:`.
5. `intent.product_name` matches the repo name.

### 6.2 Per-facet sub-spec contracts

#### 6.2.1 architecture/

Carries:
- `CONTEXT.md` — system-context narrative (arc42 §3
  Context and Scope per
  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
  §3).
- One or more `.dsl` files — C4-model architecture
  expressed in Structurizr DSL
  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
  §3) — Container + Component diagrams MAY be present;
  Code-level diagrams MAY be omitted per
  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
  §3 (Code-level "are typically generated rather than
  authored").
- `solution-strategy.md` — arc42 §4 Solution Strategy
  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
  §3.

#### 6.2.2 deployment/

Carries:
- `install.md` — installation procedure (prose +
  cmd:// citations to required commands).
- `requirements.md` — runtime + tooling requirements
  (12-factor Factor II "Dependencies" framing per
  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
  §3).
- `topology.md` — for fleet-deployable products, the
  expected topology + per-environment configuration
  posture.

#### 6.2.3 behavior/

Carries:
- `features/*.feature` — Gherkin Given-When-Then
  scenarios per
  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
  §3. Each feature file is simultaneously documentation,
  contract, and executable acceptance test (step
  definitions are the installer's responsibility).
- For products with HTTP APIs: `openapi.yaml` per
  OpenAPI 3.1.0
  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
  §3). For Product A specifically, no HTTP API → no
  openapi.yaml at v2.0.

#### 6.2.4 customization/

The novel facet (research §4.1; not natively modelled by
arc42, C4, ADRs, or any single prior art). Carries:
- `contract.md` — the deferral contract: what the
  framework provides by default vs what is deferred to
  the installer, with the constraints for each
  deferred surface.
- `knobs.schema.json` — JSON Schema (Helm-style per
  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
  §3) describing the customization knobs the installer
  may turn.
- `profiles/*.yaml` — named reference profiles
  (research §4.1's "starter profiles" with trade-offs
  documented per profile).

#### 6.2.5 decisions/

ADR-style decision records per
`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
§3 Nygard template. Carries:
- `INDEX.md` — list of decisions with id, title,
  status (proposed / accepted / deprecated /
  superseded), date, and one-line summary.
- `<seq>-<slug>.md` — per-decision artefacts (Title /
  Context / Decision / Consequences / Status).

For Product A specifically, the decisions populating
v2.0 trace back to the framework's existing internal
SPECs (BES-sanitized): spec-authoring-procedure-v1,
ceremony-weight-refactor, decomposition-pattern,
fastpath-introduction.

#### 6.2.6 quality/

Quality requirements + conformance gates per arc42 §10
Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
§3). Carries:
- `requirements.md` — quality scenarios (performance,
  reliability, security, maintainability, etc.) with
  measurable acceptance criteria.
- `12-factor-overlay.md` — for cloud-native products,
  the per-factor conformance posture
  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
  §3).

#### 6.2.7 operations/

Carries:
- `failures.md` — failure classes × recovery posture
  per Symphony §14 pattern
  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
  §3 transferable building block 10).
- `observability.md` — three-tier observability
  (required logging / recommended snapshot / optional
  HTTP) per Symphony §13 pattern.
- `safety-invariants.md` — MUST-numbered list per
  Symphony §9.5 pattern.

#### 6.2.8 non-goals/

The second novel facet (research §4.2). Carries:
- `INDEX.md` — facet-level negative space; for each
  of the other seven facets, a stated non-goal section
  ("the architecture/ facet does NOT cover …",
  "behavior/ does NOT model …", etc.).

### 6.3 Conformance suite (spec-bundle/conformance/)

The executable yes/no signal layer. Carries:
- Conformance check scripts that run against an
  installation and exit 0 iff the install conforms to
  the manifest's claimed `conformance_profile`.
- Reference test data + fixtures.

Conformance profiles (per Symphony §17 model):
- **core**: required for any conforming install.
- **extension**: required only for installs that ship
  optional features.
- **real-integration**: environment-dependent smoke
  checks; recommended before production.

## 7. Pipeline Specification

### 7.1 v1.1 → v2.0 migration index

| v1.1 path | v2.0 destination | Notes |
|---|---|---|
| `LICENSE` | `LICENSE` | unchanged |
| `README.md` | `README.md` | rewritten for v2.0; adds migration note |
| `CONTRIBUTING.md` | `CONTRIBUTING.md` | unchanged |
| `CODE_OF_CONDUCT.md` | `CODE_OF_CONDUCT.md` | unchanged |
| `CHANGELOG.md` | `CHANGELOG.md` | v2.0 entry added |
| `OPERATING_MODEL.md` | `OPERATING_MODEL.md` + `spec-bundle/operations/safety-invariants.md` cross-link | content stays; new sub-spec cross-links |
| (new) `AGENTS.md` | `AGENTS.md` | new at v2.0; ports content from OPERATING_MODEL |
| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
| `templates/` | `spec-bundle/templates/` | relocated |
| `skills/` | `spec-bundle/skills/` | relocated |
| `scripts/` | `scripts/` | top-level (tooling, not bundle content) |
| `hooks/` | `hooks/` | top-level (tooling) |
| `tests/` | `tests/` | top-level (tooling) |
| `specs/` | `specs/` | top-level (framework's own SPEC ledger) |
| `examples/` | `examples/` | top-level (worked IDEA+SPEC examples) |
| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
| `docs/` | absorbed into per-facet sub-spec READMEs | content reorganized; original `docs/` removed |
| (new) `spec-bundle/manifest.yaml` | `spec-bundle/manifest.yaml` | new front-door |
| (new) `spec-bundle/{architecture,deployment,behavior,customization,decisions,quality,operations,non-goals}/` | as named | new facet directories |
| (new) `spec-bundle/conformance/` | as named | new conformance suite |
| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |

### 7.2 Execution order

1. Author `spec-bundle/manifest.yaml` per §6.1 schema
   (initial facet directories may be placeholder; the
   manifest first, then population).
2. Author `scripts/validate-manifest.sh` per §6.1
   validation rules; verify it rejects the placeholder
   bundle (test that the gate fires).
3. Move existing artefacts per §7.1 migration index;
   update internal cross-references (lint will catch
   broken file:// paths).
4. Populate the new facet sub-spec contracts per §6.2
   with the minimum-viable content that lets the
   manifest reference resolved files. Initially this is
   placeholder content with cross-references back to
   existing OPERATING_MODEL.md / examples/ / etc.; the
   manifest validates structurally.
5. Populate `spec-bundle/decisions/` with the first
   ADR-style entries (the framework's own decisions
   inventory).
6. Update `scripts/lint-spec.sh` to recognize the new
   manifest as a valid lint target.
7. Update `.github/workflows/ci.yml` to add
   `validate-manifest` as a CI job.
8. Update `README.md` + `AGENTS.md` to point to the new
   `spec-bundle/` as the methodology artefact entry.
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
# Parse primary field per facet — look for two-space-indented "primary:".
current_facet=""
while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
        current_facet="${BASH_REMATCH[1]}"
    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
        primary="${BASH_REMATCH[1]}"
        # Strip trailing quote if any.
        primary="${primary%\"}"
        # Primary may be a file or a directory (e.g., behavior/features/).
        if [[ "$primary" == */ ]]; then
            if [ ! -d "$BUNDLE_DIR/$primary" ]; then
                err "facet '$current_facet' primary directory missing: $primary"
            fi
        else
            if [ ! -f "$BUNDLE_DIR/$primary" ]; then
                err "facet '$current_facet' primary file missing: $primary"
            fi
        fi
    elif [[ "$line" =~ ^[a-z_-] ]]; then
        current_facet=""
    fi
done < "$MANIFEST"

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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' scripts/fleet-sync.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
#!/usr/bin/env bash
# fleet-sync.sh — propagate the fleet baseline from the source policy
# repo to a target repo. UNIFORM mode: settings.json, statusline.sh,
# hooks/ are overwritten to fleet baseline. Per-repo permissions live
# in .claude/settings.local.json (gitignored).
#
# IMPORTANT: this script was written for the bes-fleet-policy source
# layout where fleet content lives under `<source>/agents/...`. The
# agentic-ops-framework v2.0 layout (this repo) does NOT have an
# `agents/` directory at the top level — its content lives under
# `spec-bundle/...`. Running this script with FLEET_SOURCE pointing
# at agentic-ops-framework v2.0 WILL FAIL: file copies of the form
# `$SOURCE/agents/$f` resolve to non-existent paths.
#
# Adopters of agentic-ops-framework v2.0 who want to operate a fleet
# should EITHER:
#   1. Establish a separate source-policy repo (bes-fleet-policy
#      style) with `agents/` layout, and use this script from there,
#      OR
#   2. Author their own v2.0-layout-aware propagation script that
#      reads from `<source>/spec-bundle/skills/`, `<source>/scripts/`,
#      etc. (a follow-on Task SPEC under v2.x will produce this
#      v2.0-native fleet-sync; not yet authored).
#
# This script is bundled in v2.0 as the reference implementation of
# the bes-fleet-policy-layout propagation pattern. It is intentionally
# preserved unchanged in its source-layout assumptions; the v2.0
# fleet-sync replacement is queued as a v2.x slice.
#
# Topology is manifest-driven. The manifest files (with the prefix
# determined at runtime per below):
#   fleet-files.txt          — .agents/ content paths
#   fleet-skills.txt         — skill names (mirrored to .claude/skills/)
#   fleet-commands.txt       — slash-command names
#   fleet-hooks.txt          — hook script names
#   fleet-hook-fixtures.txt  — hook test fixtures
#   fleet-oss-gitignore.txt  — OSS-posture .gitignore entries
#
# Usage: fleet-sync.sh <target-repo-absolute-path> <internal|oss>
#   internal: full fleet baseline; .agents/ + .claude/ committed.
#   oss:      .agents/ and .claude/ are gitignored (public OSS posture);
#             content lays in working tree only.
#
# Source location: auto-derived from script path. Override with FLEET_SOURCE env.
# Manifest dir:    auto-detected from FLEET_MANIFEST_DIR env, or
#                  agents/scripts/ if present, else scripts/.

set -eu

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
SOURCE="${FLEET_SOURCE:-$(cd "$SCRIPT_DIR/../.." && pwd)}"
TARGET="${1:?target repo path required}"
POSTURE="${2:?posture required (internal|oss)}"
case "$POSTURE" in internal|oss) ;; *) echo "posture must be internal|oss" >&2; exit 64 ;; esac

# Refuse to run against a source that does not have the expected
# bes-fleet-policy-style `agents/` layout. This refusal is the
# v2.0-layout-detection guard the codex review (finding 3.4) flagged
# was missing: previously the script would silently fail mid-copy.
if [ ! -d "$SOURCE/agents/scripts" ] || [ ! -f "$SOURCE/agents/scripts/fleet-skills.txt" ]; then
    echo "fleet-sync: source layout not recognised." >&2
    echo "  Expected: \$SOURCE/agents/scripts/fleet-skills.txt at $SOURCE/agents/scripts/fleet-skills.txt" >&2
    echo "  This script propagates from a bes-fleet-policy-style source." >&2
    echo "  If you are running it against an agentic-ops-framework v2.0" >&2
    echo "  source, switch to a separate source-policy repo (see script" >&2
    echo "  header) or wait for the v2.0-native propagation slice." >&2
    exit 65
fi
MANIFEST_DIR="$SOURCE/agents/scripts"

# Read a manifest file into a bash array.
# Strips blank lines and comments (# prefix).
read_manifest() {
    local file="$1"
    local -n out_array="$2"
    out_array=()
    [ -f "$file" ] || { echo "manifest not found: $file" >&2; exit 65; }
    while IFS= read -r line; do
        # skip blanks + comments
        case "$line" in ''|'#'*) continue ;; esac
        out_array+=("$line")
    done < "$file"
}

read_manifest "$MANIFEST_DIR/fleet-skills.txt" SKILLS
read_manifest "$MANIFEST_DIR/fleet-commands.txt" COMMANDS
read_manifest "$MANIFEST_DIR/fleet-hooks.txt" HOOKS
read_manifest "$MANIFEST_DIR/fleet-hook-fixtures.txt" HOOK_FIXTURES
read_manifest "$MANIFEST_DIR/fleet-oss-gitignore.txt" OSS_GITIGNORE

echo "=== fleet-sync to $TARGET (posture=$POSTURE) ==="

# Ensure target dirs
mkdir -p "$TARGET/.agents/skills" "$TARGET/.agents/workflows" "$TARGET/.agents/scripts/lint-spec-fixtures" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/good-internal" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/bad-no-agents-md" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/bad-claude-md-no-import" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/edge-leading-whitespace-import" "$TARGET/.agents/specs" "$TARGET/.agents/mcp" "$TARGET/.agents/templates" "$TARGET/.agents/githooks" "$TARGET/.agents/fleet-directives" "$TARGET/.githooks"
for skill in "${SKILLS[@]}"; do
    mkdir -p "$TARGET/.agents/skills/$skill"
done
mkdir -p "$TARGET/.claude/commands" "$TARGET/.claude/scripts" "$TARGET/.claude/skills" "$TARGET/.claude/hooks/tests"
for skill in "${SKILLS[@]}"; do
    mkdir -p "$TARGET/.claude/skills/$skill"
done

# .agents/ (canonical fleet content list — manifest-driven). Auto-create
# parent directories so skill-local references/ subdirs propagate without
# extra mkdir loops.
while IFS= read -r f; do
    [ -z "$f" ] && continue
    case "$f" in '#'*) continue ;; esac
    mkdir -p "$(dirname "$TARGET/.agents/$f")"
    cp "$SOURCE/agents/$f" "$TARGET/.agents/$f"
done < "$SOURCE/agents/scripts/fleet-files.txt"
# chmod +x every .sh propagated to .agents/scripts/ (idempotent).
find "$TARGET/.agents/scripts" -maxdepth 1 -name '*.sh' -type f -exec chmod +x {} +

# If a fleet-baseline commit-msg hook is part of your propagated content
# (under .agents/githooks/commit-msg), deploy it to the repo's .githooks/
# and set core.hooksPath. Skip silently when not present.
if [ -f "$TARGET/.agents/githooks/commit-msg" ]; then
    chmod +x "$TARGET/.agents/githooks/commit-msg"
    cp "$TARGET/.agents/githooks/commit-msg" "$TARGET/.githooks/commit-msg"
    chmod +x "$TARGET/.githooks/commit-msg"
    git -C "$TARGET" config core.hooksPath .githooks
fi

# If a per-tool config template is propagated under .agents/templates/
# (e.g., a parallel-worktree tool's project config), deploy it to the
# repo's .config/ directory. Skip silently when not present.
mkdir -p "$TARGET/.config"
if [ -f "$TARGET/.agents/templates/wt.toml.template" ]; then
    cp "$TARGET/.agents/templates/wt.toml.template" "$TARGET/.config/wt.toml"
fi

# Bootstrap SESSION_JOURNAL.md and AGENT_FEEDBACK.md from templates if absent.
# Never overwrite — these accumulate per-repo content that is owner+agent
# history, not fleet content. fleet-sync only seeds the empty file.
if [ ! -f "$TARGET/SESSION_JOURNAL.md" ]; then
    cp "$TARGET/.agents/templates/SESSION_JOURNAL.template.md" "$TARGET/SESSION_JOURNAL.md"
fi
if [ ! -f "$TARGET/AGENT_FEEDBACK.md" ]; then
    cp "$TARGET/.agents/templates/AGENT_FEEDBACK.template.md" "$TARGET/AGENT_FEEDBACK.md"
fi
if [ ! -f "$TARGET/AGENT_INBOX.md" ]; then
    cp "$TARGET/.agents/templates/AGENT_INBOX.template.md" "$TARGET/AGENT_INBOX.md"
fi

# Re-compose <repo>/WORKFLOW.md from existing YAML + per-repo intro + current
# fleet body. Skip when WORKFLOW.md lacks YAML front matter (studio root /
# policy repo use studio-shape docs, not the dispatcher template). The
# fleet body sentinel "Fleet-baseline WORKFLOW.md prompt body." marks where
# the per-repo intro ends and the canonical body begins.
if [ -f "$TARGET/WORKFLOW.md" ]; then
    if head -1 "$TARGET/WORKFLOW.md" | grep -q '^---$'; then
        SOURCE_BODY="$TARGET/.agents/templates/WORKFLOW.body.md"
        if [ -f "$SOURCE_BODY" ]; then
            yaml=$(awk 'BEGIN{c=0} /^---$/{c++; print; if(c==2) exit; next} c==1{print}' "$TARGET/WORKFLOW.md")
            intro=$(awk '
                BEGIN{c=0; past_yaml=0}
                /^---$/{c++; if(c==2){past_yaml=1; next}; next}
                past_yaml && /^<!--$/{
                    getline next_line
                    if (next_line ~ /^Fleet-baseline WORKFLOW\.md prompt body\./){
                        exit
                    }
                    print
                    print next_line
                    next
                }
                past_yaml{print}
            ' "$TARGET/WORKFLOW.md")
            {
                printf '%s\n\n' "$yaml"
                printf '%s' "$intro"
                printf '\n'
                cat "$SOURCE_BODY"
            } > "$TARGET/WORKFLOW.md.new"
            mv "$TARGET/WORKFLOW.md.new" "$TARGET/WORKFLOW.md"
        fi
    fi
fi

# Remove deprecated SPEC.template.md if present
if git -C "$TARGET" ls-files --error-unmatch .agents/specs/SPEC.template.md >/dev/null 2>&1; then
    git -C "$TARGET" rm -q .agents/specs/SPEC.template.md
elif [ -f "$TARGET/.agents/specs/SPEC.template.md" ]; then
    rm "$TARGET/.agents/specs/SPEC.template.md"
fi

# .claude/ commands
for cmd in "${COMMANDS[@]}"; do
    cp "$SOURCE/.claude/commands/$cmd.md" "$TARGET/.claude/commands/$cmd.md"
done

# .claude/ skills (mirrored from agents/skills/). Mirror SKILL.md plus
# any skill-local references/ subdir so progressive-disclosure references
# resolve correctly in the Claude harness.
for skill in "${SKILLS[@]}"; do
    cp "$SOURCE/agents/skills/$skill/SKILL.md" "$TARGET/.claude/skills/$skill/SKILL.md"
    if [ -d "$SOURCE/agents/skills/$skill/references" ]; then
        mkdir -p "$TARGET/.claude/skills/$skill/references"
        cp "$SOURCE/agents/skills/$skill/references/"*.md "$TARGET/.claude/skills/$skill/references/"
    fi
done

# .claude/ hooks + tests
for h in "${HOOKS[@]}"; do
    cp "$SOURCE/.claude/hooks/$h" "$TARGET/.claude/hooks/$h"
    chmod +x "$TARGET/.claude/hooks/$h"
done
cp "$SOURCE/.claude/hooks/tests/run-tests.sh" "$TARGET/.claude/hooks/tests/run-tests.sh"
chmod +x "$TARGET/.claude/hooks/tests/run-tests.sh"
mkdir -p "$TARGET/.claude/hooks/tests/fixtures"
for fixture in "${HOOK_FIXTURES[@]}"; do
    cp "$SOURCE/.claude/hooks/tests/fixtures/$fixture" "$TARGET/.claude/hooks/tests/fixtures/$fixture"
done

# .claude/ settings.json + statusline.sh (UNIFORM: overwrite)
cp "$SOURCE/.claude/settings.json" "$TARGET/.claude/settings.json"
cp "$SOURCE/.claude/scripts/statusline.sh" "$TARGET/.claude/scripts/statusline.sh"
chmod +x "$TARGET/.claude/scripts/statusline.sh"

# OSS posture: ensure .gitignore excludes the configured entries
# (agent-control content + root-level fleet workpads). Per OPERATING_MODEL
# "Public OSS posture".
if [ "$POSTURE" = "oss" ]; then
    for entry in "${OSS_GITIGNORE[@]}"; do
        if ! grep -qE "^${entry%/}/?\$" "$TARGET/.gitignore" 2>/dev/null; then
            printf '\n%s\n' "$entry" >> "$TARGET/.gitignore"
        fi
    done
fi

# Stage explicitly (internal repos only)
if [ "$POSTURE" = "internal" ]; then
    STAGE=()
    while IFS= read -r f; do
        [ -z "$f" ] && continue
        case "$f" in '#'*) continue ;; esac
        STAGE+=(".agents/$f")
    done < "$SOURCE/agents/scripts/fleet-files.txt"
    for cmd in "${COMMANDS[@]}"; do
        STAGE+=(".claude/commands/$cmd.md")
    done
    for skill in "${SKILLS[@]}"; do
        STAGE+=(".claude/skills/$skill/SKILL.md")
        if [ -d "$TARGET/.claude/skills/$skill/references" ]; then
            while IFS= read -r ref; do
                STAGE+=("$ref")
            done < <(cd "$TARGET" && find ".claude/skills/$skill/references" -type f -name '*.md')
        fi
    done
    for h in "${HOOKS[@]}"; do
        STAGE+=(".claude/hooks/$h")
    done
    STAGE+=(".claude/hooks/tests/run-tests.sh")
    for fixture in "${HOOK_FIXTURES[@]}"; do
        STAGE+=(".claude/hooks/tests/fixtures/$fixture")
    done
    STAGE+=(".claude/settings.json" ".claude/scripts/statusline.sh" ".githooks/commit-msg" ".config/wt.toml")
    # Stage WORKFLOW.md if the target uses the dispatcher YAML+body shape
    # (per-repo intro preserved, body re-composed above).

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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
session id: 019e3e5a-27b8-7a72-a137-905c977e0336
--------
user
Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (Contract SPEC, status: verified) plus the actual v2.0 reorganization landed at commit 5f59f7b (v2.0.0 tagged). The SPEC governs reorganization of agentic-ops-framework from v1.1 single-tree into v2.0 manifest+catalog packaging. Read the SPEC, spec-bundle/manifest.yaml, the 8 facet primary files (architecture/CONTEXT.md, deployment/install.md, behavior/features/, customization/contract.md, decisions/INDEX.md, quality/requirements.md, operations/failures.md, non-goals/INDEX.md), and the validate-manifest.sh script. Look for: (1) facet-set completeness — what does gpt-5.5 think is missing or wrongly grouped? (2) manifest schema gaps — what fields should exist but don't (e.g. SBOM ref, schema URI, content-hash)? (3) v1.1->v2.0 migration index incompleteness — are there cross-reference paths inside artefacts that still point at old locations? (4) the 'scaffold-grade content reserved for v2.x' framing — is that honest or fig-leaf? (5) validate-manifest.sh false-positives/negatives. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
codex
I’ll keep this read-only and treat it as a quality-gate review. First I’m going to orient on the declared authority files and the target SPEC, then I’ll inspect the manifest/facets/script and search for migration-path drift.
  → Orient on authority files and target commit state
  • Read SPEC, manifest, facet files, and validator
  • Search for v1.1 path drift and migration gaps
  • Assess validator false positives/negatives
  • Produce structured quality gate findings
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git rev-parse --show-toplevel HEAD && git tag --points-at HEAD && git show -s --format='%H%n%s%n%ci' 5f59f7b" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-ops-framework
5f59f7b9d0b33c82c46a727574a81c645a33e823
v2.0.0
5f59f7b9d0b33c82c46a727574a81c645a33e823
spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled
2026-05-18 20:20:36 -0700

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files | sort | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
AGENTS.md
CHANGELOG.md
CLAUDE.md
CODE_OF_CONDUCT.md
CONTRIBUTING.md
LICENSE
OPERATING_MODEL.md
README.md
examples/README.md
examples/contract-webhook-signing/IDEA.md
examples/contract-webhook-signing/SPEC.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md
examples/decision-conventional-commits/IDEA.md
examples/decision-conventional-commits/SPEC.md
examples/fastpath-fix-readme-typo/SPEC.md
examples/task-add-structured-logging/IDEA.md
examples/task-add-structured-logging/SPEC.md
hooks/block-ai-attribution.sh
hooks/block-edit-on-main.sh
hooks/block-git-add-all.sh
hooks/block-push-to-main.sh
hooks/block-verify-bypass.sh
hooks/session-start-context.sh
hooks/verify-reminder.sh
scripts/audit-entry-docs.sh
scripts/audit-fleet-compliance.sh
scripts/fleet-commands.example.txt
scripts/fleet-files.example.txt
scripts/fleet-hook-fixtures.example.txt
scripts/fleet-hooks.example.txt
scripts/fleet-internal-repos.example.txt
scripts/fleet-known-repos.txt
scripts/fleet-local-only-repos.example.txt
scripts/fleet-oss-gitignore.example.txt
scripts/fleet-oss-repos.example.txt
scripts/fleet-skills.example.txt
scripts/fleet-sync.sh
scripts/lint-spec.sh
scripts/preflight-config.example.json
scripts/preflight.mjs
scripts/send-fleet-message.sh
scripts/validate-manifest.sh
scripts/validate-skill-frontmatter.sh
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
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md
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
spec-bundle/skills/spec-authoring/references/reference-architecture.md
spec-bundle/skills/spec-authoring/references/studio-principles.md
spec-bundle/skills/spec-driven-development/SKILL.md
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md
spec-bundle/skills/spec-evidence-governance/SKILL.md
spec-bundle/skills/spec-review/SKILL.md
spec-bundle/skills/spec-review/references/per-type-gates.md
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
specs/2026-05-18-v1.0-release-foundations/SPEC.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
tests/hooks/fixtures/msg-clean.txt
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/run-tests.sh

codex
The repo is clean on `main` at `5f59f7b9…`, and `v2.0.0` points at that commit. I’m reading the spec bundle and lifecycle/schema docs now so the findings are grounded in the repo’s own contract rather than expectations imported from elsewhere.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba OPERATING_MODEL.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Operating Model
     2	
     3	The operating model the framework encodes. This document is the
     4	high-level overview; the schema, templates, lint, and hooks are the
     5	machine-enforced surface.
     6	
     7	## Lifecycle
     8	
     9	Non-trivial agent work follows thirteen phases:
    10	
    11	1. **Preflight** — confirm the repo + workspace state is sane
    12	   (workspace layout, hooks installed, MCP config sane).
    13	2. **Orient** — read the entry docs, status, and any active
    14	   spec; build a citable map of the work surface.
    15	3. **Predict** — name the known-likely failure modes and the
    16	   ambiguous owner intent up front.
    17	4. **Ideate** — produce `IDEA.md` capturing problem, substance,
    18	   constraints, approaches considered, recommendation, and any
    19	   owner-blocking open questions.
    20	5. **Author** — produce `SPEC.md` from a ready-for-spec IDEA,
    21	   selecting the type (task / contract / decision) by the
    22	   implied shape; fastpath is a separate type for trivial
    23	   reversible work.
    24	6. **Review** (BLOCKING) — run the per-type quality gate
    25	   (`lint-spec.sh`) and structured review against bar criteria.
    26	   Outcome: `needs-revision` or `approved-pending-owner`.
    27	7. **Approve** — owner alone sets `approved`. Skills MUST NOT.
    28	8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
    29	   emit per-slice `TASK.md` artefacts. Each TASK.md pins
    30	   `model_route`, `cross_validation_lane` (different family
    31	   REQUIRED), and `verification_lane`. Owner alone flips
    32	   `approved → decomposed`.
    33	9. **Dispatch** — TASK.md artefacts feed your tracker / dispatch
    34	   runtime. The framework doesn't dictate the runtime.
    35	10. **Execute** — bounded implementation from an approved
    36	    (and decomposed) spec.
    37	11. **Cross-validate** (BLOCKING per task) — review on a model
    38	    family different from the implementer. No exceptions.
    39	12. **Verify** — run acceptance commands; fill the Completion
    40	    Report; status moves to `verified`.
    41	13. **Report + close** — owner alone sets `closed` after a
    42	    spec-evidence-governance pass on durable lessons.
    43	
    44	## Agent roles
    45	
    46	Most non-trivial work passes through five roles. One agent MAY
    47	fill more than one role across a session; an agent MUST NOT
    48	fill conflicting roles within a single artefact.
    49	
    50	- **Planner** — writes IDEA / SPEC from project facts and owner
    51	  intent. Bounded by the citation grammar.
    52	- **Spec reviewer** — runs the BLOCKING per-type quality gate.
    53	  Rejects ambiguity, unsafe assumptions, and missing tests.
    54	  Sets `needs-revision` or `approved-pending-owner`; never
    55	  `approved`.
    56	- **Executor** — edits code, configs, and directly-coupled
    57	  tests/docs inside the approved scope. Reports scope drift
    58	  rather than silently absorbing it.
    59	- **Verifier** — runs acceptance commands and inspects diffs.
    60	  Records fresh evidence. Cross-family verifier MUST run on a
    61	  different model family from the executor for behavioral
    62	  verification.
    63	- **Archivist** — promotes durable lessons from completed work
    64	  into spec evidence, backlog proposals, or operating-model
    65	  amendments. Emits candidates; does not set `closed` on parent
    66	  SPECs.
    67	
    68	## Spec types
    69	
    70	| Type | When |
    71	|---|---|
    72	| `task` | Concrete, scoped, verifiable work with a defined endpoint. Default when in doubt and the work is small. |
    73	| `contract` | Stateful, multi-component, protocol-defining work. Lint required. |
    74	| `decision` | Binding choice between named options. RFC 2119 keywords appear only in the Decision Statement section. |
    75	| `fastpath` | Owner-directed trivial reversible work. One file, ≤50 lines, no public-contract impact. Lands at `status: closed` in the same commit as the work. No IDEA, no review gate, no decomposition. |
    76	
    77	Capture-after exception (`status: verified` directly under
    78	explicit decision-authority directive) is documented in the
    79	schema for cases where work shipped before the spec was
    80	authored.
    81	
    82	## Workspace policy
    83	
    84	- Use a separate branch or worktree for parallel write-capable
    85	  agents. Multiple writers MUST NOT edit the same files
    86	  concurrently without a worktree boundary.
    87	- Stage files explicitly. The fleet-baseline hook rejects
    88	  `git add .` and `git add -A`. Bulk staging quietly captures
    89	  unrelated work and is a recurring source of failed reviews.
    90	- Keep generated scratch, machine-local caches, and personal
    91	  credentials out of tracked source. `.mcp.json` is machine-
    92	  local and gitignored; the framework ships with no active
    93	  MCP servers by default.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"3\\.[1-6]|Finding|BLOCKER|Major|Minor|file://|url://github.com|Quality Gate\" ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (Contract SPEC, status: verified) plus the actual v2.0 reorganization landed at commit 5f59f7b (v2.0.0 tagged). The SPEC governs reorganization of agentic-ops-framework from v1.1 single-tree into v2.0 manifest+catalog packaging. Read the SPEC, spec-bundle/manifest.yaml, the 8 facet primary files (architecture/CONTEXT.md, deployment/install.md, behavior/features/, customization/contract.md, decisions/INDEX.md, quality/requirements.md, operations/failures.md, non-goals/INDEX.md), and the validate-manifest.sh script. Look for: (1) facet-set completeness — what does gpt-5.5 think is missing or wrongly grouped? (2) manifest schema gaps — what fields should exist but don't (e.g. SBOM ref, schema URI, content-hash)? (3) v1.1->v2.0 migration index incompleteness — are there cross-reference paths inside artefacts that still point at old locations? (4) the 'scaffold-grade content reserved for v2.x' framing — is that honest or fig-leaf? (5) validate-manifest.sh false-positives/negatives. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
254:   107	| `file://` | Repository path. The most common cite. |
365:   218	Findings are recorded in the workpad; the implementer addresses
622:   211	| `file://` | `file://<repo-relative-or-absolute-path>` | MAY include `#<line>` or `§<section>` suffix; path MUST exist at the cited commit |
624:   213	| `url://` | `url://<full-url>` | surrounding prose MUST include fetch-date, OR pair with a `file://` cache reference |
630:   219	Repo-relative `file://` paths are RECOMMENDED. Absolute paths are
721:    46	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
727:    52	(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
729:    54	`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
748:    73	  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
843:   168	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
847:   172	  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
850:   175	- `file://schema/SPEC.schema.md` — citation grammar,
855:   180	- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
857:   182	- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
859:   184	- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
861:   186	- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
863:   188	- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
865:   190	- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
867:   192	- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
869:   194	- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
871:   196	- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
873:   198	- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
878:   203	- `file://CHANGELOG.md` v1.0 / v1.1 entries — describe
914:   239	(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
993:   318	  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
1003:   328	   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
1023:     4	(`file://../../research/primary-sources/arc42.md` §3) and
1025:     6	(`file://../../research/primary-sources/c4-model.md` §3),
1031:    12	`research/primary-sources/`. Cross-repo `file://` paths in
1043:    24	  (`file://../schema/SPEC.schema.md`).
1045:    26	  `file://../templates/`.
1046:    27	- A lint script (`file://../../scripts/lint-spec.sh`) that
1048:    29	- A skill catalog (`file://../skills/`) covering the
1050:    31	- Seven PreToolUse hooks (`file://../../hooks/`) enforcing
1054:    35	  (`file://../../tests/hooks/run-tests.sh`).
1056:    37	  (`file://../../examples/`).
1057:    38	- A CI workflow (`file://../../.github/workflows/ci.yml`)
1095:    76	  (`file://../../research/primary-sources/symphony-spec.md`
1112:   344	  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
1116:   348	  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
1119:   351	  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
1123:   355	  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
1133:   365	  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
1144:   376	  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
1149:   381	  OpenAPI 3.1.0
1150:   382	  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
1163:   395	  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
1173:   405	`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
1190:   422	Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
1197:   429	  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
1205:   437	  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
1275:   507	   broken file:// paths).
1443:   675	  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
1601:     4	# Authority: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
2015:   925	  under specs/ that referenced `file://schema/...`,
2016:   926	  `file://templates/...`, `file://skills/...` paths
2018:   928	  lint script does not validate file:// paths deeply,
2132:    32	#    file://../skills/agents-md-improver/SKILL.md
2145:    45	(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
2146:    46	`file://../skills/cross-repo-informational-channel/SKILL.md`)
2152:    52	`file://../../scripts/fleet-*.example.txt` show the shape.
2158:    58	`url://github.com/buildepicshit/agentic-installation-methodology`
2228:     3	  (file://../../../research/primary-sources/cucumber-gherkin.md §3)
2230:     5	  file://../../schema/SPEC.schema.md §2.
2244:    19	    Given a SPEC.md whose §1 Problem cites a `file://` source
2265:     3	The novel facet per research §4.1 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
2268:     6	(`file://../../research/primary-sources/helm-values-schema.md`
2281:    19	  (`file://../templates/`).
2282:    20	- The schema's citation grammar (`file://`, `cmd://`,
2286:    24	  (`file://../schema/SPEC.schema.md` §2, §3).
2373:   111	(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
2427:     4	template (`file://../../research/primary-sources/adr-nygard.md`
2449:    26	`file://../../specs/`).
2454:    31	  (`file://../../research/primary-sources/adr-nygard.md`
2459:    36	  (`file://../../research/primary-sources/adr-tools-state.md`
2471:     4	(`file://../../research/primary-sources/arc42.md` §3) and
2489:    22	prefix (`file://`, `cmd://`, `url://`, `owner://`,
2564:    97	visible in the Quality Gate Result; external review
2586:   119	  `file://../../research/primary-sources/12-factor.md` §3.
2597:     5	(`file://../../research/primary-sources/symphony-spec.md`
2658:    66	**Trigger**: an artefact's `file://X` reference points
2743:     3	The second novel facet per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
2760:    20	  `file://../../research/primary-sources/c4-model.md` §3.
2852:   112	Per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
2905:     5	  "description": "JSON Schema defining the customization knobs the framework defers to the adopter. Authority: file://../../specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md §6.2.4 and file://contract.md.",
3057:     4	(`file://../../research/primary-sources/arc42.md` §3).
3114:    61	`file://../../research/primary-sources/arc42.md` §3):
3132:    79	`file://../../research/primary-sources/c4-model.md` §3),
3467:   105	  and training are inputs to reasoning; only `file://` / `cmd://` /
3621:    92	- `file://<path>` — repo-local files.
3712:     4	(`file://../../research/primary-sources/12-factor.md` §3):
3740:    32	  (`file://../../research/primary-sources/symphony-spec.md` §3).
3757:    49	products (`file://../../research/primary-sources/nix-flakes.md`
3767:     4	(`file://../../research/primary-sources/symphony-spec.md`
3834:    71	(`file://../../research/primary-sources/symphony-spec.md`
3924:   161	(`file://../../research/primary-sources/12-factor.md`
4247:     4	# Authority: file://OPERATING_MODEL.md §"Spec Lifecycle" and
4248:     5	#   file://templates/SPEC.schema.md (citation grammar, RFC 2119
4383:   140	        # file://specs/<id>/IDEA.md cite in §1 or §13 passes lint by
4506:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"(file://)?(schema/SPEC\\.schema\\.md|templates/|skills/|workflow/UNIVERSAL\\.md|workpads/)\" --glob '"'!spec-bundle/schema/SPEC.schema.md'"' --glob '"'!spec-bundle/templates/**'"' --glob '"'!spec-bundle/skills/**'"' --glob '"'!spec-bundle/operations/workflow-universal.md'"'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
4547:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:175:- `file://schema/SPEC.schema.md` — citation grammar,
4577:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:926:  `file://templates/...`, `file://skills/...` paths
4579:spec-bundle/customization/contract.md:19:  (`file://../templates/`).
4580:spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
4582:spec-bundle/customization/contract.md:111:(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
4583:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:83:execution per `file://workflow/UNIVERSAL.md` "Universal
4584:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:155:journal per `file://workflow/UNIVERSAL.md` Step 1.
4586:spec-bundle/deployment/install.md:32:#    file://../skills/agents-md-improver/SKILL.md
4587:spec-bundle/deployment/install.md:45:(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
4588:spec-bundle/deployment/install.md:46:`file://../skills/cross-repo-informational-channel/SKILL.md`)
4589:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:80:execution per `file://workflow/UNIVERSAL.md` "Universal
4590:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:158:journal per `file://workflow/UNIVERSAL.md` Step 1.
4592:spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.
4594:spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
4595:spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
4596:spec-bundle/architecture/CONTEXT.md:29:- A skill catalog (`file://../skills/`) covering the
4626:scripts/send-fleet-message.sh:16:#   file://skills/cross-repo-informational-channel/SKILL.md
4627:scripts/send-fleet-message.sh:17:#   file://skills/cross-repo-informational-channel/SKILL.md
4628:scripts/send-fleet-message.sh:18:#   file://workpads/AGENT_INBOX.template.md
4630:scripts/audit-fleet-compliance.sh:12:#   file://skills/cross-repo-policy-enforcement/SKILL.md
4631:scripts/audit-entry-docs.sh:15:#   file://agents/skills/agents-md-improver/SKILL.md (policy doc)
4637:scripts/lint-spec.sh:5:#   file://templates/SPEC.schema.md (citation grammar, RFC 2119
4640:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"file://(\\.\\./\\.\\./)?research/primary-sources|research/primary-sources\" spec-bundle specs AGENTS.md README.md CHANGELOG.md OPERATING_MODEL.md scripts hooks tests examples | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
4646:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:52:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
4647:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:54:`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
4648:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:73:  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
4649:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:180:- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
4650:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:182:- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
4651:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:184:- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
4652:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:186:- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
4653:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:188:- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
4654:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:190:- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
4655:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:192:- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
4656:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:194:- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
4657:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:196:- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
4658:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:198:- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
4659:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:239:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
4660:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:318:  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
4661:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:328:   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
4662:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:344:  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
4663:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:348:  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
4664:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:351:  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
4665:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:355:  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
4666:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:365:  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
4667:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:376:  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
4668:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:382:  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
4669:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:395:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
4670:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:405:`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
4671:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:422:Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
4672:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:429:  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
4673:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:437:  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
4674:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:675:  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
4675:spec-bundle/non-goals/INDEX.md:3:The second novel facet per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
4676:spec-bundle/non-goals/INDEX.md:20:  `file://../../research/primary-sources/c4-model.md` §3.
4677:spec-bundle/non-goals/INDEX.md:112:Per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
4678:spec-bundle/customization/contract.md:3:The novel facet per research §4.1 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
4679:spec-bundle/customization/contract.md:6:(`file://../../research/primary-sources/helm-values-schema.md`
4680:spec-bundle/quality/12-factor-overlay.md:4:(`file://../../research/primary-sources/12-factor.md`
4681:spec-bundle/quality/requirements.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
4682:spec-bundle/quality/requirements.md:119:  `file://../../research/primary-sources/12-factor.md` §3.
4683:spec-bundle/operations/safety-invariants.md:4:(`file://../../research/primary-sources/symphony-spec.md`
4684:spec-bundle/operations/failures.md:5:(`file://../../research/primary-sources/symphony-spec.md`
4685:spec-bundle/decisions/INDEX.md:4:template (`file://../../research/primary-sources/adr-nygard.md`
4686:spec-bundle/decisions/INDEX.md:31:  (`file://../../research/primary-sources/adr-nygard.md`
4687:spec-bundle/decisions/INDEX.md:36:  (`file://../../research/primary-sources/adr-tools-state.md`
4688:spec-bundle/behavior/features/lint-citation-grammar.feature:3:  (file://../../../research/primary-sources/cucumber-gherkin.md §3)
4689:spec-bundle/operations/observability.md:4:(`file://../../research/primary-sources/symphony-spec.md`
4690:spec-bundle/architecture/solution-strategy.md:4:(`file://../../research/primary-sources/arc42.md` §3).
4691:spec-bundle/architecture/solution-strategy.md:61:`file://../../research/primary-sources/arc42.md` §3):
4692:spec-bundle/architecture/solution-strategy.md:79:`file://../../research/primary-sources/c4-model.md` §3),
4693:spec-bundle/deployment/requirements.md:4:(`file://../../research/primary-sources/12-factor.md` §3):
4694:spec-bundle/deployment/requirements.md:32:  (`file://../../research/primary-sources/symphony-spec.md` §3).
4695:spec-bundle/deployment/requirements.md:49:products (`file://../../research/primary-sources/nix-flakes.md`
4696:spec-bundle/architecture/CONTEXT.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
4697:spec-bundle/architecture/CONTEXT.md:6:(`file://../../research/primary-sources/c4-model.md` §3),
4698:spec-bundle/architecture/CONTEXT.md:12:`research/primary-sources/`. Cross-repo `file://` paths in
4699:spec-bundle/architecture/CONTEXT.md:76:  (`file://../../research/primary-sources/symphony-spec.md`
4843:    56	prefix from the grammar (`file://`, `cmd://`, `url://`,
4895:    60	- `file://examples/contract-webhook-signing/SPEC.md` (the
4897:    62	- `file://examples/contract-webhook-signing/IDEA.md` §3
4900:    65	- `file://OPERATING_MODEL.md` "Cross-family review" (for the
4903:    68	### 3.3 Out of scope
4915:    80	execution per `file://workflow/UNIVERSAL.md` "Universal
4949:   158	journal per `file://workflow/UNIVERSAL.md` Step 1.
4957:    63	- `file://examples/contract-webhook-signing/SPEC.md` (the
4958:    64	  parent SPEC; §§3.1, 6.3, 7.2, 10, 16).
4959:    65	- `file://examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md`
4962:    68	- `file://OPERATING_MODEL.md` "Cross-family review".
4964:    70	### 3.3 Out of scope
4977:    83	execution per `file://workflow/UNIVERSAL.md` "Universal
5005:   155	journal per `file://workflow/UNIVERSAL.md` Step 1.
5025:    16	#   file://skills/cross-repo-informational-channel/SKILL.md
5026:    17	#   file://skills/cross-repo-informational-channel/SKILL.md
5027:    18	#   file://workpads/AGENT_INBOX.template.md
5056:    47	  Authority: your-policy-repo@<sha> | file://... | owner://transcript-<date>
5333:    12	#   file://skills/cross-repo-policy-enforcement/SKILL.md
5334:    13	#   file://docs/fleet-directives.md
5420:    15	#   file://agents/skills/agents-md-improver/SKILL.md (policy doc)
5696:../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:152:- `file://../../schema/SPEC.schema.md` — citation
5708:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:135:- `file://schema/SPEC.schema.md` — citation grammar,
5713:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:177:| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
5714:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:178:| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
5716:../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:188:| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
5735:../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:40:(`file://schema/SPEC.schema.md` §1.3) so the repo's own SPEC
5736:../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:103:- `file://schema/SPEC.schema.md` §1.3 — capture-after
5769:    25	- Canonical URL: `url://github.com/opencontainers/image-spec/blob/main/spec.md`.
5773:    29	  `url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`
5779:    35	- `cmd://WebFetch url://github.com/opencontainers/image-spec/blob/main/spec.md`
5788:    44	  configuration." (`url://github.com/opencontainers/image-spec/blob/main/spec.md`)
5810:    66	- **OCI Artifacts** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`):
5844:   100	`file://research/primary-sources/oci-artifacts.md §3`):
5975:    95	`file://research/primary-sources/leaddev-agent-compiled.md
6026:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"file://(\\.\\./){2,3}research/primary-sources\" spec-bundle | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
6028:spec-bundle/deployment/requirements.md:4:(`file://../../research/primary-sources/12-factor.md` §3):
6029:spec-bundle/deployment/requirements.md:32:  (`file://../../research/primary-sources/symphony-spec.md` §3).
6030:spec-bundle/deployment/requirements.md:49:products (`file://../../research/primary-sources/nix-flakes.md`
6031:spec-bundle/architecture/solution-strategy.md:4:(`file://../../research/primary-sources/arc42.md` §3).
6032:spec-bundle/architecture/solution-strategy.md:61:`file://../../research/primary-sources/arc42.md` §3):
6033:spec-bundle/architecture/solution-strategy.md:79:`file://../../research/primary-sources/c4-model.md` §3),
6034:spec-bundle/architecture/CONTEXT.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
6035:spec-bundle/architecture/CONTEXT.md:6:(`file://../../research/primary-sources/c4-model.md` §3),
6036:spec-bundle/architecture/CONTEXT.md:76:  (`file://../../research/primary-sources/symphony-spec.md`
6037:spec-bundle/operations/safety-invariants.md:4:(`file://../../research/primary-sources/symphony-spec.md`
6038:spec-bundle/customization/contract.md:3:The novel facet per research §4.1 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
6039:spec-bundle/customization/contract.md:6:(`file://../../research/primary-sources/helm-values-schema.md`
6040:spec-bundle/operations/observability.md:4:(`file://../../research/primary-sources/symphony-spec.md`
6041:spec-bundle/operations/failures.md:5:(`file://../../research/primary-sources/symphony-spec.md`
6042:spec-bundle/quality/12-factor-overlay.md:4:(`file://../../research/primary-sources/12-factor.md`
6043:spec-bundle/quality/requirements.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
6044:spec-bundle/quality/requirements.md:119:  `file://../../research/primary-sources/12-factor.md` §3.
6045:spec-bundle/behavior/features/lint-citation-grammar.feature:3:  (file://../../../research/primary-sources/cucumber-gherkin.md §3)
6046:spec-bundle/decisions/INDEX.md:4:template (`file://../../research/primary-sources/adr-nygard.md`
6047:spec-bundle/decisions/INDEX.md:31:  (`file://../../research/primary-sources/adr-nygard.md`
6048:spec-bundle/decisions/INDEX.md:36:  (`file://../../research/primary-sources/adr-tools-state.md`
6049:spec-bundle/non-goals/INDEX.md:3:The second novel facet per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
6050:spec-bundle/non-goals/INDEX.md:20:  `file://../../research/primary-sources/c4-model.md` §3.
6051:spec-bundle/non-goals/INDEX.md:112:Per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
6059:A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
6061:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n -o 'file://["'^` )'"\\],;]+' spec-bundle README.md AGENTS.md CONTRIBUTING.md OPERATING_MODEL.md examples scripts specs | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
6063:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:46:file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
6064:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:52:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
6065:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:54:file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md
6066:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:73:file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md
6067:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:168:file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
6068:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:172:file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md
6069:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:175:file://schema/SPEC.schema.md
6070:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:180:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
6071:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:182:file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md
6072:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:184:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
6073:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:186:file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md
6074:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:188:file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md
6075:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:190:file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md
6076:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:192:file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md
6077:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:194:file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md
6078:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:196:file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md
6079:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:198:file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md
6080:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:203:file://CHANGELOG.md
6081:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:239:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
6082:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:318:file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md
6083:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:328:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
6084:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:344:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
6085:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:348:file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md
6086:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:351:file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md
6087:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:355:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
6088:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:365:file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md
6089:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:376:file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md
6090:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:382:file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md
6091:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:395:file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md
6092:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:405:file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md
6093:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:422:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
6094:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:429:file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md
6095:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:437:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
6096:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:675:file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md
6097:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:925:file://schema/...
6098:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:926:file://templates/...
6099:specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:926:file://skills/...
6100:specs/2026-05-18-v1.0-release-foundations/SPEC.md:118:file://CHANGELOG.md
6101:specs/2026-05-18-v1.0-release-foundations/SPEC.md:120:file://OPERATING_MODEL.md
6102:scripts/validate-manifest.sh:4:file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
6103:scripts/audit-entry-docs.sh:15:file://agents/skills/agents-md-improver/SKILL.md
6104:scripts/audit-fleet-compliance.sh:12:file://skills/cross-repo-policy-enforcement/SKILL.md
6105:scripts/audit-fleet-compliance.sh:13:file://docs/fleet-directives.md
6106:scripts/send-fleet-message.sh:16:file://skills/cross-repo-informational-channel/SKILL.md
6107:scripts/send-fleet-message.sh:17:file://skills/cross-repo-informational-channel/SKILL.md
6108:scripts/send-fleet-message.sh:18:file://workpads/AGENT_INBOX.template.md
6109:scripts/send-fleet-message.sh:47:file://...
6110:scripts/send-fleet-message.sh:161:file://...
6111:scripts/lint-spec.sh:4:file://OPERATING_MODEL.md
6112:scripts/lint-spec.sh:5:file://templates/SPEC.schema.md
6113:scripts/lint-spec.sh:140:file://specs/<id>/IDEA.md
6114:scripts/lint-spec.sh:369:file://|cmd://|url://|owner://|decision-authority://|judgment://owner|judgment://agent-synthesis
6115:scripts/lint-spec.sh:592:file://'
6116:AGENTS.md:92:file://<path>
6117:examples/fastpath-fix-readme-typo/SPEC.md:28:file://README.md
6118:examples/fastpath-fix-readme-typo/SPEC.md:35:file://README.md
6119:examples/decision-conventional-commits/SPEC.md:33:file://scripts/generate-changelog.sh
6120:examples/decision-conventional-commits/SPEC.md:36:file://docs/release-process.md
6121:examples/decision-conventional-commits/SPEC.md:38:file://docs/release-notes/v2.4.0.md
6122:examples/decision-conventional-commits/SPEC.md:39:file://docs/release-notes/v2.5.1.md
6123:examples/decision-conventional-commits/SPEC.md:57:file://scripts/generate-changelog.sh
6124:examples/decision-conventional-commits/SPEC.md:59:file://examples/decision-conventional-commits/IDEA.md
6125:examples/decision-conventional-commits/SPEC.md:92:file://scripts/generate-changelog.sh
6126:examples/decision-conventional-commits/SPEC.md:218:file://examples/decision-conventional-commits/SPEC.md
6127:examples/decision-conventional-commits/SPEC.md:239:file://scripts/generate-changelog.sh
6128:examples/decision-conventional-commits/SPEC.md:278:file://docs/conventional-commits-hook.example.sh
6129:examples/decision-conventional-commits/IDEA.md:29:file://scripts/generate-changelog.sh
6130:examples/decision-conventional-commits/IDEA.md:33:file://docs/release-process.md
6131:examples/decision-conventional-commits/IDEA.md:38:file://docs/release-notes/v2.4.0.md
6132:examples/decision-conventional-commits/IDEA.md:39:file://docs/release-notes/v2.5.1.md
6133:examples/decision-conventional-commits/IDEA.md:59:file://scripts/generate-changelog.sh
6134:examples/decision-conventional-commits/IDEA.md:61:file://docs/release-process.md
6135:examples/decision-conventional-commits/IDEA.md:63:file://docs/release-notes/v2.4.0.md
6136:examples/decision-conventional-commits/IDEA.md:64:file://docs/release-notes/v2.5.1.md
6137:examples/decision-conventional-commits/IDEA.md:76:file://scripts/generate-changelog.sh
6138:spec-bundle/quality/12-factor-overlay.md:4:file://../../research/primary-sources/12-factor.md
6139:spec-bundle/quality/requirements.md:4:file://../../research/primary-sources/arc42.md
6140:spec-bundle/quality/requirements.md:119:file://../../research/primary-sources/12-factor.md
6141:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:36:file://examples/contract-webhook-signing/SPEC.md
6142:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:63:file://examples/contract-webhook-signing/SPEC.md
6143:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:65:file://examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md
6144:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:68:file://OPERATING_MODEL.md
6145:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:83:file://workflow/UNIVERSAL.md
6146:examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:155:file://workflow/UNIVERSAL.md
6147:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:35:file://examples/contract-webhook-signing/SPEC.md
6148:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:60:file://examples/contract-webhook-signing/SPEC.md
6149:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:62:file://examples/contract-webhook-signing/IDEA.md
6150:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:65:file://OPERATING_MODEL.md
6151:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:80:file://workflow/UNIVERSAL.md
6152:examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:158:file://workflow/UNIVERSAL.md
6153:spec-bundle/decisions/INDEX.md:4:file://../../research/primary-sources/adr-nygard.md
6154:spec-bundle/decisions/INDEX.md:26:file://../../specs/
6155:spec-bundle/decisions/INDEX.md:31:file://../../research/primary-sources/adr-nygard.md
6156:spec-bundle/decisions/INDEX.md:36:file://../../research/primary-sources/adr-tools-state.md
6157:examples/contract-webhook-signing/SPEC.md:32:file://services/webhooks/dispatcher.go
6158:examples/contract-webhook-signing/SPEC.md:33:file://services/webhooks/queue/worker.go
6159:examples/contract-webhook-signing/SPEC.md:38:file://docs/support/recurring-questions.md
6160:examples/contract-webhook-signing/SPEC.md:41:file://services/webhooks/queue/worker.go
6161:examples/contract-webhook-signing/SPEC.md:43:file://docs/compliance/soc2-2025.md
6162:examples/contract-webhook-signing/SPEC.md:84:file://services/webhooks/internal/keystore/keystore.go
6163:examples/contract-webhook-signing/SPEC.md:86:file://services/webhooks/internal/signing/signer.go
6164:examples/contract-webhook-signing/SPEC.md:88:file://services/webhooks/dispatcher.go
6165:examples/contract-webhook-signing/SPEC.md:91:file://docs/webhooks/verifying.md
6166:examples/contract-webhook-signing/SPEC.md:93:file://docs/webhooks/examples/<lang>/verify.<ext>
6167:examples/contract-webhook-signing/SPEC.md:162:file://services/webhooks/dispatcher.go
6168:examples/contract-webhook-signing/SPEC.md:163:file://docs/webhooks/index.md
6169:examples/contract-webhook-signing/SPEC.md:164:file://docs/compliance/soc2-2025.md
6170:examples/contract-webhook-signing/SPEC.md:165:file://services/webhooks/queue/queue.go
6171:examples/contract-webhook-signing/SPEC.md:248:file://docs/webhooks/verifying.md
6172:examples/contract-webhook-signing/SPEC.md:433:file://services/webhooks/dispatcher.go
6173:examples/contract-webhook-signing/SPEC.md:460:file://docs/customer-onboarding.md
6174:examples/contract-webhook-signing/SPEC.md:469:file://services/webhooks/dispatcher.go
6175:examples/contract-webhook-signing/IDEA.md:24:file://services/webhooks/dispatcher.go
6176:examples/contract-webhook-signing/IDEA.md:25:file://services/webhooks/queue/worker.go
6177:examples/contract-webhook-signing/IDEA.md:32:file://docs/support/recurring-questions.md
6178:examples/contract-webhook-signing/IDEA.md:41:file://docs/compliance/soc2-2025.md
6179:examples/contract-webhook-signing/IDEA.md:45:file://services/webhooks/dispatcher.go
6180:examples/contract-webhook-signing/IDEA.md:47:file://services/webhooks/queue/worker.go
6181:examples/contract-webhook-signing/IDEA.md:49:file://services/webhooks/queue/queue.go
6182:examples/contract-webhook-signing/IDEA.md:61:file://docs/compliance/soc2-2025.md
6183:examples/contract-webhook-signing/IDEA.md:62:file://docs/support/recurring-questions.md
6184:spec-bundle/customization/knobs.schema.json:5:file://../../specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
6185:spec-bundle/customization/knobs.schema.json:5:file://contract.md."
6186:spec-bundle/behavior/features/lint-citation-grammar.feature:3:file://../../../research/primary-sources/cucumber-gherkin.md
6187:spec-bundle/behavior/features/lint-citation-grammar.feature:5:file://../../schema/SPEC.schema.md
6188:spec-bundle/non-goals/INDEX.md:3:file://../../research/primary-sources/leaddev-agent-compiled.md
6189:spec-bundle/non-goals/INDEX.md:20:file://../../research/primary-sources/c4-model.md
6190:spec-bundle/non-goals/INDEX.md:112:file://../../research/primary-sources/leaddev-agent-compiled.md
6191:examples/task-add-structured-logging/SPEC.md:34:file://services/auth/handlers/login.go
6192:examples/task-add-structured-logging/SPEC.md:35:file://services/auth/middleware/session.go
6193:examples/task-add-structured-logging/SPEC.md:37:file://docs/oncall/auth-incidents.md
6194:examples/task-add-structured-logging/SPEC.md:40:file://infra/logging/pipeline.yaml
6195:examples/task-add-structured-logging/SPEC.md:64:file://infra/logging/pipeline.yaml
6196:examples/task-add-structured-logging/SPEC.md:82:file://infra/logging/pipeline.yaml
6197:examples/task-add-structured-logging/SPEC.md:84:file://test/load/auth-baseline.k6.js
6198:examples/task-add-structured-logging/SPEC.md:86:file://test/load/auth-baseline.results.json
6199:examples/task-add-structured-logging/SPEC.md:111:file://services/auth/README.md
6200:examples/task-add-structured-logging/SPEC.md:112:file://docs/oncall/auth-incidents.md
6201:examples/task-add-structured-logging/SPEC.md:113:file://infra/logging/pipeline.yaml
6202:examples/task-add-structured-logging/SPEC.md:118:file://services/auth/internal/authlog/authlog.go
6203:examples/task-add-structured-logging/SPEC.md:144:file://services/auth/middleware/logging.go
6204:examples/task-add-structured-logging/SPEC.md:180:file://services/auth/internal/authlog/authlog.go
6205:examples/task-add-structured-logging/SPEC.md:181:file://services/auth/internal/authlog/authlog_test.go
6206:examples/task-add-structured-logging/SPEC.md:182:file://services/auth/middleware/logging.go
6207:examples/task-add-structured-logging/SPEC.md:183:file://services/auth/middleware/logging_test.go
6208:examples/task-add-structured-logging/SPEC.md:184:file://services/auth/handlers/login.go
6209:examples/task-add-structured-logging/SPEC.md:185:file://services/auth/handlers/signup.go
6210:examples/task-add-structured-logging/SPEC.md:186:file://services/auth/handlers/logout.go
6211:examples/task-add-structured-logging/SPEC.md:187:file://services/auth/middleware/session.go
6212:examples/task-add-structured-logging/SPEC.md:188:file://services/auth/internal/audit/audit.go
6213:examples/task-add-structured-logging/SPEC.md:189:file://services/auth/internal/oauth/google.go
6214:examples/task-add-structured-logging/SPEC.md:190:file://services/auth/README.md
6215:examples/task-add-structured-logging/SPEC.md:191:file://docs/oncall/auth-incidents.md
6216:examples/task-add-structured-logging/SPEC.md:207:file://services/auth/cmd/server/main.go
6217:examples/task-add-structured-logging/SPEC.md:213:file://test/load/auth-baseline.results.json
6218:examples/task-add-structured-logging/SPEC.md:222:file://infra/logging/pipeline.yaml
6219:examples/task-add-structured-logging/SPEC.md:269:file://test/load/auth-baseline.results.json
6220:examples/task-add-structured-logging/SPEC.md:284:file://services/auth/cmd/server/main.go
6221:examples/task-add-structured-logging/SPEC.md:287:file://services/auth/internal/authlog/
6222:examples/task-add-structured-logging/IDEA.md:24:file://services/auth/handlers/login.go
6223:examples/task-add-structured-logging/IDEA.md:25:file://services/auth/middleware/session.go
6224:examples/task-add-structured-logging/IDEA.md:26:file://docs/oncall/auth-incidents.md
6225:examples/task-add-structured-logging/IDEA.md:32:file://infra/logging/pipeline.yaml
6226:examples/task-add-structured-logging/IDEA.md:38:file://services/auth/handlers/login.go
6227:examples/task-add-structured-logging/IDEA.md:40:file://services/auth/middleware/session.go
6228:examples/task-add-structured-logging/IDEA.md:42:file://services/auth/internal/audit/audit.go
6229:examples/task-add-structured-logging/IDEA.md:44:file://infra/logging/pipeline.yaml
6230:examples/task-add-structured-logging/IDEA.md:46:file://docs/oncall/auth-incidents.md
6231:examples/task-add-structured-logging/IDEA.md:61:file://infra/logging/pipeline.yaml
6232:examples/task-add-structured-logging/IDEA.md:77:file://test/load/auth-baseline.k6.js
6233:examples/task-add-structured-logging/IDEA.md:132:file://infra/logging/pipeline.yaml
6234:spec-bundle/customization/contract.md:3:file://../../research/primary-sources/leaddev-agent-compiled.md
6235:spec-bundle/customization/contract.md:6:file://../../research/primary-sources/helm-values-schema.md
6236:spec-bundle/customization/contract.md:19:file://../templates/
6237:spec-bundle/customization/contract.md:24:file://../schema/SPEC.schema.md
6238:spec-bundle/customization/contract.md:111:file://../skills/autonomous-issue-dispatch/SKILL.md
6239:spec-bundle/architecture/solution-strategy.md:4:file://../../research/primary-sources/arc42.md
6240:spec-bundle/architecture/solution-strategy.md:61:file://../../research/primary-sources/arc42.md
6241:spec-bundle/architecture/solution-strategy.md:79:file://../../research/primary-sources/c4-model.md
6242:spec-bundle/architecture/CONTEXT.md:4:file://../../research/primary-sources/arc42.md
6243:spec-bundle/architecture/CONTEXT.md:6:file://../../research/primary-sources/c4-model.md
6244:spec-bundle/architecture/CONTEXT.md:24:file://../schema/SPEC.schema.md
6245:spec-bundle/architecture/CONTEXT.md:26:file://../templates/
6246:spec-bundle/architecture/CONTEXT.md:27:file://../../scripts/lint-spec.sh
6247:spec-bundle/architecture/CONTEXT.md:29:file://../skills/
6248:spec-bundle/architecture/CONTEXT.md:31:file://../../hooks/
6249:spec-bundle/architecture/CONTEXT.md:35:file://../../tests/hooks/run-tests.sh
6250:spec-bundle/architecture/CONTEXT.md:37:file://../../examples/
6251:spec-bundle/architecture/CONTEXT.md:38:file://../../.github/workflows/ci.yml
6252:spec-bundle/architecture/CONTEXT.md:76:file://../../research/primary-sources/symphony-spec.md
6253:spec-bundle/operations/safety-invariants.md:4:file://../../research/primary-sources/symphony-spec.md
6254:spec-bundle/operations/failures.md:5:file://../../research/primary-sources/symphony-spec.md
6255:spec-bundle/operations/failures.md:66:file://X
6256:spec-bundle/operations/observability.md:4:file://../../research/primary-sources/symphony-spec.md
6257:spec-bundle/schema/SPEC.schema.md:211:file://<repo-relative-or-absolute-path>
6258:spec-bundle/schema/SPEC.schema.md:268:file://OPERATING_MODEL.md
6259:spec-bundle/schema/SPEC.schema.md:270:file://specs/2026-01-15-example-procedure-v1/IDEA.md
6260:spec-bundle/templates/SPEC.decision.template.md:61:file://[path
6261:spec-bundle/templates/SPEC.decision.template.md:69:file://[path
6262:spec-bundle/templates/SPEC.decision.template.md:74:file://[path
6263:spec-bundle/templates/SPEC.decision.template.md:87:file://[path
6264:spec-bundle/templates/SPEC.decision.template.md:146:file://[path
6265:spec-bundle/templates/SPEC.contract.template.md:54:file://templates/SPEC.schema.md
6266:spec-bundle/templates/SPEC.contract.template.md:58:file://specs/<id>/IDEA.md
6267:spec-bundle/templates/SPEC.contract.template.md:101:file://[path
6268:spec-bundle/templates/SPEC.contract.template.md:106:file://[path
6269:spec-bundle/templates/SPEC.contract.template.md:116:file://[path
6270:spec-bundle/templates/SPEC.contract.template.md:253:file://templates/SPEC.schema.md
6271:spec-bundle/templates/SPEC.contract.template.md:257:file://specs/<id>/IDEA.md
6272:spec-bundle/templates/SPEC.contract.template.md:308:file://specs/<id>/IDEA.md
6273:spec-bundle/templates/SPEC.task.template.md:78:file://[path
6274:spec-bundle/templates/SPEC.task.template.md:85:file://[path/to/current-doc.md
6275:spec-bundle/templates/SPEC.task.template.md:89:file://[path/to/old-doc.md
6276:spec-bundle/templates/SPEC.task.template.md:102:file://[path
6277:spec-bundle/templates/SPEC.task.template.md:156:file://[path/to/file
6278:spec-bundle/templates/SPEC.task.template.md:157:file://[path/to/other-file
6279:spec-bundle/templates/SPEC.task.template.md:184:file://[path
6280:spec-bundle/templates/workpads/AGENT_INBOX.template.md:18:file://skills/cross-repo-informational-channel/SKILL.md
6281:spec-bundle/templates/workpads/AGENT_INBOX.template.md:19:file://skills/cross-repo-informational-channel/SKILL.md
6282:spec-bundle/templates/workpads/AGENT_INBOX.template.md:25:file://agents/skills/repo-orientation/SKILL.md
6283:spec-bundle/templates/workpads/AGENT_INBOX.template.md:54:file://specs/<id>/SPEC.md
6284:spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:file://agents/specs/SPEC.schema.md
6285:spec-bundle/templates/TASK.template.md:50:file://skills/approved-spec-decomposition/SKILL.md
6286:spec-bundle/templates/TASK.template.md:70:file://templates/SPEC.schema.md
6287:spec-bundle/templates/TASK.template.md:83:file://specs/{{parent_spec}}/SPEC.md
6288:spec-bundle/templates/TASK.template.md:100:file://AGENTS.md
6289:spec-bundle/templates/TASK.template.md:101:file://specs/{{parent_spec}}/SPEC.md
6290:spec-bundle/templates/TASK.template.md:102:file://your
6291:spec-bundle/templates/TASK.template.md:109:file://workflow/UNIVERSAL.md
6292:spec-bundle/templates/TASK.template.md:178:file://workflow/UNIVERSAL.md
6293:spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:15:file://workflow/UNIVERSAL.md
6294:spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:16:file://skills/repo-orientation/SKILL.md
6295:spec-bundle/skills/approved-spec-decomposition/SKILL.md:24:file://agents/MODEL_ROUTING.md
6296:spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:file://agents/specs/SPEC.schema.md
6297:spec-bundle/skills/approved-spec-decomposition/SKILL.md:56:file://agents/MODEL_ROUTING.md
6298:spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:file://agents/specs/TASK.template.md
6299:spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:file://agents/specs/SPEC.schema.md
6300:spec-bundle/templates/IDEA.template.md:46:file://[path
6301:spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:8:file://skills/agent-feedback/SKILL.md
6302:spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:9:file://workflows/agent-feedback.md
6303:spec-bundle/deployment/requirements.md:4:file://../../research/primary-sources/12-factor.md
6304:spec-bundle/deployment/requirements.md:32:file://../../research/primary-sources/symphony-spec.md
6305:spec-bundle/deployment/requirements.md:49:file://../../research/primary-sources/nix-flakes.md
6306:spec-bundle/templates/SPEC.fastpath.template.md:17:file://skills/fast-path/SKILL.md
6307:spec-bundle/templates/SPEC.fastpath.template.md:23:file://skills/spec-driven-development/SKILL.md
6308:spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:4:file://agents/skills/approved-spec-decomposition/SKILL.md
6309:spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:17:file://agents/skills/approved-spec-decomposition/SKILL.md
6310:spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:file://agents/templates/WORKFLOW.body.md
6311:spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:44:file://agents/skills/code-review/SKILL.md
6312:spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:46:file://agents/skills/spec-review/SKILL.md
6313:spec-bundle/skills/cross-repo-informational-channel/SKILL.md:57:file://...
6314:spec-bundle/deployment/install.md:32:file://../skills/agents-md-improver/SKILL.md
6315:spec-bundle/deployment/install.md:45:file://../skills/cross-repo-policy-enforcement/SKILL.md
6316:spec-bundle/deployment/install.md:46:file://../skills/cross-repo-informational-channel/SKILL.md
6317:spec-bundle/deployment/install.md:52:file://../../scripts/fleet-*.example.txt
6318:spec-bundle/skills/verification/SKILL.md:44:file://your
6319:spec-bundle/skills/code-review/SKILL.md:58:file://your
6320:spec-bundle/skills/spec-review/SKILL.md:8:file://examples/reference-procedure-spec
6321:spec-bundle/skills/spec-review/SKILL.md:10:file://templates/SPEC.schema.md
6322:spec-bundle/skills/spec-review/SKILL.md:91:file://specs/<id>/IDEA.md
6336:    54	`file://templates/SPEC.schema.md` §1.3 and the 2026-01-15
6340:    58	producing IDEA's §1 — e.g. "See `file://specs/<id>/IDEA.md` §1
6356:   253	(`file://templates/SPEC.schema.md` §1.3) and the validation
6360:   257	`file://specs/<id>/IDEA.md` §13 (capture-after defer); the
6378:    50	  `file://skills/approved-spec-decomposition/SKILL.md`
6398:    70	`file://templates/SPEC.schema.md` §2.
6404:   100	- `file://AGENTS.md`
6405:   101	- `file://specs/{{parent_spec}}/SPEC.md`
6406:   102	- `file://your model-routing policy` (before any subagent dispatch)
6409:   105	### 3.3 Out of scope
6413:   109	`file://workflow/UNIVERSAL.md` "Universal guardrails".
6428:   178	journal per `file://workflow/UNIVERSAL.md` Step 1.
6449:    17	`file://skills/fast-path/SKILL.md` "Thresholds" are met. If
6455:    23	(`file://skills/spec-driven-development/SKILL.md`
6479:     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
6484:     8	Authority: `file://examples/reference-procedure-spec`
6486:    10	`file://templates/SPEC.schema.md` §5.
6518:    91	content is a `file://specs/<id>/IDEA.md` cite pointing at the
6525:    98	including a `file://specs/<id>/IDEA.md` cite):
6555:    24	  `file://agents/MODEL_ROUTING.md` "Routing Matrix" (multi-agent
6572:    41	   `file://agents/specs/SPEC.schema.md` §1.3).
6587:    56	2. Read `file://agents/MODEL_ROUTING.md` "Routing Matrix" to map task
6591:    60	4. For each slice, copy `file://agents/specs/TASK.template.md` to
6611:   119	   `file://agents/specs/SPEC.schema.md` §1.3).
6625:     4	`file://agents/skills/approved-spec-decomposition/SKILL.md` per
6638:    17	`file://agents/skills/approved-spec-decomposition/SKILL.md`;
6654:    33	3. Findings are recorded in the workpad `Validation` section.
6657:    36	   `file://agents/templates/WORKFLOW.body.md` "PR feedback
6665:    44	`file://agents/skills/code-review/SKILL.md` and the
6667:    46	`file://agents/skills/spec-review/SKILL.md` are the executors
6698:    18	`file://skills/cross-repo-informational-channel/SKILL.md`;
6699:    19	`file://skills/cross-repo-informational-channel/SKILL.md`.
6705:    25	`file://agents/skills/repo-orientation/SKILL.md` Step 3). Each
6724:    88	  (`file://agents/specs/SPEC.schema.md` §2).
6750:    15	`file://workflow/UNIVERSAL.md` "Section 1 — Universal";
6751:    16	`file://skills/repo-orientation/SKILL.md` Step 2.
6833:   369	CITE_RE='(file://|cmd://|url://|owner://|decision-authority://|judgment://owner|judgment://agent-synthesis)'
6917:   592	for prefix in 'file://' 'cmd://' 'url://' 'owner://' 'decision-authority://' 'judgment://owner' 'judgment://agent-synthesis'; do
6946:**Quality Gate Result**
6952:| Finding | File:line | Severity |
6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
6969:**Quality Gate Result**
6975:| Finding | File:line | Severity |
6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"acceptance_commands|schema_uri|source_commit|source_tag|primary_index|media_type|digest|size|provenance|v2\\.1|validate-manifest|Completion Report|Quality Gate|## 8|## 9|## 17|## 19\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
11:acceptance_commands:
14:  - bash scripts/validate-manifest.sh
81:- Author a `scripts/validate-manifest.sh` mechanical
140:├── scripts/                           # lint-spec, validate-manifest, etc.
321:`scripts/validate-manifest.sh`):
497:| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |
504:2. Author `scripts/validate-manifest.sh` per §6.1
522:   `validate-manifest` as a CI job.
527:10. Tag `v2.0.0` once `validate-manifest` + lint +
546:## 8. Schema Specification
548:### 8.1 Manifest schema (formal — v2.1.0)
551:noted). Fields marked **(v2.1)** were added per the codex
564:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
565:| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
566:| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
570:| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
573:### 8.2 `intent` block
582:### 8.3 `facets` block
592:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
593:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
594:| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
595:| `digest` | string | RECOMMENDED **(v2.1)** | `algorithm:hex` form per OCI Descriptor convention; lets consumers verify by hash |
596:| `size` | integer | OPTIONAL **(v2.1)** | Size in bytes |
597:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
599:Additional facets MAY appear; `validate-manifest.sh`
602:**v2.1 facet.primary directory rule (codex remediation
605:the file named by `primary_index` exists inside it AND
606:(if `media_type` is set) at least one file in the
609:`text/markdown` → `*.md`, etc.). The pre-v2.1 silent-
613:### 8.4 `resources` block
622:Resource records MAY also include `media_type`,
623:`digest`, `size`, `status` fields (same semantics as
626:### 8.5 `signature` block
634:### 8.6 `provenance` block (v2.1)
642:| `sbom_ref` | string (URI) | OPTIONAL | URL or OCI digest of the SBOM artefact |
643:| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
645:## 9. Reference Algorithms
647:### 9.1 validate-manifest (pseudocode)
703:| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
712:  manifest is read-only data; `validate-manifest.sh` is
726:- `validate-manifest.sh` prints diagnostic lines to
728:- CI job `validate-manifest` runs on every push +
741:| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
753:- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
754:      `cmd://bash scripts/validate-manifest.sh` exits 0
768:      `validate-manifest` job; all CI jobs pass on the
780:- [x] AC-3: validate-manifest exits 0
807:## 17. Open Questions
852:## 19. Completion Report
854:### 19.1 Files changed
862:- `scripts/validate-manifest.sh` (mechanical completeness
895:- `.github/workflows/ci.yml` — adds `validate-manifest`
907:### 19.2 Commands run
919:- `cmd://chmod +x scripts/validate-manifest.sh`.
923:- `cmd://bash scripts/validate-manifest.sh` — exit 0
939:### 19.3 Verification result
945:validate-manifest, preflight-self-check).
954:### 19.4 Residual risk
991:### 19.5 Spec evidence candidates
1030:- **`validate-manifest.sh` was the right scaffolding

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "schema_uri|source_commit|source_tag|primary_index|media_type|digest|size|provenance|sbom|slsa|spec_version|primary:" spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
1:spec_version: "2.1.0"
6:schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
7:source_commit: ""              # populated by release tooling at tag time
8:source_tag: "v2.0.0"
30:    primary: "architecture/CONTEXT.md"
31:    media_type: "text/markdown"
35:    primary: "deployment/install.md"
36:    media_type: "text/markdown"
40:    primary: "behavior/features/"
41:    primary_index: "behavior/features/lint-citation-grammar.feature"
42:    media_type: "text/x.gherkin"
46:    primary: "customization/contract.md"
47:    media_type: "text/markdown"
51:    primary: "decisions/INDEX.md"
52:    media_type: "text/markdown"
56:    primary: "quality/requirements.md"
57:    media_type: "text/markdown"
61:    primary: "operations/failures.md"
62:    media_type: "text/markdown"
66:    primary: "non-goals/INDEX.md"
67:    media_type: "text/markdown"
73:    media_type: "text/markdown"
76:    media_type: "text/markdown"
79:    media_type: "text/markdown"
82:    media_type: "application/vnd.framework.conformance-suite"
85:provenance:
86:  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
87:  sbom_ref: ""                   # populated by release tooling
88:  slsa_level: ""                 # reserved; SLSA attestation lands when toolchain wired

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"file://\\.\\./|file://\\.\\./\\.\\./|url://github.com|agentic-installation-methodology|research/primary-sources\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle/architecture/CONTEXT.md spec-bundle/deployment/install.md spec-bundle/behavior/features spec-bundle/customization/contract.md spec-bundle/decisions/INDEX.md spec-bundle/quality/requirements.md spec-bundle/operations/failures.md spec-bundle/non-goals/INDEX.md spec-bundle/manifest.yaml" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/manifest.yaml:93:  # https://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/sigstore-cosign.md §3
spec-bundle/operations/failures.md:5:(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/symphony-spec.md`
spec-bundle/non-goals/INDEX.md:3:The second novel facet per research §4.2 (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/non-goals/INDEX.md:20:  `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/c4-model.md` §3.
spec-bundle/non-goals/INDEX.md:107:  `agentic-installation-methodology` covers that
spec-bundle/non-goals/INDEX.md:112:Per research §4.2 (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/quality/requirements.md:4:(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/arc42.md` §3) and
spec-bundle/quality/requirements.md:119:  `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/12-factor.md` §3.
spec-bundle/customization/contract.md:3:The novel facet per research §4.1 (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/customization/contract.md:6:(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/helm-values-schema.md`
spec-bundle/customization/contract.md:19:  (`file://../templates/`).
spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
spec-bundle/customization/contract.md:111:(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
spec-bundle/decisions/INDEX.md:4:template (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/adr-nygard.md`
spec-bundle/decisions/INDEX.md:26:`file://../../specs/`).
spec-bundle/decisions/INDEX.md:31:  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/adr-nygard.md`
spec-bundle/decisions/INDEX.md:36:  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/adr-tools-state.md`
spec-bundle/deployment/install.md:32:#    file://../skills/agents-md-improver/SKILL.md
spec-bundle/deployment/install.md:45:(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
spec-bundle/deployment/install.md:46:`file://../skills/cross-repo-informational-channel/SKILL.md`)
spec-bundle/deployment/install.md:52:`file://../../scripts/fleet-*.example.txt` show the shape.
spec-bundle/deployment/install.md:58:`url://github.com/buildepicshit/agentic-installation-methodology`
spec-bundle/architecture/CONTEXT.md:4:(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/arc42.md` §3) and
spec-bundle/architecture/CONTEXT.md:6:(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/c4-model.md` §3),
spec-bundle/architecture/CONTEXT.md:11:the sibling repo `agentic-installation-methodology` at
spec-bundle/architecture/CONTEXT.md:12:`research/primary-sources/`. Cross-repo `file://` paths in
spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
spec-bundle/architecture/CONTEXT.md:27:- A lint script (`file://../../scripts/lint-spec.sh`) that
spec-bundle/architecture/CONTEXT.md:29:- A skill catalog (`file://../skills/`) covering the
spec-bundle/architecture/CONTEXT.md:31:- Seven PreToolUse hooks (`file://../../hooks/`) enforcing
spec-bundle/architecture/CONTEXT.md:35:  (`file://../../tests/hooks/run-tests.sh`).
spec-bundle/architecture/CONTEXT.md:37:  (`file://../../examples/`).
spec-bundle/architecture/CONTEXT.md:38:- A CI workflow (`file://../../.github/workflows/ci.yml`)
spec-bundle/architecture/CONTEXT.md:76:  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:15:cites_decision: 2026-05-18-agentic-installation-methodology
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:33:`research/primary-sources/<slug>.md` corpus.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:45:`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:51:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:53:`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:72:  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:167:  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:179:- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:181:- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:183:- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:185:- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:187:- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:189:- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:191:- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:193:- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:195:- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:197:- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:238:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:317:  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:326:   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:330:   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:346:  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:350:  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:353:  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:357:  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:367:  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:378:  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:384:  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:397:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:407:`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:424:Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:431:  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:439:  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:553:`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:716:  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:949:`agentic-installation-methodology` publishes. The
spec-bundle/behavior/features/lint-citation-grammar.feature:3:  (url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/cucumber-gherkin.md §3)
spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"schema/|templates/|skills/|workflow/|workpads/|spec-bundle/(schema|templates|skills)|TASK\\.template|SPEC\\.schema|approved-spec|spec-review|repo-orientation\" CONTRIBUTING.md spec-bundle/templates/TASK.template.md spec-bundle/skills/*.md spec-bundle/skills/*/SKILL.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 2 in 0ms:
rg: spec-bundle/skills/*.md: No such file or directory (os error 2)
CONTRIBUTING.md:22:2. **Read `spec-bundle/schema/SPEC.schema.md`** — the citation grammar
CONTRIBUTING.md:24:   see `schema/SPEC.schema.md`).
CONTRIBUTING.md:29:   using `spec-bundle/templates/IDEA.template.md` (v2.0
spec-bundle/skills/implementation-execution/SKILL.md:20:7. For substantial approved specs, use `approved-spec-decomposition` to
spec-bundle/templates/TASK.template.md:50:  `file://skills/approved-spec-decomposition/SKILL.md`
spec-bundle/templates/TASK.template.md:70:`file://templates/SPEC.schema.md` §2.
spec-bundle/templates/TASK.template.md:109:`file://workflow/UNIVERSAL.md` "Universal guardrails".
spec-bundle/templates/TASK.template.md:178:journal per `file://workflow/UNIVERSAL.md` Step 1.
spec-bundle/skills/agents-md-improver/SKILL.md:42:  `file://workpads/WORKFLOW.body.md` (or
spec-bundle/skills/agents-md-improver/SKILL.md:43:  `.workpads/WORKFLOW.body.md` in a child repo).
spec-bundle/skills/fast-path/SKILL.md:16:`file://templates/SPEC.fastpath.template.md`.
spec-bundle/skills/fast-path/SKILL.md:48:   `file://templates/SPEC.fastpath.template.md`. Status:
spec-bundle/skills/code-review/SKILL.md:3:description: "Use for reviewing local diffs, branches, or PRs. Prioritises bugs, regressions, missing tests, unsafe assumptions, and broken repo contracts over surface polish. Do not use to author or review SPEC.md / IDEA.md artefacts — use spec-review for that BLOCKING gate."
spec-bundle/skills/code-review/SKILL.md:23:`approved-spec-decomposition`, review in this order:
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:66:test -f .agents/templates/AGENT_INBOX.template.md && \
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:67:    grep -q "decision-authority://" .agents/specs/SPEC.schema.md
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:85:`skills/repo-orientation/SKILL.md`). Each entry tells you
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:2:name: approved-spec-decomposition
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:   `file://agents/specs/SPEC.schema.md` §1.3).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:4. For each slice, copy `file://agents/specs/TASK.template.md` to
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:   `file://agents/specs/SPEC.schema.md` §1.3).
spec-bundle/skills/agent-feedback/SKILL.md:14:`file://workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:43:   from `file://workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:67:    `file://skills/fleet-enforce/SKILL.md`.
spec-bundle/skills/agent-feedback/SKILL.md:86:  `file://templates/SPEC.schema.md` §2.
spec-bundle/skills/repo-orientation/SKILL.md:2:name: repo-orientation
spec-bundle/skills/repo-orientation/SKILL.md:26:   `.workpads/SESSION_JOURNAL.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:29:   `.workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:33:   `.workpads/AGENT_INBOX.template.md`. See
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.
spec-bundle/skills/spec-review/SKILL.md:2:name: spec-review
spec-bundle/skills/spec-review/SKILL.md:10:`file://templates/SPEC.schema.md` §5.
spec-bundle/skills/spec-review/SKILL.md:51:Per SPEC §10 and SPEC.schema §5:
spec-bundle/skills/spec-review/SKILL.md:157:    SPEC.schema §2 citation grammar.
spec-bundle/skills/spec-review/SKILL.md:227:  a model in one family (the agent runner / Claude), the spec-review pass
spec-bundle/skills/spec-review/SKILL.md:261:  `file://skills/spec-review/references/per-type-gates.md`.
spec-bundle/skills/spec-review/SKILL.md:262:- Shared schema: `file://templates/SPEC.schema.md` §5
spec-bundle/skills/spec-review/SKILL.md:269:- Authoring side: `file://skills/spec-authoring/SKILL.md`.
spec-bundle/skills/spec-review/SKILL.md:271:  `file://skills/spec-driven-development/SKILL.md`.
spec-bundle/skills/spec-authoring/SKILL.md:3:description: "Use when capturing an IDEA (/idea-capture) or authoring a SPEC.md (/author-spec) under the spec-first model. Owns templates, type selection (fastpath / task / contract / decision), shared schema, citation discipline, IDEA-conversation tactics. Hands off to spec-review for the BLOCKING gate. Do not use to review existing specs (spec-review) or implement approved specs (implementation-execution)."
spec-bundle/skills/spec-authoring/SKILL.md:13:`spec-review`, which runs the blocking gate and either returns
spec-bundle/skills/spec-authoring/SKILL.md:32:- Reviewing a spec already authored — use `spec-review`.
spec-bundle/skills/spec-authoring/SKILL.md:67:- `templates/IDEA.template.md` — the IDEA artefact.
spec-bundle/skills/spec-authoring/SKILL.md:68:- `templates/SPEC.task.template.md` — concrete, scoped, verifiable
spec-bundle/skills/spec-authoring/SKILL.md:70:- `templates/SPEC.contract.template.md` — stateful, multi-component,
spec-bundle/skills/spec-authoring/SKILL.md:72:- `templates/SPEC.decision.template.md` — binding choice between
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:153:(`file://templates/SPEC.schema.md` §1.3) MAY use a
spec-bundle/skills/spec-authoring/SKILL.md:165:  per-type gate in `spec-review` validates that the cited IDEA
spec-bundle/skills/spec-authoring/SKILL.md:170:content; defer-shorthand is rejected by the spec-review gate.
spec-bundle/skills/spec-authoring/SKILL.md:191:`file://templates/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:203:`file://templates/SPEC.schema.md` §2.5. Use sparingly; pervasive
spec-bundle/skills/spec-authoring/SKILL.md:210:`file://templates/SPEC.schema.md` §1.3 and
spec-bundle/skills/spec-authoring/SKILL.md:217:2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
spec-bundle/skills/spec-authoring/SKILL.md:220:3. `spec-review` runs `lint-spec.sh` (REQUIRED for Contract,
spec-bundle/skills/spec-authoring/SKILL.md:223:4. On a clean pass, `spec-review` sets `status: approved-pending-owner`
spec-bundle/skills/spec-authoring/SKILL.md:225:   failure, `spec-review` sets `status: needs-revision` (SPEC) or
spec-bundle/skills/spec-authoring/SKILL.md:231:If `spec-review` returns `needs-revision`, return to this skill: read
spec-bundle/skills/spec-authoring/SKILL.md:239:  `templates/SPEC.schema.md` first.
spec-bundle/skills/spec-driven-development/SKILL.md:3:description: "the studio lifecycle index for non-trivial work — the 13-phase pipeline (IDEA → SPEC → review → approve → decompose → dispatch → execute → cross-validate → verify → close + capture-after / fastpath exception). Routes to per-phase skills (spec-authoring, spec-review, approved-spec-decomposition, implementation-execution, verification, spec-evidence-governance, fast-path). Read directly when you need the overall procedure; otherwise invoke the specific phase skill."
spec-bundle/skills/spec-driven-development/SKILL.md:12:quality gate is owned by the [`spec-review`](../spec-review/SKILL.md)
spec-bundle/skills/spec-driven-development/SKILL.md:38:   [`spec-review`](../spec-review/SKILL.md) skill applies the per-type
spec-bundle/skills/spec-driven-development/SKILL.md:46:   `/decompose-approved-spec`. The
spec-bundle/skills/spec-driven-development/SKILL.md:47:   [`approved-spec-decomposition`](../approved-spec-decomposition/SKILL.md)
spec-bundle/skills/spec-driven-development/SKILL.md:61:   discipline applies (see `file://workpads/WORKFLOW.body.md`).
spec-bundle/skills/spec-driven-development/SKILL.md:75:    posts justified pushback. See `file://skills/code-review/SKILL.md`
spec-bundle/skills/spec-driven-development/SKILL.md:76:    and `file://skills/spec-review/SKILL.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:95:`file://skills/spec-driven-development/references/capture-after-and-fastpath.md`
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:105:- `task` → `templates/SPEC.task.template.md` — concrete, scoped,
spec-bundle/skills/spec-driven-development/SKILL.md:107:- `contract` → `templates/SPEC.contract.template.md` — specifies
spec-bundle/skills/spec-driven-development/SKILL.md:111:- `decision` → `templates/SPEC.decision.template.md` — chooses
spec-bundle/skills/spec-driven-development/SKILL.md:116:`templates/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:117:`templates/IDEA.template.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `templates/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:162:  owner). The `spec-review` skill MAY set
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:179:  `.claude/skills/<name>/SKILL.md`, the registry row in
spec-bundle/skills/spec-driven-development/SKILL.md:190:  `/decompose-approved-spec` before agents begin execution. The
spec-bundle/skills/spec-driven-development/SKILL.md:219:[`spec-review`](../spec-review/SKILL.md) skill per type. The
spec-bundle/skills/spec-driven-development/SKILL.md:222:specific bars are documented in `spec-review`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '6938,6995p' ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   613	exit 0
   614	
   615	# Expected:
   616	#   lint-spec.sh good-task.md           -> exit 0
   617	#   lint-spec.sh bad-uncited.md         -> exit 1
   618	#   lint-spec.sh bad-missing-section.md -> exit 1

codex
**Quality Gate Result**
FAIL. The v2.0 structure exists and `validate-manifest.sh` passes, but the release is not gate-clean: one declared acceptance command fails, many new facet citations are non-resolving, and the validator is too weak for the manifest contract it claims to enforce.

Commands checked read-only:
`bash scripts/validate-manifest.sh` PASS; `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` PASS; `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` FAIL.

| Finding | File:line | Severity |
|---|---:|---|
| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
| `behavior.primary` is a directory, while the formal schema says `primary` is the facet entry file. The validator explicitly allows a primary directory, creating schema drift and an unstable entry point for behavior. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:31), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:581), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:149) | MEDIUM |
| `conformance_profile: core` is machine-readable, but `spec-bundle/conformance/` is empty and only prose says it is reserved for v2.x. That makes the scaffold disclosure honest in the changelog, but a fig leaf in the manifest contract. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:3), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:53), [CHANGELOG.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CHANGELOG.md:95) | MEDIUM |
| `validate-manifest.sh` has broad false negatives: no YAML parser, no required eight-facet set, no resource validation, no `path` validation, no semver/date validation, and no checks for required `intent` subfields beyond product name. | [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:45), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:118), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:621) | MEDIUM |
| The verified SPEC still carries stale completion state: body says “Status: Draft v1”, DoD remains unchecked, and AC-8 says the tag is pending even though `v2.0.0` now exists. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:21), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:710), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744) | LOW |

Facet-set take: the eight named facets are present, but not content-complete. The wrong grouping is `conformance` as a resource while the manifest advertises conformance profiles; it needs either first-class facet treatment or explicit reserved status. Behavior is also under-covered: only two feature files exist for a seven-hook plus lint/manifest framework.

Scaffold-grade verdict: honest in human prose, not honest enough in the machine contract. The manifest and validator should expose scaffold/reserved status directly, otherwise consumers see `core` and `PASS` where the release actually means “structural shell, richer content later.”
tokens used
200,893
**Quality Gate Result**
FAIL. The v2.0 structure exists and `validate-manifest.sh` passes, but the release is not gate-clean: one declared acceptance command fails, many new facet citations are non-resolving, and the validator is too weak for the manifest contract it claims to enforce.

Commands checked read-only:
`bash scripts/validate-manifest.sh` PASS; `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` PASS; `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` FAIL.

| Finding | File:line | Severity |
|---|---:|---|
| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
| `behavior.primary` is a directory, while the formal schema says `primary` is the facet entry file. The validator explicitly allows a primary directory, creating schema drift and an unstable entry point for behavior. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:31), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:581), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:149) | MEDIUM |
| `conformance_profile: core` is machine-readable, but `spec-bundle/conformance/` is empty and only prose says it is reserved for v2.x. That makes the scaffold disclosure honest in the changelog, but a fig leaf in the manifest contract. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:3), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:53), [CHANGELOG.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CHANGELOG.md:95) | MEDIUM |
| `validate-manifest.sh` has broad false negatives: no YAML parser, no required eight-facet set, no resource validation, no `path` validation, no semver/date validation, and no checks for required `intent` subfields beyond product name. | [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:45), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:118), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:621) | MEDIUM |
| The verified SPEC still carries stale completion state: body says “Status: Draft v1”, DoD remains unchecked, and AC-8 says the tag is pending even though `v2.0.0` now exists. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:21), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:710), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744) | LOW |

Facet-set take: the eight named facets are present, but not content-complete. The wrong grouping is `conformance` as a resource while the manifest advertises conformance profiles; it needs either first-class facet treatment or explicit reserved status. Behavior is also under-covered: only two feature files exist for a seven-hook plus lint/manifest framework.

Scaffold-grade verdict: honest in human prose, not honest enough in the machine contract. The manifest and validator should expose scaffold/reserved status directly, otherwise consumers see `core` and `PASS` where the release actually means “structural shell, richer content later.”

codex
The three SPEC acceptance commands are now the only commands in front matter; the old manifest lint command is gone. I’m running those gates and checking the v2.1 validator path against the new `primary_index` rule rather than relying on the manifest’s current happy path.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-manifest.sh | sed -n '1,230p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
    64	# 6. product_name match (search for product_name under intent).
    65	actual_product_name="$(grep -E '^[[:space:]]+product_name:' "$MANIFEST" | head -1 | sed -E 's/^[[:space:]]+product_name:[[:space:]]*//;s/^"//;s/"$//')"
    66	if [ "$actual_product_name" != "$EXPECTED_PRODUCT_NAME" ]; then
    67	    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
    68	fi
    69	
    70	# 4 + 5. Parse facets block; extract slugs.
    71	# Match lines indented two spaces under "facets:" that end with ":".
    72	declare -a facet_slugs=()
    73	in_facets=0
    74	in_facets_record=""
    75	while IFS= read -r line; do
    76	    if [[ "$line" =~ ^facets: ]]; then
    77	        in_facets=1
    78	        continue
    79	    fi
    80	    if [ $in_facets -eq 1 ]; then
    81	        # Top-level key (no indent) ends facets block.
    82	        if [[ "$line" =~ ^[a-z_-] ]]; then
    83	            in_facets=0
    84	            continue
    85	        fi
    86	        # Two-space-indented key with no further indent is a facet name.
    87	        if [[ "$line" =~ ^[[:space:]]{2}[a-z_-]+:[[:space:]]*$ ]]; then
    88	            slug="${line//[[:space:]]/}"
    89	            slug="${slug%:}"
    90	            facet_slugs+=("$slug")
    91	        fi
    92	    fi
    93	done < "$MANIFEST"
    94	
    95	if [ ${#facet_slugs[@]} -eq 0 ]; then
    96	    err "facets block empty or unparseable"
    97	fi
    98	
    99	# Build set of fs facet dirs.
   100	declare -a fs_dirs=()
   101	if [ -d "$BUNDLE_DIR" ]; then
   102	    while IFS= read -r dir; do
   103	        base="$(basename "$dir")"
   104	        # Skip resource dirs.
   105	        is_resource=0
   106	        for r in "${RESOURCE_DIRS[@]}"; do
   107	            if [ "$base" = "$r" ]; then
   108	                is_resource=1
   109	                break
   110	            fi
   111	        done
   112	        if [ $is_resource -eq 0 ]; then
   113	            fs_dirs+=("$base")
   114	        fi
   115	    done < <(find "$BUNDLE_DIR" -mindepth 1 -maxdepth 1 -type d | sort)
   116	fi
   117	
   118	# Compare facet slugs vs fs dirs.
   119	for slug in "${facet_slugs[@]}"; do
   120	    found=0
   121	    for d in "${fs_dirs[@]}"; do
   122	        [ "$d" = "$slug" ] && found=1 && break
   123	    done
   124	    if [ $found -eq 0 ]; then
   125	        err "facet '$slug' listed in manifest but no directory at spec-bundle/$slug/"
   126	    fi
   127	done
   128	
   129	for d in "${fs_dirs[@]}"; do
   130	    found=0
   131	    for slug in "${facet_slugs[@]}"; do
   132	        [ "$slug" = "$d" ] && found=1 && break
   133	    done
   134	    if [ $found -eq 0 ]; then
   135	        err "directory spec-bundle/$d/ exists but not listed in manifest facets"
   136	    fi
   137	done
   138	
   139	# Check each facet's primary file exists.
   140	# Parse primary field per facet — look for two-space-indented "primary:".
   141	current_facet=""
   142	while IFS= read -r line; do
   143	    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
   144	        current_facet="${BASH_REMATCH[1]}"
   145	    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   146	        primary="${BASH_REMATCH[1]}"
   147	        # Strip trailing quote if any.
   148	        primary="${primary%\"}"
   149	        # Primary may be a file or a directory (e.g., behavior/features/).
   150	        if [[ "$primary" == */ ]]; then
   151	            if [ ! -d "$BUNDLE_DIR/$primary" ]; then
   152	                err "facet '$current_facet' primary directory missing: $primary"
   153	            fi
   154	        else
   155	            if [ ! -f "$BUNDLE_DIR/$primary" ]; then
   156	                err "facet '$current_facet' primary file missing: $primary"
   157	            fi
   158	        fi
   159	    elif [[ "$line" =~ ^[a-z_-] ]]; then
   160	        current_facet=""
   161	    fi
   162	done < "$MANIFEST"
   163	
   164	if [ ${#errors[@]} -gt 0 ]; then
   165	    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
   166	    for e in "${errors[@]}"; do
   167	        printf '  - %s\n' "$e" >&2
   168	    done
   169	    exit 1
   170	fi
   171	
   172	printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
   173	    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
   174	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/manifest.yaml | sed -n '1,130p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	spec_version: "2.1.0"
     2	bundle_version: "2.0.0"
     3	conformance_profile: "core"
     4	generated_on: "2026-05-19"
     5	generator: "agentic-ops-framework"
     6	schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
     7	source_commit: ""              # populated by release tooling at tag time
     8	source_tag: "v2.0.0"
     9	
    10	intent:
    11	  product_name: "agentic-ops-framework"
    12	  product_purpose: |
    13	    A framework for operating engineering work with coding
    14	    agents under spec-first discipline: typed IDEA → SPEC
    15	    artefacts with citation grammar, RFC 2119 scoping rules,
    16	    a per-type quality gate, owner-only authority transitions,
    17	    and a hermetic hook test harness. The framework eats its
    18	    own dog food and is offered as honest experience from one
    19	    studio's working internal practice.
    20	  developer_authority:
    21	    - role: "framework maintainer"
    22	      identity: "HasNoBeef <github:HasNoBeef>"
    23	  installer_authority:
    24	    - role: "user-with-agent"
    25	      capabilities_floor: "any-reasonably-capable-coding-agent"
    26	
    27	facets:
    28	  architecture:
    29	    path: "architecture/"
    30	    primary: "architecture/CONTEXT.md"
    31	    media_type: "text/markdown"
    32	    status: "complete"
    33	  deployment:
    34	    path: "deployment/"
    35	    primary: "deployment/install.md"
    36	    media_type: "text/markdown"
    37	    status: "complete"
    38	  behavior:
    39	    path: "behavior/"
    40	    primary: "behavior/features/"
    41	    primary_index: "behavior/features/lint-citation-grammar.feature"
    42	    media_type: "text/x.gherkin"
    43	    status: "partial"            # 2 of N features authored at v2.0
    44	  customization:
    45	    path: "customization/"
    46	    primary: "customization/contract.md"
    47	    media_type: "text/markdown"
    48	    status: "complete"
    49	  decisions:
    50	    path: "decisions/"
    51	    primary: "decisions/INDEX.md"
    52	    media_type: "text/markdown"
    53	    status: "partial"            # INDEX only; per-decision ADRs reserved for v2.x
    54	  quality:
    55	    path: "quality/"
    56	    primary: "quality/requirements.md"
    57	    media_type: "text/markdown"
    58	    status: "complete"
    59	  operations:
    60	    path: "operations/"
    61	    primary: "operations/failures.md"
    62	    media_type: "text/markdown"
    63	    status: "complete"
    64	  non-goals:
    65	    path: "non-goals/"
    66	    primary: "non-goals/INDEX.md"
    67	    media_type: "text/markdown"
    68	    status: "complete"
    69	
    70	resources:
    71	  schema:
    72	    path: "schema/SPEC.schema.md"
    73	    media_type: "text/markdown"
    74	  templates:
    75	    path: "templates/"
    76	    media_type: "text/markdown"
    77	  skills:
    78	    path: "skills/"
    79	    media_type: "text/markdown"
    80	  conformance:
    81	    path: "conformance/"
    82	    media_type: "application/vnd.framework.conformance-suite"
    83	    status: "reserved"           # conformance suite reserved for v2.x
    84	
    85	provenance:
    86	  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
    87	  sbom_ref: ""                   # populated by release tooling
    88	  slsa_level: ""                 # reserved; SLSA attestation lands when toolchain wired
    89	
    90	signature:
    91	  status: "unsigned"
    92	  # When signed: cosign signature + Rekor inclusion proof per
    93	  # https://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/sigstore-cosign.md §3

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '1,120p;540,690p;700,760p;900,970p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	id: 2026-05-19-v2-manifest-catalog-repack
     3	status: verified
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-ops-framework
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
    13	  - test -f spec-bundle/manifest.yaml
    14	  - bash scripts/validate-manifest.sh
    15	cites_decision: 2026-05-18-agentic-installation-methodology
    16	---
    17	
    18	# SPEC: Product A v2.0 — Manifest+Catalog Repack (Slice 2)
    19	
    20	Status: Draft v1
    21	Type: Contract
    22	Purpose: govern the v1.1 → v2.0 reorganization of
    23	agentic-ops-framework from a single-tree layout into a
    24	front-door-manifest + per-facet-catalog shape that
    25	exemplifies the methodology Product B publishes. Defines
    26	the v2.0 directory layout, the manifest schema, the
    27	per-facet sub-spec contracts (architecture / deployment /
    28	behavior / customization / decisions / quality /
    29	operations / non-goals), the migration path from v1.1, and
    30	the v2.0 conformance suite. Every methodology primitive
    31	cited here resolves to a primary-source artefact in the
    32	sibling repo's
    33	`research/primary-sources/<slug>.md` corpus.
    34	
    35	## Normative Language
    36	
    37	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    38	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    39	document are to be interpreted as described in RFC 2119 and RFC 8174
    40	when, and only when, they appear in all capitals.
    41	
    42	## 1. Problem Statement
    43	
    44	The parent Decision SPEC at
    45	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
    46	§7 binds the studio to repack the agentic-ops-framework
    47	v1.1 (the worked-case-study product) into the
    48	manifest+catalog shape the methodology advocates, as the
    49	paired-release artefact accompanying Product B v1.0. The
    50	methodology's recommended packaging
    51	(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
    52	§3 transferable building blocks;
    53	`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
    54	§3 manifest+descriptors+layers) is incompatible with
    55	Product A v1.1's current single-tree layout. Without the
    56	repack, Product B's longread would advocate manifest+catalog
    57	while its worked example shipped as a single tree —
    58	violating the rolls-royce dogfooding constraint
    59	(`owner://transcript-2026-05-18`).
    60	
    61	This SPEC defines the v2.0 layout, the front-door manifest
    62	schema, the per-facet sub-spec contracts grounded in the
    63	methodology's primary-source corpus, and the migration
    64	path from v1.1 → v2.0. <!-- lint-ok: no-citation -->
    65	
    66	## 2. Goals and Non-Goals
    67	
    68	Goals:
    69	
    70	- Define the v2.0 directory layout that exemplifies
    71	  manifest+catalog packaging
    72	  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
    73	  §3).
    74	- Author the front-door `spec-bundle/manifest.yaml`
    75	  schema (machine-readable; lists spec_version,
    76	  conformance_profile, pointers to per-facet sub-specs,
    77	  signature placeholder).
    78	- Author per-facet sub-spec contracts for the eight
    79	  facets enumerated in research §5.1 (the methodology's
    80	  packaging recommendation).
    81	- Author a `scripts/validate-manifest.sh` mechanical
    82	  gate that checks the manifest references every named
    83	  sub-spec and every sub-spec is registered in the
    84	  manifest.
    85	- Define a v1.1 → v2.0 migration index: for each v1.1
    86	  top-level entry, which v2.0 facet absorbs it (or which
    87	  v2.0 entry replaces it).
    88	- Preserve every v1.1 capability (lint, hooks, skills,
    89	  CI) — v2.0 reorganizes; it MUST NOT regress
    90	  functionality.
    91	
    92	Non-goals:
    93	
    94	- Renaming the framework (it remains
    95	  `agentic-ops-framework`).
    96	- Removing v1.1's `skills/` content (skills are a
    97	  first-class facet of v2.0, just located under
    98	  `spec-bundle/skills/` per the new layout).
    99	- Adopting OCI-artifact distribution at v2.0 (the
   100	  manifest's signature field is reserved but not
   101	  populated; OCI-distribution lands at v2.x once
   102	  Sigstore signing tooling is wired in).
   103	- Cross-repo refactor of the sibling fleet repos that
   104	  consume Product A's `.agents/` content via
   105	  `fleet-sync.sh` (any consumer-side changes are
   106	  separate Task SPECs in the fleet repos).
   107	- Authoring the methodology longread or per-facet
   108	  sub-spec CONTENT for Product B itself — that is
   109	  slice 3 / 4 of the parent Decision.
   110	
   111	## 3. System Overview
   112	
   113	The v2.0 framework reorganizes around a front-door
   114	manifest plus eight per-facet sub-spec directories:
   115	
   116	```
   117	agentic-ops-framework/
   118	├── LICENSE
   119	├── README.md                          # v2.0 entry + migration note
   120	├── AGENTS.md
   540	that consume Product A's content via `fleet-files.txt`),
   541	the manifest in `fleet-files.txt` is updated to point at
   542	the new `spec-bundle/<facet>/` paths. This is a separate
   543	Task SPEC in `bes-fleet-policy` once v2.0 lands; it is
   544	explicitly out of scope here.
   545	
   546	## 8. Schema Specification
   547	
   548	### 8.1 Manifest schema (formal — v2.1.0)
   549	
   550	The manifest is YAML. Top-level keys (REQUIRED unless
   551	noted). Fields marked **(v2.1)** were added per the codex
   552	remediation amendment at
   553	`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   554	§7.E (finding 3.5) — manifest spec_version bumped from
   555	2.0.0 to 2.1.0.
   556	
   557	| Field | Type | Required | Notes |
   558	|---|---|---|---|
   559	| `spec_version` | string (semver) | yes | This manifest schema's version |
   560	| `bundle_version` | string (semver) | yes | This bundle release |
   561	| `conformance_profile` | enum | yes | `core` \| `extension` \| `real-integration` |
   562	| `generated_on` | string (ISO date) | yes | YYYY-MM-DD |
   563	| `generator` | string | yes | Source repo identifier |
   564	| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
   565	| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
   566	| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
   567	| `intent` | object | yes | See §8.2 |
   568	| `facets` | object | yes | See §8.3 |
   569	| `resources` | object | OPTIONAL | See §8.4 |
   570	| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
   571	| `signature` | object | OPTIONAL | See §8.5 |
   572	
   573	### 8.2 `intent` block
   574	
   575	| Field | Type | Required |
   576	|---|---|---|
   577	| `product_name` | string | yes |
   578	| `product_purpose` | string (multi-line) | yes |
   579	| `developer_authority` | list[role+identity] | yes |
   580	| `installer_authority` | list[role+capabilities_floor] | yes |
   581	
   582	### 8.3 `facets` block
   583	
   584	A map from facet name to facet record. Recognized facet
   585	names: `architecture`, `deployment`, `behavior`,
   586	`customization`, `decisions`, `quality`, `operations`,
   587	`non-goals`. Each facet record:
   588	
   589	| Field | Type | Required |
   590	|---|---|---|
   591	| `path` | string (relative) | yes |
   592	| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
   593	| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
   594	| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
   595	| `digest` | string | RECOMMENDED **(v2.1)** | `algorithm:hex` form per OCI Descriptor convention; lets consumers verify by hash |
   596	| `size` | integer | OPTIONAL **(v2.1)** | Size in bytes |
   597	| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
   598	
   599	Additional facets MAY appear; `validate-manifest.sh`
   600	allows extensions but warns.
   601	
   602	**v2.1 facet.primary directory rule (codex remediation
   603	finding 3.6)**: when `primary` is a directory path, the
   604	validator enforces that the directory exists AND that
   605	the file named by `primary_index` exists inside it AND
   606	(if `media_type` is set) at least one file in the
   607	directory matches the media type's file extension
   608	convention (`text/x.gherkin` → `*.feature`,
   609	`text/markdown` → `*.md`, etc.). The pre-v2.1 silent-
   610	allow on directory primaries is replaced with this
   611	explicit branch.
   612	
   613	### 8.4 `resources` block
   614	
   615	| Field | Type |
   616	|---|---|
   617	| `schema` | object with `path` |
   618	| `templates` | object with `path` |
   619	| `skills` | object with `path` |
   620	| `conformance` | object with `path` |
   621	
   622	Resource records MAY also include `media_type`,
   623	`digest`, `size`, `status` fields (same semantics as
   624	§8.3 facet record).
   625	
   626	### 8.5 `signature` block
   627	
   628	At v2.0 launch:
   629	- `status: unsigned` is the default.
   630	- Signed fields (`cosign_signature`, `rekor_inclusion`,
   631	  `signing_identity`) are reserved; populate at v2.x
   632	  when Sigstore tooling is wired in.
   633	
   634	### 8.6 `provenance` block (v2.1)
   635	
   636	Added per codex remediation amendment §7.E (finding 3.5).
   637	Carries SBOM + supply-chain attestation references:
   638	
   639	| Field | Type | Required | Notes |
   640	|---|---|---|---|
   641	| `sbom_format` | enum | OPTIONAL | `cyclonedx` \| `spdx` (default `cyclonedx` per the corpus entry `cyclonedx-sbom.md` §3) |
   642	| `sbom_ref` | string (URI) | OPTIONAL | URL or OCI digest of the SBOM artefact |
   643	| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
   644	
   645	## 9. Reference Algorithms
   646	
   647	### 9.1 validate-manifest (pseudocode)
   648	
   649	```
   650	function validate_manifest():
   651	  manifest = parse_yaml("spec-bundle/manifest.yaml")
   652	  errors = []
   653	
   654	  # 1. Schema version match.
   655	  if manifest.spec_version != "2.1.0":
   656	    errors.append("spec_version: expected 2.1.0, got " + manifest.spec_version)
   657	
   658	  # 2. Conformance profile valid.
   659	  if manifest.conformance_profile not in ["core", "extension", "real-integration"]:
   660	    errors.append("conformance_profile invalid")
   661	
   662	  # 3. Required top-level fields.
   663	  for field in ["bundle_version", "generated_on", "generator",
   664	                "intent", "facets"]:
   665	    if field not in manifest:
   666	      errors.append("missing field: " + field)
   667	
   668	  # 4. intent block well-formed.
   669	  for f in ["product_name", "product_purpose",
   670	            "developer_authority", "installer_authority"]:
   671	    if f not in manifest.intent:
   672	      errors.append("intent missing: " + f)
   673	
   674	  # 5. Facets bijection: every listed facet has a directory
   675	  #    with the named primary file; every spec-bundle/
   676	  #    subdir (except resource subdirs) is listed.
   677	  listed_facets = set(manifest.facets.keys())
   678	  fs_subdirs = set(filter(is_dir, ls("spec-bundle/"))) - RESOURCE_DIRS
   679	  if listed_facets != fs_subdirs:
   680	    errors.append("facets mismatch: listed but not on fs " +
   681	                  str(listed_facets - fs_subdirs) +
   682	                  "; on fs but not listed " +
   683	                  str(fs_subdirs - listed_facets))
   684	
   685	  for fname, fdef in manifest.facets.items():
   686	    if not exists("spec-bundle/" + fdef.primary):
   687	      errors.append("facet " + fname + " primary file missing: " + fdef.primary)
   688	
   689	  # 6. Product name matches repo.
   690	  if manifest.intent.product_name != "agentic-ops-framework":
   700	
   701	| Class | Trigger | Recovery |
   702	|---|---|---|
   703	| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
   704	| `facet-fs-mismatch` | Facet listed in manifest has no directory, or directory exists with no manifest entry | Author reconciles; either populate the directory or remove the facet entry |
   705	| `facet-primary-missing` | A facet's `primary` file does not exist | Author creates the file (with placeholder content if needed) and re-runs |
   706	| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
   707	| `conformance-suite-regression` | A previously passing conformance test now fails after the repack | Author fixes the regression OR reverts the touch that caused it (the repack must preserve v1.1 functional capabilities) |
   708	
   709	## 11. Trust Boundary / Security
   710	
   711	- The repack does not introduce new attack surface. The
   712	  manifest is read-only data; `validate-manifest.sh` is
   713	  a read-only check.
   714	- The signature field is reserved unsigned at v2.0.
   715	  Sigstore signing
   716	  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
   717	  §3) lands at v2.x as a follow-on Task SPEC.
   718	- The migration does not delete user-created files; only
   719	  framework-owned artefacts are relocated. Anything
   720	  under user's gitignored paths is untouched.
   721	- No secrets are introduced; no requires_secrets in
   722	  front-matter.
   723	
   724	## 12. Observability
   725	
   726	- `validate-manifest.sh` prints diagnostic lines to
   727	  stderr per failed check; exit 0 iff all checks pass.
   728	- CI job `validate-manifest` runs on every push +
   729	  pull request; CI status is the observability surface
   730	  for bundle health.
   731	- The bundle's `spec_version` field is the
   732	  user-observable schema version; consumers can pin
   733	  against a specific schema version.
   734	
   735	## 13. Test and Validation Matrix
   736	
   737	| AC | Test |
   738	|---|---|
   739	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` exits 0 |
   740	| AC-2 | `cmd://test -f spec-bundle/manifest.yaml` exits 0 |
   741	| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
   742	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
   743	| AC-5 | `cmd://bash tests/hooks/run-tests.sh` reports 33 pass / 0 fail (no regressions from repack) |
   744	| AC-6 | `cmd://bash scripts/lint-spec.sh examples/*/IDEA.md examples/*/SPEC.md` lint clean on every example (no regressions) |
   745	| AC-7 | `cmd://gh -R buildepicshit/agentic-ops-framework run list --limit 1` shows post-repack CI run with conclusion: success |
   746	| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
   747	| AC-9 | `CHANGELOG.md` contains a `## v2.0` entry documenting the reorganization + breaking-changes index |
   748	
   749	## 14. Implementation Checklist (Definition of Done)
   750	
   751	- [ ] DoD-1: `spec-bundle/manifest.yaml` authored
   752	      conforming to §6.1 / §8 schema.
   753	- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
   754	      `cmd://bash scripts/validate-manifest.sh` exits 0
   755	      against the populated bundle.
   756	- [ ] DoD-3: §7.1 migration index executed; every v1.1
   757	      artefact accounted for (moved, removed, or
   758	      retained-at-top-level).
   759	- [ ] DoD-4: Each of the eight facets per §6.2 has a
   760	      `<facet>/<primary>` file (initially MAY be a
   900	- `scripts/validate-skill-frontmatter.sh` — scans
   901	  `spec-bundle/skills/` (was `skills/`)
   902	
   903	**Removed**:
   904	- `docs/` (was empty)
   905	- `workflow/` (after UNIVERSAL.md moved)
   906	
   907	### 19.2 Commands run
   908	
   909	- `cmd://mkdir -p spec-bundle/{architecture,deployment,
   910	  behavior/features,customization/profiles,decisions,
   911	  quality,operations,non-goals,conformance}`.
   912	- `cmd://git mv schema spec-bundle/schema` +
   913	  `templates spec-bundle/templates` +
   914	  `skills spec-bundle/skills` +
   915	  `workpads spec-bundle/templates/workpads`.
   916	- `cmd://mv workflow/UNIVERSAL.md
   917	  spec-bundle/operations/workflow-universal.md` +
   918	  `git rm -r workflow` + `rmdir docs`.
   919	- `cmd://chmod +x scripts/validate-manifest.sh`.
   920	- `cmd://bash scripts/lint-spec.sh
   921	  specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
   922	  — exit 0 (0 errors, 0 warnings, 50 citation hits).
   923	- `cmd://bash scripts/validate-manifest.sh` — exit 0
   924	  (PASS — manifest schema 2.0.0, conformance core, 8
   925	  facets).
   926	- `cmd://bash scripts/validate-skill-frontmatter.sh` —
   927	  exit 0 (clean; 20 skills under spec-bundle/skills/).
   928	- `cmd://bash tests/hooks/run-tests.sh` — 33 pass /
   929	  0 fail.
   930	- `cmd://node --check scripts/preflight.mjs` — clean.
   931	- Per-example lint: 7 examples × `bash scripts/lint-spec.sh
   932	  examples/*/IDEA.md examples/*/SPEC.md` — all exit 0.
   933	- `cmd://git add` (explicit; no bulk staging) + commit
   934	  + `git push origin main`.
   935	- `cmd://gh -R buildepicshit/agentic-ops-framework run
   936	  list --limit 1` — CI run `26074043565` reports
   937	  `conclusion: success`.
   938	
   939	### 19.3 Verification result
   940	
   941	PASS. All 9 ACs met except AC-8 (v2.0.0 tag) which is
   942	pending immediately after this commit lands. CI is
   943	green on the v2.0 repack commit (`1104e3a`); five jobs
   944	pass (lint-spec, validate-skills, test-hooks,
   945	validate-manifest, preflight-self-check).
   946	
   947	The manifest+catalog packaging successfully exemplifies
   948	the methodology the sibling repo
   949	`agentic-installation-methodology` publishes. The
   950	worked-case-study contract is discharged: Product A's
   951	v2.0 IS the manifest+catalog shape Product B
   952	advocates.
   953	
   954	### 19.4 Residual risk
   955	
   956	- **Scaffold-grade content in several facets**: the
   957	  spec-bundle/conformance/ directory is empty;
   958	  per-decision ADRs at spec-bundle/decisions/ADR-NNN-
   959	  <slug>.md are not yet authored (only INDEX is); the
   960	  Structurizr DSL diagrams at
   961	  spec-bundle/architecture/*.dsl are not yet authored.
   962	  This is explicitly documented in CHANGELOG v2.0 as
   963	  "reserved for v2.x". The bundle is structurally
   964	  complete but content-thin in those facets.
   965	- **Cross-reference rot**: existing internal SPECs
   966	  under specs/ that referenced `file://schema/...`,
   967	  `file://templates/...`, `file://skills/...` paths
   968	  now point at locations that no longer exist. The
   969	  lint script does not validate file:// paths deeply,
   970	  so these are not caught by CI. They are historical

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
validate-manifest: PASS — manifest schema 2.1.0, conformance core, 8 facets

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 823ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  66
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

codex
The manifest itself has `primary_index` for the behavior directory primary, but the validator still only checks that the primary directory exists. I’m checking whether that is the only carry-through issue or whether old v1.1 paths remain in the docs/templates/skills too.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba CONTRIBUTING.md | sed -n '1,90p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Contributing to agentic-ops-framework
     2	
     3	The framework eats its own dog food: contributions go through
     4	the same lifecycle the framework documents. Non-trivial changes
     5	require an IDEA → SPEC pair before code lands.
     6	
     7	## Trivial changes
     8	
     9	Typo fixes, single-line doc clarifications, single-file
    10	fixes ≤ 50 lines: use the Fastpath SPEC pattern (see
    11	`examples/fastpath-fix-readme-typo/SPEC.md`). Author a single
    12	SPEC at `specs/<YYYY-MM-DD>-<slug>/SPEC.md`, status: closed,
    13	in the same PR as the fix.
    14	
    15	## Non-trivial changes
    16	
    17	For anything else (a new skill, a schema change, a new
    18	hook, a non-trivial bug fix touching multiple files):
    19	
    20	1. **Read `OPERATING_MODEL.md`** — the lifecycle and posture
    21	   you're contributing into.
    22	2. **Read `spec-bundle/schema/SPEC.schema.md`** — the citation grammar
    23	   and front-matter rules (v2.0 layout; v1.x consumers
    24	   see `schema/SPEC.schema.md`).
    25	3. **Open an issue first** with a one-paragraph problem
    26	   statement. The framework maintainer will signal whether
    27	   it's worth pursuing before you invest in a full SPEC.
    28	4. **Author an IDEA** at `specs/<YYYY-MM-DD>-<slug>/IDEA.md`
    29	   using `spec-bundle/templates/IDEA.template.md` (v2.0
    30	   layout). The IDEA covers
    31	   problem, substance, constraints, approaches considered,
    32	   recommendation, owner-blocking questions.
    33	5. **Author a SPEC** at `specs/<YYYY-MM-DD>-<slug>/SPEC.md`
    34	   using the appropriate type template (task / contract /
    35	   decision). The IDEA must reach `status: ready-for-spec`
    36	   first.
    37	6. **Run lint locally** before opening the PR:
    38	
    39	   ```bash
    40	   bash scripts/lint-spec.sh specs/<your-spec>/IDEA.md
    41	   bash scripts/lint-spec.sh specs/<your-spec>/SPEC.md
    42	   bash scripts/validate-skill-frontmatter.sh
    43	   bash tests/hooks/run-tests.sh
    44	   ```
    45	
    46	   All MUST exit 0.
    47	7. **Open the PR**. CI runs the four jobs. Address review
    48	   feedback or post explicit pushback. A different-family
    49	   reviewer ideally signs off (the framework's cross-family
    50	   review pattern applies to its own development).
    51	8. **Merge happens on owner approval**. The owner flips the
    52	   SPEC `approved-pending-owner → approved → verified` and
    53	   merges.
    54	
    55	## Citation discipline
    56	
    57	Every factual claim in every artefact MUST carry a citation
    58	prefix from the grammar (`file://`, `cmd://`, `url://`,
    59	`decision-authority://<role>:<date>`, `judgment://owner`,
    60	`judgment://agent-synthesis`). Memory and training data are
    61	inputs to your reasoning, not citable evidence. The lint
    62	script enforces this.
    63	
    64	## Commit messages
    65	
    66	Conventional Commits 1.0.0:
    67	
    68	```
    69	<type>(<optional scope>): <subject>
    70	```
    71	
    72	Allowed types: `feat`, `fix`, `build`, `chore`, `ci`, `docs`,
    73	`style`, `refactor`, `perf`, `test`, `spec`. Breaking changes
    74	mark with `!` after the type or a `BREAKING CHANGE:` footer.
    75	
    76	## No AI attribution
    77	
    78	Per the `block-ai-attribution.sh` hook: do NOT include
    79	`Co-Authored-By: Claude` / `Co-Authored-By: GPT-...` or
    80	similar trailers. The hook will reject the commit. The
    81	framework's posture: AI tools are inputs to your thinking,
    82	not credited authors of the contribution.
    83	
    84	## Testing
    85	
    86	The framework ships its own test harness at
    87	`tests/hooks/run-tests.sh`. If you add a hook, add tests for
    88	its block path, allow path, and at least one false-positive
    89	guard. The harness is hermetic — use the existing sandbox-
    90	fixture pattern; don't depend on the framework repo's own

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/TASK.template.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	id: T-NN-kebab-case-slice
     3	parent_spec: YYYY-MM-DD-kebab-case-spec-id
     4	status: todo
     5	owner: unassigned
     6	model_route: gpt-5.5
     7	cross_validation_lane: claude-opus-4-7
     8	verification_lane: gpt-5.5
     9	mode: HITL
    10	deps: []
    11	write_scope: disjoint
    12	parallelism_evaluated: true
    13	acceptance_commands: []
    14	tracker_issue: null
    15	---
    16	
    17	<!--
    18	Per-task artefact emitted by the `/decompose-spec` workflow from an
    19	approved SPEC's §11 Execution Plan. One TASK.md == one tracker issue
    20	== one autonomous-dispatch runner per-issue workspace run.
    21	
    22	The parent SPEC remains the authority. This file IS NOT a peer
    23	authority — it carries the slice's executable scope, the model lane
    24	assignments, the verification commands, and the evidence trail.
    25	
    26	Front-matter schema:
    27	
    28	- `id` — kebab-case slice identifier (e.g. `T-01-fleet-baseline-body`).
    29	  MUST be unique within the parent SPEC's `tasks/` directory.
    30	- `parent_spec` — id of the SPEC this task implements.
    31	- `status` — one of `todo` | `in-progress` | `in-review` | `done` |
    32	  `blocked`. Mirrors tracker active states used in WORKFLOW.md
    33	  YAML config. Owner alone moves to `done`.
    34	- `owner` — agent id or `unassigned`.
    35	- `model_route` — primary execution lane. MUST be a model slug from
    36	  `your model-routing policy` in your routing policy.
    37	- `cross_validation_lane` — DIFFERENT model FAMILY from
    38	  `model_route`. The cross-validation reviewer reads the diff/
    39	  artefact produced by the primary lane and emits findings before
    40	  Human Review. SHOULD be a different family (different model family) per
    41	  `your parallelism-and-routing SPEC`
    42	  §7.3.
    43	- `verification_lane` — model lane for fresh-evidence verification
    44	  (running acceptance_commands, capturing output). MAY equal
    45	  `model_route` if the verification is purely mechanical (lint,
    46	  test); SHOULD be a different family for behavioral verification.
    47	- `mode` — `HITL` (human-in-the-loop) or `AFK` (autonomous). AFK
    48	  requires bounded ownership, explicit acceptance, no mid-slice
    49	  owner judgment, safe-stop on ambiguity per
    50	  `file://skills/approved-spec-decomposition/SKILL.md`
    51	  "AFK Eligibility".
    52	- `deps` — list of TASK.md ids that MUST reach `done` before this
    53	  one starts.
    54	- `write_scope` — `none` | `disjoint` | `overlap`. Parallel writes
    55	  REQUIRE `disjoint` per
    56	  `your parallelism-and-routing SPEC`
    57	  §6.1.1.
    58	- `parallelism_evaluated` — boolean. MUST be true. Records that the
    59	  decomposition phase evaluated parallelism per §7.1 of the v2
    60	  routing SPEC.
    61	- `acceptance_commands` — list of shell commands that MUST exit 0
    62	  for this task to flip `in-progress → in-review`. Subset of the
    63	  parent SPEC's acceptance_commands plus task-specific checks.
    64	- `tracker_issue` — tracker identifier (e.g. `PROJ-123`) once the task
    65	  is dispatched. Null until decomposition is reflected in the
    66	  tracker.
    67	
    68	Citation discipline applies: every factual claim in §3 (Scope), §4
    69	(Read context), and §6 (Evidence) MUST carry a citation prefix per
    70	`file://templates/SPEC.schema.md` §2.
    71	-->
    72	
    73	# TASK: [Slice Title]
    74	
    75	## 1. Goal
    76	
    77	One sentence. The user-, contract-, or workflow-visible outcome this
    78	slice delivers.
    79	
    80	## 2. Parent SPEC anchor
    81	
    82	This task implements §[NN] [section title] of
    83	`file://specs/{{parent_spec}}/SPEC.md`. The parent SPEC remains the
    84	authority for what is in scope. This file is the executable
    85	contract for THIS slice only.
    86	
    87	## 3. Scope
    88	
    89	### 3.1 Owned files
    90	
    91	Files this worker MAY edit:
    92	
    93	- `path/to/file.ext` — [why this file is in scope; cite the parent
    94	  SPEC section that names it].
    95	
    96	### 3.2 Read context
    97	
    98	Files this worker MUST read before editing:
    99	
   100	- `file://AGENTS.md`
   101	- `file://specs/{{parent_spec}}/SPEC.md`
   102	- `file://your model-routing policy` (before any subagent dispatch)
   103	- [other repo-specific reads]
   104	
   105	### 3.3 Out of scope
   106	
   107	Explicit non-goals for this slice. Surface as backlog tracker issues
   108	if discovered during execution per
   109	`file://workflow/UNIVERSAL.md` "Universal guardrails".
   110	
   111	## 4. Model dispatch
   112	
   113	| Lane | Model | Role |
   114	|---|---|---|
   115	| Primary | `{{model_route}}` | Implementation + workpad management. |
   116	| Cross-validation | `{{cross_validation_lane}}` | Independent diff review before Human Review. Different family from primary. |
   117	| Verification | `{{verification_lane}}` | Run acceptance_commands; capture fresh evidence. |
   118	
   119	**Subagent dispatch rules** (from
   120	`your parallelism-and-routing SPEC`
   121	§7.1, §7.2):
   122	
   123	- The primary agent MUST evaluate whether independent sub-work in
   124	  this slice can fan out (read-only research, code review,
   125	  verification streams).
   126	- Subagents MUST receive bounded scope, allowed files, expected
   127	  output, and write/read posture.
   128	- Subagents MUST NOT modify the parent SPEC.md or this TASK.md
   129	  (read-only).
   130	- Long iterative loops SHOULD be bounded (≤ 50 tool uses or ≤ 30
   131	  minutes per subagent) per
   132	  `your spec-evidence registry`
   133	  §5.
   134	
   135	## 5. Acceptance
   136	
   137	### 5.1 Acceptance commands
   138	
   139	Each entry in front-matter `acceptance_commands` MUST exit 0 before
   140	this task flips `in-progress → in-review`. List them here with a
   141	one-line rationale:
   142	
   143	- `cmd://...` — [what this proves].
   144	
   145	### 5.2 Acceptance criteria
   146	
   147	- [ ] AC-1: [criterion].
   148	- [ ] AC-2: [criterion].
   149	
   150	## 6. Evidence
   151	
   152	Filled by the executor before `in-review`:
   153	
   154	- Files changed: [list].
   155	- Commands run + exit codes: [list].
   156	- Cross-validation findings: [summary; full report linked from PR].
   157	- Residual risk: [if any].
   158	
   159	## 7. Stop conditions
   160	
   161	Reasons to halt and route back to the owner or root manager:
   162	
   163	- Owner judgment required mid-slice.
   164	- Discovered scope expansion.
   165	- Cross-validation surfaced a blocker.
   166	- Acceptance commands cannot pass under the bounded scope.
   167	- Required external auth/secret missing.
   168	
   169	## 8. Tracker binding
   170	
   171	Once dispatched:
   172	
   173	- Tracker issue: `{{tracker_issue}}`
   174	- PR (when opened): [URL]
   175	- Workpad comment ID: [tracker comment id]
   176	
   177	The tracker issue's `## Workpad` comment is the live execution
   178	journal per `file://workflow/UNIVERSAL.md` Step 1.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/approved-spec-decomposition/SKILL.md | sed -n '1,150p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: approved-spec-decomposition
     3	description: "BLOCKING. Use after a SPEC.md is approved and before in-execution to emit one TASK.md per executable slice into specs/<id>/tasks/. Each TASK.md binds a tracker issue 1:1, carries primary/cross-validation/verification model lanes, and gates the parent SPEC's transition approved -> decomposed -> in-execution. Tasks become the source-of-truth dispatchable units; agents and autonomous dispatch runners anchor on them."
     4	---
     5	
     6	# Approved Spec Decomposition
     7	
     8	This skill is the **authoritative bridge artefact** between an
     9	approved SPEC and dispatchable work. It runs after
    10	`status: approved` and before `status: in-execution`.
    11	
    12	It is no longer a planning aid. It produces durable TASK.md files
    13	that dispatch runners + subagents execute against. The
    14	parent SPEC remains the immutable authority (Completion Report
    15	aside); the TASK.md files are the executable contracts for each
    16	slice and the 1:1 binding to tracker issues.
    17	
    18	## When to use
    19	
    20	- A SPEC.md has front-matter `status: approved` and contains a §11
    21	  Execution Plan (Task SPEC) or §11 / §14 / §15 Implementation
    22	  Checklist (Contract SPEC) that names ≥ 2 distinct slices, OR
    23	- The owner has directed decomposition for parallel execution per
    24	  `file://agents/MODEL_ROUTING.md` "Routing Matrix" (multi-agent
    25	  coding row).
    26	
    27	Skip when:
    28	
    29	- The SPEC is small enough to execute as one slice; in that case
    30	  emit a single TASK.md and proceed.
    31	- The SPEC is a Decision SPEC (Decision SPECs do not have
    32	  implementation phases; their cascade is by id-citation per
    33	  `judgment://agent-synthesis` §3).
    34	
    35	## Preconditions
    36	
    37	REFUSE to proceed unless:
    38	
    39	1. `<spec_path>` exists with parseable front-matter.
    40	2. `status: approved` (set by owner per
    41	   `file://agents/specs/SPEC.schema.md` §1.3).
    42	3. Acceptance commands present, OR explicit explanation of empty
    43	   list in §12 Acceptance Criteria.
    44	4. Open Questions resolved.
    45	5. Write ownership can be bounded (each slice has disjoint
    46	   `owned_files` per
    47	   `judgment://agent-synthesis`
    48	   §6.1.1).
    49	
    50	If any precondition fails, stop and surface the exact blocker with a
    51	file/line citation. Do NOT emit TASK.md files.
    52	
    53	## Procedure
    54	
    55	1. Read the approved SPEC end-to-end.
    56	2. Read `file://agents/MODEL_ROUTING.md` "Routing Matrix" to map task
    57	   classes to model lanes.
    58	3. Read the parent SPEC's §11 Execution Plan (Task) or §11/§14/§15
    59	   (Contract). Each slice in the plan becomes one TASK.md.
    60	4. For each slice, copy `file://agents/specs/TASK.template.md` to
    61	   `specs/<parent_spec_id>/tasks/T-NN-<slug>.md` and fill in:
    62	   - `id` — `T-NN-<slug>` matching the file name.
    63	   - `parent_spec` — the SPEC's id.
    64	   - `status` — `todo`.
    65	   - `owner` — `unassigned`.
    66	   - `model_route` — primary lane from your studio's model-
    67	     routing policy for the slice's `task_class` (research,
    68	     implementation, code-review, verification, docs, planning).
    69	     Pick one frontier-grade model from the family best suited
    70	     to the task class.
    71	   - `cross_validation_lane` — DIFFERENT family from
    72	     `model_route`. The primary executes the work; the
    73	     cross-validation lane reads the diff and produces an
    74	     independent review. Different-family is the load-bearing
    75	     primitive — same-family review is a permissible fallback
    76	     only with explicit labelling (see
    77	     `references/cross-validation-lanes.md`).
    78	   - `verification_lane` — same family as primary for mechanical
    79	     verification (lint, test); different family for behavioral
    80	     verification (does the change actually do what the SPEC says).
    81	   - `mode` — `AFK` only when AFK Eligibility (below) is satisfied;
    82	     otherwise `HITL`.
    83	   - `deps` — list of T-IDs that MUST reach `done` before this one
    84	     starts.
    85	   - `write_scope` — `disjoint` for parallel slices; `overlap`
    86	     blocks parallel dispatch and requires a serial integration
    87	     order.
    88	   - `parallelism_evaluated: true`.
    89	   - `acceptance_commands` — subset of the parent SPEC's
    90	     acceptance_commands that prove THIS slice plus any task-local
    91	     verification.
    92	5. Author each TASK.md's body sections per the template:
    93	   - §1 Goal
    94	   - §2 Parent SPEC anchor (cite the SPEC section this slice
    95	     implements)
    96	   - §3 Scope (owned files, read context, out-of-scope)
    97	   - §4 Model dispatch (lane table)
    98	   - §5 Acceptance (commands + criteria)
    99	   - §6 Evidence (left blank for executor)
   100	   - §7 Stop conditions
   101	   - §8 tracker binding (filled when dispatched)
   102	6. Compute integration order. If any slice has `deps`, it cannot
   103	   start before its dependencies reach `done`. Record the
   104	   topological order in the parent SPEC's §17 Completion Report
   105	   (Task) or §19 Completion Report (Contract) as a Decomposition
   106	   Index that lists `T-NN: <title>` in execution order.
   107	7. Run `cmd://bash agents/scripts/lint-spec.sh
   108	   specs/<parent_spec_id>/SPEC.md` and confirm exit 0.
   109	8. Surface the decomposition to the owner with the Decomposition
   110	   Index and the Parallelism Decision Record (Decision: `fanout` |
   111	   `local`; Rationale: …; Lanes: …) per
   112	   `judgment://agent-synthesis`
   113	   §8.1.
   114	9. Owner reviews the decomposition. **One-shot approval**, not
   115	   per-task. On owner directive, flip the parent SPEC's status
   116	   `approved → decomposed`. The skill MUST NOT set the status; only
   117	   the owner does (extends the existing owner-only `approved` /
   118	   `closed` rule from
   119	   `file://agents/specs/SPEC.schema.md` §1.3).
   120	10. After owner approval, agents may dispatch tasks. Each TASK.md's
   121	    tracker issue is created (manually or via tooling); the task's
   122	    `tracker_issue` field is filled. the dispatcher picks up the issue and
   123	    runs the per-issue workspace.
   124	
   125	## AFK Eligibility (per task)
   126	
   127	Mark a task `AFK` only when ALL of:
   128	
   129	- `owned_files` are bounded and disjoint from other AFK slices.
   130	- `acceptance_commands` are explicit and mechanically verifiable.
   131	- No mid-slice owner judgment is required.
   132	- Agent can stop safely on ambiguity (escalate to workpad blocker).
   133	- The cross-validation lane is configured and a different family
   134	  from primary.
   135	
   136	Otherwise mark `HITL`.
   137	
   138	## Cross-validation pattern
   139	
   140	Every TASK.md MUST name a `cross_validation_lane` of a different
   141	model family from `model_route`. The lane runs between
   142	`in-progress` and `in-review`. Procedure, executor skills, and
   143	the same-family-proxy fallback (SE2) when cross-family dispatch
   144	is unavailable:
   145	[`references/cross-validation-lanes.md`](references/cross-validation-lanes.md).
   146	
   147	## Hard Rules
   148	
   149	- Do not decompose unapproved specs.
   150	- Do not emit TASK.md without a `cross_validation_lane` of a

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/SKILL.md | sed -n '55,250p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    55	cite it in §4 Authority Map and mirror its contract shape rather
    56	than re-deriving its primitives. When adopting an external tool
    57	that fits procedure (CLI, library, runner), follow the
    58	six-part shape.
    59	
    60	Procedure + worked examples (the autonomous-dispatch runner, worktrunk):
    61	[`references/reference-architecture.md`](references/reference-architecture.md).
    62	
    63	## Templates
    64	
    65	The four authoring templates live at:
    66	
    67	- `templates/IDEA.template.md` — the IDEA artefact.
    68	- `templates/SPEC.task.template.md` — concrete, scoped, verifiable
    69	  work.
    70	- `templates/SPEC.contract.template.md` — stateful, multi-component,
    71	  protocol-defining work.
    72	- `templates/SPEC.decision.template.md` — binding choice between
    73	  named options.
    74	
    75	Cross-template conventions (front-matter schema, citation grammar,
    76	RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
    77	Templates reference that schema rather than restating it. Read the
    78	schema before authoring.
    79	
    80	The produced IDEA.md and SPEC.md live at `specs/<spec_id>/` in
    81	the repo that owns the work. In a fleet topology the source
    82	policy repo holds fleet-policy specs under `specs/`; each
    83	child repo holds its own work under `.agents/specs/` (or
    84	equivalent gitignored path for OSS-posture repos). Pick the
    85	location based on which repo owns the change.
    86	
    87	## Type Selection
    88	
    89	Pick the type before opening a SPEC template. The IDEA artefact
    90	records the choice as front-matter `implies_spec_type`; the SPEC
    91	inherits it as `type`.
    92	
    93	Decision tree:
    94	
    95	0. **Is this small, single-component, reversible work under
    96	   explicit owner directive** — meeting ALL of: ≤ 1 file, ≤ 50
    97	   lines, single component, no public-contract or persisted-state
    98	   impact, no cross-session compounding, owner-cited authority?
    99	   YES → `fastpath`. Use `SPEC.fastpath.template.md`. No IDEA, no
   100	   review, no decomposition. Capture-after by default; lands at
   101	   `status: closed` in the same commit as the work. See
   102	   `skills/fast-path/SKILL.md` for thresholds. **If ANY
   103	   threshold is missed, do not use fastpath** — fall through to
   104	   the steps below.
   105	1. **Is this a binding choice between two or more named options
   106	   (stack pick, architecture pick, vendor pick, policy pick)?**
   107	   YES → `decision`. Use `SPEC.decision.template.md`. The Decision
   108	   Statement section is the only place RFC 2119 keywords appear in
   109	   a Decision spec.
   110	2. **Otherwise: does the work specify behavior that future agents
   111	   implement against?** Signs: stateful (state machine, persistence,
   112	   idempotency), multi-component (more than one skill/script/repo
   113	   coordinates), defines a wire or file protocol, has a non-trivial
   114	   failure surface, has observability requirements, will be referenced
   115	   by other specs. YES → `contract`. Use
   116	   `SPEC.contract.template.md`. Contract specs MUST pass the lint
   117	   script.
   118	3. **Otherwise: this is concrete, scoped, verifiable work with a
   119	   defined endpoint** (add a file, refactor a module, fix a bug, run
   120	   a migration). → `task`. Use `SPEC.task.template.md`. Task is the
   121	   default; when in doubt and the work is small AND meets fastpath
   122	   thresholds, prefer fastpath; otherwise, task.
   123	
   124	Edge cases:
   125	
   126	- Mixed Decision-and-implementation work: author the Decision spec
   127	  first, then a follow-on Task or Contract spec for the
   128	  implementation. Do not fold them into one artefact.
   129	- "Refactor" that changes a public contract: this is a Contract spec,
   130	  not a Task spec.
   131	- Owner explicitly directs a type via `judgment://owner`: honour the
   132	  directive; do not re-derive.
   133	
   134	## Contract §17 OPTIONAL when empty
   135	
   136	Per the ceremony-weight Decision (`judgment://agent-synthesis`),
   137	Contract SPEC §17 Open Questions is OPTIONAL when empty:
   138	
   139	- Authors MAY omit the §17 heading entirely when no open
   140	  questions remain.
   141	- If retained, the body MAY contain only `None.`, `N/A`, or a
   142	  single citation to the producing IDEA's §6 / §7 resolution.
   143	- If non-empty, existing per-section checks apply (citation
   144	  grammar, RFC 2119, etc.).
   145	
   146	This relaxation only applies to Contract SPECs; Task and
   147	Decision SPECs continue to require §17.
   148	
   149	## Contract §1 / §13 capture-after defer-shorthand
   150	
   151	Per the same ceremony-weight Decision, Contract SPECs landing at
   152	`status: verified` via the capture-after exception
   153	(`file://templates/SPEC.schema.md` §1.3) MAY use a
   154	defer-shorthand for §1 Problem Statement and §13 Test and
   155	Validation Matrix:
   156	
   157	- The section body MAY be a one-paragraph cite-by-id pointer
   158	  to the producing IDEA's corresponding section, e.g.
   159	  `See file://specs/<id>/IDEA.md §1 (capture-after defer).`
   160	- The shorthand is RECOMMENDED only when the producing IDEA's
   161	  section is itself substantive — the defer must resolve to
   162	  real content, not to another defer.
   163	- Lint passes the shorthand by construction (a single-paragraph
   164	  `file://` cite satisfies the §2 citation-grammar rule); the
   165	  per-type gate in `spec-review` validates that the cited IDEA
   166	  section exists and is non-empty.
   167	
   168	For Contracts at any other status (`draft`, `approved`,
   169	`in-execution`), §1 and §13 MUST be filled with substantive
   170	content; defer-shorthand is rejected by the spec-review gate.
   171	
   172	## Fleet-Wide Principle SPECs
   173	
   174	Fleet-level principles (binding tenets that cross every
   175	fleet product) are authored as Decision SPECs under the
   176	`principle-<topic>` slug taxonomy.
   177	
   178	Conventions, cascade-by-id-citation mechanics, and the
   179	verbatim-to-normative review trace:
   180	[`references/studio-principles.md`](references/studio-principles.md).
   181	
   182	## Citation Discipline
   183	
   184	Every factual claim in IDEA.md and SPEC.md MUST carry a citation
   185	prefix. Allowed prefixes: `file://`, `cmd://`, `url://`, `owner://`,
   186	`judgment://owner`, `judgment://agent-synthesis`. The full grammar,
   187	positive and negative examples, and the list of constructs that do
   188	NOT require citation (section headers, editorial framing, internal
   189	definitions, internal cross-references, pseudocode, domain-model
   190	field references) live in
   191	`file://templates/SPEC.schema.md` §2.
   192	
   193	Operating principle: agent memory and training are LEGITIMATE INPUTS
   194	to the ideation conversation and to your authoring reasoning. They
   195	are NOT citable evidence in the artefact. This is the input-vs-
   196	artefact distinction recorded in `OPERATING_MODEL.md` Memory
   197	Policy. If you cannot back a claim with `file://`, `cmd://`,
   198	`url://`, or an owner-affirmed judgment, the claim does not belong
   199	in the artefact.
   200	
   201	When the lint flags a sentence that is in fact editorial, append
   202	`<!-- lint-ok: no-citation -->` per
   203	`file://templates/SPEC.schema.md` §2.5. Use sparingly; pervasive
   204	suppression is itself a quality signal.
   205	
   206	## Quality Gate Handoff
   207	
   208	This skill MUST NOT set `status: approved` on any artefact.
   209	Authority for approval rests with the owner alone, per
   210	`file://templates/SPEC.schema.md` §1.3 and
   211	`file://examples/reference-procedure-spec`
   212	§7.6.
   213	
   214	After authoring:
   215	
   216	1. Set IDEA.md or SPEC.md `status: draft`.
   217	2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
   218	   authority spec; for SPEC.md it is §10.2 (task), §10.3 (contract),
   219	   or §10.4 (decision).
   220	3. `spec-review` runs `lint-spec.sh` (REQUIRED for Contract,
   221	   RECOMMENDED for Task and Decision) and produces a structured
   222	   Quality Gate Result.
   223	4. On a clean pass, `spec-review` sets `status: approved-pending-owner`
   224	   (SPEC) or `status: ready-for-spec` (IDEA). On any blocking
   225	   failure, `spec-review` sets `status: needs-revision` (SPEC) or
   226	   leaves `status: draft` (IDEA) and surfaces failures with file:line
   227	   citations.
   228	5. Owner reviews the gate result and the artefact. Owner alone
   229	   transitions SPEC.md to `status: approved`.
   230	
   231	If `spec-review` returns `needs-revision`, return to this skill: read
   232	the failures, revise the artefact, re-hand-off. Do not silently
   233	escalate failures to `owner-blocking`; that status is for unresolved
   234	Open Questions, not for gate failures.
   235	
   236	## Hard Rules
   237	
   238	- Do not author IDEA.md or SPEC.md without reading
   239	  `templates/SPEC.schema.md` first.
   240	- Do not use a SPEC template without first picking a type per the
   241	  decision tree above.
   242	- Do not put uncited factual claims in any artefact. Memory is
   243	  input, not evidence.
   244	- Do not set `status: approved`. The owner does that.
   245	- Do not silently mix Decision and implementation work in one spec.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-review/SKILL.md | sed -n '1,290p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: spec-review
     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
     4	---
     5	
     6	# Spec Review
     7	
     8	Authority: `file://examples/reference-procedure-spec`
     9	§10, §11.3, §17.3. Shared schema:
    10	`file://templates/SPEC.schema.md` §5.
    11	
    12	This skill is **BLOCKING**. A spec MUST NOT advance to
    13	`approved-pending-owner` while any blocking criterion fails. The
    14	skill MUST NOT set `status: approved` — only the owner does that
    15	(SPEC §7.6, schema §1.3).
    16	
    17	Per-type gate criteria live in
    18	[`references/per-type-gates.md`](references/per-type-gates.md). Read
    19	that file as part of running the gate; this SKILL.md governs
    20	selection, mechanics, and output.
    21	
    22	## When to use
    23	
    24	- A primary or sub agent has just authored or revised a `SPEC.md`
    25	  and needs the gate to determine whether the spec is ready for
    26	  owner approval.
    27	- A primary agent has just run `/idea-capture` and needs the IDEA
    28	  gate (§10.1) to determine whether the IDEA can transition from
    29	  `draft` to `ready-for-spec`.
    30	- Any review-time event re-opens a previously-approved spec for
    31	  owner reconsideration (rare; typically owner-driven via
    32	  `status: needs-revision`).
    33	
    34	Companion workflow: `agents/workflows/review-spec.md`
    35	(`/review-spec`).
    36	
    37	## Inputs
    38	
    39	- `spec_path` — repo-relative path to the artefact under review.
    40	  MUST be either `<spec-folder>/SPEC.md` or
    41	  `<spec-folder>/IDEA.md`.
    42	- Front-matter is parsed first. The skill REQUIRES:
    43	  - `type` (`task` | `contract` | `decision`) for SPEC.md, OR
    44	  - `implies_spec_type` (`task` | `contract` | `decision`) for
    45	    IDEA.md.
    46	  If front-matter is missing or malformed, the run aborts with a
    47	  blocking failure of `criterion: front-matter-parse`.
    48	
    49	## Gate selection
    50	
    51	Per SPEC §10 and SPEC.schema §5:
    52	
    53	| Artefact | Gate | Bar | Lint requirement |
    54	|---|---|---|---|
    55	| `IDEA.md` | §10.1 IDEA gate | n/a | RECOMMENDED |
    56	| `SPEC.md` with `type: task` | §10.2 Task gate | `b` (verifiable) | RECOMMENDED |
    57	| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (the autonomous-dispatch runner-grade) | **REQUIRED** |
    58	| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |
    59	
    60	Detailed per-type criteria, including fleet-principle additional
    61	checks: see `references/per-type-gates.md`.
    62	
    63	## Lint invocation
    64	
    65	For `type: contract`, the skill MUST run:
    66	
    67	```
    68	bash scripts/lint-spec.sh <spec_path>
    69	```
    70	
    71	Exit-code mapping:
    72	
    73	- `0` — pass; no lint failure recorded.
    74	- `1` — blocking failure; record one entry per stderr diagnostic
    75	  with `severity: blocking`.
    76	- `2` — advisory only; record entries with `severity: advisory`.
    77	  Does not block transition to `approved-pending-owner`.
    78	
    79	For `type: task`, `type: decision`, and IDEA.md, lint is
    80	RECOMMENDED. The skill SHOULD run it and record advisory entries;
    81	it MUST NOT treat lint exit 1 as blocking for these types unless
    82	the gate otherwise requires the underlying check.
    83	
    84	## Contract capture-after defer-shorthand check
    85	
    86	Per the ceremony-weight Decision (`judgment://agent-synthesis`),
    87	Contract SPECs landing at `status: verified` via the
    88	capture-after exception MAY use a one-paragraph defer-shorthand
    89	in §1 Problem Statement and §13 Test and Validation Matrix. The
    90	shorthand pattern: a single paragraph whose only substantive
    91	content is a `file://specs/<id>/IDEA.md` cite pointing at the
    92	producing IDEA's §1 / §13.
    93	
    94	The Contract per-type gate MUST add the following BLOCKING
    95	check when the SPEC under review has `status: verified` AND
    96	either §1 or §13 body appears to be defer-shorthand
    97	(≤ 3 non-blank non-comment lines, all citation-prefixed,
    98	including a `file://specs/<id>/IDEA.md` cite):
    99	
   100	1. Resolve the cited IDEA section by path.
   101	2. Read its body.
   102	3. REQUIRED: the cited IDEA section MUST exist and contain at
   103	   least 5 non-blank non-comment lines of substantive content
   104	   (the defer must resolve to real substance, not to another
   105	   defer).
   106	4. On failure: emit a blocking diagnostic
   107	   `capture-after-defer-shorthand: cited IDEA §<n> does not
   108	   resolve to substantive content`. Status: `needs-revision`.
   109	
   110	For Contracts at any other status (`draft`, `approved`,
   111	`in-execution`), defer-shorthand in §1 or §13 MUST be rejected
   112	with: `capture-after-defer-shorthand: not permitted at status:
   113	<status>; defer-shorthand requires status: verified`. Status:
   114	`needs-revision`.
   115	
   116	This check is BLOCKING per
   117	`judgment://agent-synthesis` §7
   118	"the Contract per-type gate verifying that any capture-after
   119	defer-shorthand resolves to a cited IDEA section".
   120	
   121	## Quality Gate Result
   122	
   123	Output is a structured record per SPEC §6.1.4:
   124	
   125	```yaml
   126	spec_path: specs/<id>/SPEC.md         # or IDEA.md
   127	type: contract                         # task | contract | decision
   128	bar: c                                 # b | c | b-plus-candidates
   129	pass: false
   130	failures:
   131	  - criterion: required-section-missing
   132	    evidence: file://specs/<id>/SPEC.md missing "## 10. Failure Model"
   133	    severity: blocking
   134	  - criterion: lint
   135	    evidence: cmd://bash scripts/lint-spec.sh specs/<id>/SPEC.md (exit 1, "uncited claim at SPEC.md:142")
   136	    severity: blocking
   137	  - criterion: rfc2119-uppercase
   138	    evidence: file://specs/<id>/SPEC.md#L88 "must" lowercase in normative section
   139	    severity: advisory
   140	```
   141	
   142	Schema:
   143	
   144	- `spec_path` (string, REQUIRED).
   145	- `type` (enum, REQUIRED) — `task` | `contract` | `decision`. For
   146	  IDEA.md, use the IDEA's `implies_spec_type`.
   147	- `bar` (enum, REQUIRED) — `b` | `c` | `b-plus-candidates`. For
   148	  IDEA.md, use literal string `idea`.
   149	- `pass` (boolean, REQUIRED) — `true` iff `failures` contains zero
   150	  entries with `severity: blocking`.
   151	- `failures` (list, REQUIRED, MAY be empty):
   152	  - `criterion` (string, REQUIRED) — short slug (e.g.
   153	    `required-section-missing`, `uncited-claim`, `lint`,
   154	    `acceptance-criteria-orphan`,
   155	    `decision-fewer-than-2-candidates`).
   156	  - `evidence` (string, REQUIRED) — file/line citation per
   157	    SPEC.schema §2 citation grammar.
   158	  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.
   159	
   160	Citation discipline applies to the result itself. Every `evidence`
   161	field MUST use a citation prefix (`file://`, `cmd://`, etc.) so
   162	the result is itself contract-grade.
   163	
   164	## Status transitions
   165	
   166	Pre-condition: `<spec_path>` exists with parseable front-matter and
   167	a status appropriate for review (typically `draft` or
   168	`needs-revision`).
   169	
   170	Algorithm (per SPEC §17.3):
   171	
   172	```
   173	let result = run_per_type_gate(spec_path)
   174	if type == "contract":
   175	  let lint_exit = run_lint(spec_path)
   176	  if lint_exit == 1: append failure(criterion="lint", severity="blocking", evidence=...)
   177	  if lint_exit == 2: append failure(criterion="lint", severity="advisory", evidence=...)
   178	let blocking = any(f.severity == "blocking" for f in result.failures)
   179	if blocking:
   180	  set front-matter status: needs-revision
   181	  result.pass = false
   182	else:
   183	  set front-matter status: approved-pending-owner   # only for SPEC.md
   184	  result.pass = true
   185	emit result
   186	```
   187	
   188	Concrete transitions:
   189	
   190	| Artefact | Status before | Blocking failure? | Status after |
   191	|---|---|---|---|
   192	| `SPEC.md` | `draft` | yes | `needs-revision` |
   193	| `SPEC.md` | `draft` | no | `approved-pending-owner` |
   194	| `SPEC.md` | `needs-revision` | yes | `needs-revision` (idempotent re-run) |
   195	| `SPEC.md` | `needs-revision` | no | `approved-pending-owner` |
   196	| `IDEA.md` | `draft` | yes | `draft` (no transition; surface failures) |
   197	| `IDEA.md` | `draft` | no | `ready-for-spec` |
   198	| `IDEA.md` | `owner-blocking` | (any) | `owner-blocking` (no transition; only owner moves out) |
   199	
   200	The skill MUST NOT set `status: approved` on a SPEC.md under any
   201	condition. The owner sets `approved` after reviewing the Quality
   202	Gate Result and the SPEC (SPEC §7.6).
   203	
   204	If front-matter status is already a terminal or post-approval
   205	value (`approved`, `in-execution`, `verified`, `closed`), the skill
   206	MUST refuse to run with a blocking failure of
   207	`criterion: status-not-reviewable` and MUST NOT mutate the
   208	artefact.
   209	
   210	## Hard rules
   211	
   212	- The skill MUST NOT set `status: approved`. Only the owner does.
   213	- The skill MUST NOT silently revise spec content. It MAY only
   214	  mutate front-matter `status` per the table above.
   215	- The skill MUST surface every blocking failure with a file/line
   216	  citation. "Vague" findings without citation are themselves a
   217	  quality failure of the review.
   218	- The skill MUST NOT allow implementation scope to hide inside
   219	  Open Questions. Open Questions that imply substantive design
   220	  choices MUST be flagged with
   221	  `criterion: scope-hidden-in-open-question`, `severity: blocking`.
   222	- The skill MUST NOT review for style before correctness and
   223	  safety. Editorial polish is advisory at most.
   224	- Lint exit 1 on a Contract SPEC is blocking even if the gate
   225	  otherwise passes. Lint exit 2 is advisory.
   226	- **Cross-family review.** When the SPEC was authored primarily by
   227	  a model in one family (the agent runner / Claude), the spec-review pass
   228	  SHOULD be performed by a model from a different family. Same-
   229	  family review is structurally weaker. If the only available
   230	  reviewer is from the same family as the author, record this in
   231	  the Quality Gate Result `evidence` field as
   232	  `same-family-review: <model>` and surface it as an `advisory`
   233	  finding. See `file://your model-routing policy` "Routing Matrix"
   234	  row for Spec review and
   235	  `judgment://agent-synthesis`
   236	  §7.3.
   237	
   238	## Output to caller
   239	
   240	After running the gate the skill MUST emit, in this order:
   241	
   242	1. The Quality Gate Result block (YAML, schema above).
   243	2. A short prose summary leading with blocking findings, ordered
   244	   by severity, each with a file/line citation.
   245	3. A recommendation line, one of:
   246	   - `approve-pending-owner` (status set to
   247	     `approved-pending-owner`; owner now reviews).
   248	   - `block-needs-revision` (status set to `needs-revision`;
   249	     author addresses failures and re-runs review).
   250	   - `idea-ready-for-spec` (IDEA-mode pass; status set to
   251	     `ready-for-spec`).
   252	   - `idea-blocked` (IDEA-mode failure; status unchanged at
   253	     `draft` or `owner-blocking`).
   254	
   255	## Cross-references
   256	
   257	- Authority:
   258	  `file://examples/reference-procedure-spec`
   259	  §10, §11.3, §17.3.
   260	- Per-type criteria:
   261	  `file://skills/spec-review/references/per-type-gates.md`.
   262	- Shared schema: `file://templates/SPEC.schema.md` §5
   263	  (handoff), §1.3 (state machine), §2 (citation grammar), §3
   264	  (RFC 2119).
   265	- Companion workflow: `file://agents/workflows/review-spec.md`.
   266	- Lint script: `file://scripts/lint-spec.sh` (if absent at
   267	  the time of invocation, a Contract SPEC review MUST report
   268	  `criterion: lint-unavailable`, `severity: blocking`).
   269	- Authoring side: `file://skills/spec-authoring/SKILL.md`.
   270	- Lifecycle skill:
   271	  `file://skills/spec-driven-development/SKILL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "file://(agents/|templates/|skills/|workflow/|workpads/)|`(templates/|skills/|workflow/|workpads/)" spec-bundle/templates spec-bundle/skills CONTRIBUTING.md README.md AGENTS.md CLAUDE.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 2 in 0ms:
/home/linuxbrew/.linuxbrew/bin/bash: -c: line 1: unexpected EOF while looking for matching ``'

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'FLEET_SOURCE="$PWD" bash scripts/fleet-sync.sh "$PWD" internal; status=$?; printf '"'exit=%s\\n' \""'$status"' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
fleet-sync: source layout not recognised.
  Expected: $SOURCE/agents/scripts/fleet-skills.txt at /var/home/hasnobeef/buildepicshit/agentic-ops-framework/agents/scripts/fleet-skills.txt
  This script propagates from a bes-fleet-policy-style source.
  If you are running it against an agentic-ops-framework v2.0
  source, switch to a separate source-policy repo (see script
  header) or wait for the v2.0-native propagation slice.
exit=65

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/architecture/CONTEXT.md | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Architecture — System Context
     2	
     3	Per arc42 §3 Context and Scope
     4	(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/arc42.md` §3) and
     5	the C4 model System Context level
     6	(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/c4-model.md` §3),
     7	this file states what the framework is, who its users are,
     8	and what surrounding systems it interacts with.
     9	
    10	Note: the canonical research-primary-source corpus lives in
    11	the sibling repo `agentic-installation-methodology` at
    12	`research/primary-sources/`. Cross-repo `file://` paths in
    13	this document resolve relative to that sibling.
    14	
    15	## Product (system) under consideration
    16	
    17	**agentic-ops-framework** — a framework for operating
    18	engineering work with coding agents under spec-first
    19	discipline.
    20	
    21	Concretely, the framework ships:
    22	- A typed SPEC schema with citation grammar, RFC 2119
    23	  scoping, and a status state machine
    24	  (`file://../schema/SPEC.schema.md`).
    25	- Six templates (IDEA + 4 SPEC types + TASK) at
    26	  `file://../templates/`.
    27	- A lint script (`file://../../scripts/lint-spec.sh`) that
    28	  enforces the schema per artefact type.
    29	- A skill catalog (`file://../skills/`) covering the
    30	  spec lifecycle plus multi-repo patterns.
    31	- Seven PreToolUse hooks (`file://../../hooks/`) enforcing
    32	  studio discipline (no AI attribution, no bulk staging,
    33	  no verify-bypass, no push-to-protected-branch).
    34	- A hermetic 33-case hook test harness
    35	  (`file://../../tests/hooks/run-tests.sh`).
    36	- Six worked IDEA+SPEC examples
    37	  (`file://../../examples/`).
    38	- A CI workflow (`file://../../.github/workflows/ci.yml`)
    39	  that runs lint + skill-frontmatter + hook tests +
    40	  manifest validation on every push.
    41	
    42	## Users (per arc42 §3 stakeholder framing)
    43	
    44	| User class | Goal | Authority |
    45	|---|---|---|
    46	| Framework adopter (a studio or team operating coding agents) | Install + customize the framework; author specs in their own repos | Owner-with-agent in their own context |
    47	| Coding agent (Claude, Codex, Gemini, etc.) | Read the framework's discipline; author + execute against it | Bounded by the spec lifecycle + hook discipline |
    48	| Framework maintainer (HasNoBeef) | Steward the framework's evolution; author spec changes | Final authority on framework direction |
    49	
    50	## Surrounding systems
    51	
    52	The framework does NOT include but interacts with:
    53	
    54	- **GitHub** (or any git host) — the framework's own
    55	  release artefacts + adopter repos live there.
    56	- **Issue trackers** (Linear / GitHub Issues / others) —
    57	  the framework's autonomous-issue-dispatch skill assumes
    58	  a tracker exists; the contract is tracker-agnostic.
    59	- **AI coding assistants** (Claude Code, Codex, Gemini CLI,
    60	  Cursor, Aider, etc.) — the framework's AGENTS.md
    61	  contract per `url://agents.md` is consumed by any
    62	  AGENTS-aware tool.
    63	- **Per-language toolchains** (the languages an adopter's
    64	  product is implemented in) — out of scope of the
    65	  framework itself; the framework is operating-model, not
    66	  language-runtime.
    67	
    68	## Boundary (what the framework does NOT cover)
    69	
    70	- The framework does NOT prescribe a programming language.
    71	- The framework does NOT bundle an agent runtime; agents
    72	  are dispatched by the adopter's tooling (Claude Code
    73	  CLI, Codex CLI, Symphony, etc.).
    74	- The framework does NOT enforce a particular tracker;
    75	  see Symphony for that pattern
    76	  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/symphony-spec.md`
    77	  §3).
    78	
    79	See also: `solution-strategy.md` for arc42 §4 Solution
    80	Strategy; `../non-goals/INDEX.md` for the formal facet-level
    81	non-goal enumeration.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/deployment/install.md | sed -n '1,110p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Deployment — Install
     2	
     3	How an adopter installs the framework into their own studio
     4	/ team / fleet. The framework does not require a runtime
     5	service; "install" here means: lay the framework's
     6	artefacts into the adopter's repository tree (or fleet of
     7	repositories) and adopt the lifecycle.
     8	
     9	## Install modes
    10	
    11	### Single-repo adoption
    12	
    13	The simplest case. An adopter copies the relevant pieces
    14	of the framework into their own repo:
    15	
    16	```bash
    17	# 1. Clone the framework.
    18	git clone https://github.com/buildepicshit/agentic-ops-framework.git
    19	cd agentic-ops-framework
    20	
    21	# 2. From the target repo's root, copy the framework's
    22	#    discipline artefacts.
    23	TARGET=/path/to/your/repo
    24	cp -r spec-bundle/schema     "$TARGET/"
    25	cp -r spec-bundle/templates  "$TARGET/"
    26	cp -r spec-bundle/skills     "$TARGET/.agents/skills/"
    27	cp -r hooks                  "$TARGET/"
    28	cp scripts/lint-spec.sh      "$TARGET/scripts/"
    29	cp scripts/validate-skill-frontmatter.sh "$TARGET/scripts/"
    30	
    31	# 3. Author the target repo's AGENTS.md / CLAUDE.md per
    32	#    file://../skills/agents-md-improver/SKILL.md
    33	#    conventions.
    34	```
    35	
    36	The exact paths under the target repo vary by adopter
    37	convention; see the AGENTS.md guidance for the
    38	recommended layout.
    39	
    40	### Fleet adoption (multi-repo)
    41	
    42	For studios operating a fleet of related repos, the
    43	framework's `cross-repo-policy-enforcement` and
    44	`cross-repo-informational-channel` skills
    45	(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
    46	`file://../skills/cross-repo-informational-channel/SKILL.md`)
    47	describe the propagation pattern. A source policy repo
    48	holds the canonical artefacts; child repos sync via a
    49	`fleet-sync.sh`-style script driven by per-fleet manifests.
    50	
    51	The example manifests at
    52	`file://../../scripts/fleet-*.example.txt` show the shape.
    53	
    54	### v0.1 scaffold-only adoption
    55	
    56	For a new repo (no prior history), see the worked example
    57	at the sibling
    58	`url://github.com/buildepicshit/agentic-installation-methodology`
    59	repo's `specs/2026-05-18-repo-standup/SPEC.md` — that
    60	repo's v0.1 scaffold port is the canonical worked
    61	example of fresh-repo adoption.
    62	
    63	## Post-install verification
    64	
    65	After installation, the adopter runs:
    66	
    67	```bash
    68	bash scripts/lint-spec.sh <path-to-your-first-IDEA-or-SPEC>
    69	bash scripts/validate-skill-frontmatter.sh
    70	bash tests/hooks/run-tests.sh
    71	```
    72	
    73	Each MUST exit 0 for the adoption to be considered
    74	correctly seated.
    75	
    76	## Customization knobs
    77	
    78	What an adopter is expected to tailor:
    79	
    80	- The set of skills they adopt (the full catalog of 20
    81	  is opt-in by skill).
    82	- The set of hooks they enable in their `.claude/`
    83	  settings (the seven hooks are opt-in individually).
    84	- The CI workflow's job set (the framework's
    85	  `ci.yml` is a starting point, not a contract).
    86	- The lint exit-2 (advisory) threshold (whether CI
    87	  treats exit 2 as a failure or warning).
    88	
    89	For the full deferral contract see `../customization/contract.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/behavior/features/lint-citation-grammar.feature | sed -n '1,90p' && nl -ba spec-bundle/behavior/features/hook-blocks-ai-attribution.feature | sed -n '1,90p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	Feature: Lint enforces citation grammar on SPEC artefacts
     2	  Per Gherkin conventions
     3	  (url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/cucumber-gherkin.md §3)
     4	  and the schema's citation grammar at
     5	  file://../../schema/SPEC.schema.md §2.
     6	
     7	  Background:
     8	    Given a repo with the framework's scripts/lint-spec.sh
     9	    And the schema at spec-bundle/schema/SPEC.schema.md
    10	
    11	  Scenario: Fact-bearing paragraph without citation prefix is rejected
    12	    Given a SPEC.md whose §1 Problem section makes a factual claim
    13	    And that claim has no citation prefix in scope
    14	    When the author runs `bash scripts/lint-spec.sh <path>`
    15	    Then the lint exits non-zero
    16	    And stderr contains "fact-bearing paragraph lacks citation prefix"
    17	
    18	  Scenario: Cited paragraph passes
    19	    Given a SPEC.md whose §1 Problem cites a `file://` source
    20	    When the author runs `bash scripts/lint-spec.sh <path>`
    21	    Then the lint reports zero citation errors
    22	
    23	  Scenario: Editorial framing with lint-ok marker is allowed
    24	    Given a SPEC.md paragraph that is editorial cross-reference
    25	    And the paragraph carries `<!-- lint-ok: no-citation -->`
    26	    When the author runs `bash scripts/lint-spec.sh <path>`
    27	    Then the lint reports zero citation errors for that paragraph
    28	
    29	  Scenario: Lowercase RFC 2119 keyword in normative section is advisory
    30	    Given a SPEC.md §7 Decision Statement using lowercase "must"
    31	    When the author runs `bash scripts/lint-spec.sh <path>`
    32	    Then the lint reports a warning (exit code 2)
    33	    And the artefact MAY still pass owner approval after warning review
     1	Feature: block-ai-attribution.sh rejects co-author trailers
     2	  The framework's posture is that AI tools are inputs to your
     3	  thinking, not credited authors. The hook enforces this at
     4	  commit time.
     5	
     6	  Background:
     7	    Given the hook at hooks/block-ai-attribution.sh is installed
     8	    And the hook intercepts Bash tool calls for `git commit`
     9	
    10	  Scenario: Commit message with Co-Authored-By Claude trailer is blocked
    11	    Given a commit message containing "Co-Authored-By: Claude"
    12	    When the agent attempts `git commit -m "<message>"`
    13	    Then the hook exits non-zero
    14	    And the commit does not land
    15	
    16	  Scenario: Commit message with Co-Authored-By GPT trailer is blocked
    17	    Given a commit message containing "Co-Authored-By: GPT-4"
    18	    When the agent attempts the commit
    19	    Then the hook exits non-zero
    20	
    21	  Scenario: Commit message that mentions Claude in prose is allowed
    22	    Given a commit message body that says "CLAUDE.md updated to ..."
    23	    And the message has no Co-Authored-By trailer
    24	    When the agent attempts the commit
    25	    Then the hook exits zero
    26	    And the commit lands
    27	
    28	  Scenario: Heredoc body that quotes a co-author trailer is allowed
    29	    Given a commit message body that documents a rejected trailer pattern
    30	    And the body wraps "Co-Authored-By:" in a code fence or quote
    31	    When the agent attempts the commit
    32	    Then the hook does not false-positive on the quoted text

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/customization/contract.md | sed -n '1,140p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Customization — Deferral Contract
     2	
     3	The novel facet per research §4.1 (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
     4	§3 articulates the gap as risk; this contract closes it as
     5	procedure). Following Helm values-schema patterns
     6	(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/helm-values-schema.md`
     7	§3) for the JSON Schema validation layer.
     8	
     9	This document states **what the framework provides by
    10	default** and **what is deferred to the adopter (the
    11	installing user-with-agent)**, with constraints on each
    12	deferred surface.
    13	
    14	## Provided by default (developer-owned)
    15	
    16	The framework SHIPS the following as immutable contract:
    17	
    18	- The IDEA / SPEC / TASK template structure
    19	  (`file://../templates/`).
    20	- The schema's citation grammar (`file://`, `cmd://`,
    21	  `url://`, `owner://`, `decision-authority://<role>:<date>`,
    22	  `judgment://owner`, `judgment://agent-synthesis`) and the
    23	  RFC 2119 scoping rules per artefact type
    24	  (`file://../schema/SPEC.schema.md` §2, §3).
    25	- The 13-phase lifecycle states (Preflight → Orient →
    26	  Predict → Ideate → Author → Review → Approve →
    27	  Decompose → Dispatch → Execute → Cross-validate →
    28	  Verify → Report+Close).
    29	- The owner-only authority transitions
    30	  (`approved`, `decomposed`, `closed` flip only by owner).
    31	- The hard rules in the seven PreToolUse hooks (no AI
    32	  attribution, no bulk staging, no verify-bypass, no
    33	  push-to-protected-branch, edit-on-main only with
    34	  branch_policy declared, session-start-context emit,
    35	  verify-reminder on Stop).
    36	
    37	The adopter MUST NOT alter these contracts without
    38	authoring their own superseding Decision SPEC in their
    39	own repo.
    40	
    41	## Deferred to the adopter (installer-owned)
    42	
    43	The following customization knobs are deferred to the
    44	adopter; the framework expects them to be set in the
    45	adopter's context:
    46	
    47	### K-1: Skill catalog scope
    48	
    49	Knob: which of the 20 published skills the adopter
    50	adopts in their repo's `.agents/skills/` (or equivalent).
    51	
    52	Default: adopt the seven lifecycle skills
    53	(`repo-orientation`, `spec-authoring`, `spec-review`,
    54	`fast-path`, `implementation-execution`, `verification`,
    55	`spec-evidence-governance`).
    56	
    57	Constraint: if the adopter adopts ANY skill, they MUST
    58	include `spec-authoring` and `spec-review` (they are the
    59	lifecycle's IDEA → SPEC → review gate; adopting downstream
    60	skills without them violates the lifecycle).
    61	
    62	### K-2: Hook activation set
    63	
    64	Knob: which of the seven hooks the adopter enables in
    65	their `.claude/settings.json` (or equivalent
    66	PreToolUse-hook surface).
    67	
    68	Default: enable all seven hooks; the framework's discipline
    69	assumes all are active.
    70	
    71	Constraint: the four block-* hooks (block-ai-attribution,
    72	block-edit-on-main, block-git-add-all, block-verify-bypass)
    73	are the MINIMUM viable set; disabling any of them is
    74	ALLOWED per local risk acceptance but the adopter inherits
    75	responsibility for the discipline they enforce.
    76	
    77	### K-3: Branch policy declaration
    78	
    79	Knob: per-SPEC `branch_policy` front-matter — values
    80	`worktree-preferred` (default; agents work in worktrees)
    81	or `main-direct` (edits on main allowed during this SPEC's
    82	in-execution/verified/closed phases).
    83	
    84	Default: `worktree-preferred`.
    85	
    86	Constraint: `main-direct` is permissible only for SPECs
    87	that the adopter has approved with the
    88	`block-edit-on-main` + `block-push-to-main` hooks
    89	honouring the policy.
    90	
    91	### K-4: CI job set
    92	
    93	Knob: which CI jobs the adopter runs.
    94	
    95	Default: lint-spec + validate-skill-frontmatter +
    96	hook-test-harness + validate-manifest (the four jobs in
    97	the framework's reference CI workflow).
    98	
    99	Constraint: lint-spec MUST run on every push; the rest
   100	are recommended.
   101	
   102	### K-5: Tracker integration
   103	
   104	Knob: which issue tracker the adopter uses + how their
   105	SPEC slices map to tracker issues.
   106	
   107	Default: no binding (issue tracker integration is
   108	adopter-provided).
   109	
   110	Constraint: per the `autonomous-issue-dispatch` skill
   111	(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
   112	if the adopter uses tracker-driven dispatch, their TASK.md
   113	slices SHOULD map 1:1 to tracker issues.
   114	
   115	### K-6: Verification gate sensitivity
   116	
   117	Knob: whether the adopter treats lint advisory (exit 2)
   118	as a CI failure or warning.
   119	
   120	Default: exit 2 is advisory (CI passes; reviewer notes).
   121	
   122	Constraint: for Contract SPECs the lint MUST exit 0;
   123	exit 2 is permissible only for Task / Decision / Fastpath.
   124	
   125	### K-7: Cross-family review enforcement
   126	
   127	Knob: whether the adopter requires external cross-family
   128	review or accepts same-family proxy.
   129	
   130	Default: external cross-family review RECOMMENDED for
   131	every approved-pending-owner → approved transition;
   132	same-family proxy ACCEPTABLE with explicit caveat.
   133	
   134	Constraint: the framework's own evolution requires
   135	external cross-family for Contract SPECs that touch
   136	the schema or lifecycle.
   137	
   138	## Customization examples
   139	
   140	For named reference profiles, see `profiles/*.yaml` (to

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/decisions/INDEX.md | sed -n '1,100p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Decisions — Index
     2	
     3	ADR-style decision records per Nygard's foundational
     4	template (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/adr-nygard.md`
     5	§3): five-section Title / Context / Decision /
     6	Consequences / Status.
     7	
     8	Status lifecycle (Nygard §3): `proposed` → `accepted` →
     9	`deprecated` → `superseded`.
    10	
    11	| ID | Title | Status | Date |
    12	|---|---|---|---|
    13	| ADR-001 | Spec-first discipline (IDEA → SPEC → review → approve) | accepted | 2026-05-01 |
    14	| ADR-002 | Citation grammar with seven prefixes | accepted | 2026-05-01 |
    15	| ADR-003 | Owner-only authority transitions | accepted | 2026-05-01 |
    16	| ADR-004 | RFC 2119 keywords confined to §7 in Decision SPECs | accepted | 2026-05-01 |
    17	| ADR-005 | Capture-after exception for owner-directed urgent fixes | accepted | 2026-05-17 |
    18	| ADR-006 | Fastpath SPEC type for ≤50-line, single-file, reversible work | accepted | 2026-05-13 |
    19	| ADR-007 | Cross-family review BLOCKING per slice | accepted | 2026-05-04 |
    20	| ADR-008 | Manifest+catalog packaging for v2.0 | accepted | 2026-05-19 |
    21	
    22	Per-decision artefacts live at `ADR-NNN-<slug>.md` (to be
    23	populated as v2.x slices land; current v2.0 inventory is
    24	the index only, with the underlying decisions traceable
    25	to the framework's internal SPEC ledger at
    26	`file://../../specs/`).
    27	
    28	## Why this format
    29	
    30	- Nygard's lightweight thesis
    31	  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/adr-nygard.md`
    32	  §3 verbatim "Large documents are never kept up to date.
    33	  Small, modular documents have at least a chance at
    34	  being updated"): each ADR is ≤2 pages.
    35	- The state-of-practice ADR ecosystem catalogue
    36	  (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/adr-tools-state.md`
    37	  §3) lists alternatives (MADR, Y-statements) — the
    38	  framework adopts Nygard's template as the minimum
    39	  contract; adopters MAY use MADR's richer fields in
    40	  their own repos.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/quality/requirements.md | sed -n '1,150p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Quality — Requirements
     2	
     3	Per arc42 §10 Quality
     4	(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/arc42.md` §3) and
     5	the top quality goals named in
     6	`../architecture/solution-strategy.md`.
     7	
     8	## Quality scenarios
     9	
    10	### Q-1: Citation precision
    11	
    12	**Quality attribute**: completeness + traceability.
    13	
    14	**Scenario**: a reviewer skims any artefact in the
    15	framework or any adopter's artefact authored under the
    16	framework's discipline.
    17	
    18	**Stimulus**: the reviewer asks "where does this claim
    19	come from?"
    20	
    21	**Response**: every factual claim resolves to a citation
    22	prefix (`file://`, `cmd://`, `url://`, `owner://`,
    23	`decision-authority://<role>:<date>`, `judgment://owner`,
    24	or `judgment://agent-synthesis`).
    25	
    26	**Response measure**: `scripts/lint-spec.sh` exits 0 on
    27	the artefact; manual reviewer can follow every citation
    28	to its source.
    29	
    30	### Q-2: Mechanical verifiability
    31	
    32	**Quality attribute**: reproducibility + automation.
    33	
    34	**Scenario**: CI runs on a push.
    35	
    36	**Stimulus**: a contributor opens a PR with new spec
    37	content + skill changes + hook changes.
    38	
    39	**Response**: four CI jobs run automatically (lint-spec,
    40	validate-skill-frontmatter, test-hooks, validate-manifest)
    41	and each reports pass/fail without human judgment.
    42	
    43	**Response measure**: CI exit codes; no manual review
    44	needed for mechanical conformance.
    45	
    46	### Q-3: Hermetic test surface
    47	
    48	**Quality attribute**: reliability + isolation.
    49	
    50	**Scenario**: hook tests run in CI on a fresh
    51	clone.
    52	
    53	**Stimulus**: `bash tests/hooks/run-tests.sh`.
    54	
    55	**Response**: every hook test creates an ephemeral git
    56	sandbox; tests do not depend on the host repo's
    57	branch state, working tree, or HEAD.
    58	
    59	**Response measure**: 33 pass / 0 fail consistently
    60	across local dev machine, CI runner, and forked
    61	contributor environments.
    62	
    63	### Q-4: Honest disclosure
    64	
    65	**Quality attribute**: transparency + integrity.
    66	
    67	**Scenario**: a reader consumes any framework artefact.
    68	
    69	**Stimulus**: they want to know what the framework
    70	does NOT cover, what failed, and what's unresolved.
    71	
    72	**Response**: every artefact's `non-goals/`,
    73	`Completion Report.residual_risk`, and `Open Questions`
    74	sections explicitly enumerate gaps + failures + open
    75	questions.
    76	
    77	**Response measure**: reviewer can recover the
    78	framework's intended scope from artefacts alone, without
    79	needing access to authoring chat history.
    80	
    81	### Q-5: Cross-family review robustness
    82	
    83	**Quality attribute**: defect detection + decision
    84	quality.
    85	
    86	**Scenario**: a Contract SPEC is authored by a
    87	Claude-family agent.
    88	
    89	**Stimulus**: the SPEC enters spec-review.
    90	
    91	**Response**: a different-family reviewer (Codex /
    92	Gemini / etc.) runs the §10.3 Contract gate; same-
    93	family proxy is acceptable with explicit caveat
    94	recorded.
    95	
    96	**Response measure**: same-family-proxy advisories are
    97	visible in the Quality Gate Result; external review
    98	runs at owner discretion.
    99	
   100	### Q-6: No regressions on lifecycle gates
   101	
   102	**Quality attribute**: stability + backward compatibility.
   103	
   104	**Scenario**: a framework change lands (new skill,
   105	schema change, hook change).
   106	
   107	**Stimulus**: CI runs on the change.
   108	
   109	**Response**: existing examples + hook tests + lint
   110	on the inaugural SPEC continue to pass.
   111	
   112	**Response measure**: zero example-lint regressions; 33
   113	hook tests still pass.
   114	
   115	## See also
   116	
   117	- `12-factor-overlay.md` for the operating-system-
   118	  boundary contract per
   119	  `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/12-factor.md` §3.
   120	- `../operations/safety-invariants.md` for the MUST-
   121	  numbered safety list.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/operations/failures.md | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/non-goals/INDEX.md | sed -n '1,140p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Operations — Failure Model
     2	
     3	Failure classes × recovery posture per the Symphony §14
     4	pattern
     5	(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/symphony-spec.md`
     6	§3 — transferable building block 10).
     7	
     8	## Failure classes
     9	
    10	### F-1: Lint regression
    11	
    12	**Trigger**: a change to a spec / skill / template
    13	causes `scripts/lint-spec.sh` to exit non-zero.
    14	
    15	**Detection**: CI's `lint-spec` job; local `bash
    16	scripts/lint-spec.sh <target>` invocation.
    17	
    18	**Recovery**:
    19	1. Author reads the lint stderr; addresses each
    20	   diagnostic (citation prefix missing, RFC 2119 keyword
    21	   in wrong section, etc.).
    22	2. Re-runs lint locally until exit 0.
    23	3. CI re-runs on push.
    24	
    25	**Operator lever**: none required; mechanical fix.
    26	
    27	### F-2: Hook test failure
    28	
    29	**Trigger**: `bash tests/hooks/run-tests.sh` reports a
    30	fail.
    31	
    32	**Detection**: CI's `test-hooks` job; local invocation.
    33	
    34	**Recovery**:
    35	1. Identify the failing test from harness output.
    36	2. If a hook regressed: fix the hook + add test for the
    37	   regression (TDD per the `tdd` skill).
    38	3. If the test itself was wrong: fix the test fixture
    39	   or the assertion.
    40	
    41	**Operator lever**: none for the framework's own
    42	hooks; an adopter may disable specific hooks per K-2
    43	in `../customization/contract.md`.
    44	
    45	### F-3: Manifest validation failure
    46	
    47	**Trigger**: `bash scripts/validate-manifest.sh` exits
    48	non-zero.
    49	
    50	**Detection**: CI's `validate-manifest` job; local
    51	invocation.
    52	
    53	**Recovery**:
    54	1. Read stderr diagnostics: which facet is missing? which
    55	   primary file is absent?
    56	2. Reconcile manifest vs. filesystem (add missing
    57	   facet directory + primary, or remove orphan
    58	   directory, or update manifest entry).
    59	3. Re-run validate-manifest until PASS.
    60	
    61	**Operator lever**: schema version drift requires a
    62	Contract SPEC amendment to §6.1 of the repack SPEC.
    63	
    64	### F-4: Cross-reference rot
    65	
    66	**Trigger**: an artefact's `file://X` reference points
    67	at a path that no longer exists (after a refactor).
    68	
    69	**Detection**: lint-spec.sh does not validate file paths
    70	deeply; manual review or a separate cross-reference
    71	checker (out of scope for v2.0).
    72	
    73	**Recovery**:
    74	1. Update the reference to the new path.
    75	2. Consider authoring a Task SPEC for a cross-reference-
    76	   validator script as a v2.x slice.
    77	
    78	**Operator lever**: none.
    79	
    80	### F-5: CI workflow regression
    81	
    82	**Trigger**: a change to `.github/workflows/ci.yml`
    83	breaks CI.
    84	
    85	**Detection**: CI fails on the first push after the
    86	workflow change.
    87	
    88	**Recovery**:
    89	1. Read CI run logs via `gh run view`.
    90	2. Revert or fix the workflow change.
    91	3. Verify CI green on next push.
    92	
    93	**Operator lever**: none mid-flight; the workflow file
    94	must land correct.
    95	
    96	### F-6: Hook false-positive in real session
    97	
    98	**Trigger**: a hook blocks a legitimate operation an
    99	agent or user was attempting (e.g., `block-git-add-all`
   100	fires on a heredoc body containing `git add .`).
   101	
   102	**Detection**: user reports; agent surfaces blocker in
   103	workpad.
   104	
   105	**Recovery**:
   106	1. Examine the hook's match logic.
   107	2. Add a false-positive test fixture to
   108	   `tests/hooks/fixtures/` capturing the case.
   109	3. Tighten the match logic so the test passes AND the
   110	   real-trigger tests still pass.
   111	
   112	**Operator lever**: temporarily disable the hook via
   113	`.claude/settings.local.json` (K-2 deferral); fix +
   114	re-enable promptly.
   115	
   116	### F-7: Spec lifecycle stuck at owner-blocking
   117	
   118	**Trigger**: a SPEC's status is `owner-blocking` for an
   119	extended period.
   120	

 succeeded in 0ms:
     1	# Non-Goals — Facet-Level Negative Space
     2	
     3	The second novel facet per research §4.2 (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
     4	§3 articulates the broader risk; this facet closes
     5	ambiguity at integration boundaries). For each of the
     6	other seven facets, this document states what the facet
     7	does NOT cover, so adopters and downstream readers can
     8	tell where the framework's authority ends.
     9	
    10	## Per-facet non-goals
    11	
    12	### Architecture (`../architecture/`) does NOT cover
    13	
    14	- A prescribed UML / ArchiMate / other diagramming
    15	  notation. C4 + Structurizr DSL are RECOMMENDED, not
    16	  REQUIRED.
    17	- Code-level diagrams for the framework's own
    18	  scripts/hooks. C4 Level 4 is "typically generated
    19	  rather than authored" per
    20	  `url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/c4-model.md` §3.
    21	- A complete arc42 §6 Runtime View or §7 Deployment
    22	  View for the framework itself (the framework is not
    23	  a runtime service; deployment is documented in
    24	  `../deployment/install.md`).
    25	
    26	### Deployment (`../deployment/`) does NOT cover
    27	
    28	- A specific operating system, container runtime, or
    29	  CI/CD platform. Bash + Node + git is the runtime;
    30	  any host that runs those suffices.
    31	- Multi-tenancy concerns (no SaaS deployment shape).
    32	- Continuous-deployment automation. The framework's
    33	  release pattern is manual + tag + GitHub release.
    34	
    35	### Behavior (`../behavior/`) does NOT cover
    36	
    37	- HTTP API contracts for the framework itself (the
    38	  framework has no API). OpenAPI is REQUIRED only for
    39	  adopter products that ship HTTP APIs.
    40	- Asynchronous-event contracts (AsyncAPI is
    41	  RECOMMENDED for adopter products that ship event
    42	  contracts; the framework has no events).
    43	- GraphQL schemas.
    44	- Performance / load contracts (those are quality
    45	  scenarios in `../quality/`).
    46	
    47	### Customization (`../customization/`) does NOT cover
    48	
    49	- Adopter-product customization. K-1 through K-7
    50	  describe how an adopter customises THEIR USE OF THE
    51	  FRAMEWORK; the adopter's own product customization
    52	  is THE ADOPTER'S customization facet, not the
    53	  framework's.
    54	- Customization knob discovery via runtime
    55	  introspection. All knobs are declared statically in
    56	  `knobs.schema.json`.
    57	
    58	### Decisions (`../decisions/`) does NOT cover
    59	
    60	- The MADR or Y-statements richer-template variants.
    61	  The framework adopts Nygard's minimum template;
    62	  adopters MAY use richer formats in their own repos.
    63	- Pattern-language framing per Christopher Alexander
    64	  (Nygard's allusion is metaphor, not commitment).
    65	- Decisions about the adopter's product (those live
    66	  in the adopter's own decisions facet).
    67	
    68	### Quality (`../quality/`) does NOT cover
    69	
    70	- Adopter-product quality requirements (those are
    71	  THE ADOPTER'S quality facet).
    72	- ISO 25010 / ASQ / Atlassian-style formal quality
    73	  models. Quality scenarios per arc42 §10 are the
    74	  framework's contract.
    75	- Performance benchmarking. The framework is
    76	  text-processing scripts; performance is not a
    77	  load-bearing concern.
    78	
    79	### Operations (`../operations/`) does NOT cover
    80	
    81	- A runtime-service operating-model. The framework is
    82	  static artefacts + scripts; there is no daemon to
    83	  operate.
    84	- Multi-region failover, traffic routing, capacity
    85	  planning.
    86	- Automatic remediation (the failure model is
    87	  "fail loud, recover mechanically", not "self-heal").
    88	
    89	## Cross-facet non-goals (framework as a whole)
    90	
    91	- The framework does NOT prescribe a programming
    92	  language for adopter products.
    93	- The framework does NOT bundle an agent runtime;
    94	  Claude Code, Codex, Gemini CLI, etc. are the
    95	  runtimes; the framework is the operating-model the
    96	  agent reads.
    97	- The framework does NOT provide runtime libraries.
    98	- The framework does NOT bind to a specific issue
    99	  tracker; per the autonomous-issue-dispatch skill,
   100	  the contract is tracker-agnostic.
   101	- The framework does NOT provide automated
   102	  remediation for adopter-product failures; the
   103	  framework's lifecycle dispatches the work, the
   104	  agent + owner execute it.
   105	- The framework does NOT prescribe how adopter
   106	  products are distributed; the sibling repo
   107	  `agentic-installation-methodology` covers that
   108	  methodology question separately.
   109	
   110	## Why non-goals are first-class
   111	
   112	Per research §4.2 (`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/leaddev-agent-compiled.md`
   113	§3 risk surface), ambiguity for an installing agent
   114	typically lives in what the spec DOESN'T say. By
   115	enumerating non-goals per facet, this document closes
   116	the inference surface — an installing agent reading the
   117	framework's spec bundle can confirm what's deferred,
   118	what's irrelevant, and what's adopter-owned.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git rev-parse HEAD v2.0.0 && git show v2.0.0:spec-bundle/manifest.yaml | sed -n '1,16p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
ad36bda4325d37097c671bea3fe7199aa125a858
f0c75fcaa29c73a68b68ce06563c78e6f8c5026b
spec_version: "2.0.0"
bundle_version: "2.0.0"
conformance_profile: "core"
generated_on: "2026-05-19"
generator: "agentic-ops-framework"

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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba .github/workflows/ci.yml | sed -n '1,140p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	name: CI
     2	
     3	on:
     4	  push:
     5	    branches: [main]
     6	  pull_request:
     7	    branches: [main]
     8	
     9	jobs:
    10	  lint-spec:
    11	    name: lint worked examples
    12	    runs-on: ubuntu-latest
    13	    steps:
    14	      - uses: actions/checkout@v4
    15	
    16	      - name: Lint Task example IDEA
    17	        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/IDEA.md
    18	
    19	      - name: Lint Task example SPEC
    20	        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/SPEC.md
    21	
    22	      - name: Lint Contract example IDEA
    23	        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/IDEA.md
    24	
    25	      - name: Lint Contract example SPEC
    26	        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/SPEC.md
    27	
    28	      - name: Lint Decision example IDEA
    29	        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/IDEA.md
    30	
    31	      - name: Lint Decision example SPEC
    32	        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/SPEC.md
    33	
    34	      - name: Lint Fastpath example SPEC
    35	        run: bash scripts/lint-spec.sh examples/fastpath-fix-readme-typo/SPEC.md
    36	
    37	  validate-skills:
    38	    name: validate skill frontmatter
    39	    runs-on: ubuntu-latest
    40	    steps:
    41	      - uses: actions/checkout@v4
    42	      - run: bash scripts/validate-skill-frontmatter.sh
    43	
    44	  test-hooks:
    45	    name: hook test harness
    46	    runs-on: ubuntu-latest
    47	    steps:
    48	      - uses: actions/checkout@v4
    49	      - name: Install jq
    50	        run: sudo apt-get install -y jq
    51	      - name: Run hook tests
    52	        run: bash tests/hooks/run-tests.sh
    53	
    54	  validate-manifest:
    55	    name: validate spec-bundle manifest (v2.0)
    56	    runs-on: ubuntu-latest
    57	    steps:
    58	      - uses: actions/checkout@v4
    59	      - name: Validate manifest schema + facet bijection
    60	        run: bash scripts/validate-manifest.sh
    61	
    62	  preflight-self-check:
    63	    name: preflight runs clean on the framework
    64	    runs-on: ubuntu-latest
    65	    steps:
    66	      - uses: actions/checkout@v4
    67	      - name: Verify preflight.mjs parses + runs
    68	        run: node --check scripts/preflight.mjs

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "four CI jobs|five CI jobs|preflight-self-check|validate-manifest|CI jobs" README.md AGENTS.md CONTRIBUTING.md spec-bundle/quality/requirements.md spec-bundle/customization/contract.md specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md .github/workflows/ci.yml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
.github/workflows/ci.yml:54:  validate-manifest:
.github/workflows/ci.yml:60:        run: bash scripts/validate-manifest.sh
.github/workflows/ci.yml:62:  preflight-self-check:
spec-bundle/customization/contract.md:93:Knob: which CI jobs the adopter runs.
spec-bundle/customization/contract.md:96:hook-test-harness + validate-manifest (the four jobs in
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:14:  - bash scripts/validate-manifest.sh
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:81:- Author a `scripts/validate-manifest.sh` mechanical
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:140:├── scripts/                           # lint-spec, validate-manifest, etc.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:321:`scripts/validate-manifest.sh`):
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:497:| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:504:2. Author `scripts/validate-manifest.sh` per §6.1
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:522:   `validate-manifest` as a CI job.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:527:10. Tag `v2.0.0` once `validate-manifest` + lint +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:599:Additional facets MAY appear; `validate-manifest.sh`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:647:### 9.1 validate-manifest (pseudocode)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:703:| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:712:  manifest is read-only data; `validate-manifest.sh` is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:726:- `validate-manifest.sh` prints diagnostic lines to
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:728:- CI job `validate-manifest` runs on every push +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:741:| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:753:- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:754:      `cmd://bash scripts/validate-manifest.sh` exits 0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:768:      `validate-manifest` job; all CI jobs pass on the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:780:- [x] AC-3: validate-manifest exits 0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:862:- `scripts/validate-manifest.sh` (mechanical completeness
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:895:- `.github/workflows/ci.yml` — adds `validate-manifest`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:919:- `cmd://chmod +x scripts/validate-manifest.sh`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:923:- `cmd://bash scripts/validate-manifest.sh` — exit 0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:945:validate-manifest, preflight-self-check).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1030:- **`validate-manifest.sh` was the right scaffolding
spec-bundle/quality/requirements.md:39:**Response**: four CI jobs run automatically (lint-spec,
spec-bundle/quality/requirements.md:40:validate-skill-frontmatter, test-hooks, validate-manifest)
AGENTS.md:59:- `.github/workflows/ci.yml` — five CI jobs.
AGENTS.md:132:4. `validate-manifest` — front-door manifest schema +
AGENTS.md:134:5. `preflight-self-check` — `node --check
README.md:30:| `scripts/` | Tooling: `lint-spec.sh`, `validate-skill-frontmatter.sh`, `validate-manifest.sh` (v2.0), `fleet-sync.sh`, `audit-entry-docs.sh`, `audit-fleet-compliance.sh`, `send-fleet-message.sh`, `preflight.mjs` |
README.md:35:| `.github/workflows/ci.yml` | Five CI jobs |
README.md:87:`scripts/validate-manifest.sh` gate. CI gains a fifth job

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"file://\\.\\./\\.\\./research/primary-sources|file://\\.\\./\\.\\./\\.\\./agentic-installation-methodology|file://\\.\\./\\.\\./\\.\\./bes-fleet-policy\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle/architecture/CONTEXT.md spec-bundle/deployment/install.md spec-bundle/behavior/features spec-bundle/customization/contract.md spec-bundle/decisions/INDEX.md spec-bundle/quality/requirements.md spec-bundle/operations/failures.md spec-bundle/non-goals/INDEX.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:45:`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:51:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:53:`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:72:  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:167:  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:179:- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:181:- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:183:- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:185:- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:187:- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:189:- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:191:- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:193:- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:195:- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:197:- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:238:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:326:   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:330:   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:346:  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:350:  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:353:  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:357:  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:367:  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:378:  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:384:  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:397:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:407:`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:424:Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:431:  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:439:  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:553:`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:716:  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "primary_index|media_type|digest|size|schema_uri|source_commit|source_tag|provenance|sbom|slsa|bundle_version|generated_on|generator|developer_authority|installer_authority" scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
codex
**Quality Gate Result: FAIL**

The three current SPEC front-matter acceptance commands all pass, but the v2.1 remediation is not gate-clean. The blocking issue is that `validate-manifest.sh` still does not enforce the new v2.1 `primary_index` rule it is now claimed to enforce.

**New Findings**

| Finding | Severity | Evidence |
|---|---:|---|
| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
| v2.1 provenance fields are present but not trustworthy as populated release metadata: `source_commit` is empty, and `source_tag: "v2.0.0"` points to tag commit `f0c75fc…`, while current HEAD is `ad36bda…`; the tag’s manifest is still `spec_version: "2.0.0"`. Also `schema_uri` points at `main`, not an immutable tag or commit. | HIGH | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:6), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:7), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:8) |
| The v1.1 path migration is still incomplete in executable guidance. `TASK.template.md` and key skills still cite old `templates/`, `skills/`, `workflow/`, and `agents/` paths that do not match the v2.0 bundle layout. | HIGH | [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67) |

**Round 1 Verdicts**

| ID | Verdict |
|---|---|
| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
| 3.2 | PARTIAL. The eight facet primary files now use `url://github.com/...` for methodology primary-source citations. The target SPEC itself still has many cross-repo `file://../../../agentic-installation-methodology/...` citations, so this is only resolved if 3.2 was scoped to facet files. |
| 3.3 | OPEN. `CONTRIBUTING.md` is mostly corrected, but `TASK.template.md` and multiple skills still reference old paths. |
| 3.4 | RESOLVED. With `FLEET_SOURCE="$PWD"`, `fleet-sync.sh` refuses cleanly before writes and exits `65` with a clear v2.0-layout diagnostic. |
| 3.5 | PARTIAL. §8 defines the new v2.1 fields and `manifest.yaml` has `schema_uri`, `source_tag`, per-facet `media_type/status`, and a `provenance` block. But `source_commit` is empty, `source_tag` is stale for current HEAD, digest/size are not populated, and the validator ignores these fields. |
| 3.6 | OPEN. Manifest has `behavior.primary_index`, but the validator does not enforce required `primary_index` for directory primaries. |

Commands run: `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` PASS, `test -f spec-bundle/manifest.yaml` PASS, `bash scripts/validate-manifest.sh` PASS, fleet-sync guard check exits `65` as expected. Worktree remained clean.
tokens used
138,786
**Quality Gate Result: FAIL**

The three current SPEC front-matter acceptance commands all pass, but the v2.1 remediation is not gate-clean. The blocking issue is that `validate-manifest.sh` still does not enforce the new v2.1 `primary_index` rule it is now claimed to enforce.

**New Findings**

| Finding | Severity | Evidence |
|---|---:|---|
| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
| v2.1 provenance fields are present but not trustworthy as populated release metadata: `source_commit` is empty, and `source_tag: "v2.0.0"` points to tag commit `f0c75fc…`, while current HEAD is `ad36bda…`; the tag’s manifest is still `spec_version: "2.0.0"`. Also `schema_uri` points at `main`, not an immutable tag or commit. | HIGH | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:6), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:7), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:8) |
| The v1.1 path migration is still incomplete in executable guidance. `TASK.template.md` and key skills still cite old `templates/`, `skills/`, `workflow/`, and `agents/` paths that do not match the v2.0 bundle layout. | HIGH | [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67) |

**Round 1 Verdicts**

| ID | Verdict |
|---|---|
| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
| 3.2 | PARTIAL. The eight facet primary files now use `url://github.com/...` for methodology primary-source citations. The target SPEC itself still has many cross-repo `file://../../../agentic-installation-methodology/...` citations, so this is only resolved if 3.2 was scoped to facet files. |
| 3.3 | OPEN. `CONTRIBUTING.md` is mostly corrected, but `TASK.template.md` and multiple skills still reference old paths. |
| 3.4 | RESOLVED. With `FLEET_SOURCE="$PWD"`, `fleet-sync.sh` refuses cleanly before writes and exits `65` with a clear v2.0-layout diagnostic. |
| 3.5 | PARTIAL. §8 defines the new v2.1 fields and `manifest.yaml` has `schema_uri`, `source_tag`, per-facet `media_type/status`, and a `provenance` block. But `source_commit` is empty, `source_tag` is stale for current HEAD, digest/size are not populated, and the validator ignores these fields. |
| 3.6 | OPEN. Manifest has `behavior.primary_index`, but the validator does not enforce required `primary_index` for directory primaries. |

Commands run: `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` PASS, `test -f spec-bundle/manifest.yaml` PASS, `bash scripts/validate-manifest.sh` PASS, fleet-sync guard check exits `65` as expected. Worktree remained clean.
