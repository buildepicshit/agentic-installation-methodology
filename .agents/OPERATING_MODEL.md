# BES Agent Fleet Operating Model

Status: canonical machine-local policy, 2026-04-29.

This file is the shared operating contract for agents working under
`/var/home/hasnobeef/buildepicshit`. It exists to move the fleet away from
ad-hoc memory-driven work and toward spec-first execution.

## Active Repos

The active product repos are classified by surface posture. The posture
determines how the fleet engagement model is delivered and where agents
MAY operate.

| Repo | Posture | Fleet content delivery | Agent dispatch from root |
|---|---|---|---|
| `ACTOCCATUD` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `Floom` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `IKTO` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `UsefulIdiots` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `bes-fleet-runtime` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `agentic-installation-methodology` | INTERNAL | `.agents/` committed; full fleet baseline (private; owner-directed 2026-06-30) | Permitted |

`Assets` and `BESAdmin` are local-only business workspaces: they receive
NO fleet baseline and are intentionally absent from this table (see
`file://agents/WORKSPACE_LAYOUT.md` and `fleet-local-only-repos.txt`).
`BESAdmin` was reclassified INTERNAL → local-only 2026-06-30
(`owner://transcript-2026-06-30`) to honour its own `AGENTS.md` charter.
| `Mimir` | PUBLIC OSS | `.agents/` gitignored; lays in working tree only | **Forbidden** — enter the repo directly |
| `Wick` | PUBLIC OSS | `.agents/` gitignored; lays in working tree only | **Forbidden** — enter the repo directly |

Agent instructions, skills, workflows, and project memory artifacts belong in
those repos or in this top-level `.agents/` control plane. Legacy agent state
outside this boundary is disposable unless it is required by a live tool home
such as `~/.copilot` or `~/.claude`.

### Public OSS posture (Wick, Mimir)

Public OSS repos host real product code that third-party developers and
contributors clone, fork, and build on. The fleet engagement model is
internal sausage-making: routing policy, evaluation methodology, model
quotas, internal project slugs, dispatch infrastructure. None of that
belongs on a public surface — not as documentation, not as policy, not
as transparency theatre. OSS contributors want a clean repo of the
actual product, not someone else's dogfood.

Therefore, for repos posture-classified as PUBLIC OSS:

- `.agents/`, `.claude/`, and the root-level fleet workpads
  (`SESSION_JOURNAL.md`)
  MUST be in the repo's `.gitignore`. The fleet propagation
  mechanism lays the engagement model + workpads into the working
  tree (so any AI assistant landing in the repo locally has full v1
  procedure available); the content MUST NOT be committed or
  pushed. `fleet-sync.sh` auto-adds these patterns on every OSS-
  posture run, and `audit-entry-docs.sh` flags any tracked instance
  as BLOCKING.
