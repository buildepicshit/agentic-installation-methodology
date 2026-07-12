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
| `agentic-installation-methodology` | INTERNAL | `.agents/` committed; full fleet baseline (private) | Permitted |

| `Mimir` | PUBLIC OSS | `.agents/` gitignored; lays in working tree only | **Forbidden** — enter the repo directly |
| `Wick` | PUBLIC OSS | `.agents/` gitignored; lays in working tree only | **Forbidden** — enter the repo directly |

`Assets` and `BESAdmin` are local-only business workspaces. They receive
the fleet baseline as a **gitignored, working-tree-only** lay-in via
`fleet-sync.sh`'s `local` posture (same git posture as OSS — laid into
the working tree, never staged, never committed), and are intentionally
absent from the posture table above (see
`file://agents/WORKSPACE_LAYOUT.md`, `fleet-local-only-repos.txt`, and
the `local` posture in `file://agents/scripts/fleet-sync.sh`;
reclassification: `owner://transcript-2026-06-30`). "Local-only" means
no COMMITTED baseline, not no baseline.

`agentic-ops-framework` is a fleet-tracked location with posture PUBLIC
OSS (public; tracked `.agents`-free): a sanitized extraction target that
receives curated content via SPECs, NOT a fleet-sync destination. It is
intentionally absent from the posture table above and from the roster
manifests for that reason (`file://AGENTS.md` "What this repo is";
`file://specs/2026-06-10-model-capability-matrix/SPEC.md` §7.4-§7.5).

Agent instructions, skills, workflows, and project memory artifacts belong in
those repos or in this top-level `.agents/` control plane. Legacy agent state
outside this boundary is disposable unless it is required by a live tool home
such as `~/.copilot` or `~/.claude`.

### Public OSS posture (Wick, Mimir)

The fleet engagement model is internal; none of it belongs on a public
surface. For repos posture-classified as PUBLIC OSS:

- `.agents/`, `.claude/`, and the root-level fleet workpads
  (`SESSION_JOURNAL.md`) MUST be in the repo's `.gitignore`. The fleet
  propagation mechanism lays the engagement model + workpads into the
  working tree; the content MUST NOT be committed or pushed.
  `fleet-sync.sh` auto-adds these patterns on every OSS-posture run,
  and `audit-entry-docs.sh` flags any tracked instance as BLOCKING.
- Propagation conformance for OSS repos is "files present in the
  working tree", not "commit on a branch". This is policy, not a
  conformance gap.
- **Agents MUST NOT be dispatched against PUBLIC OSS repos from the
  root workspace.** A primary or subagent operating in
  `/var/home/hasnobeef/buildepicshit` MUST NOT target Wick or Mimir
  via `cd`, `git -C`, file paths, or Agent tool dispatch. Work on
  Wick/Mimir is done by entering the repo directly (own session,
  own working directory) so internal context, fleet artefacts, and
  root-level memory never leak into public-facing commits.
- New skills, workflows, or policy docs that name internal infra
  MUST be authored on the assumption that they may end up in the
  PUBLIC OSS working tree but never on the public surface. Do not
  obfuscate names; do not publish.

Reclassifying a repo (internal → OSS or OSS → internal) is a
Decision-class spec under the v1 procedure. Do not reclassify ad-hoc.

## Fleet Rule Origination

Fleet-wide rules — anything in `.agents/` (OPERATING_MODEL,
DOCUMENTATION_GUIDE, MODEL_ROUTING, GREEN_ROOM_EVALUATION,
WORKSPACE_LAYOUT, SKILL_REGISTRY, every skill, every workflow,
every script, every template, every schema, every hook) — MUST be
authored in `bes-fleet-policy` first and propagated to child repos
via `agents/scripts/fleet-sync.sh`.

- A change to `.agents/` content in a child repo is repo-local
  drift, not a fleet change, and MUST be rejected at review. The
  correct workflow: amend the artefact in `bes-fleet-policy` via
  the v1 SPEC procedure (IDEA → SPEC in `bes-fleet-policy/specs/`;
  blocking review; owner approval), then run `fleet-sync.sh`.
