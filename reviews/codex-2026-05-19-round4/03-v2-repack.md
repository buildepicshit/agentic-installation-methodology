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
session id: 019e4314-7e2f-7703-9765-a2d9b4fb061f
--------
user
Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round 3 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md flagged: BLOCKER 3.6 partial (primary_index inside-directory + missing-primary), HIGH 3.3 path migration still open (IDEA.template:13, TASK.template:50, spec-authoring:67, fast-path:16), MEDIUM §6.1 v2.0.0 example, MEDIUM validator REQUIRED-field presence. Round 4 remediation at commit e78b8a4. Verify + surface new. Output Quality Gate Result. No mutations.
codex
I’ll keep this read-only and review the current commit against the Round 3 findings first, then run the manifest validator if it is safe to run without writing.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'pwd && git status --short && git rev-parse --short HEAD && git branch --show-current' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-ops-framework
e78b8a4
main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
session id: 019e42a9-e188-7ac3-839d-39061332d2ed
--------
user
Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round-2 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md flagged: BLOCKER 3.6 validator gap, HIGH provenance, HIGH 3.3 path migration. Round-3 remediation at commit 380db29. Verify: (a) BLOCKER 3.6 — does validate-manifest.sh now enforce primary_index + media_type extension conventions per v2.1 §8.3? (b) HIGH provenance — are source_commit/source_tag/schema_uri now honestly disclosed (empty between tags with documentation rather than fabricated values)? (c) HIGH 3.3 — are remaining stale paths in templates + skills now spec-bundle/-rooted or explicitly adopter-qualified? Surface new issues. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
codex
I’ll do this as a read-only review: first refresh the active authority docs and the Round-2 findings, then inspect the remediated files at/around commit `380db29` and run the relevant validators if they are read-only.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-ops-framework|agentic-installation-methodology|v2-manifest-catalog|validate-manifest|primary_index|media_type|source_commit|source_tag|schema_uri" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
## main...origin/main

 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git rev-parse --show-toplevel && git rev-parse HEAD && git log --oneline -5' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-ops-framework
380db2966cc9bbb25c221e95bb2ba36e7816072b
380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
5f59f7b spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled

codex
The worktree is clean and `HEAD` is the requested remediation commit `380db29`. I’m pulling the review basis now: the lifecycle/schema context, the Round-2 report, and the changed validator/manifest/template/skill surfaces.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' OPERATING_MODEL.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-ops-framework|v2-manifest|manifest-catalog|round3|validate-manifest|primary_index|missing-primary|IDEA.template|TASK.template|spec-authoring|fast-path" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
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


exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' spec-bundle/manifest.yaml" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

# 3b. v2.1 REQUIRED top-level fields present (codex Round-3 finding).
# Per SPEC §8.1, schema_uri + source_commit are REQUIRED at v2.1.
# source_tag is OPTIONAL. The fields MAY be empty string at authoring
# time (codex Round-2 honest-disclosure pattern); validator checks
# only presence of the key, not non-emptiness.
for required_v21_key in schema_uri source_commit; do
    if ! grep -qE "^${required_v21_key}:" "$MANIFEST"; then
        err "v2.1 REQUIRED top-level key missing: $required_v21_key (per SPEC §8.1)"
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
        # (codex Round-3 BLOCKER refinement: previously the script
        # checked file existence anywhere, not directory containment).
        if [[ "$pi" != "$primary"* ]]; then
            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment"
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
# spec-bundle/manifest.yaml — v2.1.0 schema example
# (updated from v2.0.0 per codex remediation §7.E / §7.F;

codex
The prior review file in the sibling repo appears to be a captured transcript rather than a short Markdown report, but it contains the Round 3 task and outputs. I’m now checking the actual remediated surfaces directly, including negative cases for the validator gap.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '260,620p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
    status: "reserved"              # v2.1: explicit scaffold disclosure

