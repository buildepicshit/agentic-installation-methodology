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
session id: 019e4380-65f0-7c33-a08a-05ada0cbaf3b
--------
user
Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
codex
I’ll treat this as a read-only spec review: first refresh the fleet-policy context, then inspect the R6 commit and run the relevant spec quality gates against the target.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|SPEC|quality gate|review-spec" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
13:- ACTOCCATUD, repo-orientation, preflight.mjs, .agents/specs, retrospective audit, TOTAL_SPECS 68, STATUS_COUNTS, TASK_DIR_COUNT 0
93:- `MODEL_ROUTING.md` lagged behind the newer TASK-based workflow in the recorded orientation run; when those docs conflict, privilege `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow/skill [Task 5]
97:- `STATUS.md` is the quickest live source for the current movement-slice state, while `.agents/specs/2026-05-16-m4-to-m5-architecture-contract/SPEC.md` §7.7 is the authority for the broader production ownership matrix and remaining spec-artifact count [Task 3]
109:- Symptom: older routing docs contradict the TASK-based workflow. Cause: `MODEL_ROUTING.md` drifted behind `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow. Fix: privilege the newer TASK authority docs and flag the mismatch for upstream repair [Task 5]
172:- The queued next slice is `.agents/specs/2026-05-17-procedural-creature-visual-polish-godot/SPEC.md`, which is lint-clean and currently `approved-pending-owner` [Task 3]
219:- IKTO is now in post-reset greenfield / Godot 4 mode; `T-02 onward` is paused until the post-research architecture Decision SPEC is owner-approved [Task 2]
223:- `bash .agents/scripts/audit-entry-docs.sh`, `bash .agents/scripts/lint-spec.sh .agents/specs/2026-05-13-ikto-prototype-architecture-decisions/SPEC.md`, `node .agents/scripts/preflight.mjs`, and `git diff --check` all passed in the later status refresh; preflight only warned about unmanaged top-level paths [Task 2]
230:- Symptom: silent implementation despite conflicting `decomposed` authority. Cause: not comparing workflow wording against `SPEC.schema.md` and the decomposition skill. Fix: rely on the stricter schema / decomposition-skill rule until the workflow template is fixed upstream [Task 2]
276:- Symptom: Assets preflight unmanaged-top-level warnings tempt local repo patches. Cause: treating a fleet-policy layout issue as a product-repo problem. Fix: route those warnings to `bes-fleet-policy` and use a source-first fix path instead of patching Assets ad hoc [Task 1]
325:- The approved decision artefacts live at `.agents/specs/2026-05-03-ikto-core-fantasy-and-control-model/{IDEA,SPEC}.md`; the next likely specs were first playable thesis, base topology model, direct deity actions, and threat model contract [Task 1]
326:- In this repo, a decision artefact is not really done until `status` is terminal, acceptance criteria are checked, and the completion report is filled; the schema accepted `closed` as the terminal status for that SPEC [Task 2]
330:- `bash tools/unity/verify.sh` is the canonical heavy gate for the current Unity prototype lane, with `bash tools/unity/test-editmode.sh`, `bash .agents/scripts/lint-spec.sh <IDEA|SPEC>`, `node .agents/scripts/preflight.mjs`, and `git diff --check` as the supporting gates [Task 3]
377:- The owner-approved contract artifacts are `.agents/specs/2026-05-08-procedural-objects-shaders/{IDEA,SPEC}.md`, and the closeout note emphasized explicit file staging only if the owner later wants these preserved in git [Task 1]
389:# Task Group: bes-fleet-policy source-first policy updates / propagation
390:scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
391:applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
397:- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
401:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
407:- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
427:- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
433:- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
436:- The source verification pattern that held up was: lint IDEA/SPEC, validate skill frontmatter, audit entry docs, run hook tests, run preflight, and use targeted grep checks for the new policy terms [Task 1]
439:- "Pass with warnings" can still be meaningful signal in child repos: unmanaged top-level warnings are guardrails, not automatic failures, unless the SPEC explicitly declares the path as allowed [Task 2]
446:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]
486:- During the rebuild, the current authority chain was approved foundation SPECs -> `LEVEL_SET.md` -> `AGENTS.md` -> approved per-system SPECs -> archived docs/evidence [Task 1]
487:- `LEVEL_SET.md` explicitly says existing `docs/` are reference only until re-affirmed in a foundation SPEC [Task 1]

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
The live repo context confirms this is the canonical fleet-policy source; for review I’m using the source-repo gate path (`agents/scripts/...`) and keeping the target spec as the authority. Next I’m checking the exact R6 diff and the spec-review contract criteria.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate --no-renames 16f9c8d' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
16f9c8d (HEAD -> main, origin/main, origin/HEAD) spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
 specs/2026-05-18-agentic-installation-methodology/SPEC.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --no-ext-diff --unified=80 --no-renames --format=medium 16f9c8d -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
commit 16f9c8d18ce29f6db47ebb7b0549110cbe31716f
Author: HasNoBeef <alaindormehl@gmail.com>
Date:   Tue May 19 20:36:31 2026 -0700

    spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)

diff --git a/specs/2026-05-18-agentic-installation-methodology/SPEC.md b/specs/2026-05-18-agentic-installation-methodology/SPEC.md
index 826f5d4..d5017e2 100644
--- a/specs/2026-05-18-agentic-installation-methodology/SPEC.md
+++ b/specs/2026-05-18-agentic-installation-methodology/SPEC.md
@@ -511,173 +511,173 @@ Exit procedure:
   The 5.6-as-alias structure is deliberate per codex
   remediation §7.A (added 2026-05-19) to give the §9
   Forecloses list an explicit named entry for the
   shape-without-longread variant; codex Round-3 noted
   the original "real and distinct" wording overclaimed
   on 5.6 distinctness and the wording is corrected here.
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
       needed fields populated (this SPEC compares 6 post
       codex remediation §7.A which added paper-style and
       SPEC-bundle-only as rejected candidates).
 - [x] AC-3: Trade-off matrix (§6) is complete for all
       candidates and criteria (7 criteria × 6 candidates =
       42 cells filled post codex remediation §7.B which
       added "Executable conformance + signed-distribution
       surface" + §7.C which renamed "Honest disclosure" to
       "Failure-mode + open-question publication surface").
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
 
 ### 14.0 Amendment log (post-verification edits)
 
 This Completion Report was filled at original verification
 2026-05-18. Subsequent codex cross-family remediation
 rounds amended §4-§12 of this Decision; the historical
 evidence values in §14.1-§14.2 reflect the original-
 verification state, NOT current state. Per codex Round-3
 ADVISORY finding, this Amendment Log section is added to
 disclose the gap honestly.
 
 | Round | Date | Commits | Net effect on §14.1-§14.2 evidence |
 |---|---|---|---|
 | Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
 | Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
 | Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
 
 Current-state evidence values supersede §14.1-§14.2:
 - citation hits: 65 (per current `lint-spec.sh` invocation)
 - candidates × fields: 6 candidates × 5 fields each
 - trade-off matrix: 7 criteria × 6 candidates = 42 cells
 
 ### 14.1 Files changed (historical; original verification)
 
 - `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   (new; status: ready-for-spec; 20 citation hits, 0 lint
   errors).
 - `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   (new; this artefact; 47 citation hits, 0 lint errors —
-  pre-amendment value; current state 64 per §14.0
+  pre-amendment value; current state 65 per §14.0
   Amendment Log).
 - `specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   (modified; status: research → dispositioned; §11.5 owner
   dispositions table appended).
 
 ### 14.2 Commands run (historical; original verification)
 
 - `cmd://bash agents/scripts/lint-spec.sh
   specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   → exit 0 (0 errors, 0 warnings, 20 citation hits).
 - `cmd://bash agents/scripts/lint-spec.sh
   specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   → exit 0 (0 errors, 0 warnings, 47 citation hits at
-  original verification; 64 current per §14.0).
+  original verification; 65 current per §14.0).
 - `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
   family proxy; recorded as `severity: advisory`) →
   recommendation `approve-pending-owner`; structural pass
   at original verification (15/15 sections, 4 candidates ×
   5 fields, 6×4 trade-off matrix, RFC 2119 confined to
   §7). Current-state structure is 15/15 sections, 6
   candidates × 5 fields, 7×6 trade-off matrix per §14.0
   Amendment Log; cross-family Quality Gate evidence in
   the codex review record at
   `file://../../../agentic-installation-methodology/reviews/codex-2026-05-19/`
   + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
 
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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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

 succeeded in 0ms:
---
id: 2026-05-01-bes-spec-authoring-procedure-v1
status: closed
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
  - test -f agents/specs/SPEC.contract.template.md
  - test -f agents/specs/SPEC.decision.template.md
  - test -f agents/specs/SPEC.schema.md
  - test -f agents/specs/IDEA.template.md
  - test -d agents/skills/spec-authoring
  - test -x agents/scripts/lint-spec.sh
  - bash agents/scripts/lint-spec.sh specs/2026-05-01-bes-spec-authoring-procedure-v1/IDEA.md
  - bash agents/scripts/lint-spec.sh specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md
  - grep -q "^### .* Ideate" agents/OPERATING_MODEL.md
  - grep -q "input-vs-artefact" agents/OPERATING_MODEL.md
  - grep -q "spec-authoring" agents/SKILL_REGISTRY.md
---

# SPEC: BES Spec Authoring Procedure v1

Status: Draft v1
Type: Contract
Purpose: Define a fleet-wide procedure for authoring high-quality,
subagent-executable specifications from owner-and-agent ideation
conversations. Specify three spec types, a structured IDEA→SPEC
pipeline, per-type templates, a shared schema with citation grammar,
blocking quality gates, a lint mechanism, and a manual propagation
mechanism for distribution to all six child product repos.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHOULD`, `SHOULD NOT`,
`RECOMMENDED`, `MAY`, and `OPTIONAL` in this document are to be
interpreted as described in RFC 2119.

`Implementation-defined` means the behavior is part of the
implementation contract, but this specification does not prescribe one
universal policy. Implementations MUST document the selected behavior
in the affected artefact (skill SKILL.md, workflow doc, or
OPERATING_MODEL.md section).

## 1. Problem Statement

The BES fleet operates spec-first
(`file://agents/OPERATING_MODEL.md` §"Required Work Model"). The
current shared spec template
(`file://agents/specs/SPEC.template.md`, 173 lines, single Task-
flavoured shape) lacks structural precision needed to dispatch work
reliably to autonomous subagents.

Three operational failure modes follow
(`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/IDEA.md`
§1):

1. **Specs underspecify behavior contracts.** Stateful or protocol-
   defining work has no template slot for state machines, failure
   models, observability, or reference algorithms. Subagents infer
   contracts and produce inconsistent implementations.
2. **Decision-making work has no template.** Stack choices,
   architecture choices, and option-comparison work get forced
   through Task framing. Candidates / Criteria / Decision / Rationale
   / Locks structure has no place to live.
3. **Specs and the IDEA conversations producing them lack shared
   discipline for citation, ambiguity handling, and the agent-
   memory boundary.** Specs read like coherent prose but contain
   uncited claims; subagents guess at evidence.

Owner directive
(`owner://transcript-2026-05-01`, captured in IDEA.md §1):

> "we need to be able to produce HIGH quality and exhaustive specs so
> the sub agents are not left guessing about what they need to do."

The OpenAI Symphony specification
(`url://https://github.com/openai/symphony/blob/main/SPEC.md`, fetched
2026-05-01, cached at `file:///tmp/ikto-refs/symphony-spec.md`, 2169
lines) is the structural quality benchmark. This SPEC adopts Symphony
patterns where they fit (RFC 2119 normative language, conformance
profiles, domain model with full schemas, state machines, reference
algorithms, test-to-DoD matrix, failure model, trust boundary,
observability) and preserves the existing BES template's strengths
(Authority Map, Code/Docs Reality Check, Open Questions discipline,
executable `acceptance_commands` front-matter, Completion Report).

## 2. Goals and Non-Goals

### 2.1 Goals

- REQUIRED: Three spec types (Task, Contract, Decision) covering the
  full range of fleet work, each with a dedicated template.
- REQUIRED: Structured IDEA→SPEC pipeline with a contract-grade
  IDEA artefact bridging owner-agent conversation to a bindable
  spec.
- REQUIRED: Shared schema doc defining citation grammar, RFC 2119
  conventions, and shared front-matter — single source of truth
  for cross-template conventions.
- REQUIRED: Per-type quality gates (bar b for Task, bar c for
  Contract, bar b + candidates for Decision) enforced by the
  `spec-review` skill as a blocking check.
- REQUIRED: Lint script enforcing mechanical quality checks
  (citation prefix presence, required sections per type, RFC 2119
  uppercase rule) — REQUIRED for Contract specs, RECOMMENDED for
  Task and Decision.
- REQUIRED: Operational definition of "subagent-executable" — what
  is a citable claim, what is editorial framing, with positive and
  negative examples.
- REQUIRED: Memory boundary clarification — agent memory is a
  legitimate input to ideation conversations and authoring
  reasoning; in artefacts, every claim cites a source.
- REQUIRED: Manual propagation mechanism with provenance
  discipline — every propagation commit in a child repo references
  the source commit hash from this repo.
- REQUIRED: Self-conformance — the inaugural IDEA.md and this
  SPEC.md MUST pass their own quality gates after deliverables
  ship.

### 2.2 Non-Goals

- NOT a service or runtime system. There is no central agent fleet
  executing from this repo. Each child product repo runs its own
  primary agent and subagent fleet
  (`owner://transcript-2026-05-01`, IDEA.md §3).
