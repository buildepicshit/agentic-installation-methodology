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

Cross-family review is the most important quality-control
primitive in the operating model. Same-family review is a
permissible *fallback* (with the limitation honestly labelled
in the artefact) only when the execution context cannot
dispatch cross-family. The fallback does not satisfy the
BLOCKING rule; it documents a deferral that owner-led external
dispatch resolves.

When the execution context can only dispatch one model family
(e.g., a Claude-Code-only session that can't spawn Codex /
Gemini), the agent MUST: (a) perform a same-family verification
with a different lane / subagent type; (b) label the limitation
in the artefact; (c) document the deferral as residual risk;
(d) leave the strict cross-family pass as an owner-triggered
follow-on.

## Documentation placement

Three layers of documentation coexist; each has a canonical
home:

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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' spec-bundle/architecture/CONTEXT.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
   121	├── CLAUDE.md
   122	├── CONTRIBUTING.md
   123	├── CODE_OF_CONDUCT.md
   124	├── CHANGELOG.md                       # v2.0 entry added
   125	├── OPERATING_MODEL.md                 # remains; canonical operating-model
   126	├── spec-bundle/
   127	│   ├── manifest.yaml                  # front-door manifest
   128	│   ├── architecture/
   129	│   ├── deployment/
   130	│   ├── behavior/
   131	│   ├── customization/
   132	│   ├── decisions/
   133	│   ├── quality/
   134	│   ├── operations/
   135	│   ├── non-goals/
   136	│   ├── skills/                        # the framework's own skills (was /skills/)
   137	│   ├── templates/                     # SPEC templates (was /templates/)
   138	│   ├── schema/                        # SPEC.schema.md (was /schema/)
   139	│   └── conformance/                   # executable conformance suite
   140	├── scripts/                           # lint-spec, validate-manifest, etc.
   141	├── hooks/                             # PreToolUse hooks (unchanged in scope)
   142	├── tests/                             # hook tests + future facet tests
   143	├── specs/                             # internal SPECs (framework's own ledger)
   144	├── examples/                          # worked IDEA+SPEC examples (unchanged)
   145	├── workflow/                          # UNIVERSAL.md (unchanged)
   146	├── workpads/                          # workpad templates (unchanged)
   147	└── .github/workflows/                 # CI (updated to validate manifest)
   148	```
   149	
   150	Top-level keeps the OSS-repo conventional set (LICENSE,
   151	README, CONTRIBUTING, etc.) plus existing scripts/, hooks/,
   152	tests/, specs/, examples/. The new `spec-bundle/`
   153	directory is the actual manifest+catalog artefact — what a
   154	consumer fetches if they want only the methodology
   155	artefact, not the framework's git history.
   156	
   157	## 4. Authority Map
   158	
   159	Active authority for this contract:
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
   181	- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
   182	  §3 — manifest+descriptors+layers.
   183	- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   184	  §3 — 12-section architecture-documentation template.
   185	- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
   186	  §3 — four-level architecture hierarchy.
   187	- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
   188	  §3 — Nygard ADR template.
   189	- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
   190	  §3 — customization-affordance prior art.
   191	- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
   192	  §3 — reproducibility primitive.
   193	- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
   194	  §3 — behavioural-acceptance primitive.
   195	- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   196	  §3 — operating-system-boundary contract.
   197	- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
   198	  §3 — architecture-as-code DSL.
   199	
   200	Stale, superseded, or evidence-only sources:
   201	
   202	- `file://CHANGELOG.md` v1.0 / v1.1 entries — describe
   203	  the current state being repacked, not the target.
   204	
   205	Owner decisions required before implementation:
   206	
   207	- [ ] Confirm `spec-bundle/` is the right top-level
   208	      directory name (alternatives: `bundle/`, `spec/`,
   209	      `dist/`). Default: `spec-bundle/`.
   210	- [ ] Confirm v2.0 is a breaking change worth advertising
   211	      (vs. continuous-add at v1.x). Default: yes, v2.0;
   212	      the parent Decision binds the dogfooding posture
   213	      that a v1.x cosmetic update cannot satisfy.
   214	
   215	## 5. Code/Docs Reality Check
   216	
   217	Existing v1.1 top-level (verified by
   218	`cmd://ls /var/home/hasnobeef/buildepicshit/agentic-ops-framework/`):
   219	
   220	- `LICENSE`, `README.md`, `AGENTS.md` is absent in v1.1
   221	  but is the canonical entry doc per the methodology
   222	  (note: v1.1 has `OPERATING_MODEL.md` instead; both
   223	  exist in v2.0). <!-- lint-ok: no-citation -->
   224	
   225	Hmm — actually checking
   226	`cmd://ls /var/home/hasnobeef/buildepicshit/agentic-ops-framework/`:
   227	top-level is `CHANGELOG.md`, `CODE_OF_CONDUCT.md`,
   228	`CONTRIBUTING.md`, `docs`, `examples`, `hooks`, `LICENSE`,
   229	`OPERATING_MODEL.md`, `README.md`, `schema`, `scripts`,
   230	`skills`, `specs`, `templates`, `tests`, `workflow`,
   231	`workpads`.
   232	
   233	(`judgment://agent-synthesis` from filesystem listing at
   234	authoring time.)
   235	
   236	There is no `AGENTS.md` in v1.1's top-level. v2.0 adds it
   237	per the methodology's AGENTS-aware tool guidance
   238	(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   239	§3 transferable building block 5 — repo-owned contract
   240	pattern).
   241	
   242	There is no `manifest.yaml` in v1.1. v2.0 introduces it as
   243	the front-door artefact. <!-- lint-ok: no-citation -->
   244	
   245	Skills, templates, schema currently live at top-level
   246	(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
   247	them under `spec-bundle/` so the manifest can address
   248	them as per-facet sub-spec resources. <!-- lint-ok: no-citation -->
   249	
   250	## 6. Domain Model
   251	
   252	### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
   253	
   254	The manifest is the bundle's single source of truth for
   255	what the bundle contains and what conformance profile it
   256	claims. Schema:
   257	
   258	```yaml
   259	# spec-bundle/manifest.yaml
   260	spec_version: "2.0.0"               # semver; this manifest schema version

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-manifest.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
   140	# Parse primary + primary_index + media_type per facet per the v2.1
   141	# schema (codex Round-2 BLOCKER finding closed: previously the script
   142	# accepted directory primaries silently without verifying primary_index
   143	# or media-type-extension conventions; this branch now enforces the
   144	# v2.1 binding).
   145	current_facet=""
   146	declare -A facet_primary
   147	declare -A facet_primary_index
   148	declare -A facet_media_type
   149	while IFS= read -r line; do
   150	    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
   151	        current_facet="${BASH_REMATCH[1]}"
   152	    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   153	        primary="${BASH_REMATCH[1]}"
   154	        primary="${primary%\"}"
   155	        facet_primary["$current_facet"]="$primary"
   156	    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   157	        pi="${BASH_REMATCH[1]}"
   158	        pi="${pi%\"}"
   159	        facet_primary_index["$current_facet"]="$pi"
   160	    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   161	        mt="${BASH_REMATCH[1]}"
   162	        mt="${mt%\"}"
   163	        facet_media_type["$current_facet"]="$mt"
   164	    elif [[ "$line" =~ ^[a-z_-] ]]; then
   165	        current_facet=""
   166	    fi
   167	done < "$MANIFEST"
   168	
   169	# Media-type → file-extension expectations (v2.1 schema §8.3).
   170	media_type_extension() {
   171	    case "$1" in
   172	        text/markdown) printf '.md' ;;
   173	        text/x.gherkin) printf '.feature' ;;
   174	        application/vnd.framework.conformance-suite) printf '' ;;  # any
   175	        *) printf '' ;;
   176	    esac
   177	}
   178	
   179	for facet in "${!facet_primary[@]}"; do
   180	    primary="${facet_primary[$facet]}"
   181	    if [[ "$primary" == */ ]]; then
   182	        # Directory primary — v2.1 requires primary_index.
   183	        if [ ! -d "$BUNDLE_DIR/$primary" ]; then
   184	            err "facet '$facet' primary directory missing: $primary"
   185	            continue
   186	        fi
   187	        pi="${facet_primary_index[$facet]:-}"
   188	        if [ -z "$pi" ]; then
   189	            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
   190	            continue
   191	        fi
   192	        if [ ! -f "$BUNDLE_DIR/$pi" ]; then
   193	            err "facet '$facet' primary_index file missing: $pi"
   194	        fi
   195	        # Media-type extension conformance (v2.1 §8.3).
   196	        mt="${facet_media_type[$facet]:-}"
   197	        ext="$(media_type_extension "$mt")"
   198	        if [ -n "$ext" ]; then
   199	            n_matching=$(find "$BUNDLE_DIR/$primary" -maxdepth 1 -name "*$ext" -type f 2>/dev/null | wc -l)
   200	            if [ "$n_matching" -eq 0 ]; then
   201	                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
   202	            fi
   203	        fi
   204	    else
   205	        # File primary.
   206	        if [ ! -f "$BUNDLE_DIR/$primary" ]; then
   207	            err "facet '$facet' primary file missing: $primary"
   208	        fi
   209	    fi
   210	done
   211	
   212	if [ ${#errors[@]} -gt 0 ]; then
   213	    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
   214	    for e in "${errors[@]}"; do
   215	        printf '  - %s\n' "$e" >&2
   216	    done
   217	    exit 1
   218	fi
   219	
   220	printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
   221	    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
   222	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/manifest.yaml | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '250,520p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   250	## 6. Domain Model
   251	
   252	### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
   253	
   254	The manifest is the bundle's single source of truth for
   255	what the bundle contains and what conformance profile it
   256	claims. Schema:
   257	
   258	```yaml
   259	# spec-bundle/manifest.yaml
   260	spec_version: "2.0.0"               # semver; this manifest schema version
   261	bundle_version: "2.0.0"             # semver; this specific bundle release
   262	conformance_profile: "core"         # core | extension | real-integration
   263	generated_on: "YYYY-MM-DD"          # ISO date the bundle was assembled
   264	generator: "agentic-ops-framework"   # source repo identifier
   265	
   266	intent:
   267	  product_name: "agentic-ops-framework"
   268	  product_purpose: |
   269	    <one-paragraph statement of what the product is for>
   270	  developer_authority:
   271	    - role: "framework maintainer"
   272	      identity: "HasNoBeef <github:HasNoBeef>"
   273	  installer_authority:
   274	    - role: "user-with-agent"
   275	      capabilities_floor: "any-reasonably-capable-coding-agent"
   276	
   277	facets:
   278	  architecture:
   279	    path: "architecture/"
   280	    primary: "architecture/CONTEXT.md"
   281	  deployment:
   282	    path: "deployment/"
   283	    primary: "deployment/install.md"
   284	  behavior:
   285	    path: "behavior/"
   286	    primary: "behavior/features/"
   287	  customization:
   288	    path: "customization/"
   289	    primary: "customization/contract.md"
   290	  decisions:
   291	    path: "decisions/"
   292	    primary: "decisions/INDEX.md"
   293	  quality:
   294	    path: "quality/"
   295	    primary: "quality/requirements.md"
   296	  operations:
   297	    path: "operations/"
   298	    primary: "operations/failures.md"
   299	  non-goals:
   300	    path: "non-goals/"
   301	    primary: "non-goals/INDEX.md"
   302	
   303	resources:
   304	  schema:
   305	    path: "schema/SPEC.schema.md"
   306	  templates:
   307	    path: "templates/"
   308	  skills:
   309	    path: "skills/"
   310	  conformance:
   311	    path: "conformance/"
   312	
   313	signature:
   314	  status: "unsigned"                # signed | unsigned
   315	  # When signed: cosign signature + Rekor inclusion proof
   316	  # populated per
   317	  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
   318	```
   319	
   320	Manifest validation rules (enforced by
   321	`scripts/validate-manifest.sh`):
   322	
   323	1. `spec_version` matches the schema version this SPEC
   324	   §6.1 defines (currently `2.1.0` post the codex
   325	   remediation amendment at
   326	   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   327	   §7.E + §7.F; was `2.0.0` at v2.0.0 release).
   328	2. `conformance_profile` is one of {`core`, `extension`,
   329	   `real-integration`}
   330	   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   331	   §3 three-profile model).
   332	3. Every facet listed in `facets:` has a corresponding
   333	   directory under `spec-bundle/<facet>/` containing the
   334	   named `primary` file.
   335	4. Every directory under `spec-bundle/` (except
   336	   `resources/` items) is listed in `facets:`.
   337	5. `intent.product_name` matches the repo name.
   338	
   339	### 6.2 Per-facet sub-spec contracts
   340	
   341	#### 6.2.1 architecture/
   342	
   343	Carries:
   344	- `CONTEXT.md` — system-context narrative (arc42 §3
   345	  Context and Scope per
   346	  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   347	  §3).
   348	- One or more `.dsl` files — C4-model architecture
   349	  expressed in Structurizr DSL
   350	  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
   351	  §3) — Container + Component diagrams MAY be present;
   352	  Code-level diagrams MAY be omitted per
   353	  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
   354	  §3 (Code-level "are typically generated rather than
   355	  authored").
   356	- `solution-strategy.md` — arc42 §4 Solution Strategy
   357	  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   358	  §3.
   359	
   360	#### 6.2.2 deployment/
   361	
   362	Carries:
   363	- `install.md` — installation procedure (prose +
   364	  cmd:// citations to required commands).
   365	- `requirements.md` — runtime + tooling requirements
   366	  (12-factor Factor II "Dependencies" framing per
   367	  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   368	  §3).
   369	- `topology.md` — for fleet-deployable products, the
   370	  expected topology + per-environment configuration
   371	  posture.
   372	
   373	#### 6.2.3 behavior/
   374	
   375	Carries:
   376	- `features/*.feature` — Gherkin Given-When-Then
   377	  scenarios per
   378	  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
   379	  §3. Each feature file is simultaneously documentation,
   380	  contract, and executable acceptance test (step
   381	  definitions are the installer's responsibility).
   382	- For products with HTTP APIs: `openapi.yaml` per
   383	  OpenAPI 3.1.0
   384	  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
   385	  §3). For Product A specifically, no HTTP API → no
   386	  openapi.yaml at v2.0.
   387	
   388	#### 6.2.4 customization/
   389	
   390	The novel facet (research §4.1; not natively modelled by
   391	arc42, C4, ADRs, or any single prior art). Carries:
   392	- `contract.md` — the deferral contract: what the
   393	  framework provides by default vs what is deferred to
   394	  the installer, with the constraints for each
   395	  deferred surface.
   396	- `knobs.schema.json` — JSON Schema (Helm-style per
   397	  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
   398	  §3) describing the customization knobs the installer
   399	  may turn.
   400	- `profiles/*.yaml` — named reference profiles
   401	  (research §4.1's "starter profiles" with trade-offs
   402	  documented per profile).
   403	
   404	#### 6.2.5 decisions/
   405	
   406	ADR-style decision records per
   407	`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
   408	§3 Nygard template. Carries:
   409	- `INDEX.md` — list of decisions with id, title,
   410	  status (proposed / accepted / deprecated /
   411	  superseded), date, and one-line summary.
   412	- `<seq>-<slug>.md` — per-decision artefacts (Title /
   413	  Context / Decision / Consequences / Status).
   414	
   415	For Product A specifically, the decisions populating
   416	v2.0 trace back to the framework's existing internal
   417	SPECs (BES-sanitized): spec-authoring-procedure-v1,
   418	ceremony-weight-refactor, decomposition-pattern,
   419	fastpath-introduction.
   420	
   421	#### 6.2.6 quality/
   422	
   423	Quality requirements + conformance gates per arc42 §10
   424	Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   425	§3). Carries:
   426	- `requirements.md` — quality scenarios (performance,
   427	  reliability, security, maintainability, etc.) with
   428	  measurable acceptance criteria.
   429	- `12-factor-overlay.md` — for cloud-native products,
   430	  the per-factor conformance posture
   431	  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   432	  §3).
   433	
   434	#### 6.2.7 operations/
   435	
   436	Carries:
   437	- `failures.md` — failure classes × recovery posture
   438	  per Symphony §14 pattern
   439	  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   440	  §3 transferable building block 10).
   441	- `observability.md` — three-tier observability
   442	  (required logging / recommended snapshot / optional
   443	  HTTP) per Symphony §13 pattern.
   444	- `safety-invariants.md` — MUST-numbered list per
   445	  Symphony §9.5 pattern.
   446	
   447	#### 6.2.8 non-goals/
   448	
   449	The second novel facet (research §4.2). Carries:
   450	- `INDEX.md` — facet-level negative space; for each
   451	  of the other seven facets, a stated non-goal section
   452	  ("the architecture/ facet does NOT cover …",
   453	  "behavior/ does NOT model …", etc.).
   454	
   455	### 6.3 Conformance suite (spec-bundle/conformance/)
   456	
   457	The executable yes/no signal layer. Carries:
   458	- Conformance check scripts that run against an
   459	  installation and exit 0 iff the install conforms to
   460	  the manifest's claimed `conformance_profile`.
   461	- Reference test data + fixtures.
   462	
   463	Conformance profiles (per Symphony §17 model):
   464	- **core**: required for any conforming install.
   465	- **extension**: required only for installs that ship
   466	  optional features.
   467	- **real-integration**: environment-dependent smoke
   468	  checks; recommended before production.
   469	
   470	## 7. Pipeline Specification
   471	
   472	### 7.1 v1.1 → v2.0 migration index
   473	
   474	| v1.1 path | v2.0 destination | Notes |
   475	|---|---|---|
   476	| `LICENSE` | `LICENSE` | unchanged |
   477	| `README.md` | `README.md` | rewritten for v2.0; adds migration note |
   478	| `CONTRIBUTING.md` | `CONTRIBUTING.md` | unchanged |
   479	| `CODE_OF_CONDUCT.md` | `CODE_OF_CONDUCT.md` | unchanged |
   480	| `CHANGELOG.md` | `CHANGELOG.md` | v2.0 entry added |
   481	| `OPERATING_MODEL.md` | `OPERATING_MODEL.md` + `spec-bundle/operations/safety-invariants.md` cross-link | content stays; new sub-spec cross-links |
   482	| (new) `AGENTS.md` | `AGENTS.md` | new at v2.0; ports content from OPERATING_MODEL |
   483	| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
   484	| `templates/` | `spec-bundle/templates/` | relocated |
   485	| `skills/` | `spec-bundle/skills/` | relocated |
   486	| `scripts/` | `scripts/` | top-level (tooling, not bundle content) |
   487	| `hooks/` | `hooks/` | top-level (tooling) |
   488	| `tests/` | `tests/` | top-level (tooling) |
   489	| `specs/` | `specs/` | top-level (framework's own SPEC ledger) |
   490	| `examples/` | `examples/` | top-level (worked IDEA+SPEC examples) |
   491	| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
   492	| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
   493	| `docs/` | absorbed into per-facet sub-spec READMEs | content reorganized; original `docs/` removed |
   494	| (new) `spec-bundle/manifest.yaml` | `spec-bundle/manifest.yaml` | new front-door |
   495	| (new) `spec-bundle/{architecture,deployment,behavior,customization,decisions,quality,operations,non-goals}/` | as named | new facet directories |
   496	| (new) `spec-bundle/conformance/` | as named | new conformance suite |
   497	| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |
   498	
   499	### 7.2 Execution order
   500	
   501	1. Author `spec-bundle/manifest.yaml` per §6.1 schema
   502	   (initial facet directories may be placeholder; the
   503	   manifest first, then population).
   504	2. Author `scripts/validate-manifest.sh` per §6.1
   505	   validation rules; verify it rejects the placeholder
   506	   bundle (test that the gate fires).
   507	3. Move existing artefacts per §7.1 migration index;
   508	   update internal cross-references (lint will catch
   509	   broken file:// paths).
   510	4. Populate the new facet sub-spec contracts per §6.2
   511	   with the minimum-viable content that lets the
   512	   manifest reference resolved files. Initially this is
   513	   placeholder content with cross-references back to
   514	   existing OPERATING_MODEL.md / examples/ / etc.; the
   515	   manifest validates structurally.
   516	5. Populate `spec-bundle/decisions/` with the first
   517	   ADR-style entries (the framework's own decisions
   518	   inventory).
   519	6. Update `scripts/lint-spec.sh` to recognize the new
   520	   manifest as a valid lint target.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '520,900p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   520	   manifest as a valid lint target.
   521	7. Update `.github/workflows/ci.yml` to add
   522	   `validate-manifest` as a CI job.
   523	8. Update `README.md` + `AGENTS.md` to point to the new
   524	   `spec-bundle/` as the methodology artefact entry.
   525	9. Add `CHANGELOG.md` v2.0 entry documenting the
   526	   reorganization.
   527	10. Tag `v2.0.0` once `validate-manifest` + lint +
   528	    hook-tests all pass on the repacked tree.
   529	
   530	### 7.3 Migration semantics
   531	
   532	v2.0 is a **breaking** change to top-level layout. Consumers
   533	who fetched v1.1 by file paths under `schema/`,
   534	`templates/`, `skills/`, `workflow/`, `workpads/` will need
   535	to update their paths. The `CHANGELOG.md` v2.0 entry and
   536	the v2.0 README's migration note enumerate the path
   537	changes.
   538	
   539	For the fleet-sync.sh consumers (the eight BES repos
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
   691	    errors.append("intent.product_name mismatch")
   692	
   693	  if errors:
   694	    print_errors(errors)
   695	    exit 1
   696	  exit 0
   697	```
   698	
   699	## 10. Failure Model
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
   761	      stub with cross-references; v2.x slices populate
   762	      richer content).
   763	- [ ] DoD-5: `AGENTS.md` authored at top level per §3
   764	      and §6.2's repo-owned-contract pattern.
   765	- [ ] DoD-6: `CHANGELOG.md` v2.0 entry added with
   766	      migration index summary.
   767	- [ ] DoD-7: CI workflow updated to include
   768	      `validate-manifest` job; all CI jobs pass on the
   769	      repacked main.
   770	- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
   771	      DoD-1 through DoD-7 are met.
   772	
   773	## 15. Acceptance Criteria
   774	
   775	(See §13 for tests; checkboxes are the post-execution
   776	verification list.)
   777	
   778	- [x] AC-1: SPEC lint clean
   779	- [x] AC-2: manifest exists
   780	- [x] AC-3: validate-manifest exits 0
   781	- [x] AC-4: every facet has primary file
   782	- [x] AC-5: hook tests 33/33 pass (no regression)
   783	- [x] AC-6: example lint clean (no regression)
   784	- [x] AC-7: CI green post-repack
   785	- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
   786	- [x] AC-9: CHANGELOG v2.0 entry present
   787	
   788	## 16. Rollback Plan
   789	
   790	If the repack surfaces a critical regression:
   791	
   792	1. The repack is a single PR (or coordinated commit
   793	   series); revert that PR via `git revert`.
   794	2. v1.1 remains the tagged release; consumers who
   795	   pinned v1.1 are unaffected.
   796	3. Author a follow-on Contract SPEC amending §6 / §7
   797	   to address the regression cause.
   798	
   799	If a partial repack lands and is later abandoned:
   800	
   801	1. The unpopulated facets are left with placeholder
   802	   content (cross-references to OPERATING_MODEL.md /
   803	   existing artefacts). v2.0 ships with `partial`
   804	   conformance_profile noted in the manifest.
   805	2. A follow-on Task SPEC completes the facets.
   806	
   807	## 17. Open Questions
   808	
   809	- [ ] Q1: Should `spec-bundle/skills/` (relocated from
   810	      `skills/`) require any content sanitization
   811	      beyond v1.1's already-clean state? Default: no;
   812	      v1.1 v1.1 skills are already
   813	      generic-fleet-friendly post the v1.1 release.
   814	- [ ] Q2: Should the conformance suite at
   815	      `spec-bundle/conformance/` ship runnable tests at
   816	      v2.0 launch, or be a placeholder for v2.x? Default:
   817	      placeholder at v2.0; the conformance suite is its
   818	      own follow-on Task SPEC.
   819	- [ ] Q3: Cross-family review for THIS Contract SPEC
   820	      and for the repack execution. Per parent
   821	      Decision §7, cross-family review is BLOCKING per
   822	      slice. Same-family proxy is the default fallback;
   823	      external Codex pass is the rigorous path.
   824	      Default: same-family proxy with explicit caveat;
   825	      escalate if owner directs.
   826	- [ ] Q4: Should `fleet-sync.sh` (in `bes-fleet-policy`)
   827	      be updated in lockstep with v2.0 launch, or
   828	      announce-then-update? Default: announce-then-
   829	      update; the fleet repos pin v1.1 paths until a
   830	      separate Task SPEC migrates them.
   831	
   832	None of Q1-Q4 is `owner-blocking`; all can be deferred
   833	to follow-on Task SPECs.
   834	
   835	## 18. Migration / Coexistence
   836	
   837	v2.0 supersedes v1.1's top-level layout. Coexistence
   838	strategy: <!-- lint-ok: no-citation -->
   839	
   840	- v1.1 remains the tagged release; consumers continue
   841	  to fetch v1.1 by tag until they choose to upgrade. <!-- lint-ok: no-citation -->
   842	- v2.0 ships under the same repo URL; the v2.0.0 tag
   843	  marks the breaking-layout boundary. <!-- lint-ok: no-citation -->
   844	- The CHANGELOG.md v2.0 entry contains the migration
   845	  index (§7.1 above) so consumers can find their
   846	  artefacts' new homes. <!-- lint-ok: no-citation -->
   847	- For 30 days after v2.0 release, the repo MAY keep
   848	  symlinks from old paths (`schema/SPEC.schema.md` →
   849	  `spec-bundle/schema/SPEC.schema.md`) to ease
   850	  transition. After 30 days, symlinks are removed. <!-- lint-ok: no-citation -->
   851	
   852	## 19. Completion Report
   853	
   854	### 19.1 Files changed
   855	
   856	60 files changed in commit `1104e3a`
   857	(2016 insertions / 72 deletions):
   858	
   859	**Created** (24 new files):
   860	- `AGENTS.md` (new top-level entry doc)
   861	- `CLAUDE.md` (new Claude Code entry doc; imports AGENTS.md)
   862	- `scripts/validate-manifest.sh` (mechanical completeness
   863	  gate)
   864	- `spec-bundle/manifest.yaml` (front-door manifest)
   865	- `spec-bundle/architecture/CONTEXT.md` +
   866	  `solution-strategy.md`
   867	- `spec-bundle/deployment/install.md` +
   868	  `requirements.md`
   869	- `spec-bundle/behavior/features/lint-citation-grammar.feature`
   870	  + `hook-blocks-ai-attribution.feature`
   871	- `spec-bundle/customization/contract.md` +
   872	  `knobs.schema.json`
   873	- `spec-bundle/decisions/INDEX.md`
   874	- `spec-bundle/quality/requirements.md` +
   875	  `12-factor-overlay.md`
   876	- `spec-bundle/operations/failures.md` +
   877	  `observability.md` + `safety-invariants.md`
   878	- `spec-bundle/non-goals/INDEX.md`
   879	
   880	**Renamed** (33 files via `git mv`; history preserved):
   881	- `schema/SPEC.schema.md` →
   882	  `spec-bundle/schema/SPEC.schema.md`
   883	- `templates/*.template.md` (6 files) →
   884	  `spec-bundle/templates/*.template.md`
   885	- `skills/<name>/SKILL.md` (20 skills) →
   886	  `spec-bundle/skills/<name>/SKILL.md`
   887	- `skills/<name>/references/*.md` (4 references) →
   888	  `spec-bundle/skills/<name>/references/*.md`
   889	- `workflow/UNIVERSAL.md` →
   890	  `spec-bundle/operations/workflow-universal.md`
   891	- `workpads/*.template.md` (3 files) →
   892	  `spec-bundle/templates/workpads/*.template.md`
   893	
   894	**Modified** (4 files):
   895	- `.github/workflows/ci.yml` — adds `validate-manifest`
   896	  job (5 jobs total now)
   897	- `CHANGELOG.md` — v2.0 entry with migration index
   898	- `README.md` — rewritten for v2.0 with v1.x migration
   899	  table
   900	- `scripts/validate-skill-frontmatter.sh` — scans

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"primary_index|media_type|source_commit|source_tag|schema_uri|v2\\.1|8\\.3|manifest\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
2:id: 2026-05-19-v2-manifest-catalog-repack
12:  - bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
13:  - test -f spec-bundle/manifest.yaml
14:  - bash scripts/validate-manifest.sh
24:front-door-manifest + per-facet-catalog shape that
26:the v2.0 directory layout, the manifest schema, the
48:manifest+catalog shape the methodology advocates, as the
54:§3 manifest+descriptors+layers) is incompatible with
56:repack, Product B's longread would advocate manifest+catalog
61:This SPEC defines the v2.0 layout, the front-door manifest
71:  manifest+catalog packaging
74:- Author the front-door `spec-bundle/manifest.yaml`
81:- Author a `scripts/validate-manifest.sh` mechanical
82:  gate that checks the manifest references every named
84:  manifest.
100:  manifest's signature field is reserved but not
114:manifest plus eight per-facet sub-spec directories:
127:│   ├── manifest.yaml                  # front-door manifest
140:├── scripts/                           # lint-spec, validate-manifest, etc.
147:└── .github/workflows/                 # CI (updated to validate manifest)
153:directory is the actual manifest+catalog artefact — what a
182:  §3 — manifest+descriptors+layers.
242:There is no `manifest.yaml` in v1.1. v2.0 introduces it as
247:them under `spec-bundle/` so the manifest can address
252:### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
254:The manifest is the bundle's single source of truth for
259:# spec-bundle/manifest.yaml
260:spec_version: "2.0.0"               # semver; this manifest schema version
321:`scripts/validate-manifest.sh`):
460:  the manifest's claimed `conformance_profile`.
494:| (new) `spec-bundle/manifest.yaml` | `spec-bundle/manifest.yaml` | new front-door |
497:| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |
501:1. Author `spec-bundle/manifest.yaml` per §6.1 schema
503:   manifest first, then population).
504:2. Author `scripts/validate-manifest.sh` per §6.1
512:   manifest reference resolved files. Initially this is
515:   manifest validates structurally.
520:   manifest as a valid lint target.
522:   `validate-manifest` as a CI job.
527:10. Tag `v2.0.0` once `validate-manifest` + lint +
541:the manifest in `fleet-files.txt` is updated to point at
548:### 8.1 Manifest schema (formal — v2.1.0)
550:The manifest is YAML. Top-level keys (REQUIRED unless
551:noted). Fields marked **(v2.1)** were added per the codex
554:§7.E (finding 3.5) — manifest spec_version bumped from
559:| `spec_version` | string (semver) | yes | This manifest schema's version |
564:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
565:| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
566:| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
568:| `facets` | object | yes | See §8.3 |
570:| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
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
622:Resource records MAY also include `media_type`,
624:§8.3 facet record).
634:### 8.6 `provenance` block (v2.1)
643:| `slsa_level` | string | OPTIONAL | SLSA build level (e.g. `slsa-v1.0/L3`); empty at v2.1 launch (corpus entry pending; see corpus §17 Q4 deferred candidates) |
647:### 9.1 validate-manifest (pseudocode)
650:function validate_manifest():
651:  manifest = parse_yaml("spec-bundle/manifest.yaml")
655:  if manifest.spec_version != "2.1.0":
656:    errors.append("spec_version: expected 2.1.0, got " + manifest.spec_version)
659:  if manifest.conformance_profile not in ["core", "extension", "real-integration"]:
665:    if field not in manifest:
671:    if f not in manifest.intent:
677:  listed_facets = set(manifest.facets.keys())
685:  for fname, fdef in manifest.facets.items():
690:  if manifest.intent.product_name != "agentic-ops-framework":
703:| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
704:| `facet-fs-mismatch` | Facet listed in manifest has no directory, or directory exists with no manifest entry | Author reconciles; either populate the directory or remove the facet entry |
706:| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
712:  manifest is read-only data; `validate-manifest.sh` is
726:- `validate-manifest.sh` prints diagnostic lines to
728:- CI job `validate-manifest` runs on every push +
739:| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` exits 0 |
740:| AC-2 | `cmd://test -f spec-bundle/manifest.yaml` exits 0 |
741:| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
751:- [ ] DoD-1: `spec-bundle/manifest.yaml` authored
753:- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
754:      `cmd://bash scripts/validate-manifest.sh` exits 0
768:      `validate-manifest` job; all CI jobs pass on the
779:- [x] AC-2: manifest exists
780:- [x] AC-3: validate-manifest exits 0
804:   conformance_profile noted in the manifest.
862:- `scripts/validate-manifest.sh` (mechanical completeness
864:- `spec-bundle/manifest.yaml` (front-door manifest)
895:- `.github/workflows/ci.yml` — adds `validate-manifest`
919:- `cmd://chmod +x scripts/validate-manifest.sh`.
921:  specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
923:- `cmd://bash scripts/validate-manifest.sh` — exit 0
924:  (PASS — manifest schema 2.0.0, conformance core, 8
945:validate-manifest, preflight-self-check).
947:The manifest+catalog packaging successfully exemplifies
951:v2.0 IS the manifest+catalog shape Product B
999:  resources can adopt manifest+catalog packaging
1001:  `spec-evidence-governance` skill: "manifest+catalog
1005:  door manifest as a single source of truth for what
1030:- **`validate-manifest.sh` was the right scaffolding
1032:  manifest + facet primaries meant the script could be

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"BLOCKER|HIGH|3\\.6|3\\.3|provenance|primary_index|media_type|source_commit|source_tag|schema_uri|stale\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (now v2.1 schema), spec-bundle/manifest.yaml (v2.1.0), scripts/validate-manifest.sh, plus the eight facet primary files. Round 1 findings 3.1-3.6 at file://../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md addressed in commits a469857 (3.1 BLOCKER), 9fef966 (3.2/3.3/3.4), ad36bda (3.5/3.6 v2.1 schema). Verify: (1) 3.1 BLOCKER — does the SPEC's acceptance_commands list now only contain commands that actually pass? (2) 3.2 broken cross-repo file:// citations now point to url://github.com/... ? (3) 3.3 v1.1->v2.0 migration completeness — are CONTRIBUTING.md, TASK.template.md, skills files referencing v2.0 paths correctly? (4) 3.4 fleet-sync.sh guard — does the script refuse cleanly when source layout is v2.0? (5) 3.5 + 3.6 v2.1 manifest schema — schema_uri, source_commit, source_tag, per-facet media_type/digest/size/status, provenance block all correctly defined in §8 + populated in manifest.yaml? (6) NEW: did the v2.1 schema bump introduce its own carry-through issues — does validate-manifest enforce the new primary_index for directory primaries? Output: per-finding verdicts + new findings + Quality Gate Result.
22:ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
23:9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)
24:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
261:schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
262:source_commit: ""              # populated by release tooling at tag time
263:source_tag: "v2.0.0"
286:    media_type: "text/markdown"
291:    media_type: "text/markdown"
296:    primary_index: "behavior/features/lint-citation-grammar.feature"
297:    media_type: "text/x.gherkin"
302:    media_type: "text/markdown"
307:    media_type: "text/markdown"
312:    media_type: "text/markdown"
317:    media_type: "text/markdown"
322:    media_type: "text/markdown"
328:    media_type: "text/markdown"
331:    media_type: "text/markdown"
334:    media_type: "text/markdown"
337:    media_type: "application/vnd.framework.conformance-suite"
340:provenance:
1187:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
1188:| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
1189:| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
1193:| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
1215:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
1216:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
1217:| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
1220:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
1226:finding 3.6)**: when `primary` is a directory path, the
1228:the file named by `primary_index` exists inside it AND
1229:(if `media_type` is set) at least one file in the
1983:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"3\\.[1-6]|Finding|BLOCKER|Major|Minor|file://|url://github.com|Quality Gate\" ../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2167:4903:    68	### 3.3 Out of scope
2174:4964:    70	### 3.3 Out of scope
2494:6409:   105	### 3.3 Out of scope
2525:6954:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2526:6955:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2529:6977:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2530:6978:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2533:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"acceptance_commands|schema_uri|source_commit|source_tag|primary_index|media_type|digest|size|provenance|v2\\.1|validate-manifest|Completion Report|Quality Gate|## 8|## 9|## 17|## 19\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2547:564:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
2548:565:| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
2549:566:| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
2550:570:| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
2553:592:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
2554:593:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
2555:594:| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
2558:597:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
2561:605:the file named by `primary_index` exists inside it AND
2562:606:(if `media_type` is set) at least one file in the
2565:622:Resource records MAY also include `media_type`,
2568:634:### 8.6 `provenance` block (v2.1)
2597:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "schema_uri|source_commit|source_tag|primary_index|media_type|digest|size|provenance|sbom|slsa|spec_version|primary:" spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
2600:6:schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
2601:7:source_commit: ""              # populated by release tooling at tag time
2602:8:source_tag: "v2.0.0"
2604:31:    media_type: "text/markdown"
2606:36:    media_type: "text/markdown"
2608:41:    primary_index: "behavior/features/lint-citation-grammar.feature"
2609:42:    media_type: "text/x.gherkin"
2611:47:    media_type: "text/markdown"
2613:52:    media_type: "text/markdown"
2615:57:    media_type: "text/markdown"
2617:62:    media_type: "text/markdown"
2619:67:    media_type: "text/markdown"
2620:73:    media_type: "text/markdown"
2621:76:    media_type: "text/markdown"
2622:79:    media_type: "text/markdown"
2623:82:    media_type: "application/vnd.framework.conformance-suite"
2624:85:provenance:
2816:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2817:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2818:| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
2819:| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
2820:| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
2824:| The verified SPEC still carries stale completion state: body says “Status: Draft v1”, DoD remains unchecked, and AC-8 says the tag is pending even though `v2.0.0` now exists. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:21), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:710), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744) | LOW |
2839:| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
2840:| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
2841:| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
2842:| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
2843:| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
2847:| The verified SPEC still carries stale completion state: body says “Status: Draft v1”, DoD remains unchecked, and AC-8 says the tag is pending even though `v2.0.0` now exists. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:21), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:710), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744) | LOW |
2854:The three SPEC acceptance commands are now the only commands in front matter; the old manifest lint command is gone. I’m running those gates and checking the v2.1 validator path against the new `primary_index` rule rather than relying on the manifest’s current happy path.
3044:     6	schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
3045:     7	source_commit: ""              # populated by release tooling at tag time
3046:     8	source_tag: "v2.0.0"
3069:    31	    media_type: "text/markdown"
3074:    36	    media_type: "text/markdown"
3079:    41	    primary_index: "behavior/features/lint-citation-grammar.feature"
3080:    42	    media_type: "text/x.gherkin"
3085:    47	    media_type: "text/markdown"
3090:    52	    media_type: "text/markdown"
3095:    57	    media_type: "text/markdown"
3100:    62	    media_type: "text/markdown"
3105:    67	    media_type: "text/markdown"
3111:    73	    media_type: "text/markdown"
3114:    76	    media_type: "text/markdown"
3117:    79	    media_type: "text/markdown"
3120:    82	    media_type: "application/vnd.framework.conformance-suite"
3123:    85	provenance:
3280:   564	| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
3281:   565	| `source_commit` | string (git SHA) | yes **(v2.1)** | Commit SHA the bundle was generated from; binds the bundle to its source-of-truth state. MAY be empty at authoring time; release tooling populates at tag |
3282:   566	| `source_tag` | string | OPTIONAL **(v2.1)** | Git tag if the bundle corresponds to a tagged release |
3286:   570	| `provenance` | object | OPTIONAL **(v2.1)** | See §8.6: SBOM ref + SLSA attestation refs |
3308:   592	| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
3309:   593	| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
3310:   594	| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
3313:   597	| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
3319:   603	finding 3.6)**: when `primary` is a directory path, the
3321:   605	the file named by `primary_index` exists inside it AND
3322:   606	(if `media_type` is set) at least one file in the
3338:   622	Resource records MAY also include `media_type`,
3350:   634	### 8.6 `provenance` block (v2.1)
3558:The manifest itself has `primary_index` for the behavior directory primary, but the validator still only checks that the primary directory exists. I’m checking whether that is the only carry-through issue or whether old v1.1 paths remain in the docs/templates/skills too.
3760:   105	### 3.3 Out of scope
5455:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "primary_index|media_type|digest|size|schema_uri|source_commit|source_tag|provenance|sbom|slsa|bundle_version|generated_on|generator|developer_authority|installer_authority" scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
5463:The three current SPEC front-matter acceptance commands all pass, but the v2.1 remediation is not gate-clean. The blocking issue is that `validate-manifest.sh` still does not enforce the new v2.1 `primary_index` rule it is now claimed to enforce.
5469:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
5470:| v2.1 provenance fields are present but not trustworthy as populated release metadata: `source_commit` is empty, and `source_tag: "v2.0.0"` points to tag commit `f0c75fc…`, while current HEAD is `ad36bda…`; the tag’s manifest is still `spec_version: "2.0.0"`. Also `schema_uri` points at `main`, not an immutable tag or commit. | HIGH | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:6), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:7), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:8) |
5471:| The v1.1 path migration is still incomplete in executable guidance. `TASK.template.md` and key skills still cite old `templates/`, `skills/`, `workflow/`, and `agents/` paths that do not match the v2.0 bundle layout. | HIGH | [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67) |
5477:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
5479:| 3.3 | OPEN. `CONTRIBUTING.md` is mostly corrected, but `TASK.template.md` and multiple skills still reference old paths. |
5481:| 3.5 | PARTIAL. §8 defines the new v2.1 fields and `manifest.yaml` has `schema_uri`, `source_tag`, per-facet `media_type/status`, and a `provenance` block. But `source_commit` is empty, `source_tag` is stale for current HEAD, digest/size are not populated, and the validator ignores these fields. |
5482:| 3.6 | OPEN. Manifest has `behavior.primary_index`, but the validator does not enforce required `primary_index` for directory primaries. |
5489:The three current SPEC front-matter acceptance commands all pass, but the v2.1 remediation is not gate-clean. The blocking issue is that `validate-manifest.sh` still does not enforce the new v2.1 `primary_index` rule it is now claimed to enforce.
5495:| `validate-manifest.sh` does not enforce v2.1 `primary_index` for directory primaries. The SPEC says directory `primary` entries require `primary_index` and that the validator enforces it, but the script only checks whether the primary path is a directory or file. It never parses `primary_index`, `media_type`, digest, size, provenance, `schema_uri`, or source fields. | BLOCKER | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:139) |
5496:| v2.1 provenance fields are present but not trustworthy as populated release metadata: `source_commit` is empty, and `source_tag: "v2.0.0"` points to tag commit `f0c75fc…`, while current HEAD is `ad36bda…`; the tag’s manifest is still `spec_version: "2.0.0"`. Also `schema_uri` points at `main`, not an immutable tag or commit. | HIGH | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:6), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:7), [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:8) |
5497:| The v1.1 path migration is still incomplete in executable guidance. `TASK.template.md` and key skills still cite old `templates/`, `skills/`, `workflow/`, and `agents/` paths that do not match the v2.0 bundle layout. | HIGH | [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67) |
5503:| 3.1 BLOCKER | RESOLVED. SPEC front matter now lists only `lint-spec SPEC`, `test -f manifest`, and `validate-manifest`; all three pass locally. |
5505:| 3.3 | OPEN. `CONTRIBUTING.md` is mostly corrected, but `TASK.template.md` and multiple skills still reference old paths. |
5507:| 3.5 | PARTIAL. §8 defines the new v2.1 fields and `manifest.yaml` has `schema_uri`, `source_tag`, per-facet `media_type/status`, and a `provenance` block. But `source_commit` is empty, `source_tag` is stale for current HEAD, digest/size are not populated, and the validator ignores these fields. |
5508:| 3.6 | OPEN. Manifest has `behavior.primary_index`, but the validator does not enforce required `primary_index` for directory primaries. |

codex
The Round-2 failure mode was exactly the validator not parsing `primary_index` at all. In `380db29`, the script now has a dedicated `facet_primary_index` parse path and a directory-primary branch; I’m validating whether that branch is complete, and separately scanning templates/skills for stale path instructions.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "test -f spec-bundle/manifest.yaml && printf 'manifest exists\\n'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
manifest exists

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "(''^|[''^[:alnum:]_./-])(schema/|templates/|skills/|workflow/|workpads/|agents/|'"\\.agents/)|file://(schema|templates|skills|workflow|workpads|agents|\\.agents)/|spec-bundle/(schema|templates|skills|operations|conformance)|adopter|install|copied\" spec-bundle/templates spec-bundle/skills CONTRIBUTING.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
CONTRIBUTING.md:22:2. **Read `spec-bundle/schema/SPEC.schema.md`** — the citation grammar
CONTRIBUTING.md:24:   see `schema/SPEC.schema.md`).
CONTRIBUTING.md:29:   using `spec-bundle/templates/IDEA.template.md` (v2.0
spec-bundle/templates/TASK.template.md:50:  `file://skills/approved-spec-decomposition/SKILL.md`
spec-bundle/templates/TASK.template.md:70:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/templates/TASK.template.md:109:`file://spec-bundle/operations/workflow-universal.md` "Universal guardrails".
spec-bundle/templates/TASK.template.md:178:journal per `file://spec-bundle/operations/workflow-universal.md` Step 1.
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:85:`skills/repo-orientation/SKILL.md`). Each entry tells you
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:96:bash agents/scripts/send-fleet-message.sh <target-repo> <type> "<one-line summary>" [< body.md]
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/templates/SPEC.contract.template.md:17:Refer to `templates/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.contract.template.md:54:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and the 2026-01-15
spec-bundle/templates/SPEC.contract.template.md:253:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) and the validation
spec-bundle/templates/IDEA.template.md:13:Refer to `templates/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.task.template.md:17:Refer to `templates/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.fastpath.template.md:17:`file://spec-bundle/skills/fast-path/SKILL.md` "Thresholds" are met. If
spec-bundle/templates/SPEC.fastpath.template.md:23:(`file://spec-bundle/skills/spec-driven-development/SKILL.md`
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:38:under `agents/fleet-directives/<YYYY-MM-DD>-<slug>.md`:
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:66:test -f .agents/templates/AGENT_INBOX.template.md && \
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:67:    grep -q "decision-authority://" .agents/specs/SPEC.schema.md
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:84:   `agents/fleet-directives/`. The id matches the file name
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:92:   bash agents/scripts/audit-fleet-compliance.sh
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:109:   `agents/fleet-directives/archive/`.
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:115:- Reads every `*.md` in `agents/fleet-directives/` with
spec-bundle/templates/SPEC.decision.template.md:17:Refer to `templates/SPEC.schema.md` for shared conventions
spec-bundle/templates/workpads/AGENT_INBOX.template.md:18:`file://spec-bundle/skills/cross-repo-informational-channel/SKILL.md`;
spec-bundle/templates/workpads/AGENT_INBOX.template.md:19:`file://spec-bundle/skills/cross-repo-informational-channel/SKILL.md`.
spec-bundle/templates/workpads/AGENT_INBOX.template.md:25:`file://spec-bundle/skills/repo-orientation/SKILL.md` Step 3). Each
spec-bundle/templates/workpads/AGENT_INBOX.template.md:39:bash .agents/scripts/send-fleet-message.sh <target-repo> <type> "<one-line summary>"
spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:  (`file://spec-bundle/schema/SPEC.schema.md` §2).
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:15:`file://spec-bundle/operations/workflow-universal.md` "Section 1 — Universal";
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:16:`file://spec-bundle/skills/repo-orientation/SKILL.md` Step 2.
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `templates/SPEC.schema.md` §2.
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:101:   sane, hooks are installed, lint passes on the parent
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:160:- **Native `git worktree`** is sufficient and zero-install.
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:8:`file://skills/agent-feedback/SKILL.md`;
spec-bundle/skills/agent-feedback/SKILL.md:14:`file://workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:27:  `agents/` directory (**misalignment**).
spec-bundle/skills/agent-feedback/SKILL.md:43:   from `file://workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:67:    `file://skills/fleet-enforce/SKILL.md`.
spec-bundle/skills/agent-feedback/SKILL.md:86:  `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-review/SKILL.md:10:`file://spec-bundle/schema/SPEC.schema.md` §5.
spec-bundle/skills/spec-review/SKILL.md:34:Companion workflow: `agents/workflows/review-spec.md`
spec-bundle/skills/spec-review/SKILL.md:261:  `file://skills/spec-review/references/per-type-gates.md`.
spec-bundle/skills/spec-review/SKILL.md:262:- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
spec-bundle/skills/spec-review/SKILL.md:265:- Companion workflow: `<adopter-policy-repo>/agents/workflows/review-spec.md` (fleet-baseline reference; bes-fleet-policy-layout-specific).
spec-bundle/skills/spec-review/SKILL.md:269:- Authoring side: `file://skills/spec-authoring/SKILL.md`.
spec-bundle/skills/spec-review/SKILL.md:271:  `file://spec-bundle/skills/spec-driven-development/SKILL.md`.
spec-bundle/skills/spec-review/references/per-type-gates.md:91:`file://skills/spec-authoring/SKILL.md`), apply the
spec-bundle/skills/spec-authoring/SKILL.md:67:- `templates/IDEA.template.md` — the IDEA artefact.
spec-bundle/skills/spec-authoring/SKILL.md:68:- `templates/SPEC.task.template.md` — concrete, scoped, verifiable
spec-bundle/skills/spec-authoring/SKILL.md:70:- `templates/SPEC.contract.template.md` — stateful, multi-component,
spec-bundle/skills/spec-authoring/SKILL.md:72:- `templates/SPEC.decision.template.md` — binding choice between
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `templates/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:83:child repo holds its own work under `.agents/specs/` (or
spec-bundle/skills/spec-authoring/SKILL.md:102:   `skills/fast-path/SKILL.md` for thresholds. **If ANY
spec-bundle/skills/spec-authoring/SKILL.md:153:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) MAY use a
spec-bundle/skills/spec-authoring/SKILL.md:191:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:203:`file://spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly; pervasive
spec-bundle/skills/spec-authoring/SKILL.md:210:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and
spec-bundle/skills/spec-authoring/SKILL.md:239:  `templates/SPEC.schema.md` first.
spec-bundle/skills/approved-spec-decomposition/SKILL.md:24:  `<adopter-policy-repo>/agents/MODEL_ROUTING.md` (legacy bes-fleet-policy location; not present in agentic-ops-framework v2.0 standalone — adopters provide their own model-routing reference) "Routing Matrix" (multi-agent
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:56:2. Read `<adopter-policy-repo>/agents/MODEL_ROUTING.md` (legacy bes-fleet-policy location; not present in agentic-ops-framework v2.0 standalone — adopters provide their own model-routing reference) "Routing Matrix" to map task
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:4. For each slice, copy `file://spec-bundle/templates/TASK.template.md` to
spec-bundle/skills/approved-spec-decomposition/SKILL.md:107:7. Run `cmd://bash agents/scripts/lint-spec.sh
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/agents-md-improver/SKILL.md:42:  `file://workpads/WORKFLOW.body.md` (or
spec-bundle/skills/agents-md-improver/SKILL.md:61:- Tracked `.agents/` or `.claude/` directories.
spec-bundle/skills/agents-md-improver/SKILL.md:63:`.agents/` and `.claude/` content lays in the working tree (gitignored)
spec-bundle/skills/repo-orientation/SKILL.md:14:   `.agents/DOCUMENTATION_GUIDE.md`, and the docs linked by `AGENTS.md`.
spec-bundle/skills/repo-orientation/SKILL.md:21:   sessions read Section 1 only; do NOT install the tracker or
spec-bundle/skills/spec-authoring/references/reference-architecture.md:26:   `owner://` prefix per `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/references/reference-architecture.md:61:4. **`workpads/<tool>.<ext>.template`** project-level
spec-bundle/skills/spec-authoring/references/reference-architecture.md:68:6. **`agents/SKILL_REGISTRY.md`** row in the supplementary skill
spec-bundle/skills/spec-driven-development/SKILL.md:21:2. **Orient** — read `.agents/DOCUMENTATION_GUIDE.md` if present, the
spec-bundle/skills/spec-driven-development/SKILL.md:61:   discipline applies (see `file://workpads/WORKFLOW.body.md`).
spec-bundle/skills/spec-driven-development/SKILL.md:75:    posts justified pushback. See `file://skills/code-review/SKILL.md`
spec-bundle/skills/spec-driven-development/SKILL.md:76:    and `file://skills/spec-review/SKILL.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:95:`file://skills/spec-driven-development/references/capture-after-and-fastpath.md`
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:105:- `task` → `templates/SPEC.task.template.md` — concrete, scoped,
spec-bundle/skills/spec-driven-development/SKILL.md:107:- `contract` → `templates/SPEC.contract.template.md` — specifies
spec-bundle/skills/spec-driven-development/SKILL.md:111:- `decision` → `templates/SPEC.decision.template.md` — chooses
spec-bundle/skills/spec-driven-development/SKILL.md:116:`templates/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:117:`templates/IDEA.template.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `templates/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:135:`specs/*` does not propagate via `fleet-sync.sh`; only `agents/*`
spec-bundle/skills/spec-driven-development/SKILL.md:137:mutating `agents/*` (typical of Decision SPECs encoding
spec-bundle/skills/spec-driven-development/SKILL.md:170:  docs path defined by `.agents/DOCUMENTATION_GUIDE.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-driven-development/SKILL.md:180:  `agents/SKILL_REGISTRY.md`, the manifest entry in
spec-bundle/skills/spec-authoring/references/studio-principles.md:35:`file://skills/spec-review/SKILL.md` under "Decision spec
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:4:`file://spec-bundle/skills/approved-spec-decomposition/SKILL.md` per
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:17:`file://spec-bundle/skills/approved-spec-decomposition/SKILL.md`;
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:   `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) "PR feedback
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:44:`file://spec-bundle/skills/code-review/SKILL.md` and the
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:46:`file://spec-bundle/skills/spec-review/SKILL.md` are the executors
spec-bundle/skills/fast-path/SKILL.md:16:`file://templates/SPEC.fastpath.template.md`.
spec-bundle/skills/fast-path/SKILL.md:48:   `file://templates/SPEC.fastpath.template.md`. Status:
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:4:`file://spec-bundle/skills/spec-driven-development/SKILL.md` per the
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:12:  `agents/*` content (typical of Decision SPECs encoding
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:18:For SPECs that DO mutate `agents/*` content, the standard
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:25:`agents/*` content propagates. When a SPEC binds work in child
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md:26:repos but does not mutate `agents/*` (typical of Decision SPECs
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:4:`file://spec-bundle/skills/spec-driven-development/SKILL.md` per the
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:8:Authority: `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:9:exception (owner-only)"; `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:22:`file://spec-bundle/skills/spec-driven-development/SKILL.md`
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:31:work (see `file://spec-bundle/skills/fast-path/SKILL.md` for
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:66:  `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
validate-manifest: PASS — manifest schema 2.1.0, conformance core, 8 facets

 succeeded in 842ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  66
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba CONTRIBUTING.md | sed -n '1,60p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/TASK.template.md | sed -n '1,130p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
   109	`file://spec-bundle/operations/workflow-universal.md` "Universal guardrails".
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/SPEC.contract.template.md | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	id: [YYYY-MM-DD-kebab-case-topic]
     3	status: draft
     4	type: contract
     5	owner: [owner-identifier]
     6	repo: [repo-name]
     7	branch_policy: worktree-preferred
     8	risk: medium
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands: []
    12	ideated_in: [repo-relative-path-to-IDEA.md]
    13	---
    14	
    15	<!--
    16	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.3.
    17	Refer to `templates/SPEC.schema.md` for shared conventions
    18	(front-matter ordering, citation grammar, RFC 2119 rules, section
    19	naming). The shared section titles `## Authority Map`,
    20	`## Code/Docs Reality Check`, `## Open Questions`,
    21	`## Acceptance Criteria`, `## Rollback Plan`, `## Completion Report`
    22	MUST appear with byte-identical text-after-number across the three
    23	SPEC templates.
    24	
    25	Quality gate: bar (c) "protocol-grade", with REQUIRED `lint-spec.sh`
    26	pass — see authority §10.3.
    27	-->
    28	
    29	# SPEC: [Contract Title]
    30	
    31	Status: [Draft v1 | ...]
    32	Type: Contract
    33	Purpose: [one-paragraph statement of what this contract specifies].
    34	
    35	## Normative Language
    36	
    37	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    38	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    39	document are to be interpreted as described in RFC 2119 and RFC 8174
    40	when, and only when, they appear in all capitals.
    41	
    42	`Implementation-defined` means the behavior is part of the contract
    43	but this specification does not prescribe a single universal policy.
    44	Implementations MUST document the selected behavior in the affected
    45	artefact.
    46	
    47	## 1. Problem Statement
    48	
    49	<!-- guidance: state the contract's reason-for-being. Cite the
    50	producing IDEA.md and any owner directives. Three-failure-mode
    51	framing is RECOMMENDED.
    52	
    53	Capture-after defer-shorthand (status: verified only): per
    54	`file://spec-bundle/schema/SPEC.schema.md` §1.3 and the 2026-01-15
    55	ceremony-weight-refactor Decision SPEC §7, when this SPEC lands
    56	at `status: verified` via the capture-after exception, this
    57	section MAY be a one-paragraph cite-by-id pointer to the
    58	producing IDEA's §1 — e.g. "See `file://specs/<id>/IDEA.md` §1
    59	for the problem statement (capture-after defer)." The lint
    60	recognises this shorthand only when status is verified AND the
    61	IDEA is cited. -->
    62	
    63	[Problem statement with citations.]
    64	
    65	Owner directive (`owner://transcript-[YYYY-MM-DD]`, captured in
    66	[IDEA.md path] §[N]):
    67	
    68	> [verbatim quote]
    69	
    70	## 2. Goals and Non-Goals
    71	
    72	### 2.1 Goals
    73	
    74	- REQUIRED: [Goal 1.]
    75	- REQUIRED: [Goal 2.]
    76	- RECOMMENDED: [Goal 3.]
    77	
    78	### 2.2 Non-Goals
    79	
    80	- NOT [excluded scope 1].

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/IDEA.template.md | sed -n '1,60p'; nl -ba spec-bundle/templates/SPEC.task.template.md | sed -n '1,70p'; nl -ba spec-bundle/templates/SPEC.decision.template.md | sed -n '1,60p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
    13	Refer to `templates/SPEC.schema.md` for shared conventions
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
     1	---
     2	id: [YYYY-MM-DD-kebab-case-topic]
     3	status: draft
     4	type: task
     5	owner: [owner-identifier]
     6	repo: [repo-name]
     7	branch_policy: worktree-preferred
     8	risk: low
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands: []
    12	ideated_in: [repo-relative-path-to-IDEA.md]
    13	---
    14	
    15	<!--
    16	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.2.
    17	Refer to `templates/SPEC.schema.md` for shared conventions
    18	(front-matter ordering, citation grammar, RFC 2119 rules, section
    19	naming). The shared section titles `## Authority Map`,
    20	`## Code/Docs Reality Check`, `## Open Questions`,
    21	`## Acceptance Criteria`, `## Rollback Plan`, `## Completion Report`
    22	MUST appear with byte-identical text-after-number across the three
    23	SPEC templates.
    24	
    25	Quality gate: bar (b) "verifiable" — see authority §10.2.
    26	-->
    27	
    28	# SPEC: [Task Title]
    29	
    30	## Normative Language
    31	
    32	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    33	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    34	document are to be interpreted as described in RFC 2119 and RFC 8174
    35	when, and only when, they appear in all capitals. RFC 2119 keywords
    36	in this Task SPEC appear in Desired Behavior, Acceptance Criteria,
    37	Test Plan, and Safety / Scope Invariants sections.
    38	
    39	## 1. Problem
    40	
    41	<!-- guidance: describe the problem in concrete terms. Cite affected
    42	files, observed behavior, and the owner directive or evidence that
    43	makes the change matter now. Every factual claim carries a citation
    44	prefix per SPEC.schema.md §2. -->
    45	
    46	[Problem statement with citations.]
    47	
    48	## 2. North Star / Product Promise
    49	
    50	<!-- guidance: state the durable product, project, or operating promise
    51	this work serves. For recovery work, state what the repo is trying to
    52	become again after context loss. Ground this in checked-in docs and
    53	owner decisions, not memory. -->
    54	
    55	[Durable promise. Cite the canonical doc that owns the promise.]
    56	
    57	## 3. Goals
    58	
    59	<!-- guidance: list goals as imperatives. Each goal SHOULD be
    60	verifiable in §13 Test Plan. -->
    61	
    62	- [Goal 1.]
    63	- [Goal 2.]
    64	
    65	## 4. Non-Goals
    66	
    67	<!-- guidance: explicitly excluded scope. Forecloses subagent
    68	overreach. -->
    69	
    70	- [Excluded scope.]
     1	---
     2	id: [YYYY-MM-DD-kebab-case-topic]
     3	status: draft
     4	type: decision
     5	owner: [owner-identifier]
     6	repo: [repo-name]
     7	branch_policy: worktree-preferred
     8	risk: low
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands: []
    12	ideated_in: [repo-relative-path-to-IDEA.md]
    13	---
    14	
    15	<!--
    16	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.4.
    17	Refer to `templates/SPEC.schema.md` for shared conventions
    18	(front-matter ordering, citation grammar, RFC 2119 rules, section
    19	naming). The shared section titles `## Authority Map`,
    20	`## Open Questions`, `## Acceptance Criteria`, `## Completion Report`
    21	MUST appear with byte-identical text-after-number across the three
    22	SPEC templates. (`## Code/Docs Reality Check` and `## Rollback Plan`
    23	are OPTIONAL in Decision specs per SPEC.schema.md §4.1.)
    24	
    25	Quality gate: bar (b) + candidate-comparison structure — see
    26	authority §10.4.
    27	
    28	CRITICAL: RFC 2119 keywords (`MUST`, `MUST NOT`, `REQUIRED`, `SHALL`,
    29	`SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, `OPTIONAL`)
    30	appear ONLY in §7. Decision Statement. They MUST NOT appear in any
    31	other section of this template (per SPEC.schema.md §3). Lowercase
    32	"must"/"should"/"may" in ordinary English are permitted elsewhere but
    33	carry no normative force.
    34	-->
    35	
    36	# SPEC: [Decision Title]
    37	
    38	## Normative Language
    39	
    40	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    41	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    42	document are to be interpreted as described in RFC 2119 and RFC 8174
    43	when, and only when, they appear in all capitals.
    44	
    45	In Decision SPECs, RFC 2119 keywords appear ONLY in §7. Decision
    46	Statement. They do not appear in any other section of this document.
    47	
    48	## 1. Problem
    49	
    50	<!-- guidance: state the choice that needs making. Cite the producing
    51	IDEA.md and the owner directive that surfaced this decision. Plain
    52	English only — no RFC 2119 keywords. -->
    53	
    54	[Statement of the choice with citations.]
    55	
    56	## 2. Substance Citations
    57	
    58	<!-- guidance: enumerate substantive sources informing this decision:
    59	prior specs, owner statements, external benchmarks, code reality. -->
    60	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/SKILL.md | sed -n '55,115p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-driven-development/SKILL.md | sed -n '95,140p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    95	`file://skills/spec-driven-development/references/capture-after-and-fastpath.md`
    96	for the procedure, acceptance conditions, and reference
    97	precedents.
    98	
    99	## Spec Types
   100	
   101	Specs are typed. Pick the matching template from `templates/`
   102	(repo-relative under `your-policy-repo`; under `.templates/` in
   103	each child product repo):
   104	
   105	- `task` → `templates/SPEC.task.template.md` — concrete, scoped,
   106	  verifiable work. Default.
   107	- `contract` → `templates/SPEC.contract.template.md` — specifies
   108	  behavior that future agents implement against (state machines,
   109	  failure models, observability, reference algorithms). Bar c
   110	  ("the autonomous-dispatch runner-grade") with REQUIRED lint.
   111	- `decision` → `templates/SPEC.decision.template.md` — chooses
   112	  between named candidates with rationale, locks, and reversal plan.
   113	
   114	Cross-template conventions (front-matter fields, citation grammar,
   115	RFC 2119 rules, section-naming) live in the shared schema at
   116	`templates/SPEC.schema.md`. The IDEA artefact uses
   117	`templates/IDEA.template.md`.
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/fast-path/SKILL.md | sed -n '1,60p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
    16	`file://templates/SPEC.fastpath.template.md`.
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
    48	   `file://templates/SPEC.fastpath.template.md`. Status:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/agent-feedback/SKILL.md | sed -n '1,95p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: agent-feedback
     3	description: "Use when an agent hits friction, confusion, a bug, or a fleet-policy misalignment they cannot resolve from existing docs. Appends a structured entry to AGENT_FEEDBACK.md (per repo) for owner triage and conversion into fleet directives. Outbound-to-fleet channel; counterpart to agent-inbox (inbound handoffs) and fleet-enforce (compliance directives). Replaces the ad-hoc 'agent complains verbally' channel with a durable, auditable surface."
     4	---
     5	
     6	# Agent Feedback
     7	
     8	The recognised channel for agents to surface friction, confusion,
     9	bugs, misalignments, and proposals back to fleet policy without
    10	stalling, bypassing guardrails, or going silent.
    11	
    12	Authority: `judgment://agent-synthesis` (the
    13	framework-refresh-lightweight-ceremony Decision);
    14	`file://workpads/AGENT_FEEDBACK.template.md`.
    15	
    16	## When to use
    17	
    18	Invoke when ANY of:
    19	
    20	- The framework slowed you down disproportionately to safety value
    21	  (**friction**).
    22	- Docs / skills / workflows / hooks pointed in contradictory
    23	  directions (**confusion**).
    24	- A hook / lint / audit script gave a wrong answer (**bug**).
    25	- A fleet rule conflicts with another fleet rule, OR a child-repo
    26	  doc contradicts the canonical at the source policy repo's
    27	  `agents/` directory (**misalignment**).
    28	- You have a concrete idea worth considering for fleet rule change
    29	  (**proposal**).
    30	
    31	Do NOT use for:
    32	
    33	- Bug reports against product code (file in the product repo's
    34	  issue tracker).
    35	- Disagreements about owner-set decisions (raise directly with
    36	  owner; the owner's authority is not subject to agent feedback).
    37	- Routine completion reports (those belong in SPEC §17 Completion
    38	  Reports).
    39	
    40	## Procedure
    41	
    42	1. Locate `AGENT_FEEDBACK.md` at repo root. If absent, create it
    43	   from `file://workpads/AGENT_FEEDBACK.template.md`.
    44	2. Append a new entry at the top of the `## Entries` section using
    45	   the template's `## YYYY-MM-DD HH:MM` heading format.
    46	3. Fill every required section: Context, What happened, What I
    47	   expected, Why this matters. Suggested fix is optional.
    48	4. Status defaults to `surfaced (initial)`.
    49	5. Stage and commit the entry. Commit message:
    50	   `docs(feedback): <agent-id> reports <type>: <one-line summary>`.
    51	
    52	Do not block your current session waiting for triage. File the
    53	feedback, work around the friction if possible, and continue. If
    54	the friction is a hard blocker, also set the relevant SPEC or
    55	TASK.md status to `blocked` with a `file://` reference to the
    56	feedback entry.
    57	
    58	## Triage (fleet-side)
    59	
    60	The agent attached to `your-policy-repo` is responsible for
    61	periodic triage:
    62	
    63	- Scan all 9 fleet locations'  `AGENT_FEEDBACK.md` for entries with
    64	  status `surfaced`.
    65	- For each entry, classify and act:
    66	  - **misalignment** → issue a fleet directive via
    67	    `file://skills/fleet-enforce/SKILL.md`.
    68	  - **bug** → file a fast-path SPEC or full task SPEC depending
    69	    on scope.
    70	  - **friction** → batch with similar entries; owner-decided
    71	    whether to amend procedure.
    72	  - **proposal** → forward to owner; if owner approves, becomes a
    73	    Decision or Contract SPEC.
    74	  - **confusion** → fix the upstream doc directly via fast-path or
    75	    fleet-enforce directive.
    76	- Update each entry's Status section in place with a status-line
    77	  citing the your-policy-repo commit that resolves it.
    78	
    79	## Hard rules
    80	
    81	- Agents MUST NOT delete or edit prior `AGENT_FEEDBACK.md`
    82	  entries. Updates append below the original entry.
    83	- Owner alone closes entries as `won't-fix`.
    84	- Feedback citing facts (lint output, hook behaviour, file
    85	  contents) MUST use the citation grammar from
    86	  `file://spec-bundle/schema/SPEC.schema.md` §2.
    87	- Agents MUST NOT include secrets, credentials, or third-party
    88	  private content in feedback entries.
    89	- Agents MUST NOT use this channel to bypass owner authority on
    90	  approved/decomposed/closed status transitions.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "test -e templates/SPEC.schema.md; printf 'templates/SPEC.schema.md exit=%s\\n' "'$?; test -e skills/fast-path/SKILL.md; printf '"'skills/fast-path/SKILL.md exit=%s\\n' "'$?; test -e workpads/AGENT_FEEDBACK.template.md; printf '"'workpads/AGENT_FEEDBACK.template.md exit=%s\\n' "'$?; test -e spec-bundle/schema/SPEC.schema.md; printf '"'spec-bundle/schema/SPEC.schema.md exit=%s\\n' "'$?' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
templates/SPEC.schema.md exit=1
skills/fast-path/SKILL.md exit=1
workpads/AGENT_FEEDBACK.template.md exit=1
spec-bundle/schema/SPEC.schema.md exit=0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find . -maxdepth 2 -type d | sed 's#"'^./##'"' | sort | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
.
.git
.git/hooks
.git/info
.git/logs
.git/objects
.git/refs
.github
.github/workflows
examples
examples/contract-webhook-signing
examples/decision-conventional-commits
examples/fastpath-fix-readme-typo
examples/task-add-structured-logging
hooks
scripts
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
specs
specs/2026-05-18-v1.0-release-foundations
specs/2026-05-19-v2-manifest-catalog-repack
tests
tests/hooks

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-review/SKILL.md | sed -n '250,275p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
   262	- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
   263	  (handoff), §1.3 (state machine), §2 (citation grammar), §3
   264	  (RFC 2119).
   265	- Companion workflow: `<adopter-policy-repo>/agents/workflows/review-spec.md` (fleet-baseline reference; bes-fleet-policy-layout-specific).
   266	- Lint script: `file://scripts/lint-spec.sh` (if absent at
   267	  the time of invocation, a Contract SPEC review MUST report
   268	  `criterion: lint-unavailable`, `severity: blocking`).
   269	- Authoring side: `file://skills/spec-authoring/SKILL.md`.
   270	- Lifecycle skill:
   271	  `file://spec-bundle/skills/spec-driven-development/SKILL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/IDEA.template.md | sed -n '10,20p'; nl -ba spec-bundle/templates/SPEC.task.template.md | sed -n '15,20p'; nl -ba spec-bundle/templates/SPEC.decision.template.md | sed -n '15,25p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    10	
    11	<!--
    12	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.1.
    13	Refer to `templates/SPEC.schema.md` for shared conventions
    14	(front-matter, citation grammar, RFC 2119 rules, section naming).
    15	
    16	Citation discipline: every factual claim in this artefact MUST carry a
    17	citation prefix from SPEC.schema.md §2.1 (`file://`, `cmd://`, `url://`,
    18	`owner://`, `judgment://owner`, `judgment://agent-synthesis`). Memory
    19	and training are NOT citable evidence. Any `judgment://agent-synthesis`
    20	claim MUST be paired with owner-affirmation captured via `owner://`.
    15	<!--
    16	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.2.
    17	Refer to `templates/SPEC.schema.md` for shared conventions
    18	(front-matter ordering, citation grammar, RFC 2119 rules, section
    19	naming). The shared section titles `## Authority Map`,
    20	`## Code/Docs Reality Check`, `## Open Questions`,
    15	<!--
    16	Template per `specs/2026-01-15-example-procedure-v1/SPEC.md` §9.4.
    17	Refer to `templates/SPEC.schema.md` for shared conventions
    18	(front-matter ordering, citation grammar, RFC 2119 rules, section
    19	naming). The shared section titles `## Authority Map`,
    20	`## Open Questions`, `## Acceptance Criteria`, `## Completion Report`
    21	MUST appear with byte-identical text-after-number across the three
    22	SPEC templates. (`## Code/Docs Reality Check` and `## Rollback Plan`
    23	are OPTIONAL in Decision specs per SPEC.schema.md §4.1.)
    24	
    25	Quality gate: bar (b) + candidate-comparison structure — see

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate --no-renames 380db29' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
380db29 (HEAD -> main, origin/main) fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
 scripts/validate-manifest.sh                       | 72 ++++++++++++++++++----
 spec-bundle/manifest.yaml                          | 24 +++++++-
 spec-bundle/skills/agent-feedback/SKILL.md         |  2 +-
 .../skills/approved-spec-decomposition/SKILL.md    | 10 +--
 .../references/cross-validation-lanes.md           | 10 +--
 spec-bundle/skills/spec-authoring/SKILL.md         |  8 +--
 .../references/reference-architecture.md           |  2 +-
 .../references/capture-after-and-fastpath.md       | 12 ++--
 .../references/cascade-by-id-citation.md           |  2 +-
 spec-bundle/skills/spec-review/SKILL.md            |  8 +--
 spec-bundle/templates/SPEC.contract.template.md    |  4 +-
 spec-bundle/templates/SPEC.fastpath.template.md    |  4 +-
 spec-bundle/templates/TASK.template.md             |  6 +-
 .../templates/workpads/AGENT_INBOX.template.md     |  8 +--
 .../templates/workpads/SESSION_JOURNAL.template.md |  4 +-
 15 files changed, 122 insertions(+), 54 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git show --name-only --format='%H%n%s' 380db29" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
380db2966cc9bbb25c221e95bb2ba36e7816072b
fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)

scripts/validate-manifest.sh
spec-bundle/manifest.yaml
spec-bundle/skills/agent-feedback/SKILL.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md
spec-bundle/skills/spec-authoring/SKILL.md
spec-bundle/skills/spec-authoring/references/reference-architecture.md
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md
spec-bundle/skills/spec-driven-development/references/cascade-by-id-citation.md
spec-bundle/skills/spec-review/SKILL.md
spec-bundle/templates/SPEC.contract.template.md
spec-bundle/templates/SPEC.fastpath.template.md
spec-bundle/templates/TASK.template.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check 380db29''^ 380db29' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for p in architecture/CONTEXT.md deployment/install.md behavior/features/ behavior/features/lint-citation-grammar.feature customization/contract.md decisions/INDEX.md quality/requirements.md operations/failures.md non-goals/INDEX.md; do if [ -e "spec-bundle/$p" ]; then printf '"'OK %s\\n' \""'$p"; else printf '"'MISSING %s\\n' \""'$p"; fi; done' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
OK architecture/CONTEXT.md
OK deployment/install.md
OK behavior/features/
OK behavior/features/lint-citation-grammar.feature
OK customization/contract.md
OK decisions/INDEX.md
OK quality/requirements.md
OK operations/failures.md
OK non-goals/INDEX.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find spec-bundle/behavior/features -maxdepth 1 -type f -printf '%f\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
hook-blocks-ai-attribution.feature
lint-citation-grammar.feature

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "schema_uri|source_commit|source_tag|bundle_version|generated_on|generator|provenance|sbom_ref|slsa_level|primary_index|media_type|status|digest|size|intent|developer_authority|installer_authority" scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
16:# 6. intent.product_name matches the repo identifier.
64:# 6. product_name match (search for product_name under intent).
67:    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
140:# Parse primary + primary_index + media_type per facet per the v2.1
142:# accepted directory primaries silently without verifying primary_index
147:declare -A facet_primary_index
148:declare -A facet_media_type
156:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
159:        facet_primary_index["$current_facet"]="$pi"
160:    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
163:        facet_media_type["$current_facet"]="$mt"
170:media_type_extension() {
182:        # Directory primary — v2.1 requires primary_index.
187:        pi="${facet_primary_index[$facet]:-}"
189:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
193:            err "facet '$facet' primary_index file missing: $pi"
196:        mt="${facet_media_type[$facet]:-}"
197:        ext="$(media_type_extension "$mt")"
201:                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "bash -n scripts/validate-manifest.sh && printf 'bash -n PASS\\n'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
bash -n PASS

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git tag --points-at HEAD && git describe --tags --exact-match HEAD 2>/dev/null || true' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git show v2.0.0:spec-bundle/manifest.yaml 2>/dev/null | sed -n '1,40p' || true" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git rev-list -n 1 v2.0.0 2>/dev/null || true' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
5f59f7b9d0b33c82c46a727574a81c645a33e823

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git tag --list 'v2*' --sort=creatordate" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
v2.0.0

codex
**Findings**
| Severity | Finding |
|---|---|
| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
| HIGH | 3.3 remains open: templates/skills still contain non-existent v1.x paths that are not adopter-qualified. Examples: [IDEA.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/IDEA.template.md:13), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67), [fast-path/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/fast-path/SKILL.md:16). |
| MEDIUM | New carry-through issue: §6.1 still shows a v2.0.0 manifest example and omits the v2.1 provenance fields, while §8 says the formal schema is v2.1.0. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:260) and [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:548). |
| MEDIUM | New validator gap: required v2.1 top-level fields like `schema_uri` and `source_commit` are present in the manifest, but `validate-manifest.sh` still does not validate their presence. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:564) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:51). |

**Round-3 Verdicts**
| Check | Verdict |
|---|---|
| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
| HIGH provenance | RESOLVED for honesty. `source_commit` and `source_tag` are empty, documented as between-tag state, and `HEAD` is not tagged. `schema_uri` is explicitly documented as mutable `main` until release tooling pins it. |
| HIGH 3.3 path migration | OPEN. Several shipped template/skill references still point at old `templates/`, `skills/`, or `workpads/` paths. |

Verification run: the three SPEC front-matter commands all pass locally, plus `bash -n scripts/validate-manifest.sh` and `git diff --check 380db29^ 380db29`.

**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
tokens used
109,915
**Findings**
| Severity | Finding |
|---|---|
| BLOCKER | `validate-manifest.sh` only checks that `primary_index` exists as some file; it does not enforce that it is inside the directory named by `primary`, as §8.3 requires. It also iterates only facets that have a parsed `primary`, so a facet missing `primary` can escape this branch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:592) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:179). |
| HIGH | 3.3 remains open: templates/skills still contain non-existent v1.x paths that are not adopter-qualified. Examples: [IDEA.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/IDEA.template.md:13), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [spec-authoring/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/spec-authoring/SKILL.md:67), [fast-path/SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/fast-path/SKILL.md:16). |
| MEDIUM | New carry-through issue: §6.1 still shows a v2.0.0 manifest example and omits the v2.1 provenance fields, while §8 says the formal schema is v2.1.0. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:260) and [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:548). |
| MEDIUM | New validator gap: required v2.1 top-level fields like `schema_uri` and `source_commit` are present in the manifest, but `validate-manifest.sh` still does not validate their presence. See [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:564) and [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:51). |

**Round-3 Verdicts**
| Check | Verdict |
|---|---|
| BLOCKER 3.6 | PARTIAL / still failing. The validator now parses `primary_index` and checks directory-primary media extension presence, but does not fully enforce the §8.3 “inside the directory” rule. |
| HIGH provenance | RESOLVED for honesty. `source_commit` and `source_tag` are empty, documented as between-tag state, and `HEAD` is not tagged. `schema_uri` is explicitly documented as mutable `main` until release tooling pins it. |
| HIGH 3.3 path migration | OPEN. Several shipped template/skill references still point at old `templates/`, `skills/`, or `workpads/` paths. |

Verification run: the three SPEC front-matter commands all pass locally, plus `bash -n scripts/validate-manifest.sh` and `git diff --check 380db29^ 380db29`.

**Quality Gate Result: FAIL** due to the remaining BLOCKER 3.6 enforcement gap and open HIGH 3.3 path migration issue.