- `fleet-sync.sh` overwrites all fleet artefacts on each
  propagation; any divergence in a child repo's `.agents/` is
  silently overwritten on the next sync. The only durable copy of
  fleet content lives in `bes-fleet-policy`.
- Repo-specific extensions MUST live in the child repo's
  `.claude/` only, never in `.agents/`, and MUST NOT shadow the
  names of fleet skills, workflows, hooks, or commands. If a fleet
  artefact needs a per-repo variant, that's a Decision-class spec
  authored here.
- Subagents executing a SPEC in a child repo MUST NOT modify
  `.agents/` content. The fleet artefacts are read-only from the
  child-repo perspective.

## Source Of Truth

1. Project facts and durable rules live in repo docs and `AGENTS.md`.
2. `AGENTS.md` is the canonical, agent-agnostic entry doc — read by Copilot, Cursor, Aider, Jules, and other AGENTS-aware tools. Optional agent-specific files (`CLAUDE.md`, `GEMINI.md`, etc.) MAY exist alongside `AGENTS.md` to add tool-specific context; Claude Code reads `CLAUDE.md`, Gemini CLI reads `GEMINI.md`, and so on. The agent-specific files SHOULD import `AGENTS.md` (e.g. `@AGENTS.md`) and MUST NOT carry policy that the agent-agnostic file lacks.
3. The per-repo engagement contract lives in `WORKFLOW.md`; shared
   fleet policy lives in the `.agents/` docs (workflows, skills,
   DOCUMENTATION_GUIDE, WORKSPACE_LAYOUT, MODEL_ROUTING,
   GREEN_ROOM_EVALUATION, mcp/README + approved-defaults.json,
   SKILL_REGISTRY).
4. Spec evidence records are governed drafts, not direct instructions.
5. Chat history and tool memories are temporary recall aids.

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

The DEFAULT lifecycle is a 5-gate flow
(`file://specs/2026-06-30-operating-model-lean-down/SPEC.md` §7):

1. **Align**: run `node .agents/scripts/preflight.mjs` from the root
   before planning, dispatch, or spec execution. Orient on `AGENTS.md`
   (canonical), the agent-specific extension if applicable (`CLAUDE.md`
   for Claude, `GEMINI.md` for Gemini, etc.), `STATUS.md` if it exists,
   and the relevant docs. Predict known failures from current evidence
   — missing local packages, disabled CI, stale authority docs, owner
   decisions, public-OSS release gates, model quota, long-running CLI
   behavior — and put the predictions in the prompt or SPEC so workers
   can classify failures as expected, new, or owner-blocking.
2. **Spec**: conduct an IDEA conversation between the owner and the
   primary agent. The conversation MUST resolve the implied spec type
   (task / contract / decision), constraints, 2-3 considered
   approaches, a recommendation, and any owner-blocking questions.
   Capture it as `IDEA.md` at `.agents/specs/<id>/IDEA.md` via
   `/idea-capture`. The IDEA artefact is contract-grade and bindable:
   agent memory and training are legitimate conversational inputs but
   MUST NOT appear as evidence in the artefact (see the
   input-vs-artefact distinction in the Memory Policy section below).
   Then author `SPEC.md` from the unified
   `.agents/specs/SPEC.template.md` (or `SPEC.fastpath.template.md`
   for fastpath work); the `type` front-matter is informational
   post-lean and, if set, SHOULD match the IDEA's `implies_spec_type`.
3. **Approve**: run the blocking per-type quality gate via the
   `spec-review` skill. Do not implement until the owner or
   controlling workflow marks the spec approved.
4. **Execute**: implement only the approved spec. Do not expand scope
   silently.
5. **Verify**: run the spec acceptance commands and the repo's normal
   gate. Write a completion report with changed files, verification
   output, residual risk, and spec evidence candidates; capture
   durable lessons as spec evidence candidates. Do not write
   cross-project instructions directly from an agent session.

