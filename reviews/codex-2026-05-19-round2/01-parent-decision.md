Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/bes-fleet-policy
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e4220-82a4-7f42-b1d6-d7bb96171fd8
--------
user
Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
codex
I’ll keep this read-only and treat it as a review pass, not an implementation pass. I’m going to refresh the repo policy context briefly, then inspect the amended Decision SPEC against the referenced remediation and prior findings.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|Decision SPEC|codex remediation" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
191:- IKTO is now in post-reset greenfield / Godot 4 mode; `T-02 onward` is paused until the post-research architecture Decision SPEC is owner-approved [Task 2]
248:- Symptom: Assets preflight unmanaged-top-level warnings tempt local repo patches. Cause: treating a fleet-policy layout issue as a product-repo problem. Fix: route those warnings to `bes-fleet-policy` and use a source-first fix path instead of patching Assets ad hoc [Task 1]
361:# Task Group: bes-fleet-policy source-first policy updates / propagation
362:scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
363:applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
369:- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
373:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
379:- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
389:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
399:- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
405:- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
418:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' STATUS.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
# bes-fleet-policy STATUS

Last updated: 2026-05-17. The v1 spec procedure is in production;
the symphony-aligned execution layer + framework refresh
(lightweight ceremony) is landed and propagated fleet-wide; the
2026-05-15 inbox-channel-and-skill-references-pattern Contract
SPEC is at `status: verified` (capture-after Contract, pending
spec-evidence-governance pass to advance to `closed`). Two
2026-05-17 research workpads (persona-assignment posture +
operating-model validation run) are live; the validation run
surfaced a 12-item punch list owner has authorised.

## Posture

The v1 BES Spec Authoring Procedure (inaugural Contract SPEC at
`specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`,
`status: closed`) is the live operating model. All nine fleet
locations (bes-fleet-policy + studio root + 7 children:
ACTOCCATUD, Floom, IKTO, Mimir, TieFighter, UsefulIdiots, Wick;
plus Assets local-only) run an identical engagement model:

- byte-identical `.agents/` content propagated via
  `agents/scripts/fleet-sync.sh`;
- byte-identical `.claude/` harness (15 slash-commands, 20
  mirrored skills, 7 hooks + 33-case test harness, statusline,
  `settings.json`);
- 12 typed SPEC artefacts in this repo's `specs/` (`task` /
  `contract` / `decision`); per-product SPECs live in each child
  repo's `.agents/specs/`.

## Branch and remote

- Branch: `main`. Working tree clean.
- Remote: `git@github.com:buildepicshit/bes-fleet-policy.git`
  (private, BES org). Promoted 2026-05-02.
- Pushes to `main` are administrative. Both `block-edit-on-main.sh`
  and `block-push-to-main.sh` honour `branch_policy: main-direct`
  (allow when any SPEC at approved/in-execution/verified/closed
  declares the policy).

## Spec inventory

Pre-v1 control-plane work (all closed):

| ID | Status |
|---|---|
| `2026-04-29-agent-first-control-plane` | closed |
| `2026-04-29-agent-startup-config-repair` | closed |
| `2026-04-29-claude-user-mcp-cleanup` | closed |
| `2026-04-29-company-agent-operating-model` | closed |
| `2026-04-29-fleet-realignment-and-handoff` | closed |
| `2026-04-29-green-room-product-evaluations` | closed |
| `2026-04-29-handoff-triage` | closed |
| `2026-04-29-model-routing-catalog` | closed |
| `2026-04-29-root-control-plane-audit` | closed |
| `BES-CP-008-agent-control-file-remote-cleanup` | closed |

v1-procedure SPECs:

| ID | Type | Status |
|---|---|---|
| `2026-05-01-bes-spec-authoring-procedure-v1` | contract | closed |
| `2026-05-02-fleet-harness-enhancements` | task | closed |
| `2026-05-02-studio-principle-ai` | decision | closed |
| `2026-05-04-agent-parallelism-and-model-routing-v2` | contract | closed |
| `2026-05-05-ai-engineering-tactical-skill-adoption` | decision | closed |
| `2026-05-05-product-repo-workspace-roots-preflight` | contract | closed |
| `2026-05-05-tactical-skill-wave-implementation` | task | closed |
| `2026-05-09-symphony-aligned-execution-layer` | contract | closed |
| `2026-05-09-fleet-adopt-worktrunk` | decision | closed |
| `2026-05-09-fleet-adopt-worktrunk-execute` | task | closed |
| `2026-05-13-framework-refresh-lightweight-ceremony` | contract | closed |
| `2026-05-15-inbox-channel-and-skill-references-pattern` | contract | closed |
| `2026-05-17-contract-corpus-retrospective-audit` | task | closed (SE1/SE2/SE3 dispositioned) |
| `2026-05-17-ceremony-weight-refactor` | decision | approved |
| `2026-05-17-ceremony-weight-refactor-execute` | task | verified |
| `2026-05-17-references-pattern-adoption-wave-2` | task | verified |
| `2026-05-17-cross-family-compliance-audit` | task | verified |

Note: the ceremony-weight-refactor follow-on Task SPEC at
`verified` implemented §7 of the parent Decision via 5 atomic
commits (template + lint + spec-authoring + spec-review +
fleet-sync). Owner alone flips its `verified → closed` after a
spec-evidence-governance pass on the §17.5 SE candidates.

Research workpads (pre-IDEA):

| ID | Kind | Status |
|---|---|---|
| `2026-05-17-agent-persona-research` | research | research |
| `2026-05-17-operating-model-validation-run` | research | research |

IDEAs landed (all 2026-05-17 wave IDEAs have proceeded to SPEC
authoring + execution; SPEC state in the table above is
current):

| ID | Implies type | SPEC state |
|---|---|---|
| `2026-05-17-ceremony-weight-refactor` | decision | approved |
| `2026-05-17-ceremony-weight-refactor-execute` | task | verified |
| `2026-05-17-contract-corpus-retrospective-audit` | task | closed |
| `2026-05-17-references-pattern-adoption-wave-2` | task | verified |
| `2026-05-17-cross-family-compliance-audit` | task | verified |

IDEAs at `draft` (genuine owner-blocking choices):

| ID | Implies type | Status |
|---|---|---|
| `2026-05-17-eval-driven-posture` | decision | draft (Q1-Q4 owner-blocking) |
| `2026-05-17-publish-the-moat` | decision | draft (Q1-Q5 owner-blocking) |

## Open work

Operating-model validation run (`2026-05-17`) surfaced a 12-item
punch list, owner-authorised 2026-05-17. Tracking via task list;
quick wins land directly, larger items go through IDEA → SPEC.

Wave 1 (quick wins + research workpads, landed):

- Bootstrap fleet workpads at this repo's root — LANDED.
- Fix broken authority cite at `agents/skills/agent-inbox/SKILL.md:12` — LANDED.
- Refresh STATUS.md — LANDED (this edit reflects 2026-05-17 final state).
- Add `block-edit-on-main.sh` automated test coverage (29→33) — LANDED.
- Operating-model validation-run research workpad — LANDED.
- Agent-persona-research research workpad — LANDED.

Wave 2 (Decision-IDEA + audit Task SPEC + Decision SPEC, landed):

- SPEC.schema.md §1.3 capture-after exception note (SE3) — LANDED.
- 2026-05-15 SPEC_EVIDENCE.md SE1/SE2/SE3 dispositioned ACCEPT — LANDED.
- `2026-05-17-ceremony-weight-refactor` IDEA Q1-Q4 dispositioned;
  status: ready-for-spec — LANDED.
- `2026-05-17-contract-corpus-retrospective-audit` Task IDEA;
  Task SPEC authored + executed; status: verified — LANDED.
- `2026-05-17-ceremony-weight-refactor` Decision SPEC; status:
  approved-pending-owner — LANDED.

Wave 3 (remaining validation-run punch list IDEAs, landed):

- `2026-05-17-eval-driven-posture` Decision IDEA — LANDED
  (status: draft; owner-blocking on adopt-vs-status-quo + shape).
- `2026-05-17-references-pattern-adoption-wave-2` Task IDEA —
  LANDED (status: ready-for-spec; pre-authorised).
- `2026-05-17-cross-family-compliance-audit` Task IDEA —
  LANDED (status: ready-for-spec; pre-authorised). Surfaced a
  related finding: zero TASK.md artefacts in corpus; the
  decomposition phase has never been exercised.
- `2026-05-17-publish-the-moat` Decision IDEA — LANDED
  (status: draft; owner-blocking publish-or-stay).

Owner-only flips waiting:

- Flip `2026-05-17-ceremony-weight-refactor-execute`
  `verified → closed` after spec-evidence pass on §17.5 SE
  candidates.
- Flip `2026-05-17-references-pattern-adoption-wave-2`
  `verified → closed` after spec-evidence pass on §17.5 SE
  candidates.
- Flip `2026-05-17-cross-family-compliance-audit`
  `verified → closed` after spec-evidence pass on §17.5 SE
  candidates.

Owner-blocking IDEAs (genuine design choices awaiting owner):

- `2026-05-17-eval-driven-posture` — Q1 adopt-or-status-quo;
  Q2 shape (Promptfoo / Inspect / hybrid); Q3 pilot scope;
  Q4 blocking-or-non-blocking in verification path.
- `2026-05-17-publish-the-moat` — Q1 publish-or-stay (load-
  bearing); Q2 shape (private / blog / OSS / hybrid); Q3
  timing; Q4 authorial credit; Q5 OSS subset.

Wave 4 (owner-flip + ceremony refactor execute, LANDED):

- `2026-05-15` `verified → closed` — LANDED.
- `2026-05-17-contract-corpus-retrospective-audit`
  `verified → closed` with SPEC_EVIDENCE.md (SE1/SE2/SE3
  ACCEPT) — LANDED.
- `2026-05-17-ceremony-weight-refactor` Decision
  `approved-pending-owner → approved` — LANDED.
- `2026-05-17-ceremony-weight-refactor-execute` Task SPEC
  authored + executed at `verified`; 5 atomic commits + 1
  fleet-sync wave — LANDED.

Schema impact propagated fleet-wide:

- `SPEC.contract.template.md`: §17 Open Questions OPTIONAL
  when empty; §1 / §13 capture-after defer-shorthand
  permitted at `status: verified`.
- `lint-spec.sh`: Open Questions removed from spec-contract
  required_sections; defer-shorthand handled by §2 grammar.
- `spec-authoring/SKILL.md`: both conventions documented in
  Contract-type guidance.
- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
  resolve-cite check added to Contract per-type gate.

Backward compatibility verified: all 6 closed Contract SPECs
lint clean post-change. Hook tests 33/33.

Next agent step (when owner is ready):

- `/author-spec` from the two ready-for-spec IDEAs
  (`references-pattern-adoption-wave-2`,
  `cross-family-compliance-audit`); both produce small Task
  SPECs that follow the audit-Task precedent.
- Author the follow-on Task SPEC for ceremony-weight-refactor
  AFTER owner flips it to approved.
- Owner-blocking IDEAs (`eval-driven-posture`,
  `publish-the-moat`) wait on owner disposition of their §6
  Open Questions.

## Recently closed (this wave)

| Item | Resolution |
|---|---|
| Cross-repo informational message channel | LANDED — `AGENT_INBOX.md` per-repo append-only inbox; `agents/skills/agent-inbox/` skill (read on session start + send via helper); `agents/scripts/send-fleet-message.sh`; `/send-message` slash command; bootstrapped from template on first sync; auditor advisory for missing inbox files |
| Skill progressive-disclosure refactor | LANDED — `agents/skills/<name>/references/` convention codified; spec-review SKILL.md slimmed 325 → 234 lines (per-type gates extracted); spec-authoring SKILL.md slimmed 281 → 206 lines (RA-first + studio-principles extracted) |
| Skill description-sharpening pass | LANDED — 9 skill descriptions front-load trigger keywords in first 50 chars + carry explicit negative triggers naming sibling skills (Anthropic best-practice guide compliance) |
| `fleet-sync.sh` references mirror loop | LANDED — auto-`mkdir -p` for manifest-driven copies; per-skill `references/` mirror to `.claude/skills/<name>/references/`; staging-loop picks up references files |

## Skills landed (canonical + mirrors)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' agents/OPERATING_MODEL.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
| `TieFighter` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `UsefulIdiots` | INTERNAL | `.agents/` committed; full fleet baseline | Permitted |
| `Mimir` | PUBLIC OSS | `.agents/` gitignored; lays in working tree only | **Forbidden** — enter the repo directly |
| `Wick` | PUBLIC OSS | `.agents/` gitignored; lays in working tree only | **Forbidden** — enter the repo directly |

Agent instructions, skills, workflows, and project memory artifacts belong in
those repos or in this top-level `.agents/` control plane. Legacy agent state
outside this boundary is disposable unless it is required by a live tool home
such as `~/.codex` or `~/.claude`.

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
  (`AGENT_INBOX.md`, `AGENT_FEEDBACK.md`, `SESSION_JOURNAL.md`)
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
  (Symphony, Linear slugs, model routing, evaluation protocols)
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
2. `AGENTS.md` is the canonical, agent-agnostic entry doc — read by Codex, Cursor, Aider, Copilot, Jules, and other AGENTS-aware tools. Optional agent-specific files (`CLAUDE.md`, `GEMINI.md`, etc.) MAY exist alongside `AGENTS.md` to add tool-specific context; Claude Code reads `CLAUDE.md`, Gemini CLI reads `GEMINI.md`, and so on. The agent-specific files SHOULD import `AGENTS.md` (e.g. `@AGENTS.md`) and MUST NOT carry policy that the agent-agnostic file lacks.
3. Symphony-compatible dispatch policy lives in `WORKFLOW.md`.
4. Shared fleet workflows live in `.agents/workflows/`.
5. Reusable agent methods live in `.agents/skills/`.
6. Documentation placement rules live in `.agents/DOCUMENTATION_GUIDE.md`.
7. Root workspace placement rules live in `.agents/WORKSPACE_LAYOUT.md`.
8. Agent and model routing policy lives in `agents/MODEL_ROUTING.md` in
   this policy repo and `.agents/MODEL_ROUTING.md` in propagated repos.
9. Green room product evaluation policy lives in
   `.agents/GREEN_ROOM_EVALUATION.md`.
10. Default MCP policy lives in `.agents/mcp/README.md` and
   `.agents/mcp/approved-defaults.json`.
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
- Contract: bar (c) "Symphony-grade", with REQUIRED lint pass.
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' agents/MODEL_ROUTING.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
# BES Model Routing Guide

Status: canonical shared guidance, 2026-04-29.
Last amended: 2026-05-04.

Purpose: choose the right agent and model for BES fleet work without relying on
memory or taste. This guide is routing policy, not proof of account entitlement.
Before pinning a model in automation, verify it in the relevant model picker or
with an owner-approved probe.

## Source Checkpoints

Checked on 2026-05-04:

- OpenAI Codex model docs identify `gpt-5.5` as the recommended starting point
  for demanding Codex tasks and `gpt-5.4-mini` as the speed/efficiency option:
  <https://developers.openai.com/codex/models#recommended-models>
- Anthropic Opus 4.7 docs describe Opus 4.7 as the current generally available
  Opus model and list `claude-opus-4-7`: <https://www.anthropic.com/claude/opus>
- Anthropic Opus 4.6 release notes list `claude-opus-4-6`, adaptive thinking,
  effort controls, 1M context beta, and pricing notes:
  <https://www.anthropic.com/news/claude-opus-4-6>
- Anthropic Sonnet 4.6 docs list `claude-sonnet-4-6`, adaptive/extended
  thinking, 1M context beta, and Sonnet pricing:
  <https://www.anthropic.com/claude/sonnet>

Re-check provider docs and account model pickers before any spend-heavy probe,
automation pin, or long-running multi-agent dispatch.

## Local Inventory

Observed from the root control plane on 2026-05-04:

| Surface | Observed state | Operational meaning |
| --- | --- | --- |
| Codex CLI | `codex-cli 0.128.0` | Primary root fleet manager and implementation agent. |
| Codex default model | `gpt-5.5` | Configured in `/var/home/hasnobeef/.codex/config.toml`. |
| Codex reasoning | `xhigh` | Configured in `/var/home/hasnobeef/.codex/config.toml`. |
| Codex MCP | `openaiDeveloperDocs` user-level entry | Useful for OpenAI docs; not a fleet default MCP. |
| Claude Code | `2.1.126 (Claude Code)` | Peer frontier coding/review lane when dispatched deliberately. |
| Claude advisor model | `opus` | Configured in `/var/home/hasnobeef/.claude/settings.json`. |
| Claude configured model evidence | includes `claude-opus-4-7` | Present in `/var/home/hasnobeef/.claude.json`; proves local configuration, not live entitlement. |
| Claude MCP | no user-level MCP servers configured | Verified after owner-approved cleanup; keep strict empty MCP config unless a spec approves otherwise. |

## Owner Calibration

HasNoBeef's operating preference for this fleet:

- `gpt-5.5` is the strongest general-purpose OpenAI/Codex model currently
  routed for BES. Codex is the agent surface; `gpt-5.5` is the model. Do not
  refer to a separate "Codex 5.5" model.
- Claude Opus 4.7 and Opus 4.6 are both frontier Claude lanes. Use Opus 4.7
  when latest Claude behavior or an independent frontier opinion matters. Use
  Opus 4.6 when it is available and offers the better cost, quota, or behavior
  fit for deep technical/spec review. Do not hard-code model recency as
  quality.
- Claude Sonnet with adaptive behavior, when available in the active surface,
  is a useful first-pass Claude lane for creative/product/design synthesis,
  lower-risk implementation support, and token-heavy drafts that may need
  escalation. Treat automatic escalation behavior as `needs-probe` unless the
  current CLI/docs prove it for the configured run.
- Hard work should use high-thinking modes deliberately: Codex `xhigh`; Claude
  `xhigh`, `max` only by exception, and explicit one-off "ultrathink" prompting
  when a review genuinely needs deeper thought.
- Long-context variants are valuable for large repo/doc synthesis, but they are
  not free defaults. Use `opus[1m]`, `sonnet[1m]`, or equivalent only when the
  task clearly benefits and availability/cost is acceptable.
- Weekly usage limits are real scheduling constraints. Route by task, quota,
  current provider cost, and the need for independent model-family review. Use
  the whole fleet instead of spending frontier turns on work that `rg`, tests,
  preflight, or a bounded read-only scan can answer.

## Access Status

Use these terms in specs and handoffs:

| Status | Meaning |
| --- | --- |
| `configured` | Present in local CLI/config. This proves intent, not entitlement. |
| `documented` | Official provider docs describe the model or alias. |
| `needs-probe` | Confirm with `/model`, model picker, or a deliberate test before relying on it. |
| `approved-for-fleet` | Owner has accepted the model for a role in this guide or a task spec. |

## Codex Model Catalog

Verified sources: local Codex config and official OpenAI Codex model docs.

| Model | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `gpt-5.5` | configured, documented, approved-for-fleet | Default root fleet management, non-trivial specs, complex implementation, integration, risky verification, final synthesis, and strongest OpenAI/Codex all-scenario calls. | Cheap fanout scans where depth is not needed. |
| `gpt-5.4` | documented, needs-probe | Fallback when `gpt-5.5` is unavailable or a workflow is pinned to GPT-5.4. | Replacing `gpt-5.5` for high-risk work when `gpt-5.5` is available. |
| `gpt-5.4-mini` | documented, needs-probe | Fast read-heavy exploration, parallel document scans, lightweight subagents, low-risk summarization. | Final integration decisions, ambiguous architecture, high-risk edits. |
| `gpt-5.3-codex` | documented, needs-probe | Agentic coding environments where a workflow is pinned to the coding-specialized line. | New default fleet routing when `gpt-5.5` is available. |
| `gpt-5.3-codex-spark` | documented, needs-probe | Near-instant text-only iteration when latency matters more than breadth. | Tool-heavy implementation, long-context repo synthesis, final verification. |
| `gpt-5.2` / `gpt-5.2-codex` | documented, needs-probe | Legacy or pinned workflows only. | New BES default routing. |

Official OpenAI guidance says `gpt-5.5` is the starting point for most demanding
Codex tasks when available; `gpt-5.4-mini` is the speed/efficiency option for
lighter coding tasks and subagents.

## Claude Model Catalog

Verified sources: local Claude config and official Claude Code model docs.

| Model or alias | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Cheap fanout and routine edits. |
| `claude-opus-4-7` | configured, documented, approved-for-fleet | Frontier coding, high-risk implementation review, architecture/spec critique, public-OSS release review, and independent second-pass code review where latest Claude behavior matters. | Cheap fanout and routine edits. |
| `claude-opus-4-6` | needs-probe, approved-for-fleet | Cost-effective deep technical review, difficult bug analysis, architecture critique, and second-model verification when 4.6 is available and its cost/quality behavior is preferred for the task. | Blind replacement for 4.7 without probing the exact CLI id, availability, and current provider cost/token posture. |
| `sonnet` | documented, needs-probe | Creative/product/design synthesis, adaptive first-pass Claude work when configured, daily Claude coding, implementation support, doc synthesis, repo-local work after approved spec. | Highest-risk coding or architecture calls when Opus 4.7, Opus 4.6, or Codex `gpt-5.5` is available and quota allows. |
| `haiku` | documented, needs-probe | Simple scans, short summaries, low-risk formatting, cheap support work. | Complex code edits, final review, ambiguous specs. |
| `opusplan` | documented, needs-probe | Claude-led work where planning should use Opus and execution should use Sonnet. | Work that must stay strictly on one pinned model. |
| `opus[1m]` / `sonnet[1m]` | documented, needs-probe | Long sessions and large-codebase/document synthesis when account support is confirmed. | Default use; verify availability and cost posture first. |

Official Claude Code guidance says aliases can move over time. Use aliases for
interactive work. Use full model names when reproducibility matters.

## Routing Matrix

| Task class | Primary route | Secondary route | Notes |
| --- | --- | --- | --- |
| Root fleet management | Codex on `gpt-5.5`, `xhigh` | Claude Opus 4.7 or 4.6 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
| Repo orientation | Codex `gpt-5.5` or `gpt-5.4-mini` | Claude `sonnet` | Use faster models only for bounded read-only inventory. |
| New non-trivial SPEC | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 critique | Claude should review ambiguity before high-risk execution; prefer 4.6 when cost/quality fit is better. |
| Spec review | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` | Both for high-risk specs | Use independent review for public OSS, architecture, security, release, or cross-repo work. |
| Implementation from approved spec | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Claude `sonnet` for creative/supporting work | Write-capable agents need branch/worktree isolation and file ownership; probe 4.6 before assigning writes. |
| Fast fanout / document scan | Codex `gpt-5.4-mini` | Claude `haiku` | Return distilled facts to the root agent; do not let scan agents edit. |
| Multi-agent coding | One lead writer on Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Additional writers only on disjoint files/worktrees | Root fleet manager must define ownership and integration order before edits. |
| Creative/product/design synthesis | Claude `sonnet`, preferably adaptive when configured and available | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` for final technical validation | Useful for tone, concepts, narrative, and design exploration; specs still control execution. |
| Code review | Codex `gpt-5.5` with `code-review` | Claude Opus 4.7 or 4.6 | Findings first, severity ordered, with file/line citations. |
| Public OSS release work | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
| Green room product evaluation | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
| Long-context synthesis | Claude Opus 4.7/4.6 `[1m]` or Sonnet `[1m]` after probe | Codex `gpt-5.5` with scoped docs | Use 1M context only when account support and cost posture are acceptable. |
| Trivial local command | Current root agent | None | Do not spawn agents for simple terminal answers. |

## Approved SPEC Decomposition

