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
the per-repo intro paragraph).

This body is structured into two sections:

  Section 1 — Universal (applies to every agent in this repo,
              regardless of dispatch surface).
  Section 2 — OPTIONAL dispatch appendix (dormant; NOT in use —
              the fleet runs no external dispatcher or tracker).

If an external dispatcher were ever wired up (none is, and none ever
has been), it would render this body using Liquid-style variables
({{ issue.* }}, {% if attempt %}). Per-repo
customization belongs ABOVE this body (intro paragraph naming the
repo, repo-specific posture notes, repo-specific verification
command). This body is fleet-uniform.
-->

## Applicability

This file is the **per-repo engagement contract**, not a setup
checklist. It applies to every agent operating in this repo
regardless of dispatch surface; Section 1 below is universal.
Section 1 below is the whole contract. Section 2 is a dormant,
optional appendix that is NOT in use.

- **Every session (Claude Code or Copilot CLI):** Section 1 applies.
  **The fleet uses no external tracker or dispatcher — do not install
  Symphony, Linear, or any tracker; none is configured.** Use the v1
  SPEC procedure via the `/idea-capture`, `/author-spec`,
  `/review-spec`, `/execute-spec`, `/verify-spec` slash-commands (see
  `.agents/skills/spec-driven-development/SKILL.md`). For small
  owner-directed work, evaluate the fastpath route through
  `.agents/skills/spec-authoring/SKILL.md` and
  `.agents/specs/SPEC.fastpath.template.md`.
- **Section 2** would apply ONLY if someone later wired up an
  external dispatcher (none exists, and the fleet has never used
  one). Ignore it otherwise.

---

# Section 1 — Universal (all agents)

## Operating principles

The fleet operates a posture of **bounded autonomy, mandatory voice,
and quality first**: high agency inside the safety gates, not silent
compliance and not unbounded action
(`.agents/specs/2026-06-20-agent-canon-bounded-autonomy-voice/SPEC.md`
§7).

1. **Citation discipline & ground before you answer.** Every factual
   claim you write into a `SPEC.md`, `TASK.md`, `Completion Report`,
   or `SESSION_JOURNAL.md` MUST carry a citation prefix: `file://`,
   `cmd://`, `url://`, `owner://`, `judgment://owner`,
   `judgment://agent-synthesis`. Agent memory is INPUT, never
   EVIDENCE. The same standard governs any answer: on a load-bearing
   external-world gap (a tool, API, library, product, current fact),
   **research, do not speculate** — find primary sources, become the
   SME, then cite what you fetched or say "unverified". See
   `.agents/specs/SPEC.schema.md` §2 and
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
   §17 Completion Report.

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

Available in `.agents/skills/`:

- `repo-orientation` — what to read, in what order, before editing.
- `spec-driven-development` — the v1 IDEA→SPEC→tasks→execute
  pipeline.
- `spec-authoring` — produce typed SPECs (task / contract /
  decision / fastpath).
- `spec-review` — BLOCKING quality gate.
- `approved-spec-decomposition` — post-approval SPEC → TASK.md
  emission.
- `implementation-execution` — scoped edits without surprise.
- `code-review` — review your own diff before push; cross-family
  reviewer for TASK.md execution.
- `verification` — fresh evidence before completion claim.
- `tdd` — test-driven development for new behavior.
- `diagnosis` — systematic debugging when something breaks.
- `fleet-enforce` — (bes-fleet-policy only) cross-repo directives.

Entry-doc drift is checked by
`.agents/scripts/audit-entry-docs.sh`.

---

# Section 2 — OPTIONAL dispatch appendix (NOT in use)

> **The fleet does not use Linear or Symphony, and never has.** This
> appendix is a dormant, optional template kept ONLY for the
> hypothetical case that someone later chooses to wire up an external
> dispatcher. It is never active in normal operation and is NOT a
> requirement. Interactive and CLI agents: ignore this section
> entirely — Section 1 is the whole contract. Do not install Linear or
> Symphony or any tracker; none is configured.

## Dispatch context (only if an external dispatcher is ever wired up)

If — and only if — an external dispatcher is ever configured, it would
render this body with its own variables. In that hypothetical case the
`TASK.md` artefact in
`.agents/specs/<parent_spec_id>/tasks/` remains the contract and the
parent SPEC.md the authority. No dispatcher is configured today and
the rest of this section is inert.

{% if attempt %}
**Continuation context:**

- This is retry attempt #{{ attempt }} because the ticket is still
  in an active state.
- Resume from the current workspace state instead of restarting
  from scratch.
- Do not repeat already-completed investigation or validation
  unless needed for new code changes.
- Do not end the turn while the issue remains in an active state
  unless blocked by missing required permissions/secrets.
{% endif %}

## Issue context

- Identifier: `{{ issue.identifier }}`
- Title: `{{ issue.title }}`
- Current status: `{{ issue.state }}`
- Priority: `{{ issue.priority }}`
- Labels: `{{ issue.labels }}`
- URL: `{{ issue.url }}`