provenance:                         # v2.1 OPTIONAL — see §8.6
  sbom_format: "cyclonedx"          # cyclonedx | spdx
  sbom_ref: ""                      # populated by release tooling
  slsa_level: ""                    # SLSA attestation level

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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find spec-bundle/templates spec-bundle/skills -type f | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "(''^|[''^[:alnum:]_/-])(/?templates/|/?skills/|/?schema/|schema/SPEC'"\\.schema|templates/["'^[:space:]`)]+|skills/[''^[:space:]`)]+|v2'"\\.0\\.0|primary_index|media_type|REQUIRED|source_commit|source_tag|schema_uri)\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle/manifest.yaml spec-bundle/templates spec-bundle/skills scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/home/linuxbrew/.linuxbrew/bin/bash: command substitution: line 1: syntax error near unexpected token `)'
/home/linuxbrew/.linuxbrew/bin/bash: command substitution: line 1: `)]+|skills/[^[:space:]'
scripts/validate-manifest.sh:64:# 3b. v2.1 REQUIRED top-level fields present (codex Round-3 finding).
scripts/validate-manifest.sh:65:# Per SPEC §8.1, schema_uri + source_commit are REQUIRED at v2.1.
scripts/validate-manifest.sh:66:# source_tag is OPTIONAL. The fields MAY be empty string at authoring
scripts/validate-manifest.sh:69:for required_v21_key in schema_uri source_commit; do
scripts/validate-manifest.sh:71:        err "v2.1 REQUIRED top-level key missing: $required_v21_key (per SPEC §8.1)"
scripts/validate-manifest.sh:151:# Parse primary + primary_index + media_type per facet per the v2.1
scripts/validate-manifest.sh:153:# accepted directory primaries silently without verifying primary_index
scripts/validate-manifest.sh:167:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:171:    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:181:media_type_extension() {
scripts/validate-manifest.sh:196:        err "facet '$facet' has no primary field in the manifest (per SPEC §8.3 primary is REQUIRED for every facet)"
scripts/validate-manifest.sh:200:        # Directory primary — v2.1 requires primary_index.
scripts/validate-manifest.sh:207:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:210:        # primary_index MUST be INSIDE the primary directory
scripts/validate-manifest.sh:214:            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment"
scripts/validate-manifest.sh:218:            err "facet '$facet' primary_index file missing: $pi"
scripts/validate-manifest.sh:222:        ext="$(media_type_extension "$mt")"
scripts/validate-manifest.sh:226:                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
spec-bundle/manifest.yaml:6:# schema_uri pins the schema to a stable form. Populated by release
spec-bundle/manifest.yaml:14:schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
spec-bundle/manifest.yaml:16:# source_commit populated by release tooling at tag time. Empty
spec-bundle/manifest.yaml:18:# cut a tag with empty source_commit; in-development manifests
spec-bundle/manifest.yaml:21:source_commit: ""
spec-bundle/manifest.yaml:23:# source_tag empty between tags. The v2.0.0 tag predates the v2.1
spec-bundle/manifest.yaml:25:# at v2.0.0 from a v2.1-schema manifest would mislead. The next
spec-bundle/manifest.yaml:27:# including source_commit + source_tag at tag time.
spec-bundle/manifest.yaml:28:source_tag: ""
spec-bundle/manifest.yaml:51:    media_type: "text/markdown"
spec-bundle/manifest.yaml:56:    media_type: "text/markdown"
spec-bundle/manifest.yaml:61:    primary_index: "behavior/features/lint-citation-grammar.feature"
spec-bundle/manifest.yaml:62:    media_type: "text/x.gherkin"
spec-bundle/manifest.yaml:67:    media_type: "text/markdown"
spec-bundle/manifest.yaml:72:    media_type: "text/markdown"
spec-bundle/manifest.yaml:77:    media_type: "text/markdown"
spec-bundle/manifest.yaml:82:    media_type: "text/markdown"
spec-bundle/manifest.yaml:87:    media_type: "text/markdown"
spec-bundle/manifest.yaml:92:    path: "schema/SPEC.schema.md"
spec-bundle/manifest.yaml:93:    media_type: "text/markdown"
spec-bundle/manifest.yaml:95:    path: "templates/"
spec-bundle/manifest.yaml:96:    media_type: "text/markdown"
spec-bundle/manifest.yaml:98:    path: "skills/"
spec-bundle/manifest.yaml:99:    media_type: "text/markdown"
spec-bundle/manifest.yaml:102:    media_type: "application/vnd.framework.conformance-suite"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:37:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:96:- Removing v1.1's `skills/` content (skills are a
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:136:│   ├── skills/                        # the framework's own skills (was /skills/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:137:│   ├── templates/                     # SPEC templates (was /templates/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:138:│   ├── schema/                        # SPEC.schema.md (was /schema/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:246:(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:260:# (updated from v2.0.0 per codex remediation §7.E / §7.F;
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:261:# Round-3 finding flagged the original v2.0.0 example here
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:268:schema_uri: "<URL pin>"             # v2.1 REQUIRED; pin to immutable
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:270:source_commit: ""                   # v2.1 REQUIRED; populated by
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:272:source_tag: ""                      # v2.1 OPTIONAL; empty between tags
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:289:    media_type: "text/markdown"     # v2.1 RECOMMENDED
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:294:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:299:    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:300:    media_type: "text/x.gherkin"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:305:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:310:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:315:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:320:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:325:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:330:    path: "schema/SPEC.schema.md"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:331:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:333:    path: "templates/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:334:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:336:    path: "skills/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:337:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:340:    media_type: "application/vnd.framework.conformance-suite"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:362:   §7.E + §7.F; was `2.0.0` at v2.0.0 release).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:518:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:519:| `templates/` | `spec-bundle/templates/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:520:| `skills/` | `spec-bundle/skills/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:562:10. Tag `v2.0.0` once `validate-manifest` + lint +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:568:who fetched v1.1 by file paths under `schema/`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:569:`templates/`, `skills/`, `workflow/`, `workpads/` will need
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:585:The manifest is YAML. Top-level keys (REQUIRED unless
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:599:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:600:| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:601:| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:627:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:628:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:629:| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:640:the file named by `primary_index` exists inside it AND
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:641:(if `media_type` is set) at least one file in the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:657:Resource records MAY also include `media_type`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:781:| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:805:- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:820:- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:845:      `skills/`) require any content sanitization
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:877:- v2.0 ships under the same repo URL; the v2.0.0 tag
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:883:  symlinks from old paths (`schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:916:- `schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:918:- `templates/*.template.md` (6 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:920:- `skills/<name>/SKILL.md` (20 skills) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:922:- `skills/<name>/references/*.md` (4 references) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:936:  `spec-bundle/skills/` (was `skills/`)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:976:PASS. All 9 ACs met except AC-8 (v2.0.0 tag) which is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1021:  is recommended before tagging v2.0.0 final — but
spec-bundle/templates/IDEA.template.md:27:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
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
spec-bundle/templates/SPEC.fastpath.template.md:41:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:85:`skills/repo-orientation/SKILL.md`). Each entry tells you
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/templates/SPEC.decision.template.md:28:CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
spec-bundle/templates/SPEC.decision.template.md:40:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/templates/SPEC.task.template.md:32:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
spec-bundle/templates/SPEC.task.template.md:143:| `[field]` | [type] | REQUIRED \| OPTIONAL | [enum or `*`] | [notes] |
spec-bundle/templates/SPEC.task.template.md:213:- [ ] AC-3: [Docs or operating instructions updated where REQUIRED.]
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `templates/SPEC.schema.md` §2.
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
spec-bundle/skills/agents-md-improver/SKILL.md:29:  tools per `url://https://agents.md`). REQUIRED sections:
spec-bundle/skills/spec-driven-development/SKILL.md:40:   candidate-comparison for Decision), runs `lint-spec.sh` (REQUIRED
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:110:  ("the autonomous-dispatch runner-grade") with REQUIRED lint.
spec-bundle/skills/spec-driven-development/SKILL.md:116:`templates/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `templates/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:203:- **Cross-family cross-validation is REQUIRED.** Each TASK.md MUST
spec-bundle/skills/spec-authoring/SKILL.md:25:  are REQUIRED.
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:220:3. `spec-review` runs `lint-spec.sh` (REQUIRED for Contract,
spec-bundle/skills/spec-authoring/SKILL.md:239:  `templates/SPEC.schema.md` first.
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.
spec-bundle/skills/spec-review/references/per-type-gates.md:21:- All REQUIRED IDEA sections (§9.1) present and non-empty (or
spec-bundle/skills/spec-review/references/per-type-gates.md:42:- All REQUIRED Task SPEC sections (§9.2) present and non-empty.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
validate-manifest: PASS — manifest schema 2.1.0, conformance core, 8 facets

codex
The positive manifest check passes at `e78b8a4`. I found remaining path-reference hits in templates/skills, so I’m separating expected migration-history mentions from stale operational instructions.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/IDEA.template.md | sed -n '1,90p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	id: [kebab-case-slug]
     3	spec_id: [YYYY-MM-DD-kebab-case-slug]
     4	status: draft
     5	owner: [owner-identifier]
     6	brainstormed_by: [agent-identifier]
     7	brainstormed_on: [YYYY-MM-DD]
     8	implies_spec_type: [task|contract|decision]
     9	---
    10	
    11	<!--
    12	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.1.
    13	Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
    14	(front-matter, citation grammar, RFC 2119 rules, section naming).
    15	
    16	Citation discipline: every factual claim in this artefact MUST carry a
    17	citation prefix from SPEC.schema.md §2.1 (`file://`, `cmd://`, `url://`,
    18	`owner://`, `judgment://owner`, `judgment://agent-synthesis`). Memory
    19	and training are NOT citable evidence. Any `judgment://agent-synthesis`
    20	claim MUST be paired with owner-affirmation captured via `owner://`.
    21	-->
    22	
    23	# [Working Title]
    24	
    25	## Normative Language
    26	
    27	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    28	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    29	document are to be interpreted as described in RFC 2119 and RFC 8174
    30	when, and only when, they appear in all capitals.
    31	
    32	## 1. Problem Seed
    33	
    34	<!-- guidance: state the problem in concrete terms. Cite affected files,
    35	observed behavior, owner directives, or external references. Each
    36	factual claim carries a citation prefix. -->
    37	
    38	[Problem statement with citations.]
    39	
    40	## 2. Substance Citations
    41	
    42	<!-- guidance: enumerate the substantive sources this IDEA draws on:
    43	existing code, prior specs, owner statements, external benchmarks.
    44	Each entry is a citation; surrounding prose explains its relevance. -->
    45	
    46	- `file://[path]` — [why it matters].
    47	- `owner://transcript-[YYYY-MM-DD]` — [verbatim quote follows below].
    48	- `url://[full-url]` — [fetch-date or `file://` cache pair].
    49	
    50	## 3. Constraints & Non-Negotiables
    51	
    52	<!-- guidance: list constraints that bound the design space. Each
    53	constraint MUST be either externally cited or attributed to
    54	`judgment://owner` (binding by ownership) with transcript backing. -->
    55	
    56	- [Constraint 1.] (`[citation]`)
    57	- [Constraint 2.] (`[citation]`)
    58	
    59	## 4. Approaches Considered
    60	
    61	<!-- guidance: minimum 2-3 approaches. For each: name, sketch,
    62	fit-with-substance, fit-with-constraints, cost, risk. Synthesis claims
    63	use `judgment://agent-synthesis` and MUST be paired with owner
    64	affirmation in §7. -->
    65	
    66	### 4.1 [Approach A]
    67	
    68	- Sketch: [one-paragraph description].
    69	- Fit: [substance/constraints fit].
    70	- Cost: [effort, scope].
    71	- Risk: [what breaks].
    72	
    73	### 4.2 [Approach B]
    74	
    75	- Sketch: [...].
    76	- Fit: [...].
    77	- Cost: [...].
    78	- Risk: [...].
    79	
    80	### 4.3 [Approach C — OPTIONAL]
    81	
    82	- Sketch: [...].
    83	- Fit: [...].
    84	- Cost: [...].
    85	- Risk: [...].
    86	
    87	## 5. Recommendation
    88	
    89	<!-- guidance: name the recommended approach and why. If the
    90	recommendation is `judgment://agent-synthesis`, §7 MUST capture the

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/TASK.template.md | sed -n '1,90p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
    50	  `file://spec-bundle/skills/approved-spec-decomposition/SKILL.md`
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
    70	`file://spec-bundle/schema/SPEC.schema.md` §2.
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/SKILL.md | sed -n '1,130p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: spec-authoring
     3	description: "Use when capturing an IDEA (/idea-capture) or authoring a SPEC.md (/author-spec) under the spec-first model. Owns templates, type selection (fastpath / task / contract / decision), shared schema, citation discipline, IDEA-conversation tactics. Hands off to spec-review for the BLOCKING gate. Do not use to review existing specs (spec-review) or implement approved specs (implementation-execution)."
     4	---
     5	
     6	# Spec Authoring
     7	
     8	Use this skill to produce IDEA.md and SPEC.md artefacts that pass the
     9	per-type quality gates defined in the inaugural spec-authoring
    10	procedure.
    11	
    12	This skill does NOT approve specs. After authoring, it hands off to
    13	`spec-review`, which runs the blocking gate and either returns
    14	`approved-pending-owner` or `needs-revision`. Owner alone sets
    15	`approved`.
    16	
    17	## When to Use
    18	
    19	- The owner has finished an ideation conversation and asks for an
    20	  IDEA artefact captured under `/idea-capture <slug>`.
    21	- An IDEA.md exists with `status: ready-for-spec` and the owner asks
    22	  for a SPEC under `/author-spec`.
    23	- Before hand-writing IDEA.md or SPEC.md content; this skill is the
    24	  authority for which template, which sections, and which citations
    25	  are REQUIRED.
    26	- When picking a spec type for non-trivial work and the choice
    27	  between Task, Contract, and Decision is not obvious.
    28	
    29	Do not use this skill for:
    30	
    31	- Trivial spec edits (typo fixes, link updates) — edit directly.
    32	- Reviewing a spec already authored — use `spec-review`.
    33	- Implementing an approved spec — use `implementation-execution`.
    34	
    35	## Grill Before IDEA
    36	
    37	For non-trivial IDEA capture, sharpen the owner conversation before
    38	writing the artefact:
    39	
    40	1. Check the repo first for answers the code or docs can provide.
    41	2. Ask one owner question at a time.
    42	3. Prefer concrete trade-offs over broad methodology debate.
    43	4. When the design space is ambiguous, present 2-3 viable approaches
    44	   with fit, cost, and risk.
    45	5. Recommend one approach only after the constraints are clear.
    46	6. Capture owner validation as verbatim `owner://transcript-<date>`
    47	   quotes in IDEA.md.
    48	
    49	Do not let grilling become a new approval gate. It is a clarification
    50	tactic that feeds the existing IDEA -> SPEC procedure.
    51	
    52	## Reference Architecture First
    53	
    54	When a public reference architecture exists for the SPEC's domain,
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
    67	- `spec-bundle/templates/IDEA.template.md` — the IDEA artefact.
    68	- `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped, verifiable
    69	  work.
    70	- `spec-bundle/templates/SPEC.contract.template.md` — stateful, multi-component,
    71	  protocol-defining work.
    72	- `spec-bundle/templates/SPEC.decision.template.md` — binding choice between
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/fast-path/SKILL.md | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: fast-path
     3	description: "Use when the owner has explicitly authorised a small, single-component, reversible change that does not warrant full IDEA→SPEC→review→approve ceremony. Skips the 13-phase lifecycle in favour of a single capture-after SPEC at status: closed in the same commit as the work. ONLY valid when ALL thresholds in this skill's 'Thresholds' section are met; otherwise escalate to task/contract/decision."
     4	---
     5	
     6	# Fast-Path SPEC
     7	
     8	The fast-path is the recognised lightweight ceremony for **small,
     9	single-component, reversible work under explicit owner directive**.
    10	It exists to keep the spec-first discipline applicable to tiny
    11	non-trivial work without forcing a 13-phase song-and-dance for a
    12	one-file fix.
    13	
    14	Authority: `judgment://agent-synthesis` (the
    15	framework-refresh-lightweight-ceremony Decision);
    16	`file://spec-bundle/templates/SPEC.fastpath.template.md`.
    17	
    18	## Thresholds (ALL must be true)
    19	
    20	Fast-path is VALID only when EVERY condition below holds. If any
    21	one fails, escalate to task / contract / decision SPEC via the
    22	standard `/idea-capture` → `/author-spec` flow.
    23	
    24	| Threshold | Limit |
    25	|---|---|
    26	| Files changed | ≤ 1 |
    27	| Lines changed (insert + delete) | ≤ 50 |
    28	| Components touched | 1 (single skill / script / hook / template) |
    29	| Public-contract impact | None |
    30	| Persisted-state impact | None |
    31	| Reversibility | One revert commit fully restores prior state |
    32	| Owner directive | Explicit, current-session, `owner://transcript-<date>` |
    33	| Cross-session compounding risk | None (work completes in this session) |
    34	
    35	These thresholds are **objective**. Lint enforces the line count
    36	and file count by inspecting the commit diff at SPEC-creation
    37	time. The agent does not get to vibe-check.
    38	
    39	## Procedure
    40	
    41	1. Owner directs the change explicitly. Capture the verbatim
    42	   directive — you'll cite it.
    43	2. Perform the work.
    44	3. Run scope-relevant verification (the gates `acceptance_commands`
    45	   would otherwise have been; lint-spec on any SPEC files, hook
    46	   tests if hooks touched, etc.).
    47	4. Author `specs/<id>/SPEC.md` from
    48	   `file://spec-bundle/templates/SPEC.fastpath.template.md`. Status:
    49	   `closed` from the start.
    50	5. Commit work + SPEC + SPEC_EVIDENCE.md (optional for fast-path —
    51	   only if §5.2 surfaces a genuine residual or evidence candidate)
    52	   in a single commit. Message references the SPEC id.
    53	6. Push.
    54	
    55	There is **no IDEA**, **no blocking review gate**, **no
    56	decomposition**, **no cross-validation lane**. Owner approval is
    57	the directive captured in §3 of the SPEC.
    58	
    59	## When NOT to use fast-path
    60	
    61	If you find yourself doing any of these, you are no longer on the
    62	fast-path — back out and run the full v1 procedure:
    63	
    64	- Editing > 1 file.
    65	- Touching code that other code or another agent depends on.
    66	- Adding a new public surface (CLI command, slash-command, hook,
    67	  skill, SPEC type, audit script, template).
    68	- Changing the shape of a persisted artefact (SPEC.md, TASK.md,
    69	  config, manifest).
    70	- Crossing repo boundaries.
    71	- The change requires owner judgment mid-execution (not just up
    72	  front).
    73	
    74	The fast-path is for typo fixes, single-line policy clarifications,
    75	trivial unblock work, and similar. It is not a procedural escape
    76	hatch for laziness.
    77	
    78	## Hard rules
    79	
    80	- Fast-path SPEC files MUST lint-pass under

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"(templates/SPEC\\.schema|templates/|skills/fast-path|skills/<|schema/SPEC\\.schema|\\.templates/|\\.skills/)\" spec-bundle/templates spec-bundle/skills" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/templates/TASK.template.md:70:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/templates/IDEA.template.md:13:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/templates/SPEC.fastpath.template.md:17:`file://spec-bundle/skills/fast-path/SKILL.md` "Thresholds" are met. If
spec-bundle/templates/SPEC.decision.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:66:test -f .agents/templates/AGENT_INBOX.template.md && \
spec-bundle/templates/SPEC.contract.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.contract.template.md:54:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and the 2026-01-15
spec-bundle/templates/SPEC.contract.template.md:253:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) and the validation
spec-bundle/templates/SPEC.task.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.
spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:  (`file://spec-bundle/schema/SPEC.schema.md` §2).
spec-bundle/skills/agent-feedback/SKILL.md:14:`file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:43:   from `file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:86:  `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:4. For each slice, copy `file://spec-bundle/templates/TASK.template.md` to
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `templates/SPEC.schema.md` §2.
spec-bundle/skills/agents-md-improver/SKILL.md:42:  `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) (or
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:   `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) "PR feedback
spec-bundle/skills/spec-review/SKILL.md:10:`file://spec-bundle/schema/SPEC.schema.md` §5.
spec-bundle/skills/spec-review/SKILL.md:262:- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
spec-bundle/skills/spec-driven-development/SKILL.md:61:   discipline applies (see `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific)).
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:105:- `task` → `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped,
spec-bundle/skills/spec-driven-development/SKILL.md:107:- `contract` → `spec-bundle/templates/SPEC.contract.template.md` — specifies
spec-bundle/skills/spec-driven-development/SKILL.md:111:- `decision` → `spec-bundle/templates/SPEC.decision.template.md` — chooses
spec-bundle/skills/spec-driven-development/SKILL.md:116:`templates/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:117:`spec-bundle/templates/IDEA.template.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `templates/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:179:  `.claude/skills/<name>/SKILL.md`, the registry row in
spec-bundle/skills/fast-path/SKILL.md:16:`file://spec-bundle/templates/SPEC.fastpath.template.md`.
spec-bundle/skills/fast-path/SKILL.md:48:   `file://spec-bundle/templates/SPEC.fastpath.template.md`. Status:
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:8:Authority: `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:9:exception (owner-only)"; `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:31:work (see `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:66:  `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-authoring/references/reference-architecture.md:26:   `owner://` prefix per `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/SKILL.md:67:- `spec-bundle/templates/IDEA.template.md` — the IDEA artefact.
spec-bundle/skills/spec-authoring/SKILL.md:68:- `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped, verifiable
spec-bundle/skills/spec-authoring/SKILL.md:70:- `spec-bundle/templates/SPEC.contract.template.md` — stateful, multi-component,
spec-bundle/skills/spec-authoring/SKILL.md:72:- `spec-bundle/templates/SPEC.decision.template.md` — binding choice between
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:153:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) MAY use a
spec-bundle/skills/spec-authoring/SKILL.md:191:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:203:`file://spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly; pervasive
spec-bundle/skills/spec-authoring/SKILL.md:210:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and
spec-bundle/skills/spec-authoring/SKILL.md:239:  `templates/SPEC.schema.md` first.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"BLOCKER|HIGH|MEDIUM|Quality Gate|3\\.6|3\\.3|6\\.1|REQUIRED|primary_index|missing-primary\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/manifest.yaml + spec-bundle/templates/ + spec-bundle/skills/. Round-2 review at file://../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md flagged: BLOCKER 3.6 validator gap, HIGH provenance, HIGH 3.3 path migration. Round-3 remediation at commit 380db29. Verify: (a) BLOCKER 3.6 — does validate-manifest.sh now enforce primary_index + media_type extension conventions per v2.1 §8.3? (b) HIGH provenance — are source_commit/source_tag/schema_uri now honestly disclosed (empty between tags with documentation rather than fabricated values)? (c) HIGH 3.3 — are remaining stale paths in templates + skills now spec-bundle/-rooted or explicitly adopter-qualified? Surface new issues. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
20:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-ops-framework|agentic-installation-methodology|v2-manifest-catalog|validate-manifest|primary_index|media_type|source_commit|source_tag|schema_uri" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
30:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
31:ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
32:9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
33:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
71:   REQUIRED), and `verification_lane`. Owner alone flips
297:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
316:| `id` | string | REQUIRED | kebab-case slug | matches `<topic>` portion of spec_id |
317:| `spec_id` | string | REQUIRED | `<YYYY-MM-DD>-<id>` | id of the SPEC this IDEA feeds |
318:| `status` | enum | REQUIRED | `draft` \| `ready-for-spec` \| `owner-blocking` \| `archived` | initial value `draft` |
319:| `owner` | string | REQUIRED | owner identifier | e.g. `owner-A` |
320:| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `codex-gpt-5.5`, `claude-opus-4-7-1m`, or any other model:lane label |
321:| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-01-15` |
322:| `implies_spec_type` | enum | REQUIRED | `task` \| `contract` \| `decision` | drives template selection in `/author-spec` |
342:| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
343:| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` | state machine; only owner sets `approved`, `decomposed`, and `closed` |
344:| `type` | enum | REQUIRED | `task` \| `contract` \| `decision` | determines which template was used |
345:| `owner` | string | REQUIRED | owner identifier | |
346:| `repo` | string | REQUIRED | repo name | e.g. `your-policy-repo` |
347:| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
348:| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
349:| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
350:| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
351:| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
352:| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |
431:(`spec-review`) and citation grammar remain REQUIRED; only the
447:| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
448:| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
449:| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors tracker active states; only owner sets `done` |
450:| `owner` | string | REQUIRED | agent id or `unassigned` | |
451:| `model_route` | string | REQUIRED | model slug from your model-routing policy | primary execution lane |
452:| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
453:| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
454:| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
455:| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
456:| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
457:| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `your parallelism-and-routing SPEC` §7.1 |
458:| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
459:| `tracker_issue` | string \| null | REQUIRED | tracker identifier (e.g. `PROJ-123`) or `null` | null until decomposition reflected in tracker |
543:**Positive — citation REQUIRED:**
647:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
655:ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
656:9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
657:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
695:   REQUIRED), and `verification_lane`. Owner alone flips
934:    37	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
1149:   252	### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
1166:     5	#   §6.1 (manifest schema), §8 (formal schema), §9.1 (validation
1301:   140	# Parse primary + primary_index + media_type per facet per the v2.1
1302:   141	# schema (codex Round-2 BLOCKER finding closed: previously the script
1303:   142	# accepted directory primaries silently without verifying primary_index
1308:   147	declare -A facet_primary_index
1317:   156	    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
1320:   159	        facet_primary_index["$current_facet"]="$pi"
1343:   182	        # Directory primary — v2.1 requires primary_index.
1348:   187	        pi="${facet_primary_index[$facet]:-}"
1350:   189	            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
1354:   193	            err "facet '$facet' primary_index file missing: $pi"
1397:    10	# convention codified in the v2.0 repack SPEC §6.1 + §8.1.
1448:    61	    primary_index: "behavior/features/lint-citation-grammar.feature"
1546:   252	### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
1618:   324	   §6.1 defines (currently `2.1.0` post the codex
1795:   501	1. Author `spec-bundle/manifest.yaml` per §6.1 schema
1798:   504	2. Author `scripts/validate-manifest.sh` per §6.1
1849:   550	The manifest is YAML. Top-level keys (REQUIRED unless
1891:   592	| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
1892:   593	| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
1896:   597	| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
1902:   603	finding 3.6)**: when `primary` is a directory path, the
1904:   605	the file named by `primary_index` exists inside it AND
2005:   706	| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
2051:   752	      conforming to §6.1 / §8 schema.
2202:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"primary_index|media_type|source_commit|source_tag|schema_uri|v2\\.1|8\\.3|manifest\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2228:252:### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
2236:501:1. Author `spec-bundle/manifest.yaml` per §6.1 schema
2238:504:2. Author `scripts/validate-manifest.sh` per §6.1
2246:550:The manifest is YAML. Top-level keys (REQUIRED unless
2256:592:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
2257:593:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
2261:597:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
2264:605:the file named by `primary_index` exists inside it AND
2284:706:| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
2315:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"BLOCKER|HIGH|3\\.6|3\\.3|provenance|primary_index|media_type|source_commit|source_tag|schema_uri|stale\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2317:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
2318:22:ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
2319:23:9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
2320:24:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
2326:296:    primary_index: "behavior/features/lint-citation-grammar.feature"
2342:1215:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
2343:1216:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
2345:1220:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
2346:1226:finding 3.6)**: when `primary` is a directory path, the
2347:1228:the file named by `primary_index` exists inside it AND
2349:1983:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"3\\.[1-6]|Finding|BLOCKER|Major|Minor|file://|url://github.com|Quality Gate\" ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2350:2167:4903:    68	### 3.3 Out of scope
2351:2174:4964:    70	### 3.3 Out of scope
2352:2494:6409:   105	### 3.3 Out of scope
2353:2525:6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2354:2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2355:2529:6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2356:2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2357:2533:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"acceptance_commands|schema_uri|source_commit|source_tag|primary_index|media_type|digest|size|provenance|v2\\.1|validate-manifest|Completion Report|Quality Gate|## 8|## 9|## 17|## 19\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2362:2553:592:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
2363:2554:593:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
2365:2558:597:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
2366:2561:605:the file named by `primary_index` exists inside it AND
2370:2597:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "schema_uri|source_commit|source_tag|primary_index|media_type|digest|size|provenance|sbom|slsa|spec_version|primary:" spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2376:2608:41:    primary_index: "behavior/features/lint-citation-grammar.feature"
2388:2816:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2389:2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2390:2818:| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
2391:2819:| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
2392:2820:| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
2394:2839:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2395:2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2396:2841:| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
2397:2842:| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
2398:2843:| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
2400:2854:The three SPEC acceptance commands are now the only commands in front matter; the old manifest lint command is gone. I’m running those gates and checking the v2.1 validator path against the new `primary_index` rule rather than relying on the manifest’s current happy path.
2406:3079:    41	    primary_index: "behavior/features/lint-citation-grammar.feature"
2422:3308:   592	| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
2423:3309:   593	| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
2425:3313:   597	| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
2426:3319:   603	finding 3.6)**: when `primary` is a directory path, the
2427:3321:   605	the file named by `primary_index` exists inside it AND
2431:3558:The manifest itself has `primary_index` for the behavior directory primary, but the validator still only checks that the primary directory exists. I’m checking whether that is the only carry-through issue or whether old v1.1 paths remain in the docs/templates/skills too.
2432:3760:   105	### 3.3 Out of scope
2433:5455:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "primary_index|media_type|digest|size|schema_uri|source_commit|source_tag|provenance|sbom|slsa|bundle_version|generated_on|generator|developer_authority|installer_authority" scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2434:5463:The three current SPEC front-matter acceptance commands all pass, but the v2.1 remediation is not gate-clean. The blocking issue is that `validate-manifest.sh` still does not enforce the new v2.1 `primary_index` rule it is now claimed to enforce.
2435:5469:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
2436:5470:| v2.1 provenance fields are present but not trustworthy as populated release metadata: `source_commit` is empty, and `source_tag: "v2.0.0"` points to tag commit `f0c75fc…`, while current HEAD is `ad36bda…`; the tag’s manifest is still `spec_version: "2.0.0"`. Also `schema_uri` points at `main`, not an immutable tag or commit. | HIGH | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:6), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:7), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:8) |
2437:5471:| The v1.1 path migration is still incomplete in executable guidance. `TASK.template.md` and key skills still cite old `templates/`, `skills/`, `workflow/`, and `agents/` paths that do not match the v2.0 bundle layout. | HIGH | [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67) |
2438:5477:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
2439:5479:| 3.3 | OPEN. `CONTRIBUTING.md` is mostly corrected, but `TASK.template.md` and multiple skills still reference old paths. |
2441:5482:| 3.6 | OPEN. Manifest has `behavior.primary_index`, but the validator does not enforce required `primary_index` for directory primaries. |
2442:5489:The three current SPEC front-matter acceptance commands all pass, but the v2.1 remediation is not gate-clean. The blocking issue is that `validate-manifest.sh` still does not enforce the new v2.1 `primary_index` rule it is now claimed to enforce.
2443:5495:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
2444:5496:| v2.1 provenance fields are present but not trustworthy as populated release metadata: `source_commit` is empty, and `source_tag: "v2.0.0"` points to tag commit `f0c75fc…`, while current HEAD is `ad36bda…`; the tag’s manifest is still `spec_version: "2.0.0"`. Also `schema_uri` points at `main`, not an immutable tag or commit. | HIGH | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:6), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:7), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:8) |
2445:5497:| The v1.1 path migration is still incomplete in executable guidance. `TASK.template.md` and key skills still cite old `templates/`, `skills/`, `workflow/`, and `agents/` paths that do not match the v2.0 bundle layout. | HIGH | [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67) |
2446:5503:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
2447:5505:| 3.3 | OPEN. `CONTRIBUTING.md` is mostly corrected, but `TASK.template.md` and multiple skills still reference old paths. |
2449:5508:| 3.6 | OPEN. Manifest has `behavior.primary_index`, but the validator does not enforce required `primary_index` for directory primaries. |
2452:The Round-2 failure mode was exactly the validator not parsing `primary_index` at all. In `380db29`, the script now has a dedicated `facet_primary_index` parse path and a directory-primary branch; I’m validating whether that branch is complete, and separately scanning templates/skills for stale path instructions.
2714:    57	  §6.1.1.
2762:   105	### 3.3 Out of scope
2816:    25	Quality gate: bar (c) "protocol-grade", with REQUIRED `lint-spec.sh`
2828:    37	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
2865:    74	- REQUIRED: [Goal 1.]
2866:    75	- REQUIRED: [Goal 2.]
2902:    27	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
2967:    32	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
3033:    28	CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
3045:    40	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
3150:   110	  ("the autonomous-dispatch runner-grade") with REQUIRED lint.
3447:380db29 (HEAD -> main, origin/main) fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
3469:fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
3510:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "schema_uri|source_commit|source_tag|bundle_version|generated_on|generator|provenance|sbom_ref|slsa_level|primary_index|media_type|status|digest|size|intent|developer_authority|installer_authority" scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
3515:140:# Parse primary + primary_index + media_type per facet per the v2.1
3516:142:# accepted directory primaries silently without verifying primary_index
3517:147:declare -A facet_primary_index
3519:156:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
3520:159:        facet_primary_index["$current_facet"]="$pi"
3524:182:        # Directory primary — v2.1 requires primary_index.
3525:187:        pi="${facet_primary_index[$facet]:-}"
3526:189:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
3527:193:            err "facet '$facet' primary_index file missing: $pi"
3598:| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
3599:| HIGH | 3.3 remains open: templates/skills still contain non-existent v1.x paths that are not adopter-qualified. Examples: [IDEA.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/IDEA.template.md:13), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67), [fast-path/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/fast-path/SKILL.md:16). |
3600:| MEDIUM | New carry-through issue: §6.1 still shows a v2.0.0 manifest example and omits the v2.1 provenance fields, while §8 says the formal schema is v2.1.0. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:260) and [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:548). |
3601:| MEDIUM | New validator gap: required v2.1 top-level fields like `schema_uri` and `source_commit` are present in the manifest, but `validate-manifest.sh` still does not validate their presence. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:564) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:51). |
3606:| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
3607:| HIGH provenance | RESOLVED for honesty. `source_commit` and `source_tag` are empty, documented as between-tag state, and `HEAD` is not tagged. `schema_uri` is explicitly documented as mutable `main` until release tooling pins it. |
3608:| HIGH 3.3 path migration | OPEN. Several shipped template/skill references still point at old `templates/`, `skills/`, or `workpads/` paths. |
3612:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
3618:| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
3619:| HIGH | 3.3 remains open: templates/skills still contain non-existent v1.x paths that are not adopter-qualified. Examples: [IDEA.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/IDEA.template.md:13), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67), [fast-path/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/fast-path/SKILL.md:16). |
3620:| MEDIUM | New carry-through issue: §6.1 still shows a v2.0.0 manifest example and omits the v2.1 provenance fields, while §8 says the formal schema is v2.1.0. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:260) and [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:548). |
3621:| MEDIUM | New validator gap: required v2.1 top-level fields like `schema_uri` and `source_commit` are present in the manifest, but `validate-manifest.sh` still does not validate their presence. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:564) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:51). |
3626:| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
3627:| HIGH provenance | RESOLVED for honesty. `source_commit` and `source_tag` are empty, documented as between-tag state, and `HEAD` is not tagged. `schema_uri` is explicitly documented as mutable `main` until release tooling pins it. |
3628:| HIGH 3.3 path migration | OPEN. Several shipped template/skill references still point at old `templates/`, `skills/`, or `workpads/` paths. |
3632:**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '620,650p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-manifest.sh | sed -n '60,235p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    60	if ! printf '%s\n' $VALID_PROFILES | grep -qFx "$actual_conformance"; then
    61	    err "conformance_profile invalid: got '$actual_conformance'; expected one of {$VALID_PROFILES}"
    62	fi
    63	
    64	# 3b. v2.1 REQUIRED top-level fields present (codex Round-3 finding).
    65	# Per SPEC §8.1, schema_uri + source_commit are REQUIRED at v2.1.
    66	# source_tag is OPTIONAL. The fields MAY be empty string at authoring
    67	# time (codex Round-2 honest-disclosure pattern); validator checks
    68	# only presence of the key, not non-emptiness.
    69	for required_v21_key in schema_uri source_commit; do
    70	    if ! grep -qE "^${required_v21_key}:" "$MANIFEST"; then
    71	        err "v2.1 REQUIRED top-level key missing: $required_v21_key (per SPEC §8.1)"
    72	    fi
    73	done
    74	
    75	# 6. product_name match (search for product_name under intent).
    76	actual_product_name="$(grep -E '^[[:space:]]+product_name:' "$MANIFEST" | head -1 | sed -E 's/^[[:space:]]+product_name:[[:space:]]*//;s/^"//;s/"$//')"
    77	if [ "$actual_product_name" != "$EXPECTED_PRODUCT_NAME" ]; then
    78	    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
    79	fi
    80	
    81	# 4 + 5. Parse facets block; extract slugs.
    82	# Match lines indented two spaces under "facets:" that end with ":".
    83	declare -a facet_slugs=()
    84	in_facets=0
    85	in_facets_record=""
    86	while IFS= read -r line; do
    87	    if [[ "$line" =~ ^facets: ]]; then
    88	        in_facets=1
    89	        continue
    90	    fi
    91	    if [ $in_facets -eq 1 ]; then
    92	        # Top-level key (no indent) ends facets block.
    93	        if [[ "$line" =~ ^[a-z_-] ]]; then
    94	            in_facets=0
    95	            continue
    96	        fi
    97	        # Two-space-indented key with no further indent is a facet name.
    98	        if [[ "$line" =~ ^[[:space:]]{2}[a-z_-]+:[[:space:]]*$ ]]; then
    99	            slug="${line//[[:space:]]/}"
   100	            slug="${slug%:}"
   101	            facet_slugs+=("$slug")
   102	        fi
   103	    fi
   104	done < "$MANIFEST"
   105	
   106	if [ ${#facet_slugs[@]} -eq 0 ]; then
   107	    err "facets block empty or unparseable"
   108	fi
   109	
   110	# Build set of fs facet dirs.
   111	declare -a fs_dirs=()
   112	if [ -d "$BUNDLE_DIR" ]; then
   113	    while IFS= read -r dir; do
   114	        base="$(basename "$dir")"
   115	        # Skip resource dirs.
   116	        is_resource=0
   117	        for r in "${RESOURCE_DIRS[@]}"; do
   118	            if [ "$base" = "$r" ]; then
   119	                is_resource=1
   120	                break
   121	            fi
   122	        done
   123	        if [ $is_resource -eq 0 ]; then
   124	            fs_dirs+=("$base")
   125	        fi
   126	    done < <(find "$BUNDLE_DIR" -mindepth 1 -maxdepth 1 -type d | sort)
   127	fi
   128	
   129	# Compare facet slugs vs fs dirs.
   130	for slug in "${facet_slugs[@]}"; do
   131	    found=0
   132	    for d in "${fs_dirs[@]}"; do
   133	        [ "$d" = "$slug" ] && found=1 && break
   134	    done
   135	    if [ $found -eq 0 ]; then
   136	        err "facet '$slug' listed in manifest but no directory at spec-bundle/$slug/"
   137	    fi
   138	done
   139	
   140	for d in "${fs_dirs[@]}"; do
   141	    found=0
   142	    for slug in "${facet_slugs[@]}"; do
   143	        [ "$slug" = "$d" ] && found=1 && break
   144	    done
   145	    if [ $found -eq 0 ]; then
   146	        err "directory spec-bundle/$d/ exists but not listed in manifest facets"
   147	    fi
   148	done
   149	
   150	# Check each facet's primary file exists.
   151	# Parse primary + primary_index + media_type per facet per the v2.1
   152	# schema (codex Round-2 BLOCKER finding closed: previously the script
   153	# accepted directory primaries silently without verifying primary_index
   154	# or media-type-extension conventions; this branch now enforces the
   155	# v2.1 binding).
   156	current_facet=""
   157	declare -A facet_primary
   158	declare -A facet_primary_index
   159	declare -A facet_media_type
   160	while IFS= read -r line; do
   161	    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
   162	        current_facet="${BASH_REMATCH[1]}"
   163	    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   164	        primary="${BASH_REMATCH[1]}"
   165	        primary="${primary%\"}"
   166	        facet_primary["$current_facet"]="$primary"
   167	    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   168	        pi="${BASH_REMATCH[1]}"
   169	        pi="${pi%\"}"
   170	        facet_primary_index["$current_facet"]="$pi"
   171	    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   172	        mt="${BASH_REMATCH[1]}"
   173	        mt="${mt%\"}"
   174	        facet_media_type["$current_facet"]="$mt"
   175	    elif [[ "$line" =~ ^[a-z_-] ]]; then
   176	        current_facet=""
   177	    fi
   178	done < "$MANIFEST"
   179	
   180	# Media-type → file-extension expectations (v2.1 schema §8.3).
   181	media_type_extension() {
   182	    case "$1" in
   183	        text/markdown) printf '.md' ;;
   184	        text/x.gherkin) printf '.feature' ;;
   185	        application/vnd.framework.conformance-suite) printf '' ;;  # any
   186	        *) printf '' ;;
   187	    esac
   188	}
   189	
   190	# Iterate every facet from the manifest, not just those that parsed a
   191	# primary value. This closes the codex Round-3 BLOCKER where facets
   192	# without a parsed primary silently escaped the check branch.
   193	for facet in "${facet_slugs[@]}"; do
   194	    primary="${facet_primary[$facet]:-}"
   195	    if [ -z "$primary" ]; then
   196	        err "facet '$facet' has no primary field in the manifest (per SPEC §8.3 primary is REQUIRED for every facet)"
   197	        continue
   198	    fi
   199	    if [[ "$primary" == */ ]]; then
   200	        # Directory primary — v2.1 requires primary_index.
   201	        if [ ! -d "$BUNDLE_DIR/$primary" ]; then
   202	            err "facet '$facet' primary directory missing: $primary"
   203	            continue
   204	        fi
   205	        pi="${facet_primary_index[$facet]:-}"
   206	        if [ -z "$pi" ]; then
   207	            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
   208	            continue
   209	        fi
   210	        # primary_index MUST be INSIDE the primary directory
   211	        # (codex Round-3 BLOCKER refinement: previously the script
   212	        # checked file existence anywhere, not directory containment).
   213	        if [[ "$pi" != "$primary"* ]]; then
   214	            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment"
   215	            continue
   216	        fi
   217	        if [ ! -f "$BUNDLE_DIR/$pi" ]; then
   218	            err "facet '$facet' primary_index file missing: $pi"
   219	        fi
   220	        # Media-type extension conformance (v2.1 §8.3).
   221	        mt="${facet_media_type[$facet]:-}"
   222	        ext="$(media_type_extension "$mt")"
   223	        if [ -n "$ext" ]; then
   224	            n_matching=$(find "$BUNDLE_DIR/$primary" -maxdepth 1 -name "*$ext" -type f 2>/dev/null | wc -l)
   225	            if [ "$n_matching" -eq 0 ]; then
   226	                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
   227	            fi
   228	        fi
   229	    else
   230	        # File primary.
   231	        if [ ! -f "$BUNDLE_DIR/$primary" ]; then
   232	            err "facet '$facet' primary file missing: $primary"
   233	        fi
   234	    fi
   235	done

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/manifest.yaml | sed -n '1,115p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
/home/linuxbrew/.linuxbrew/bin/bash -c 'test -f spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --stat && git status --short' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 855ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  66
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-driven-development/SKILL.md | sed -n '90,185p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    90	
    91	The IDEA → SPEC → review → approve → execute → verify → close
    92	order is the default. One recognized exception (capture-after,
    93	formalized as the `fastpath` SPEC type) applies when ALL its
    94	thresholds hold; see
    95	`file://spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md`
    96	for the procedure, acceptance conditions, and reference
    97	precedents.
    98	
    99	## Spec Types
   100	
   101	Specs are typed. Pick the matching template from `templates/`
   102	(repo-relative under `your-policy-repo`; under `.templates/` in
   103	each child product repo):
   104	
   105	- `task` → `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped,
   106	  verifiable work. Default.
   107	- `contract` → `spec-bundle/templates/SPEC.contract.template.md` — specifies
   108	  behavior that future agents implement against (state machines,
   109	  failure models, observability, reference algorithms). Bar c
   110	  ("the autonomous-dispatch runner-grade") with REQUIRED lint.
   111	- `decision` → `spec-bundle/templates/SPEC.decision.template.md` — chooses
   112	  between named candidates with rationale, locks, and reversal plan.
   113	
   114	Cross-template conventions (front-matter fields, citation grammar,
   115	RFC 2119 rules, section-naming) live in the shared schema at
   116	`templates/SPEC.schema.md`. The IDEA artefact uses
   117	`spec-bundle/templates/IDEA.template.md`.
   118	
   119	Type selection is an authoring concern; defer to
   120	[`spec-authoring`](../spec-authoring/SKILL.md) §"Type selection".
   121	
   122	## IDEA Artefact Requirement
   123	
   124	`/author-spec` REFUSES to run unless `<spec-folder>/IDEA.md` exists
   125	with front-matter `status: ready-for-spec`. The IDEA artefact is
   126	contract-grade and citation-disciplined: every factual claim carries
   127	a citation prefix from the allowed grammar (`file://`, `cmd://`,
   128	`url://`, `owner://`, `judgment://owner`, `judgment://agent-synthesis`
   129	paired with owner-affirmation). Owner Judgments include verbatim
   130	transcript quotes. See `templates/SPEC.schema.md` §2 for the full
   131	grammar.
   132	
   133	## Cascade by id-citation (non-propagating SPECs)
   134	
   135	`specs/*` does not propagate via `fleet-sync.sh`; only `agents/*`
   136	content propagates. When a SPEC binds child repos without
   137	mutating `agents/*` (typical of Decision SPECs encoding
   138	studio-level principles), the cascade is **id-citation**.
   139	Mechanism, implications for authors, and precedents:
   140	[`references/cascade-by-id-citation.md`](references/cascade-by-id-citation.md).
   141	
   142	## Memory Boundary (input vs. artefact)
   143	
   144	Agent memory and training are LEGITIMATE INPUTS to ideation
   145	conversations and to authoring/review reasoning. Long ideation
   146	sessions require active agent participation using full context.
   147	
   148	In artefacts (IDEA.md, SPEC.md, completion reports, spec evidence
   149	candidates), every factual claim MUST carry a citation prefix from
   150	the allowed grammar. Memory and training are NOT citable evidence.
   151	
   152	This is the input-vs-artefact distinction: the conversation is where
   153	agent capabilities are used fully; the artefact is the contract-grade
   154	capture obeying citation discipline.
   155	
   156	## Hard Rules
   157	
   158	- Specs are executable contracts, not brainstorming notes.
   159	- Interactive planning is linear and focused. Do not run multiple
   160	  owner-interactive planning tracks in parallel.
   161	- Do not implement until the spec is `status: approved` (set by
   162	  owner). The `spec-review` skill MAY set
   163	  `status: approved-pending-owner`; that is not a green light to
   164	  execute.
   165	- Project docs and `AGENTS.md` beat generated memory.
   166	- Durable cross-project instructions go through approved specs and
   167	  spec evidence records.
   168	- Put task-control specs in `.templates/` (or `specs/` in
   169	  `your-policy-repo`); put durable product docs in the repo-native
   170	  docs path defined by `.agents/DOCUMENTATION_GUIDE.md`.
   171	- No silent scope expansion. If new facts emerge that change scope,
   172	  stop and surface to owner.
   173	- No completion claim without fresh verification.
   174	- Subagents executing a SPEC MUST NOT modify any section except the
   175	  Completion Report. Subagents executing a TASK.md MUST NOT modify
   176	  any section except §6 Evidence.
   177	- **Skill-addition atomicity.** Adding a canonical skill MUST land
   178	  the source `skills/<name>/SKILL.md`, the Claude mirror
   179	  `.claude/skills/<name>/SKILL.md`, the registry row in
   180	  `agents/SKILL_REGISTRY.md`, the manifest entry in
   181	  `scripts/fleet-files.txt`, and the propagation directory
   182	  loop in `scripts/fleet-sync.sh` in the same verified
   183	  change. Splitting across commits silently breaks propagation —
   184	  a child sync after a partial commit overwrites destination state
   185	  with an incoherent subset

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/workpads/SESSION_JOURNAL.template.md | sed -n '50,75p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    50	question Z.]
    51	
    52	### Notes
    53	[Optional — surprises, confusions, decisions worth flagging.]
    54	```
    55	
    56	## Hard rules
    57	
    58	- Append-only. Never edit prior entries (immutable record).
    59	- Owner alone may archive entries older than 90 days to
    60	  `SESSION_JOURNAL.archive.md`.
    61	- Truncate this file to the most recent 30 entries on archival
    62	  pass; do not let it grow unboundedly.
    63	- Entries citing facts (lint output, commit hash, etc.) MUST use
    64	  the citation grammar from `templates/SPEC.schema.md` §2.
    65	- Do NOT include secrets, credentials, or owner private content.
    66	  This file may be read by any agent entering this repo.
    67	
    68	## Entries
    69	
    70	<!-- Newest entries at the top. -->

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/SKILL.md | sed -n '230,245p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/references/reference-architecture.md | sed -n '48,64p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    48	
    49	1. **Decision SPEC** selecting the tool over alternatives. Cites
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n '("'^|[''^[:alnum:]_./-])(templates/|skills/|schema/SPEC'"\\.schema|workpads/|\\.templates/|\\.skills/|agents/templates/)' spec-bundle/templates spec-bundle/skills" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:85:`skills/repo-orientation/SKILL.md`). Each entry tells you
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:116:`templates/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `templates/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `templates/SPEC.schema.md` §2.
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:239:  `templates/SPEC.schema.md` first.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/references/reference-architecture.md:61:4. **`workpads/<tool>.<ext>.template`** project-level

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/cross-repo-informational-channel/SKILL.md | sed -n '78,90p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    78	| `ack` | A reply to a prior `request` confirming completion or status. |
    79	
    80	## Procedure
    81	
    82	### Reading (every agent, every session start)
    83	
    84	Read the last 5 inbox entries as part of orientation (per
    85	`skills/repo-orientation/SKILL.md`). Each entry tells you
    86	something that changed externally or hands off work
    87	continuation. Acknowledge any `expects_ack: true` entries by
    88	appending an ack entry beneath the original.
    89	
    90	### Writing (to another repo's inbox)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/repo-orientation/SKILL.md | sed -n '25,40p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
    39	8. Identify the active branch, tracking branch, untracked files,
    40	   and unrelated local changes.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find spec-bundle/behavior/features -maxdepth 1 -type f -printf '%P\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
hook-blocks-ai-attribution.feature
lint-citation-grammar.feature

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find spec-bundle -maxdepth 1 -type d -printf '%f\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
architecture
behavior
conformance
customization
decisions
deployment
non-goals
operations
quality
schema
skills
spec-bundle
templates

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git tag --points-at HEAD && git describe --tags --exact-match HEAD' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 128 in 0ms:
fatal: no tag exactly matches 'e78b8a4cf706563fd808d41ca57410afd9c514ed'

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'v2\\.0\\.0|v2\\.1\\.0|Tag "'`v2'"\\.0\\.0"'`|AC-8|DoD-8|tag exists|bundle_version'"' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle/manifest.yaml" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/manifest.yaml:2:bundle_version: "2.0.0"
spec-bundle/manifest.yaml:23:# source_tag empty between tags. The v2.0.0 tag predates the v2.1
spec-bundle/manifest.yaml:25:# at v2.0.0 from a v2.1-schema manifest would mislead. The next
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:259:# spec-bundle/manifest.yaml — v2.1.0 schema example
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:260:# (updated from v2.0.0 per codex remediation §7.E / §7.F;
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:261:# Round-3 finding flagged the original v2.0.0 example here
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:262:# as stale relative to §8.1 v2.1.0 formal schema)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:264:bundle_version: "2.0.0"             # semver; this specific bundle release
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:362:   §7.E + §7.F; was `2.0.0` at v2.0.0 release).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:562:10. Tag `v2.0.0` once `validate-manifest` + lint +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:583:### 8.1 Manifest schema (formal — v2.1.0)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:595:| `bundle_version` | string (semver) | yes | This bundle release |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:698:  for field in ["bundle_version", "generated_on", "generator",
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:781:| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:805:- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:820:- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:877:- v2.0 ships under the same repo URL; the v2.0.0 tag
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:976:PASS. All 9 ACs met except AC-8 (v2.0.0 tag) which is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1021:  is recommended before tagging v2.0.0 final — but

codex
The exact Round 3 line examples are mostly fixed, but I’m checking whether the validator’s new containment check is semantic or only lexical. That matters because the SPEC says “inside” the primary directory, not just string-prefixed.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'BUNDLE_DIR="$PWD/spec-bundle"; primary='"'behavior/features/'; pi='behavior/features/../../architecture/CONTEXT.md'; if [[ \""'$pi" == "$primary"* ]] && [ -f "$BUNDLE_DIR/$pi" ]; then printf '"'lexical containment bypass: %s resolves to existing file outside %s\\n' \""'$pi" "$primary"; else printf '"'no bypass\\n'; fi" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
lexical containment bypass: behavior/features/../../architecture/CONTEXT.md resolves to existing file outside behavior/features/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'primary_index|realpath|readlink|\\.\\./|canonical|containment|inside primary' scripts/validate-manifest.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
scripts/validate-manifest.sh:151:# Parse primary + primary_index + media_type per facet per the v2.1
scripts/validate-manifest.sh:153:# accepted directory primaries silently without verifying primary_index
scripts/validate-manifest.sh:158:declare -A facet_primary_index
scripts/validate-manifest.sh:167:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:170:        facet_primary_index["$current_facet"]="$pi"
scripts/validate-manifest.sh:200:        # Directory primary — v2.1 requires primary_index.
scripts/validate-manifest.sh:205:        pi="${facet_primary_index[$facet]:-}"
scripts/validate-manifest.sh:207:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:210:        # primary_index MUST be INSIDE the primary directory
scripts/validate-manifest.sh:212:        # checked file existence anywhere, not directory containment).
scripts/validate-manifest.sh:214:            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment"
scripts/validate-manifest.sh:218:            err "facet '$facet' primary_index file missing: $pi"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:45:`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:51:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:53:`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:72:  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:125:├── OPERATING_MODEL.md                 # remains; canonical operating-model
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
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:221:  but is the canonical entry doc per the methodology
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:238:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:299:    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:352:  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:361:   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:365:   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:381:  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:385:  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:388:  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:392:  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:402:  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:413:  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:419:  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:432:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:442:`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:459:Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:466:  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:474:  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:588:`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:627:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:628:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:640:the file named by `primary_index` exists inside it AND
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:751:  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find spec-bundle -maxdepth 3 -type f \\( -path '*/schema/SPEC.schema.md' -o -path '*/templates/SPEC.schema.md' -o -path '*/skills/fast-path/SKILL.md' -o -path '*/.skills/agent-inbox/SKILL.md' -o -path '*/.workpads/*' -o -path '*/workpads/*' \\) -printf '%P\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
schema/SPEC.schema.md
skills/fast-path/SKILL.md
templates/workpads/AGENT_FEEDBACK.template.md
templates/workpads/AGENT_INBOX.template.md
templates/workpads/SESSION_JOURNAL.template.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash -n scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate -1 HEAD' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
e78b8a4 (HEAD -> main, origin/main) fix(v2 r3): validator inside-directory rule + REQUIRED v2.1 field presence + §6.1 v2.1 example + stale paths (codex Round-3)
 scripts/validate-manifest.sh                       | 29 +++++++++++++--
 spec-bundle/skills/agent-feedback/SKILL.md         |  6 ++--
 spec-bundle/skills/agents-md-improver/SKILL.md     |  2 +-
 spec-bundle/skills/fast-path/SKILL.md              |  4 +--
 spec-bundle/skills/spec-authoring/SKILL.md         |  8 ++---
 .../spec-authoring/references/studio-principles.md |  2 +-
 .../skills/spec-driven-development/SKILL.md        | 16 ++++-----
 spec-bundle/skills/spec-review/SKILL.md            |  4 +--
 .../spec-review/references/per-type-gates.md       |  2 +-
 spec-bundle/templates/IDEA.template.md             |  2 +-
 spec-bundle/templates/SPEC.contract.template.md    |  2 +-
 spec-bundle/templates/SPEC.decision.template.md    |  2 +-
 spec-bundle/templates/SPEC.task.template.md        |  2 +-
 spec-bundle/templates/TASK.template.md             |  2 +-
 .../templates/workpads/AGENT_FEEDBACK.template.md  |  2 +-
 .../2026-05-19-v2-manifest-catalog-repack/SPEC.md  | 41 ++++++++++++++++++++--
 16 files changed, 93 insertions(+), 33 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'schema_uri|source_commit|source_tag|primary_index|media_type|templates/SPEC\\.schema|skills/fast-path|\\.workpads|\\.skills|skills/<name>|skills/<tool>|workpads/<tool>' spec-bundle/manifest.yaml scripts/validate-manifest.sh spec-bundle/templates spec-bundle/skills specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:268:schema_uri: "<URL pin>"             # v2.1 REQUIRED; pin to immutable
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:270:source_commit: ""                   # v2.1 REQUIRED; populated by
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:272:source_tag: ""                      # v2.1 OPTIONAL; empty between tags
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:289:    media_type: "text/markdown"     # v2.1 RECOMMENDED
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:294:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:299:    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:300:    media_type: "text/x.gherkin"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:305:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:310:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:315:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:320:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:325:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:331:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:334:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:337:    media_type: "text/markdown"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:340:    media_type: "application/vnd.framework.conformance-suite"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:599:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:600:| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:601:| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:627:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:628:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:629:| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:640:the file named by `primary_index` exists inside it AND
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:641:(if `media_type` is set) at least one file in the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:657:Resource records MAY also include `media_type`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:920:- `skills/<name>/SKILL.md` (20 skills) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:921:  `spec-bundle/skills/<name>/SKILL.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:922:- `skills/<name>/references/*.md` (4 references) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:923:  `spec-bundle/skills/<name>/references/*.md`
spec-bundle/manifest.yaml:6:# schema_uri pins the schema to a stable form. Populated by release
spec-bundle/manifest.yaml:14:schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
spec-bundle/manifest.yaml:16:# source_commit populated by release tooling at tag time. Empty
spec-bundle/manifest.yaml:18:# cut a tag with empty source_commit; in-development manifests
spec-bundle/manifest.yaml:21:source_commit: ""
spec-bundle/manifest.yaml:23:# source_tag empty between tags. The v2.0.0 tag predates the v2.1
spec-bundle/manifest.yaml:27:# including source_commit + source_tag at tag time.
spec-bundle/manifest.yaml:28:source_tag: ""
spec-bundle/manifest.yaml:51:    media_type: "text/markdown"
spec-bundle/manifest.yaml:56:    media_type: "text/markdown"
spec-bundle/manifest.yaml:61:    primary_index: "behavior/features/lint-citation-grammar.feature"
spec-bundle/manifest.yaml:62:    media_type: "text/x.gherkin"
spec-bundle/manifest.yaml:67:    media_type: "text/markdown"
spec-bundle/manifest.yaml:72:    media_type: "text/markdown"
spec-bundle/manifest.yaml:77:    media_type: "text/markdown"
spec-bundle/manifest.yaml:82:    media_type: "text/markdown"
spec-bundle/manifest.yaml:87:    media_type: "text/markdown"
spec-bundle/manifest.yaml:93:    media_type: "text/markdown"
spec-bundle/manifest.yaml:96:    media_type: "text/markdown"
spec-bundle/manifest.yaml:99:    media_type: "text/markdown"
spec-bundle/manifest.yaml:102:    media_type: "application/vnd.framework.conformance-suite"
scripts/validate-manifest.sh:65:# Per SPEC §8.1, schema_uri + source_commit are REQUIRED at v2.1.
scripts/validate-manifest.sh:66:# source_tag is OPTIONAL. The fields MAY be empty string at authoring
scripts/validate-manifest.sh:69:for required_v21_key in schema_uri source_commit; do
scripts/validate-manifest.sh:151:# Parse primary + primary_index + media_type per facet per the v2.1
scripts/validate-manifest.sh:153:# accepted directory primaries silently without verifying primary_index
scripts/validate-manifest.sh:158:declare -A facet_primary_index
scripts/validate-manifest.sh:159:declare -A facet_media_type
scripts/validate-manifest.sh:167:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:170:        facet_primary_index["$current_facet"]="$pi"
scripts/validate-manifest.sh:171:    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:174:        facet_media_type["$current_facet"]="$mt"
scripts/validate-manifest.sh:181:media_type_extension() {
scripts/validate-manifest.sh:200:        # Directory primary — v2.1 requires primary_index.
scripts/validate-manifest.sh:205:        pi="${facet_primary_index[$facet]:-}"
scripts/validate-manifest.sh:207:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:210:        # primary_index MUST be INSIDE the primary directory
scripts/validate-manifest.sh:214:            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment"
scripts/validate-manifest.sh:218:            err "facet '$facet' primary_index file missing: $pi"
scripts/validate-manifest.sh:221:        mt="${facet_media_type[$facet]:-}"
scripts/validate-manifest.sh:222:        ext="$(media_type_extension "$mt")"
scripts/validate-manifest.sh:226:                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
spec-bundle/templates/SPEC.fastpath.template.md:17:`file://spec-bundle/skills/fast-path/SKILL.md` "Thresholds" are met. If
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `templates/SPEC.schema.md` §2.
spec-bundle/skills/agents-md-improver/SKILL.md:43:  `.workpads/WORKFLOW.body.md` in a child repo).
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:102:   `skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:239:  `templates/SPEC.schema.md` first.
spec-bundle/skills/spec-driven-development/SKILL.md:116:`templates/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `templates/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:179:  `.claude/skills/<name>/SKILL.md`, the registry row in
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:9:exception (owner-only)"; `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:31:work (see `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/references/reference-architecture.md:61:4. **`workpads/<tool>.<ext>.template`** project-level
spec-bundle/skills/repo-orientation/SKILL.md:26:   `.workpads/SESSION_JOURNAL.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:29:   `.workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/repo-orientation/SKILL.md:33:   `.workpads/AGENT_INBOX.template.md`. See
spec-bundle/skills/repo-orientation/SKILL.md:34:   `.skills/agent-inbox/SKILL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '680,725p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/SKILL.md | sed -n '95,106p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/agents-md-improver/SKILL.md | sed -n '36,46p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    36	    `file://OPERATING_MODEL.md` §"Fleet Rule Origination".
    37	- `WORKFLOW.md` (the autonomous-dispatch runner-compatible dispatch contract). MUST be
    38	  composed of three parts: per-repo YAML config (tracker /
    39	  polling / workspace / hooks / agent / codex / bes); a one-section
    40	  per-repo intro naming the repo and its canonical verify command;
    41	  the fleet-baseline prompt body verbatim from
    42	  `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) (or
    43	  `.workpads/WORKFLOW.body.md` in a child repo).
    44	  Per-repo content lives ABOVE the body; the body is fleet-uniform.
    45	  Drift between a repo's WORKFLOW.md body and the fleet baseline
    46	  is a blocking failure surfaced by `audit-entry-docs.sh`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/repo-orientation/SKILL.md | sed -n '20,36p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

codex
A second validator gap is showing up: the script now checks the two v2.1 fields called out in Round 3, but not the rest of the required manifest/intent fields that §9.1 says the validator should reject when absent. I’m checking whether that should be a new finding or only residual coverage debt.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'bundle_version|generated_on|generator|product_purpose|developer_authority|installer_authority|schema_uri|source_commit|intent|facets' scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
15:#    listed in facets.
16:# 6. intent.product_name matches the repo identifier.
31:# Directories under spec-bundle/ that are resources, not facets.
65:# Per SPEC §8.1, schema_uri + source_commit are REQUIRED at v2.1.
69:for required_v21_key in schema_uri source_commit; do
75:# 6. product_name match (search for product_name under intent).
78:    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
81:# 4 + 5. Parse facets block; extract slugs.
82:# Match lines indented two spaces under "facets:" that end with ":".
84:in_facets=0
85:in_facets_record=""
87:    if [[ "$line" =~ ^facets: ]]; then
88:        in_facets=1
91:    if [ $in_facets -eq 1 ]; then
92:        # Top-level key (no indent) ends facets block.
94:            in_facets=0
107:    err "facets block empty or unparseable"
146:        err "directory spec-bundle/$d/ exists but not listed in manifest facets"
191:# primary value. This closes the codex Round-3 BLOCKER where facets
245:printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-manifest.sh | sed -n '1,35p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '590,610p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '612,618p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   612	| `product_name` | string | yes |
   613	| `product_purpose` | string (multi-line) | yes |
   614	| `developer_authority` | list[role+identity] | yes |
   615	| `installer_authority` | list[role+capabilities_floor] | yes |
   616	
   617	### 8.3 `facets` block
   618	

codex
**Findings**

| Severity | Finding |
|---|---|
| BLOCKER | `validate-manifest.sh` still does not semantically enforce that `primary_index` stays inside the directory named by `primary`. The new check is string-prefix only, so `behavior/features/../../architecture/CONTEXT.md` passes the lexical containment test and resolves to an existing file outside `behavior/features/`. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:637) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:213). |
| HIGH | 3.3 path migration remains open. The exact Round 3 examples were mostly fixed, but shipped guidance still points at stale non-bundle paths like `templates/SPEC.schema.md` and `skills/fast-path/SKILL.md`. See [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:76), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:102), [spec-driven-development/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-driven-development/SKILL.md:116), and [SESSION_JOURNAL.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64). |
| MEDIUM | Validator REQUIRED-field coverage is still partial. It now checks `schema_uri` and `source_commit`, but §8/§9.1 require additional top-level and intent fields (`bundle_version`, `generated_on`, `generator`, `product_purpose`, `developer_authority`, `installer_authority`) that the script never checks. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:594), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:612), and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:64). |

**Round 3 Verdicts**

- BLOCKER 3.6: PARTIAL / OPEN. Missing `primary` and direct outside-directory cases are improved, but semantic inside-directory enforcement still fails.
- HIGH 3.3: OPEN. Some cited lines are fixed; stale operational paths remain.
- MEDIUM §6.1 v2.0.0 example: RESOLVED. The example now says `spec_version: "2.1.0"` and documents the v2.0.0 history.
- MEDIUM validator REQUIRED-field presence: PARTIAL / OPEN.

**Verification**

`HEAD` is `e78b8a4`, worktree stayed clean, and no mutations were made.

Passed:
- `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
- `test -f spec-bundle/manifest.yaml`
- `bash scripts/validate-manifest.sh`
- `bash -n scripts/validate-manifest.sh`

**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 containment gap and open HIGH 3.3 path migration issue.
tokens used
283,947
**Findings**

| Severity | Finding |
|---|---|
| BLOCKER | `validate-manifest.sh` still does not semantically enforce that `primary_index` stays inside the directory named by `primary`. The new check is string-prefix only, so `behavior/features/../../architecture/CONTEXT.md` passes the lexical containment test and resolves to an existing file outside `behavior/features/`. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:637) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:213). |
| HIGH | 3.3 path migration remains open. The exact Round 3 examples were mostly fixed, but shipped guidance still points at stale non-bundle paths like `templates/SPEC.schema.md` and `skills/fast-path/SKILL.md`. See [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:76), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:102), [spec-driven-development/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-driven-development/SKILL.md:116), and [SESSION_JOURNAL.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64). |
| MEDIUM | Validator REQUIRED-field coverage is still partial. It now checks `schema_uri` and `source_commit`, but §8/§9.1 require additional top-level and intent fields (`bundle_version`, `generated_on`, `generator`, `product_purpose`, `developer_authority`, `installer_authority`) that the script never checks. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:594), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:612), and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:64). |

**Round 3 Verdicts**

- BLOCKER 3.6: PARTIAL / OPEN. Missing `primary` and direct outside-directory cases are improved, but semantic inside-directory enforcement still fails.
- HIGH 3.3: OPEN. Some cited lines are fixed; stale operational paths remain.
- MEDIUM §6.1 v2.0.0 example: RESOLVED. The example now says `spec_version: "2.1.0"` and documents the v2.0.0 history.
- MEDIUM validator REQUIRED-field presence: PARTIAL / OPEN.

**Verification**

`HEAD` is `e78b8a4`, worktree stayed clean, and no mutations were made.

Passed:
- `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
- `test -f spec-bundle/manifest.yaml`
- `bash scripts/validate-manifest.sh`
- `bash -n scripts/validate-manifest.sh`

**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 containment gap and open HIGH 3.3 path migration issue.