Run `/decompose-approved-spec` after a SPEC reaches `status:
approved` and before agents begin execution. The phase is
**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
Execution Plan. The approved SPEC remains the immutable execution
authority; decomposition emits durable per-slice TASK.md files
that 1:1 bind to Linear issues and Symphony per-issue workspaces
(`file://agents/skills/approved-spec-decomposition/SKILL.md`,
`file://agents/specs/SPEC.schema.md` §1.4,
`file://specs/2026-05-09-symphony-aligned-execution-layer/SPEC.md`).

Output: one TASK.md per slice at
`specs/<spec_id>/tasks/T-NN-<slug>.md` (or
`.agents/specs/<spec_id>/tasks/...` in child repos). Front-matter
pins the model lanes (primary `model_route`,
`cross_validation_lane`, `verification_lane`), the dispatch mode,
deps, write_scope, and `acceptance_commands`. Body sections are
Goal, Parent SPEC anchor, Scope, Model dispatch, Acceptance,
Evidence (executor fills), Stop conditions, and Linear binding.

Model-lane assignment per task class draws from the Routing Matrix
above:

- `task_class: implementation` → primary Codex `gpt-5.5`,
  cross-validation Claude Opus 4.7/4.6 (different family).
- `task_class: code-review` → cross-family from the implementer.
- `task_class: verification` (behavioral) → different family
  from the implementer; mechanical verification (lint, test) MAY
  share family.
- `task_class: research` / `docs` → fast read lanes acceptable
  for the primary; cross-family reviewer for high-stakes claims.

`cross_validation_lane` MUST be a different model family from
`model_route`. The decomposition skill REFUSES to emit a TASK.md
without cross-family pairing
(`file://agents/skills/approved-spec-decomposition/SKILL.md` Hard
Rules).

Mark a slice `AFK` only when ownership is bounded, acceptance
evidence is explicit, no mid-slice owner judgment is needed, and
the cross-validation lane is configured. Otherwise mark `HITL`.

Owner alone flips the parent SPEC's status `approved →
decomposed`. The decomposition skill MUST NOT.

After all TASK.md reach `status: done`, the parent SPEC's full
`acceptance_commands` run as the integration gate before flipping
`decomposed → in-execution → verified`.

## Usage Load Balancing

Weekly model limits are a fleet constraint. Route work to preserve frontier
capacity:

| Pressure | Routing adjustment |
| --- | --- |
| Codex `gpt-5.5` budget healthy | Use Codex as root lead and primary implementer. |
| Codex `gpt-5.5` budget constrained | Move independent review/spec critique to Claude Opus 4.7 or 4.6; keep Codex for integration and verification if possible. |
| Claude Opus 4.7 budget healthy | Use Opus for spec review, second-pass code review, and high-risk repo work where a different model family adds value. |
| Claude Opus 4.7 budget constrained | Prefer Opus 4.6 for deep technical reviews when available and adequate; keep 4.7 for only the riskiest reviews. |
| Claude Opus 4.6 budget healthy | Use it for deep technical issue review and second-model verification when it preserves quality at lower cost. |
| Both frontier budgets constrained | Stop parallel frontier fanout. Use fast/read-only models for inventory, then queue owner decisions until frontier capacity returns. |
| Creative work with low code risk | Prefer Claude Sonnet/adaptive when available, then validate implementation-impacting decisions with Codex `gpt-5.5`, Opus 4.7, or Opus 4.6. |

Do not spend frontier turns on tasks that can be answered by `rg`, tests,
preflight, or a small read-only scan. Use frontier models for ambiguity,
architecture, code changes, integration, and final calls.

## Dispatch Rules

1. Pick the role before picking the model.
2. Keep Codex as the default root fleet manager and accountable integrator
   unless a SPEC or owner instruction assigns that role elsewhere.
3. Use Claude when an independent opinion is valuable, not just because another
   model exists.
4. Before substantial research, code review, verification, or implementation,
   agents MUST evaluate whether independent work can run in parallel.
5. Agents may initiate Claude or Codex subagents under approved scope when
   delegation is the correct execution shape. State the worker role, model
   route, allowed files or read-only boundary, expected output, and whether
   edits are allowed.
6. Prefer fanout for independent research, code review, documentation
   inventory, static analysis, independent verification, and bounded read-only
   scans when wall-clock savings exceed coordination cost.

codex
The repo policy confirms this is a fleet-source review context, and the requested model lane is valid for spec review. Next I’m reading the local spec-review rules plus the target Decision SPEC, prior review note, and remediation Contract so the verdict is grounded in the amended text.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' agents/skills/spec-review/SKILL.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
---
name: spec-review
description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
---

# Spec Review

Authority: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§10, §11.3, §17.3. Shared schema:
`file://agents/specs/SPEC.schema.md` §5.

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
| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (Symphony-grade) | **REQUIRED** |
| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |

Detailed per-type criteria, including studio-principle additional
checks: see `references/per-type-gates.md`.

## Lint invocation

For `type: contract`, the skill MUST run:

```
bash agents/scripts/lint-spec.sh <spec_path>
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

## Contract capture-after defer-shorthand check (2026-05-17)

Per the 2026-05-17 ceremony-weight-refactor Decision SPEC §7,
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
`file://specs/2026-05-17-ceremony-weight-refactor/SPEC.md` §7
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
    evidence: cmd://bash agents/scripts/lint-spec.sh specs/<id>/SPEC.md (exit 1, "uncited claim at SPEC.md:142")
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
  a model in one family (Codex / Claude), the spec-review pass
  SHOULD be performed by a model from a different family. Same-
  family review is structurally weaker. If the only available
  reviewer is from the same family as the author, record this in
  the Quality Gate Result `evidence` field as
  `same-family-review: <model>` and surface it as an `advisory`
  finding. See `file://agents/MODEL_ROUTING.md` "Routing Matrix"
  row for Spec review and
  `file://specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md`
  §7.3.

## Output to caller

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
  `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
  §10, §11.3, §17.3.
- Per-type criteria:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files -g 'SPEC.md' -g '01-parent-decision.md' -g 'SPEC.schema.md' -g 'SPEC.decision.template.md'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md
specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md
specs/BES-CP-008-agent-control-file-remote-cleanup/SPEC.md
specs/2026-05-18-agentic-installation-methodology/SPEC.md
specs/2026-05-13-framework-refresh-lightweight-ceremony/SPEC.md
specs/2026-04-29-root-control-plane-audit/SPEC.md
specs/2026-05-09-fleet-adopt-worktrunk-execute/SPEC.md
specs/2026-04-29-model-routing-catalog/SPEC.md
specs/2026-05-09-fleet-adopt-worktrunk/SPEC.md
specs/2026-04-29-handoff-triage/SPEC.md
specs/2026-05-09-symphony-aligned-execution-layer/SPEC.md
specs/2026-05-05-tactical-skill-wave-implementation/SPEC.md
agents/specs/SPEC.schema.md
agents/specs/SPEC.decision.template.md
specs/2026-05-05-ai-engineering-tactical-skill-adoption/SPEC.md
specs/2026-04-29-green-room-product-evaluations/SPEC.md
specs/2026-05-05-product-repo-workspace-roots-preflight/SPEC.md
specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md
specs/2026-05-17-ceremony-weight-refactor-execute/SPEC.md
specs/2026-04-29-fleet-realignment-and-handoff/SPEC.md
specs/2026-05-17-contract-corpus-retrospective-audit/SPEC.md
specs/2026-05-02-studio-principle-ai/SPEC.md
specs/2026-05-02-fleet-harness-enhancements/SPEC.md
specs/2026-04-29-company-agent-operating-model/SPEC.md
specs/2026-05-17-cross-family-compliance-audit/SPEC.md
specs/2026-05-17-references-pattern-adoption-wave-2/SPEC.md
specs/2026-05-17-ceremony-weight-refactor/SPEC.md
specs/2026-04-29-claude-user-mcp-cleanup/SPEC.md
specs/2026-04-29-agent-startup-config-repair/SPEC.md
specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC.md
specs/2026-04-29-agent-first-control-plane/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
---
id: 2026-05-18-agentic-installation-methodology
status: verified
type: decision
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
acceptance_commands:
  - bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md
  - bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md
ideated_in: specs/2026-05-18-agentic-installation-methodology/IDEA.md
---

# SPEC: Product B — Agentic Installation Methodology Shape and Scope

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

In Decision SPECs, RFC 2119 keywords appear ONLY in §7. Decision
Statement. They do not appear in any other section of this document.

## 1. Problem

The studio has finished publishing Product A (the agent
operating framework) at v1.1
(`url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`).
Product B — a published methodology explaining how to take any
working product and decompose it into an exhaustive, non-
prescriptive deployment-grade SPEC that user-dispatched coding
agents can install — is the next deliverable. The producing
IDEA at
`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
proposes a hybrid (longread + SPEC bundle) shape with a paired
Product A v2.0 / Product B v1.0 release. The owner directive
`owner://transcript-2026-05-18` ("Do what is the rolls royce")
binds the strongest-rigour disposition across every shape and
attribution question raised in the research workpad at
`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§9. This SPEC encodes that disposition as a binding Decision so
the follow-on execution work (repo standup, repack, authoring,
external validation) can proceed without further owner-blocking
ambiguity.

## 2. Substance Citations

- `file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  — producing IDEA; `status: ready-for-spec`. Owner
  dispositions captured in §7.
- `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  — dispositioned research workpad. §3 transferable building
  blocks; §4 missing facets; §5 packaging shape; §6
  methodology phase structure; §7 BES case-study data; §11.5
  owner dispositions table.
- `file://specs/2026-05-17-sanitized-framework-publication/RESEARCH.md`
  — sibling Product A workpad; Product A v1.1 is the worked
  artefact this Decision binds to repack as v2.0.
- `url://github.com/buildepicshit/agentic-ops-framework`
  — Product A v1.1 shipped artefact (before-state for the
  Phase 3-4 repack walkthrough).
- `url://github.com/openai/symphony/blob/main/SPEC.md`
  — the only in-the-wild operating-model-as-SPEC; primary
  source for the 14 transferable building blocks named in
  research §3.
- `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
  — closest published statement of the agentic-installation
  hypothesis as a risk; Product B publishes it as procedure.
- `owner://transcript-2026-05-18` (verbatim in §3 below).

## 3. Authority Map

Active authority for this decision:

- `owner://transcript-2026-05-18`:
  > "I don't know what does the research suggest — What do we
  > think is the rolls rroyce ?"
  > "Just do what is right for fuck sakes what a stupid
  > question"
  > "Do what is the rolls royce"

  Binds every disposition; affirms the IDEA §5 recommendation
  (Hybrid longread + SPEC bundle, paired release, full
  attribution, all failure modes, all open research questions
  flagged, external cross-family validation gate).

- `file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  — ideated source; §4 candidate space, §5 recommendation,
  §7 owner judgments.
- `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §11.5 — owner-dispositions table (per-question binding
  recorded durably in the research workpad).
- `file://agents/specs/SPEC.schema.md` — citation grammar,
  front-matter schema, RFC 2119 scoping rules.

Stale, superseded, or evidence-only sources:

- `file://specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
  — superseded by the reframed agentic-installation workpad;
  evidence only, not authoritative for this Decision.

Owner decisions required before implementation:

- [x] Publication shape — resolved (Hybrid).
- [x] Phase count — resolved (7 + Phase 0).
- [x] Product A repack — resolved (parallel paired release).
- [x] BES attribution — resolved (fully named).
- [x] Failure-mode disclosure — resolved (all published).
- [x] Open research question disclosure — resolved (all 7
      flagged).
- [x] Cross-family validation timing — resolved (gates
      publication).

No further owner-blocking decisions remain at this Decision
layer. Follow-on Task / Contract SPECs may surface
implementation-level owner questions; those are scoped to
their own gates.

## 4. Decision Criteria

| Criterion | Source | Weight |
|---|---|---|
| Dogfooding strength — does the artefact exemplify what it advocates? | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §5, §8 | high |
| Reader on-ramp — does the artefact land for a first-time reader without an agent? | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §8 ("First-person experiential throughout") | high |
| Honest disclosure — failure modes + open questions visible | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
| Cross-family validation evidence | research §6 Phase 5; `owner://transcript-2026-05-18` | high |
| Authoring cost (elapsed time + coordination overhead) | `judgment://agent-synthesis` from IDEA §4 cost estimates | medium |
| Self-undermining risk (artefact contradicts its own thesis) | `judgment://agent-synthesis` from IDEA §4.3, §4.4 risk analysis | high |

## 5. Candidate Options

### 5.1 Hybrid — longread + SPEC bundle, paired release

- Description: Two paired artefacts in a new public repo
  (`agentic-installation-methodology`): an engineering
  longread (~8-12K words, first-person, BES case-study
  density) plus an authoritative SPEC bundle (front-door
  manifest + per-facet sub-specs covering architecture,
  deployment, behavior, customization, decisions, quality,
  operations, non-goals). Product A is repacked into
  manifest+catalog as v2.0 in parallel; the paired release
  ships both. External cross-family validation pass gates
  publication. (`judgment://agent-synthesis`, see IDEA §4.1.)
- Fit with substance: Maximum — the methodology IS the
  packaging it advocates per research §5.
- Fit with constraints: Maximum — every constraint from IDEA
  §3 satisfied. (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  §3.)
- Cost: Highest of the candidates. Estimate 4-6 weeks elapsed,
  including Product A repack + cross-family validation
  pass. (`judgment://agent-synthesis`.)
- Risk: Scope sprawl mitigated by hard per-facet word limits
  plus facet-level negative-space discipline. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §4.2.)

### 5.2 Methodology AS a SPEC bundle only

- Description: Pure dogfooding; no longread. The methodology
  paper IS the manifest+catalog. Readers consume it the way
  agents do — partial reads per facet. Product A repack +
  cross-family validation still required.
- Fit with substance: Strong — perfect self-conformance.
  (`judgment://agent-synthesis`.)
- Fit with constraints: Weak on reader on-ramp; the
  case-study narrative loses its medium. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §7, §8.)
- Cost: Lower than 5.1 (one artefact shape). Estimate 3-4
  weeks elapsed. (`judgment://agent-synthesis`.)
- Risk: Reader uptake risk — the methodology is novel enough
  that "read it like an agent does" loses humans who would
  otherwise become practitioners. (`judgment://agent-synthesis`.)

### 5.3 Single longread engineering blog (~5-10K words)

- Description: One published post. No SPEC artefact. No
  Product A repack. No cross-family validation gate (nothing
  installable to validate).
- Fit with substance: Weak — the methodology recommends
  spec-as-distribution while publishing as blog.
  (`judgment://agent-synthesis`.)
- Fit with constraints: Weak — self-undermining; the honest-
  posture constraint takes a hit; the dogfooding constraint
  fails outright. (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  §3.)
- Cost: Lowest. Estimate 2-3 weeks elapsed.
  (`judgment://agent-synthesis`.)
- Risk: Reader's first observation lands as critique; the
  artefact undercuts itself. (`judgment://agent-synthesis`.)

### 5.4 Multi-part series (5-7 posts)

- Description: Phase-per-post structure tracking research §6.
  No SPEC artefact. No Product A repack. No cross-family
  validation gate.
- Fit with substance: Weak — same self-undermining problem as
  5.3. (`judgment://agent-synthesis`.)
- Fit with constraints: Weak. (`judgment://agent-synthesis`.)
- Cost: Comparable to 5.3 in total effort, spread over a
  longer elapsed window across 5-7 publishing cycles.
  (`judgment://agent-synthesis`.)
- Risk: Series fatigue; the high-density failure-mode +
  cross-family content lands in parts 5-7 for a smaller
  audience. (`judgment://agent-synthesis`.)

### 5.5 Paper-style (arxiv / workshop) [REJECTED]

Added 2026-05-19 per
`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
§7.A (codex finding 1.1). The original candidate enumeration
omitted this option from research §9 Q1.

- Description: publish the methodology as an
  academic-channel paper (arxiv preprint, workshop
  submission). Same SPEC-bundle as 5.1 could ride along,
  but the primary publication channel is academic
  review + indexing. <!-- lint-ok: no-citation -->
- Fit with substance: Medium — the methodology is novel
  enough to warrant academic framing, but the
  case-study density relies on owner verbatim
  transcripts that don't translate well to academic
  prose conventions.
  (`judgment://agent-synthesis`.)
- Fit with constraints: Weak — academic publication
  introduces review-latency the studio's honest-
  experiential posture treats as friction without
  benefit; the conformance suite (5.1 has it) isn't
  natively academic-channel-shaped.
  (`judgment://agent-synthesis`.)
- Cost: Medium — drafting cost similar to 5.1's
  longread; additional cost is conforming to venue
  templates + responding to reviewers.
  (`judgment://agent-synthesis`.)
- Risk: Channel-fit erosion — the methodology's
  audience is engineers + agents, not academics;
  publishing primarily through academic channels
  reaches the wrong audience first.
  (`judgment://agent-synthesis`.)

### 5.6 SPEC-bundle-only (no longread) [REJECTED]

Added 2026-05-19 per
`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
§7.A (codex finding 1.4). The original §9 Locks list
rejected blog-only / series-only but did not explicitly
foreclose the inverse: SPEC-bundle-only without a
longread.

- Description: ship only the manifest+catalog SPEC
  bundle; no engineering longread. Readers consume
  the methodology the way agents do — partial reads
  per facet.
- Fit with substance: Strong on dogfooding, weak on
  case-study delivery. Identical reasoning to 5.2; this
  candidate is named explicitly to be foreclosed in §9.
  (`judgment://agent-synthesis`.)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '261,620p' specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
- Fit with constraints: Weak — sacrifices the
  case-study density per §8 Posture.
  (`judgment://agent-synthesis`.)
- Cost: Medium-low — one artefact shape.
  (`judgment://agent-synthesis`.)
- Risk: Reader uptake gap; the methodology's narrative
  loses its medium. (`judgment://agent-synthesis`.)

## 6. Trade-off Comparison

| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
|---|---|---|---|---|---|---|
| Dogfooding strength | max | max | min | min | medium | max |
| Reader on-ramp | max | min | medium | medium | weak (academic-audience-only) | min |
| Failure-mode + open-question publication surface | max (longread + bundle non-goals/) | medium (bundle only, no narrative) | medium (longread only, no bundle) | medium (series can land it but disperses) | medium (academic format constrains failure-mode candour) | medium (bundle only, no narrative) |
| Executable conformance + signed-distribution surface | max (bundle includes conformance/ + signed manifest) | max (bundle is the primary) | min (no bundle = no conformance surface) | min | medium (academic supplement could attach) | max |
| Cross-family validation evidence | yes (gates) | yes (gates) | no | no | yes (gates) | yes (gates) |
| Authoring cost | highest | medium-high | lowest | low-medium | medium-high | medium-high |
| Self-undermining risk | low | medium | high | high | medium (channel mismatch) | medium |

Per codex remediation finding 1.3, the "Honest
disclosure" row is renamed to "Failure-mode +
open-question publication surface" — measuring whether
the format lands those as first-class content, not the
generic disclosure intent every shape technically has. <!-- lint-ok: no-citation -->

Per codex remediation finding 1.2, the "Executable
conformance + signed-distribution surface" criterion is
added with high weight, sourced from research §5.1. <!-- lint-ok: no-citation -->

## 7. Decision Statement

The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
SPEC bundle, paired Product A v2.0 / Product B v1.0 release)
as the shape and scope binding for Product B.

The Product B repo `agentic-installation-methodology` SHALL
ship two paired artefacts: an engineering longread
(target 8 000-12 000 words; first-person experiential
posture; BES case-study density; failure modes as first-class
content) and an authoritative SPEC bundle structured as a
front-door manifest plus per-facet sub-specs (architecture,
deployment, behavior, customization, decisions, quality,
operations, non-goals).

The SPEC bundle SHALL include, as **first-class facets**
(not optional extras requiring follow-on amendment), an
executable conformance suite and a signed-distribution
manifest surface per research §5.1 (added 2026-05-19 per
codex remediation finding 1.2). Implementations MAY ship
the conformance suite as a runnable bundle separate from
the prose facets; the signed-distribution surface MAY land
unsigned at the v1.0 release with the signature block
reserved (Sigstore tooling wiring is a v1.x slice), but
the manifest schema MUST include the signature field at
v1.0.

The methodology body SHALL follow the seven phases plus
Phase 0 enumerated in
`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 (Phase 0 maturity check; Phase 1 facet inventory and
classification; Phase 2 parameterization surface; Phase 3
sanitization bar; Phase 4 manifest + catalog composition;
Phase 5 cross-family agent walkthrough; Phase 6 ship; Phase 7
failure modes as first-class content).

The Product A repo `agentic-ops-framework` SHALL be repacked
into the manifest+catalog shape as v2.0 in parallel with
Product B v1.0 authoring; the two artefacts SHALL ship as a
paired release.

BES SHALL be named directly throughout Product B's published
artefacts; the case-study density REQUIRED by research §7
forecloses anonymization.

All four-plus failure modes catalogued in
`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§7 SHALL be published as case data, with sanitization
limited to specific internal SPEC identifiers and
transcripts; the failure-mode patterns themselves are the
value.

All seven open research questions catalogued in
`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§2.3 SHALL be published as flagged-open; Product B MUST NOT
claim to resolve them.

An external cross-family agent validation pass — a
different-family agent attempting to deploy Product A from
the published SPEC bundle alone — SHALL gate Product B
publication. Same-family proxy results MAY inform authoring
but MUST NOT substitute for the external pass.

Product B's authoring MUST itself follow the v1 BES spec
procedure: each follow-on slice (repo standup, repack,
longread authoring, SPEC-bundle authoring, validation pass)
authored as a Task or Contract SPEC under the parent
Decision; cross-family review BLOCKING per slice;
verification gates each before merge.

Implementations of this Decision SHOULD prefer earlier-phase
slices to be authored against Product A's existing v1.1
artefacts (so the repack work in Phase 4 is informed by the
Phase 1-2 facet inventory rather than the other way around).

Implementations MAY parallelize Phase 0-2 (analysis) across
agents while keeping Phase 3-6 (composition + validation) on
a single coordinating agent to preserve voice consistency.

Implementations MAY adopt additional sub-spec facets beyond
the eight catalogued in §6 above when the case-study work
surfaces them, provided the additions are catalogued in the
front-door manifest and named explicitly in a follow-on
Decision SPEC amendment.

## 8. Decision Rationale

Candidate 5.1 was chosen because it is the only candidate
that simultaneously satisfies the dogfooding constraint,
the reader-on-ramp constraint, the failure-mode +
open-question publication-surface constraint, and the
executable-conformance + signed-distribution-surface
constraint (§6 trade-off matrix rows 1-4 post-codex-
remediation 1.2 + 1.3). The cost differential (~4-6
weeks vs. ~2-3 weeks for 5.3) is acceptable given the
strategic value of a paired release that demonstrates the
methodology applied to itself. Owner directive
`owner://transcript-2026-05-18` ("Do what is the
rolls royce") affirms this trade.

Candidate 5.2 was rejected because it sacrifices the
case-study narrative that motivates the methodology in the
first place; research §7 lists the BES failure-mode density
as load-bearing case content that a SPEC-bundle alone cannot
land for human readers
(`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§7).

Candidates 5.3 and 5.4 were rejected because both
fail the dogfooding constraint outright: publishing a
methodology that recommends spec-as-distribution while
shipping only as blog or post-series self-undermines the
artefact. The cost savings do not compensate for the
self-undermining risk
(`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
§4.3, §4.4).

## 9. Locks

Unlocks:

- Standup of the public OSS repo
  `agentic-installation-methodology` (Product B home).
