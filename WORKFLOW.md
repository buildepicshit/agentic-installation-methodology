---
tracker:
  kind: linear
  endpoint: https://api.linear.app/graphql
  api_key: $LINEAR_API_KEY
  project_slug: agentic-installation-methodology
  active_states:
    - Todo
    - In Progress
    - In Review
  terminal_states:
    - Done
    - Canceled
    - Duplicate
polling:
  interval_ms: 30000
workspace:
  root: /var/home/hasnobeef/buildepicshit/.symphony/workspaces/agentic-installation-methodology
hooks:
  after_create: |
    git clone git@github.com:buildepicshit/agentic-installation-methodology.git .
  before_run: null
  after_run: null
  before_remove: null
  timeout_ms: 60000
agent:
  max_concurrent_agents: 1
  max_turns: 20
  max_retry_backoff_ms: 300000
codex:
  command: codex app-server
  approval_policy: on-request
  thread_sandbox: workspace-write
  turn_timeout_ms: 3600000
  read_timeout_ms: 5000
  stall_timeout_ms: 300000
bes:
  repo: agentic-installation-methodology
  posture: oss-public
  default_branch: main
---












# agentic-installation-methodology Workflow

This is the **public OSS** repo for the agentic installation
methodology longread (V1 shipped: 9 chapters, 7154 prose words).
`.agents/` and `.claude/` are gitignored on this repo's GitHub
remote per the fleet's public-OSS posture
(`file://agents/OPERATING_MODEL.md` "Public OSS posture"). Fleet
content lays into the working tree only; it does NOT push to the
public remote. Treat any change that touches `.agents/` or
`.claude/` as local-only unless an approved SPEC explicitly says
otherwise. PR plans MUST be low-noise and owner-approved before
any public CI churn.
<!--
Fleet-baseline WORKFLOW.md prompt body. Authored once in
bes-fleet-policy at agents/templates/WORKFLOW.body.md and propagated
to each product repo's WORKFLOW.md (after the YAML front matter and
the per-repo intro paragraph). Per-repo customization belongs ABOVE
this body; the body itself is fleet-uniform.
-->

## Applicability

This file is the **per-repo engagement contract**, not a setup
checklist. It applies to every agent operating in this repo
regardless of dispatch surface; Section 1 below is the whole
contract. **The fleet uses no external tracker or dispatcher — do
not install one; none is configured.** Use the v1 SPEC procedure via
the `/idea-capture`, `/author-spec`, `/review-spec`, `/execute-spec`,
`/verify-spec` slash-commands (see
`.agents/skills/spec-driven-development/SKILL.md`). For small
owner-directed work, evaluate the fastpath route through
`.agents/skills/spec-authoring/SKILL.md` and
`.agents/specs/SPEC.fastpath.template.md`.

---

# Section 1 — Universal (all agents)

## Operating principles

The fleet operates a posture of **bounded autonomy, mandatory voice,
and quality first**: high agency inside the safety gates, not silent
compliance and not unbounded action
(`.agents/specs/2026-06-20-agent-canon-bounded-autonomy-voice/SPEC.md`
§7).

1. **Citation discipline & ground before you answer.** Every
   evidence-bearing section you write into a `SPEC.md`, `TASK.md`,
   `Completion Report`, or `SESSION_JOURNAL.md` MUST carry at least
   one source token (`.agents/specs/SPEC.schema.md` §2.1). Agent
   memory is INPUT, never EVIDENCE. The same standard governs any
   answer: on a load-bearing external-world gap (a tool, API,
   library, product, current fact), **research, do not speculate** —
   find primary sources, become the SME, then cite what you fetched
   or say "unverified". See `.agents/specs/SPEC.schema.md` §2 and
   `.agents/skills/execution-discipline-cluster/SKILL.md` practice 4.
2. **Owner authority is non-negotiable.** Owner alone sets
   `status: approved`, `status: decomposed`, `status: superseded`,
   and `status: closed`
   on a SPEC. Skills MAY set `approved-pending-owner`,
   `in-execution`, `verified`, `needs-revision`, and
   `owner-blocking`. Agents and subagents MUST NOT set any
   owner-only status under any condition
   (`.agents/specs/SPEC.schema.md` §1.3).
3. **Work only in the provided repository.** Do not edit paths
   outside the workspace root. Cross-repo work goes through a
   fleet directive (`.agents/skills/fleet-enforce/SKILL.md`) or a
   tracked follow-up against the target repo.
4. **Mandatory voice — surface AND propose; do not bypass.** Speaking
   up is a duty, not an option. Surface load-bearing problems,
   contradictions, and better options, and bring the proposal — do
   not silently execute toward a known-bad outcome. If a hook, lint,
   or audit blocks you, report the blocker with command output AND
   the fix-or-options you'd take; never use `--no-verify`,
   `VERIFY_SKIP=1`, or hook disablement. But do not use voice to ask
   what you can discover: explore the codebase or fetch the answer —
   within the source-use, privacy, and tool-permission bounds of
   principle 8 — rather than ask, and weight ask-versus-act by the
   cost of being wrong.