Description:
{% if issue.description %}
{{ issue.description }}
{% else %}
No description provided. The TASK.md in the repo is the source of
truth — locate it before writing any code.
{% endif %}

## Symphony Step 0 — Route by Linear state

- `Backlog` → out of scope; do not modify; stop.
- `Todo` → transition to `In Progress`, ensure `## Copilot Workpad`
  comment exists, then continue to Symphony Step 1.
- `In Progress` → continue from current workpad.
- `Human Review` → poll only; do not change ticket content.
- `Merging` → run the `land` skill flow; do not call `gh pr merge`
  directly.
- `Rework` → full reset (Symphony Step 4 — Rework).
- `Done` → terminal; shut down.

## Symphony Step 1 — Workpad bootstrap

1. Search Linear comments for a `## Copilot Workpad` marker. If
   found and unresolved, reuse that comment ID. If not found,
   create one. **One workpad per issue.** Persist its ID and
   write all progress updates to that single comment.
2. Reconcile the workpad before any new edits (check off done
   items; expand plan; ensure Acceptance Criteria + Validation
   reflect TASK.md `acceptance_commands` + ticket-provided
   Validation/Test Plan/Testing sections).
3. Stamp the workpad header: `<host>:<abs-workdir>@<short-sha>`.
4. Capture a reproduction signal and record it in `Notes`.
5. Sync with `origin/main` before code edits; record the sync
   result in `Notes`.

## Symphony Step 2 — Execute

(Follow Section 1 Step 2 subagent dispatch + Step 3
cross-validation. Symphony-specific differences:)

1. Open a PR (or attach an existing one). Add the `symphony`
   label. Link the PR to the issue via attachment.
2. Run the **PR feedback sweep protocol** (below) before any
   transition to `Human Review`.
3. Update the workpad with final checklist status, validation
   evidence, cross-validation findings + resolutions, and a
   `### Confusions` section if anything was unclear. Do not post
   separate "done"/"summary" comments.

## Symphony Step 3 — Human Review handoff

Transition to `Human Review` only when **Completion Bar** below
is satisfied. After transition, do not change ticket content;
poll only.

## Symphony Step 4 — Rework

1. Treat `Rework` as a full approach reset.
2. Close the existing PR.
3. Remove the existing `## Copilot Workpad` comment.
4. Create a fresh branch from `origin/main`.
5. Restart from Symphony Step 0.

## Symphony Step 5 — Land

When the issue reaches `Merging`:

1. Open and follow the `land` skill flow. Do not call
   `gh pr merge` directly.
2. After merge, move the issue to `Done`.
3. Append the TASK.md's evidence to the parent SPEC's §17
   Completion Report (the only section a subagent may modify).

## PR feedback sweep protocol

Before any transition to `Human Review` on a ticket with an
attached PR:

1. Identify the PR number from issue attachments.
2. Gather all feedback channels:
   - Top-level PR comments (`gh pr view --comments`)
   - Inline review comments (`gh api repos/<owner>/<repo>/pulls/<pr>/comments`)
   - Review summaries/states (`gh pr view --json reviews`)
3. Treat every actionable reviewer comment (human or bot,
   including inline) as blocking until either (a) code/tests/docs
   updated to address it, or (b) explicit justified pushback
   reply posted on that thread.
4. Update workpad plan/checklist with each feedback item +
   resolution status.
5. Re-run validation after feedback-driven changes; push updates.
6. Repeat until no outstanding actionable comments remain.

## Blocked-access escape hatch (Symphony only)

Use only when blocked by missing required tools or auth that
cannot be resolved in-session.

- GitHub auth is NOT a valid blocker by default; exhaust fallback
  remotes/auth modes first.
- For non-GitHub blockers, move ticket to `Human Review` with a
  workpad blocker brief: what is missing, why it blocks
  acceptance, exact human action needed.

## Completion bar before Human Review

- Symphony Step 1/2 checklist fully complete and reflected in
  workpad.
- TASK.md `acceptance_commands` exit 0; SPEC §12 Acceptance
  Criteria in-scope for this task all PASS.
- Ticket-provided `Validation`/`Test Plan` items all complete.
- Cross-family cross-validation findings addressed (Section 1
  Step 3).
- PR feedback sweep complete; no outstanding actionable comments.
- PR checks green; branch pushed; PR linked on issue with
  `symphony` label.
- If app-touching: runtime validation/media requirements complete.

## Symphony workpad template

Use this exact structure for the persistent Linear-comment
workpad and keep it updated in place throughout execution:

````md
## Copilot Workpad

```text
<hostname>:<abs-path>@<short-sha>
```

### Plan

- [ ] 1\. Parent task
  - [ ] 1.1 Child task
- [ ] 2\. Parent task

### Acceptance Criteria

- [ ] Criterion 1
- [ ] Criterion 2

### Validation

- [ ] targeted tests: `<command>`
- [ ] SPEC acceptance: `<command from parent SPEC.md>`
- [ ] TASK acceptance: `<command from this TASK.md>`

### Notes

- <short progress note with timestamp>

### Confusions

- <only include when something was confusing during execution>
````

---