- Repack of `agentic-ops-framework` v1.1 into manifest +
  catalog v2.0.
- Authoring of the longread and per-facet sub-specs as
  follow-on Task / Contract SPECs.
- External cross-family validation engagement as a follow-on
  Task SPEC.
- Paired-release coordination plan as a follow-on Decision or
  Contract SPEC if scope requires.

Forecloses:

- Shipping Product B as any shape-without-SPEC-bundle —
  this consolidates the previously-separate blog-only,
  series-only, paper-style, and bundle-only foreclosures
  per codex remediation finding 1.4 (added 2026-05-19).
  Specifically rejected shapes: blog-only (5.3),
  multi-part series only (5.4), paper-style only (5.5;
  added at this amendment), and SPEC-bundle-only without
  longread (5.2 / 5.6; added at this amendment).
  (Reversible only by superseding this Decision.)
- Anonymizing BES in Product B's published artefacts.
  (Reversible only by superseding this Decision.)
- Publishing Product B before the external cross-family
  validation pass completes. (Reversible only by superseding
  this Decision.)
- Repacking Product A v2.0 as anything other than the
  manifest + catalog shape Product B advocates. (Reversible
  only by superseding this Decision.)
- Treating executable conformance suite or signed-
  distribution surface as optional / extension facets
  (per codex remediation finding 1.2 added 2026-05-19);
  both are first-class facets of the SPEC bundle at v1.0.
  (Reversible only by superseding this Decision.)

## 10. Reversal Plan

Triggers for reconsideration:

- External cross-family validation pass surfaces a structural
  flaw in the manifest+catalog shape that cannot be patched
  without restructuring; the methodology's recommended
  packaging is empirically wrong.
- Owner directive supersedes the rolls-royce framing (cost
  pressure, scope cut, attribution reversal, etc.) with a
  later transcript citation.
- Field state shifts: a peer methodology publication lands
  the same composition (agentic installation + cross-org
  ownership split + manifest+catalog) before Product B ships;
  novelty erodes; reassess scope.

Exit procedure:

1. Author a follow-on Decision SPEC superseding this one;
   cite this SPEC's id in `supersedes:` front-matter.
2. Pause any in-flight follow-on Task SPECs derived from this
   Decision; flag them as `blocked-on-supersede`.
3. Notify dependents: the Product A repack task, the longread
   authoring task, the SPEC bundle authoring task, the
   cross-family validation engagement.
4. Owner approves the superseding Decision; resume execution
   under the new shape.

## 11. Validation Plan

- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
  each is independently feasible if chosen.
- Check 2: Candidate 5.1 (the chosen option) is feasible —
  Product A v1.1 already shipped at
  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
  proves the studio can author + ship public OSS artefacts
  under the v1 procedure; the research workpad's §3, §4, §5
  prove the field-state homework is done; the longread voice
  prove-out is the parent IDEA itself
  (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  §1, §5).
- Check 3: Locks (§9) and Reversal Plan (§10) are populated
  and coherent; every Lock has a matching reversal path.
- Check 4: All seven owner-blocking questions from the
  research workpad are answered in §7 with citations to
  `owner://transcript-2026-05-18`.

## 12. Acceptance Criteria

- [x] AC-1: Decision Statement (§7) names exactly one chosen
      option (Candidate 5.1).
- [x] AC-2: At least 2 candidates compared in §5 with all
      needed fields populated (this SPEC compares 4).
- [x] AC-3: Trade-off matrix (§6) is complete for all
      candidates and criteria (6 × 4 cells filled).
- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
- [x] AC-5: Decision Rationale (§8) cites the trade-off
      matrix and owner judgment.
- [x] AC-6: Completion Report §14 records when and how the
      decision was communicated to dependents (the follow-on
      Task / Contract SPECs that descend from this Decision).
- [x] AC-7: `lint-spec.sh` exits 0 against both IDEA.md and
      SPEC.md (front-matter `acceptance_commands`).

## 13. Open Questions

None at this Decision layer. Implementation-level questions
that surface during follow-on Task / Contract SPEC authoring
are scoped to those SPECs' own gates.

## 14. Completion Report

### 14.1 Files changed

- `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  (new; status: ready-for-spec; 20 citation hits, 0 lint
  errors).
- `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  (new; this artefact; 47 citation hits, 0 lint errors).
- `specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  (modified; status: research → dispositioned; §11.5 owner
  dispositions table appended).

### 14.2 Commands run

- `cmd://bash agents/scripts/lint-spec.sh
  specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  → exit 0 (0 errors, 0 warnings, 20 citation hits).
- `cmd://bash agents/scripts/lint-spec.sh
  specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  → exit 0 (0 errors, 0 warnings, 47 citation hits).
- `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
  family proxy; recorded as `severity: advisory`) →
  recommendation `approve-pending-owner`; structural pass
  (15/15 sections, 4 candidates × 5 fields, 6×4 trade-off
  matrix, RFC 2119 confined to §7).

### 14.3 Verification result

PASS. Decision SPEC is well-formed; all seven Acceptance
Criteria checked; lint clean against both artefacts; review
gate passed (with same-family-proxy advisory recorded).

The Decision cascades by id-citation: follow-on Task / Contract
SPECs that author the slices named in §7 (repo standup,
repack, longread authoring, SPEC-bundle authoring, validation
pass) cite this SPEC's `id`
(`2026-05-18-agentic-installation-methodology`) in their
front-matter `cites_decision:` field and reference the §7
clauses they are implementing.

### 14.4 Residual risk

- **Same-family review caveat**: the Decision SPEC was both
  authored and reviewed by Claude-Opus-4.7 lanes. A cross-
  family pass (Codex) is recommended before any follow-on
  Task SPEC reaches `approved` status; the bias risk in the
  candidate-selection step is real and unmitigated by lint.
  Capture as spec-evidence candidate (§14.5).