- **Fleet propagation T21/T22 conformance for OSS repos is "files
  present in working tree", not "commit on a branch".** This is
  policy, not a conformance gap. The strict letter of T21 ("commit
  referencing source SHA") does NOT apply to OSS repos.
- **Agents MUST NOT be dispatched against PUBLIC OSS repos from the
  root workspace.** A primary or subagent operating in
  `/var/home/hasnobeef/buildepicshit` MUST NOT target Wick or Mimir
  via `cd`, `git -C`, file paths, or Agent tool dispatch. Work on
  Wick/Mimir is done by entering the repo directly (own session,
  own working directory) — this prevents internal context, fleet
  artefacts, or root-level memory from leaking into work that
  produces public-facing commits.
- New skills, workflows, or policy docs that name internal infra
  (model routing, evaluation protocols, internal slugs)
  MUST be authored on the assumption that they may end up in the
  PUBLIC OSS working tree but never on the public surface. Do not
  obfuscate names; do not publish.

The two-tier classification is deliberate. Reclassifying a repo
(internal → OSS or OSS → internal) is a Decision-class spec under
the v1 procedure: the change is binding, irreversible without
rework, and forecloses alternatives. Do not reclassify ad-hoc.

## Fleet Rule Origination

Fleet-wide rules — anything in `.agents/` (OPERATING_MODEL,
DOCUMENTATION_GUIDE, MODEL_ROUTING, GREEN_ROOM_EVALUATION,
WORKSPACE_LAYOUT, BOARD_SEED, SKILL_REGISTRY, every skill,
every workflow, every script, every template, every schema,
every hook) — MUST be authored in `bes-fleet-policy` first and
propagated to child repos via `agents/scripts/fleet-sync.sh`.

This is policy, not convention.

Concretely:

- A change to `.agents/skills/spec-review/SKILL.md` in IKTO is
  not a fleet change; it is repo-local drift and MUST be
  rejected at review. The correct workflow is: amend
  `agents/skills/spec-review/SKILL.md` in `bes-fleet-policy`
  via the v1 SPEC procedure, then run `fleet-sync.sh` to land
  it in every child repo.
- Same for hooks, templates, schema, lint, OPERATING_MODEL,
  and every other fleet artefact.
- Repo-specific extensions (a Floom-only `creative-direction`
  command, an ACTOCCATUD-only Godot agent definition) MUST live
  in the child repo's `.claude/` only, never in `.agents/`, and
  MUST NOT shadow the names of fleet skills, workflows, hooks,
  or commands. If a fleet artefact needs a per-repo variant,
  that's a Decision-class spec authored here.
- Subagents executing a SPEC in a child repo MUST NOT modify
  `.agents/` content. The fleet artefacts are read-only from
  the child-repo perspective.

Why: uniformity is the point. If every repo could amend its own
copy of the engagement model, the fleet would drift back to the
ad-hoc memory-driven state the v1 procedure exists to prevent.

The mechanical enforcement: `fleet-sync.sh` overwrites all fleet
artefacts on each propagation. Any divergence in a child repo's
`.agents/` is silently overwritten on the next sync. This is
intentional — the only durable copy of fleet content lives in
`bes-fleet-policy`.

The procedural enforcement: the v1 SPEC lifecycle. New rules are
authored as IDEA → SPEC in `bes-fleet-policy/specs/`; review is
blocking; owner approves; propagation lands the artefact + the
provenance commit.

## Source Of Truth

1. Project facts and durable rules live in repo docs and `AGENTS.md`.
2. `AGENTS.md` is the canonical, agent-agnostic entry doc — read by Copilot, Cursor, Aider, Jules, and other AGENTS-aware tools. Optional agent-specific files (`CLAUDE.md`, `GEMINI.md`, etc.) MAY exist alongside `AGENTS.md` to add tool-specific context; Claude Code reads `CLAUDE.md`, Gemini CLI reads `GEMINI.md`, and so on. The agent-specific files SHOULD import `AGENTS.md` (e.g. `@AGENTS.md`) and MUST NOT carry policy that the agent-agnostic file lacks.
3. The per-repo engagement contract (plus any OPTIONAL dispatch
   policy, if one is ever wired up) lives in `WORKFLOW.md`.
4. Shared fleet workflows live in `.agents/workflows/`.
5. Reusable agent methods live in `.agents/skills/`.
6. Documentation placement rules live in `.agents/DOCUMENTATION_GUIDE.md`.
7. Root workspace placement rules live in `.agents/WORKSPACE_LAYOUT.md`.
8. Agent and model routing policy lives in `agents/MODEL_ROUTING.md` in
   this policy repo and `.agents/MODEL_ROUTING.md` in propagated repos.
9. Green room product evaluation policy lives in
   `.agents/GREEN_ROOM_EVALUATION.md`.
10. MCP policy lives in `.agents/mcp/README.md` and
   `.agents/mcp/approved-defaults.json`: USE of already-connected
   sources is the default; PROVISIONING a new server stays governed.
11. The shared skill map lives in `.agents/SKILL_REGISTRY.md`.
12. Spec evidence records are governed drafts, not direct instructions.
13. Chat history and tool memories are temporary recall aids.

When sources conflict, use this order:

1. Explicit owner instruction in the current session.
2. Active approved `SPEC.md` for the task.
3. Repo `AGENTS.md` (canonical) and any agent-specific extensions (`CLAUDE.md`, `GEMINI.md`).
4. Project docs referenced by `AGENTS.md`.
5. Governed spec evidence records.
6. Raw tool memories or old chat summaries.

## Required Work Model

Non-trivial work starts with a spec. A task is non-trivial if it changes
architecture, behavior, public docs, workflows, guardrails, data models,
memory policy, CI, or multiple files.

Required lifecycle:

1. **Preflight**: from the root, run `node .agents/scripts/preflight.mjs`
   before planning, dispatch, or spec execution.
2. **Orient**: read `AGENTS.md` (canonical), the agent-specific extension if applicable (`CLAUDE.md` for Claude, `GEMINI.md` for Gemini, etc.), `STATUS.md` if it
   exists, and the relevant docs.
3. **Predict known failures**: before dispatch or implementation, list likely
   blockers from current evidence: missing local packages, disabled CI, stale
   authority docs, owner decisions, public-OSS release gates, model quota, and
   long-running CLI behavior. Put those predictions in the prompt or SPEC so
   workers can classify failures as expected, new, or owner-blocking.
4. **Ideate**: for non-trivial work, conduct an IDEA conversation between the
   owner and the primary agent. The conversation MUST resolve the implied spec
   type (task / contract / decision), constraints, 2-3 considered approaches,
   a recommendation, and any owner-blocking questions. Capture the
   conversation as `IDEA.md` at `.agents/specs/<id>/IDEA.md` via
   `/idea-capture`. The IDEA artefact is itself contract-grade and bindable;
   agent memory and training are legitimate inputs to the conversation but
   MUST NOT appear as evidence in the artefact. See the Step 4 Ideate
   sub-section below.
5. **Author spec**: create or update a typed `SPEC.md` (task / contract /
   decision) using the matching template under
   `.agents/specs/SPEC.<type>.template.md`. The chosen type MUST match the
   `implies_spec_type` from the IDEA artefact.
6. **Review spec**: check ambiguity, risks, non-goals, acceptance commands,
   rollback, and open questions. Run the per-type quality gate via the
   `spec-review` skill; the gate is blocking.
7. **Approve**: do not implement until the owner or controlling workflow marks
   the spec approved.
8. **Execute**: implement only the approved spec. Do not expand scope silently.
9. **Verify**: run the spec acceptance commands and the repo's normal gate.
10. **Report**: write a completion report with changed files, verification
   output, residual risk, and spec evidence candidates.
11. **Govern evidence**: capture durable lessons as spec evidence candidates.
   Do not write cross-project instructions directly from an agent session.

### Step 4 Ideate

For non-trivial work, an IDEA conversation between the owner and the primary
agent precedes spec authoring. The conversation MUST resolve the implied spec
type (task / contract / decision), constraints, 2-3 considered approaches, a
recommendation, and any owner-blocking questions. Capture it as `IDEA.md` at
`.agents/specs/<id>/IDEA.md` via `/idea-capture`. The IDEA artefact is
contract-grade and bindable: agent memory and training are legitimate
conversational inputs but MUST NOT appear as evidence in the artefact (see
the input-vs-artefact distinction in the Memory Policy section below).

After immediate repo handoffs, use `.agents/GREEN_ROOM_EVALUATION.md` for
product roadmap recovery work. Each active repo gets one isolated primary
evaluation and one independent second-model verification before roadmap items
are converted into executable specs.

## Capability Boundary

BES is a fleet operating framework, not an orchestration product.

BES defines:

- source-of-truth policy;
- repo entry contracts;
- SPEC / TASK artefacts;
- approval and verification gates;
- model-routing conventions;
- fleet propagation manifests;
- local hooks and audit scripts.

BES does not implement:

- scheduling;
- persistent state management;
- sandboxing;
- permissioning;
- model serving or model selection as a service;
- observability pipelines;
- issue-tracker or CI product behavior.

Those responsibilities belong to the runner, OS sandbox, GitHub,
CI, Copilot / Claude, worktree tooling, or future approved systems. BES may define how agents interact with those tools,
but it MUST NOT claim to provide those capabilities itself.

## Exhaustive Spec Rule

Agents do not deliver opinions as implementation authority. An executable
`SPEC.md` must be complete enough that a worker can implement and a verifier can
judge the result without inventing product, design, quality, release, or
acceptance criteria.

If a spec depends on subjective judgments such as "good enough", "fun",
"polished", "public-ready", "acceptable performance", or "quality bar", the
spec must define objective evidence, review checkpoints, owner decisions, or a
separate planning/design spec that resolves those judgments before
implementation.

If an implementation or verification agent finds missing, ambiguous, or
untestable acceptance criteria, it must stop and surface the gap as
`owner-blocking`. It may propose options, but those options are not authority
until recorded in an approved executable spec.

Specs are typed. The `type:` front-matter field declares one of:

- `task` — concrete, scoped, verifiable work. Default.
- `contract` — specifies behavior future agents implement against.
- `decision` — chooses between named options with rationale.

Each type has a dedicated template at `.agents/specs/SPEC.<type>.template.md`.
Shared front-matter and citation grammar live in
`.agents/specs/SPEC.schema.md`.

Quality gates are blocking and per-type:

- Task: bar (b) "verifiable".
- Contract: bar (c) "Contract-grade", with REQUIRED lint pass.
- Decision: bar (b) plus candidate-comparison structure.

The `spec-review` skill enforces these as a blocking gate. A spec MUST NOT
advance to `approved` while any blocking criterion fails. RFC 2119 normative
language applies in IDEA.md, Task SPEC, Contract SPEC, and Decision SPEC's
Decision Statement section.

## Content And Creative Authority

Engineering and plumbing work may proceed from objective technical contracts.
Content, creative, product-positioning, asset, narrative, tuning, gameplay-feel,
demo-quality, and visual/audio decisions require stricter authority.

Before a write-capable agent creates or changes content/creative output, the
approved spec must name the repo-local source of truth, allowed creative
latitude, provenance/licensing requirements, exact output paths, review
checkpoint, and verification criteria. If the spec does not answer where the
content comes from or how quality is judged, the agent must stop as
`owner-blocking` instead of generating plausible content.

Agents may draft options, inventories, or questions for creative work, but those
drafts are planning evidence only until the owner records the selected direction
in the repo's approved spec or durable product docs.

## Documentation Placement

All agents must follow `.agents/DOCUMENTATION_GUIDE.md`.

- `.agents/specs/` is the default location for orchestration specs, audit
  proposals, migration proposals, and task contracts.
- Durable product architecture belongs in the repo's native docs path, such as
  `docs/superpowers/specs/` for Floom, `docs/specs/` for UsefulIdiots,
  `docs/systems/` or `docs/plans/` for ACTOCCATUD, and `docs/superpowers/specs/`
  for IKTO.
- Wick and Mimir are public OSS surfaces. Keep internal agent-control language
  in `.agents/` unless the owner approves public wording and CI impact.
- If a task starts as an audit, do not move raw audit prose into public docs.
  Rewrite it for the intended audience after approval.

## WORKFLOW.md Contract

The root and each active repo own a `WORKFLOW.md` engagement contract.
Its Section 1 (universal) applies to every agent regardless of dispatch
surface. The file should be self-contained enough that an agent — or, if
one is ever wired up, an OPTIONAL scheduler — can load workspace policy,
hook policy, runner settings, and the prompt body without relying on
chat history. No external tracker or dispatcher is required or run by
default; the fleet has never used one.

Required local posture:

- Workers run in isolated workspaces, branches, or worktrees.
- No tracker secret is required. (A credential would matter only if an
  external tracker were ever wired up — none is by default.)
- Root `hooks.before_run` runs `node .agents/scripts/preflight.mjs`.
- Copilot runner command configuration belongs to the runner.
- Concurrency is bounded per repo and should reflect CI cost.
- Completion reports include verification evidence and residual risk.
- A successful run may stop at a handoff/review state; it does not have to
  force an issue to `Done`.

## Lightweight Ceremony Modes

The v1 13-phase lifecycle is the default for non-trivial work. Two
recognised lightweight modes coexist:

**Fastpath SPEC type** (`agents/specs/SPEC.fastpath.template.md`)
applies when ALL of: ≤ 1 file changed, ≤ 50 lines, single
component, no public-contract / persisted-state impact,
reversible in one commit, explicit owner directive. Skips IDEA,
review, decomposition, cross-validation; lands at `status: closed`
in same commit as work. See
`file://agents/specs/SPEC.fastpath.template.md` for the retained
template and thresholds.
If ANY threshold fails, escalate to task/contract/decision.

**Capture-after** on task/contract/decision SPECs is permitted
under explicit owner directive when (a) the artefacts pass lint
and gate, (b) the SPEC is filed before the next change to the
affected surface, and (c) the SPEC lands at `status: verified`
with Completion Report. Reference:
`file://agents/skills/spec-driven-development/SKILL.md`
"Exception: capture-after".

These modes exist because the 13-phase ceremony is heavier than
necessary for tiny but non-trivial work. They are NOT escape
hatches for laziness — thresholds are objective and lint-enforced.

## Session Continuity (universal workpad)

Every fleet repo has a `SESSION_JOURNAL.md` at its root. It is the
universal workpad: every agent reads the last 3 entries on session
start and appends a new entry on session end.

Template: `file://agents/templates/SESSION_JOURNAL.template.md`.
Authority: `file://agents/templates/WORKFLOW.body.md` Section 1
Step 5; `file://agents/skills/repo-orientation/SKILL.md` Step 3.

The journal closes a continuity gap: every session — interactive or
dispatched — needs a durable handoff record across sessions. The
journal carries dirty-tree state, in-flight decisions, and next-agent
directives across sessions.

Append-only. Owner alone archives entries older than 90 days to
`SESSION_JOURNAL.archive.md`.

## Cross-Repo Enforcement (fleet-directives)

When a fleet rule changes in `bes-fleet-policy` and the change
requires action across child repos beyond what `fleet-sync.sh`
handles automatically, the bes-fleet-policy agent issues a
structured **fleet directive** at
`agents/fleet-directives/<YYYY-MM-DD>-<slug>.md`.

Directives carry: target repos, authority chain (owner directive,
SPEC, or legacy AGENT_FEEDBACK entry), action steps (idempotent,
bounded), compliance check, rollback plan. The
`fleet-enforce.sh` script applies directives across target repos;
`audit-fleet-compliance.sh` verifies compliance and surfaces
drift.

Only `bes-fleet-policy` issues directives. Owner alone authorises
new directives. The enforcer respects all hooks
(block-git-add-all, block-edit-on-main, block-push-to-main,
block-verify-bypass, block-ai-attribution) and per-repo commit-msg
gates (Conventional Commits, INSTRUCTION_APPROVED env handling).

Skill: `file://agents/skills/fleet-enforce/SKILL.md`.
Workflow: `file://agents/workflows/fleet-enforce.md`.
Directive format: `file://agents/fleet-directives/README.md`.

## Agent Roles

- **Planner**: writes specs from project facts and owner intent.
- **Spec reviewer**: rejects ambiguity, unsafe assumptions, and missing tests.
- **Executor**: edits code/docs only inside the approved scope.
- **Verifier**: runs acceptance commands and inspects diffs.
- **Archivist**: promotes durable lessons into specs, backlog proposals, or
  delivery evidence records.

## Model Routing

Use `agents/MODEL_ROUTING.md` in this policy repo, or propagated
`.agents/MODEL_ROUTING.md` in child repos, before spawning Claude, Copilot
subagents, model-specific repo workers, or multi-agent reviews.

- Copilot is the default root fleet manager and primary implementation agent.
- Claude is dispatched deliberately for independent review, ambiguity checks,
  long-form synthesis, or bounded repo work after an approved spec.
- GPT-5.5 is the strongest general-purpose OpenAI/Copilot lane currently routed
  for BES and the default root/final-call model when available.
- Claude Opus 4.8 (`claude-opus-4-8`) is the frontier Claude lane as of
  2026-05-28, accepted on Anthropic's published evals. Opus 4.7 and 4.6 are
  legacy-but-available at the same price, used only as deliberate legacy/pinned
  references. See `agents/MODEL_ROUTING.md` for the recency-rule rationale.
- Claude Sonnet/adaptive is useful for creative/product/design synthesis,
  lower-risk first-pass Claude work, and supporting implementation work, with
  frontier-model validation for technical decisions.
- Smaller/faster models are for bounded read-only fanout and must return
  distilled facts to the root agent.
- Account-level model entitlement must be verified before pinning a model in
  automation.
- Multiple write-capable agents in one repo require explicit root
  fleet-manager control over branches/worktrees, file ownership, integration
  order, and verification.

## Parallel Execution Policy

Before substantial research, code review, verification, or implementation,
agents MUST evaluate whether independent parts of the task can run in
parallel.

Agents SHOULD parallelize work when it is safe and useful:

- Subtasks are independent or file ownership is disjoint.
- Expected wall-clock savings exceed coordination cost.
- Write scope is `none` or `disjoint`.
- Each worker has a bounded role, allowed files or read-only scope, and
  verification expectations.
- One primary agent remains accountable for integration, final verification
  interpretation, and reporting.

Preferred fanout cases are research, code review, documentation inventory,
static analysis, independent verification, and bounded read-only scans that
are easy for the primary agent to integrate.

Implementation work MAY fan out only when write ownership is disjoint or
isolated by branch/worktree. Multiple write-capable agents MUST NOT edit the
same files concurrently, and one primary agent MUST own integration order and
the final verification account.

Agents MAY initiate subagents when they judge delegation is the correct
decision for the approved scope. When the parallelism decision is unclear,
frontier-model spend is material, or write-scope ownership is ambiguous,
agents MAY check with the owner before dispatch.

Owner-interactive planning remains serial. Do not run multiple unresolved
owner-conversation tracks in parallel. Trivial local commands, tightly
coupled single-file edits, urgent blocking steps, and owner-interactive
ideation SHOULD remain local unless the owner explicitly requests fanout.

## Green Room Product Evaluation

Use `.agents/GREEN_ROOM_EVALUATION.md` after clean handoffs to evaluate each
product's engineering quality, code quality, current status, roadmap, and next
build sequence.

- Evaluations are local, isolated, and source-cited.
- The primary evaluator and verifier must use different model families when
  capacity allows.
- Evaluation packets live under
  `<repo>/.agents/specs/YYYY-MM-DD-green-room-product-evaluation/`.
- Evaluation does not permit implementation, public docs publication, PRs,
  tags, or releases.
- A roadmap is not actionable until the second-model verifier marks it
  `verified` or `verified-with-changes`.
- Verifier output is not owner approval. Owner decisions still have to be
  recorded in an executable SPEC before implementation starts.

## Shared Skills

Use `.agents/SKILL_REGISTRY.md` to choose the correct procedure. The standard
fleet skills are:

- `repo-orientation`
- `spec-authoring` — owns templates, schema, type selection, and structured
  IDEA capture; invoked by `/idea-capture` and `/author-spec`.
- `spec-driven-development`
- `spec-review`
- `implementation-execution`
- `verification`
- `code-review`
- `spec-evidence-governance`
- `approved-spec-decomposition`
- `diagnosis`
- `tdd`
- `fleet-enforce` (policy repo enforcement directives)

One agent may perform multiple roles only when the handoff is explicit in the
spec or current session.

## Memory Policy

The fleet is spec-first. Memory is supporting evidence.

- Do not treat raw Claude/Copilot/Cursor/Gemini memories as authoritative.
- Do not promote agent-authored imperatives into durable rules without review.
- Do not keep duplicate memory stores in inactive repos.
- Durable facts must cite their source: file path, spec, command output, issue,
  PR, or owner statement.
- Mimir integration is paused for this operating layer. Until a new spec
  authority design is approved, keep durable project instructions in repo docs,
  `WORKFLOW.md`, and executable `SPEC.md` files.

The boundary between agent memory and durable evidence applies to artefacts,
not conversations.

- Agent memory, training, and synthesized recall are LEGITIMATE INPUTS to
  ideation conversations and to authoring/review reasoning. Long ideation
  sessions (hours, thousands of lines) require active agent participation
  using full context.
- In artefacts (IDEA.md, SPEC.md, completion reports, spec evidence
  candidates), every factual claim MUST carry a citation prefix from the
  allowed grammar (`file://`, `cmd://`, `url://`, `owner://`,
  `judgment://owner`, `judgment://agent-synthesis` paired with owner-
  affirmation). Memory and training are NOT citable evidence.

This is the input-vs-artefact distinction: the conversation is where agent
capabilities are used fully; the artefact is the contract-grade capture
obeying citation discipline.

## Workspace Policy

- Use a separate branch or worktree for parallel agent work.
- Never run multiple write-capable agents against the same files without a
  worktree boundary.
- The worktree boundary also binds SINGLE-agent file-mutating probes
  (mutation/ablation testing): mechanical isolation, never prompt prose —
  see `agents/skills/code-review/references/multi-agent-review.md`.
- Stage files explicitly. Do not use `git add .` unless the repo explicitly
  allows it for a generated batch and the owner approves.
- Keep generated scratch, old memories, and tool caches out of repos.
- `.mcp.json` is machine-local and ignored. The default fleet has no active MCP
  servers; default MCPs require an approved spec and an entry in
  `.agents/mcp/approved-defaults.json`. This zero-active-by-default posture
  governs PROVISIONING (enabling a new server, installing a new tool) — ask
  plus approve. It does NOT gate USE: an already-connected or available
  high-quality source (web search/fetch, GitHub, Google, Slack, live MCP
  connectors) is the default for any load-bearing external gap, within the
  lethal-trifecta security bound (no secrets / private data to untrusted
  sinks). See `.agents/mcp/README.md`.
- Assets, downloads, local software, sandboxes, and idea intake follow
  `.agents/WORKSPACE_LAYOUT.md`; do not move or delete them without a migration
  spec.
- Public OSS repos require extra release hygiene. Do not push agent-workflow
  doc-only churn to Wick or Mimir unless the owner has approved an intentional
  low-noise PR plan and the expected CI cost.

## Safety Invariants

- Do not bypass repo hooks or verification gates without explicit owner
  approval.
- Do not delete user work, branches, or untracked project files without first
  proving they are stale agent artifacts.
- Do not commit AI attribution in commits, PRs, docs, or generated output.
- Do not use raw memories to override checked-in instructions.
- Do not let local MCP config drift into tracked source control.
- Do not claim completion without fresh verification output.
- Do not commit or regenerate goldens from a tree that has not passed the
  probe-residue hygiene gate after file-mutating probes ran
  (`agents/skills/code-review/references/multi-agent-review.md`); orphan
  probe worktrees are agent artifacts and their cleanup is sanctioned.

## Completion Report Format

Every completed spec-based task reports:

- Spec path and status.
- Files changed.
- Commands run and result.
- Anything intentionally left untouched.
- Residual risks.
- Spec evidence candidates, if any.