The full 13-phase path (adding decompose / dispatch / cross-validate)
MAY be used for high-risk or multi-agent work but MUST NOT be the
default posture. Two further lightweight modes coexist:

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

These modes trim ceremony further for the smallest work, below the
5-gate default. They are NOT escape hatches for laziness — thresholds
are objective and lint-enforced.

## Standing Autonomy and Concision

Agents default to ACTING on routine, reversible work and reporting
tersely. Routine hygiene is pre-authorized here — it never needed a
per-instance owner turn, and treating it as if it did is the failure
mode this section removes: agents that narrate, re-list, or invent work
to look diligent instead of finishing it.

### Pre-authorized routine hygiene

A write-capable agent DOES the following on its own, when the action is
reversible and backed by evidence in the tree — no owner turn required:

- Commit its own verified, in-scope work on a working branch.
- Treat a stat-dirty file (mtime touched, content identical to HEAD) as
  clean — refresh the index and move on. It is not a change.
- Delete a local branch whose tip is already contained in `main`
  (`git log <branch> --not main` prints nothing).
- Clear a recorded follow-up once the tree proves it done, and drop it
  from the every-session read path (STATUS, journal).
- Complete the mechanical step a prior session named as owed and left
  only for lack of a turn — merge an already-green PR, run a sync, remove
  probe residue.

Owner-only actions are unchanged and still require an owner turn: flipping
a SPEC to `approved`/`verified`/`closed`, pushing to a protected branch
outside the `main-direct` allowance, reclassifying a repo, publishing to a
public OSS surface, deleting user work not proven stale, or any
irreversible or scope-expanding change. When a genuine owner DECISION
blocks progress — a trade-off the code and docs cannot answer — surface
that one decision and proceed on everything else.

### Report tersely

- A clean tree with nothing owed is the success state. Say so in one line
  and take the next real task; do not hunt for something to flag.
- Report state that is REAL and load-bearing. A phantom stat-dirty file, a
  follow-up already recorded in STATUS, or a branch already merged is not
  an issue — do not present one as if it were.
- Apply the fleet's own adopted authoring craft to your own prose
  (`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/ADOPTION_PACK.md`
  T4, Pocock v1.1 `d574778`): delete no-op sentences whole; a completion
  report that restates template headings with nothing under them is a
  no-op — collapse it. Terse and complete beats exhaustive and padded.

This MODULATES the Required Work Model and the Completion Report Format;
it does not replace them. Substantive spec work still reports in full. The
change: routine work is done and reported in one pass, not described back
to the owner for permission it already has.

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

Specs are typed (`task` / `contract` / `decision`); all types use the
one unified template at `.agents/specs/SPEC.template.md` (plus
`SPEC.fastpath.template.md` for fastpath work). Shared front-matter,
citation grammar, RFC 2119 conventions, and the per-type blocking
quality bars live in `.agents/specs/SPEC.schema.md`, enforced by the
`spec-review` skill as a blocking gate. A spec MUST NOT advance to
`approved` while any blocking criterion fails.

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

All agents must follow `.agents/DOCUMENTATION_GUIDE.md` — it carries
the placement tables (agent-control vs repo-native docs paths), the
promotion path, and the archive/supersession rules.

- Wick and Mimir are public OSS surfaces. Keep internal agent-control language
  in `.agents/` unless the owner approves public wording and CI impact.

## WORKFLOW.md Contract

The root and each active repo own a `WORKFLOW.md` engagement contract.
Its Section 1 (universal) applies to every agent regardless of dispatch
surface. The file is self-contained: an agent can load workspace
policy, hook policy, runner settings, and the prompt body without
relying on chat history.

Required local posture:

- Workers run in isolated workspaces, branches, or worktrees.
- Agents run `node agents/scripts/preflight.mjs` (child repos:
  `.agents/scripts/preflight.mjs`) at the Align gate before planning,
  dispatch, or execution. It is invoked MANUALLY per the Required Work
  Model — there is no runner `before_run` auto-wiring today.