- **Scope sprawl**: the §7 Decision Statement enumerates five
  slice classes (standup, repack, longread, SPEC-bundle,
  validation) but does not bound elapsed time, word counts
  per facet, or facet-count ceiling. The follow-on Task /
  Contract SPECs are expected to bound those — if any one
  slice exceeds its bound, escalate via a follow-on Decision
  amendment per §9 (the "Implementations may adopt additional
  sub-spec facets" clause).
- **Cross-family validation engagement cost**: §7 makes
  external cross-family pass a publication gate. The engagement
  shape (which external agent family, what dispatch model,
  what acceptance bar) is unspecified in this Decision and
  pushed to a follow-on Task SPEC. The risk: if external
  validation engagement is harder than estimated, the paired-
  release timeline slips. Owner-visible.

### 14.5 Spec evidence candidates

- **Decision SPECs cascade by id-citation, not TASK.md
  decomposition.** The `approved-spec-decomposition` skill
  correctly refused to emit TASK.md slices against this
  Decision SPEC. Capture as durable lesson: agents authoring
  Decision SPECs should not expect downstream decomposition;
  instead, the Decision binds shape and the §7 enumeration
  becomes the slice list for follow-on Task / Contract SPECs
  that cite the Decision by id. Already documented in
  `file://.claude/skills/approved-spec-decomposition/SKILL.md`
  "Skip when" — this Completion Report reinforces it from the
  Decision-author perspective.
- **Rolls-royce directive as one-shot disposition resolver.**
  `owner://transcript-2026-05-18` ("Do what is the rolls
  royce") resolved 7 owner-blocking questions in one
  utterance. The pattern: when the agent has done the research
  homework and the candidate space is well-articulated, an
  owner directive can disposition multiple questions with a
  single binding statement. Document as authoring pattern for
  the spec-authoring skill's "Grill Before IDEA" section.
- **Decision Statement as slice enumerator.** §7 enumerates
  the slice list (standup, repack, longread, SPEC-bundle,
  validation pass) inside the normative section, which lets
  follow-on Task / Contract SPECs cite specific §7 clauses
  as their parent authority. This is the cascade-by-id-
  citation pattern in action; consider documenting in
  `references/cascade-by-id-citation.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' agents/skills/spec-review/references/per-type-gates.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
# Per-Type Gate Criteria

Detailed criteria for each gate type. Authority:
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §10.
When this file and that SPEC diverge, the SPEC wins and this file
MUST be updated to match.

All criteria are **blocking** unless tagged `advisory`.

## Contents

- IDEA gate (§10.1)
- Task SPEC gate, bar (b) "verifiable" (§10.2)
- Contract SPEC gate, bar (c) "Symphony-grade" (§10.3)
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

## Contract SPEC gate, bar (c) "Symphony-grade" (§10.3)

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
- `agents/scripts/lint-spec.sh` exits 0 on this SPEC (exit 2 is
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

### Studio-principle Decision SPECs — additional check

When the SPEC slug matches `studio-principle-*` (per
`file://agents/skills/spec-authoring/SKILL.md`), apply the
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
  `file://specs/2026-05-02-studio-principle-ai/SPEC_EVIDENCE.md`
  §5 ("Trace-from-verbatim-to-normative is the principle SPEC
  quality signature").

The check is the principle SPEC's quality signature; lint catches
the structural failure (uncited claims) but not the semantic walk
from owner verbatim through IDEA decomposition into the specific §7
clause. The walk is a `spec-review` responsibility for principle
SPECs.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' agents/specs/SPEC.schema.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
# SPEC.schema.md — Shared schema for BES specs

Status: v1
Authority: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§6.1, §8, §10.

This document is the single source of truth for cross-template
conventions used by IDEA.md and the three SPEC.md types
(Task / Contract / Decision). The three SPEC templates and the IDEA
template reference this schema instead of duplicating it.

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
| `owner` | string | REQUIRED | owner identifier | e.g. `HasNoBeef` |
| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `codex-gpt-5.5`, `claude-opus-4-7-1m`, or any other model:lane label |
| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-05-01` |
| `implies_spec_type` | enum | REQUIRED | `task` \| `contract` \| `decision` | drives template selection in `/author-spec` |

Example:

```yaml
---
id: bes-spec-authoring-procedure-v1
spec_id: 2026-05-01-bes-spec-authoring-procedure-v1
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: codex-gpt-5.5  # or claude-opus-4-7-1m, etc. — any model:lane label
brainstormed_on: 2026-05-01
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
| `repo` | string | REQUIRED | repo name | e.g. `bes-fleet-policy` |
| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |

Example (Contract SPEC):

```yaml
---
id: 2026-05-01-bes-spec-authoring-procedure-v1
status: approved
type: contract
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
ideated_in: specs/2026-05-01-bes-spec-authoring-procedure-v1/IDEA.md
acceptance_commands:
  - test -f agents/specs/SPEC.task.template.md
  - bash agents/scripts/lint-spec.sh specs/<id>/SPEC.md
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
                                  │           │ Linear issues created from TASK.md set;
                                  │           │ Symphony picks them up; execution begins
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

**Capture-after exception (owner-only).** A Contract or Decision
SPEC MAY land directly at `status: verified` in the same
change-set as the work it specifies, when the work was implemented
before the SPEC was authored under explicit owner directive
(`owner://transcript-<date>`). The per-type quality gate
(`spec-review`) and citation grammar remain REQUIRED; only the
temporal precedence of SPEC-before-work is waived. Reference
precedent: `file://specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC.md`
and capture SE3 at
`file://specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC_EVIDENCE.md`.
Capture-after is an exception path; routine work follows the
normal lifecycle so the BLOCKING review gate runs before
approval.

### 1.4 TASK.md front-matter

TASK.md is the per-slice executable artefact emitted by the
`approved-spec-decomposition` skill from an approved SPEC's §11
Execution Plan (Task) or §11 / §14 / §15 (Contract). One TASK.md
== one Linear issue == one Symphony per-issue workspace run. The
parent SPEC remains the immutable execution authority; TASK.md
files are NOT peer authorities.

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors Linear active states; only owner sets `done` |
| `owner` | string | REQUIRED | agent id or `unassigned` | |
| `model_route` | string | REQUIRED | model slug from `agents/MODEL_ROUTING.md` Codex or Claude Catalog | primary execution lane |
| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `2026-05-04-agent-parallelism-and-model-routing-v2` §7.1 |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
| `linear_issue` | string \| null | REQUIRED | Linear identifier (e.g. `BES-123`) or `null` | null until decomposition reflected in tracker |

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
justified pushback) per `agents/skills/code-review/SKILL.md` and
`agents/skills/spec-review/SKILL.md`.

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
| `owner://` | `owner://transcript-<YYYY-MM-DD>` | surrounding prose MUST include the verbatim quote |
| `judgment://owner` | literal | binding by ownership not external evidence; MUST be attributable to a transcript moment |
| `judgment://agent-synthesis` | literal | MUST be paired with owner-affirmation captured in transcript (cite via `owner://`) |

Repo-relative `file://` paths are RECOMMENDED. Absolute paths are
RECOMMENDED only when the cited file is outside the repo
(e.g. `file:///tmp/ikto-refs/symphony-spec.md`).

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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find /var/home/hasnobeef -path '*agentic-installation-methodology*' -maxdepth 7 -type f | sort" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 1817ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/COMMIT_EDITMSG
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/HEAD
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/config
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/description
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/applypatch-msg.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/commit-msg.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/fsmonitor-watchman.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/post-update.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/pre-applypatch.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/pre-commit.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/pre-merge-commit.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/pre-push.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/pre-rebase.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/pre-receive.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/prepare-commit-msg.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/push-to-checkout.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/sendemail-validate.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/hooks/update.sample
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/index
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/info/exclude
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/logs/HEAD
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/logs/refs/heads/main
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/00/721d81f761cee49adbf042ada0af7bf7136a5e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/01/80cbf6d13dc6bed1099ad7451b17a39ce4c35c
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/01/856a7e5e409a8309a97ed6f9be4446320e43f5
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/01/b31a02ff45aa691b604917ebc49b6ff577e40f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/04/36bd25a466df9d81084fddc2ab3719961a267e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/04/39b494a8b7529519235753791cb91600e08d40
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/09/a0ecb59690ba2140ea009a0aa30003687f021e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/0b/19c747542a827f92568036cbbbda8051002549
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/0b/6d0c04e94222ca31036f7e881c214ec2a9a010
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/0b/ad588af7ab36950004e637eaccc02b61b961ea
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/0c/d057d5118c9ac8370eecee6e6cb8ee9dc01cf9
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/0e/a3687694913ea4e961f564826e6eb326943085
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/0e/e22946df2f4093626a2e3b8d3b52c979f8463a
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/10/266894f53bb46ef573e8339ea16506b72c1782
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/11/0c2158a9269bf1cd18e20800374f16a111ba57
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/12/a981fad6744537c64dc55c379a6e768c1f1697
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/13/8f660f166f6491af1fdfb7d1adb5c6a84fb483
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/17/77c8bf2d66cf6dc75c3133bd8ca4e149be0d56
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/18/8e1b49b764146896135dd20faa0b5598742d2b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/1c/6bc676516e4b785462b03fe60e10dfc8bd635f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/1c/fe3418bfd84b95f85e54616ea65b234c2cabe7
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/1d/bdd78833bb270adf4e02f2b7a03604bf93eca3
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/1e/80182e9513c2d28959dd2a4c66f61fbf6e7da5
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/20/e92bed7da56286543608546360f0fe01af3a33
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/21/7b2e19ae220d758b8f2893289be94059ad9108
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/22/371e38f2206efefa821cc00196f5047302c9b2
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/23/629976c5413056a5773f53511338daf6faf21b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/23/a44972bf39a67f97ac052f16e399746ee7868e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/25/3a3ef194928b2b8147e238069c515d5aff788c
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/25/76d73d697872d6a2be80a9f6d1a22e3d48b943
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/27/9dbda712c3eddc889ba6d0ade0e77f59129356
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/27/b78b27f3bf68d4c6cf9b5ace5ad0857f71eb46
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/27/f67d00b9da1c66c7b0118c8dc56bc41fbefb8e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/29/26835b925a6348ab1620f24cc858aaba3848d1
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/2b/a063b07278ca523fea7ab96639b3214ffb4b06
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/2c/1a116322bf359b33cae3f207e88464c8ca74d1
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/31/e156a36ac03700b7768a50319f3325c6dbdbbc
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/32/15b38069dea79f1303065952cbb69bb49ad2b3
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/35/09f5ac6a1c5617528bae1a737f3a0a153cc4c4
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/35/a85acd77a59de271d773732ddd95cd640976ad
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/38/65d49a606d98f8064b059a93d56be2c8ef81da
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/39/5948d0a24d13fde9e4185a4c41f7ffa133bc1f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/39/5c5934bbdbef3c425dec6b3390e2008a9bcf11
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/3b/9bb14239d8174707117753b4b49eaa946cb9a7
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/3c/e373d34e338b6a98ab231f0a0db2de5b7bb09d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/3f/74d901c181b1ca93f818607ed7778b4a540fe2
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/43/201d27f12d75ce06c8d330ed537787a3793957
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/44/18ce7f11801054abde43132828c137c491d18b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/44/679bc9e54a9af0891e8cb9a87a33792e6074fa
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/47/99911dfeb99c0a9a01d7ed4e8e54eb1998d0f8
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/47/ef23ef912462bcf6966c5ff98c9138e280137f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/48/608a42b510036f79bf159a56042b7c07f5a82d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/48/784e20e9012269bae0915bb0ce6e57376a49ca
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/49/94f221de7da9f82f4bd90f7a1e4bb0a8824d80
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/49/bf0b320895394d47aebe9263ad3808d7f2b0e6
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/4a/5943130e9f0b5b1be774fa5ff6f740f04e1637
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/4b/3ccb25f5d4e02ec38b9ac729531bf46f50fe02
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/4e/c4a8da3d6f12d562fd126ed26587ed7b8f03c0
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/4f/ce1d0c72b31c89f12e116b0be55ff4c0b6485e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/51/87d61ac45b769018e2656e8b6f66260ba927f3
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/52/2ed82ec513a0a1ddab720623dd25afc4ec815c
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/53/5729e226a83f28f83bb3e3cec9f5951a9a4004
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/53/7ccab33f69818bb74daf3055b397c14bbd04e0
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/54/8c645056bb33bcc4f75c602f487aa642aa6949
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/55/7fbf5ddfe178fb95720082b7e4bde368f27a71
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/59/c7752833cc381977381ef62a0ae44c73b443d3
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/5a/241bb7044edc0532d339fc496a388c9352b638
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/5b/6c4e201cb65db66b905f20fe56f18495320ceb
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/5b/c6041081ab239134b315cbac119a1a7eb63a52
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/5e/3b1416128e3ac608c80addb7eead3b91095500
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/5e/f603c00020214f5733b9a3553ebc8a06097046
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/5f/d79b176dadedfadb5ec8822c47cedb3861d41e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/60/030365a833cc74efcefd472f4042b30893e301
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/61/667687e8cb55e1e4a94835c5b03c566009d62f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/61/78f4ccd07593ebb80dcd29f6c12974754f296f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/66/0e77739550be14c134cf0a4eada6c2a0999886
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/69/ba655ce6f7c2f35a5f524f524b4de55b53794f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/6b/52db71f00a0a76162325bd0221fb6b09c78fd9
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/6c/b14082a77357277f307603e565545c1855af50
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/6d/e922f6aa5e0476442aee5beae36804644050eb
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/70/b59551128da79c698bc1f31bdb45d275d0ae76
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/71/aedfc6d3130054d776f71d809be81d6092d392
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/72/b195735dc9db36fc2b1109e7b15f8f6956fc24
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/73/82e132c03daacd13b5e750ea3d76f5aef81aae
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/73/fc57a71e4024b74623c140d718c4fc109e6702
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/75/57ba268cd4320cdeef86800576c84216c2d458
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/78/2f8bdd4c4b4a4e705aeea52ad9514c970d2d66
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/7a/0bf395249c4083c44a6057848e1ea0afae56ca
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/7a/0fe4130e83176a01a66404d2faedd3de10e673
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/7e/a2cc7338bfc4b188d3909f1486ada7320cacf2
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/7e/a9792d65fcd529e82fac236481b73841b385ed
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/7f/60f4702a4957d4109e45add30d6537c70960ef
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/80/08bf6880c816f9f7be9c5869916de6b8fb5fee
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/82/452cb7e84c13717ae3e3a3f488b9c58187e307
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/83/881ead0094c55e4ba566f03596fc316aea49b4
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/84/6a29272a74a94dc52a8512d3eacf125905ef22
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/84/7029299419a13c4d28af746b850f7701c7f54b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/8e/cd058b1211ce67691fa2db6feb466cd2e78cd9
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/8f/31d93dffcdaa40d2b4863765b24325d0ba7b62
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/90/9f21e45aa662be37342ac7a19f8a1bfc2ed767
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/91/3993ad395de8459904aa1e119e2b444a078030
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/95/4004dc9761cd233e98f3ae0249282913de4a5f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/96/9698f281cb859da92d792d20521ecf3ca9780e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/97/0b673d23bc1b41d0fc3dd5bcfe424d209eb108
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/98/2ef63d43486b8c17306b502a8d88a34bd62972
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/9b/98e70dfc21ff1cb65ad1af3726b323792b1f76
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/9b/c531e56c887d53c32367db8a50408d35efa317
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/9b/d604c7c130daebf56f80aaacafefa947db1a0e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/9c/f26288116e4e1240f6179d8d729b6aa0d2955b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/9e/0807c387bf12ceddb989bf7fc976f68df0b9d9
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a0/7cd0f5be2b5c240eeef10b5df6c111883701dd
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a5/636caa242ab343bee5a2ac317f64ed28aa889d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a6/1fefc803b28ff4bd8f8af27bd26c839ca9f1a4
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a6/5f149ef088b75b1e22a1387d23620ed482dd2b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a7/2a881d7643b167b222393646700d4bcbfc91e2
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a8/c56b0e5a9b055a79ed1e404e0c645d4a26e2e4
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/a8/f90e61e61de422d699cf9e204cb1bbf21f8d11
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ad/07a704687a88c846e9c1fd949d1bbee18d3f54
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ad/9511a1a912e6213a2eeeb0d51eda41e2883d98
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ae/2eb85f2f72d0be5f68a9db8ffd5b951736eba1
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/af/b77bec4dbd4edbd7cd424363e5a39144e9501f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/b1/bbf6fcc146f98a60a6ecd360f642c9dfad0a14
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/b2/970194a61dde9fbce48685a33674f164920f4f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/b3/41139e92d0c0f9fc28f8588c539ae9961b48cd
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/b7/15b0dc8b336c1dc331b091c7884fde2fa9bd67
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/be/ebda39dce19bcf155ee9f928077265d93bd69e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c1/c9d95d57bfa28dfbcdd59f33d21f83b18bd750
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c3/91128e4e4287995b38264238b2a94aa2a6f9aa
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c4/1515c55df7f5e5223e74fc96592abc151ba402
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c5/98e61da5901c6eb31bcbee41318e671238b8fd
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c6/9c99ab581678b49a209c27602225eccbe62dce
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c7/1233c6d883f9ef54a6ca4a57ade74586100f61
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c8/710eeb1beb7fe6a7e47a73128f16798305661d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/c9/48b1f82162a4372910e4d85c8fb4ec8c1f446d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/cb/24f535fc6d10d62778c4b54ee1a3961816bdbb
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/cb/75150de81cc4b7863009084c1b9effb9eb8388
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/cc/38b9f1825938b2f4f150ad014e930c5c730117
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ce/330df7d3f43e864315426029c1d7e2be30ee9f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ce/52308d5419ab6dd8a05e581b033335212136c7
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/d4/b25212035f53b873e9acabe38e9befabdf48aa
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/d5/6bb46f8b6f5817fe690ec01046e0b22ee01c50
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/d5/e7a138762f49a0a7a66f98397d20820a452535
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/d6/f6c015b89b3ca6cdc8baedcd3f63d4c019c7cb
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/d9/2af1c4ba96860158afc2e9c3b09c27cd56e196
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/db/31ff94d466d48f2c85612df0f566660ffe180c
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/dc/a8e9f69658c7f3d33d0b326bbabbea72834231
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e0/eb9bcf5aa7f916f7b91765bc1ee4e6f2faa17b
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e3/3151104aac22fbf71f9bcaa24207db31b867c0
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e3/c7988a38a94149cdf4d197ac6606cd7375d9b7
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e5/552b1fe12cd24756ce491b11aa4590089cee0d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e5/cb3fa6193179a229b88bf4d4f529341bf8894e
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e6/312ff97c0f85fd01000d83f3a67c258d793b66
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e7/18f3464dad41ff9ceccdcd550f6f41adb3d2c3
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e8/a04d5124d2308613813b3d6627899ac1b47796
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/e9/268c1aa796df1be337e1fe8623f67a0357360f
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ec/e5660daf6dab93a66f579e76aa13db30488c20
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ed/c1cd9a47a5afb03bc9d498e38cd368e2558eaa
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/ef/45416b28dc21f994eae007280f5f100f3fedf3
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/f1/f038304d7bb574348e02a0c41271c2833b4ded
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/f3/128f9c8fa9b84f53d6f4d519d49cc24218ea76
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/f5/2fca5195ab0cddbab00042d5c7382bba400bdc
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/fc/5397cc232a264d24246d7c14be1ef4c49aec7d
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/fc/7648a79bb0434b856e7afe5ca922beac144d78
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/fd/f48c5b642f373505ea32dd451aaaebfe2a93dc
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/fe/13fe66c989fec866a97b71ea6821a7c9045508
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/pack/pack-efee73249ba323c6c50606f25cca90275bcf71ff.idx
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/pack/pack-efee73249ba323c6c50606f25cca90275bcf71ff.pack
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/objects/pack/pack-efee73249ba323c6c50606f25cca90275bcf71ff.rev
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/packed-refs
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/refs/heads/main
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/refs/remotes/origin/HEAD
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.git/refs/remotes/origin/main
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.github/workflows/ci.yml
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/.gitignore
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/AGENTS.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/CLAUDE.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/CODE_OF_CONDUCT.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/CONTRIBUTING.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/LICENSE
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/README.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/block-ai-attribution.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/block-edit-on-main.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/block-git-add-all.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/block-push-to-main.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/block-verify-bypass.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/session-start-context.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/hooks/verify-reminder.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/12-factor.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/adr-nygard.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/adr-tools-state.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/arc42.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/c4-model.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/cyclonedx-sbom.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/diataxis.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/json-schema.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/kiro.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/openapi-3-1.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/openspec.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oracle-agent-spec.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/sigstore-cosign.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/spec-kit.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/structurizr-dsl.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/00-SYNTHESIS.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/02-corpus.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/04-longread.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/schema/SPEC.schema.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/check-corpus-completeness.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/lint-spec.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/validate-longread-structure.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/scripts/validate-skill-frontmatter.sh
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/templates/IDEA.template.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/templates/SPEC.contract.template.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/templates/SPEC.decision.template.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/templates/SPEC.fastpath.template.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/templates/SPEC.task.template.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/templates/TASK.template.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/tests/hooks/fixtures/msg-clean.txt
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/tests/hooks/fixtures/msg-with-coauthor.txt
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/tests/hooks/run-tests.sh
/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md
/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md
/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/IDEA.md
/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md

codex
I’ve got the local Decision-gate criteria now. One thing already stands out for the requested target: the amended SPEC is at `status: verified`, so this pass is a semantic re-review, not a normal `/review-spec` status-transition run.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '115,330p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '330,520p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   115	      flagged).
   116	- [x] Cross-family validation timing — resolved (gates
   117	      publication).
   118	
   119	No further owner-blocking decisions remain at this Decision
   120	layer. Follow-on Task / Contract SPECs may surface
   121	implementation-level owner questions; those are scoped to
   122	their own gates.
   123	
   124	## 4. Decision Criteria
   125	
   126	| Criterion | Source | Weight |
   127	|---|---|---|
   128	| Dogfooding strength — does the artefact exemplify what it advocates? | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §5, §8 | high |
   129	| Reader on-ramp — does the artefact land for a first-time reader without an agent? | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §8 ("First-person experiential throughout") | high |
   130	| Honest disclosure — failure modes + open questions visible | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
   131	| Cross-family validation evidence | research §6 Phase 5; `owner://transcript-2026-05-18` | high |
   132	| Authoring cost (elapsed time + coordination overhead) | `judgment://agent-synthesis` from IDEA §4 cost estimates | medium |
   133	| Self-undermining risk (artefact contradicts its own thesis) | `judgment://agent-synthesis` from IDEA §4.3, §4.4 risk analysis | high |
   134	
   135	## 5. Candidate Options
   136	
   137	### 5.1 Hybrid — longread + SPEC bundle, paired release
   138	
   139	- Description: Two paired artefacts in a new public repo
   140	  (`agentic-installation-methodology`): an engineering
   141	  longread (~8-12K words, first-person, BES case-study
   142	  density) plus an authoritative SPEC bundle (front-door
   143	  manifest + per-facet sub-specs covering architecture,
   144	  deployment, behavior, customization, decisions, quality,
   145	  operations, non-goals). Product A is repacked into
   146	  manifest+catalog as v2.0 in parallel; the paired release
   147	  ships both. External cross-family validation pass gates
   148	  publication. (`judgment://agent-synthesis`, see IDEA §4.1.)
   149	- Fit with substance: Maximum — the methodology IS the
   150	  packaging it advocates per research §5.
   151	- Fit with constraints: Maximum — every constraint from IDEA
   152	  §3 satisfied. (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   153	  §3.)
   154	- Cost: Highest of the candidates. Estimate 4-6 weeks elapsed,
   155	  including Product A repack + cross-family validation
   156	  pass. (`judgment://agent-synthesis`.)
   157	- Risk: Scope sprawl mitigated by hard per-facet word limits
   158	  plus facet-level negative-space discipline. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   159	  §4.2.)
   160	
   161	### 5.2 Methodology AS a SPEC bundle only
   162	
   163	- Description: Pure dogfooding; no longread. The methodology
   164	  paper IS the manifest+catalog. Readers consume it the way
   165	  agents do — partial reads per facet. Product A repack +
   166	  cross-family validation still required.
   167	- Fit with substance: Strong — perfect self-conformance.
   168	  (`judgment://agent-synthesis`.)
   169	- Fit with constraints: Weak on reader on-ramp; the
   170	  case-study narrative loses its medium. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   171	  §7, §8.)
   172	- Cost: Lower than 5.1 (one artefact shape). Estimate 3-4
   173	  weeks elapsed. (`judgment://agent-synthesis`.)
   174	- Risk: Reader uptake risk — the methodology is novel enough
   175	  that "read it like an agent does" loses humans who would
   176	  otherwise become practitioners. (`judgment://agent-synthesis`.)
   177	
   178	### 5.3 Single longread engineering blog (~5-10K words)
   179	
   180	- Description: One published post. No SPEC artefact. No
   181	  Product A repack. No cross-family validation gate (nothing
   182	  installable to validate).
   183	- Fit with substance: Weak — the methodology recommends
   184	  spec-as-distribution while publishing as blog.
   185	  (`judgment://agent-synthesis`.)
   186	- Fit with constraints: Weak — self-undermining; the honest-
   187	  posture constraint takes a hit; the dogfooding constraint
   188	  fails outright. (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   189	  §3.)
   190	- Cost: Lowest. Estimate 2-3 weeks elapsed.
   191	  (`judgment://agent-synthesis`.)
   192	- Risk: Reader's first observation lands as critique; the
   193	  artefact undercuts itself. (`judgment://agent-synthesis`.)
   194	
   195	### 5.4 Multi-part series (5-7 posts)
   196	
   197	- Description: Phase-per-post structure tracking research §6.
   198	  No SPEC artefact. No Product A repack. No cross-family
   199	  validation gate.
   200	- Fit with substance: Weak — same self-undermining problem as
   201	  5.3. (`judgment://agent-synthesis`.)
   202	- Fit with constraints: Weak. (`judgment://agent-synthesis`.)
   203	- Cost: Comparable to 5.3 in total effort, spread over a
   204	  longer elapsed window across 5-7 publishing cycles.
   205	  (`judgment://agent-synthesis`.)
   206	- Risk: Series fatigue; the high-density failure-mode +
   207	  cross-family content lands in parts 5-7 for a smaller
   208	  audience. (`judgment://agent-synthesis`.)
   209	
   210	### 5.5 Paper-style (arxiv / workshop) [REJECTED]
   211	
   212	Added 2026-05-19 per
   213	`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   214	§7.A (codex finding 1.1). The original candidate enumeration
   215	omitted this option from research §9 Q1.
   216	
   217	- Description: publish the methodology as an
   218	  academic-channel paper (arxiv preprint, workshop
   219	  submission). Same SPEC-bundle as 5.1 could ride along,
   220	  but the primary publication channel is academic
   221	  review + indexing. <!-- lint-ok: no-citation -->
   222	- Fit with substance: Medium — the methodology is novel
   223	  enough to warrant academic framing, but the
   224	  case-study density relies on owner verbatim
   225	  transcripts that don't translate well to academic
   226	  prose conventions.
   227	  (`judgment://agent-synthesis`.)
   228	- Fit with constraints: Weak — academic publication
   229	  introduces review-latency the studio's honest-
   230	  experiential posture treats as friction without
   231	  benefit; the conformance suite (5.1 has it) isn't
   232	  natively academic-channel-shaped.
   233	  (`judgment://agent-synthesis`.)
   234	- Cost: Medium — drafting cost similar to 5.1's
   235	  longread; additional cost is conforming to venue
   236	  templates + responding to reviewers.
   237	  (`judgment://agent-synthesis`.)
   238	- Risk: Channel-fit erosion — the methodology's
   239	  audience is engineers + agents, not academics;
   240	  publishing primarily through academic channels
   241	  reaches the wrong audience first.
   242	  (`judgment://agent-synthesis`.)
   243	
   244	### 5.6 SPEC-bundle-only (no longread) [REJECTED]
   245	
   246	Added 2026-05-19 per
   247	`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   248	§7.A (codex finding 1.4). The original §9 Locks list
   249	rejected blog-only / series-only but did not explicitly
   250	foreclose the inverse: SPEC-bundle-only without a
   251	longread.
   252	
   253	- Description: ship only the manifest+catalog SPEC
   254	  bundle; no engineering longread. Readers consume
   255	  the methodology the way agents do — partial reads
   256	  per facet.
   257	- Fit with substance: Strong on dogfooding, weak on
   258	  case-study delivery. Identical reasoning to 5.2; this
   259	  candidate is named explicitly to be foreclosed in §9.
   260	  (`judgment://agent-synthesis`.)
   261	- Fit with constraints: Weak — sacrifices the
   262	  case-study density per §8 Posture.
   263	  (`judgment://agent-synthesis`.)
   264	- Cost: Medium-low — one artefact shape.
   265	  (`judgment://agent-synthesis`.)
   266	- Risk: Reader uptake gap; the methodology's narrative
   267	  loses its medium. (`judgment://agent-synthesis`.)
   268	
   269	## 6. Trade-off Comparison
   270	
   271	| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
   272	|---|---|---|---|---|---|---|
   273	| Dogfooding strength | max | max | min | min | medium | max |
   274	| Reader on-ramp | max | min | medium | medium | weak (academic-audience-only) | min |
   275	| Failure-mode + open-question publication surface | max (longread + bundle non-goals/) | medium (bundle only, no narrative) | medium (longread only, no bundle) | medium (series can land it but disperses) | medium (academic format constrains failure-mode candour) | medium (bundle only, no narrative) |
   276	| Executable conformance + signed-distribution surface | max (bundle includes conformance/ + signed manifest) | max (bundle is the primary) | min (no bundle = no conformance surface) | min | medium (academic supplement could attach) | max |
   277	| Cross-family validation evidence | yes (gates) | yes (gates) | no | no | yes (gates) | yes (gates) |
   278	| Authoring cost | highest | medium-high | lowest | low-medium | medium-high | medium-high |
   279	| Self-undermining risk | low | medium | high | high | medium (channel mismatch) | medium |
   280	
   281	Per codex remediation finding 1.3, the "Honest
   282	disclosure" row is renamed to "Failure-mode +
   283	open-question publication surface" — measuring whether
   284	the format lands those as first-class content, not the
   285	generic disclosure intent every shape technically has. <!-- lint-ok: no-citation -->
   286	
   287	Per codex remediation finding 1.2, the "Executable
   288	conformance + signed-distribution surface" criterion is
   289	added with high weight, sourced from research §5.1. <!-- lint-ok: no-citation -->
   290	
   291	## 7. Decision Statement
   292	
   293	The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
   294	SPEC bundle, paired Product A v2.0 / Product B v1.0 release)
   295	as the shape and scope binding for Product B.
   296	
   297	The Product B repo `agentic-installation-methodology` SHALL
   298	ship two paired artefacts: an engineering longread
   299	(target 8 000-12 000 words; first-person experiential
   300	posture; BES case-study density; failure modes as first-class
   301	content) and an authoritative SPEC bundle structured as a
   302	front-door manifest plus per-facet sub-specs (architecture,
   303	deployment, behavior, customization, decisions, quality,
   304	operations, non-goals).
   305	
   306	The SPEC bundle SHALL include, as **first-class facets**
   307	(not optional extras requiring follow-on amendment), an
   308	executable conformance suite and a signed-distribution
   309	manifest surface per research §5.1 (added 2026-05-19 per
   310	codex remediation finding 1.2). Implementations MAY ship
   311	the conformance suite as a runnable bundle separate from
   312	the prose facets; the signed-distribution surface MAY land
   313	unsigned at the v1.0 release with the signature block
   314	reserved (Sigstore tooling wiring is a v1.x slice), but
   315	the manifest schema MUST include the signature field at
   316	v1.0.
   317	
   318	The methodology body SHALL follow the seven phases plus
   319	Phase 0 enumerated in
   320	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   321	§6 (Phase 0 maturity check; Phase 1 facet inventory and
   322	classification; Phase 2 parameterization surface; Phase 3
   323	sanitization bar; Phase 4 manifest + catalog composition;
   324	Phase 5 cross-family agent walkthrough; Phase 6 ship; Phase 7
   325	failure modes as first-class content).
   326	
   327	The Product A repo `agentic-ops-framework` SHALL be repacked
   328	into the manifest+catalog shape as v2.0 in parallel with
   329	Product B v1.0 authoring; the two artefacts SHALL ship as a
   330	paired release.

 succeeded in 0ms:
   330	paired release.
   331	
   332	BES SHALL be named directly throughout Product B's published
   333	artefacts; the case-study density REQUIRED by research §7
   334	forecloses anonymization.
   335	
   336	All four-plus failure modes catalogued in
   337	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   338	§7 SHALL be published as case data, with sanitization
   339	limited to specific internal SPEC identifiers and
   340	transcripts; the failure-mode patterns themselves are the
   341	value.
   342	
   343	All seven open research questions catalogued in
   344	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   345	§2.3 SHALL be published as flagged-open; Product B MUST NOT
   346	claim to resolve them.
   347	
   348	An external cross-family agent validation pass — a
   349	different-family agent attempting to deploy Product A from
   350	the published SPEC bundle alone — SHALL gate Product B
   351	publication. Same-family proxy results MAY inform authoring
   352	but MUST NOT substitute for the external pass.
   353	
   354	Product B's authoring MUST itself follow the v1 BES spec
   355	procedure: each follow-on slice (repo standup, repack,
   356	longread authoring, SPEC-bundle authoring, validation pass)
   357	authored as a Task or Contract SPEC under the parent
   358	Decision; cross-family review BLOCKING per slice;
   359	verification gates each before merge.
   360	
   361	Implementations of this Decision SHOULD prefer earlier-phase
   362	slices to be authored against Product A's existing v1.1
   363	artefacts (so the repack work in Phase 4 is informed by the
   364	Phase 1-2 facet inventory rather than the other way around).
   365	
   366	Implementations MAY parallelize Phase 0-2 (analysis) across
   367	agents while keeping Phase 3-6 (composition + validation) on
   368	a single coordinating agent to preserve voice consistency.
   369	
   370	Implementations MAY adopt additional sub-spec facets beyond
   371	the eight catalogued in §6 above when the case-study work
   372	surfaces them, provided the additions are catalogued in the
   373	front-door manifest and named explicitly in a follow-on
   374	Decision SPEC amendment.
   375	
   376	## 8. Decision Rationale
   377	
   378	Candidate 5.1 was chosen because it is the only candidate
   379	that simultaneously satisfies the dogfooding constraint,
   380	the reader-on-ramp constraint, the failure-mode +
   381	open-question publication-surface constraint, and the
   382	executable-conformance + signed-distribution-surface
   383	constraint (§6 trade-off matrix rows 1-4 post-codex-
   384	remediation 1.2 + 1.3). The cost differential (~4-6
   385	weeks vs. ~2-3 weeks for 5.3) is acceptable given the
   386	strategic value of a paired release that demonstrates the
   387	methodology applied to itself. Owner directive
   388	`owner://transcript-2026-05-18` ("Do what is the
   389	rolls royce") affirms this trade.
   390	
   391	Candidate 5.2 was rejected because it sacrifices the
   392	case-study narrative that motivates the methodology in the
   393	first place; research §7 lists the BES failure-mode density
   394	as load-bearing case content that a SPEC-bundle alone cannot
   395	land for human readers
   396	(`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   397	§7).
   398	
   399	Candidates 5.3 and 5.4 were rejected because both
   400	fail the dogfooding constraint outright: publishing a
   401	methodology that recommends spec-as-distribution while
   402	shipping only as blog or post-series self-undermines the
   403	artefact. The cost savings do not compensate for the
   404	self-undermining risk
   405	(`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   406	§4.3, §4.4).
   407	
   408	## 9. Locks
   409	
   410	Unlocks:
   411	
   412	- Standup of the public OSS repo
   413	  `agentic-installation-methodology` (Product B home).
   414	- Repack of `agentic-ops-framework` v1.1 into manifest +
   415	  catalog v2.0.
   416	- Authoring of the longread and per-facet sub-specs as
   417	  follow-on Task / Contract SPECs.
   418	- External cross-family validation engagement as a follow-on
   419	  Task SPEC.
   420	- Paired-release coordination plan as a follow-on Decision or
   421	  Contract SPEC if scope requires.
   422	
   423	Forecloses:
   424	
   425	- Shipping Product B as any shape-without-SPEC-bundle —
   426	  this consolidates the previously-separate blog-only,
   427	  series-only, paper-style, and bundle-only foreclosures
   428	  per codex remediation finding 1.4 (added 2026-05-19).
   429	  Specifically rejected shapes: blog-only (5.3),
   430	  multi-part series only (5.4), paper-style only (5.5;
   431	  added at this amendment), and SPEC-bundle-only without
   432	  longread (5.2 / 5.6; added at this amendment).
   433	  (Reversible only by superseding this Decision.)
   434	- Anonymizing BES in Product B's published artefacts.
   435	  (Reversible only by superseding this Decision.)
   436	- Publishing Product B before the external cross-family
   437	  validation pass completes. (Reversible only by superseding
   438	  this Decision.)
   439	- Repacking Product A v2.0 as anything other than the
   440	  manifest + catalog shape Product B advocates. (Reversible
   441	  only by superseding this Decision.)
   442	- Treating executable conformance suite or signed-
   443	  distribution surface as optional / extension facets
   444	  (per codex remediation finding 1.2 added 2026-05-19);
   445	  both are first-class facets of the SPEC bundle at v1.0.
   446	  (Reversible only by superseding this Decision.)
   447	
   448	## 10. Reversal Plan
   449	
   450	Triggers for reconsideration:
   451	
   452	- External cross-family validation pass surfaces a structural
   453	  flaw in the manifest+catalog shape that cannot be patched
   454	  without restructuring; the methodology's recommended
   455	  packaging is empirically wrong.
   456	- Owner directive supersedes the rolls-royce framing (cost
   457	  pressure, scope cut, attribution reversal, etc.) with a
   458	  later transcript citation.
   459	- Field state shifts: a peer methodology publication lands
   460	  the same composition (agentic installation + cross-org
   461	  ownership split + manifest+catalog) before Product B ships;
   462	  novelty erodes; reassess scope.
   463	
   464	Exit procedure:
   465	
   466	1. Author a follow-on Decision SPEC superseding this one;
   467	   cite this SPEC's id in `supersedes:` front-matter.
   468	2. Pause any in-flight follow-on Task SPECs derived from this
   469	   Decision; flag them as `blocked-on-supersede`.
   470	3. Notify dependents: the Product A repack task, the longread
   471	   authoring task, the SPEC bundle authoring task, the
   472	   cross-family validation engagement.
   473	4. Owner approves the superseding Decision; resume execution
   474	   under the new shape.
   475	
   476	## 11. Validation Plan
   477	
   478	- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
   479	  each is independently feasible if chosen.
   480	- Check 2: Candidate 5.1 (the chosen option) is feasible —
   481	  Product A v1.1 already shipped at
   482	  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
   483	  proves the studio can author + ship public OSS artefacts
   484	  under the v1 procedure; the research workpad's §3, §4, §5
   485	  prove the field-state homework is done; the longread voice
   486	  prove-out is the parent IDEA itself
   487	  (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   488	  §1, §5).
   489	- Check 3: Locks (§9) and Reversal Plan (§10) are populated
   490	  and coherent; every Lock has a matching reversal path.
   491	- Check 4: All seven owner-blocking questions from the
   492	  research workpad are answered in §7 with citations to
   493	  `owner://transcript-2026-05-18`.
   494	
   495	## 12. Acceptance Criteria
   496	
   497	- [x] AC-1: Decision Statement (§7) names exactly one chosen
   498	      option (Candidate 5.1).
   499	- [x] AC-2: At least 2 candidates compared in §5 with all
   500	      needed fields populated (this SPEC compares 4).
   501	- [x] AC-3: Trade-off matrix (§6) is complete for all
   502	      candidates and criteria (6 × 4 cells filled).
   503	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
   504	- [x] AC-5: Decision Rationale (§8) cites the trade-off
   505	      matrix and owner judgment.
   506	- [x] AC-6: Completion Report §14 records when and how the
   507	      decision was communicated to dependents (the follow-on
   508	      Task / Contract SPECs that descend from this Decision).
   509	- [x] AC-7: `lint-spec.sh` exits 0 against both IDEA.md and
   510	      SPEC.md (front-matter `acceptance_commands`).
   511	
   512	## 13. Open Questions
   513	
   514	None at this Decision layer. Implementation-level questions
   515	that surface during follow-on Task / Contract SPEC authoring
   516	are scoped to those SPECs' own gates.
   517	
   518	## 14. Completion Report
   519	
   520	### 14.1 Files changed

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
     1	Reading additional input from stdin...
     2	OpenAI Codex v0.129.0 (research preview)
     3	--------
     4	workdir: /var/home/hasnobeef/buildepicshit/bes-fleet-policy
     5	model: gpt-5.5
     6	provider: openai
     7	approval: never
     8	sandbox: read-only
     9	reasoning effort: xhigh
    10	reasoning summaries: none
    11	session id: 019e3e4f-78bb-7020-88f7-b81ee3768043
    12	--------
    13	user
    14	Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
    15	codex
    16	I’ll do this as a read-only quality gate: first refresh the repo/workflow context that governs this review, then inspect the Decision SPEC against the IDEA and research workpad with line-anchored findings.
    17	exec
    18	/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|MODEL_ROUTING|spec" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
    19	 succeeded in 0ms:
    20	3:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Assets; reuse_rule=safe for future repo-wide Assets governance and this creature-sandbox workflow in the same workspace; treat branch/worktree state, mounted-drive state, smoke counters, and current spec status as time-specific.
    21	13:- Assets repo, single repo, not nested repos, bes-splash-3d, ProceduralObjects, BuildEpicShit, asset provenance, spec-first, WORKFLOW.md, preflight.mjs
    22	25:## Task 3: Visual-polish spec capture and day-end closeout, partial
    23	29:- rollout_summaries/2026-05-09T23-01-35-KIH0-assets_repo_orientation_procedural_creature_v2_and_visual_po.md (cwd=/var/home/hasnobeef/buildepicshit/Assets, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T16-01-35-019e0ef9-8995-7f72-9181-edaa41d69c4a.jsonl, updated_at=2026-05-17T20:32:31+00:00, thread_id=019e0ef9-8995-7f72-9181-edaa41d69c4a, queued visual-polish spec plus clean stop-for-the-day closeout)
    24	42:- when the user says "see you tomorrow for polish" or "lets clsoe for today, clean up the repo and close ourt cleanbyl" -> stop at a clean handoff, record the next approved slice, and do not start implementation just because the next spec exists [Task 2][Task 3]
    25	51:- The V2 sandbox keeps the existing 2D `Line2D` chain model while adding `set_preset_by_id`, current/obstacle steering, trails, preset-specific visual profiles, and stronger diagnostics [Task 2]
    26	53:- The validation stack that passed for the V2 creature work was `bash .agents/scripts/lint-spec.sh ...`, `python3 tools/procedural_lab/validate_experiments.py procedural/generation/experiments`, Godot headless parse, visible X11 smoke, and `git diff --check` [Task 2]
    27	55:- The queued next slice is `.agents/specs/2026-05-17-procedural-creature-visual-polish-godot/SPEC.md`, which is lint-clean and currently `approved-pending-owner` [Task 3]
    28	65:- Symptom: the next visual-polish implementation starts just because the current sandbox looked good and the next spec was drafted. Cause: closeout language gets mistaken for approval to continue. Fix: if the user says to stop for the day, leave the next slice `approved-pending-owner` and end with a clean handoff [Task 3]
    29	68:scope: Use for ACTOCCATUD retrospective repo audits, spec-inventory passes, tracker cleanup, and approved-route M4 construction-probe implementation.
    30	69:applies_to: cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD; reuse_rule=safe for future orientation, roadmap-gap review, and C#/.NET-plus-Godot probe execution in this checkout family; treat current counts, issue bindings, and verify-environment details as time-specific.
    31	81:## Task 2: Repo reorientation and spec inventory, success
    32	85:- rollout_summaries/2026-05-09T19-49-15-DK7w-m4_construction_probe_tracker_cleanup.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T12-49-15-019e0e49-75f2-7c40-b317-bcc2b27944f2.jsonl, updated_at=2026-05-16T01:23:46+00:00, thread_id=019e0e49-75f2-7c40-b317-bcc2b27944f2, authority-doc audit plus spec inventory and preflight warning capture)
    33	89:- ACTOCCATUD, repo-orientation, GAME_SEED.md, IDEAS_LIBRARY.md, preflight.mjs, .agents/specs, TASK_DIR_COUNT 0, retrospective audit
    34	99:- ACTOCCATUD, repo-orientation, TASK.md, approved-spec-decomposition, MODEL_ROUTING, green-room evaluation, reset tree, docs recovery, linear, verification
    35	119:- approved-pending-owner, status: approved, Wormwright, Signal Wraith, Forked Admiral, Blood Siren, lint-spec.sh, verify-local.sh, be3f0e8
    36	123:- when the user asks to “reorientate” and “do an audit on the full project retrospectively” and to “reopen all the previous spec documents” so the agent can produce “the individuals tasks and roadmap and all the artifacts we missed previously” -> start with retrospective authority/spec-corpus review before implementation [Task 1][Task 2][Task 3]
    37	134:- The latest recorded inventory was `68` specs under `.agents/specs`, `62` `closed`, `1` `verified`, `5` `approved`, and `0` `tasks/` directories; recheck counts on new runs instead of assuming this exact mix is still current [Task 2]
    38	135:- `WORKFLOW.md` treats missing `TASK.md` artifacts as a real execution gap, while `approved-spec-decomposition` and `.agents/workflows/decompose-approved-spec.md` make `TASK.md` the authoritative executable bridge after approval [Task 3]
    39	136:- `MODEL_ROUTING.md` lagged behind the newer TASK-based workflow in the recorded orientation run; when those docs conflict, privilege `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow/skill [Task 3]
    40	139:- The deterministic probe scaffold covers primitive-chain state, deterministic hashing, controlled detachment, collision consequence, readability bands, and a Godot-side presentation adapter; the evidence packet lives at `.agents/specs/2026-05-13-m4-executable-prototype-probes/evidence/construction_probe.md` [Task 1]
    41	141:- The four owner-approved candidate-control contracts were Wormwright portal topology, Signal Wraith visibility / AI, Forked Admiral clone ledger, and Blood Siren self-spend / abandonment; the recorded approval commit was `be3f0e8 spec: approve high-risk hull contracts` [Task 5]
    42	149:- Symptom: older routing docs contradict the TASK-based workflow. Cause: `MODEL_ROUTING.md` drifted behind `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow. Fix: privilege the newer TASK authority docs and flag the mismatch for upstream repair [Task 3]
    43	158:applies_to: cwd=/var/home/hasnobeef/buildepicshit/IKTO; reuse_rule=safe for future IKTO orientation and interruption-handling in this checkout family; treat branch/worktree state, paused execution gates, and current doc mismatches as time-specific.
    44	164:- rollout_summaries/2026-05-03T12-39-26-LwnR-ikto_core_fantasy_control_model_and_approved_decision_spec.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/03/rollout-2026-05-03T05-39-26-019dedd9-cb27-7a02-bdfb-4a6abc45b71f.jsonl, updated_at=2026-05-04T04:06:31+00:00, thread_id=019dedd9-cb27-7a02-bdfb-4a6abc45b71f, reset-era posture and preflight location)
    45	178:- IKTO, repo-orientation, STATUS.md, WORKFLOW.md, AGENTS.md, CLAUDE.md, step-(d) research plan, Godot 4, decomposed, audit-entry-docs.sh, lint-spec.sh, preflight.mjs, hold a moment
    46	184:- when the user asks for "a full project status update" -> lead with current state, paused gate, and next execution step before proposing edits or speculative planning [Task 2]
    47	194:- `.agents/specs/2026-05-13-ikto-prototype-architecture-decisions/research/2026-05-15-step-d-research-plan.md` is the correct place to capture day-0 readiness, candidate lanes, local tool readiness, and initial spike order; it is not the architecture decision itself [Task 2]
    48	195:- `bash .agents/scripts/audit-entry-docs.sh`, `bash .agents/scripts/lint-spec.sh .agents/specs/2026-05-13-ikto-prototype-architecture-decisions/SPEC.md`, `node .agents/scripts/preflight.mjs`, and `git diff --check` all passed in the later status refresh; preflight only warned about unmanaged top-level paths [Task 2]
    49	203:- Symptom: continuing inspection after "hold a moment" creates avoidable interruption. Cause: treating the pause as soft instead of hard. Fix: acknowledge the hold and stop immediately [Task 2]
    50	207:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Assets; reuse_rule=safe for future Assets procedural-research checkpoints and cross-repo handoff into consumers like IKTO; treat branch/worktree state, benchmark counts, and hardware-specific evidence as time-specific.
    51	219:## Task 2: Translate Assets swarm evidence into IKTO-specific next-step framing, success
    52	227:- IKTO, Assets, step by step, cult-count bands, pressure-density reads, same-frame gameplay queries, chamber constraints, Steam Deck, approved spec, handover-ready
    53	233:- when Assets research is being used to inform IKTO -> default to converting the proof into IKTO-specific acceptance criteria rather than re-litigating whether Godot boids are possible [Task 2]
    54	242:- The correct next move for IKTO is not to ask whether Godot boids are possible; it is to define the product gate around cult-count bands, visibility needs, aggregate pressure/density reads, same-frame gameplay queries, chamber/path constraints, player-facing presentation, and target-hardware performance, then write a small approved spec/task set around those gates [Task 2]
    55	248:- Symptom: Assets preflight unmanaged-top-level warnings tempt local repo patches. Cause: treating a fleet-policy layout issue as a product-repo problem. Fix: route those warnings to `bes-fleet-policy` and use a source-first fix path instead of patching Assets ad hoc [Task 1]
    56	251:scope: Use for IKTO design refinement, decision-spec approval/closeout, and Unity prototype proof work after orientation is complete.
    57	252:applies_to: cwd=/var/home/hasnobeef/buildepicshit/IKTO; reuse_rule=safe for future design/spec/prototype work in this checkout family; treat current verified runtime paths and STATUS wording as time-specific.
    58	254:## Task 1: Core fantasy and control-model refinement into an approved decision spec, success
    59	258:- rollout_summaries/2026-05-03T12-39-26-LwnR-ikto_core_fantasy_control_model_and_approved_decision_spec.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/03/rollout-2026-05-03T05-39-26-019dedd9-cb27-7a02-bdfb-4a6abc45b71f.jsonl, updated_at=2026-05-04T04:06:31+00:00, thread_id=019dedd9-cb27-7a02-bdfb-4a6abc45b71f, approved core-fantasy/control-model decision)
    60	262:- absolute devotion, chosen deity contract, Prayer Construction Heroics, central conduit, outside-only powers, constant pressure, FTL fires, object rotation, approved decision spec
    61	297:- The approved decision artefacts live at `.agents/specs/2026-05-03-ikto-core-fantasy-and-control-model/{IDEA,SPEC}.md`; the next likely specs were first playable thesis, base topology model, direct deity actions, and threat model contract [Task 1]
    62	299:- `f508e21 spec: close IKTO core control model` closed the decision spec, and `5384d8e chore: update gitignore reset-era comments` preserved the unrelated `.gitignore` cleanup as a separate commit [Task 2]
    63	302:- `bash tools/unity/verify.sh` is the canonical heavy gate for the current Unity prototype lane, with `bash tools/unity/test-editmode.sh`, `bash .agents/scripts/lint-spec.sh <IDEA|SPEC>`, `node .agents/scripts/preflight.mjs`, and `git diff --check` as the supporting gates [Task 3]
    64	308:- Symptom: an artefact is called "done" while still `approved` with blank checklists/reporting. Cause: conflating substantive approval with administrative closure. Fix: inspect front matter, checklist state, and completion report before claiming closeout [Task 2]
    65	310:- Symptom: Unity verification rewrites tracked scene/project files even though the proof passed. Cause: editor reserialization noise from `bash tools/unity/verify.sh`. Fix: inspect and discard that churn before closeout [Task 3]
    66	311:- Symptom: implementation drifts from naming constraints in the spec. Cause: treating naming as documentation-only. Fix: enforce constraints such as kebab-case route ids in code, not just prose [Task 3]
    67	315:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Assets; reuse_rule=safe for future procedural-object research and lookdev in this workspace; treat generated outputs and local `.agents/` harness files as checkout-specific.
    68	321:- rollout_summaries/2026-05-08T03-07-59-evfA-procedural_objects_stylized_asteroid_research_redo.md (cwd=/var/home/hasnobeef/buildepicshit/Assets, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/07/rollout-2026-05-07T20-07-59-019e058e-6a05-7912-8698-5f9619bf58a2.jsonl, updated_at=2026-05-09T15:18:16+00:00, thread_id=019e058e-6a05-7912-8698-5f9619bf58a2, engine-agnostic procedural-objects spec)
    69	325:- Assets, procedural objects, shaders, UV mapping, engine agnosticish, low-poly toon, .agents ignored, lint-spec.sh, procedural-animation precedent
    70	339:- when the user asks to "look at procedural objects and shaders and things like that" and says "We should research this for both Unity and Godot" while preferring something "engine agnosticish" -> start with research/spec work, not implementation [Task 1]
    71	349:- The owner-approved contract artifacts are `.agents/specs/2026-05-08-procedural-objects-shaders/{IDEA,SPEC}.md`, and the closeout note emphasized explicit file staging only if the owner later wants these preserved in git [Task 1]
    72	352:- The practical verification stack was: `bash .agents/scripts/lint-spec.sh ...`, `python3 ProceduralObjects/lab/01-asteroids/quality_report.py --recipe ... --index ...`, `magick identify ...godot-material-stylized-researched.png`, and direct Godot render checks; the style gate is a field sample that reads like a game object pass, not a labelled material grid [Task 2]
    73	361:# Task Group: bes-fleet-policy source-first policy updates / propagation
    74	362:scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
    75	363:applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
    76	369:- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
    77	373:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
    78	379:- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
    79	389:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
    80	393:- AI engineering, tactical skills, approved-spec-decomposition, caveman, diagnosis, tdd, SKILL_REGISTRY, fleet-files.txt, Assets workspace, local entry docs
    81	397:- when stale fleet docs or workflow rules need changing, the user wants them treated as spec-worthy work, not ad hoc edits [Task 1][Task 2][Task 3]
    82	399:- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
    83	405:- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
    84	407:- The v2 parallelism/model-routing change made `agents/MODEL_ROUTING.md` a required orientation read before dispatch/delegation/model-specific work and added a `Parallel Execution Policy` to `agents/OPERATING_MODEL.md` [Task 1]
    85	412:- The AI-engineering implementation added canonical skills `caveman`, `diagnosis`, `tdd`, and `approved-spec-decomposition`, plus the `decompose-approved-spec` workflow/command; future similar additions should update `agents/SKILL_REGISTRY.md`, `agents/scripts/fleet-files.txt`, `agents/scripts/fleet-sync.sh`, and the `.claude` mirrors together [Task 3]
    86	413:- `Assets` is a separate repo whose root `.gitignore` already ignored `.agents/` and `.claude/`; local entry docs `Assets/{AGENTS,CLAUDE,WORKFLOW}.md` were added as workspace support, and the parent repo's `/Assets/` ignore means those docs are local workspace support unless a future spec changes that posture [Task 3]
    87	418:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]
    88	427:applies_to: cwd=/var/home/hasnobeef/buildepicshit/UsefulIdiots; reuse_rule=safe for future rebuild/spec work in this checkout family; treat STATUS wording and current branch/dirty-state details as time-specific.
    89	437:- UsefulIdiots, LEVEL_SET.md, Round 2, The Verb, over-the-shoulder, Arc Raiders, Saros, foundation rebuild, MODEL_ROUTING
    90	447:- UI.Core.AI, UI.Core.Simulation, approved, paused closeout, next_milestone, lint-spec.sh, git diff --check
    91	453:- when the user gives a brief positive confirmation like `approve` or "perfect lets keep going" during contract work -> treat it as approval to ratify the current spec and continue the current slice [Task 2]
    92	466:- Symptom: orientation drifts from the live repo state after policy changes. Cause: relying on an earlier summary instead of rereading current routing files. Fix: reread `AGENTS.md`, `STATUS.md`, `LEVEL_SET.md`, `WORKFLOW.md`, and `.agents/MODEL_ROUTING.md` before continuing [Task 1]
    93	472:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Floom; reuse_rule=safe for future Floom orientation and proof-of-work implementation in this checkout family; treat branch names, exact test counts, and STATUS framing as time-specific.
    94	497:- when the user asks to inspect "our progress and what is currently happening in the project" -> separate stable platform/compiler progress from demo-driven drift [Task 1]
    95	498:- when the user says "lets completely AXE The GR-001 work like destory it in a fire" -> treat demo-specific drift as disposable when the owner asks for a hard reset [Task 2]
    96	505:- `STATUS.md` still described the broader project as Demo 1 alignment, but the session-specific recovery frame shifted away from GR-001 toward the core compiler thesis [Task 1]
    97	508:- Verification included direct artifact inspection with `rg` for `HospitalRoom`, `hospital.room.review-proxy.v0`, and visible module anchors, not just build/test success [Task 2]
    98	519:applies_to: cwd=/var/home/hasnobeef; reuse_rule=safe for future maintenance and update triage on this host; treat exact package versions, freed disk totals, and staged deployment numbers as time-specific.
    99	550:- The specific failing layers seen so far were `Apps for User: hasnobeef` Flatpak update and `Brew Update` inside `uupd.service`; the strongest durable log handles were `module_fail`, `flatpak update -y`, `exit status 139`, and `Segmentation fault (core dumped)` [Task 1][Task 2]
   100	562:- Symptom: `sed` or similar commands fail on `/etc/polkit-1/rules.d/uupd.rules`. Cause: the path may actually be a directory containing the real file. Fix: inspect with `ls -la` before assuming bad rule contents [Task 1]
   101	563:- Symptom: broad journal warnings distract from the true update blocker. Cause: the durable signal is buried in noise. Fix: focus on `uupd.service` lines naming `Brew Update`, `Apps for User`, or the specific failing CLI first [Task 2]
   102	
   103	codex
   104	The memory refresh points to this repo as the canonical fleet-policy source and confirms that `agents/MODEL_ROUTING.md` is part of required orientation for model-family review. I’m now reading the live authority docs and the three review artefacts rather than relying on that summary.
   105	exec
   106	/home/linuxbrew/.linuxbrew/bin/bash -c 'wc -l STATUS.md agents/OPERATING_MODEL.md agents/MODEL_ROUTING.md specs/2026-05-18-agentic-installation-methodology/SPEC.md specs/2026-05-18-agentic-installation-methodology/IDEA.md specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
   107	 succeeded in 0ms:
   108	   352 STATUS.md
   109	   601 agents/OPERATING_MODEL.md
   110	   349 agents/MODEL_ROUTING.md
   111	   514 specs/2026-05-18-agentic-installation-methodology/SPEC.md
   112	   276 specs/2026-05-18-agentic-installation-methodology/IDEA.md
   113	   563 specs/2026-05-17-agentic-installation-methodology/RESEARCH.md
   114	  2655 total
   115	
   116	exec
   117	/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
   118	 succeeded in 0ms:
   119	exec
   120	/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "cross-family|family|review|BLOCKING|Decision|RFC 2119|MUST|SHOULD|MAY|candidate|Rolls|rolls|reversal|lock" agents/MODEL_ROUTING.md agents/OPERATING_MODEL.md STATUS.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
   121	 succeeded in 0ms:
   122	STATUS.md:36:- Pushes to `main` are administrative. Both `block-edit-on-main.sh`
   123	STATUS.md:37:  and `block-push-to-main.sh` honour `branch_policy: main-direct`
   124	STATUS.md:78:| `2026-05-17-cross-family-compliance-audit` | task | verified |
   125	STATUS.md:81:`verified` implemented §7 of the parent Decision via 5 atomic
   126	STATUS.md:82:commits (template + lint + spec-authoring + spec-review +
   127	STATUS.md:84:spec-evidence-governance pass on the §17.5 SE candidates.
   128	STATUS.md:103:| `2026-05-17-cross-family-compliance-audit` | task | verified |
   129	STATUS.md:105:IDEAs at `draft` (genuine owner-blocking choices):
   130	STATUS.md:109:| `2026-05-17-eval-driven-posture` | decision | draft (Q1-Q4 owner-blocking) |
   131	STATUS.md:110:| `2026-05-17-publish-the-moat` | decision | draft (Q1-Q5 owner-blocking) |
   132	STATUS.md:123:- Add `block-edit-on-main.sh` automated test coverage (29→33) — LANDED.
   133	STATUS.md:127:Wave 2 (Decision-IDEA + audit Task SPEC + Decision SPEC, landed):
   134	STATUS.md:135:- `2026-05-17-ceremony-weight-refactor` Decision SPEC; status:
   135	STATUS.md:140:- `2026-05-17-eval-driven-posture` Decision IDEA — LANDED
   136	STATUS.md:141:  (status: draft; owner-blocking on adopt-vs-status-quo + shape).
   137	STATUS.md:144:- `2026-05-17-cross-family-compliance-audit` Task IDEA —
   138	STATUS.md:148:- `2026-05-17-publish-the-moat` Decision IDEA — LANDED
   139	STATUS.md:149:  (status: draft; owner-blocking publish-or-stay).
   140	STATUS.md:155:  candidates.
   141	STATUS.md:158:  candidates.
   142	STATUS.md:159:- Flip `2026-05-17-cross-family-compliance-audit`
   143	STATUS.md:161:  candidates.
   144	STATUS.md:163:Owner-blocking IDEAs (genuine design choices awaiting owner):
   145	STATUS.md:167:  Q4 blocking-or-non-blocking in verification path.
   146	STATUS.md:178:- `2026-05-17-ceremony-weight-refactor` Decision
   147	STATUS.md:193:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
   148	STATUS.md:203:  `cross-family-compliance-audit`); both produce small Task
   149	STATUS.md:207:- Owner-blocking IDEAs (`eval-driven-posture`,
   150	STATUS.md:216:| Skill progressive-disclosure refactor | LANDED — `agents/skills/<name>/references/` convention codified; spec-review SKILL.md slimmed 325 → 234 lines (per-type gates extracted); spec-authoring SKILL.md slimmed 281 → 206 lines (RA-first + studio-principles extracted) |
   151	STATUS.md:226:- `code-review`
   152	STATUS.md:233:- `spec-review` (BLOCKING; + `references/per-type-gates.md`)
   153	STATUS.md:258:`/idea-capture <slug>`, `/author-spec`, `/review-spec`,
   154	STATUS.md:260:`/review-diff`, `/spec-evidence`, `/symphony-dispatch-check`,
   155	STATUS.md:268:- `block-ai-attribution.sh` — no co-author trailers
   156	STATUS.md:269:- `block-edit-on-main.sh` — protected-branch gate; honours
   157	STATUS.md:271:- `block-git-add-all.sh` — no bulk staging
   158	STATUS.md:272:- `block-push-to-main.sh` — protected-branch push gate; honours
   159	STATUS.md:274:- `block-verify-bypass.sh` — verify gate non-negotiable
   160	STATUS.md:279:real-trigger blocks, false-positive cases (commit messages,
   161	STATUS.md:335:6. Blocking review via `/review-spec` (per-type quality gate +
   162	STATUS.md:338:8. Decompose (BLOCKING for Contract/Task with ≥ 2 slices) via
   163	STATUS.md:341:9. Subagents MUST NOT modify the SPEC except the Completion
   164	STATUS.md:343:10. Cross-validate (BLOCKING) on a different model family before
   165	STATUS.md:344:    each TASK.md flips `in-progress → in-review`.
   166	STATUS.md:352:review, no decomposition.
   167	agents/OPERATING_MODEL.md:13:MAY operate.
   168	agents/OPERATING_MODEL.md:44:  MUST be in the repo's `.gitignore`. The fleet propagation
   169	agents/OPERATING_MODEL.md:47:  procedure available); the content MUST NOT be committed or
   170	agents/OPERATING_MODEL.md:50:  as BLOCKING.
   171	agents/OPERATING_MODEL.md:55:- **Agents MUST NOT be dispatched against PUBLIC OSS repos from the
   172	agents/OPERATING_MODEL.md:57:  `/var/home/hasnobeef/buildepicshit` MUST NOT target Wick or Mimir
   173	agents/OPERATING_MODEL.md:65:  MUST be authored on the assumption that they may end up in the
   174	agents/OPERATING_MODEL.md:70:(internal → OSS or OSS → internal) is a Decision-class spec under
   175	agents/OPERATING_MODEL.md:80:every hook) — MUST be authored in `bes-fleet-policy` first and
   176	agents/OPERATING_MODEL.md:87:- A change to `.agents/skills/spec-review/SKILL.md` in IKTO is
   177	agents/OPERATING_MODEL.md:88:  not a fleet change; it is repo-local drift and MUST be
   178	agents/OPERATING_MODEL.md:89:  rejected at review. The correct workflow is: amend
   179	agents/OPERATING_MODEL.md:90:  `agents/skills/spec-review/SKILL.md` in `bes-fleet-policy`
   180	agents/OPERATING_MODEL.md:96:  command, an ACTOCCATUD-only Godot agent definition) MUST live
   181	agents/OPERATING_MODEL.md:98:  MUST NOT shadow the names of fleet skills, workflows, hooks,
   182	agents/OPERATING_MODEL.md:100:  that's a Decision-class spec authored here.
   183	agents/OPERATING_MODEL.md:101:- Subagents executing a SPEC in a child repo MUST NOT modify
   184	agents/OPERATING_MODEL.md:116:authored as IDEA → SPEC in `bes-fleet-policy/specs/`; review is
   185	agents/OPERATING_MODEL.md:117:blocking; owner approves; propagation lands the artefact + the
   186	agents/OPERATING_MODEL.md:123:2. `AGENTS.md` is the canonical, agent-agnostic entry doc — read by Codex, Cursor, Aider, Copilot, Jules, and other AGENTS-aware tools. Optional agent-specific files (`CLAUDE.md`, `GEMINI.md`, etc.) MAY exist alongside `AGENTS.md` to add tool-specific context; Claude Code reads `CLAUDE.md`, Gemini CLI reads `GEMINI.md`, and so on. The agent-specific files SHOULD import `AGENTS.md` (e.g. `@AGENTS.md`) and MUST NOT carry policy that the agent-agnostic file lacks.
   187	agents/OPERATING_MODEL.md:161:   blockers from current evidence: missing local packages, disabled CI, stale
   188	agents/OPERATING_MODEL.md:164:   workers can classify failures as expected, new, or owner-blocking.
   189	agents/OPERATING_MODEL.md:166:   owner and the primary agent. The conversation MUST resolve the implied spec
   190	agents/OPERATING_MODEL.md:168:   a recommendation, and any owner-blocking questions. Capture the
   191	agents/OPERATING_MODEL.md:172:   MUST NOT appear as evidence in the artefact. See the Step 4 Ideate
   192	agents/OPERATING_MODEL.md:176:   `.agents/specs/SPEC.<type>.template.md`. The chosen type MUST match the
   193	agents/OPERATING_MODEL.md:180:   `spec-review` skill; the gate is blocking.
   194	agents/OPERATING_MODEL.md:186:   output, residual risk, and spec evidence candidates.
   195	agents/OPERATING_MODEL.md:187:11. **Govern evidence**: capture durable lessons as spec evidence candidates.
   196	agents/OPERATING_MODEL.md:193:agent precedes spec authoring. The conversation MUST resolve the implied spec
   197	agents/OPERATING_MODEL.md:195:recommendation, and any owner-blocking questions. Capture it as `IDEA.md` at
   198	agents/OPERATING_MODEL.md:198:conversational inputs but MUST NOT appear as evidence in the artefact (see
   199	agents/OPERATING_MODEL.md:215:spec must define objective evidence, review checkpoints, owner decisions, or a
   200	agents/OPERATING_MODEL.md:221:`owner-blocking`. It may propose options, but those options are not authority
   201	agents/OPERATING_MODEL.md:234:Quality gates are blocking and per-type:
   202	agents/OPERATING_MODEL.md:238:- Decision: bar (b) plus candidate-comparison structure.
   203	agents/OPERATING_MODEL.md:240:The `spec-review` skill enforces these as a blocking gate. A spec MUST NOT
   204	agents/OPERATING_MODEL.md:241:advance to `approved` while any blocking criterion fails. RFC 2119 normative
   205	agents/OPERATING_MODEL.md:242:language applies in IDEA.md, Task SPEC, Contract SPEC, and Decision SPEC's
   206	agents/OPERATING_MODEL.md:243:Decision Statement section.
   207	agents/OPERATING_MODEL.md:253:latitude, provenance/licensing requirements, exact output paths, review
   208	agents/OPERATING_MODEL.md:256:`owner-blocking` instead of generating plausible content.
   209	agents/OPERATING_MODEL.md:292:- A successful run may stop at a handoff/review state; it does not have to
   210	agents/OPERATING_MODEL.md:304:review, decomposition, cross-validation; lands at `status: closed`
   211	agents/OPERATING_MODEL.md:375:(block-git-add-all, block-edit-on-main, block-push-to-main,
   212	agents/OPERATING_MODEL.md:376:block-verify-bypass, block-ai-attribution) and per-repo commit-msg
   213	agents/OPERATING_MODEL.md:412:- Cross-family validation: `wt switch pr:NNN -x codex` to check
   214	agents/OPERATING_MODEL.md:413:  out a primary-lane PR for different-family review.
   215	agents/OPERATING_MODEL.md:429:- **Spec reviewer**: rejects ambiguity, unsafe assumptions, and missing tests.
   216	agents/OPERATING_MODEL.md:439:subagents, model-specific repo workers, or multi-agent reviews.
   217	agents/OPERATING_MODEL.md:442:- Claude is dispatched deliberately for independent review, ambiguity checks,
   218	agents/OPERATING_MODEL.md:448:  behavior versus cost-effective deep technical review.
   219	agents/OPERATING_MODEL.md:462:Before substantial research, code review, verification, or implementation,
   220	agents/OPERATING_MODEL.md:463:agents MUST evaluate whether independent parts of the task can run in
   221	agents/OPERATING_MODEL.md:466:Agents SHOULD parallelize work when it is safe and useful:
   222	agents/OPERATING_MODEL.md:469:- Expected wall-clock savings exceed coordination cost.
   223	agents/OPERATING_MODEL.md:476:Preferred fanout cases are research, code review, documentation inventory,
   224	agents/OPERATING_MODEL.md:480:Implementation work MAY fan out only when write ownership is disjoint or
   225	agents/OPERATING_MODEL.md:481:isolated by branch/worktree. Multiple write-capable agents MUST NOT edit the
   226	agents/OPERATING_MODEL.md:482:same files concurrently, and one primary agent MUST own integration order and
   227	agents/OPERATING_MODEL.md:485:Agents MAY initiate subagents when they judge delegation is the correct
   228	agents/OPERATING_MODEL.md:488:agents MAY check with the owner before dispatch.
   229	agents/OPERATING_MODEL.md:492:coupled single-file edits, urgent blocking steps, and owner-interactive
   230	agents/OPERATING_MODEL.md:493:ideation SHOULD remain local unless the owner explicitly requests fanout.
   231	agents/OPERATING_MODEL.md:522:- `spec-review`
   232	agents/OPERATING_MODEL.md:525:- `code-review`
   233	agents/OPERATING_MODEL.md:538:- Do not promote agent-authored imperatives into durable rules without review.
   234	agents/OPERATING_MODEL.md:550:  ideation conversations and to authoring/review reasoning. Long ideation
   235	agents/OPERATING_MODEL.md:554:  candidates), every factual claim MUST carry a citation prefix from the
   236	agents/OPERATING_MODEL.md:601:- Spec evidence candidates, if any.
   237	agents/MODEL_ROUTING.md:40:| Claude Code | `2.1.126 (Claude Code)` | Peer frontier coding/review lane when dispatched deliberately. |
   238	agents/MODEL_ROUTING.md:55:  fit for deep technical/spec review. Do not hard-code model recency as
   239	agents/MODEL_ROUTING.md:64:  when a review genuinely needs deeper thought.
   240	agents/MODEL_ROUTING.md:69:  current provider cost, and the need for independent model-family review. Use
   241	agents/MODEL_ROUTING.md:107:| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Cheap fanout and routine edits. |
   242	agents/MODEL_ROUTING.md:108:| `claude-opus-4-7` | configured, documented, approved-for-fleet | Frontier coding, high-risk implementation review, architecture/spec critique, public-OSS release review, and independent second-pass code review where latest Claude behavior matters. | Cheap fanout and routine edits. |
   243	agents/MODEL_ROUTING.md:109:| `claude-opus-4-6` | needs-probe, approved-for-fleet | Cost-effective deep technical review, difficult bug analysis, architecture critique, and second-model verification when 4.6 is available and its cost/quality behavior is preferred for the task. | Blind replacement for 4.7 without probing the exact CLI id, availability, and current provider cost/token posture. |
   244	agents/MODEL_ROUTING.md:111:| `haiku` | documented, needs-probe | Simple scans, short summaries, low-risk formatting, cheap support work. | Complex code edits, final review, ambiguous specs. |
   245	agents/MODEL_ROUTING.md:122:| Root fleet management | Codex on `gpt-5.5`, `xhigh` | Claude Opus 4.7 or 4.6 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
   246	agents/MODEL_ROUTING.md:124:| New non-trivial SPEC | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 critique | Claude should review ambiguity before high-risk execution; prefer 4.6 when cost/quality fit is better. |
   247	agents/MODEL_ROUTING.md:125:| Spec review | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` | Both for high-risk specs | Use independent review for public OSS, architecture, security, release, or cross-repo work. |
   248	agents/MODEL_ROUTING.md:130:| Code review | Codex `gpt-5.5` with `code-review` | Claude Opus 4.7 or 4.6 | Findings first, severity ordered, with file/line citations. |
   249	agents/MODEL_ROUTING.md:131:| Public OSS release work | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
   250	agents/MODEL_ROUTING.md:132:| Green room product evaluation | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
   251	agents/MODEL_ROUTING.md:140:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
   252	agents/MODEL_ROUTING.md:161:  cross-validation Claude Opus 4.7/4.6 (different family).
   253	agents/MODEL_ROUTING.md:162:- `task_class: code-review` → cross-family from the implementer.
   254	agents/MODEL_ROUTING.md:163:- `task_class: verification` (behavioral) → different family
   255	agents/MODEL_ROUTING.md:164:  from the implementer; mechanical verification (lint, test) MAY
   256	agents/MODEL_ROUTING.md:165:  share family.
   257	agents/MODEL_ROUTING.md:167:  for the primary; cross-family reviewer for high-stakes claims.
   258	agents/MODEL_ROUTING.md:169:`cross_validation_lane` MUST be a different model family from
   259	agents/MODEL_ROUTING.md:171:without cross-family pairing
   260	agents/MODEL_ROUTING.md:180:decomposed`. The decomposition skill MUST NOT.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
     1	---
     2	id: 2026-05-19-codex-remediation-amendments
     3	status: verified
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-installation-methodology
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-19-codex-remediation-amendments/SPEC.md
    13	cites_decision: 2026-05-18-agentic-installation-methodology
    14	amends:
    15	  - ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
    16	  - ../2026-05-19-primary-source-research-corpus/SPEC.md
    17	  - ../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
    18	---
    19	
    20	# SPEC: Codex Remediation Amendments — Round 4-5 Batch
    21	
    22	Status: Draft v1
    23	Type: Contract (amendments package)
    24	Purpose: consolidate the remaining seven findings from the
    25	codex cross-family review at
    26	`file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md` as
    27	a single coordinated amendment batch. Each numbered §7
    28	sub-amendment patches a specific section of a verified
    29	parent SPEC; this Contract is the binding wrapper so the
    30	owner can approve the batch in one pass rather than
    31	authoring four separate amendment SPECs.
    32	
    33	## Normative Language
    34	
    35	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    36	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    37	document are to be interpreted as described in RFC 2119 and RFC 8174
    38	when, and only when, they appear in all capitals.
    39	
    40	## 1. Problem Statement
    41	
    42	The codex cross-family review at
    43	`file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
    44	returned 27 findings across the methodology arc. Rounds 1-4
    45	of remediation addressed 20 findings via direct edits
    46	(SPEC-text drift corrections, status truth, citation
    47	overreach, broken cross-repo paths, fleet-sync guard, voice
    48	rule, BES leakage, word budget, per-chapter failure notes).
    49	Seven findings remain; each requires an amendment to a
    50	verified parent SPEC's contract surface (not drift
    51	correction):
    52	
    53	- Parent Decision SPEC at
    54	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`:
    55	  findings 1.1, 1.2, 1.3, 1.4 (candidate-space, facet
    56	  classification, trade-off matrix, locks scope).
    57	- Corpus Contract SPEC at
    58	  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`:
    59	  finding 2.3 (source-list expansion).
    60	- v2.0 Repack Contract SPEC at
    61	  `file://../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`:
    62	  findings 3.5, 3.6 (manifest schema expansion + behavior.primary
    63	  field-vs-directory drift).
    64	- Plus one new-tooling Task SPEC obligation (finding 4.2, <!-- lint-ok: no-citation -->
    65	  corpus-citation lint extension) which this Contract names
    66	  as a follow-on without authoring the Task SPEC inline.
    67	
    68	The seven amendments are consolidated here because (a)
    69	they share a single provenance (the codex review); (b)
    70	they're all derived from the same review evidence; (c)
    71	batching them avoids seven separate owner-approval cycles;
    72	(d) the amendments don't share execution dependencies that
    73	would force separate sequencing.
    74	
    75	## 2. Goals and Non-Goals
    76	
    77	Goals:
    78	
    79	- Enumerate the seven amendment patches per §7
    80	  sub-amendments below, each with target SPEC + target
    81	  section + before/after text.
    82	- Document the codex finding each patch derives from for
    83	  audit traceability.
    84	- Bind the amendments to a single approval batch so the
    85	  owner can flip approved-pending-owner → approved in one
    86	  pass.
    87	
    88	Non-goals:
    89	
    90	- Authoring the corpus-citation lint extension itself
    91	  (finding 4.2 — that's a separate Task SPEC).
    92	- Re-running cross-family review on the amended state
    93	  (that's a separate post-remediation slice).
    94	- Retroactively re-tagging v2.0.0 of agentic-ops-framework
    95	  (the v2.0.0 release stands; the manifest-schema
    96	  expansion in §7.E lands as v2.1 when authored).
    97	
    98	## 3. System Overview
    99	
   100	This Contract is **a package of amendment patches**.
   101	Execution is per-§7-sub-amendment direct edit of the named
   102	target SPEC's named section. Each patch is small (≤ ~20
   103	lines of SPEC-text change typically). Verification is per-
   104	patch lint pass on the amended target SPEC.
   105	
   106	The Contract itself does NOT change the framework's
   107	operating model. The parent SPECs being amended retain
   108	their `verified` status; their amendments are recorded
   109	both in this SPEC's §7 and in the targets' own commit
   110	history.
   111	
   112	## 4. Authority Map
   113	
   114	Active authority:
   115	
   116	- `decision-authority://owner:2026-05-19` — owner directive
   117	  "okay we should addreess all of these" authorising
   118	  remediation across all 27 codex findings.
   119	- Codex cross-family review evidence at
   120	  `file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
   121	  + per-target review at
   122	  `file://../../reviews/codex-2026-05-19/01-parent-decision.md`,
   123	  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
   124	  `file://../../reviews/codex-2026-05-19/03-v2-repack.md`,
   125	  `file://../../reviews/codex-2026-05-19/04-longread.md`.
   126	- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
   127	  ("External cross-family validation pass surfaces a
   128	  structural flaw") authorising amendment of the parent
   129	  Decision via this follow-on Contract.
   130	
   131	Stale, superseded, or evidence-only sources: none specific
   132	to this Contract.
   133	
   134	Owner decisions required before implementation:
   135	
   136	- [ ] Approve the seven sub-amendments as a batch
   137	      (`approved-pending-owner` → `approved` on this
   138	      Contract).
   139	
   140	## 5. Code/Docs Reality Check
   141	
   142	- All target SPECs currently exist at the paths cited in <!-- lint-ok: no-citation -->
   143	  §1 and are at status: verified.
   144	- Rounds 1-4 remediation commits are durably landed on <!-- lint-ok: no-citation -->
   145	  origin/main of all three repos.
   146	- The codex review evidence is committed at
   147	  `file://../../reviews/codex-2026-05-19/` (5 files
   148	  including SYNTHESIS).
   149	
   150	## 6. Domain Model
   151	
   152	The amendments span three categories:
   153	
   154	1. **Candidate-space + locks** (parent Decision §5, §6,
   155	   §9): findings 1.1, 1.2, 1.4.
   156	2. **Trade-off matrix** (parent Decision §6): finding
   157	   1.3.
   158	3. **Source-list expansion** (corpus §6.1): finding 2.3.
   159	4. **Schema expansion + drift fix** (v2.0 repack §6.1,
   160	   §8): findings 3.5, 3.6.
   161	5. **New tooling Task SPEC** (queued as follow-on, not
   162	   inline): finding 4.2.
   163	
   164	## 7. Pipeline Specification (the seven sub-amendments)
   165	
   166	### §7.A — Parent Decision §5: add paper-style + bundle-only candidates (finding 1.1, 1.4)
   167	
   168	Target:
   169	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   170	§5 Candidate Options.
   171	
   172	Patch: insert two new candidates §5.5 and §5.6 with the
   173	required fields (Description / Fit-with-substance /
   174	Fit-with-constraints / Cost / Risk), labelled REJECTED
   175	with rationale:
   176	
   177	- §5.5 Paper-style (arxiv / workshop) — rejected because
   178	  it doubles down on the spec-as-distribution claim by
   179	  publishing through an academic channel, but the
   180	  academic channel adds review latency + format
   181	  constraints that conflict with the methodology's
   182	  honest-experiential posture; the longread channel
   183	  delivers the same content with less ceremony.
   184	- §5.6 SPEC-bundle-only (no longread) — rejected because
   185	  it sacrifices the case-study density per parent §8
   186	  Posture; identical reasoning to candidate 5.2 but
   187	  named explicitly as a rejected shape.
   188	
   189	§9 Locks UPDATE: add SPEC-bundle-only and paper-style to
   190	the "Forecloses" list. Move the existing blog-only +
   191	series-only entries into a single "Forecloses
   192	shape-without-SPEC-bundle" entry consolidating both
   193	underspecified-publication-channel options.
   194	
   195	### §7.B — Parent Decision §6 + §7: conformance + signing as first-class facets (finding 1.2)
   196	
   197	Target: parent Decision SPEC §6 Trade-off Comparison + §7
   198	Decision Statement.
   199	
   200	Patch:
   201	
   202	- §6 trade-off criteria UPDATE: add a new criterion
   203	  "executable conformance + signed-distribution
   204	  surface" with high weight, sourced from research §5.1.
   205	- §7 Decision Statement INSERT: a clause stating
   206	  conformance suite + signed distribution are
   207	  **first-class** facets of the SPEC bundle, not
   208	  "additional facets requiring amendment". The §9 Locks
   209	  list moves these from "amend to add" status to
   210	  "REQUIRED at v1.0".
   211	
   212	### §7.C — Parent Decision §6 + §8: disambiguate honest-disclosure matrix row (finding 1.3)
   213	
   214	Target: parent Decision SPEC §6 trade-off matrix +
   215	§8 Decision Rationale row 3 reference.
   216	
   217	Patch:
   218	
   219	- §6 RENAME the "honest disclosure" criterion to
   220	  "failure-mode + open-question publication surface".
   221	  Re-score the candidates so this criterion measures only
   222	  the publication surface (whether the format LANDS
   223	  failure modes + open questions as first-class
   224	  content), not whether they're "disclosed" generically
   225	  (which the longread + SPEC bundle + blog + series all
   226	  technically can).
   227	- §8 UPDATE rationale citing this criterion's new
   228	  precise name.
   229	
   230	### §7.D — Corpus Contract §6.1: source-list expansion (finding 2.3)
   231	
   232	Target:
   233	`file://../2026-05-19-primary-source-research-corpus/SPEC.md`
   234	§6.1 In-scope sources (v1.0).
   235	
   236	Patch: add two REQUIRED v1.0 entries to the §6.1 table
   237	(and bump `SOURCE_LIST_VERSION` to v1.1; updates the
   238	check script's expectation):
   239	
   240	- `json-schema` — JSON Schema spec (Draft 2020-12);
   241	  primary URL `url://json-schema.org/specification.html`.
   242	  Methodology relevance: Helm values-schema + OpenAPI
   243	  3.1 both rely on JSON Schema; the methodology's
   244	  customization sub-spec validates against JSON Schema;
   245	  citing Helm + OpenAPI without citing the underlying
   246	  primitive is a transitive citation gap.
   247	- `cyclonedx-sbom` — CycloneDX SBOM specification;
   248	  primary URL `url://cyclonedx.org/specification/overview/`.
   249	  Methodology relevance: the methodology's audit /
   250	  provenance story (research §4.4 + LeadDev §3
   251	  regulated-environments framing) needs a primary SBOM
   252	  source.
   253	
   254	Two additional candidates flagged but NOT v1.0
   255	mandatory (deferred to v1.1 corpus expansion):
   256	`dev-container-spec`, `slsa-in-toto`. These remain in
   257	§17 Open Questions as v1.1 candidates.
   258	
   259	### §7.E — v2.0 Repack Contract §6.1 + §8: expand manifest schema (finding 3.5)
   260	
   261	Target:
   262	`file://../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
   263	§6.1 + §8.
   264	
   265	Patch: amend the front-door manifest schema to add the
   266	following fields at the top level:
   267	
   268	- `schema_uri` (string, REQUIRED) — URL of the schema
   269	  this manifest conforms to (currently inline at §6.1;
   270	  externalising lets adopters reference a versioned
   271	  remote schema).
   272	- `source_commit` (string, REQUIRED) — git commit SHA the
   273	  bundle was generated from (binds the bundle to its
   274	  source-of-truth state).
   275	- `source_tag` (string, OPTIONAL) — git tag if the bundle
   276	  corresponds to a tagged release.
   277	- Per-facet record fields: `media_type` (string,
   278	  RECOMMENDED), `digest` (string, RECOMMENDED;
   279	  `algorithm:hex` form per OCI Descriptor convention),
   280	  `size` (integer, OPTIONAL), `status` (enum:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"finding 1\\.|1\\.1|1\\.2|1\\.3|1\\.4|candidate-space|paper|bundle-only|Honest|conformance|sign\" /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
14:Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
56:251:scope: Use for IKTO design refinement, decision-spec approval/closeout, and Unity prototype proof work after orientation is complete.
57:252:applies_to: cwd=/var/home/hasnobeef/buildepicshit/IKTO; reuse_rule=safe for future design/spec/prototype work in this checkout family; treat current verified runtime paths and STATUS wording as time-specific.
101:563:- Symptom: broad journal warnings distract from the true update blocker. Cause: the durable signal is buried in noise. Fix: focus on `uupd.service` lines naming `Brew Update`, `Apps for User`, or the specific failing CLI first [Task 2]
144:STATUS.md:163:Owner-blocking IDEAs (genuine design choices awaiting owner):
237:agents/MODEL_ROUTING.md:40:| Claude Code | `2.1.126 (Claude Code)` | Peer frontier coding/review lane when dispatched deliberately. |
241:agents/MODEL_ROUTING.md:107:| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Cheap fanout and routine edits. |
304:   280	slices to be authored against Product A's existing v1.1
353:   329	- Repack of `agentic-ops-framework` v1.1 into manifest +
409:   385	  Product A v1.1 already shipped at
410:   386	  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
572:    32	operating framework) at v1.1
573:    33	(`url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`).
602:    62	  — sibling Product A workpad; Product A v1.1 is the worked
605:    65	  — Product A v1.1 shipped artefact (before-state for the
670:   130	| Honest disclosure — failure modes + open questions visible | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
704:   164	  paper IS the manifest+catalog. Readers consume it the way
707:   167	- Fit with substance: Strong — perfect self-conformance.
752:   212	| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part |
756:   216	| Honest disclosure (failure modes + open questions) | max | medium | min | min |
827:    23	(Product A) at v1.1
828:    24	(`url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`),
851:    47	distribution versioning + signing + verification). The novel
872:    68	  — Product A v1.1, the shipped framework artefact (the
894:    90	  bundle. Product A v1.1's single-tree layout is the
900:    96	  flagged-open, not papered over. The methodology offers a
907:   103	  zero-adoption, decomposition-phase paper-only across 23
943:   139	  authoritative artefact and conformance target.
960:   156	- Sketch: Pure dogfooding. No longread. The methodology paper
963:   159	- Fit: Strongest self-conformance proof. Weakest reader
978:   174	- Fit: Weakest dogfooding signal. The methodology recommends
1012:   208	- Honest posture demands maximum dogfooding. Approach 4.1 is
1100:    16	> the earlier "methodology paper about operating-model extraction"
1161:    77	longer 'deploy 2.1.4' but 'update the spec and hope every
1181:    97	   commands? Reference output? Cryptographic spec signing?
1196:   112	Honest framing: Product B has to publish these as **open
1225:   141	| §17 Three Conformance Profiles | **Core / Extension / Real-Integration tiering** | Reusable conformance harness shape |
1230:   146	§11.1-§11.4 (Linear-bound integration); §12 Prompt Construction;
1286:   202	### 4.4 Spec-as-distribution versioning, signing, verification
1288:   204	OCI signing / Sigstore / Helm provenance exist for build
1301:   217	  spec version; conformance profile claimed; pointers to
1302:   218	  sub-specs by facet; pointer to executable conformance suite;
1304:   220	  as-built deployment manifest; signature.
1323:   235	  - `quality/` — arc42 §10 + 15-factor conformance overlay.
1331:   243	  OpenAPI validators. Agents have a runnable yes/no signal.
1338:   250	  are signed and verifiable.
1362:   274	SPEC? Honest signals:
1369:   281	- The product has an empirical conformance bar — at minimum,
1372:   284	Anti-signals: every install is bespoke; the developer can't
1423:   335	### Phase 6 — Ship separately, cross-link, sign
1426:   338	example). The methodology paper ships standalone (Product B
1445:   357	- **Phase 0 maturity signals**: the 2026-05-17 validation run
1448:   360	  green — empirical floor signal.
1468:   380	  - Decomposition phase paper-only across 23 SPECs
1501:   413	  (c) paper-style (arxiv / workshop);
1518:   430	  paper is overtly a case study; BES is named more directly
1528:   440	- [ ] **Q6**: Honest framing on the 7 open research questions
1585:   493	- `url://12factor.net/` (the conformance overlay)
1605:   513	  (pre-extraction maturity signals; BES case study source)
1609:   517	  (decomposition-phase paper-only case data)
1688:    29	### 1.1 IDEA.md front-matter
1714:    55	### 1.2 SPEC.md front-matter (shared across all three types)
1750:    91	### 1.3 Status state machine
1815:   156	### 1.4 TASK.md front-matter
1829:   170	| `owner` | string | REQUIRED | agent id or `unassigned` | |
1850:   126	| Implementation from approved spec | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Claude `sonnet` for creative/supporting work | Write-capable agents need branch/worktree isolation and file ownership; probe 4.6 before assigning writes. |
1853:   129	| Creative/product/design synthesis | Claude `sonnet`, preferably adaptive when configured and available | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` for final technical validation | Useful for tone, concepts, narrative, and design exploration; specs still control execution. |
1869:   145	`file://agents/specs/SPEC.schema.md` §1.4,
1881:   157	Model-lane assignment per task class draws from the Routing Matrix
1927:I’ve got the main shape of the artefacts. One concrete candidate-space mismatch is already visible: the research owner-question included a paper/arxiv-style option, while the Decision SPEC’s §5 candidate set does not carry that option forward. I’m checking whether that omission is the only blocking issue or whether the matrix/lock language creates additional blockers.
1975:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "paper|arxiv|workshop|longread|series|SPEC bundle|manifest|catalog|external cross-family|validation|anonym|failure|open research" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
1977:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "paper|arxiv|workshop|longread|series|SPEC bundle|manifest|catalog|external cross-family|validation|anonym|failure|open research" specs/2026-05-18-agentic-installation-methodology/IDEA.md specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
1985:130:| Honest disclosure — failure modes + open questions visible | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
1996:164:  paper IS the manifest+catalog. Readers consume it the way
2003:212:| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part |
2004:216:| Honest disclosure (failure modes + open questions) | max | medium | min | min |
2028:329:- Repack of `agentic-ops-framework` v1.1 into manifest +
2054:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:16:> the earlier "methodology paper about operating-model extraction"
2066:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:220:  as-built deployment manifest; signature.
2075:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:338:example). The methodology paper ships standalone (Product B
2078:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:357:- **Phase 0 maturity signals**: the 2026-05-17 validation run
2084:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:380:  - Decomposition phase paper-only across 23 SPECs
2088:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:413:  (c) paper-style (arxiv / workshop);
2094:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:430:  paper is overtly a case study; BES is named more directly
2099:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:440:- [ ] **Q6**: Honest framing on the 7 open research questions
2105:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:517:  (decomposition-phase paper-only case data)
2118:specs/2026-05-18-agentic-installation-methodology/IDEA.md:96:  flagged-open, not papered over. The methodology offers a
2121:specs/2026-05-18-agentic-installation-methodology/IDEA.md:103:  zero-adoption, decomposition-phase paper-only across 23
2136:specs/2026-05-18-agentic-installation-methodology/IDEA.md:156:- Sketch: Pure dogfooding. No longread. The methodology paper
2160:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "architecture|deployment|behavior|customization|decisions|quality|operations|non-goals|conformance|reference implementation|signed" specs/2026-05-18-agentic-installation-methodology/SPEC.md specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
2175:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:141:| §17 Three Conformance Profiles | **Core / Extension / Real-Integration tiering** | Reusable conformance harness shape |
2183:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:217:  spec version; conformance profile claimed; pointers to
2184:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:218:  sub-specs by facet; pointer to executable conformance suite;
2185:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:220:  as-built deployment manifest; signature.
2192:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:235:  - `quality/` — arc42 §10 + 15-factor conformance overlay.
2195:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:250:  are signed and verifiable.
2204:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:281:- The product has an empirical conformance bar — at minimum,
2210:specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:493:- `url://12factor.net/` (the conformance overlay)
2218:specs/2026-05-18-agentic-installation-methodology/SPEC.md:167:- Fit with substance: Strong — perfect self-conformance.
2231:   §5 omits the upstream `paper-style (arxiv / workshop)` publication candidate from `RESEARCH.md:410-417`. The IDEA also dropped it at `IDEA.md:127`. Add it as a candidate or explicitly justify why it is not in the Decision candidate space.
2234:   The chosen hybrid shape preserves only manifest + eight sub-spec facets, but research’s packaging primitive also includes executable conformance suite and signed bundle at `RESEARCH.md:216-250`. A different-family implementer would likely group these as top-level `conformance/verification` and `provenance/signing/release`, not optional extra facets. `SPEC.md:288-292` makes “additional facets” require amendment, which compounds the mismatch.
2237:   The “Honest disclosure” matrix row is underspecified/mis-scored. The criterion at `SPEC.md:130` is visibility of failure modes + open questions, but longread/series/spec-only formats can still disclose those. The row appears to conflate disclosure with dogfooding and cross-family validation, already separate rows at `SPEC.md:214` and `SPEC.md:217`. This weakens the rationale at `SPEC.md:296-299`.
2240:   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
2256:   §5 omits the upstream `paper-style (arxiv / workshop)` publication candidate from `RESEARCH.md:410-417`. The IDEA also dropped it at `IDEA.md:127`. Add it as a candidate or explicitly justify why it is not in the Decision candidate space.
2259:   The chosen hybrid shape preserves only manifest + eight sub-spec facets, but research’s packaging primitive also includes executable conformance suite and signed bundle at `RESEARCH.md:216-250`. A different-family implementer would likely group these as top-level `conformance/verification` and `provenance/signing/release`, not optional extra facets. `SPEC.md:288-292` makes “additional facets” require amendment, which compounds the mismatch.
2262:   The “Honest disclosure” matrix row is underspecified/mis-scored. The criterion at `SPEC.md:130` is visibility of failure modes + open questions, but longread/series/spec-only formats can still disclose those. The row appears to conflate disclosure with dogfooding and cross-family validation, already separate rows at `SPEC.md:214` and `SPEC.md:217`. This weakens the rationale at `SPEC.md:296-299`.
2265:   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md | sed -n '220,360p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   220	agents/OPERATING_MODEL.md:463:agents MUST evaluate whether independent parts of the task can run in
   221	agents/OPERATING_MODEL.md:466:Agents SHOULD parallelize work when it is safe and useful:
   222	agents/OPERATING_MODEL.md:469:- Expected wall-clock savings exceed coordination cost.
   223	agents/OPERATING_MODEL.md:476:Preferred fanout cases are research, code review, documentation inventory,
   224	agents/OPERATING_MODEL.md:480:Implementation work MAY fan out only when write ownership is disjoint or
   225	agents/OPERATING_MODEL.md:481:isolated by branch/worktree. Multiple write-capable agents MUST NOT edit the
   226	agents/OPERATING_MODEL.md:482:same files concurrently, and one primary agent MUST own integration order and
   227	agents/OPERATING_MODEL.md:485:Agents MAY initiate subagents when they judge delegation is the correct
   228	agents/OPERATING_MODEL.md:488:agents MAY check with the owner before dispatch.
   229	agents/OPERATING_MODEL.md:492:coupled single-file edits, urgent blocking steps, and owner-interactive
   230	agents/OPERATING_MODEL.md:493:ideation SHOULD remain local unless the owner explicitly requests fanout.
   231	agents/OPERATING_MODEL.md:522:- `spec-review`
   232	agents/OPERATING_MODEL.md:525:- `code-review`
   233	agents/OPERATING_MODEL.md:538:- Do not promote agent-authored imperatives into durable rules without review.
   234	agents/OPERATING_MODEL.md:550:  ideation conversations and to authoring/review reasoning. Long ideation
   235	agents/OPERATING_MODEL.md:554:  candidates), every factual claim MUST carry a citation prefix from the
   236	agents/OPERATING_MODEL.md:601:- Spec evidence candidates, if any.
   237	agents/MODEL_ROUTING.md:40:| Claude Code | `2.1.126 (Claude Code)` | Peer frontier coding/review lane when dispatched deliberately. |
   238	agents/MODEL_ROUTING.md:55:  fit for deep technical/spec review. Do not hard-code model recency as
   239	agents/MODEL_ROUTING.md:64:  when a review genuinely needs deeper thought.
   240	agents/MODEL_ROUTING.md:69:  current provider cost, and the need for independent model-family review. Use
   241	agents/MODEL_ROUTING.md:107:| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Cheap fanout and routine edits. |
   242	agents/MODEL_ROUTING.md:108:| `claude-opus-4-7` | configured, documented, approved-for-fleet | Frontier coding, high-risk implementation review, architecture/spec critique, public-OSS release review, and independent second-pass code review where latest Claude behavior matters. | Cheap fanout and routine edits. |
   243	agents/MODEL_ROUTING.md:109:| `claude-opus-4-6` | needs-probe, approved-for-fleet | Cost-effective deep technical review, difficult bug analysis, architecture critique, and second-model verification when 4.6 is available and its cost/quality behavior is preferred for the task. | Blind replacement for 4.7 without probing the exact CLI id, availability, and current provider cost/token posture. |
   244	agents/MODEL_ROUTING.md:111:| `haiku` | documented, needs-probe | Simple scans, short summaries, low-risk formatting, cheap support work. | Complex code edits, final review, ambiguous specs. |
   245	agents/MODEL_ROUTING.md:122:| Root fleet management | Codex on `gpt-5.5`, `xhigh` | Claude Opus 4.7 or 4.6 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
   246	agents/MODEL_ROUTING.md:124:| New non-trivial SPEC | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 critique | Claude should review ambiguity before high-risk execution; prefer 4.6 when cost/quality fit is better. |
   247	agents/MODEL_ROUTING.md:125:| Spec review | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` | Both for high-risk specs | Use independent review for public OSS, architecture, security, release, or cross-repo work. |
   248	agents/MODEL_ROUTING.md:130:| Code review | Codex `gpt-5.5` with `code-review` | Claude Opus 4.7 or 4.6 | Findings first, severity ordered, with file/line citations. |
   249	agents/MODEL_ROUTING.md:131:| Public OSS release work | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
   250	agents/MODEL_ROUTING.md:132:| Green room product evaluation | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
   251	agents/MODEL_ROUTING.md:140:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
   252	agents/MODEL_ROUTING.md:161:  cross-validation Claude Opus 4.7/4.6 (different family).
   253	agents/MODEL_ROUTING.md:162:- `task_class: code-review` → cross-family from the implementer.
   254	agents/MODEL_ROUTING.md:163:- `task_class: verification` (behavioral) → different family
   255	agents/MODEL_ROUTING.md:164:  from the implementer; mechanical verification (lint, test) MAY
   256	agents/MODEL_ROUTING.md:165:  share family.
   257	agents/MODEL_ROUTING.md:167:  for the primary; cross-family reviewer for high-stakes claims.
   258	agents/MODEL_ROUTING.md:169:`cross_validation_lane` MUST be a different model family from
   259	agents/MODEL_ROUTING.md:171:without cross-family pairing
   260	agents/MODEL_ROUTING.md:180:decomposed`. The decomposition skill MUST NOT.
   261	agents/MODEL_ROUTING.md:194:| Codex `gpt-5.5` budget constrained | Move independent review/spec critique to Claude Opus 4.7 or 4.6; keep Codex for integration and verification if possible. |
   262	agents/MODEL_ROUTING.md:195:| Claude Opus 4.7 budget healthy | Use Opus for spec review, second-pass code review, and high-risk repo work where a different model family adds value. |
   263	agents/MODEL_ROUTING.md:196:| Claude Opus 4.7 budget constrained | Prefer Opus 4.6 for deep technical reviews when available and adequate; keep 4.7 for only the riskiest reviews. |
   264	agents/MODEL_ROUTING.md:197:| Claude Opus 4.6 budget healthy | Use it for deep technical issue review and second-model verification when it preserves quality at lower cost. |
   265	agents/MODEL_ROUTING.md:212:4. Before substantial research, code review, verification, or implementation,
   266	agents/MODEL_ROUTING.md:213:   agents MUST evaluate whether independent work can run in parallel.
   267	agents/MODEL_ROUTING.md:218:6. Prefer fanout for independent research, code review, documentation
   268	agents/MODEL_ROUTING.md:220:   scans when wall-clock savings exceed coordination cost.
   269	agents/MODEL_ROUTING.md:222:   single-file edits, urgent blocking steps, and owner-interactive planning
   270	agents/MODEL_ROUTING.md:229:10. Multiple spec authors/reviewers are encouraged for important work because
   271	agents/MODEL_ROUTING.md:234:12. For decomposed approved specs, review worker output first for SPEC
   272	agents/MODEL_ROUTING.md:236:13. For public OSS repos, prefer review/spec work first and avoid public CI churn
   273	agents/MODEL_ROUTING.md:244:    model family has verified the evaluation packet.
   274	agents/MODEL_ROUTING.md:249:    reviews. Set an expected wait budget in the root status update and do not
   275	agents/MODEL_ROUTING.md:251:    process exits badly, violates scope, exceeds the planned wall-clock budget,
   276	agents/MODEL_ROUTING.md:260:Claude independent spec review:
   277	agents/MODEL_ROUTING.md:268:  "Read AGENTS.md, CLAUDE.md, WORKFLOW.md, and the target SPEC.md. Review only. Return blockers, ambiguity, unsafe assumptions, missing verification, and owner decisions. Do not edit files."
   278	agents/MODEL_ROUTING.md:282:Claude cost-effective deep technical review candidate:
   279	
   280	exec
   281	/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '261,560p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
   282	exec
   283	/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
   284	 succeeded in 0ms:
   285	   261	All seven open research questions catalogued in
   286	   262	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   287	   263	§2.3 SHALL be published as flagged-open; Product B MUST NOT
   288	   264	claim to resolve them.
   289	   265	
   290	   266	An external cross-family agent validation pass — a
   291	   267	different-family agent attempting to deploy Product A from
   292	   268	the published SPEC bundle alone — SHALL gate Product B
   293	   269	publication. Same-family proxy results MAY inform authoring
   294	   270	but MUST NOT substitute for the external pass.
   295	   271	
   296	   272	Product B's authoring MUST itself follow the v1 BES spec
   297	   273	procedure: each follow-on slice (repo standup, repack,
   298	   274	longread authoring, SPEC-bundle authoring, validation pass)
   299	   275	authored as a Task or Contract SPEC under the parent
   300	   276	Decision; cross-family review BLOCKING per slice;
   301	   277	verification gates each before merge.
   302	   278	
   303	   279	Implementations of this Decision SHOULD prefer earlier-phase
   304	   280	slices to be authored against Product A's existing v1.1
   305	   281	artefacts (so the repack work in Phase 4 is informed by the
   306	   282	Phase 1-2 facet inventory rather than the other way around).
   307	   283	
   308	   284	Implementations MAY parallelize Phase 0-2 (analysis) across
   309	   285	agents while keeping Phase 3-6 (composition + validation) on
   310	   286	a single coordinating agent to preserve voice consistency.
   311	   287	
   312	   288	Implementations MAY adopt additional sub-spec facets beyond
   313	   289	the eight catalogued in §6 above when the case-study work
   314	   290	surfaces them, provided the additions are catalogued in the
   315	   291	front-door manifest and named explicitly in a follow-on
   316	   292	Decision SPEC amendment.
   317	   293	
   318	   294	## 8. Decision Rationale
   319	   295	
   320	   296	Candidate 5.1 was chosen because it is the only candidate
   321	   297	that satisfies the dogfooding constraint, the reader-on-ramp
   322	   298	constraint, and the honest-disclosure constraint
   323	   299	simultaneously (§6 trade-off matrix; rows 1-3). The cost
   324	   300	differential (~4-6 weeks vs. ~2-3 weeks for 5.3) is
   325	   301	acceptable given the strategic value of a paired release
   326	   302	that demonstrates the methodology applied to itself. Owner
   327	   303	directive `owner://transcript-2026-05-18` ("Do what is the
   328	   304	rolls royce") affirms this trade.
   329	   305	
   330	   306	Candidate 5.2 was rejected because it sacrifices the
   331	   307	case-study narrative that motivates the methodology in the
   332	   308	first place; research §7 lists the BES failure-mode density
   333	   309	as load-bearing case content that a SPEC-bundle alone cannot
   334	   310	land for human readers
   335	   311	(`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   336	   312	§7).
   337	   313	
   338	   314	Candidates 5.3 and 5.4 were rejected because both
   339	   315	fail the dogfooding constraint outright: publishing a
   340	   316	methodology that recommends spec-as-distribution while
   341	   317	shipping only as blog or post-series self-undermines the
   342	   318	artefact. The cost savings do not compensate for the
   343	   319	self-undermining risk
   344	   320	(`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   345	   321	§4.3, §4.4).
   346	   322	
   347	   323	## 9. Locks
   348	   324	
   349	   325	Unlocks:
   350	   326	
   351	   327	- Standup of the public OSS repo
   352	   328	  `agentic-installation-methodology` (Product B home).
   353	   329	- Repack of `agentic-ops-framework` v1.1 into manifest +
   354	   330	  catalog v2.0.
   355	   331	- Authoring of the longread and per-facet sub-specs as
   356	   332	  follow-on Task / Contract SPECs.
   357	   333	- External cross-family validation engagement as a follow-on
   358	   334	  Task SPEC.
   359	   335	- Paired-release coordination plan as a follow-on Decision or
   360	   336	  Contract SPEC if scope requires.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '164,230p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   164	## 7. Pipeline Specification (the seven sub-amendments)
   165	
   166	### §7.A — Parent Decision §5: add paper-style + bundle-only candidates (finding 1.1, 1.4)
   167	
   168	Target:
   169	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   170	§5 Candidate Options.
   171	
   172	Patch: insert two new candidates §5.5 and §5.6 with the
   173	required fields (Description / Fit-with-substance /
   174	Fit-with-constraints / Cost / Risk), labelled REJECTED
   175	with rationale:
   176	
   177	- §5.5 Paper-style (arxiv / workshop) — rejected because
   178	  it doubles down on the spec-as-distribution claim by
   179	  publishing through an academic channel, but the
   180	  academic channel adds review latency + format
   181	  constraints that conflict with the methodology's
   182	  honest-experiential posture; the longread channel
   183	  delivers the same content with less ceremony.
   184	- §5.6 SPEC-bundle-only (no longread) — rejected because
   185	  it sacrifices the case-study density per parent §8
   186	  Posture; identical reasoning to candidate 5.2 but
   187	  named explicitly as a rejected shape.
   188	
   189	§9 Locks UPDATE: add SPEC-bundle-only and paper-style to
   190	the "Forecloses" list. Move the existing blog-only +
   191	series-only entries into a single "Forecloses
   192	shape-without-SPEC-bundle" entry consolidating both
   193	underspecified-publication-channel options.
   194	
   195	### §7.B — Parent Decision §6 + §7: conformance + signing as first-class facets (finding 1.2)
   196	
   197	Target: parent Decision SPEC §6 Trade-off Comparison + §7
   198	Decision Statement.
   199	
   200	Patch:
   201	
   202	- §6 trade-off criteria UPDATE: add a new criterion
   203	  "executable conformance + signed-distribution
   204	  surface" with high weight, sourced from research §5.1.
   205	- §7 Decision Statement INSERT: a clause stating
   206	  conformance suite + signed distribution are
   207	  **first-class** facets of the SPEC bundle, not
   208	  "additional facets requiring amendment". The §9 Locks
   209	  list moves these from "amend to add" status to
   210	  "REQUIRED at v1.0".
   211	
   212	### §7.C — Parent Decision §6 + §8: disambiguate honest-disclosure matrix row (finding 1.3)
   213	
   214	Target: parent Decision SPEC §6 trade-off matrix +
   215	§8 Decision Rationale row 3 reference.
   216	
   217	Patch:
   218	
   219	- §6 RENAME the "honest disclosure" criterion to
   220	  "failure-mode + open-question publication surface".
   221	  Re-score the candidates so this criterion measures only
   222	  the publication surface (whether the format LANDS
   223	  failure modes + open questions as first-class
   224	  content), not whether they're "disclosed" generically
   225	  (which the longread + SPEC bundle + blog + series all
   226	  technically can).
   227	- §8 UPDATE rationale citing this criterion's new
   228	  precise name.
   229	
   230	### §7.D — Corpus Contract §6.1: source-list expansion (finding 2.3)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '112,132p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   112	## 4. Authority Map
   113	
   114	Active authority:
   115	
   116	- `decision-authority://owner:2026-05-19` — owner directive
   117	  "okay we should addreess all of these" authorising
   118	  remediation across all 27 codex findings.
   119	- Codex cross-family review evidence at
   120	  `file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
   121	  + per-target review at
   122	  `file://../../reviews/codex-2026-05-19/01-parent-decision.md`,
   123	  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
   124	  `file://../../reviews/codex-2026-05-19/03-v2-repack.md`,
   125	  `file://../../reviews/codex-2026-05-19/04-longread.md`.
   126	- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
   127	  ("External cross-family validation pass surfaces a
   128	  structural flaw") authorising amendment of the parent
   129	  Decision via this follow-on Contract.
   130	
   131	Stale, superseded, or evidence-only sources: none specific
   132	to this Contract.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md | sed -n '2218,2272p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
  2218	specs/2026-05-18-agentic-installation-methodology/SPEC.md:167:- Fit with substance: Strong — perfect self-conformance.
  2219	specs/2026-05-18-agentic-installation-methodology/SPEC.md:232:front-door manifest plus per-facet sub-specs (architecture,
  2220	specs/2026-05-18-agentic-installation-methodology/SPEC.md:233:deployment, behavior, customization, decisions, quality,
  2221	specs/2026-05-18-agentic-installation-methodology/SPEC.md:234:operations, non-goals).
  2222	
  2223	codex
  2224	**Quality Gate Result**
  2225	
  2226	Result: **FAIL - blocking revision required**. Review was read-only; no mutations. `lint-spec.sh` passes for both IDEA and SPEC, but the cross-family substance gate does not pass.
  2227	
  2228	**Findings**
  2229	
  2230	1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
  2231	   §5 omits the upstream `paper-style (arxiv / workshop)` publication candidate from `RESEARCH.md:410-417`. The IDEA also dropped it at `IDEA.md:127`. Add it as a candidate or explicitly justify why it is not in the Decision candidate space.
  2232	
  2233	2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
  2234	   The chosen hybrid shape preserves only manifest + eight sub-spec facets, but research’s packaging primitive also includes executable conformance suite and signed bundle at `RESEARCH.md:216-250`. A different-family implementer would likely group these as top-level `conformance/verification` and `provenance/signing/release`, not optional extra facets. `SPEC.md:288-292` makes “additional facets” require amendment, which compounds the mismatch.
  2235	
  2236	3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
  2237	   The “Honest disclosure” matrix row is underspecified/mis-scored. The criterion at `SPEC.md:130` is visibility of failure modes + open questions, but longread/series/spec-only formats can still disclose those. The row appears to conflate disclosure with dogfooding and cross-family validation, already separate rows at `SPEC.md:214` and `SPEC.md:217`. This weakens the rationale at `SPEC.md:296-299`.
  2238	
  2239	4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
  2240	   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
  2241	
  2242	**Checks Passed**
  2243	
  2244	RFC 2119 use is clean: only boilerplate definition lines and §7 normative clauses were found. I did not find a binding misuse of the rolls-royce owner framing; it is applied consistently as the strongest-rigour resolver. The issue is incomplete carry-through, not the owner directive itself.
  2245	
  2246	
  2247	tokens used
  2248	157,952
  2249	**Quality Gate Result**
  2250	
  2251	Result: **FAIL - blocking revision required**. Review was read-only; no mutations. `lint-spec.sh` passes for both IDEA and SPEC, but the cross-family substance gate does not pass.
  2252	
  2253	**Findings**
  2254	
  2255	1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
  2256	   §5 omits the upstream `paper-style (arxiv / workshop)` publication candidate from `RESEARCH.md:410-417`. The IDEA also dropped it at `IDEA.md:127`. Add it as a candidate or explicitly justify why it is not in the Decision candidate space.
  2257	
  2258	2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
  2259	   The chosen hybrid shape preserves only manifest + eight sub-spec facets, but research’s packaging primitive also includes executable conformance suite and signed bundle at `RESEARCH.md:216-250`. A different-family implementer would likely group these as top-level `conformance/verification` and `provenance/signing/release`, not optional extra facets. `SPEC.md:288-292` makes “additional facets” require amendment, which compounds the mismatch.
  2260	
  2261	3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
  2262	   The “Honest disclosure” matrix row is underspecified/mis-scored. The criterion at `SPEC.md:130` is visibility of failure modes + open questions, but longread/series/spec-only formats can still disclose those. The row appears to conflate disclosure with dogfooding and cross-family validation, already separate rows at `SPEC.md:214` and `SPEC.md:217`. This weakens the rationale at `SPEC.md:296-299`.
  2263	
  2264	4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
  2265	   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.
  2266	
  2267	**Checks Passed**
  2268	
  2269	RFC 2119 use is clean: only boilerplate definition lines and §7 normative clauses were found. I did not find a binding misuse of the rolls-royce owner framing; it is applied consistently as the strongest-rigour resolver. The issue is incomplete carry-through, not the owner directive itself.
  2270	
  2271	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '200,255p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   200	  loudly? Fall back? Ask the user? Ask the community?
   201	
   202	### 4.4 Spec-as-distribution versioning, signing, verification
   203	
   204	OCI signing / Sigstore / Helm provenance exist for build
   205	outputs. None of them apply cleanly to intent specs that
   206	produce variable build outputs by construction. Product B has
   207	to propose (not solve) what this looks like.
   208	
   209	## 5. Recommended Packaging Shape
   210	
   211	**Not** a monolithic SPEC.md. Per the research, a **manifest +
   212	catalog hybrid** wins.
   213	
   214	### 5.1 The shape
   215	
   216	- **Front-door manifest** (machine-readable, YAML/JSON) names:
   217	  spec version; conformance profile claimed; pointers to
   218	  sub-specs by facet; pointer to executable conformance suite;
   219	  pointer to SBOM / dependency manifest; pointer to
   220	  as-built deployment manifest; signature.
   221	- **Sub-specs categorized by facet**:
   222	  - `architecture/` — C4 Container-level (Structurizr DSL
   223	    preferred for machine-readability); arc42 §3, §5
   224	    Building Block View.
   225	  - `deployment/` — devcontainers / Helm / Kubernetes
   226	    manifests / Nix flake / Docker compose — pick whichever
   227	    matches the product; specify the customization knobs in
   228	    structured-data form.
   229	  - `behavior/` — Gherkin / Cucumber executable acceptance
   230	    OR contract tests OR OpenAPI / AsyncAPI / GraphQL SDL.
   231	  - `customization/` — the catalog of variability + deferral
   232	    contract (§4.1 above; NOVEL facet).
   233	  - `decisions/` — ADRs (Nygard format), append-only,
   234	    superseded-by-link.
   235	  - `quality/` — arc42 §10 + 15-factor conformance overlay.
   236	  - `operations/` — failure classes × recovery (Symphony §14
   237	    pattern); observability layering (Symphony §13 pattern);
   238	    safety invariants (Symphony §9.5 pattern).
   239	  - `non-goals/` — facet-level negative space (§4.2 above;
   240	    NOVEL facet).
   241	- **Conformance suite as executable bundle** (separate from
   242	  prose specs) — Cucumber feature files, contract tests,
   243	  OpenAPI validators. Agents have a runnable yes/no signal.
   244	- **Reference implementation** (separate, optional) — one
   245	  worked instance demonstrating the spec, deliberately in a
   246	  language family different from the audience's expected
   247	  target (Symphony's Elixir choice is the pattern). NOT
   248	  load-bearing; the spec is the contract.
   249	- **Signed bundle** — OCI artefact or similar; spec versions
   250	  are signed and verifiable.
   251	
   252	### 5.2 Why this beats monolithic SPEC
   253	
   254	- **Partial reads** — agents fetch only the facet they need at
   255	  the moment (`customization/` to learn knobs; `behavior/` to

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '395,425p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   395	  inherently a case study. "We tried this and X happened" is
   396	  the dominant voice.
   397	- **Methodology offered, not prescribed** — "Here's how we
   398	  did it; we suspect it generalizes; try it on your own
   399	  practice and tell us what we got wrong."
   400	- **Failure modes as first-class content** — the honest
   401	  posture demands documenting what didn't work.
   402	- **Open research questions disclosed honestly** — the seven
   403	  questions in §2.3 are not solved; the methodology helps
   404	  ADDRESS them but does not pretend to RESOLVE them.
   405	
   406	## 9. Open Questions for Owner
   407	
   408	Tier 1 — shape:
   409	
   410	- [ ] **Q1**: Methodology publication shape. Options:
   411	  (a) single longread engineering blog (~5-10K words);
   412	  (b) multi-part series (5-7 posts);
   413	  (c) paper-style (arxiv / workshop);
   414	  (d) the methodology itself published AS a SPEC bundle
   415	  (manifest + catalog) — eats its own dogfood;
   416	  (e) hybrid (longread for narrative + spec bundle for
   417	  reference). `owner-blocking`.
   418	- [ ] **Q2**: Phase count + structure. §6 above proposes 7
   419	  phases + Phase 0. Owner may prefer fewer for readability,
   420	  or more for rigor. `owner-blocking`.
   421	- [ ] **Q3**: Format alternative to monolithic SPEC for
   422	  Product A itself. The research strongly recommends manifest
   423	  + catalog over single SPEC.md. Confirm Product A also
   424	  adopts this packaging, or stay with thin-framework + ref-
   425	  impl as already decided? `owner-blocking`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '330,388p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   330	different Claude lane) attempt to deploy the product as a brand-
   331	new installer using only the published spec. Surface where the
   332	spec was under-specified or assumed too much. Document the gap
   333	report.
   334	
   335	### Phase 6 — Ship separately, cross-link, sign
   336	
   337	The framework spec ships standalone (Product A is BES's
   338	example). The methodology paper ships standalone (Product B
   339	is this work). Conformance suite ships as a versioned bundle.
   340	Each cites the other. The article(s) cite both.
   341	
   342	### Phase 7 — Publish failure modes as first-class content
   343	
   344	The novel addition. For each phase, document:
   345	- Things tried and abandoned
   346	- Sanitization moves that failed
   347	- Preconditions that turned out to be studio-specific
   348	- Ambiguities the validation walkthrough surfaced
   349	- Open research questions per §2.3 the methodology cannot
   350	  solve and must flag
   351	
   352	## 7. BES as Worked Case Study
   353	
   354	The published methodology uses BES's own extraction as the
   355	worked example. Specifically:
   356	
   357	- **Phase 0 maturity signals**: the 2026-05-17 validation run
   358	  (`file://specs/2026-05-17-operating-model-validation-run/RESEARCH.md`)
   359	  showed 21/23 SPECs closed, lint 12/12 clean, hooks 33/33
   360	  green — empirical floor signal.
   361	- **Phase 1 facet inventory**: the internal audit
   362	  (commissioned for Product A) classified every component
   363	  into generalizable / mixed / studio-specific buckets.
   364	- **Phase 2 parameterization surface**: distributed (multiple
   365	  `fleet-manifest`-style configs are needed, not a single
   366	  one).
   367	- **Phase 3 sanitization bar**: drop ALL studio context per
   368	  `owner://transcript-2026-05-17`; generalize
   369	  `owner://` → `decision-authority://<role>`.
   370	- **Phase 4 manifest + catalog**: the BES sanitized framework
   371	  repo (Product A) IS the worked example of the catalog
   372	  shape.
   373	- **Phase 5 cross-family walkthrough**: same-family proxy
   374	  performed in this session (per SE2); strict cross-family
   375	  deferred to owner-triggered external run.
   376	- **Phase 6 ship**: paired release of Product A and Product B.
   377	- **Phase 7 failure modes** to disclose (sanitized):
   378	  - Fastpath zero-adoption despite landing
   379	    (`file://specs/2026-05-17-contract-corpus-retrospective-audit/REPORT.md`).
   380	  - Decomposition phase paper-only across 23 SPECs
   381	    (`file://specs/2026-05-17-cross-family-compliance-audit/REPORT.md`:
   382	    7/10 missed-decomposition).
   383	  - Workpad bootstrap gap in the source repo itself.
   384	  - The 4 owner-blocking ceremony refactor questions and
   385	    how each was resolved.
   386	
   387	All BES-specific names get redacted in the published version;
   388	the failure modes themselves are the value.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^## |''^### |Posture|Reversal|RFC|MUST|SHALL|SHOULD|MAY|REQUIRED|OPTIONAL" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
19:## Normative Language
21:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
22:`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
23:document are to be interpreted as described in RFC 2119 and RFC 8174
26:In Decision SPECs, RFC 2119 keywords appear ONLY in §7. Decision
29:## 1. Problem
51:## 2. Substance Citations
76:## 3. Authority Map
99:  front-matter schema, RFC 2119 scoping rules.
124:## 4. Decision Criteria
135:## 5. Candidate Options
137:### 5.1 Hybrid — longread + SPEC bundle, paired release
161:### 5.2 Methodology AS a SPEC bundle only
178:### 5.3 Single longread engineering blog (~5-10K words)
195:### 5.4 Multi-part series (5-7 posts)
210:### 5.5 Paper-style (arxiv / workshop) [REJECTED]
244:### 5.6 SPEC-bundle-only (no longread) [REJECTED]
262:  case-study density per §8 Posture.
269:## 6. Trade-off Comparison
291:## 7. Decision Statement
293:The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
297:The Product B repo `agentic-installation-methodology` SHALL
306:The SPEC bundle SHALL include, as **first-class facets**
310:codex remediation finding 1.2). Implementations MAY ship
312:the prose facets; the signed-distribution surface MAY land
315:the manifest schema MUST include the signature field at
318:The methodology body SHALL follow the seven phases plus
327:The Product A repo `agentic-ops-framework` SHALL be repacked
329:Product B v1.0 authoring; the two artefacts SHALL ship as a
332:BES SHALL be named directly throughout Product B's published
333:artefacts; the case-study density REQUIRED by research §7
338:§7 SHALL be published as case data, with sanitization
345:§2.3 SHALL be published as flagged-open; Product B MUST NOT
350:the published SPEC bundle alone — SHALL gate Product B
351:publication. Same-family proxy results MAY inform authoring
352:but MUST NOT substitute for the external pass.
354:Product B's authoring MUST itself follow the v1 BES spec
361:Implementations of this Decision SHOULD prefer earlier-phase
366:Implementations MAY parallelize Phase 0-2 (analysis) across
370:Implementations MAY adopt additional sub-spec facets beyond
376:## 8. Decision Rationale
408:## 9. Locks
448:## 10. Reversal Plan
476:## 11. Validation Plan
489:- Check 3: Locks (§9) and Reversal Plan (§10) are populated
495:## 12. Acceptance Criteria
503:- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
512:## 13. Open Questions
518:## 14. Completion Report
520:### 14.1 Files changed
531:### 14.2 Commands run
543:  matrix, RFC 2119 confined to §7).
545:### 14.3 Verification result
559:### 14.4 Residual risk
583:### 14.5 Spec evidence candidates

codex
The remediation did carry the four edits into the amended target, but I’m seeing a couple of carry-through problems around stale anchors and counts. I’m running the lint gate now, then I’ll give a verdict per original finding plus any new blockers/majors.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"SPEC-bundle-only|paper-style|eight catalogued|§6 above|signed-distribution|signature|conformance|compares 4|6 × 4|Candidates 5\\.1-5\\.4|§16 Reversal\" specs/2026-05-18-agentic-installation-methodology/SPEC.md /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126:- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:166:### §7.A — Parent Decision §5: add paper-style + bundle-only candidates (finding 1.1, 1.4)
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:184:- §5.6 SPEC-bundle-only (no longread) — rejected because
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:189:§9 Locks UPDATE: add SPEC-bundle-only and paper-style to
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:195:### §7.B — Parent Decision §6 + §7: conformance + signing as first-class facets (finding 1.2)
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:203:  "executable conformance + signed-distribution
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:206:  conformance suite + signed distribution are
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:481:  — inserted §5.5 (paper-style REJECTED) + §5.6
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:482:  (SPEC-bundle-only REJECTED); rewrote §9 Forecloses
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:486:  "Executable conformance + signed-distribution
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:488:  conformance + signing as first-class facets at v1.0.
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:516:    conformance reserved-status, provenance block,
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:517:    signature block).
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:549:  PASS — manifest schema 2.1.0, conformance core,
specs/2026-05-18-agentic-installation-methodology/SPEC.md:167:- Fit with substance: Strong — perfect self-conformance.
specs/2026-05-18-agentic-installation-methodology/SPEC.md:231:  benefit; the conformance suite (5.1 has it) isn't
specs/2026-05-18-agentic-installation-methodology/SPEC.md:244:### 5.6 SPEC-bundle-only (no longread) [REJECTED]
specs/2026-05-18-agentic-installation-methodology/SPEC.md:250:foreclose the inverse: SPEC-bundle-only without a
specs/2026-05-18-agentic-installation-methodology/SPEC.md:271:| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
specs/2026-05-18-agentic-installation-methodology/SPEC.md:276:| Executable conformance + signed-distribution surface | max (bundle includes conformance/ + signed manifest) | max (bundle is the primary) | min (no bundle = no conformance surface) | min | medium (academic supplement could attach) | max |
specs/2026-05-18-agentic-installation-methodology/SPEC.md:288:conformance + signed-distribution surface" criterion is
specs/2026-05-18-agentic-installation-methodology/SPEC.md:308:executable conformance suite and a signed-distribution
specs/2026-05-18-agentic-installation-methodology/SPEC.md:311:the conformance suite as a runnable bundle separate from
specs/2026-05-18-agentic-installation-methodology/SPEC.md:312:the prose facets; the signed-distribution surface MAY land
specs/2026-05-18-agentic-installation-methodology/SPEC.md:313:unsigned at the v1.0 release with the signature block
specs/2026-05-18-agentic-installation-methodology/SPEC.md:315:the manifest schema MUST include the signature field at
specs/2026-05-18-agentic-installation-methodology/SPEC.md:371:the eight catalogued in §6 above when the case-study work
specs/2026-05-18-agentic-installation-methodology/SPEC.md:382:executable-conformance + signed-distribution-surface
specs/2026-05-18-agentic-installation-methodology/SPEC.md:427:  series-only, paper-style, and bundle-only foreclosures
specs/2026-05-18-agentic-installation-methodology/SPEC.md:430:  multi-part series only (5.4), paper-style only (5.5;
specs/2026-05-18-agentic-installation-methodology/SPEC.md:431:  added at this amendment), and SPEC-bundle-only without
specs/2026-05-18-agentic-installation-methodology/SPEC.md:442:- Treating executable conformance suite or signed-
specs/2026-05-18-agentic-installation-methodology/SPEC.md:478:- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
specs/2026-05-18-agentic-installation-methodology/SPEC.md:500:      needed fields populated (this SPEC compares 4).
specs/2026-05-18-agentic-installation-methodology/SPEC.md:502:      candidates and criteria (6 × 4 cells filled).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,40p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
     1	---
     2	id: 2026-05-18-agentic-installation-methodology
     3	status: verified
     4	type: decision
     5	owner: HasNoBeef
     6	repo: bes-fleet-policy
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md
    13	  - bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md
    14	ideated_in: specs/2026-05-18-agentic-installation-methodology/IDEA.md
    15	---
    16	
    17	# SPEC: Product B — Agentic Installation Methodology Shape and Scope
    18	
    19	## Normative Language
    20	
    21	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    22	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    23	document are to be interpreted as described in RFC 2119 and RFC 8174
    24	when, and only when, they appear in all capitals.
    25	
    26	In Decision SPECs, RFC 2119 keywords appear ONLY in §7. Decision
    27	Statement. They do not appear in any other section of this document.
    28	
    29	## 1. Problem
    30	
    31	The studio has finished publishing Product A (the agent
    32	operating framework) at v1.1
    33	(`url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`).
    34	Product B — a published methodology explaining how to take any
    35	working product and decompose it into an exhaustive, non-
    36	prescriptive deployment-grade SPEC that user-dispatched coding
    37	agents can install — is the next deliverable. The producing
    38	IDEA at
    39	`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
    40	proposes a hybrid (longread + SPEC bundle) shape with a paired

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 245ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/IDEA.md
artefact / type:       idea / decision
sections (top-level):  8
citation-prefix hits:  20
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

 succeeded in 2335ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/SPEC.md
artefact / type:       spec / decision
sections (top-level):  15
citation-prefix hits:  62
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md | sed -n '472,492p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   472	
   473	## 19. Completion Report
   474	
   475	### 19.1 Files changed
   476	
   477	Per-amendment changes (sub-amendment → files):
   478	
   479	- §7.A (parent Decision §5/§9 candidate-space +
   480	  Locks): `bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   481	  — inserted §5.5 (paper-style REJECTED) + §5.6
   482	  (SPEC-bundle-only REJECTED); rewrote §9 Forecloses
   483	  list to consolidate shape-without-SPEC-bundle entries.
   484	- §7.B (parent Decision §6/§7 first-class
   485	  facets): same file — added trade-off matrix row
   486	  "Executable conformance + signed-distribution
   487	  surface"; added §7 Decision Statement clause binding
   488	  conformance + signing as first-class facets at v1.0.
   489	- §7.C (parent Decision §6 trade-off matrix +
   490	  §8 rationale): same file — renamed "Honest
   491	  disclosure" row to "Failure-mode + open-question
   492	  publication surface"; updated §8 rationale to cite

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
codex
**Quality Gate Result**

FAIL: no mutations; lint passes for both `IDEA.md` and `SPEC.md`, but the amended Decision still has material carry-through issues.

**Per-Finding Verdicts**

1.1: RESOLVED.  
§5.5 now includes paper-style as a rejected candidate with rationale around academic channel fit, latency, format constraints, and audience mismatch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:210).

1.2: PARTIALLY RESOLVED.  
§7 and §9 now name conformance + signed-distribution as first-class, but the carry-through is inconsistent: §4 Decision Criteria still does not list/source/weight the new criterion, while §6/§8 rely on it. Also, §7 allows the signed-distribution surface to ship unsigned at v1.0, which conflicts with the remediation wording that binds “conformance + signing as first-class facets at v1.0.” See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:126), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:306), and [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:484).

1.3: RESOLVED.  
The row rename is substantive, not cosmetic. The matrix now measures publication surface specifically, and rescoring blog/series/bundle-only away from the old generic “honest disclosure” framing is coherent. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:275).

1.4: PARTIALLY RESOLVED.  
SPEC-bundle-only is now named, but §9’s umbrella says “shape-without-SPEC-bundle” while including SPEC-bundle-only, and it forecloses “paper-style only” even though §5.5 says paper-style could carry the same SPEC bundle with academic channel as primary. That leaves an academic-primary + SPEC-bundle path ambiguously unclosed. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:425).

**New Findings**

MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).

MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).

ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).

RFC 2119 scoping is clean: uppercase normative keywords remain confined to the boilerplate and §7, and lint reported 0 errors / 0 warnings for both target artefacts.


tokens used
133,276
**Quality Gate Result**

FAIL: no mutations; lint passes for both `IDEA.md` and `SPEC.md`, but the amended Decision still has material carry-through issues.

**Per-Finding Verdicts**

1.1: RESOLVED.  
§5.5 now includes paper-style as a rejected candidate with rationale around academic channel fit, latency, format constraints, and audience mismatch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:210).

1.2: PARTIALLY RESOLVED.  
§7 and §9 now name conformance + signed-distribution as first-class, but the carry-through is inconsistent: §4 Decision Criteria still does not list/source/weight the new criterion, while §6/§8 rely on it. Also, §7 allows the signed-distribution surface to ship unsigned at v1.0, which conflicts with the remediation wording that binds “conformance + signing as first-class facets at v1.0.” See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:126), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:306), and [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:484).

1.3: RESOLVED.  
The row rename is substantive, not cosmetic. The matrix now measures publication surface specifically, and rescoring blog/series/bundle-only away from the old generic “honest disclosure” framing is coherent. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:275).

1.4: PARTIALLY RESOLVED.  
SPEC-bundle-only is now named, but §9’s umbrella says “shape-without-SPEC-bundle” while including SPEC-bundle-only, and it forecloses “paper-style only” even though §5.5 says paper-style could carry the same SPEC bundle with academic channel as primary. That leaves an academic-primary + SPEC-bundle path ambiguously unclosed. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:425).

**New Findings**

MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).

MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).

ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).

RFC 2119 scoping is clean: uppercase normative keywords remain confined to the boilerplate and §7, and lint reported 0 errors / 0 warnings for both target artefacts.