- NOT a literal copy of OpenAI Symphony's spec structure. Symphony
  is the *style* benchmark for thoroughness; the BES procedure has
  three shapes (Task / Contract / Decision) where Symphony has one,
  and BES preserves Authority Map / Reality Check / Owner Judgments
  patterns Symphony lacks.
- NOT a forced migration of existing approved specs. New templates
  apply to specs authored after this procedure ships. Existing
  approved or in-flight specs MAY complete under the prior template;
  see §21.
- NOT an automated propagation system. Propagation is manual copy
  with provenance tracking. Automating to git subtree or similar is
  a future-version concern (§21.3, §22 OPTIONAL).
- NOT a runtime-tooling dependency. Child repos do not depend on
  `bes-fleet-policy` at runtime; they depend on it as a *source* for
  policy artefacts that are copied in.

## 3. System Overview

### 3.1 Pipeline phases

The IDEA→SPEC procedure is a 9-phase pipeline. The state machine
is specified in §7.

```text
Phase 1: IDEA conversation        (owner + primary agent, free shape)
Phase 2: IDEA capture             (/idea-capture writes IDEA.md)
Phase 3: IDEA review              (owner reviews; status → ready-for-spec)
Phase 4: SPEC authoring           (/author-spec consumes IDEA.md)
Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
Phase 6: Owner approval           (status → approved)
Phase 7: Execution                (subagents implement; SPEC immutable)
Phase 8: Verification             (acceptance_commands run; results recorded)
Phase 9: Spec evidence            (durable lessons captured)
```

### 3.2 Component responsibilities

1. `spec-authoring` skill (NEW) — owns templates, schema, type
   selection, structured IDEA capture.
2. `spec-driven-development` skill (UPDATED) — owns the lifecycle and
   the Ideate step.
3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
   quality gate and lint invocation.
4. `idea-capture` workflow (NEW) — orchestrates Phase 2.
5. `author-spec` workflow (UPDATED) — orchestrates Phase 4.
6. `review-spec` workflow (UPDATED) — orchestrates Phase 5.
7. `lint-spec.sh` script (NEW) — mechanical quality checks.
8. `OPERATING_MODEL.md` (UPDATED) — encodes the policy.
9. `SKILL_REGISTRY.md` (UPDATED) — registers the new skill.

### 3.3 External dependencies

- POSIX shell (`bash`) and `grep`, `awk`, `find`, `wc` for the lint
  script.
- Git for repo state, propagation provenance, and commit hashes.
- No network or secrets requirements.

## 4. Authority Map

Active authority for this SPEC:

- `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/IDEA.md`:
  the captured ideation conversation. Bindable per IDEA.md §3 and §7.
- `file://agents/OPERATING_MODEL.md`: the existing fleet operating
  contract. This SPEC amends it (§12).
- `owner://transcript-2026-05-01`: owner statements during ideation,
  captured verbatim in IDEA.md §7.
- `url://https://github.com/openai/symphony/blob/main/SPEC.md`
  (cached at `file:///tmp/ikto-refs/symphony-spec.md`): style and
  thoroughness benchmark. NOT a literal template source.

Stale, superseded, or evidence-only sources:

- `file://agents/specs/SPEC.template.md`: the v0 baseline template.
  Will be renamed to `SPEC.task.template.md` and refined to bar (b)
  during execution.

Owner decisions required before implementation:

- [x] Three spec types (Task, Contract, Decision) — RESOLVED in IDEA.
- [x] Three lean templates plus shared schema — RESOLVED.
- [x] Per-type quality gates (b, c, b+candidates) — RESOLVED.
- [x] Structured IDEA artefact — RESOLVED.
- [x] BES-fleet scope (not IKTO-local) — RESOLVED.
- [x] `bes-fleet-policy` as canonical repo, local-only initially —
  RESOLVED.

## 5. Code/Docs Reality Check