- Copilot runner command configuration belongs to the runner.
- Concurrency is bounded per repo and should reflect CI cost.
- Completion reports include verification evidence and residual risk.
- A successful run may stop at a handoff/review state; it does not have to
  force an issue to `Done`.

## Governance: Pocock-watch

Fleet rules originate here and propagate; **governance processes** (external-
source watches, audits) are bes-fleet-policy-ONLY and are NOT propagated to
child repos. The monthly, review-gated **Pocock-watch** lives at
`file://agents/governance/pocock-watch/`: it is owner-triggered (no scheduled
auto-fetch), diffs Pocock / Anthropic / Willison against a stored snapshot,
and opens an owner-triage item on material change. It MUST NOT auto-apply
changes — accepted changes flow through the normal SPEC procedure
(`file://specs/2026-06-30-operating-model-lean-down/SPEC.md` §7).

The fleet's alignment posture toward Pocock is
**adopt-closely-with-caveats**: Pocock v1.1 is the alignment standard and
the fleet diverges only with recorded cause, holding the tracker-free
substrate, owner-only gates, and the 15-skill corpus constant
(`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md`).

## Session Continuity (universal workpad)

Every fleet repo has a `SESSION_JOURNAL.md` at its root. It is the
universal workpad and durable cross-session handoff record: every
agent reads the last 3 entries on session start and appends a new
entry (dirty-tree state, in-flight decisions, next-agent directives)
on session end.

Template: `file://agents/templates/SESSION_JOURNAL.template.md`.
Authority: `file://agents/templates/WORKFLOW.body.md` Section 1
Step 5; `file://agents/skills/repo-orientation/SKILL.md` Step 3.

Append-only. Owner alone archives entries older than 90 days to
`SESSION_JOURNAL.archive.md`.

## Cross-Repo Enforcement (fleet-directives)

When a fleet rule change requires action across child repos beyond
what `fleet-sync.sh` handles automatically, the bes-fleet-policy
agent issues a structured **fleet directive** at
`agents/fleet-directives/<YYYY-MM-DD>-<slug>.md`. Only
`bes-fleet-policy` issues directives; owner alone authorises them.
Format, mechanics, and compliance tooling:
`file://agents/fleet-directives/README.md`;
`file://agents/skills/fleet-enforce/SKILL.md`;
`file://agents/workflows/fleet-enforce.md`.

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
subagents, model-specific repo workers, or multi-agent reviews. It is
the canonical routing surface — lanes, capability matrix, dispatch
rules, prompt templates, and the recency-rule rationale for
frontier-lane promotions.

- Copilot is the default root fleet manager and primary implementation
  agent; Claude is dispatched deliberately for independent review,
  ambiguity checks, long-form synthesis, or bounded repo work after an
  approved spec.
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
build sequence. The protocol doc carries the isolation, cross-family
pairing, packet-location, no-implementation, and
verifier-output-is-not-owner-approval rules.

## Shared Skills

Use `.agents/SKILL_REGISTRY.md` to choose the correct procedure — it is
the single source of truth for the fleet skill set (core lifecycle +
tactical/craft skills). Do NOT maintain a parallel enumerated list here;
a duplicated list drifts from the registry. `spec-authoring` owns
templates, schema, and structured IDEA capture (invoked by
`/idea-capture` and `/author-spec`); `fleet-enforce` is policy-repo-only.

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
not conversations — the input-vs-artefact distinction. Agent memory,
training, and synthesized recall are LEGITIMATE INPUTS to ideation
conversations and authoring/review reasoning; in artefacts (IDEA.md,
SPEC.md, completion reports, spec evidence candidates), every
evidence-bearing section MUST carry at least one source token per the
citation grammar in `.agents/specs/SPEC.schema.md` §2. Memory and
training are NOT citable evidence.

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
- `.mcp.json` is machine-local and ignored. Default MCPs require an
  approved spec and an entry in `.agents/mcp/approved-defaults.json`.
  USE of already-connected sources is the default; PROVISIONING a new
  server stays governed — see `.agents/mcp/README.md`.
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