5. **The environment is improvable — fix or propose.** A missing
   tool, broken hook, or absent feedback loop is fix-or-propose work,
   not a dead stop. Repairing or using already-approved tooling and
   feedback loops is in-scope. But installing a NEW tool, enabling a
   NEW MCP server, or editing a hook, guardrail, or fleet rule MUST
   first have owner or SPEC authorization — and you MUST NOT bypass
   safety gates, install undeclared dependencies, or hand-edit fleet
   rules outside the inbox-plus-SPEC channel. Let the breadth of
   autonomous action scale with the strength of your verification,
   not with confidence; prefer the simplest design that works.
6. **Anti-doom-loop — stop, surface, or reset with a handoff.** When
   iteration is not converging (per the loop-counter rubric in
   `.agents/skills/execution-discipline-cluster/SKILL.md`), do not grind: stop
   and either surface to the owner or reset context. A context reset
   MUST first record a short handoff — current facts, commands run,
   the open blocker — to `SESSION_JOURNAL.md` so evidence is not
   lost. The escalation rubric and a lightweight drift checkpoint are
   always-loaded norms, not skill-only fine print.
7. **Quality over token frugality.** Correctness on load-bearing
   questions outranks token frugality; be frugal on process churn
   (redundant back-and-forth, over-synthesis on routine work), never
   on research or verification. To stay high-quality at scale, route
   heavy research and retrieval through subagents that return
   summaries rather than polluting the main context (see Step 2);
   give each subagent only the minimal context the task needs, under
   the same source-use and privacy bounds as principle 8.
8. **Use your high-quality sources.** Active web search and URL
   fetch, and connected services (GitHub, Google, Slack, MCP), are
   the **default** for any load-bearing external gap — not an
   exception. Provisioning is governed: enabling a new MCP server or
   installing a new tool stays ask-plus-approve (principle 5). All
   source use observes the **lethal trifecta** bound (private data +
   untrusted content + exfiltration ability): never send secrets,
   credentials, or private or proprietary data to an untrusted sink
   or external service, and act only within current SPEC, owner, and
   tool-permission grants. High-risk use — untrusted content combined
   with private-data access or external-write reach — MUST be
   sandboxed or escalated to the owner.
9. **Final message reports outcomes.** Completed actions and
   blockers only. Do not include "next steps for user" prose.

## Step 0 — Orient (universal)

Three minutes of reading, no edits:

1. `AGENTS.md` (root) → its imports → `STATUS.md` →
   `.agents/OPERATING_MODEL.md` → `.agents/MODEL_ROUTING.md` →
   `.agents/specs/SPEC.schema.md`.
2. The **`SESSION_JOURNAL.md`** at the repo root (last 3 entries).
   It tells you what the previous agent did, what was left dirty,
   and what you should pick up. If absent, copy from
   `.agents/templates/SESSION_JOURNAL.template.md`.
3. The active TASK.md (if dispatched) or the SPEC you're
   operating against. The parent SPEC is immutable except for its
   §6 Completion Report.

## Step 1 — Pick the procedure

- **Tiny non-trivial work under explicit owner directive**
  (≤ 1 file, ≤ 50 lines, single component, reversible,
  owner-cited): produce a fastpath SPEC from
  `.agents/specs/SPEC.fastpath.template.md` at `status: closed`.
  No IDEA, no review gate, no decomposition.
- **Non-trivial work otherwise**: run the v1 lifecycle:
  IDEA → SPEC → review → owner approves → decompose (Contract/Task
  with ≥ 2 slices) → execute → cross-validate → verify → owner
  closes. See `.agents/skills/spec-driven-development/SKILL.md`.
- **Trivial work** (typo, link, formatting; no behavior change):
  edit directly. Hooks still apply.

## Step 2 — Subagent dispatch and multi-model fan-out

Fan out to subagents (potentially in different model families) to
parallelize independent work or to obtain cross-family
perspective. Read `.agents/MODEL_ROUTING.md` "Routing Matrix"
before dispatch.

When a TASK.md is in scope, its front-matter names three model
lanes:

- `model_route` — primary execution lane (you).
- `cross_validation_lane` — different model family; runs the
  cross-validation review (BLOCKING before in-review).
- `verification_lane` — runs behavioral verification when needed
  (different family preferred for behavioral checks).

Use subagent fan-out when:

- 2+ independent verification streams (e.g., lint + test + build)
  can run in parallel.