| Surface | Current claim | Observed reality | Required action |

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
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"64|65|citation hits|current state|Round|5\\.6|7×6|6 candidates|4 candidates|47|62|42 cells|30 cells|24 cells\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
245:### 5.6 SPEC-bundle-only (no longread) [REJECTED]
272:| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
312:refined per codex Round-2 finding to disambiguate
391:codex Round-2 stale-reference finding.)
452:  - SPEC-bundle-only (5.2 / 5.6): no longread.
454:  tightened per codex Round-2 finding 1.4 PARTIAL: the
456:  consistent for 5.3 / 5.4 / 5.5-only / 5.2 / 5.6 but did
505:- Check 1: §5 enumerates 6 candidate shapes (5.1-5.6),
506:  of which 5 are substantively distinct (5.1, 5.2/5.6,
508:  (5.6 is by design "Identical reasoning to 5.2; named
511:  The 5.6-as-alias structure is deliberate per codex
514:  shape-without-longread variant; codex Round-3 noted
516:  on 5.6 distinctness and the wording is corrected here.
541:      candidates and criteria (7 criteria × 6 candidates =
542:      42 cells filled post codex remediation §7.B which
569:verification state, NOT current state. Per codex Round-3
573:| Round | Date | Commits | Net effect on §14.1-§14.2 evidence |
575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
577:| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
580:- citation hits: 65 (per current `lint-spec.sh` invocation)
581:- candidates × fields: 6 candidates × 5 fields each
582:- trade-off matrix: 7 criteria × 6 candidates = 42 cells
587:  (new; status: ready-for-spec; 20 citation hits, 0 lint
590:  (new; this artefact; 47 citation hits, 0 lint errors —
591:  pre-amendment value; current state 65 per §14.0
601:  → exit 0 (0 errors, 0 warnings, 20 citation hits).
604:  → exit 0 (0 errors, 0 warnings, 47 citation hits at
605:  original verification; 65 current per §14.0).
609:  at original verification (15/15 sections, 4 candidates ×
612:  candidates × 5 fields, 7×6 trade-off matrix per §14.0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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
    41	Product A v2.0 / Product B v1.0 release. The owner directive
    42	`owner://transcript-2026-05-18` ("Do what is the rolls royce")
    43	binds the strongest-rigour disposition across every shape and
    44	attribution question raised in the research workpad at
    45	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    46	§9. This SPEC encodes that disposition as a binding Decision so
    47	the follow-on execution work (repo standup, repack, authoring,
    48	external validation) can proceed without further owner-blocking
    49	ambiguity.
    50	
    51	## 2. Substance Citations
    52	
    53	- `file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
    54	  — producing IDEA; `status: ready-for-spec`. Owner
    55	  dispositions captured in §7.
    56	- `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    57	  — dispositioned research workpad. §3 transferable building
    58	  blocks; §4 missing facets; §5 packaging shape; §6
    59	  methodology phase structure; §7 BES case-study data; §11.5
    60	  owner dispositions table.
    61	- `file://specs/2026-05-17-sanitized-framework-publication/RESEARCH.md`
    62	  — sibling Product A workpad; Product A v1.1 is the worked
    63	  artefact this Decision binds to repack as v2.0.
    64	- `url://github.com/buildepicshit/agentic-ops-framework`
    65	  — Product A v1.1 shipped artefact (before-state for the
    66	  Phase 3-4 repack walkthrough).
    67	- `url://github.com/openai/symphony/blob/main/SPEC.md`
    68	  — the only in-the-wild operating-model-as-SPEC; primary
    69	  source for the 14 transferable building blocks named in
    70	  research §3.
    71	- `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
    72	  — closest published statement of the agentic-installation
    73	  hypothesis as a risk; Product B publishes it as procedure.
    74	- `owner://transcript-2026-05-18` (verbatim in §3 below).
    75	
    76	## 3. Authority Map
    77	
    78	Active authority for this decision:
    79	
    80	- `owner://transcript-2026-05-18`:
    81	  > "I don't know what does the research suggest — What do we
    82	  > think is the rolls rroyce ?"
    83	  > "Just do what is right for fuck sakes what a stupid
    84	  > question"
    85	  > "Do what is the rolls royce"
    86	
    87	  Binds every disposition; affirms the IDEA §5 recommendation
    88	  (Hybrid longread + SPEC bundle, paired release, full
    89	  attribution, all failure modes, all open research questions
    90	  flagged, external cross-family validation gate).
    91	
    92	- `file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
    93	  — ideated source; §4 candidate space, §5 recommendation,
    94	  §7 owner judgments.
    95	- `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    96	  §11.5 — owner-dispositions table (per-question binding
    97	  recorded durably in the research workpad).
    98	- `file://agents/specs/SPEC.schema.md` — citation grammar,
    99	  front-matter schema, RFC 2119 scoping rules.
   100	
   101	Stale, superseded, or evidence-only sources:
   102	
   103	- `file://specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   104	  — superseded by the reframed agentic-installation workpad;
   105	  evidence only, not authoritative for this Decision.
   106	
   107	Owner decisions required before implementation:
   108	
   109	- [x] Publication shape — resolved (Hybrid).
   110	- [x] Phase count — resolved (7 + Phase 0).
   111	- [x] Product A repack — resolved (parallel paired release).
   112	- [x] BES attribution — resolved (fully named).
   113	- [x] Failure-mode disclosure — resolved (all published).
   114	- [x] Open research question disclosure — resolved (all 7
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
   130	| Failure-mode + open-question publication surface — does the format land failure modes + open questions as first-class content (renamed from "Honest disclosure" per codex remediation finding 1.3) | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
   131	| Executable conformance + signed-distribution surface — does the chosen shape carry an executable conformance suite + signed-distribution manifest (added per codex remediation finding 1.2) | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §5.1; `owner://transcript-2026-05-18` | high |
   132	| Cross-family validation evidence | research §6 Phase 5; `owner://transcript-2026-05-18` | high |
   133	| Authoring cost (elapsed time + coordination overhead) | `judgment://agent-synthesis` from IDEA §4 cost estimates | medium |
   134	| Self-undermining risk (artefact contradicts its own thesis) | `judgment://agent-synthesis` from IDEA §4.3, §4.4 risk analysis | high |
   135	
   136	## 5. Candidate Options
   137	
   138	### 5.1 Hybrid — longread + SPEC bundle, paired release
   139	
   140	- Description: Two paired artefacts in a new public repo
   141	  (`agentic-installation-methodology`): an engineering
   142	  longread (~8-12K words, first-person, BES case-study
   143	  density) plus an authoritative SPEC bundle (front-door
   144	  manifest + per-facet sub-specs covering architecture,
   145	  deployment, behavior, customization, decisions, quality,
   146	  operations, non-goals). Product A is repacked into
   147	  manifest+catalog as v2.0 in parallel; the paired release
   148	  ships both. External cross-family validation pass gates
   149	  publication. (`judgment://agent-synthesis`, see IDEA §4.1.)
   150	- Fit with substance: Maximum — the methodology IS the
   151	  packaging it advocates per research §5.
   152	- Fit with constraints: Maximum — every constraint from IDEA
   153	  §3 satisfied. (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   154	  §3.)
   155	- Cost: Highest of the candidates. Estimate 4-6 weeks elapsed,
   156	  including Product A repack + cross-family validation
   157	  pass. (`judgment://agent-synthesis`.)
   158	- Risk: Scope sprawl mitigated by hard per-facet word limits
   159	  plus facet-level negative-space discipline. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   160	  §4.2.)
   161	
   162	### 5.2 Methodology AS a SPEC bundle only
   163	
   164	- Description: Pure dogfooding; no longread. The methodology
   165	  paper IS the manifest+catalog. Readers consume it the way
   166	  agents do — partial reads per facet. Product A repack +
   167	  cross-family validation still required.
   168	- Fit with substance: Strong — perfect self-conformance.
   169	  (`judgment://agent-synthesis`.)
   170	- Fit with constraints: Weak on reader on-ramp; the
   171	  case-study narrative loses its medium. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   172	  §7, §8.)
   173	- Cost: Lower than 5.1 (one artefact shape). Estimate 3-4
   174	  weeks elapsed. (`judgment://agent-synthesis`.)
   175	- Risk: Reader uptake risk — the methodology is novel enough
   176	  that "read it like an agent does" loses humans who would
   177	  otherwise become practitioners. (`judgment://agent-synthesis`.)
   178	
   179	### 5.3 Single longread engineering blog (~5-10K words)
   180	
   181	- Description: One published post. No SPEC artefact. No
   182	  Product A repack. No cross-family validation gate (nothing
   183	  installable to validate).
   184	- Fit with substance: Weak — the methodology recommends
   185	  spec-as-distribution while publishing as blog.
   186	  (`judgment://agent-synthesis`.)
   187	- Fit with constraints: Weak — self-undermining; the honest-
   188	  posture constraint takes a hit; the dogfooding constraint
   189	  fails outright. (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   190	  §3.)
   191	- Cost: Lowest. Estimate 2-3 weeks elapsed.
   192	  (`judgment://agent-synthesis`.)
   193	- Risk: Reader's first observation lands as critique; the
   194	  artefact undercuts itself. (`judgment://agent-synthesis`.)
   195	
   196	### 5.4 Multi-part series (5-7 posts)
   197	
   198	- Description: Phase-per-post structure tracking research §6.
   199	  No SPEC artefact. No Product A repack. No cross-family
   200	  validation gate.
   201	- Fit with substance: Weak — same self-undermining problem as
   202	  5.3. (`judgment://agent-synthesis`.)
   203	- Fit with constraints: Weak. (`judgment://agent-synthesis`.)
   204	- Cost: Comparable to 5.3 in total effort, spread over a
   205	  longer elapsed window across 5-7 publishing cycles.
   206	  (`judgment://agent-synthesis`.)
   207	- Risk: Series fatigue; the high-density failure-mode +
   208	  cross-family content lands in parts 5-7 for a smaller
   209	  audience. (`judgment://agent-synthesis`.)
   210	
   211	### 5.5 Paper-style (arxiv / workshop) [REJECTED]
   212	
   213	Added 2026-05-19 per
   214	`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   215	§7.A (codex finding 1.1). The original candidate enumeration
   216	omitted this option from research §9 Q1.
   217	
   218	- Description: publish the methodology as an
   219	  academic-channel paper (arxiv preprint, workshop
   220	  submission). Same SPEC-bundle as 5.1 could ride along,

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '220,520p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   220	  submission). Same SPEC-bundle as 5.1 could ride along,
   221	  but the primary publication channel is academic
   222	  review + indexing. <!-- lint-ok: no-citation -->
   223	- Fit with substance: Medium — the methodology is novel
   224	  enough to warrant academic framing, but the
   225	  case-study density relies on owner verbatim
   226	  transcripts that don't translate well to academic
   227	  prose conventions.
   228	  (`judgment://agent-synthesis`.)
   229	- Fit with constraints: Weak — academic publication
   230	  introduces review-latency the studio's honest-
   231	  experiential posture treats as friction without
   232	  benefit; the conformance suite (5.1 has it) isn't
   233	  natively academic-channel-shaped.
   234	  (`judgment://agent-synthesis`.)
   235	- Cost: Medium — drafting cost similar to 5.1's
   236	  longread; additional cost is conforming to venue
   237	  templates + responding to reviewers.
   238	  (`judgment://agent-synthesis`.)
   239	- Risk: Channel-fit erosion — the methodology's
   240	  audience is engineers + agents, not academics;
   241	  publishing primarily through academic channels
   242	  reaches the wrong audience first.
   243	  (`judgment://agent-synthesis`.)
   244	
   245	### 5.6 SPEC-bundle-only (no longread) [REJECTED]
   246	
   247	Added 2026-05-19 per
   248	`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   249	§7.A (codex finding 1.4). The original §9 Locks list
   250	rejected blog-only / series-only but did not explicitly
   251	foreclose the inverse: SPEC-bundle-only without a
   252	longread.
   253	
   254	- Description: ship only the manifest+catalog SPEC
   255	  bundle; no engineering longread. Readers consume
   256	  the methodology the way agents do — partial reads
   257	  per facet.
   258	- Fit with substance: Strong on dogfooding, weak on
   259	  case-study delivery. Identical reasoning to 5.2; this
   260	  candidate is named explicitly to be foreclosed in §9.
   261	  (`judgment://agent-synthesis`.)
   262	- Fit with constraints: Weak — sacrifices the
   263	  case-study density per §8 Posture.
   264	  (`judgment://agent-synthesis`.)
   265	- Cost: Medium-low — one artefact shape.
   266	  (`judgment://agent-synthesis`.)
   267	- Risk: Reader uptake gap; the methodology's narrative
   268	  loses its medium. (`judgment://agent-synthesis`.)
   269	
   270	## 6. Trade-off Comparison
   271	
   272	| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
   273	|---|---|---|---|---|---|---|
   274	| Dogfooding strength | max | max | min | min | medium | max |
   275	| Reader on-ramp | max | min | medium | medium | weak (academic-audience-only) | min |
   276	| Failure-mode + open-question publication surface | max (longread + bundle non-goals/) | medium (bundle only, no narrative) | medium (longread only, no bundle) | medium (series can land it but disperses) | medium (academic format constrains failure-mode candour) | medium (bundle only, no narrative) |
   277	| Executable conformance + signed-distribution surface | max (bundle includes conformance/ + signed manifest) | max (bundle is the primary) | min (no bundle = no conformance surface) | min | medium (academic supplement could attach) | max |
   278	| Cross-family validation evidence | yes (gates) | yes (gates) | no | no | yes (gates) | yes (gates) |
   279	| Authoring cost | highest | medium-high | lowest | low-medium | medium-high | medium-high |
   280	| Self-undermining risk | low | medium | high | high | medium (channel mismatch) | medium |
   281	
   282	Per codex remediation finding 1.3, the "Honest
   283	disclosure" row is renamed to "Failure-mode +
   284	open-question publication surface" — measuring whether
   285	the format lands those as first-class content, not the
   286	generic disclosure intent every shape technically has. <!-- lint-ok: no-citation -->
   287	
   288	Per codex remediation finding 1.2, the "Executable
   289	conformance + signed-distribution surface" criterion is
   290	added with high weight, sourced from research §5.1. <!-- lint-ok: no-citation -->
   291	
   292	## 7. Decision Statement
   293	
   294	The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
   295	SPEC bundle, paired Product A v2.0 / Product B v1.0 release)
   296	as the shape and scope binding for Product B.
   297	
   298	The Product B repo `agentic-installation-methodology` SHALL
   299	ship two paired artefacts: an engineering longread
   300	(target 8 000-12 000 words; first-person experiential
   301	posture; BES case-study density; failure modes as first-class
   302	content) and an authoritative SPEC bundle structured as a
   303	front-door manifest plus per-facet sub-specs (architecture,
   304	deployment, behavior, customization, decisions, quality,
   305	operations, non-goals).
   306	
   307	The SPEC bundle SHALL include, as **first-class structural
   308	facets** (not optional extras requiring follow-on
   309	amendment), an executable conformance suite and a
   310	signed-distribution manifest surface per research §5.1
   311	(added 2026-05-19 per codex remediation finding 1.2;
   312	refined per codex Round-2 finding to disambiguate
   313	"first-class" structural status from signed-execution
   314	readiness). Implementations MAY ship the conformance
   315	suite as a runnable bundle separate from the prose
   316	facets. The signed-distribution surface — meaning the
   317	manifest schema's signature field + the conformance
   318	suite's signed-execution capability — IS first-class at
   319	v1.0 in the sense that the manifest schema MUST include
   320	the signature field, the conformance suite MUST be
   321	runnable, and the SPEC bundle MUST be packagable as a
   322	signed artefact. The actual cryptographic signing of any
   323	specific release MAY land unsigned at the v1.0 release
   324	(Sigstore tooling wiring is a v1.x slice); the manifest's
   325	`signature.status: unsigned` is the explicit honest
   326	disclosure of this state.
   327	
   328	The methodology body SHALL follow the seven phases plus
   329	Phase 0 enumerated in
   330	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   331	§6 (Phase 0 maturity check; Phase 1 facet inventory and
   332	classification; Phase 2 parameterization surface; Phase 3
   333	sanitization bar; Phase 4 manifest + catalog composition;
   334	Phase 5 cross-family agent walkthrough; Phase 6 ship; Phase 7
   335	failure modes as first-class content).
   336	
   337	The Product A repo `agentic-ops-framework` SHALL be repacked
   338	into the manifest+catalog shape as v2.0 in parallel with
   339	Product B v1.0 authoring; the two artefacts SHALL ship as a
   340	paired release.
   341	
   342	BES SHALL be named directly throughout Product B's published
   343	artefacts; the case-study density REQUIRED by research §7
   344	forecloses anonymization.
   345	
   346	All four-plus failure modes catalogued in
   347	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   348	§7 SHALL be published as case data, with sanitization
   349	limited to specific internal SPEC identifiers and
   350	transcripts; the failure-mode patterns themselves are the
   351	value.
   352	
   353	All seven open research questions catalogued in
   354	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   355	§2.3 SHALL be published as flagged-open; Product B MUST NOT
   356	claim to resolve them.
   357	
   358	An external cross-family agent validation pass — a
   359	different-family agent attempting to deploy Product A from
   360	the published SPEC bundle alone — SHALL gate Product B
   361	publication. Same-family proxy results MAY inform authoring
   362	but MUST NOT substitute for the external pass.
   363	
   364	Product B's authoring MUST itself follow the v1 BES spec
   365	procedure: each follow-on slice (repo standup, repack,
   366	longread authoring, SPEC-bundle authoring, validation pass)
   367	authored as a Task or Contract SPEC under the parent
   368	Decision; cross-family review BLOCKING per slice;
   369	verification gates each before merge.
   370	
   371	Implementations of this Decision SHOULD prefer earlier-phase
   372	slices to be authored against Product A's existing v1.1
   373	artefacts (so the repack work in Phase 4 is informed by the
   374	Phase 1-2 facet inventory rather than the other way around).
   375	
   376	Implementations MAY parallelize Phase 0-2 (analysis) across
   377	agents while keeping Phase 3-6 (composition + validation) on
   378	a single coordinating agent to preserve voice consistency.
   379	
   380	Implementations MAY adopt additional sub-spec facets beyond
   381	the eight catalogued in the §7 Decision Statement above
   382	(architecture, deployment, behavior, customization,
   383	decisions, quality, operations, non-goals) and the two
   384	first-class structural facets added per codex remediation
   385	finding 1.2 (conformance, signed-distribution) when the
   386	case-study work surfaces them, provided the additions are
   387	catalogued in the front-door manifest and named explicitly
   388	in a follow-on Decision SPEC amendment. (Note: §6 is the
   389	trade-off comparison matrix, NOT a facet catalogue; the
   390	authoritative facet list lives here in §7. Fixed per
   391	codex Round-2 stale-reference finding.)
   392	
   393	## 8. Decision Rationale
   394	
   395	Candidate 5.1 was chosen because it is the only candidate
   396	that simultaneously satisfies the dogfooding constraint,
   397	the reader-on-ramp constraint, the failure-mode +
   398	open-question publication-surface constraint, and the
   399	executable-conformance + signed-distribution-surface
   400	constraint (§6 trade-off matrix rows 1-4 post-codex-
   401	remediation 1.2 + 1.3). The cost differential (~4-6
   402	weeks vs. ~2-3 weeks for 5.3) is acceptable given the
   403	strategic value of a paired release that demonstrates the
   404	methodology applied to itself. Owner directive
   405	`owner://transcript-2026-05-18` ("Do what is the
   406	rolls royce") affirms this trade.
   407	
   408	Candidate 5.2 was rejected because it sacrifices the
   409	case-study narrative that motivates the methodology in the
   410	first place; research §7 lists the BES failure-mode density
   411	as load-bearing case content that a SPEC-bundle alone cannot
   412	land for human readers
   413	(`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   414	§7).
   415	
   416	Candidates 5.3 and 5.4 were rejected because both
   417	fail the dogfooding constraint outright: publishing a
   418	methodology that recommends spec-as-distribution while
   419	shipping only as blog or post-series self-undermines the
   420	artefact. The cost savings do not compensate for the
   421	self-undermining risk
   422	(`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   423	§4.3, §4.4).
   424	
   425	## 9. Locks
   426	
   427	Unlocks:
   428	
   429	- Standup of the public OSS repo
   430	  `agentic-installation-methodology` (Product B home).
   431	- Repack of `agentic-ops-framework` v1.1 into manifest +
   432	  catalog v2.0.
   433	- Authoring of the longread and per-facet sub-specs as
   434	  follow-on Task / Contract SPECs.
   435	- External cross-family validation engagement as a follow-on
   436	  Task SPEC.
   437	- Paired-release coordination plan as a follow-on Decision or
   438	  Contract SPEC if scope requires.
   439	
   440	Forecloses:
   441	
   442	- Shipping Product B as any shape that omits either the
   443	  longread OR the SPEC bundle. The chosen Candidate 5.1 is
   444	  longread + SPEC bundle PAIRED; every other shape in §5 is
   445	  REJECTED per its §5.N rationale. Specifically rejected:
   446	  - blog-only (5.3): no SPEC bundle.
   447	  - multi-part series only (5.4): no SPEC bundle.
   448	  - paper-style only (5.5): no longread; even if 5.5 could
   449	    compose with a SPEC bundle (academic-channel-primary +
   450	    bundle-attached), the longread omission means this
   451	    composite shape is also foreclosed.
   452	  - SPEC-bundle-only (5.2 / 5.6): no longread.
   453	  (Reversible only by superseding this Decision. Wording
   454	  tightened per codex Round-2 finding 1.4 PARTIAL: the
   455	  previous "shape-without-SPEC-bundle" umbrella was
   456	  consistent for 5.3 / 5.4 / 5.5-only / 5.2 / 5.6 but did
   457	  not foreclose the academic-primary + SPEC-bundle composite
   458	  variant of 5.5; this rewrite forecloses on the longread
   459	  omission, which catches every rejected shape including
   460	  the composite.)
   461	- Anonymizing BES in Product B's published artefacts.
   462	  (Reversible only by superseding this Decision.)
   463	- Publishing Product B before the external cross-family
   464	  validation pass completes. (Reversible only by superseding
   465	  this Decision.)
   466	- Repacking Product A v2.0 as anything other than the
   467	  manifest + catalog shape Product B advocates. (Reversible
   468	  only by superseding this Decision.)
   469	- Treating executable conformance suite or signed-
   470	  distribution surface as optional / extension facets
   471	  (per codex remediation finding 1.2 added 2026-05-19);
   472	  both are first-class facets of the SPEC bundle at v1.0.
   473	  (Reversible only by superseding this Decision.)
   474	
   475	## 10. Reversal Plan
   476	
   477	Triggers for reconsideration:
   478	
   479	- External cross-family validation pass surfaces a structural
   480	  flaw in the manifest+catalog shape that cannot be patched
   481	  without restructuring; the methodology's recommended
   482	  packaging is empirically wrong.
   483	- Owner directive supersedes the rolls-royce framing (cost
   484	  pressure, scope cut, attribution reversal, etc.) with a
   485	  later transcript citation.
   486	- Field state shifts: a peer methodology publication lands
   487	  the same composition (agentic installation + cross-org
   488	  ownership split + manifest+catalog) before Product B ships;
   489	  novelty erodes; reassess scope.
   490	
   491	Exit procedure:
   492	
   493	1. Author a follow-on Decision SPEC superseding this one;
   494	   cite this SPEC's id in `supersedes:` front-matter.
   495	2. Pause any in-flight follow-on Task SPECs derived from this
   496	   Decision; flag them as `blocked-on-supersede`.
   497	3. Notify dependents: the Product A repack task, the longread
   498	   authoring task, the SPEC bundle authoring task, the
   499	   cross-family validation engagement.
   500	4. Owner approves the superseding Decision; resume execution
   501	   under the new shape.
   502	
   503	## 11. Validation Plan
   504	
   505	- Check 1: §5 enumerates 6 candidate shapes (5.1-5.6),
   506	  of which 5 are substantively distinct (5.1, 5.2/5.6,
   507	  5.3, 5.4, 5.5) and 1 is an explicit-rename pointer
   508	  (5.6 is by design "Identical reasoning to 5.2; named
   509	  explicitly to be foreclosed in §9"). Each substantively
   510	  distinct shape is independently feasible if chosen. <!-- lint-ok: no-citation -->
   511	  The 5.6-as-alias structure is deliberate per codex
   512	  remediation §7.A (added 2026-05-19) to give the §9
   513	  Forecloses list an explicit named entry for the
   514	  shape-without-longread variant; codex Round-3 noted
   515	  the original "real and distinct" wording overclaimed
   516	  on 5.6 distinctness and the wording is corrected here.
   517	- Check 2: Candidate 5.1 (the chosen option) is feasible —
   518	  Product A v1.1 already shipped at
   519	  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
   520	  proves the studio can author + ship public OSS artefacts

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '520,760p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   520	  proves the studio can author + ship public OSS artefacts
   521	  under the v1 procedure; the research workpad's §3, §4, §5
   522	  prove the field-state homework is done; the longread voice
   523	  prove-out is the parent IDEA itself
   524	  (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   525	  §1, §5).
   526	- Check 3: Locks (§9) and Reversal Plan (§10) are populated
   527	  and coherent; every Lock has a matching reversal path.
   528	- Check 4: All seven owner-blocking questions from the
   529	  research workpad are answered in §7 with citations to
   530	  `owner://transcript-2026-05-18`.
   531	
   532	## 12. Acceptance Criteria
   533	
   534	- [x] AC-1: Decision Statement (§7) names exactly one chosen
   535	      option (Candidate 5.1).
   536	- [x] AC-2: At least 2 candidates compared in §5 with all
   537	      needed fields populated (this SPEC compares 6 post
   538	      codex remediation §7.A which added paper-style and
   539	      SPEC-bundle-only as rejected candidates).
   540	- [x] AC-3: Trade-off matrix (§6) is complete for all
   541	      candidates and criteria (7 criteria × 6 candidates =
   542	      42 cells filled post codex remediation §7.B which
   543	      added "Executable conformance + signed-distribution
   544	      surface" + §7.C which renamed "Honest disclosure" to
   545	      "Failure-mode + open-question publication surface").
   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
   547	- [x] AC-5: Decision Rationale (§8) cites the trade-off
   548	      matrix and owner judgment.
   549	- [x] AC-6: Completion Report §14 records when and how the
   550	      decision was communicated to dependents (the follow-on
   551	      Task / Contract SPECs that descend from this Decision).
   552	- [x] AC-7: `lint-spec.sh` exits 0 against both IDEA.md and
   553	      SPEC.md (front-matter `acceptance_commands`).
   554	
   555	## 13. Open Questions
   556	
   557	None at this Decision layer. Implementation-level questions
   558	that surface during follow-on Task / Contract SPEC authoring
   559	are scoped to those SPECs' own gates.
   560	
   561	## 14. Completion Report
   562	
   563	### 14.0 Amendment log (post-verification edits)
   564	
   565	This Completion Report was filled at original verification
   566	2026-05-18. Subsequent codex cross-family remediation
   567	rounds amended §4-§12 of this Decision; the historical
   568	evidence values in §14.1-§14.2 reflect the original-
   569	verification state, NOT current state. Per codex Round-3
   570	ADVISORY finding, this Amendment Log section is added to
   571	disclose the gap honestly.
   572	
   573	| Round | Date | Commits | Net effect on §14.1-§14.2 evidence |
   574	|---|---|---|---|
   575	| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
   577	| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
   578	
   579	Current-state evidence values supersede §14.1-§14.2:
   580	- citation hits: 65 (per current `lint-spec.sh` invocation)
   581	- candidates × fields: 6 candidates × 5 fields each
   582	- trade-off matrix: 7 criteria × 6 candidates = 42 cells
   583	
   584	### 14.1 Files changed (historical; original verification)
   585	
   586	- `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   587	  (new; status: ready-for-spec; 20 citation hits, 0 lint
   588	  errors).
   589	- `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   590	  (new; this artefact; 47 citation hits, 0 lint errors —
   591	  pre-amendment value; current state 65 per §14.0
   592	  Amendment Log).
   593	- `specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   594	  (modified; status: research → dispositioned; §11.5 owner
   595	  dispositions table appended).
   596	
   597	### 14.2 Commands run (historical; original verification)
   598	
   599	- `cmd://bash agents/scripts/lint-spec.sh
   600	  specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   601	  → exit 0 (0 errors, 0 warnings, 20 citation hits).
   602	- `cmd://bash agents/scripts/lint-spec.sh
   603	  specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   604	  → exit 0 (0 errors, 0 warnings, 47 citation hits at
   605	  original verification; 65 current per §14.0).
   606	- `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
   607	  family proxy; recorded as `severity: advisory`) →
   608	  recommendation `approve-pending-owner`; structural pass
   609	  at original verification (15/15 sections, 4 candidates ×
   610	  5 fields, 6×4 trade-off matrix, RFC 2119 confined to
   611	  §7). Current-state structure is 15/15 sections, 6
   612	  candidates × 5 fields, 7×6 trade-off matrix per §14.0
   613	  Amendment Log; cross-family Quality Gate evidence in
   614	  the codex review record at
   615	  `file://../../../agentic-installation-methodology/reviews/codex-2026-05-19/`
   616	  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
   617	
   618	### 14.3 Verification result
   619	
   620	PASS. Decision SPEC is well-formed; all seven Acceptance
   621	Criteria checked; lint clean against both artefacts; review
   622	gate passed (with same-family-proxy advisory recorded).
   623	
   624	The Decision cascades by id-citation: follow-on Task / Contract
   625	SPECs that author the slices named in §7 (repo standup,
   626	repack, longread authoring, SPEC-bundle authoring, validation
   627	pass) cite this SPEC's `id`
   628	(`2026-05-18-agentic-installation-methodology`) in their
   629	front-matter `cites_decision:` field and reference the §7
   630	clauses they are implementing.
   631	
   632	### 14.4 Residual risk
   633	
   634	- **Same-family review caveat**: the Decision SPEC was both
   635	  authored and reviewed by Claude-Opus-4.7 lanes. A cross-
   636	  family pass (Codex) is recommended before any follow-on
   637	  Task SPEC reaches `approved` status; the bias risk in the
   638	  candidate-selection step is real and unmitigated by lint.
   639	  Capture as spec-evidence candidate (§14.5).
   640	- **Scope sprawl**: the §7 Decision Statement enumerates five
   641	  slice classes (standup, repack, longread, SPEC-bundle,
   642	  validation) but does not bound elapsed time, word counts
   643	  per facet, or facet-count ceiling. The follow-on Task /
   644	  Contract SPECs are expected to bound those — if any one
   645	  slice exceeds its bound, escalate via a follow-on Decision
   646	  amendment per §9 (the "Implementations may adopt additional
   647	  sub-spec facets" clause).
   648	- **Cross-family validation engagement cost**: §7 makes
   649	  external cross-family pass a publication gate. The engagement
   650	  shape (which external agent family, what dispatch model,
   651	  what acceptance bar) is unspecified in this Decision and
   652	  pushed to a follow-on Task SPEC. The risk: if external
   653	  validation engagement is harder than estimated, the paired-
   654	  release timeline slips. Owner-visible.
   655	
   656	### 14.5 Spec evidence candidates
   657	
   658	- **Decision SPECs cascade by id-citation, not TASK.md
   659	  decomposition.** The `approved-spec-decomposition` skill
   660	  correctly refused to emit TASK.md slices against this
   661	  Decision SPEC. Capture as durable lesson: agents authoring
   662	  Decision SPECs should not expect downstream decomposition;
   663	  instead, the Decision binds shape and the §7 enumeration
   664	  becomes the slice list for follow-on Task / Contract SPECs
   665	  that cite the Decision by id. Already documented in
   666	  `file://.claude/skills/approved-spec-decomposition/SKILL.md`
   667	  "Skip when" — this Completion Report reinforces it from the
   668	  Decision-author perspective.
   669	- **Rolls-royce directive as one-shot disposition resolver.**
   670	  `owner://transcript-2026-05-18` ("Do what is the rolls
   671	  royce") resolved 7 owner-blocking questions in one
   672	  utterance. The pattern: when the agent has done the research
   673	  homework and the candidate space is well-articulated, an
   674	  owner directive can disposition multiple questions with a
   675	  single binding statement. Document as authoring pattern for
   676	  the spec-authoring skill's "Grill Before IDEA" section.
   677	- **Decision Statement as slice enumerator.** §7 enumerates
   678	  the slice list (standup, repack, longread, SPEC-bundle,
   679	  validation pass) inside the normative section, which lets
   680	  follow-on Task / Contract SPECs cite specific §7 clauses
   681	  as their parent authority. This is the cascade-by-id-
   682	  citation pattern in action; consider documenting in
   683	  `references/cascade-by-id-citation.md`.

codex
The R6 commit is exactly the requested fix: two `64 -> 65` substitutions in §14.1 and §14.2, and the worktree is clean. I’ve also confirmed there are no remaining literal `64` hits in the target spec; now I’m running the mechanical gates and doing the final major-severity pass.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git grep -n \"current state 64\\|current-state.*64\\|64 current\\|citation hits: 64\\|64 per §14\\.0\\|64\" -- specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'node agents/scripts/preflight.mjs' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 155ms:
ok: preflight layout: policy-repo (agents/)
ok: AGENTS.md: present
ok: WORKFLOW.md: present
ok: agents/OPERATING_MODEL.md: present
ok: agents/DOCUMENTATION_GUIDE.md: present
ok: agents/SKILL_REGISTRY.md: present
ok: agents/WORKSPACE_LAYOUT.md: present
ok: agents/MODEL_ROUTING.md: present
ok: agents/GREEN_ROOM_EVALUATION.md: present
ok: agents/mcp/README.md: present
ok: agents/mcp/approved-defaults.json: present
ok: CLAUDE.md: present (optional agent-specific extension)
ok: entrypoints checked: AGENTS.md required, agent-specific files optional, public-OSS exclusions enforced
ok: skill frontmatter: 320 files checked
ok: .mcp.example.json: valid JSON
ok: agents/mcp/approved-defaults.json: 0 approved default MCP server(s)
ok: .mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: ACTOCCATUD/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: Floom/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: IKTO/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: Mimir/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: TieFighter/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: UsefulIdiots/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: Wick/.mcp.json: local MCP config absent; default baseline uses no MCP servers
ok: MCP ignore policy checked for root and active repos
ok: codex: codex-cli 0.129.0
warn: unmanaged top-level entries: agentic-installation-methodology. Declare fleet-owned paths in bes-fleet-policy/agents/WORKSPACE_LAYOUT.md and agents/scripts/preflight.mjs, then propagate, or move via approved migration spec.
preflight passed with 1 warning(s).

 succeeded in 170ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/IDEA.md
artefact / type:       idea / decision
sections (top-level):  8
citation-prefix hits:  20
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

 succeeded in 2807ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/SPEC.md
artefact / type:       spec / decision
sections (top-level):  15
citation-prefix hits:  65
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"\\b(MUST|MUST NOT|REQUIRED|SHALL|SHALL NOT|SHOULD|SHOULD NOT|RECOMMENDED|MAY|OPTIONAL)\\b\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
21:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
22:`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
294:The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
298:The Product B repo `agentic-installation-methodology` SHALL
307:The SPEC bundle SHALL include, as **first-class structural
314:readiness). Implementations MAY ship the conformance
319:v1.0 in the sense that the manifest schema MUST include
320:the signature field, the conformance suite MUST be
321:runnable, and the SPEC bundle MUST be packagable as a
323:specific release MAY land unsigned at the v1.0 release
328:The methodology body SHALL follow the seven phases plus
337:The Product A repo `agentic-ops-framework` SHALL be repacked
339:Product B v1.0 authoring; the two artefacts SHALL ship as a
342:BES SHALL be named directly throughout Product B's published
343:artefacts; the case-study density REQUIRED by research §7
348:§7 SHALL be published as case data, with sanitization
355:§2.3 SHALL be published as flagged-open; Product B MUST NOT
360:the published SPEC bundle alone — SHALL gate Product B
361:publication. Same-family proxy results MAY inform authoring
362:but MUST NOT substitute for the external pass.
364:Product B's authoring MUST itself follow the v1 BES spec
371:Implementations of this Decision SHOULD prefer earlier-phase
376:Implementations MAY parallelize Phase 0-2 (analysis) across
380:Implementations MAY adopt additional sub-spec facets beyond

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^## |''^### 5'"\\.[0-9]|"'^- (Description|Fit with substance|Fit with constraints|Cost|Risk):|''^'"\\| Criterion \\||"'^'"\\| Dogfooding strength|"'^'"\\| Reader on-ramp|"'^'"\\| Failure-mode|"'^'"\\| Executable|"'^'"\\| Cross-family|"'^'"\\| Authoring cost|"'^'"\\| Self-undermining\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
19:## Normative Language
29:## 1. Problem
51:## 2. Substance Citations
76:## 3. Authority Map
124:## 4. Decision Criteria
126:| Criterion | Source | Weight |
128:| Dogfooding strength — does the artefact exemplify what it advocates? | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §5, §8 | high |
129:| Reader on-ramp — does the artefact land for a first-time reader without an agent? | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §8 ("First-person experiential throughout") | high |
130:| Failure-mode + open-question publication surface — does the format land failure modes + open questions as first-class content (renamed from "Honest disclosure" per codex remediation finding 1.3) | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
131:| Executable conformance + signed-distribution surface — does the chosen shape carry an executable conformance suite + signed-distribution manifest (added per codex remediation finding 1.2) | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §5.1; `owner://transcript-2026-05-18` | high |
132:| Cross-family validation evidence | research §6 Phase 5; `owner://transcript-2026-05-18` | high |
133:| Authoring cost (elapsed time + coordination overhead) | `judgment://agent-synthesis` from IDEA §4 cost estimates | medium |
134:| Self-undermining risk (artefact contradicts its own thesis) | `judgment://agent-synthesis` from IDEA §4.3, §4.4 risk analysis | high |
136:## 5. Candidate Options
138:### 5.1 Hybrid — longread + SPEC bundle, paired release
140:- Description: Two paired artefacts in a new public repo
150:- Fit with substance: Maximum — the methodology IS the
152:- Fit with constraints: Maximum — every constraint from IDEA
155:- Cost: Highest of the candidates. Estimate 4-6 weeks elapsed,
158:- Risk: Scope sprawl mitigated by hard per-facet word limits
162:### 5.2 Methodology AS a SPEC bundle only
164:- Description: Pure dogfooding; no longread. The methodology
168:- Fit with substance: Strong — perfect self-conformance.
170:- Fit with constraints: Weak on reader on-ramp; the
173:- Cost: Lower than 5.1 (one artefact shape). Estimate 3-4
175:- Risk: Reader uptake risk — the methodology is novel enough
179:### 5.3 Single longread engineering blog (~5-10K words)
181:- Description: One published post. No SPEC artefact. No
184:- Fit with substance: Weak — the methodology recommends
187:- Fit with constraints: Weak — self-undermining; the honest-
191:- Cost: Lowest. Estimate 2-3 weeks elapsed.
193:- Risk: Reader's first observation lands as critique; the
196:### 5.4 Multi-part series (5-7 posts)
198:- Description: Phase-per-post structure tracking research §6.
201:- Fit with substance: Weak — same self-undermining problem as
203:- Fit with constraints: Weak. (`judgment://agent-synthesis`.)
204:- Cost: Comparable to 5.3 in total effort, spread over a
207:- Risk: Series fatigue; the high-density failure-mode +
211:### 5.5 Paper-style (arxiv / workshop) [REJECTED]
218:- Description: publish the methodology as an
223:- Fit with substance: Medium — the methodology is novel
229:- Fit with constraints: Weak — academic publication
235:- Cost: Medium — drafting cost similar to 5.1's
239:- Risk: Channel-fit erosion — the methodology's
245:### 5.6 SPEC-bundle-only (no longread) [REJECTED]
254:- Description: ship only the manifest+catalog SPEC
258:- Fit with substance: Strong on dogfooding, weak on
262:- Fit with constraints: Weak — sacrifices the
265:- Cost: Medium-low — one artefact shape.
267:- Risk: Reader uptake gap; the methodology's narrative
270:## 6. Trade-off Comparison
272:| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
274:| Dogfooding strength | max | max | min | min | medium | max |
275:| Reader on-ramp | max | min | medium | medium | weak (academic-audience-only) | min |
276:| Failure-mode + open-question publication surface | max (longread + bundle non-goals/) | medium (bundle only, no narrative) | medium (longread only, no bundle) | medium (series can land it but disperses) | medium (academic format constrains failure-mode candour) | medium (bundle only, no narrative) |
277:| Executable conformance + signed-distribution surface | max (bundle includes conformance/ + signed manifest) | max (bundle is the primary) | min (no bundle = no conformance surface) | min | medium (academic supplement could attach) | max |
278:| Cross-family validation evidence | yes (gates) | yes (gates) | no | no | yes (gates) | yes (gates) |
279:| Authoring cost | highest | medium-high | lowest | low-medium | medium-high | medium-high |
280:| Self-undermining risk | low | medium | high | high | medium (channel mismatch) | medium |
292:## 7. Decision Statement
393:## 8. Decision Rationale
425:## 9. Locks
475:## 10. Reversal Plan
503:## 11. Validation Plan
532:## 12. Acceptance Criteria
555:## 13. Open Questions
561:## 14. Completion Report

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find specs/2026-05-18-agentic-installation-methodology -maxdepth 3 -type f | sort' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
specs/2026-05-18-agentic-installation-methodology/IDEA.md
specs/2026-05-18-agentic-installation-methodology/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find agentic-installation-methodology/reviews -maxdepth 3 -type f 2>/dev/null | sort | sed -n '1,160p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find agentic-installation-methodology -maxdepth 4 -type f | sort | sed -n '1,200p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
find: ‘agentic-installation-methodology’: No such file or directory

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find agentic-installation-methodology -maxdepth 3 -type d | sort | sed -n '1,160p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
find: ‘agentic-installation-methodology’: No such file or directory

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git ls-files -- specs/2026-05-18-agentic-installation-methodology/SPEC.md specs/2026-05-18-agentic-installation-methodology/IDEA.md agentic-installation-methodology | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
specs/2026-05-18-agentic-installation-methodology/IDEA.md
specs/2026-05-18-agentic-installation-methodology/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find ../agentic-installation-methodology/reviews -maxdepth 3 -type f 2>/dev/null | sort | sed -n '1,200p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19/00-SYNTHESIS.md
../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19/04-longread.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find ../agentic-installation-methodology -maxdepth 2 -type d 2>/dev/null | sort | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
../agentic-installation-methodology
../agentic-installation-methodology/.git
../agentic-installation-methodology/.git/hooks
../agentic-installation-methodology/.git/info
../agentic-installation-methodology/.git/logs
../agentic-installation-methodology/.git/objects
../agentic-installation-methodology/.git/refs
../agentic-installation-methodology/.github
../agentic-installation-methodology/.github/workflows
../agentic-installation-methodology/hooks
../agentic-installation-methodology/longread
../agentic-installation-methodology/research
../agentic-installation-methodology/research/primary-sources
../agentic-installation-methodology/reviews
../agentic-installation-methodology/reviews/codex-2026-05-19
../agentic-installation-methodology/reviews/codex-2026-05-19-round2
../agentic-installation-methodology/reviews/codex-2026-05-19-round3
../agentic-installation-methodology/reviews/codex-2026-05-19-round4
../agentic-installation-methodology/reviews/codex-2026-05-19-round5
../agentic-installation-methodology/reviews/codex-2026-05-19-round6
../agentic-installation-methodology/schema
../agentic-installation-methodology/scripts
../agentic-installation-methodology/specs
../agentic-installation-methodology/specs/2026-05-18-repo-standup
../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus
../agentic-installation-methodology/specs/2026-05-20-longread-structure
../agentic-installation-methodology/templates
../agentic-installation-methodology/tests
../agentic-installation-methodology/tests/hooks

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
session id: 019e433a-791a-7680-923c-6263b8bbf17e
--------
user
Cross-family re-review Round 5 (gpt-5.5; final convergence check). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 4 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md flagged only one residual: PARTIAL §14 citation-count 64 vs 65. Round 5 fix at 595d167 + self-audit confirms §14.0 Amendment Log pattern. Verify R4 advisory closed; surface any remaining issues. Output Quality Gate Result. No mutations.
codex
I’ll keep this read-only and focus on the Round 4 residual: inspect the cited review note, the current SPEC, and the 595d167 change, then run targeted checks around §14 before reporting the quality gate result.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c pwd in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/bes-fleet-policy

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation-methodology|Round 4|citation-count" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
276:- Symptom: Assets preflight unmanaged-top-level warnings tempt local repo patches. Cause: treating a fleet-policy layout issue as a product-repo problem. Fix: route those warnings to `bes-fleet-policy` and use a source-first fix path instead of patching Assets ad hoc [Task 1]
389:# Task Group: bes-fleet-policy source-first policy updates / propagation
390:scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
391:applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
397:- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
401:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
407:- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
427:- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
433:- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
446:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]

codex
Memory only confirms the source-repo posture and the repo-specific preflight path; it does not appear to carry prior detail for this Round 5 review. I’m moving to the live artefacts now.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba /home/hasnobeef/.codex/memories/MEMORY.md | sed -n '389,446p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   389	# Task Group: bes-fleet-policy source-first policy updates / propagation
   390	scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
   391	applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
   392	
   393	## Task 1: Agent parallelism and model-routing v2 policy change, success
   394	
   395	### rollout_summary_files
   396	
   397	- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
   398	
   399	### keywords
   400	
   401	- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
   402	
   403	## Task 2: Product-repo workspace roots preflight update, success
   404	
   405	### rollout_summary_files
   406	
   407	- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
   408	
   409	### keywords
   410	
   411	- workspace roots, IKTO unity, WORKSPACE_LAYOUT.md, unmanaged top-level entries, productRepoAllowedTopLevel, 6d4fea3, 3c0a050, source-first
   412	
   413	## Task 3: AI engineering tactical skill wave and Assets workspace propagation, success
   414	
   415	### rollout_summary_files
   416	
   417	- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
   418	
   419	### keywords
   420	
   421	- AI engineering, tactical skills, approved-spec-decomposition, caveman, diagnosis, tdd, SKILL_REGISTRY, fleet-files.txt, Assets workspace, local entry docs
   422	
   423	## User preferences
   424	
   425	- when stale fleet docs or workflow rules need changing, the user wants them treated as spec-worthy work, not ad hoc edits [Task 1][Task 2][Task 3]
   426	- when the user says "please commit asnd propogate" or otherwise approves the implementation phase, carry the policy work through source commit, propagation, and verification instead of stopping at planning [Task 1][Task 3]
   427	- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
   428	- on broad operating-model questions, the user asked for "at least three proposals" and wanted Claude CLI critique of each approach -> present bounded options and multi-model critique before locking a decision [Task 3]
   429	- when the user asked to propagate to the `Assets` folder because they "need an agent in there to manage my website and some other things" -> treat `Assets` as an intentionally agent-managed workspace, not a one-off sync target [Task 3]
   430	
   431	## Reusable knowledge
   432	
   433	- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
   434	- For policy-repo work here, the correct preflight command is `node agents/scripts/preflight.mjs`; propagated child repos use `node .agents/scripts/preflight.mjs` [Task 1][Task 2]
   435	- The v2 parallelism/model-routing change made `agents/MODEL_ROUTING.md` a required orientation read before dispatch/delegation/model-specific work and added a `Parallel Execution Policy` to `agents/OPERATING_MODEL.md` [Task 1]
   436	- The source verification pattern that held up was: lint IDEA/SPEC, validate skill frontmatter, audit entry docs, run hook tests, run preflight, and use targeted grep checks for the new policy terms [Task 1]
   437	- Preflight in this repo now has to distinguish at least three layout senses: policy-repo (`agents/`), propagated-repo (`.agents/`), and child-product-repo execution [Task 1]
   438	- The workspace-roots fix split human policy and mechanical enforcement between `agents/WORKSPACE_LAYOUT.md` and `agents/scripts/preflight.mjs`; common product-repo entries include `IDEATION.md` and `STATUS.md`, while repo-local roots are declared by exact basename in a per-repo allowlist map such as `IKTO -> unity` [Task 2]
   439	- "Pass with warnings" can still be meaningful signal in child repos: unmanaged top-level warnings are guardrails, not automatic failures, unless the SPEC explicitly declares the path as allowed [Task 2]
   440	- The AI-engineering implementation added canonical skills `caveman`, `diagnosis`, `tdd`, and `approved-spec-decomposition`, plus the `decompose-approved-spec` workflow/command; future similar additions should update `agents/SKILL_REGISTRY.md`, `agents/scripts/fleet-files.txt`, `agents/scripts/fleet-sync.sh`, and the `.claude` mirrors together [Task 3]
   441	- `Assets` is a separate repo whose root `.gitignore` already ignored `.agents/` and `.claude/`; local entry docs `Assets/{AGENTS,CLAUDE,WORKFLOW}.md` were added as workspace support, and the parent repo's `/Assets/` ignore means those docs are local workspace support unless a future spec changes that posture [Task 3]
   442	- Related skill: skills/fleet-policy-source-first-update/SKILL.md [Task 1][Task 2][Task 3]
   443	
   444	## Failures and how to do differently
   445	
   446	- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files | rg '("'^|/)SPEC'"\\.md"'$|agentic-installation-methodology|01-parent-decision'"\\.md|STATUS\\.md|OPERATING_MODEL\\.md|MODEL_ROUTING\\.md'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
STATUS.md
specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md
specs/2026-05-18-agentic-installation-methodology/SPEC.md
specs/2026-05-18-agentic-installation-methodology/IDEA.md
specs/2026-05-05-tactical-skill-wave-implementation/SPEC.md
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md
specs/2026-05-05-ai-engineering-tactical-skill-adoption/SPEC.md
specs/2026-04-29-model-routing-catalog/SPEC.md
specs/2026-05-05-product-repo-workspace-roots-preflight/SPEC.md
specs/2026-05-17-contract-corpus-retrospective-audit/SPEC.md
specs/2026-04-29-handoff-triage/SPEC.md
specs/2026-05-04-agent-parallelism-and-model-routing-v2/SPEC.md
specs/2026-05-17-ceremony-weight-refactor-execute/SPEC.md
specs/2026-04-29-green-room-product-evaluations/SPEC.md
specs/2026-05-02-studio-principle-ai/SPEC.md
specs/2026-05-17-ceremony-weight-refactor/SPEC.md
specs/2026-04-29-fleet-realignment-and-handoff/SPEC.md
specs/2026-05-02-fleet-harness-enhancements/SPEC.md
specs/2026-04-29-company-agent-operating-model/SPEC.md
specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md
specs/2026-05-17-cross-family-compliance-audit/SPEC.md
specs/2026-04-29-agent-startup-config-repair/SPEC.md
specs/2026-04-29-claude-user-mcp-cleanup/SPEC.md
specs/BES-CP-008-agent-control-file-remote-cleanup/SPEC.md
agents/OPERATING_MODEL.md
specs/2026-05-09-fleet-adopt-worktrunk-execute/SPEC.md
specs/2026-05-13-framework-refresh-lightweight-ceremony/SPEC.md
specs/2026-04-29-agent-first-control-plane/SPEC.md
specs/2026-05-17-references-pattern-adoption-wave-2/SPEC.md
agents/MODEL_ROUTING.md
specs/2026-04-29-root-control-plane-audit/SPEC.md
specs/2026-05-09-fleet-adopt-worktrunk/SPEC.md
specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC.md
specs/2026-05-09-symphony-aligned-execution-layer/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate 595d167' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
595d167 (HEAD -> main, origin/main, origin/HEAD) spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
 specs/2026-05-18-agentic-installation-methodology/SPEC.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find specs -path '*agentic-installation-methodology*' -maxdepth 5 -type f | sort" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md
specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md
specs/2026-05-18-agentic-installation-methodology/IDEA.md
specs/2026-05-18-agentic-installation-methodology/SPEC.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --name-only --format=fuller 595d167' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
commit 595d1674ffc65a07161cac305853a2ce286c6026
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 19:06:10 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 19:06:10 2026 -0700

    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)

specs/2026-05-18-agentic-installation-methodology/SPEC.md

codex
The live repo is on `595d167` at `main`/`origin/main`, and that commit only touched the target SPEC. Next I’m resolving the external review path and checking the exact §14 evidence rather than relying on the commit message.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'ls -la ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 exited 2 in 0ms:
ls: cannot access '../../agentic-installation-methodology/reviews/codex-2026-05-19-round4': No such file or directory

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --word-diff=plain -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
commit 595d1674ffc65a07161cac305853a2ce286c6026
Author: HasNoBeef <alaindormehl@gmail.com>
Date:   Tue May 19 19:06:10 2026 -0700

    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)

diff --git a/specs/2026-05-18-agentic-installation-methodology/SPEC.md b/specs/2026-05-18-agentic-installation-methodology/SPEC.md
index f35da8b..826f5d4 100644
--- a/specs/2026-05-18-agentic-installation-methodology/SPEC.md
+++ b/specs/2026-05-18-agentic-installation-methodology/SPEC.md
@@ -573,11 +573,11 @@ disclose the gap honestly.
| Round | Date | Commits | Net effect on §14.1-§14.2 evidence |
|---|---|---|---|
| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: [-64.-]{+65.+} |
| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |

Current-state evidence values supersede §14.1-§14.2:
- citation hits: [-64-]{+65+} (per current `lint-spec.sh` invocation)
- candidates × fields: 6 candidates × 5 fields each
- trade-off matrix: 7 criteria × 6 candidates = 42 cells


exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^##? ?14|''^###? ?14|Amendment Log|Citation Count|citation-count|64|65|partial|PARTIAL|ADVISORY" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
166:  agents do — partial reads per facet. Product A repack +
256:  the methodology the way agents do — partial reads
454:  tightened per codex Round-2 finding 1.4 PARTIAL: the
561:## 14. Completion Report
563:### 14.0 Amendment log (post-verification edits)
570:ADVISORY finding, this Amendment Log section is added to
576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
577:| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
580:- citation hits: 65 (per current `lint-spec.sh` invocation)
584:### 14.1 Files changed (historical; original verification)
591:  pre-amendment value; current state 64 per §14.0
592:  Amendment Log).
597:### 14.2 Commands run (historical; original verification)
605:  original verification; 64 current per §14.0).
613:  Amendment Log; cross-family Quality Gate evidence in
618:### 14.3 Verification result
632:### 14.4 Residual risk
656:### 14.5 Spec evidence candidates

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "PARTIAL|citation-count|Citation Count|64|65|ADVISORY|advisory|remaining|residual|Quality Gate" ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 exited 2 in 0ms:
rg: ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md: IO error for operation on ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md: No such file or directory (os error 2)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '540,620p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   540	- [x] AC-3: Trade-off matrix (§6) is complete for all
   541	      candidates and criteria (7 criteria × 6 candidates =
   542	      42 cells filled post codex remediation §7.B which
   543	      added "Executable conformance + signed-distribution
   544	      surface" + §7.C which renamed "Honest disclosure" to
   545	      "Failure-mode + open-question publication surface").
   546	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
   547	- [x] AC-5: Decision Rationale (§8) cites the trade-off
   548	      matrix and owner judgment.
   549	- [x] AC-6: Completion Report §14 records when and how the
   550	      decision was communicated to dependents (the follow-on
   551	      Task / Contract SPECs that descend from this Decision).
   552	- [x] AC-7: `lint-spec.sh` exits 0 against both IDEA.md and
   553	      SPEC.md (front-matter `acceptance_commands`).
   554	
   555	## 13. Open Questions
   556	
   557	None at this Decision layer. Implementation-level questions
   558	that surface during follow-on Task / Contract SPEC authoring
   559	are scoped to those SPECs' own gates.
   560	
   561	## 14. Completion Report
   562	
   563	### 14.0 Amendment log (post-verification edits)
   564	
   565	This Completion Report was filled at original verification
   566	2026-05-18. Subsequent codex cross-family remediation
   567	rounds amended §4-§12 of this Decision; the historical

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
session id: 019e4380-65f0-7c33-a08a-05ada0cbaf3b
--------
user
Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
codex
I’ll treat this as a read-only spec review: first refresh the fleet-policy context, then inspect the R6 commit and run the relevant spec quality gates against the target.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|SPEC|quality gate|review-spec" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
13:- ACTOCCATUD, repo-orientation, preflight.mjs, .agents/specs, retrospective audit, TOTAL_SPECS 68, STATUS_COUNTS, TASK_DIR_COUNT 0
93:- `MODEL_ROUTING.md` lagged behind the newer TASK-based workflow in the recorded orientation run; when those docs conflict, privilege `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow/skill [Task 5]
97:- `STATUS.md` is the quickest live source for the current movement-slice state, while `.agents/specs/2026-05-16-m4-to-m5-architecture-contract/SPEC.md` §7.7 is the authority for the broader production ownership matrix and remaining spec-artifact count [Task 3]
109:- Symptom: older routing docs contradict the TASK-based workflow. Cause: `MODEL_ROUTING.md` drifted behind `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow. Fix: privilege the newer TASK authority docs and flag the mismatch for upstream repair [Task 5]
172:- The queued next slice is `.agents/specs/2026-05-17-procedural-creature-visual-polish-godot/SPEC.md`, which is lint-clean and currently `approved-pending-owner` [Task 3]
219:- IKTO is now in post-reset greenfield / Godot 4 mode; `T-02 onward` is paused until the post-research architecture Decision SPEC is owner-approved [Task 2]
223:- `bash .agents/scripts/audit-entry-docs.sh`, `bash .agents/scripts/lint-spec.sh .agents/specs/2026-05-13-ikto-prototype-architecture-decisions/SPEC.md`, `node .agents/scripts/preflight.mjs`, and `git diff --check` all passed in the later status refresh; preflight only warned about unmanaged top-level paths [Task 2]
230:- Symptom: silent implementation despite conflicting `decomposed` authority. Cause: not comparing workflow wording against `SPEC.schema.md` and the decomposition skill. Fix: rely on the stricter schema / decomposition-skill rule until the workflow template is fixed upstream [Task 2]
276:- Symptom: Assets preflight unmanaged-top-level warnings tempt local repo patches. Cause: treating a fleet-policy layout issue as a product-repo problem. Fix: route those warnings to `bes-fleet-policy` and use a source-first fix path instead of patching Assets ad hoc [Task 1]
325:- The approved decision artefacts live at `.agents/specs/2026-05-03-ikto-core-fantasy-and-control-model/{IDEA,SPEC}.md`; the next likely specs were first playable thesis, base topology model, direct deity actions, and threat model contract [Task 1]
326:- In this repo, a decision artefact is not really done until `status` is terminal, acceptance criteria are checked, and the completion report is filled; the schema accepted `closed` as the terminal status for that SPEC [Task 2]
330:- `bash tools/unity/verify.sh` is the canonical heavy gate for the current Unity prototype lane, with `bash tools/unity/test-editmode.sh`, `bash .agents/scripts/lint-spec.sh <IDEA|SPEC>`, `node .agents/scripts/preflight.mjs`, and `git diff --check` as the supporting gates [Task 3]
377:- The owner-approved contract artifacts are `.agents/specs/2026-05-08-procedural-objects-shaders/{IDEA,SPEC}.md`, and the closeout note emphasized explicit file staging only if the owner later wants these preserved in git [Task 1]
389:# Task Group: bes-fleet-policy source-first policy updates / propagation
390:scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
391:applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
397:- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
401:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
407:- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
427:- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
433:- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
436:- The source verification pattern that held up was: lint IDEA/SPEC, validate skill frontmatter, audit entry docs, run hook tests, run preflight, and use targeted grep checks for the new policy terms [Task 1]
439:- "Pass with warnings" can still be meaningful signal in child repos: unmanaged top-level warnings are guardrails, not automatic failures, unless the SPEC explicitly declares the path as allowed [Task 2]
446:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]
486:- During the rebuild, the current authority chain was approved foundation SPECs -> `LEVEL_SET.md` -> `AGENTS.md` -> approved per-system SPECs -> archived docs/evidence [Task 1]
487:- `LEVEL_SET.md` explicitly says existing `docs/` are reference only until re-affirmed in a foundation SPEC [Task 1]

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


exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "PARTIAL|MAJOR|BLOCK|64|65|Quality Gate|pass:" ../agentic-installation-methodology/reviews/codex-2026-05-19-round5 ../agentic-installation-methodology/reviews/codex-2026-05-19-round6' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/ + scripts/check-corpus-completeness.sh. Round 4 flagged: MEDIUM AC-4 wording stale, MEDIUM Completion Report residual-risk partial truth (3 of 3 needed), LOW §17 Q4 stale. R5 fixes at afc2ba0 + self-audit §19.0 Amendment Log at c9adcc6. Verify + surface remaining. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:48:765:- AC-8: this Completion Report records the per-source
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:285:- [x] AC-9: Cross-family review (BLOCKING per parent
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:328:      BLOCKING per slice. Same-family self-review is the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:465:  uncited-claim is BLOCKING on corpus artefacts, but
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:695:   547	- [x] AC-9: Cross-family review (BLOCKING per parent
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:712:   564	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:713:   565	Exit procedure:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:738:   590	      BLOCKING per slice. Same-family self-review is the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:788:   640	  SPEC §7.2 (adr-tools-state, structurizr-dsl,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:789:   641	  json-schema).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:790:   642	- `research/primary-sources/*.md` — 22 per-source
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:791:   643	  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:792:   644	  cyclonedx-sbom), all conforming to §6.2 schema +
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:793:   645	  §8.1 front-matter:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:794:   646	  - arc42 (architecture documentation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:795:   647	  - c4-model (architecture model)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:796:   648	  - adr-nygard (foundational ADR)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:797:   649	  - adr-tools-state (state-of-practice ADR)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:798:   650	  - diataxis (documentation taxonomy)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:799:   651	  - 12-factor (cloud-native SaaS methodology)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:800:   652	  - helm-values-schema (customization-affordance)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:801:   653	  - nix-flakes (reproducibility)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:802:   654	  - oci-artifacts (distribution packaging)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:803:   655	  - sigstore-cosign (signing)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:804:   656	  - symphony-spec (operating-model-as-SPEC)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:805:   657	  - spec-kit (spec-as-authoring tool)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:806:   658	  - kiro (agentic IDE)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:807:   659	  - openspec (spec-driven dev tool)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:812:   664	  - leaddev-agent-compiled (published risk critique)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:813:   665	  - cucumber-gherkin (executable behavior spec)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:875:   727	  uncited-claim is BLOCKING on corpus artefacts, but
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:912:   764	  named factors, both well under bound).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:913:   765	- AC-8: this Completion Report records the per-source
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1256:    64	## 2. Goals and Non-Goals
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1257:    65	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1356:   164	## 6. Domain Model
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1357:   165	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1456:   264	paragraph of source text or (b) 200 words. The artefact
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1457:   265	is the methodology's editorial citation surface, not a
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1556:   364	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1557:   365	Downstream methodology slices (longread, SPEC bundle)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1656:   464	  third-party URLs. Each fetch is treated as untrusted
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1657:   465	  input: the agent (WebFetch / curl) returns content; the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1766:index 651c2d3..fe94906 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1899: - [x] AC-9: Cross-family review (BLOCKING per parent
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:1942:       BLOCKING per slice. Same-family self-review is the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2056:   uncited-claim is BLOCKING on corpus artefacts, but
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2256:index fe94906..5610dc5 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2398:   uncited-claim is BLOCKING on corpus artefacts, but
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2627:   864	  honour; the longest excerpts in the corpus
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2628:   865	  (Symphony's 18-section list, 12-factor's 12 factor
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2709:643:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2717:765:- AC-8: this Completion Report records the per-source
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2725:**Quality Gate Result: FAIL**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2733:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2745:**Quality Gate Result: FAIL**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/02-corpus.md:2753:- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:11:session id: 019e4380-65f0-7c33-a08a-05ada0cbaf3b
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:14:Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:39:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:243:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:324:  as BLOCKING.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:678:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:768:16f9c8d (HEAD -> main, origin/main, origin/HEAD) spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:779:    spec(amend r5): §14.1+§14.2 stale 64 -> 65 (codex R5 final sed misses)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:782:index 826f5d4..d5017e2 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:851: | Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:855: - citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:866:-  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:867:+  pre-amendment value; current state 65 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:881:-  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:882:+  original verification; 65 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:890:   Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:969:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:978:This skill is **BLOCKING**. A spec MUST NOT advance to
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1060:The Contract per-type gate MUST add the following BLOCKING
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1082:This check is BLOCKING per
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1087:## Quality Gate Result
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1095:pass: false
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1197:  the Quality Gate Result `evidence` field as
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1208:1. The Quality Gate Result block (YAML, schema above).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1387:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1400:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1566:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"64|65|citation hits|current state|Round|5\\.6|7×6|6 candidates|4 candidates|47|62|42 cells|30 cells|24 cells\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1573:454:  tightened per codex Round-2 finding 1.4 PARTIAL: the
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1586:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1588:580:- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1593:591:  pre-amendment value; current state 65 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1596:605:  original verification; 65 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1666:    64	- `url://github.com/buildepicshit/agentic-ops-framework`
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1667:    65	  — Product A v1.1 shipped artefact (before-state for the
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1766:   164	- Description: Pure dogfooding; no longread. The methodology
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1767:   165	  paper IS the manifest+catalog. Readers consume it the way
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1871:   264	  (`judgment://agent-synthesis`.)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1872:   265	- Cost: Medium-low — one artefact shape.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1971:   364	Product B's authoring MUST itself follow the v1 BES spec
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1972:   365	procedure: each follow-on slice (repo standup, repack,
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:1975:   368	Decision; cross-family review BLOCKING per slice;
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2061:   454	  tightened per codex Round-2 finding 1.4 PARTIAL: the
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2071:   464	  validation pass completes. (Reversible only by superseding
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2072:   465	  this Decision.)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2176:   564	
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2177:   565	This Completion Report was filled at original verification
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2188:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2192:   580	- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2203:   591	  pre-amendment value; current state 65 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2217:   605	  original verification; 65 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2225:   613	  Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2252:   640	- **Scope sprawl**: the §7 Decision Statement enumerates five
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2253:   641	  slice classes (standup, repack, longread, SPEC-bundle,
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2254:   642	  validation) but does not bound elapsed time, word counts
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2255:   643	  per facet, or facet-count ceiling. The follow-on Task /
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2256:   644	  Contract SPECs are expected to bound those — if any one
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2257:   645	  slice exceeds its bound, escalate via a follow-on Decision
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2258:   646	  amendment per §9 (the "Implementations may adopt additional
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2259:   647	  sub-spec facets" clause).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2260:   648	- **Cross-family validation engagement cost**: §7 makes
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2261:   649	  external cross-family pass a publication gate. The engagement
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2262:   650	  shape (which external agent family, what dispatch model,
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2263:   651	  what acceptance bar) is unspecified in this Decision and
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2264:   652	  pushed to a follow-on Task SPEC. The risk: if external
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2265:   653	  validation engagement is harder than estimated, the paired-
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2266:   654	  release timeline slips. Owner-visible.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2267:   655	
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2268:   656	### 14.5 Spec evidence candidates
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2269:   657	
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2270:   658	- **Decision SPECs cascade by id-citation, not TASK.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2271:   659	  decomposition.** The `approved-spec-decomposition` skill
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2276:   664	  becomes the slice list for follow-on Task / Contract SPECs
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2277:   665	  that cite the Decision by id. Already documented in
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2298:The R6 commit is exactly the requested fix: two `64 -> 65` substitutions in §14.1 and §14.2, and the worktree is clean. I’ve also confirmed there are no remaining literal `64` hits in the target spec; now I’m running the mechanical gates and doing the final major-severity pass.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2303:/home/linuxbrew/.linuxbrew/bin/bash -c "git grep -n \"current state 64\\|current-state.*64\\|64 current\\|citation hits: 64\\|64 per §14\\.0\\|64\" -- specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2356:citation-prefix hits:  65
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2384:364:Product B's authoring MUST itself follow the v1 BES spec
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2413:164:- Description: Pure dogfooding; no longread. The methodology
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2440:265:- Cost: Medium-low — one artefact shape.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2558:Cross-family re-review Round 5 (gpt-5.5; final convergence check). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 4 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md flagged only one residual: PARTIAL §14 citation-count 64 vs 65. Round 5 fix at 595d167 + self-audit confirms §14.0 Amendment Log pattern. Verify R4 advisory closed; surface any remaining issues. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2576:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2614:   417	- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2689:595d167 (HEAD -> main, origin/main, origin/HEAD) spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2704:commit 595d1674ffc65a07161cac305853a2ce286c6026
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2710:    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2724:commit 595d1674ffc65a07161cac305853a2ce286c6026
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2728:    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2731:index f35da8b..826f5d4 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2738:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: [-64.-]{+65.+} |
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2742:- citation hits: [-64-]{+65+} (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2748:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^##? ?14|''^###? ?14|Amendment Log|Citation Count|citation-count|64|65|partial|PARTIAL|ADVISORY" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2752:454:  tightened per codex Round-2 finding 1.4 PARTIAL: the
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2756:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2758:580:- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2760:591:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2763:605:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2764:613:  Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2767:656:### 14.5 Spec evidence candidates
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2770:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "PARTIAL|citation-count|Citation Count|64|65|ADVISORY|advisory|remaining|residual|Quality Gate" ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2801:   564	
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2802:   565	This Completion Report was filled at original verification
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2819:session id: 019e4380-65f0-7c33-a08a-05ada0cbaf3b
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2822:Cross-family re-review Round 6 (gpt-5.5; final convergence confirmation). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. R5 left one PARTIAL: §14.1/§14.2 stale '64'. R6 fix at 16f9c8d. Verify + surface any remaining issues at MAJOR or higher severity. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:2847:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round6/01-parent-decision.md:3051:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:11:session id: 019e4349-f5a7-7bf0-8650-de1d495c4795
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/. Round 4 flagged: BLOCKER 3.6 semantic containment, MEDIUM REQUIRED-field coverage, HIGH 3.3 final stale paths. R5 fixes at 61528c8 + self-audit §19.0 Amendment Log at 178cee3. Verify + surface remaining. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:33:380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:36:a469857 spec(fix): drop broken lint-spec.sh spec-bundle/manifest.yaml acceptance command (codex finding 3.1 BLOCKER)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:42:scripts/validate-manifest.sh:64:# 3b. REQUIRED top-level field presence (codex Round-3 + Round-4).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:43:scripts/validate-manifest.sh:65:# Per SPEC §8.1, the following are REQUIRED:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:79:spec-bundle/skills/spec-review/SKILL.md:3:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:123:spec-bundle/schema/SPEC.schema.md:64:| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:124:spec-bundle/schema/SPEC.schema.md:65:| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:130:spec-bundle/schema/SPEC.schema.md:164:| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:131:spec-bundle/schema/SPEC.schema.md:165:| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors tracker active states; only owner sets `done` |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:296:6. **Review** (BLOCKING) — run the per-type quality gate
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:300:8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:309:11. **Cross-validate** (BLOCKING per task) — review on a model
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:324:- **Spec reviewer** — runs the BLOCKING per-type quality gate.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:609:                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:646:so the BLOCKING review gate runs before approval.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:808:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:817:This skill is **BLOCKING**. A spec MUST NOT advance to
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:899:The Contract per-type gate MUST add the following BLOCKING
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:921:This check is BLOCKING per
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:926:## Quality Gate Result
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:934:pass: false
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1036:  the Quality Gate Result `evidence` field as
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1052:1. The Quality Gate Result block (YAML, schema above).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1753:  list --limit 1` — CI run `26074043565` reports
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1938:# schema (codex Round-2 BLOCKER finding closed: previously the script
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:1977:# primary value. This closes the codex Round-3 BLOCKER where facets
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2212:    64	# 3b. REQUIRED top-level field presence (codex Round-3 + Round-4).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2213:    65	# Per SPEC §8.1, the following are REQUIRED:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2312:   164	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2313:   165	# Check each facet's primary file exists.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2315:   167	# schema (codex Round-2 BLOCKER finding closed: previously the script
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2354:   206	# primary value. This closes the codex Round-3 BLOCKER where facets
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2412:   264	        fi
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2413:   265	    fi
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2531:spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `spec-bundle/schema/SPEC.schema.md` §2.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2579:spec-bundle/schema/SPEC.schema.md:365:- Templates: `spec-bundle/templates/SPEC.task.template.md`,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2599:/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '580,650p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2661:   640	the file named by `primary_index` exists inside it AND
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2662:   641	(if `media_type` is set) at least one file in the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2663:   642	directory matches the media type's file extension
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2664:   643	convention (`text/x.gherkin` → `*.feature`,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2665:   644	`text/markdown` → `*.md`, etc.). The pre-v2.1 silent-
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2666:   645	allow on directory primaries is replaced with this
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2667:   646	explicit branch.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2668:   647	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2669:   648	### 8.4 `resources` block
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2670:   649	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2671:   650	| Field | Type |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2739:    64	  customization:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2740:    65	    path: "customization/"
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2803:   164	  the repack as the methodology's worked-example
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2804:   165	  dogfood.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2953:spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `spec-bundle/schema/SPEC.schema.md` §2.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:2967:spec-bundle/schema/SPEC.schema.md:365:- Templates: `spec-bundle/templates/SPEC.task.template.md`,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3026:   354	4. Produces a structured Quality Gate Result with `pass`, `failures`
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3030:   358	6. Owner sets `status: approved` after reviewing the Quality Gate
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3036:   364	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3037:   365	- Templates: `spec-bundle/templates/SPEC.task.template.md`,
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3071:/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/references/reference-architecture.md | sed -n '50,65p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3087:    64	   merge, evidence reminders, removal guards).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3088:    65	5. **`OPERATING_MODEL.md`** section documenting the tool
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3150:   764	  pull request; CI status is the observability surface
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3151:   765	  for bundle health.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3449:#   64 — usage error
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3461:    exit 64
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3466:[[ -f "$TARGET" ]] || { printf '%s: not a file: %s\n' "$PROG" "$TARGET" >&2; exit 64; }
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3661: exited 64 in 0ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3936:pass: false
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3939:    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3963:pass: false
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/03-v2-repack.md:3966:    evidence: file://scripts/validate-manifest.sh#L238-L245 still uses canonical string-prefix matching; same-prefix sibling dirs can satisfy "$canon_primary"* even when not inside the primary dir, while file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#L637-L641 requires true containment.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:14:Cross-family re-review Round 5 (gpt-5.5; final convergence check). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 4 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md flagged only one residual: PARTIAL §14 citation-count 64 vs 65. Round 5 fix at 595d167 + self-audit confirms §14.0 Amendment Log pattern. Verify R4 advisory closed; surface any remaining issues. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:32:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:70:   417	- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:145:595d167 (HEAD -> main, origin/main, origin/HEAD) spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:160:commit 595d1674ffc65a07161cac305853a2ce286c6026
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:166:    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:180:commit 595d1674ffc65a07161cac305853a2ce286c6026
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:184:    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:187:index f35da8b..826f5d4 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:194:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: [-64.-]{+65.+} |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:198:- citation hits: [-64-]{+65+} (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:204:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^##? ?14|''^###? ?14|Amendment Log|Citation Count|citation-count|64|65|partial|PARTIAL|ADVISORY" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:208:454:  tightened per codex Round-2 finding 1.4 PARTIAL: the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:212:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:214:580:- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:216:591:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:219:605:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:220:613:  Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:223:656:### 14.5 Spec evidence candidates
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:226:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "PARTIAL|citation-count|Citation Count|64|65|ADVISORY|advisory|remaining|residual|Quality Gate" ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:257:   564	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:258:   565	This Completion Report was filled at original verification
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:269:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:273:   580	- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:284:   591	  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:298:   605	  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:306:   613	  Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:316:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"citation hits:|current state [0-9]+|Lint citation count|citation count|65|64|§14\\.0\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:319:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:320:580:- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:321:591:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:322:605:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:335:The R4 review file is in the sibling `buildepicshit/agentic-installation-methodology` tree, not at the literal `../../` path from the repo root. One live inconsistency already surfaced in §14: the new §14.0 says 65, while two historical notes still say “current state 64 per §14.0”; I’m checking whether that is in scope for this gate and running the repo lint now.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:531:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:612:  as BLOCKING.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:946:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1044:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1057:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1071:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1086:commit 71728cf6ecc78dc65eabd9f5f04253ba9a38a546
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1092:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1095:    - MAJOR: §11 Check 1 said "Candidates 5.1-5.6 real and distinct"
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1116:    Lint clean post-edit (65 citation hits).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1122:index 8d12881..f35da8b 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1166:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1170:+- citation hits: 64 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1182:+  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1198:+  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1208:+  Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1308:Cross-family re-review Round 5 (gpt-5.5; final convergence check). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 4 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md flagged only one residual: PARTIAL §14 citation-count 64 vs 65. Round 5 fix at 595d167 + self-audit confirms §14.0 Amendment Log pattern. Verify R4 advisory closed; surface any remaining issues. Output Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1326:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1364:   417	- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1439:595d167 (HEAD -> main, origin/main, origin/HEAD) spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1454:commit 595d1674ffc65a07161cac305853a2ce286c6026
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1460:    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1474:commit 595d1674ffc65a07161cac305853a2ce286c6026
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1478:    spec(amend r4): §14 citation count 64 -> 65 to match current lint (codex R4 ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1481:index f35da8b..826f5d4 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1488:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: [-64.-]{+65.+} |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1492:- citation hits: [-64-]{+65+} (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1498:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "''^##? ?14|''^###? ?14|Amendment Log|Citation Count|citation-count|64|65|partial|PARTIAL|ADVISORY" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1502:454:  tightened per codex Round-2 finding 1.4 PARTIAL: the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1506:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1508:580:- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1510:591:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1513:605:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1514:613:  Amendment Log; cross-family Quality Gate evidence in
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1517:656:### 14.5 Spec evidence candidates
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1520:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "PARTIAL|citation-count|Citation Count|64|65|ADVISORY|advisory|remaining|residual|Quality Gate" ../../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1551:   564	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1552:   565	This Completion Report was filled at original verification
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1563:citation-prefix hits:  65
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1569:Lint confirms the actual current SPEC citation count is 65 with zero errors and warnings. The remaining question is internal consistency: §14.0 now reports 65, but §14.1 and §14.2 still point to “64 current per §14.0,” so I’m checking the R4 wording and acceptance commands before I call the gate.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1571:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "Quality Gate Result|PARTIAL|partial|citation-count|citation count|64 vs 65|65|64|new findings|remaining|RESOLVED|ADVISORY" /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1573:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1574:27:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1575:41:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1576:56:commit 71728cf6ecc78dc65eabd9f5f04253ba9a38a546
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1577:62:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1579:86:    Lint clean post-edit (65 citation hits).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1580:92:index 8d12881..f35da8b 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1583:136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1584:140:+- citation hits: 64 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1585:152:+  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1586:168:+  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1589:647:  tightened per codex Round-2 finding 1.4 PARTIAL: the
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1592:774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1593:778:- citation hits: 64 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1594:789:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1595:803:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1596:907: succeeded in 2965ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1597:912:citation-prefix hits:  65
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1598:930:session id: 019e4286-d270-7e00-994d-d654f9100b60
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1599:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1600:935:I’ll do this as a read-only review: first refresh the relevant fleet-policy memory and repo state, then compare the Round-2 findings against the current SPEC and commit `2496545`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1601:947:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1602:1007:   417	- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1604:1483:   164	- Description: Pure dogfooding; no longread. The methodology
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1605:1484:   165	  paper IS the manifest+catalog. Readers consume it the way
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1608:1582:/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '500,640p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1609:1648:   564	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1610:1649:   565	This Completion Report was filled at original verification
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1611:1654:   570	ADVISORY finding, this Amendment Log section is added to
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1612:1659:   575	| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1613:1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1614:1664:   580	- citation hits: 64 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1615:1675:   591	  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1616:1689:   605	  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1617:1724:   640	- **Scope sprawl**: the §7 Decision Statement enumerates five
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1619:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1620:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1621:1733:837:2496545 (HEAD -> main, origin/main, origin/HEAD) spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1622:1734:846:    spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1623:1735:851:    1.2 PARTIAL -> RESOLVED:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1624:1736:862:    1.4 PARTIAL -> RESOLVED:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1625:1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1627:1762:1964:  4026	1.2: PARTIALLY RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1629:1764:1970:  4032	1.4: PARTIALLY RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1631:1768:1986:  4048	**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1633:1770:1995:  4057	1.2: PARTIALLY RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1635:1772:2001:  4063	1.4: PARTIALLY RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1637:1799:2844:1.2 PARTIAL: RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1638:1800:2847:1.4 PARTIAL: RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1641:1805:2860:ADVISORY: §14 Completion Report still records stale evidence: `47 citation hits`, `4 candidates × 5 fields`, and `6×4 trade-off matrix`. Current lint reports 64 citation hits, and the current matrix is 6 candidates × 7 criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:560) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:574).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1642:1806:2862:**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1643:1807:2864:FAIL, review gate only. The four Round-2 follow-ups are remediated, and both declared lint commands pass with 0 errors / 0 warnings. But the new §11 distinctness overclaim is a material validation-plan defect. No mutations were made; working tree remained clean.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1644:1808:2871:1.2 PARTIAL: RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1645:1809:2874:1.4 PARTIAL: RESOLVED.  
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1648:1814:2887:ADVISORY: §14 Completion Report still records stale evidence: `47 citation hits`, `4 candidates × 5 fields`, and `6×4 trade-off matrix`. Current lint reports 64 citation hits, and the current matrix is 6 candidates × 7 criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:560) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:574).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1649:1815:2889:**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1650:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1651:1847:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1652:1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1653:1876:commit 71728cf6ecc78dc65eabd9f5f04253ba9a38a546
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1654:1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1656:1906:    Lint clean post-edit (65 citation hits).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1657:1912:index 8d12881..f35da8b 100644
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1660:1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1661:1960:+- citation hits: 64 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1662:1972:+  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1663:1988:+  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1664:2109:   564	  dispositions table appended).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1665:2110:   565	
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1666:2168:The declared SPEC lint completed clean, but it reports 65 citation-prefix hits. That conflicts with the new §14.0/§14.1/§14.2 text, which still says current state is 64, so the stale-evidence advisory is improved but not fully closed.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1667:2170:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "citation hits|64|65|4 candidates|6×4|6 candidates|7×6|42 cells|real and distinct|substantively distinct|Identical reasoning" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1669:2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1670:2180:580:- citation hits: 64 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1671:2185:591:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1672:2188:605:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1674:2220:   264	  (`judgment://agent-synthesis`.)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1675:2221:   265	- Cost: Medium-low — one artefact shape.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1676:2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1677:2264:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1678:2267:97e65e6 spec(verify): Product B Decision SPEC -> verified; Completion Report filled
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1679:2269:85b6577 spec: 2026-05-18 agentic-installation-methodology IDEA + Decision SPEC
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1680:2279:/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline 2496545 -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1681:2281:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1682:2283: 1 file changed, 64 insertions(+), 29 deletions(-)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1683:2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1685:2295:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1686:2299:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:765:rounds amended §4-§12 of this Decision; the historical
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1688:2301:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1689:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1690:2318:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1651:   567	rounds amended §4-§12 of this Decision; the historical
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1691:2319:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1659:   575	| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1692:2320:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1694:2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1695:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1696:2326:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1697:2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1699:2339:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1701:2343:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1702:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1703:2352:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1704:2353:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1656:   374	Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1705:2355:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1924:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1365:unsigned at the v1.0 release with the signature block
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1706:2380:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1949:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4064:SPEC-bundle-only is now named, but §9’s umbrella says “shape-without-SPEC-bundle” while including SPEC-bundle-only, and it forecloses “paper-style only” even though §5.5 says paper-style could carry the same SPEC bundle with academic channel as primary. That leaves an academic-primary + SPEC-bundle path ambiguously unclosed. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:425).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1708:2391:specs/2026-05-18-agentic-installation-methodology/SPEC.md:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1709:2394:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1710:2402:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2546:   364	Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1711:2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1712:2830:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1714:2836:**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1715:2838:PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1716:2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1717:2847:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1719:2853:**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1720:2855:PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1829:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1842:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1855:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1857:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1863:**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1865:PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1872:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1874:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1880:**Quality Gate Result**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1882:PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1902:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "current state 64|64 current|citation hits: 64|Lint citation count: 64|current state 65|65 current|citation hits: 65|Lint citation count: 65" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1904:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1905:580:- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1906:591:  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1907:605:  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1925:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1929:   580	- citation hits: 65 (per current `lint-spec.sh` invocation)
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1940:   591	  pre-amendment value; current state 64 per §14.0
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1954:   605	  original verification; 64 current per §14.0).
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1960:**Quality Gate Result: PASS WITH ADVISORY, not clean.**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1962:R4 advisory is **partially closed**, not fully closed. Commit `595d167` fixed the primary §14.0 values: current lint count now says `65`, and local lint agrees: SPEC lint passes with `0 errors / 0 warnings / 65 citation-prefix hits`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1964:Remaining advisory: §14.1 and §14.2 still contradict §14.0 by saying current state is `64`:
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1973:**Quality Gate Result: PASS WITH ADVISORY, not clean.**
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1975:R4 advisory is **partially closed**, not fully closed. Commit `595d167` fixed the primary §14.0 values: current lint count now says `65`, and local lint agrees: SPEC lint passes with `0 errors / 0 warnings / 65 citation-prefix hits`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md:1977:Remaining advisory: §14.1 and §14.2 still contradict §14.0 by saying current state is `64`:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git rev-parse --short HEAD && git rev-parse --short origin/main' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
16f9c8d
16f9c8d

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git grep -n \"current state 64\\|64 current\\|citation hits: 64\\|Lint citation count: 64\" -- specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "MAJOR|BLOCKING|NOT RESOLVED|PARTIAL|PARTIALLY" ../agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md | tail -n 40' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
1619:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
1620:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
1621:1733:837:2496545 (HEAD -> main, origin/main, origin/HEAD) spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
1622:1734:846:    spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
1623:1735:851:    1.2 PARTIAL -> RESOLVED:
1624:1736:862:    1.4 PARTIAL -> RESOLVED:
1625:1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
1627:1762:1964:  4026	1.2: PARTIALLY RESOLVED.  
1629:1764:1970:  4032	1.4: PARTIALLY RESOLVED.  
1633:1770:1995:  4057	1.2: PARTIALLY RESOLVED.  
1635:1772:2001:  4063	1.4: PARTIALLY RESOLVED.  
1637:1799:2844:1.2 PARTIAL: RESOLVED.  
1638:1800:2847:1.4 PARTIAL: RESOLVED.  
1644:1808:2871:1.2 PARTIAL: RESOLVED.  
1645:1809:2874:1.4 PARTIAL: RESOLVED.  
1650:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
1652:1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
1654:1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
1676:2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
1677:2264:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
1681:2281:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
1683:2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
1689:2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
1694:2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
1695:2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
1696:2326:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
1697:2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
1702:2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
1703:2352:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
1709:2394:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
1711:2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
1712:2830:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
1716:2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
1717:2847:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
1829:Phase 5: SPEC review (BLOCKING)   (/review-spec runs quality gate + lint)
1842:3. `spec-review` skill (UPDATED, BLOCKING) — owns the per-type
1855:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
1857:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
1872:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
1874:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).

codex
**Quality Gate Result**
```yaml
spec_path: specs/2026-05-18-agentic-installation-methodology/SPEC.md
type: decision
bar: b-plus-candidates
review_model: gpt-5.5
mode: non_mutating_re_review
pass: true
failures: []
```

No MAJOR-or-higher issues remain.

R5 PARTIAL is closed: §14.0, §14.1, and §14.2 now consistently report current SPEC lint at `65` citation hits: [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:580), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:591), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:605). Targeted grep found no remaining stale `64` current-state references.

Verification run:
- `bash agents/scripts/lint-spec.sh .../IDEA.md` passed: 0 errors, 0 warnings, 20 citation hits.
- `bash agents/scripts/lint-spec.sh .../SPEC.md` passed: 0 errors, 0 warnings, 65 citation hits.
- `node agents/scripts/preflight.mjs` passed with one existing unmanaged top-level warning unrelated to this target.
- `git diff --check` passed.
- `HEAD` and `origin/main` are both `16f9c8d`; worktree remained clean.


tokens used
114,417
**Quality Gate Result**
```yaml
spec_path: specs/2026-05-18-agentic-installation-methodology/SPEC.md
type: decision
bar: b-plus-candidates
review_model: gpt-5.5
mode: non_mutating_re_review
pass: true
failures: []
```

No MAJOR-or-higher issues remain.

R5 PARTIAL is closed: §14.0, §14.1, and §14.2 now consistently report current SPEC lint at `65` citation hits: [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:580), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:591), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:605). Targeted grep found no remaining stale `64` current-state references.

Verification run:
- `bash agents/scripts/lint-spec.sh .../IDEA.md` passed: 0 errors, 0 warnings, 20 citation hits.
- `bash agents/scripts/lint-spec.sh .../SPEC.md` passed: 0 errors, 0 warnings, 65 citation hits.
- `node agents/scripts/preflight.mjs` passed with one existing unmanaged top-level warning unrelated to this target.
- `git diff --check` passed.
- `HEAD` and `origin/main` are both `16f9c8d`; worktree remained clean.