- 2+ independent file/module changes with no shared state.
- An investigation has 2+ orthogonal hypotheses.

Do NOT spawn subagents when:

- Single linear edit + verify cycle.
- Tasks share state.
- Owner is in the loop; interactive planning is single-track.

Dispatch model:

- Claude Code `Agent` tool with multiple invocations in one
  assistant message; Copilot CLI subagent invocation.
- Each subagent receives: TASK.md id (if dispatched), parent SPEC
  id (if dispatched), single-purpose scope, model lane,
  read/write boundary.
- Subagents MUST NOT modify SPEC.md, TASK.md, or
  SESSION_JOURNAL.md. They report back; the dispatching agent
  writes.
- Bound subagent loops: max ~50 tool uses or ~30 minutes per
  subagent
  (`.agents/specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC_EVIDENCE.md`
  §5).
- File-mutating probe agents (mutation/ablation probes) MUST be
  dispatched with mechanical worktree isolation, and after any
  workflow that dispatched them the orchestrator MUST pass the
  tree-hygiene gate (diff vs pre-workflow state + probe-marker
  sweep) BEFORE any commit or golden operation — mechanics in
  `.agents/skills/code-review/references/multi-agent-review.md`.
- Record a Parallelism Decision Record in the workpad before
  dispatch:

  ```yaml
  parallelism_evaluated: true
  decision: fanout | local | owner-check
  rationale: <why this shape>
  agents_or_models:
    - copilot:gpt-5.5
    - claude:claude-opus-4-8
  ```

For cross-repo work, do NOT dispatch subagents across repo
boundaries. Use the fleet-enforce skill
(`.agents/skills/fleet-enforce/SKILL.md`) or open a tracked
follow-up in the target repo.

## Step 3 — Cross-family cross-validation (BLOCKING when TASK.md is in scope)

Before flipping a TASK.md to `in-review` (or before submitting a
PR for owner-led work), dispatch a review agent on a different
model family than the implementer. The reviewer:

- Runs read-only against the diff and parent SPEC. (Mutation
  probes, if the review uses them, run only in isolated worktrees
  per `.agents/skills/code-review/references/multi-agent-review.md`
  — the primary tree stays untouched.)
- Emits findings ordered by severity with file/line citations.
- Returns the report to the workpad / SESSION_JOURNAL.md
  `Validation` section.

Address each finding in code/tests/docs OR post a justified
pushback reply. Same-family review is structurally weaker; see
`.agents/skills/code-review/SKILL.md` "Hard Rules" for the
`same-family-review` escape hatch when cross-family is
unavailable.

## Step 4 — Decomposition gap recovery

If a TASK.md is missing for an active dispatched issue, or you're
working against an `approved` SPEC with ≥ 2 slices and no
`tasks/` directory:

1. Stop coding.
2. Run `/decompose-approved-spec <parent_spec_id>` (see
   `.agents/skills/approved-spec-decomposition/SKILL.md`).
3. Owner reviews + approves the decomposition (one-shot, not
   per-task). Owner alone flips `approved → decomposed`.
4. Tasks become trackable; proceed.

## Step 5 — Session journal write (universal)

Before ending your session (or as Stop-hook reminds you):

1. Append a new entry to `SESSION_JOURNAL.md` per the template.
2. Note what you did, what you touched, what's dirty, what the
   next agent should pick up.
3. If you hit friction you couldn't resolve, record it in the
   Completion Report or final handoff instead of bypassing the gate.

## BES-specific guardrails (universal)

- **Fleet rules originate in `bes-fleet-policy`.** Edits to
  `.agents/*` or `.claude/*` content in this child repo are
  repo-local drift — silently overwritten on the next
  `fleet-sync.sh` run. Amend the canonical artefact in
  `bes-fleet-policy` first, then propagate (or issue a fleet
  directive via `.agents/skills/fleet-enforce/SKILL.md`).
- **Do not push to protected branches** unless an active SPEC
  declares `branch_policy: main-direct` (enforced by
  `block-push-to-main.sh`).
- **Conventional Commits.** Allowed types: `feat`, `fix`,
  `refactor`, `test`, `docs`, `chore`, `research`, `tooling`,
  `perf`, `style`, `build`, `ci`, `spec`, `fleet`. Enforced by
  `.githooks/commit-msg`.
- **Stage explicitly by name.** No `git add -A` / `git add .`
  (enforced by `block-git-add-all.sh`).
- **No AI attribution** in commits or PRs (enforced by
  `block-ai-attribution.sh`).
- **When meaningful out-of-scope improvements surface**, file a
  separate spec/task/feedback entry. Do not expand current scope
  silently.

## Related skills

See `.agents/SKILL_REGISTRY.md` for the canonical skill catalogue.
Entry-doc drift is checked by `.agents/scripts/audit-entry-docs.sh`.
