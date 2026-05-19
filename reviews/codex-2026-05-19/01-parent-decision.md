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
session id: 019e3e4f-78bb-7020-88f7-b81ee3768043
--------
user
Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC, status: verified). This is the parent Decision binding the shape of Product B (agentic-installation-methodology). Per the v1 BES spec procedure, BLOCKING per-slice cross-family review per agents/MODEL_ROUTING.md. Read the SPEC, the producing IDEA at specs/2026-05-18-agentic-installation-methodology/IDEA.md, and the upstream research workpad at specs/2026-05-17-agentic-installation-methodology/RESEARCH.md. Look for: (1) candidate-space gaps (any shape option missing from §5?); (2) trade-off matrix errors in §6; (3) RFC 2119 misuse outside §7; (4) lock/reversal coherence in §9/§10; (5) places where rolls-royce framing (owner://transcript-2026-05-18) is misapplied; (6) places where the methodology primitives the SPEC names DON'T match how a different-family agent would name/group them. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations; review only.
codex
I’ll do this as a read-only quality gate: first refresh the repo/workflow context that governs this review, then inspect the Decision SPEC against the IDEA and research workpad with line-anchored findings.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|MODEL_ROUTING|spec" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
3:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Assets; reuse_rule=safe for future repo-wide Assets governance and this creature-sandbox workflow in the same workspace; treat branch/worktree state, mounted-drive state, smoke counters, and current spec status as time-specific.
13:- Assets repo, single repo, not nested repos, bes-splash-3d, ProceduralObjects, BuildEpicShit, asset provenance, spec-first, WORKFLOW.md, preflight.mjs
25:## Task 3: Visual-polish spec capture and day-end closeout, partial
29:- rollout_summaries/2026-05-09T23-01-35-KIH0-assets_repo_orientation_procedural_creature_v2_and_visual_po.md (cwd=/var/home/hasnobeef/buildepicshit/Assets, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T16-01-35-019e0ef9-8995-7f72-9181-edaa41d69c4a.jsonl, updated_at=2026-05-17T20:32:31+00:00, thread_id=019e0ef9-8995-7f72-9181-edaa41d69c4a, queued visual-polish spec plus clean stop-for-the-day closeout)
42:- when the user says "see you tomorrow for polish" or "lets clsoe for today, clean up the repo and close ourt cleanbyl" -> stop at a clean handoff, record the next approved slice, and do not start implementation just because the next spec exists [Task 2][Task 3]
51:- The V2 sandbox keeps the existing 2D `Line2D` chain model while adding `set_preset_by_id`, current/obstacle steering, trails, preset-specific visual profiles, and stronger diagnostics [Task 2]
53:- The validation stack that passed for the V2 creature work was `bash .agents/scripts/lint-spec.sh ...`, `python3 tools/procedural_lab/validate_experiments.py procedural/generation/experiments`, Godot headless parse, visible X11 smoke, and `git diff --check` [Task 2]
55:- The queued next slice is `.agents/specs/2026-05-17-procedural-creature-visual-polish-godot/SPEC.md`, which is lint-clean and currently `approved-pending-owner` [Task 3]
65:- Symptom: the next visual-polish implementation starts just because the current sandbox looked good and the next spec was drafted. Cause: closeout language gets mistaken for approval to continue. Fix: if the user says to stop for the day, leave the next slice `approved-pending-owner` and end with a clean handoff [Task 3]
68:scope: Use for ACTOCCATUD retrospective repo audits, spec-inventory passes, tracker cleanup, and approved-route M4 construction-probe implementation.
69:applies_to: cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD; reuse_rule=safe for future orientation, roadmap-gap review, and C#/.NET-plus-Godot probe execution in this checkout family; treat current counts, issue bindings, and verify-environment details as time-specific.
81:## Task 2: Repo reorientation and spec inventory, success
85:- rollout_summaries/2026-05-09T19-49-15-DK7w-m4_construction_probe_tracker_cleanup.md (cwd=/var/home/hasnobeef/buildepicshit/ACTOCCATUD, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/09/rollout-2026-05-09T12-49-15-019e0e49-75f2-7c40-b317-bcc2b27944f2.jsonl, updated_at=2026-05-16T01:23:46+00:00, thread_id=019e0e49-75f2-7c40-b317-bcc2b27944f2, authority-doc audit plus spec inventory and preflight warning capture)
89:- ACTOCCATUD, repo-orientation, GAME_SEED.md, IDEAS_LIBRARY.md, preflight.mjs, .agents/specs, TASK_DIR_COUNT 0, retrospective audit
99:- ACTOCCATUD, repo-orientation, TASK.md, approved-spec-decomposition, MODEL_ROUTING, green-room evaluation, reset tree, docs recovery, linear, verification
119:- approved-pending-owner, status: approved, Wormwright, Signal Wraith, Forked Admiral, Blood Siren, lint-spec.sh, verify-local.sh, be3f0e8
123:- when the user asks to “reorientate” and “do an audit on the full project retrospectively” and to “reopen all the previous spec documents” so the agent can produce “the individuals tasks and roadmap and all the artifacts we missed previously” -> start with retrospective authority/spec-corpus review before implementation [Task 1][Task 2][Task 3]
134:- The latest recorded inventory was `68` specs under `.agents/specs`, `62` `closed`, `1` `verified`, `5` `approved`, and `0` `tasks/` directories; recheck counts on new runs instead of assuming this exact mix is still current [Task 2]
135:- `WORKFLOW.md` treats missing `TASK.md` artifacts as a real execution gap, while `approved-spec-decomposition` and `.agents/workflows/decompose-approved-spec.md` make `TASK.md` the authoritative executable bridge after approval [Task 3]
136:- `MODEL_ROUTING.md` lagged behind the newer TASK-based workflow in the recorded orientation run; when those docs conflict, privilege `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow/skill [Task 3]
139:- The deterministic probe scaffold covers primitive-chain state, deterministic hashing, controlled detachment, collision consequence, readability bands, and a Godot-side presentation adapter; the evidence packet lives at `.agents/specs/2026-05-13-m4-executable-prototype-probes/evidence/construction_probe.md` [Task 1]
141:- The four owner-approved candidate-control contracts were Wormwright portal topology, Signal Wraith visibility / AI, Forked Admiral clone ledger, and Blood Siren self-spend / abandonment; the recorded approval commit was `be3f0e8 spec: approve high-risk hull contracts` [Task 5]
149:- Symptom: older routing docs contradict the TASK-based workflow. Cause: `MODEL_ROUTING.md` drifted behind `WORKFLOW.md`, `SPEC.schema.md`, and the decomposition workflow. Fix: privilege the newer TASK authority docs and flag the mismatch for upstream repair [Task 3]
158:applies_to: cwd=/var/home/hasnobeef/buildepicshit/IKTO; reuse_rule=safe for future IKTO orientation and interruption-handling in this checkout family; treat branch/worktree state, paused execution gates, and current doc mismatches as time-specific.
164:- rollout_summaries/2026-05-03T12-39-26-LwnR-ikto_core_fantasy_control_model_and_approved_decision_spec.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/03/rollout-2026-05-03T05-39-26-019dedd9-cb27-7a02-bdfb-4a6abc45b71f.jsonl, updated_at=2026-05-04T04:06:31+00:00, thread_id=019dedd9-cb27-7a02-bdfb-4a6abc45b71f, reset-era posture and preflight location)
178:- IKTO, repo-orientation, STATUS.md, WORKFLOW.md, AGENTS.md, CLAUDE.md, step-(d) research plan, Godot 4, decomposed, audit-entry-docs.sh, lint-spec.sh, preflight.mjs, hold a moment
184:- when the user asks for "a full project status update" -> lead with current state, paused gate, and next execution step before proposing edits or speculative planning [Task 2]
194:- `.agents/specs/2026-05-13-ikto-prototype-architecture-decisions/research/2026-05-15-step-d-research-plan.md` is the correct place to capture day-0 readiness, candidate lanes, local tool readiness, and initial spike order; it is not the architecture decision itself [Task 2]
195:- `bash .agents/scripts/audit-entry-docs.sh`, `bash .agents/scripts/lint-spec.sh .agents/specs/2026-05-13-ikto-prototype-architecture-decisions/SPEC.md`, `node .agents/scripts/preflight.mjs`, and `git diff --check` all passed in the later status refresh; preflight only warned about unmanaged top-level paths [Task 2]
203:- Symptom: continuing inspection after "hold a moment" creates avoidable interruption. Cause: treating the pause as soft instead of hard. Fix: acknowledge the hold and stop immediately [Task 2]
207:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Assets; reuse_rule=safe for future Assets procedural-research checkpoints and cross-repo handoff into consumers like IKTO; treat branch/worktree state, benchmark counts, and hardware-specific evidence as time-specific.
219:## Task 2: Translate Assets swarm evidence into IKTO-specific next-step framing, success
227:- IKTO, Assets, step by step, cult-count bands, pressure-density reads, same-frame gameplay queries, chamber constraints, Steam Deck, approved spec, handover-ready
233:- when Assets research is being used to inform IKTO -> default to converting the proof into IKTO-specific acceptance criteria rather than re-litigating whether Godot boids are possible [Task 2]
242:- The correct next move for IKTO is not to ask whether Godot boids are possible; it is to define the product gate around cult-count bands, visibility needs, aggregate pressure/density reads, same-frame gameplay queries, chamber/path constraints, player-facing presentation, and target-hardware performance, then write a small approved spec/task set around those gates [Task 2]
248:- Symptom: Assets preflight unmanaged-top-level warnings tempt local repo patches. Cause: treating a fleet-policy layout issue as a product-repo problem. Fix: route those warnings to `bes-fleet-policy` and use a source-first fix path instead of patching Assets ad hoc [Task 1]
251:scope: Use for IKTO design refinement, decision-spec approval/closeout, and Unity prototype proof work after orientation is complete.
252:applies_to: cwd=/var/home/hasnobeef/buildepicshit/IKTO; reuse_rule=safe for future design/spec/prototype work in this checkout family; treat current verified runtime paths and STATUS wording as time-specific.
254:## Task 1: Core fantasy and control-model refinement into an approved decision spec, success
258:- rollout_summaries/2026-05-03T12-39-26-LwnR-ikto_core_fantasy_control_model_and_approved_decision_spec.md (cwd=/var/home/hasnobeef/buildepicshit/IKTO, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/03/rollout-2026-05-03T05-39-26-019dedd9-cb27-7a02-bdfb-4a6abc45b71f.jsonl, updated_at=2026-05-04T04:06:31+00:00, thread_id=019dedd9-cb27-7a02-bdfb-4a6abc45b71f, approved core-fantasy/control-model decision)
262:- absolute devotion, chosen deity contract, Prayer Construction Heroics, central conduit, outside-only powers, constant pressure, FTL fires, object rotation, approved decision spec
297:- The approved decision artefacts live at `.agents/specs/2026-05-03-ikto-core-fantasy-and-control-model/{IDEA,SPEC}.md`; the next likely specs were first playable thesis, base topology model, direct deity actions, and threat model contract [Task 1]
299:- `f508e21 spec: close IKTO core control model` closed the decision spec, and `5384d8e chore: update gitignore reset-era comments` preserved the unrelated `.gitignore` cleanup as a separate commit [Task 2]
302:- `bash tools/unity/verify.sh` is the canonical heavy gate for the current Unity prototype lane, with `bash tools/unity/test-editmode.sh`, `bash .agents/scripts/lint-spec.sh <IDEA|SPEC>`, `node .agents/scripts/preflight.mjs`, and `git diff --check` as the supporting gates [Task 3]
308:- Symptom: an artefact is called "done" while still `approved` with blank checklists/reporting. Cause: conflating substantive approval with administrative closure. Fix: inspect front matter, checklist state, and completion report before claiming closeout [Task 2]
310:- Symptom: Unity verification rewrites tracked scene/project files even though the proof passed. Cause: editor reserialization noise from `bash tools/unity/verify.sh`. Fix: inspect and discard that churn before closeout [Task 3]
311:- Symptom: implementation drifts from naming constraints in the spec. Cause: treating naming as documentation-only. Fix: enforce constraints such as kebab-case route ids in code, not just prose [Task 3]
315:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Assets; reuse_rule=safe for future procedural-object research and lookdev in this workspace; treat generated outputs and local `.agents/` harness files as checkout-specific.
321:- rollout_summaries/2026-05-08T03-07-59-evfA-procedural_objects_stylized_asteroid_research_redo.md (cwd=/var/home/hasnobeef/buildepicshit/Assets, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/07/rollout-2026-05-07T20-07-59-019e058e-6a05-7912-8698-5f9619bf58a2.jsonl, updated_at=2026-05-09T15:18:16+00:00, thread_id=019e058e-6a05-7912-8698-5f9619bf58a2, engine-agnostic procedural-objects spec)
325:- Assets, procedural objects, shaders, UV mapping, engine agnosticish, low-poly toon, .agents ignored, lint-spec.sh, procedural-animation precedent
339:- when the user asks to "look at procedural objects and shaders and things like that" and says "We should research this for both Unity and Godot" while preferring something "engine agnosticish" -> start with research/spec work, not implementation [Task 1]
349:- The owner-approved contract artifacts are `.agents/specs/2026-05-08-procedural-objects-shaders/{IDEA,SPEC}.md`, and the closeout note emphasized explicit file staging only if the owner later wants these preserved in git [Task 1]
352:- The practical verification stack was: `bash .agents/scripts/lint-spec.sh ...`, `python3 ProceduralObjects/lab/01-asteroids/quality_report.py --recipe ... --index ...`, `magick identify ...godot-material-stylized-researched.png`, and direct Godot render checks; the style gate is a field sample that reads like a game object pass, not a labelled material grid [Task 2]
361:# Task Group: bes-fleet-policy source-first policy updates / propagation
362:scope: Use for fleet-owned policy, skill, preflight, and workspace-layout changes that must be authored in bes-fleet-policy first and then propagated with provenance.
363:applies_to: cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy; reuse_rule=safe for future fleet-policy authoring and propagation in this source repo; treat commit SHAs, exact child-repo commit ids, and current model inventory as time-specific.
369:- rollout_summaries/2026-05-04T13-39-35-lSv6-bes_fleet_policy_parallelism_model_routing_v2.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T06-39-35-019df337-3852-7181-878a-56cb998f2b98.jsonl, updated_at=2026-05-04T14:12:57+00:00, thread_id=019df337-3852-7181-878a-56cb998f2b98, policy/spec plus propagation)
373:- bes-fleet-policy, agents/, model routing, parallel execution policy, Contract SPEC, fleet-sync.sh, propagated-repo, 0872f19, 4a80ecb, 61155c7
379:- rollout_summaries/2026-05-05T02-04-55-IZSU-fleet_policy_workspace_roots_preflight_ikto_unity.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/04/rollout-2026-05-04T19-04-55-019df5e1-9706-7993-a5dd-ee96b44f50a0.jsonl, updated_at=2026-05-05T02:31:22+00:00, thread_id=019df5e1-9706-7993-a5dd-ee96b44f50a0, source-first workspace-layout fix plus push)
389:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
393:- AI engineering, tactical skills, approved-spec-decomposition, caveman, diagnosis, tdd, SKILL_REGISTRY, fleet-files.txt, Assets workspace, local entry docs
397:- when stale fleet docs or workflow rules need changing, the user wants them treated as spec-worthy work, not ad hoc edits [Task 1][Task 2][Task 3]
399:- when the user explicitly says "Do not patch IKTO’s `.agents/WORKSPACE_LAYOUT.md` locally; it is fleet-owned drift. Update the source policy in `bes-fleet-policy`, then propagate." -> default to source-first fixes in `bes-fleet-policy`, not child-repo local edits [Task 2]
405:- `bes-fleet-policy` is the canonical fleet source: authoritative policy/docs/scripts live under `agents/`, while child repos consume propagated `.agents/`; `specs/*` stay local to the source repo [Task 1][Task 2]
407:- The v2 parallelism/model-routing change made `agents/MODEL_ROUTING.md` a required orientation read before dispatch/delegation/model-specific work and added a `Parallel Execution Policy` to `agents/OPERATING_MODEL.md` [Task 1]
412:- The AI-engineering implementation added canonical skills `caveman`, `diagnosis`, `tdd`, and `approved-spec-decomposition`, plus the `decompose-approved-spec` workflow/command; future similar additions should update `agents/SKILL_REGISTRY.md`, `agents/scripts/fleet-files.txt`, `agents/scripts/fleet-sync.sh`, and the `.claude` mirrors together [Task 3]
413:- `Assets` is a separate repo whose root `.gitignore` already ignored `.agents/` and `.claude/`; local entry docs `Assets/{AGENTS,CLAUDE,WORKFLOW}.md` were added as workspace support, and the parent repo's `/Assets/` ignore means those docs are local workspace support unless a future spec changes that posture [Task 3]
418:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]
427:applies_to: cwd=/var/home/hasnobeef/buildepicshit/UsefulIdiots; reuse_rule=safe for future rebuild/spec work in this checkout family; treat STATUS wording and current branch/dirty-state details as time-specific.
437:- UsefulIdiots, LEVEL_SET.md, Round 2, The Verb, over-the-shoulder, Arc Raiders, Saros, foundation rebuild, MODEL_ROUTING
447:- UI.Core.AI, UI.Core.Simulation, approved, paused closeout, next_milestone, lint-spec.sh, git diff --check
453:- when the user gives a brief positive confirmation like `approve` or "perfect lets keep going" during contract work -> treat it as approval to ratify the current spec and continue the current slice [Task 2]
466:- Symptom: orientation drifts from the live repo state after policy changes. Cause: relying on an earlier summary instead of rereading current routing files. Fix: reread `AGENTS.md`, `STATUS.md`, `LEVEL_SET.md`, `WORKFLOW.md`, and `.agents/MODEL_ROUTING.md` before continuing [Task 1]
472:applies_to: cwd=/var/home/hasnobeef/buildepicshit/Floom; reuse_rule=safe for future Floom orientation and proof-of-work implementation in this checkout family; treat branch names, exact test counts, and STATUS framing as time-specific.
497:- when the user asks to inspect "our progress and what is currently happening in the project" -> separate stable platform/compiler progress from demo-driven drift [Task 1]
498:- when the user says "lets completely AXE The GR-001 work like destory it in a fire" -> treat demo-specific drift as disposable when the owner asks for a hard reset [Task 2]
505:- `STATUS.md` still described the broader project as Demo 1 alignment, but the session-specific recovery frame shifted away from GR-001 toward the core compiler thesis [Task 1]
508:- Verification included direct artifact inspection with `rg` for `HospitalRoom`, `hospital.room.review-proxy.v0`, and visible module anchors, not just build/test success [Task 2]
519:applies_to: cwd=/var/home/hasnobeef; reuse_rule=safe for future maintenance and update triage on this host; treat exact package versions, freed disk totals, and staged deployment numbers as time-specific.
550:- The specific failing layers seen so far were `Apps for User: hasnobeef` Flatpak update and `Brew Update` inside `uupd.service`; the strongest durable log handles were `module_fail`, `flatpak update -y`, `exit status 139`, and `Segmentation fault (core dumped)` [Task 1][Task 2]
562:- Symptom: `sed` or similar commands fail on `/etc/polkit-1/rules.d/uupd.rules`. Cause: the path may actually be a directory containing the real file. Fix: inspect with `ls -la` before assuming bad rule contents [Task 1]
563:- Symptom: broad journal warnings distract from the true update blocker. Cause: the durable signal is buried in noise. Fix: focus on `uupd.service` lines naming `Brew Update`, `Apps for User`, or the specific failing CLI first [Task 2]

codex
The memory refresh points to this repo as the canonical fleet-policy source and confirms that `agents/MODEL_ROUTING.md` is part of required orientation for model-family review. I’m now reading the live authority docs and the three review artefacts rather than relying on that summary.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'wc -l STATUS.md agents/OPERATING_MODEL.md agents/MODEL_ROUTING.md specs/2026-05-18-agentic-installation-methodology/SPEC.md specs/2026-05-18-agentic-installation-methodology/IDEA.md specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   352 STATUS.md
   601 agents/OPERATING_MODEL.md
   349 agents/MODEL_ROUTING.md
   514 specs/2026-05-18-agentic-installation-methodology/SPEC.md
   276 specs/2026-05-18-agentic-installation-methodology/IDEA.md
   563 specs/2026-05-17-agentic-installation-methodology/RESEARCH.md
  2655 total

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "cross-family|family|review|BLOCKING|Decision|RFC 2119|MUST|SHOULD|MAY|candidate|Rolls|rolls|reversal|lock" agents/MODEL_ROUTING.md agents/OPERATING_MODEL.md STATUS.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
STATUS.md:36:- Pushes to `main` are administrative. Both `block-edit-on-main.sh`
STATUS.md:37:  and `block-push-to-main.sh` honour `branch_policy: main-direct`
STATUS.md:78:| `2026-05-17-cross-family-compliance-audit` | task | verified |
STATUS.md:81:`verified` implemented §7 of the parent Decision via 5 atomic
STATUS.md:82:commits (template + lint + spec-authoring + spec-review +
STATUS.md:84:spec-evidence-governance pass on the §17.5 SE candidates.
STATUS.md:103:| `2026-05-17-cross-family-compliance-audit` | task | verified |
STATUS.md:105:IDEAs at `draft` (genuine owner-blocking choices):
STATUS.md:109:| `2026-05-17-eval-driven-posture` | decision | draft (Q1-Q4 owner-blocking) |
STATUS.md:110:| `2026-05-17-publish-the-moat` | decision | draft (Q1-Q5 owner-blocking) |
STATUS.md:123:- Add `block-edit-on-main.sh` automated test coverage (29→33) — LANDED.
STATUS.md:127:Wave 2 (Decision-IDEA + audit Task SPEC + Decision SPEC, landed):
STATUS.md:135:- `2026-05-17-ceremony-weight-refactor` Decision SPEC; status:
STATUS.md:140:- `2026-05-17-eval-driven-posture` Decision IDEA — LANDED
STATUS.md:141:  (status: draft; owner-blocking on adopt-vs-status-quo + shape).
STATUS.md:144:- `2026-05-17-cross-family-compliance-audit` Task IDEA —
STATUS.md:148:- `2026-05-17-publish-the-moat` Decision IDEA — LANDED
STATUS.md:149:  (status: draft; owner-blocking publish-or-stay).
STATUS.md:155:  candidates.
STATUS.md:158:  candidates.
STATUS.md:159:- Flip `2026-05-17-cross-family-compliance-audit`
STATUS.md:161:  candidates.
STATUS.md:163:Owner-blocking IDEAs (genuine design choices awaiting owner):
STATUS.md:167:  Q4 blocking-or-non-blocking in verification path.
STATUS.md:178:- `2026-05-17-ceremony-weight-refactor` Decision
STATUS.md:193:- `spec-review/SKILL.md`: BLOCKING capture-after defer-shorthand
STATUS.md:203:  `cross-family-compliance-audit`); both produce small Task
STATUS.md:207:- Owner-blocking IDEAs (`eval-driven-posture`,
STATUS.md:216:| Skill progressive-disclosure refactor | LANDED — `agents/skills/<name>/references/` convention codified; spec-review SKILL.md slimmed 325 → 234 lines (per-type gates extracted); spec-authoring SKILL.md slimmed 281 → 206 lines (RA-first + studio-principles extracted) |
STATUS.md:226:- `code-review`
STATUS.md:233:- `spec-review` (BLOCKING; + `references/per-type-gates.md`)
STATUS.md:258:`/idea-capture <slug>`, `/author-spec`, `/review-spec`,
STATUS.md:260:`/review-diff`, `/spec-evidence`, `/symphony-dispatch-check`,
STATUS.md:268:- `block-ai-attribution.sh` — no co-author trailers
STATUS.md:269:- `block-edit-on-main.sh` — protected-branch gate; honours
STATUS.md:271:- `block-git-add-all.sh` — no bulk staging
STATUS.md:272:- `block-push-to-main.sh` — protected-branch push gate; honours
STATUS.md:274:- `block-verify-bypass.sh` — verify gate non-negotiable
STATUS.md:279:real-trigger blocks, false-positive cases (commit messages,
STATUS.md:335:6. Blocking review via `/review-spec` (per-type quality gate +
STATUS.md:338:8. Decompose (BLOCKING for Contract/Task with ≥ 2 slices) via
STATUS.md:341:9. Subagents MUST NOT modify the SPEC except the Completion
STATUS.md:343:10. Cross-validate (BLOCKING) on a different model family before
STATUS.md:344:    each TASK.md flips `in-progress → in-review`.
STATUS.md:352:review, no decomposition.
agents/OPERATING_MODEL.md:13:MAY operate.
agents/OPERATING_MODEL.md:44:  MUST be in the repo's `.gitignore`. The fleet propagation
agents/OPERATING_MODEL.md:47:  procedure available); the content MUST NOT be committed or
agents/OPERATING_MODEL.md:50:  as BLOCKING.
agents/OPERATING_MODEL.md:55:- **Agents MUST NOT be dispatched against PUBLIC OSS repos from the
agents/OPERATING_MODEL.md:57:  `/var/home/hasnobeef/buildepicshit` MUST NOT target Wick or Mimir
agents/OPERATING_MODEL.md:65:  MUST be authored on the assumption that they may end up in the
agents/OPERATING_MODEL.md:70:(internal → OSS or OSS → internal) is a Decision-class spec under
agents/OPERATING_MODEL.md:80:every hook) — MUST be authored in `bes-fleet-policy` first and
agents/OPERATING_MODEL.md:87:- A change to `.agents/skills/spec-review/SKILL.md` in IKTO is
agents/OPERATING_MODEL.md:88:  not a fleet change; it is repo-local drift and MUST be
agents/OPERATING_MODEL.md:89:  rejected at review. The correct workflow is: amend
agents/OPERATING_MODEL.md:90:  `agents/skills/spec-review/SKILL.md` in `bes-fleet-policy`
agents/OPERATING_MODEL.md:96:  command, an ACTOCCATUD-only Godot agent definition) MUST live
agents/OPERATING_MODEL.md:98:  MUST NOT shadow the names of fleet skills, workflows, hooks,
agents/OPERATING_MODEL.md:100:  that's a Decision-class spec authored here.
agents/OPERATING_MODEL.md:101:- Subagents executing a SPEC in a child repo MUST NOT modify
agents/OPERATING_MODEL.md:116:authored as IDEA → SPEC in `bes-fleet-policy/specs/`; review is
agents/OPERATING_MODEL.md:117:blocking; owner approves; propagation lands the artefact + the
agents/OPERATING_MODEL.md:123:2. `AGENTS.md` is the canonical, agent-agnostic entry doc — read by Codex, Cursor, Aider, Copilot, Jules, and other AGENTS-aware tools. Optional agent-specific files (`CLAUDE.md`, `GEMINI.md`, etc.) MAY exist alongside `AGENTS.md` to add tool-specific context; Claude Code reads `CLAUDE.md`, Gemini CLI reads `GEMINI.md`, and so on. The agent-specific files SHOULD import `AGENTS.md` (e.g. `@AGENTS.md`) and MUST NOT carry policy that the agent-agnostic file lacks.
agents/OPERATING_MODEL.md:161:   blockers from current evidence: missing local packages, disabled CI, stale
agents/OPERATING_MODEL.md:164:   workers can classify failures as expected, new, or owner-blocking.
agents/OPERATING_MODEL.md:166:   owner and the primary agent. The conversation MUST resolve the implied spec
agents/OPERATING_MODEL.md:168:   a recommendation, and any owner-blocking questions. Capture the
agents/OPERATING_MODEL.md:172:   MUST NOT appear as evidence in the artefact. See the Step 4 Ideate
agents/OPERATING_MODEL.md:176:   `.agents/specs/SPEC.<type>.template.md`. The chosen type MUST match the
agents/OPERATING_MODEL.md:180:   `spec-review` skill; the gate is blocking.
agents/OPERATING_MODEL.md:186:   output, residual risk, and spec evidence candidates.
agents/OPERATING_MODEL.md:187:11. **Govern evidence**: capture durable lessons as spec evidence candidates.
agents/OPERATING_MODEL.md:193:agent precedes spec authoring. The conversation MUST resolve the implied spec
agents/OPERATING_MODEL.md:195:recommendation, and any owner-blocking questions. Capture it as `IDEA.md` at
agents/OPERATING_MODEL.md:198:conversational inputs but MUST NOT appear as evidence in the artefact (see
agents/OPERATING_MODEL.md:215:spec must define objective evidence, review checkpoints, owner decisions, or a
agents/OPERATING_MODEL.md:221:`owner-blocking`. It may propose options, but those options are not authority
agents/OPERATING_MODEL.md:234:Quality gates are blocking and per-type:
agents/OPERATING_MODEL.md:238:- Decision: bar (b) plus candidate-comparison structure.
agents/OPERATING_MODEL.md:240:The `spec-review` skill enforces these as a blocking gate. A spec MUST NOT
agents/OPERATING_MODEL.md:241:advance to `approved` while any blocking criterion fails. RFC 2119 normative
agents/OPERATING_MODEL.md:242:language applies in IDEA.md, Task SPEC, Contract SPEC, and Decision SPEC's
agents/OPERATING_MODEL.md:243:Decision Statement section.
agents/OPERATING_MODEL.md:253:latitude, provenance/licensing requirements, exact output paths, review
agents/OPERATING_MODEL.md:256:`owner-blocking` instead of generating plausible content.
agents/OPERATING_MODEL.md:292:- A successful run may stop at a handoff/review state; it does not have to
agents/OPERATING_MODEL.md:304:review, decomposition, cross-validation; lands at `status: closed`
agents/OPERATING_MODEL.md:375:(block-git-add-all, block-edit-on-main, block-push-to-main,
agents/OPERATING_MODEL.md:376:block-verify-bypass, block-ai-attribution) and per-repo commit-msg
agents/OPERATING_MODEL.md:412:- Cross-family validation: `wt switch pr:NNN -x codex` to check
agents/OPERATING_MODEL.md:413:  out a primary-lane PR for different-family review.
agents/OPERATING_MODEL.md:429:- **Spec reviewer**: rejects ambiguity, unsafe assumptions, and missing tests.
agents/OPERATING_MODEL.md:439:subagents, model-specific repo workers, or multi-agent reviews.
agents/OPERATING_MODEL.md:442:- Claude is dispatched deliberately for independent review, ambiguity checks,
agents/OPERATING_MODEL.md:448:  behavior versus cost-effective deep technical review.
agents/OPERATING_MODEL.md:462:Before substantial research, code review, verification, or implementation,
agents/OPERATING_MODEL.md:463:agents MUST evaluate whether independent parts of the task can run in
agents/OPERATING_MODEL.md:466:Agents SHOULD parallelize work when it is safe and useful:
agents/OPERATING_MODEL.md:469:- Expected wall-clock savings exceed coordination cost.
agents/OPERATING_MODEL.md:476:Preferred fanout cases are research, code review, documentation inventory,
agents/OPERATING_MODEL.md:480:Implementation work MAY fan out only when write ownership is disjoint or
agents/OPERATING_MODEL.md:481:isolated by branch/worktree. Multiple write-capable agents MUST NOT edit the
agents/OPERATING_MODEL.md:482:same files concurrently, and one primary agent MUST own integration order and
agents/OPERATING_MODEL.md:485:Agents MAY initiate subagents when they judge delegation is the correct
agents/OPERATING_MODEL.md:488:agents MAY check with the owner before dispatch.
agents/OPERATING_MODEL.md:492:coupled single-file edits, urgent blocking steps, and owner-interactive
agents/OPERATING_MODEL.md:493:ideation SHOULD remain local unless the owner explicitly requests fanout.
agents/OPERATING_MODEL.md:522:- `spec-review`
agents/OPERATING_MODEL.md:525:- `code-review`
agents/OPERATING_MODEL.md:538:- Do not promote agent-authored imperatives into durable rules without review.
agents/OPERATING_MODEL.md:550:  ideation conversations and to authoring/review reasoning. Long ideation
agents/OPERATING_MODEL.md:554:  candidates), every factual claim MUST carry a citation prefix from the
agents/OPERATING_MODEL.md:601:- Spec evidence candidates, if any.
agents/MODEL_ROUTING.md:40:| Claude Code | `2.1.126 (Claude Code)` | Peer frontier coding/review lane when dispatched deliberately. |
agents/MODEL_ROUTING.md:55:  fit for deep technical/spec review. Do not hard-code model recency as
agents/MODEL_ROUTING.md:64:  when a review genuinely needs deeper thought.
agents/MODEL_ROUTING.md:69:  current provider cost, and the need for independent model-family review. Use
agents/MODEL_ROUTING.md:107:| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Cheap fanout and routine edits. |
agents/MODEL_ROUTING.md:108:| `claude-opus-4-7` | configured, documented, approved-for-fleet | Frontier coding, high-risk implementation review, architecture/spec critique, public-OSS release review, and independent second-pass code review where latest Claude behavior matters. | Cheap fanout and routine edits. |
agents/MODEL_ROUTING.md:109:| `claude-opus-4-6` | needs-probe, approved-for-fleet | Cost-effective deep technical review, difficult bug analysis, architecture critique, and second-model verification when 4.6 is available and its cost/quality behavior is preferred for the task. | Blind replacement for 4.7 without probing the exact CLI id, availability, and current provider cost/token posture. |
agents/MODEL_ROUTING.md:111:| `haiku` | documented, needs-probe | Simple scans, short summaries, low-risk formatting, cheap support work. | Complex code edits, final review, ambiguous specs. |
agents/MODEL_ROUTING.md:122:| Root fleet management | Codex on `gpt-5.5`, `xhigh` | Claude Opus 4.7 or 4.6 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
agents/MODEL_ROUTING.md:124:| New non-trivial SPEC | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 critique | Claude should review ambiguity before high-risk execution; prefer 4.6 when cost/quality fit is better. |
agents/MODEL_ROUTING.md:125:| Spec review | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` | Both for high-risk specs | Use independent review for public OSS, architecture, security, release, or cross-repo work. |
agents/MODEL_ROUTING.md:130:| Code review | Codex `gpt-5.5` with `code-review` | Claude Opus 4.7 or 4.6 | Findings first, severity ordered, with file/line citations. |
agents/MODEL_ROUTING.md:131:| Public OSS release work | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
agents/MODEL_ROUTING.md:132:| Green room product evaluation | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
agents/MODEL_ROUTING.md:140:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
agents/MODEL_ROUTING.md:161:  cross-validation Claude Opus 4.7/4.6 (different family).
agents/MODEL_ROUTING.md:162:- `task_class: code-review` → cross-family from the implementer.
agents/MODEL_ROUTING.md:163:- `task_class: verification` (behavioral) → different family
agents/MODEL_ROUTING.md:164:  from the implementer; mechanical verification (lint, test) MAY
agents/MODEL_ROUTING.md:165:  share family.
agents/MODEL_ROUTING.md:167:  for the primary; cross-family reviewer for high-stakes claims.
agents/MODEL_ROUTING.md:169:`cross_validation_lane` MUST be a different model family from
agents/MODEL_ROUTING.md:171:without cross-family pairing
agents/MODEL_ROUTING.md:180:decomposed`. The decomposition skill MUST NOT.
agents/MODEL_ROUTING.md:194:| Codex `gpt-5.5` budget constrained | Move independent review/spec critique to Claude Opus 4.7 or 4.6; keep Codex for integration and verification if possible. |
agents/MODEL_ROUTING.md:195:| Claude Opus 4.7 budget healthy | Use Opus for spec review, second-pass code review, and high-risk repo work where a different model family adds value. |
agents/MODEL_ROUTING.md:196:| Claude Opus 4.7 budget constrained | Prefer Opus 4.6 for deep technical reviews when available and adequate; keep 4.7 for only the riskiest reviews. |
agents/MODEL_ROUTING.md:197:| Claude Opus 4.6 budget healthy | Use it for deep technical issue review and second-model verification when it preserves quality at lower cost. |
agents/MODEL_ROUTING.md:212:4. Before substantial research, code review, verification, or implementation,
agents/MODEL_ROUTING.md:213:   agents MUST evaluate whether independent work can run in parallel.
agents/MODEL_ROUTING.md:218:6. Prefer fanout for independent research, code review, documentation
agents/MODEL_ROUTING.md:220:   scans when wall-clock savings exceed coordination cost.
agents/MODEL_ROUTING.md:222:   single-file edits, urgent blocking steps, and owner-interactive planning
agents/MODEL_ROUTING.md:229:10. Multiple spec authors/reviewers are encouraged for important work because
agents/MODEL_ROUTING.md:234:12. For decomposed approved specs, review worker output first for SPEC
agents/MODEL_ROUTING.md:236:13. For public OSS repos, prefer review/spec work first and avoid public CI churn
agents/MODEL_ROUTING.md:244:    model family has verified the evaluation packet.
agents/MODEL_ROUTING.md:249:    reviews. Set an expected wait budget in the root status update and do not
agents/MODEL_ROUTING.md:251:    process exits badly, violates scope, exceeds the planned wall-clock budget,
agents/MODEL_ROUTING.md:260:Claude independent spec review:
agents/MODEL_ROUTING.md:268:  "Read AGENTS.md, CLAUDE.md, WORKFLOW.md, and the target SPEC.md. Review only. Return blockers, ambiguity, unsafe assumptions, missing verification, and owner decisions. Do not edit files."
agents/MODEL_ROUTING.md:282:Claude cost-effective deep technical review candidate:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '261,560p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   261	All seven open research questions catalogued in
   262	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   263	§2.3 SHALL be published as flagged-open; Product B MUST NOT
   264	claim to resolve them.
   265	
   266	An external cross-family agent validation pass — a
   267	different-family agent attempting to deploy Product A from
   268	the published SPEC bundle alone — SHALL gate Product B
   269	publication. Same-family proxy results MAY inform authoring
   270	but MUST NOT substitute for the external pass.
   271	
   272	Product B's authoring MUST itself follow the v1 BES spec
   273	procedure: each follow-on slice (repo standup, repack,
   274	longread authoring, SPEC-bundle authoring, validation pass)
   275	authored as a Task or Contract SPEC under the parent
   276	Decision; cross-family review BLOCKING per slice;
   277	verification gates each before merge.
   278	
   279	Implementations of this Decision SHOULD prefer earlier-phase
   280	slices to be authored against Product A's existing v1.1
   281	artefacts (so the repack work in Phase 4 is informed by the
   282	Phase 1-2 facet inventory rather than the other way around).
   283	
   284	Implementations MAY parallelize Phase 0-2 (analysis) across
   285	agents while keeping Phase 3-6 (composition + validation) on
   286	a single coordinating agent to preserve voice consistency.
   287	
   288	Implementations MAY adopt additional sub-spec facets beyond
   289	the eight catalogued in §6 above when the case-study work
   290	surfaces them, provided the additions are catalogued in the
   291	front-door manifest and named explicitly in a follow-on
   292	Decision SPEC amendment.
   293	
   294	## 8. Decision Rationale
   295	
   296	Candidate 5.1 was chosen because it is the only candidate
   297	that satisfies the dogfooding constraint, the reader-on-ramp
   298	constraint, and the honest-disclosure constraint
   299	simultaneously (§6 trade-off matrix; rows 1-3). The cost
   300	differential (~4-6 weeks vs. ~2-3 weeks for 5.3) is
   301	acceptable given the strategic value of a paired release
   302	that demonstrates the methodology applied to itself. Owner
   303	directive `owner://transcript-2026-05-18` ("Do what is the
   304	rolls royce") affirms this trade.
   305	
   306	Candidate 5.2 was rejected because it sacrifices the
   307	case-study narrative that motivates the methodology in the
   308	first place; research §7 lists the BES failure-mode density
   309	as load-bearing case content that a SPEC-bundle alone cannot
   310	land for human readers
   311	(`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   312	§7).
   313	
   314	Candidates 5.3 and 5.4 were rejected because both
   315	fail the dogfooding constraint outright: publishing a
   316	methodology that recommends spec-as-distribution while
   317	shipping only as blog or post-series self-undermines the
   318	artefact. The cost savings do not compensate for the
   319	self-undermining risk
   320	(`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   321	§4.3, §4.4).
   322	
   323	## 9. Locks
   324	
   325	Unlocks:
   326	
   327	- Standup of the public OSS repo
   328	  `agentic-installation-methodology` (Product B home).
   329	- Repack of `agentic-ops-framework` v1.1 into manifest +
   330	  catalog v2.0.
   331	- Authoring of the longread and per-facet sub-specs as
   332	  follow-on Task / Contract SPECs.
   333	- External cross-family validation engagement as a follow-on
   334	  Task SPEC.
   335	- Paired-release coordination plan as a follow-on Decision or
   336	  Contract SPEC if scope requires.
   337	
   338	Forecloses:
   339	
   340	- Shipping Product B as a blog-only or series-only artefact
   341	  without a SPEC bundle. (Reversible only by superseding this
   342	  Decision.)
   343	- Anonymizing BES in Product B's published artefacts.
   344	  (Reversible only by superseding this Decision.)
   345	- Publishing Product B before the external cross-family
   346	  validation pass completes. (Reversible only by superseding
   347	  this Decision.)
   348	- Repacking Product A v2.0 as anything other than the
   349	  manifest + catalog shape Product B advocates. (Reversible
   350	  only by superseding this Decision.)
   351	
   352	## 10. Reversal Plan
   353	
   354	Triggers for reconsideration:
   355	
   356	- External cross-family validation pass surfaces a structural
   357	  flaw in the manifest+catalog shape that cannot be patched
   358	  without restructuring; the methodology's recommended
   359	  packaging is empirically wrong.
   360	- Owner directive supersedes the rolls-royce framing (cost
   361	  pressure, scope cut, attribution reversal, etc.) with a
   362	  later transcript citation.
   363	- Field state shifts: a peer methodology publication lands
   364	  the same composition (agentic installation + cross-org
   365	  ownership split + manifest+catalog) before Product B ships;
   366	  novelty erodes; reassess scope.
   367	
   368	Exit procedure:
   369	
   370	1. Author a follow-on Decision SPEC superseding this one;
   371	   cite this SPEC's id in `supersedes:` front-matter.
   372	2. Pause any in-flight follow-on Task SPECs derived from this
   373	   Decision; flag them as `blocked-on-supersede`.
   374	3. Notify dependents: the Product A repack task, the longread
   375	   authoring task, the SPEC bundle authoring task, the
   376	   cross-family validation engagement.
   377	4. Owner approves the superseding Decision; resume execution
   378	   under the new shape.
   379	
   380	## 11. Validation Plan
   381	
   382	- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
   383	  each is independently feasible if chosen.
   384	- Check 2: Candidate 5.1 (the chosen option) is feasible —
   385	  Product A v1.1 already shipped at
   386	  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
   387	  proves the studio can author + ship public OSS artefacts
   388	  under the v1 procedure; the research workpad's §3, §4, §5
   389	  prove the field-state homework is done; the longread voice
   390	  prove-out is the parent IDEA itself
   391	  (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   392	  §1, §5).
   393	- Check 3: Locks (§9) and Reversal Plan (§10) are populated
   394	  and coherent; every Lock has a matching reversal path.
   395	- Check 4: All seven owner-blocking questions from the
   396	  research workpad are answered in §7 with citations to
   397	  `owner://transcript-2026-05-18`.
   398	
   399	## 12. Acceptance Criteria
   400	
   401	- [x] AC-1: Decision Statement (§7) names exactly one chosen
   402	      option (Candidate 5.1).
   403	- [x] AC-2: At least 2 candidates compared in §5 with all
   404	      needed fields populated (this SPEC compares 4).
   405	- [x] AC-3: Trade-off matrix (§6) is complete for all
   406	      candidates and criteria (6 × 4 cells filled).
   407	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
   408	- [x] AC-5: Decision Rationale (§8) cites the trade-off
   409	      matrix and owner judgment.
   410	- [x] AC-6: Completion Report §14 records when and how the
   411	      decision was communicated to dependents (the follow-on
   412	      Task / Contract SPECs that descend from this Decision).
   413	- [x] AC-7: `lint-spec.sh` exits 0 against both IDEA.md and
   414	      SPEC.md (front-matter `acceptance_commands`).
   415	
   416	## 13. Open Questions
   417	
   418	None at this Decision layer. Implementation-level questions
   419	that surface during follow-on Task / Contract SPEC authoring
   420	are scoped to those SPECs' own gates.
   421	
   422	## 14. Completion Report
   423	
   424	### 14.1 Files changed
   425	
   426	- `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   427	  (new; status: ready-for-spec; 20 citation hits, 0 lint
   428	  errors).
   429	- `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   430	  (new; this artefact; 47 citation hits, 0 lint errors).
   431	- `specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   432	  (modified; status: research → dispositioned; §11.5 owner
   433	  dispositions table appended).
   434	
   435	### 14.2 Commands run
   436	
   437	- `cmd://bash agents/scripts/lint-spec.sh
   438	  specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   439	  → exit 0 (0 errors, 0 warnings, 20 citation hits).
   440	- `cmd://bash agents/scripts/lint-spec.sh
   441	  specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   442	  → exit 0 (0 errors, 0 warnings, 47 citation hits).
   443	- `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
   444	  family proxy; recorded as `severity: advisory`) →
   445	  recommendation `approve-pending-owner`; structural pass
   446	  (15/15 sections, 4 candidates × 5 fields, 6×4 trade-off
   447	  matrix, RFC 2119 confined to §7).
   448	
   449	### 14.3 Verification result
   450	
   451	PASS. Decision SPEC is well-formed; all seven Acceptance
   452	Criteria checked; lint clean against both artefacts; review
   453	gate passed (with same-family-proxy advisory recorded).
   454	
   455	The Decision cascades by id-citation: follow-on Task / Contract
   456	SPECs that author the slices named in §7 (repo standup,
   457	repack, longread authoring, SPEC-bundle authoring, validation
   458	pass) cite this SPEC's `id`
   459	(`2026-05-18-agentic-installation-methodology`) in their
   460	front-matter `cites_decision:` field and reference the §7
   461	clauses they are implementing.
   462	
   463	### 14.4 Residual risk
   464	
   465	- **Same-family review caveat**: the Decision SPEC was both
   466	  authored and reviewed by Claude-Opus-4.7 lanes. A cross-
   467	  family pass (Codex) is recommended before any follow-on
   468	  Task SPEC reaches `approved` status; the bias risk in the
   469	  candidate-selection step is real and unmitigated by lint.
   470	  Capture as spec-evidence candidate (§14.5).
   471	- **Scope sprawl**: the §7 Decision Statement enumerates five
   472	  slice classes (standup, repack, longread, SPEC-bundle,
   473	  validation) but does not bound elapsed time, word counts
   474	  per facet, or facet-count ceiling. The follow-on Task /
   475	  Contract SPECs are expected to bound those — if any one
   476	  slice exceeds its bound, escalate via a follow-on Decision
   477	  amendment per §9 (the "Implementations may adopt additional
   478	  sub-spec facets" clause).
   479	- **Cross-family validation engagement cost**: §7 makes
   480	  external cross-family pass a publication gate. The engagement
   481	  shape (which external agent family, what dispatch model,
   482	  what acceptance bar) is unspecified in this Decision and
   483	  pushed to a follow-on Task SPEC. The risk: if external
   484	  validation engagement is harder than estimated, the paired-
   485	  release timeline slips. Owner-visible.
   486	
   487	### 14.5 Spec evidence candidates
   488	
   489	- **Decision SPECs cascade by id-citation, not TASK.md
   490	  decomposition.** The `approved-spec-decomposition` skill
   491	  correctly refused to emit TASK.md slices against this
   492	  Decision SPEC. Capture as durable lesson: agents authoring
   493	  Decision SPECs should not expect downstream decomposition;
   494	  instead, the Decision binds shape and the §7 enumeration
   495	  becomes the slice list for follow-on Task / Contract SPECs
   496	  that cite the Decision by id. Already documented in
   497	  `file://.claude/skills/approved-spec-decomposition/SKILL.md`
   498	  "Skip when" — this Completion Report reinforces it from the
   499	  Decision-author perspective.
   500	- **Rolls-royce directive as one-shot disposition resolver.**
   501	  `owner://transcript-2026-05-18` ("Do what is the rolls
   502	  royce") resolved 7 owner-blocking questions in one
   503	  utterance. The pattern: when the agent has done the research
   504	  homework and the candidate space is well-articulated, an
   505	  owner directive can disposition multiple questions with a
   506	  single binding statement. Document as authoring pattern for
   507	  the spec-authoring skill's "Grill Before IDEA" section.
   508	- **Decision Statement as slice enumerator.** §7 enumerates
   509	  the slice list (standup, repack, longread, SPEC-bundle,
   510	  validation pass) inside the normative section, which lets
   511	  follow-on Task / Contract SPECs cite specific §7 clauses
   512	  as their parent authority. This is the cascade-by-id-
   513	  citation pattern in action; consider documenting in
   514	  `references/cascade-by-id-citation.md`.

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
   210	## 6. Trade-off Comparison
   211	
   212	| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part |
   213	|---|---|---|---|---|
   214	| Dogfooding strength | max | max | min | min |
   215	| Reader on-ramp | max | min | medium | medium |
   216	| Honest disclosure (failure modes + open questions) | max | medium | min | min |
   217	| Cross-family validation evidence | yes (gates) | yes (gates) | no | no |
   218	| Authoring cost | highest | medium-high | lowest | low-medium |
   219	| Self-undermining risk | low | medium | high | high |
   220	
   221	## 7. Decision Statement
   222	
   223	The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
   224	SPEC bundle, paired Product A v2.0 / Product B v1.0 release)
   225	as the shape and scope binding for Product B.
   226	
   227	The Product B repo `agentic-installation-methodology` SHALL
   228	ship two paired artefacts: an engineering longread
   229	(target 8 000-12 000 words; first-person experiential
   230	posture; BES case-study density; failure modes as first-class
   231	content) and an authoritative SPEC bundle structured as a
   232	front-door manifest plus per-facet sub-specs (architecture,
   233	deployment, behavior, customization, decisions, quality,
   234	operations, non-goals).
   235	
   236	The methodology body SHALL follow the seven phases plus
   237	Phase 0 enumerated in
   238	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   239	§6 (Phase 0 maturity check; Phase 1 facet inventory and
   240	classification; Phase 2 parameterization surface; Phase 3
   241	sanitization bar; Phase 4 manifest + catalog composition;
   242	Phase 5 cross-family agent walkthrough; Phase 6 ship; Phase 7
   243	failure modes as first-class content).
   244	
   245	The Product A repo `agentic-ops-framework` SHALL be repacked
   246	into the manifest+catalog shape as v2.0 in parallel with
   247	Product B v1.0 authoring; the two artefacts SHALL ship as a
   248	paired release.
   249	
   250	BES SHALL be named directly throughout Product B's published
   251	artefacts; the case-study density REQUIRED by research §7
   252	forecloses anonymization.
   253	
   254	All four-plus failure modes catalogued in
   255	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   256	§7 SHALL be published as case data, with sanitization
   257	limited to specific internal SPEC identifiers and
   258	transcripts; the failure-mode patterns themselves are the
   259	value.
   260	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/IDEA.md | sed -n '1,320p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
     1	---
     2	id: agentic-installation-methodology
     3	spec_id: 2026-05-18-agentic-installation-methodology
     4	status: ready-for-spec
     5	owner: HasNoBeef
     6	brainstormed_by: claude-opus-4-7
     7	brainstormed_on: 2026-05-18
     8	implies_spec_type: decision
     9	---
    10	
    11	# Product B — Agentic Installation Methodology Shape and Scope
    12	
    13	## Normative Language
    14	
    15	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    16	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    17	document are to be interpreted as described in RFC 2119 and RFC 8174
    18	when, and only when, they appear in all capitals.
    19	
    20	## 1. Problem Seed
    21	
    22	BES has finished publishing the agent operating framework
    23	(Product A) at v1.1
    24	(`url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`),
    25	sanitized from internal studio practice into a generic-fleet
    26	reusable shape. Product B is the **published methodology**
    27	explaining how to take ANY working product and decompose it
    28	into an exhaustive but non-prescriptive deployment-grade SPEC
    29	that user-dispatched coding agents can install, customize, and
    30	operate locally — without a developer-in-the-loop support
    31	loop. Product A is the worked artefact; Product B is the
    32	procedure that produced it (and, by composition, the procedure
    33	that produces other such artefacts).
    34	
    35	The methodology is novel in combination, not in invention. The
    36	primitives are field-mature: arc42 chapters, devcontainers,
    37	Helm-values-style customization grammar, Gherkin behavioral
    38	acceptance, Nix-flake reproducible substrate, ADRs, Diátaxis,
    39	12-factor, OpenAI Symphony's repo-owned-contract pattern. The
    40	research workpad at
    41	`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    42	§3 enumerates 14 transferable building blocks from Symphony's
    43	SPEC alone; §4 names the four facets neither existing
    44	methodologies nor Symphony's SPEC capture well (structured
    45	customization catalog with deferral contract; per-facet
    46	negative space; cross-org ownership-split protocol; spec-as-
    47	distribution versioning + signing + verification). The novel
    48	contribution is the **composition + the cross-org ownership
    49	split**, not the primitives.
    50	
    51	This IDEA captures the owner-resolved dispositions from
    52	2026-05-18 (`owner://transcript-2026-05-18`) and binds them
    53	into a single Decision to be authored under the v1 spec
    54	procedure.
    55	
    56	## 2. Substance Citations
    57	
    58	- `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    59	  — the dispositioned research workpad; status:
    60	  dispositioned. §2-§4 establish field state + missing facets;
    61	  §5 recommends manifest+catalog packaging; §6 lays out the
    62	  7+Phase-0 methodology; §7 names BES as worked case study;
    63	  §11.5 records the owner dispositions resolved 2026-05-18.
    64	- `file://specs/2026-05-17-sanitized-framework-publication/RESEARCH.md`
    65	  — sibling workpad (Product A); the framework artefact that
    66	  is the worked example for Product B's case study.
    67	- `url://github.com/buildepicshit/agentic-ops-framework`
    68	  — Product A v1.1, the shipped framework artefact (the
    69	  "before" state for the methodology's Phase 3-4 walkthrough,
    70	  to be repacked as the "after" state under this Decision).
    71	- `owner://transcript-2026-05-18`:
    72	  > "do what is right for fuck sakes"
    73	  > "Do what is the rolls royce"
    74	  Binds: every Tier-1 / Tier-2 / Tier-3 question in the
    75	  research workpad to the strongest-rigour option. See §7 for
    76	  full transcript and per-question binding.
    77	- `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
    78	  — closest published statement of the agentic-installation
    79	  hypothesis, framed as a risk we are publishing as a
    80	  procedure. Cited in research §2.2.
    81	- `url://github.com/openai/symphony/blob/main/SPEC.md`
    82	  — the only in-the-wild operating-model-as-SPEC; source of
    83	  the 14 transferable building blocks per research §3.
    84	
    85	## 3. Constraints & Non-Negotiables
    86	
    87	- **Methodology MUST eat its own dogfood.** If we publish a
    88	  methodology saying manifest+catalog is the right packaging,
    89	  the methodology artefact itself MUST be a manifest+catalog
    90	  bundle. Product A v1.1's single-tree layout is the
    91	  before-state; Product A v2.0 + Product B v1.0 paired
    92	  release demonstrates the methodology applied to itself.
    93	  (`owner://transcript-2026-05-18` "Do what is the rolls royce")
    94	- **Methodology MUST be honest about its own limits.** All 7
    95	  open research questions from research §2.3 are published as
    96	  flagged-open, not papered over. The methodology offers a
    97	  posture and a procedure that make them addressable; it does
    98	  not pretend to resolve them. (`owner://transcript-2026-05-18`
    99	  "do what is right for fuck sakes" — interpreted as honest
   100	  posture per the prior session's established framing.)
   101	- **Methodology MUST publish failure modes as first-class
   102	  content.** Research §7 names 4+ BES failure modes (fastpath
   103	  zero-adoption, decomposition-phase paper-only across 23
   104	  SPECs, workpad bootstrap gap, ceremony refactor questions).
   105	  All disclosed as case data with sanitized specifics.
   106	  (`owner://transcript-2026-05-18`)
   107	- **External cross-family validation MUST gate publication.**
   108	  Phase 5 of the methodology recommends a different-family
   109	  agent attempt deployment from spec alone; we MUST run that
   110	  on Product A before publishing Product B. Practicing what
   111	  we preach is non-negotiable for an honest published
   112	  methodology. (`owner://transcript-2026-05-18`)
   113	- **BES attribution: fully named.** Anonymization is dishonest
   114	  given the case-study density. The transparency cost is
   115	  accepted. (`owner://transcript-2026-05-18`)
   116	- **No developer-in-the-loop support obligation** is created
   117	  by publication. The methodology explicitly carries the
   118	  cross-org ownership split: developer owns intent + product
   119	  direction; user-with-agent owns customization + local
   120	  deployment. (`file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   121	  §"The premise")
   122	- **Citation discipline binding from Product A applies.**
   123	  Every factual claim in the published methodology carries a
   124	  citation prefix per the schema grammar.
   125	  (`file://agents/specs/SPEC.schema.md` §2)
   126	
   127	## 4. Approaches Considered
   128	
   129	### 4.1 Hybrid — longread + SPEC bundle (manifest + catalog) [RECOMMENDED]
   130	
   131	- Sketch: Two paired artefacts. (a) Engineering longread
   132	  (~8-12K words) carrying the narrative — first-person
   133	  experiential, BES case-study density, failure modes as
   134	  first-class content. (b) Authoritative SPEC bundle —
   135	  front-door manifest + per-facet sub-specs (architecture /
   136	  deployment / behavior / customization / decisions / quality
   137	  / operations / non-goals) per research §5. The longread is
   138	  the readable entry point; the SPEC bundle is the
   139	  authoritative artefact and conformance target.
   140	- Fit: Maximum dogfooding — the methodology IS the manifest+
   141	  catalog shape it advocates. Maximum on-ramp — the longread
   142	  carries reader narrative without sacrificing the rigor of
   143	  the SPEC bundle. Aligns with research §5.2 and §8 posture.
   144	- Cost: Highest authoring cost of the four options.
   145	  Coordinated authoring of two artefact shapes. Repack of
   146	  Product A v2.0 in parallel. External cross-family
   147	  validation pass. Estimate 4-6 weeks elapsed (sanitized
   148	  agent-time estimate).
   149	- Risk: Scope sprawl. Without strict facet boundaries the
   150	  SPEC bundle can grow until the longread becomes a summary
   151	  of itself. Mitigated by hard per-facet word limits + the
   152	  facet-level negative-space discipline from research §4.2.
   153	
   154	### 4.2 Methodology AS a SPEC bundle only
   155	
   156	- Sketch: Pure dogfooding. No longread. The methodology paper
   157	  IS the manifest+catalog. Readers consume it the way agents
   158	  do — partial reads per facet.
   159	- Fit: Strongest self-conformance proof. Weakest reader
   160	  on-ramp (no narrative). Aligns with the §8 posture but
   161	  loses the case-study density that motivates the methodology
   162	  in the first place.
   163	- Cost: Lower than 4.1 (one artefact shape, not two). Same
   164	  Product A repack + cross-family validation.
   165	- Risk: The methodology is novel enough that "read it like an
   166	  agent does" loses the readers who would otherwise become
   167	  practitioners. The case study (BES) is half the value;
   168	  without prose, it doesn't land.
   169	
   170	### 4.3 Single longread engineering blog (~5-10K words)
   171	
   172	- Sketch: One big post. No SPEC artefact. Methodology
   173	  described in prose; no separate bundle to consume.
   174	- Fit: Weakest dogfooding signal. The methodology recommends
   175	  manifest+catalog but the artefact ignores its own advice.
   176	  Lowest authoring cost.
   177	- Cost: Lowest — ~2-3 weeks elapsed. No Product A repack
   178	  needed (the longread can describe the repack as future
   179	  work). No cross-family validation gate needed (no
   180	  installable SPEC to validate).
   181	- Risk: Self-undermining. Reader's first observation will be
   182	  "you say spec-as-distribution but you published a blog." The
   183	  honest posture takes the hit.
   184	
   185	### 4.4 Multi-part series (5-7 posts)
   186	
   187	- Sketch: Phase-per-post structure tracking research §6's
   188	  seven phases + Phase 0. No SPEC artefact. Each post lands
   189	  independently; series acts as scaffolding.
   190	- Fit: Better SEO + progressive reading + lower per-post
   191	  authoring barrier than 4.3. Same dogfooding weakness as
   192	  4.3. Disperses the methodology across posts; risks diluting
   193	  the core claim.
   194	- Cost: Similar total to 4.3 spread over 5-7 separate
   195	  authoring + publishing cycles. Longer elapsed time.
   196	- Risk: Series fatigue. Readers drop off after part 2-3 and
   197	  the case-study density that lands in parts 5-7 (failure
   198	  modes; cross-family validation) reaches a smaller audience.
   199	
   200	## 5. Recommendation
   201	
   202	**Approach 4.1: Hybrid — longread + SPEC bundle, with paired
   203	Product A v2.0 / Product B v1.0 release.** (`judgment://agent-
   204	synthesis`, affirmed in §7 — see `owner://transcript-2026-05-18`)
   205	
   206	Rationale:
   207	
   208	- Honest posture demands maximum dogfooding. Approach 4.1 is
   209	  the only option where the methodology artefact itself
   210	  demonstrates the manifest+catalog packaging it advocates.
   211	- The longread carries the case-study density and narrative
   212	  that approach 4.2 sacrifices.
   213	- Approach 4.3 / 4.4 forfeit the dogfooding entirely; the
   214	  methodology recommends spec-as-distribution while
   215	  publishing as blog. Self-undermining.
   216	- The cost differential (4.1 ~4-6 weeks vs. 4.3 ~2-3 weeks)
   217	  is real but acceptable given the strategic value of a
   218	  paired release that demonstrates the methodology applied to
   219	  itself.
   220	
   221	The owner directive (`owner://transcript-2026-05-18` "Do what
   222	is the rolls royce") binds this recommendation.
   223	
   224	## 6. Open Questions for Owner
   225	
   226	All open questions from the research workpad §9 are resolved
   227	by `owner://transcript-2026-05-18` dispositions captured in
   228	§11.5 of that workpad. No further owner-blocking questions
   229	remain at this IDEA layer.
   230	
   231	- [x] Q1 publication shape — resolved §7 (Approach 4.1).
   232	- [x] Q2 phase count — resolved §7 (7 phases + Phase 0).
   233	- [x] Q3 Product A repack — resolved §7 (parallel paired
   234	      release).
   235	- [x] Q4 BES attribution — resolved §7 (fully named).
   236	- [x] Q5 failure-mode disclosure — resolved §7 (all
   237	      published).
   238	- [x] Q6 open research questions — resolved §7 (all 7
   239	      flagged open).
   240	- [x] Q7 cross-family validation — resolved §7 (external
   241	      pass gates publication).
   242	
   243	## 7. Owner Judgments
   244	
   245	- `owner://transcript-2026-05-18`:
   246	  > "I don't know what does the research suggest — What do we
   247	  > think is the rolls rroyce ?"
   248	  > "Just do what is right for fuck sakes what a stupid
   249	  > question"
   250	  > "Do what is the rolls royce"
   251	
   252	  Binds: Every Tier-1 / Tier-2 / Tier-3 question in the
   253	  research workpad is resolved to the strongest-rigour
   254	  option. Specifically:
   255	
   256	  - Q1 → Approach 4.1 (Hybrid longread + SPEC bundle).
   257	    Strongest dogfooding + readable on-ramp.
   258	  - Q2 → 7 phases + Phase 0 per research §6. Each phase
   259	    independently load-bearing; rigor preferred over
   260	    readability compression.
   261	  - Q3 → Parallel repack: Product A v2.0 manifest+catalog
   262	    repack + Product B v1.0 ship as paired release. The
   263	    methodology's worked example IS the repacked Product A.
   264	  - Q4 → BES fully named throughout the published artefacts.
   265	    Anonymization is dishonest given case-study density.
   266	  - Q5 → All failure modes from research §7 published as
   267	    case data with sanitized specifics. Failure modes are the
   268	    value per the §8 posture.
   269	  - Q6 → All 7 open research questions from research §2.3
   270	    published as flagged-open. The methodology helps address;
   271	    it does not pretend to resolve.
   272	  - Q7 → External cross-family validation run gates Product B
   273	    publication. Practice what we preach; Phase 5 of the
   274	    methodology applied to its own publication.
   275	
   276	  Affirms the §5 recommendation (Approach 4.1).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
     1	---
     2	id: 2026-05-17-agentic-installation-methodology
     3	kind: research
     4	owner: HasNoBeef
     5	status: dispositioned
     6	date: 2026-05-17
     7	dispositioned_on: 2026-05-18
     8	implies_spec_type: decision
     9	sibling: 2026-05-17-sanitized-framework-publication
    10	supersedes: 2026-05-17-decomposition-methodology-publication
    11	---
    12	
    13	# Agentic Installation Methodology — Research Workpad (Product B, reframed)
    14	
    15	> Reframed Product B per `owner://transcript-2026-05-17`. Replaces
    16	> the earlier "methodology paper about operating-model extraction"
    17	> framing at
    18	> `file://specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
    19	> (archived).
    20	>
    21	> **The premise**: developers stop shipping source / binaries.
    22	> They publish an exhaustive but non-prescriptive deployment-grade
    23	> SPEC of their product. End users dispatch their own coding
    24	> agents to install, customize, and operate it locally on their
    25	> terms. **The ownership split**: developer owns intent and
    26	> product direction; user-with-agent owns customization and local
    27	> deployment. No developer support loop.
    28	>
    29	> **Product B publishes the methodology** for taking any working
    30	> product and decomposing it into such a SPEC. **BES is the
    31	> worked case study**, not the audience. Audience: anyone
    32	> interested in agentic deployment or working with agents.
    33	
    34	## 1. Question
    35	
    36	What does a publishable methodology look like for **agentic
    37	installation** — turning an existing product into an exhaustive,
    38	non-prescriptive SPEC (or SPEC bundle) that agents can deploy
    39	without developer-in-the-loop?
    40	
    41	Subsidiary questions:
    42	- What categories of product-facet must such a SPEC cover?
    43	- What packaging shape carries exhaustive intent without
    44	  becoming prescriptive of implementation?
    45	- What can be borrowed from existing methodologies (arc42 /
    46	  C4 / ADRs / Diátaxis / 12-factor / Symphony / Nix / Helm)
    47	  and what is genuinely new?
    48	- What are the open research problems the methodology has to
    49	  honestly flag because they aren't solved yet?
    50	
    51	## 2. Field State Summary
    52	
    53	### 2.1 The framing is novel in combination, not invention
    54	
    55	Two things are genuinely new:
    56	- **Spec-as-distribution-artifact, not spec-as-authoring-artifact.**
    57	  Spec Kit, Kiro, OpenSpec, Oracle Agent Spec all keep specs
    58	  inside one team's authoring loop. None publishes the spec as
    59	  the distributable artefact that replaces a binary, image, or
    60	  repo as the unit of delivery.
    61	- **Explicit cross-org ownership split.** Reference-architecture
    62	  vs. solution-architecture literature comes closest (the
    63	  former "holds universally"; the latter is "negotiable") but
    64	  is framed as enterprise consulting handoff, not consumer
    65	  software distribution.
    66	
    67	The underlying primitives are field-mature. The proposal is a
    68	composition: **arc42 chapters + devcontainers + Helm-values-
    69	style customization grammar + Gherkin behavioral acceptance +
    70	Nix-flake reproducible substrate would cover ~80% of the
    71	intended scope.**
    72	
    73	### 2.2 Closest published prior art is a critique
    74	
    75	`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
    76	articulates the same hypothesis but as risk: "patching is no
    77	longer 'deploy 2.1.4' but 'update the spec and hope every
    78	downstream compilation behaves consistently'." Nobody has
    79	shipped agentic installation as method.
    80	
    81	### 2.3 Seven open research questions the methodology has to flag
    82	
    83	1. **Exhaustiveness without prescription — is the boundary
    84	   stable?** Reference-architecture literature warns this is
    85	   rhetorical, not technical. What stops an exhaustive spec
    86	   from over-constraining? What stops a non-prescriptive spec
    87	   from being under-specified?
    88	2. **How do agents handle ambiguity when they cannot ask the
    89	   developer?** Drift and prompt-drift literature is
    90	   unanimous: agents fill gaps with statistically likely
    91	   completions. Without developer-in-the-loop, who arbitrates?
    92	3. **Versioning and patching semantics.** What's the meaning
    93	   of a security patch when every install is a unique agent
    94	   compilation?
    95	4. **Install-matches-intent verification.** How does the user
    96	   know the install matches the developer's intent? Acceptance
    97	   commands? Reference output? Cryptographic spec signing?
    98	5. **Equivalence classes of valid implementations.** When are
    99	   two agent-compiled outputs "the same product"? Oracle Agent
   100	   Spec hints at this within a narrow domain; no general
   101	   answer.
   102	6. **Empirical agent capability floor.** "Any reasonably
   103	   capable coding agent" is load-bearing in the framing.
   104	   What's the actual capability floor today? Demonstrable for
   105	   greenfield within opinionated stacks; not demonstrated for
   106	   arbitrary products.
   107	7. **Adversarial spec consumption.** A published spec is an
   108	   attack surface — supply chain through customization
   109	   affordances; prompt injection inside spec content; agent
   110	   jailbreak during compilation.
   111	
   112	Honest framing: Product B has to publish these as **open
   113	research problems the methodology flags but does not claim to
   114	solve**. The methodology offers a posture and a procedure that
   115	make these problems addressable; it does not pretend they're
   116	solved.
   117	
   118	## 3. Transferable Building Blocks (extracted from Symphony's SPEC.md)
   119	
   120	Symphony's 18-section SPEC at
   121	`url://github.com/openai/symphony/blob/main/SPEC.md` is the only
   122	in-the-wild published example of "operating-model-as-SPEC."
   123	Many of its sections decompose into transferable patterns for
   124	ANY product's deployment SPEC. The deep read identified the
   125	following as portable building blocks (architecture pattern,
   126	content stripped):
   127	
   128	| Symphony section | Transferable pattern | Why universal |
   129	|---|---|---|
   130	| §2 Goals / Non-Goals | **Negative-space declaration** | Pre-emptively closes ambiguous deployment scope |
   131	| §3.3 External Dependencies | **Explicit runtime-dependency manifest** | Universal |
   132	| §4.2 Stable Identifiers and Normalization | **Identifier semantics + normalization rules** | Almost universally absent + almost universally needed |
   133	| §5 Workflow Specification | **Repo-owned contract pattern** with framework-defined schema + free-form body + strict validation. The single most novel-and-portable building block in the document. |
   134	| §6 Config Resolution Pipeline + Dynamic Reload + Preflight | **Five-step pipeline structure** | Configuration pipelines are universal; the explicit decomposition is rare and high-quality |
   135	| §7.4 Idempotency and Recovery Rules | **Idempotency invariants as separate subsection** | Usually omitted; frequently load-bearing |
   136	| §9.5 Safety Invariants | **MUST-numbered list, mandatory** | Universal |
   137	| §11.5 Boundary statements ("we do NOT…") | **Negative-space at integration level** | Closes ambiguity for integrators |
   138	| §13 Three-tier observability | **Required logging / recommended snapshot / optional HTTP** | Layered observability is reusable |
   139	| §14 Failure classes × recovery posture | **Failure-class × recovery × operator-lever triple decomposition** | Rare; high value |
   140	| §15.1 Implementation-declared trust boundary | **Deferred-but-required pattern** ("must declare; not what to declare") | Universal |
   141	| §17 Three Conformance Profiles | **Core / Extension / Real-Integration tiering** | Reusable conformance harness shape |
   142	| §18 REQUIRED / RECOMMENDED / pre-prod DoD | **Tiered Definition-of-Done checklist** | Most directly portable section in the document |
   143	| Appendix A — optional extension model | **Extensions live in appendices, not in core** | Keeps core clean |
   144	
   145	Symphony-specific (NOT transferable): §10 Agent Runner Protocol;
   146	§11.1-§11.4 (Linear-bound integration); §12 Prompt Construction;
   147	§16 reference algorithms (content); the Codex/Linear-specific
   148	entity content in §4.
   149	
   150	## 4. The Missing Facets (the novel content Product B publishes)
   151	
   152	The combined surface that NEITHER existing methodologies NOR
   153	Symphony's SPEC currently captures well:
   154	
   155	### 4.1 Structured customization / variability catalog with deferral contract
   156	
   157	The biggest missing facet across the entire surveyed field.
   158	
   159	- 12-factor's *Config* says env vars exist, not which knobs
   160	  the installer is **expected** to turn.
   161	- arc42's §8 Crosscutting Concepts leans toward technical
   162	  concerns, not customization.
   163	- ADRs document choices **made by the authors**, not choices
   164	  **deferred to the installer**.
   165	- C4 doesn't model variation points.
   166	- Helm values schemas come closest in practice but describe
   167	  *what is configurable*, not *what compositional patterns
   168	  exist* or *what trade-offs each profile makes*.
   169	
   170	For agentic installation, the missing facet is:
   171	**(a)** a structured catalog of variability — what knobs exist,
   172	what their valid combinations are;
   173	**(b)** named reference compositions ("starter profiles") with
   174	trade-offs documented;
   175	**(c)** an explicit **deferral contract** — what does the
   176	framework provide by default vs. what does the framework
   177	*defer to the installer* and under what constraints?
   178	
   179	### 4.2 Negative-space at facet level
   180	
   181	Symphony §2.2 does whole-product non-goals; §11.5 does
   182	integration-boundary non-goals. Almost no methodology does
   183	this **per facet** ("the deployment spec does NOT cover…", "the
   184	behavior spec does NOT cover…", "the customization grammar does
   185	NOT cover…"). This is where ambiguity for an installing agent
   186	typically lives.
   187	
   188	### 4.3 Cross-org ownership split protocol
   189	
   190	The reference-architecture-vs-solution-architecture distinction
   191	hints at this. Nobody operationalizes it as a distribution
   192	contract. Product B has to specify:
   193	- What guarantees does the developer make about the spec?
   194	  (Stability across versions? Backwards compat? Patch
   195	  semantics?)
   196	- What guarantees does the user-with-agent make to the spec?
   197	  (Trust boundary declaration? Reproducibility? Capability
   198	  floor?)
   199	- What happens when the agent can't deploy from spec — fail
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '221,440p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
   256	  verify; `operations/` when debugging).
   257	- **Parallel authorship** — different facets owned by
   258	  different humans / agents.
   259	- **Different artefact shapes for different content** —
   260	  inventory facets (deps, deployed versions) want
   261	  structured-data; decision facets want ADRs; behavior wants
   262	  executable; architecture wants diagrammable.
   263	- **Drift detection per facet** — living docs for inventory
   264	  facets (generated continuously) coexist with prose for
   265	  architecture / rationale.
   266	
   267	## 6. Methodology Shape (the procedure Product B publishes)
   268	
   269	The reframed methodology, drawing on the research:
   270	
   271	### Phase 0 — Maturity check (pre-extraction)
   272	
   273	When is a product mature enough to publish as a deployment-grade
   274	SPEC? Honest signals:
   275	- The product has been deployed enough times by enough
   276	  installers that the configuration / customization surface is
   277	  understood.
   278	- The product's failure modes are characterized.
   279	- The developer can name the 3-5 "load-bearing" intent
   280	  decisions vs. the implementation accidents.
   281	- The product has an empirical conformance bar — at minimum,
   282	  acceptance commands the developer trusts.
   283	
   284	Anti-signals: every install is bespoke; the developer can't
   285	articulate what's "wrong" in a non-compliant install; the
   286	customization surface is "edit the source."
   287	
   288	### Phase 1 — Facet inventory and classification
   289	
   290	For each artefact in the product, classify by facet:
   291	- Architecture / domain model
   292	- Deployment substrate
   293	- Behavior contract
   294	- Customization affordances
   295	- Decisions and their rationales
   296	- Operational story (failures, observability, safety)
   297	- Non-goals (per facet)
   298	
   299	Output: a per-artefact classification table, often hybrid (one
   300	artefact serves multiple facets).
   301	
   302	### Phase 2 — Identify the parameterization surface
   303	
   304	What does the spec parameterize vs. hard-code? Symphony's
   305	single-file approach (the repo-owned `WORKFLOW.md` schema) is
   306	one pattern; a multi-file customization catalog is another.
   307	This is the **deferral-contract** decision (§4.1).
   308	
   309	### Phase 3 — Pick the sanitization bar
   310	
   311	Per Product A's audit:
   312	- Drop studio context from spec body (no studio name,
   313	  transcripts, internal SPEC IDs)
   314	- Use studio experience as evidence frame (first-person "we
   315	  tried this and X happened")
   316	- Document preconditions for the spec's assumptions (e.g.,
   317	  trust-boundary declarations the installer must make)
   318	
   319	### Phase 4 — Compose the manifest + catalog
   320	
   321	Produce the front-door manifest + per-facet sub-specs per §5.
   322	Each sub-spec uses the artefact shape best suited to its facet
   323	(structured data, prose, executable, diagram).
   324	
   325	### Phase 5 — Validate by cross-family agent walkthrough
   326	
   327	Symphony's "re-implement in 5 languages" doesn't trivially
   328	generalize for an operating-model. The agentic-installation
   329	analogue: have a different-family agent (Codex / Gemini / a
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
   389	
   390	## 8. Posture / Voice
   391	
   392	Inherits Product A's binding constraints with this addition:
   393	
   394	- **First-person experiential throughout** — Product B is
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
   426	
   427	Tier 2 — case study and disclosure:
   428	
   429	- [ ] **Q4**: BES attribution in Product B specifically. The
   430	  paper is overtly a case study; BES is named more directly
   431	  than in Product A. Options: (i) BES fully named ("here's the
   432	  BES extraction journey"); (ii) anonymized ("the source
   433	  studio"); (iii) anonymized in body, named in acknowledgements.
   434	  `owner-blocking`.
   435	- [ ] **Q5**: Which BES failure modes get published as case
   436	  data? §7 lists candidates. Owner picks: (i) all of them
   437	  (full disclosure); (ii) selective (name some, abstract
   438	  others); (iii) abstract all into "failure-mode categories"
   439	  without naming specific BES instances. `owner-blocking`.
   440	- [ ] **Q6**: Honest framing on the 7 open research questions

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '441,620p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   441	  in §2.3. (i) Publish all 7 as flagged open; (ii) attempt
   442	  partial answers for some (which?); (iii) skip the open-
   443	  questions section to avoid uncertainty in the published
   444	  artefact. Recommended: option (i) full disclosure aligns
   445	  with the honest posture. `owner-blocking`.
   446	
   447	Tier 3 — execution mechanics (defer if you want):
   448	
   449	- [ ] **Q7**: Cross-family validation pass. Same-family proxy
   450	  is the current state; strict cross-family (external Codex
   451	  / Gemini run) is what the methodology's own Phase 5
   452	  recommends. Should BES practice what it preaches and
   453	  trigger external validation before publishing? Or publish
   454	  with same-family caveat documented? `owner-blocking`.
   455	
   456	## 10. Pre-IDEA Next Steps
   457	
   458	When dispositioned, Product B authoring proceeds:
   459	
   460	1. Author Decision IDEA citing this workpad in §1 Problem
   461	   Seed. Options will be the shape choices from §9 Q1-Q3.
   462	2. Author Decision SPEC after IDEA → ready-for-spec; binds
   463	   format, phase count, diff approach, attribution.
   464	3. Author follow-on writing-Task SPEC(s) for the actual
   465	   methodology content. Each phase potentially becomes a
   466	   Task SPEC.
   467	4. Coordinate timing with Product A per X1 (parallel paired
   468	   release).
   469	5. Cross-family validation walkthrough (per Q7) becomes its
   470	   own small Task SPEC.
   471	
   472	## 11. References
   473	
   474	External — agentic installation field state:
   475	
   476	- `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
   477	  (the closest published statement of the agentic-
   478	  installation hypothesis, framed as risk)
   479	- `url://github.com/github/spec-kit` (spec-as-authoring-
   480	  artefact; closest tool)
   481	- `url://kiro.dev` (spec-driven IDE; Bedrock-tethered)
   482	- `url://github.com/oracle/agent-spec` (spec-as-agent-
   483	  description; framework-agnostic; closest to "ship spec,
   484	  compile yourself")
   485	- `url://comet.com/site/blog/prompt-drift/` (the agent-
   486	  ambiguity-handling failure mode)
   487	- `url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`
   488	  (the architecture-vs-solution distinction)
   489	- `url://nixos.org/` (the strongest reproducible-from-spec
   490	  primitive)
   491	- `url://helm.sh/` (the strongest customization-affordance
   492	  grammar in production)
   493	- `url://12factor.net/` (the conformance overlay)
   494	
   495	External — decomposition methodologies:
   496	
   497	- `url://c4model.com/`
   498	- `url://arc42.org/overview`
   499	- `url://adr.github.io/`
   500	- `url://diataxis.fr/`
   501	- `url://martinfowler.com/bliki/BoundedContext.html`
   502	- `url://cyclonedx.org/capabilities/sbom/`
   503	- `url://cucumber.io/docs/`
   504	- `url://github.com/openai/symphony/blob/main/SPEC.md`
   505	  (deep read: 18 sections + Appendix A; transferable building
   506	  blocks identified per §3)
   507	
   508	Internal:
   509	
   510	- `file://specs/2026-05-17-sanitized-framework-publication/RESEARCH.md`
   511	  (sibling — Product A)
   512	- `file://specs/2026-05-17-operating-model-validation-run/RESEARCH.md`
   513	  (pre-extraction maturity signals; BES case study source)
   514	- `file://specs/2026-05-17-contract-corpus-retrospective-audit/REPORT.md`
   515	  (fastpath zero-adoption case data)
   516	- `file://specs/2026-05-17-cross-family-compliance-audit/REPORT.md`
   517	  (decomposition-phase paper-only case data)
   518	- `file://specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   519	  (archived — superseded by this workpad)
   520	
   521	## 11.5 Owner Dispositions (2026-05-18)
   522	
   523	Resolved per `owner://transcript-2026-05-18` ("do the
   524	rolls royce; stop asking"). Every Tier-1 / Tier-2 / Tier-3
   525	question dispositioned to the strongest-rigour option.
   526	
   527	| Q | Decision | Rationale |
   528	|---|---|---|
   529	| Q1 publication shape | **Hybrid — longread + SPEC bundle (manifest + catalog)** | Strongest dogfooding (the methodology IS the manifest+catalog shape it advocates) + readable on-ramp (longread for narrative). Research §5.2 supports manifest+catalog as the right packaging for partial-read agent consumption. |
   530	| Q2 phase count | **7 phases + Phase 0 per §6** | Each phase is independently load-bearing per the research. Collapsing trades rigor for readability; the longread carries the narrative load, the SPEC bundle preserves the rigor. |
   531	| Q3 Product A repack | **Parallel repack into manifest+catalog → paired release (Product A v2.0 + Product B v1.0)** | Maximum dogfooding: Product B's worked example IS the repacked Product A v2.0. Accept the rework cost on Product A to ship a coherent paired artefact. |
   532	| Q4 BES attribution | **Fully named — full transparency** | Aligns with §8 posture ("First-person experiential throughout"). Anonymization is dishonest given §7's case-study density. |
   533	| Q5 failure mode disclosure | **All published as case data** | §7 names 4+ failure modes; all surface as case data with sanitized specifics. Failure modes are the value per §8. |
   534	| Q6 open research questions | **All 7 from §2.3 published as flagged open** | The honest posture demands disclosure. The methodology helps ADDRESS these questions; it does not pretend to RESOLVE them. |
   535	| Q7 cross-family validation | **Practice what we preach — external cross-family validation before publishing** | Phase 5 (per §6) is non-negotiable. Same-family proxy used during authoring; external cross-family run gates publication. |
   536	
   537	These dispositions bind the Decision SPEC that follows from
   538	this workpad. The workpad itself is now `status:
   539	dispositioned` — no further owner-blocking questions remain
   540	at the research layer.
   541	
   542	## 12. Verification Caveats
   543	
   544	- The agentic-installation field state was surveyed by a
   545	  Claude-family agent across primary and secondary sources;
   546	  some primary URLs (arc42, C4, ADR, Diátaxis, 12-factor)
   547	  were access-denied and characterized via WebSearch
   548	  summaries cross-checked against multiple sources.
   549	- The Symphony SPEC.md deep read fetched the primary source.
   550	  The "Elixir reference implementation" claim in earlier
   551	  research is asserted by external coverage but is not
   552	  explicitly bound in the SPEC.md itself — flagged for
   553	  trace.
   554	- The seven open research questions in §2.3 are honestly
   555	  flagged. The methodology Product B publishes does NOT
   556	  claim to resolve them; it documents the studio's empirical
   557	  position relative to each.
   558	- The "~80% solved by stacking existing primitives" claim is
   559	  a `judgment://agent-synthesis` estimate, not a measured
   560	  number.
   561	- This workpad is research, not a SPEC. It has not been run
   562	  through `lint-spec.sh` for spec-grade citation
   563	  completeness.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba agents/specs/SPEC.schema.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
     1	# SPEC.schema.md — Shared schema for BES specs
     2	
     3	Status: v1
     4	Authority: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
     5	§6.1, §8, §10.
     6	
     7	This document is the single source of truth for cross-template
     8	conventions used by IDEA.md and the three SPEC.md types
     9	(Task / Contract / Decision). The three SPEC templates and the IDEA
    10	template reference this schema instead of duplicating it.
    11	
    12	## Normative Language
    13	
    14	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    15	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    16	document are to be interpreted as described in RFC 2119 and RFC 8174
    17	when, and only when, they appear in all capitals.
    18	
    19	`Implementation-defined` means the behavior is part of the contract
    20	but this schema does not prescribe a single universal policy. The
    21	implementation MUST document the selected behavior in the affected
    22	artefact.
    23	
    24	## 1. Front-matter schema
    25	
    26	Every IDEA.md and SPEC.md MUST begin with a YAML front-matter block
    27	delimited by `---` on its own line.
    28	
    29	### 1.1 IDEA.md front-matter
    30	
    31	| Field | Type | Required | Allowed values | Notes |
    32	|---|---|---|---|---|
    33	| `id` | string | REQUIRED | kebab-case slug | matches `<topic>` portion of spec_id |
    34	| `spec_id` | string | REQUIRED | `<YYYY-MM-DD>-<id>` | id of the SPEC this IDEA feeds |
    35	| `status` | enum | REQUIRED | `draft` \| `ready-for-spec` \| `owner-blocking` \| `archived` | initial value `draft` |
    36	| `owner` | string | REQUIRED | owner identifier | e.g. `HasNoBeef` |
    37	| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `codex-gpt-5.5`, `claude-opus-4-7-1m`, or any other model:lane label |
    38	| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-05-01` |
    39	| `implies_spec_type` | enum | REQUIRED | `task` \| `contract` \| `decision` | drives template selection in `/author-spec` |
    40	
    41	Example:
    42	
    43	```yaml
    44	---
    45	id: bes-spec-authoring-procedure-v1
    46	spec_id: 2026-05-01-bes-spec-authoring-procedure-v1
    47	status: ready-for-spec
    48	owner: HasNoBeef
    49	brainstormed_by: codex-gpt-5.5  # or claude-opus-4-7-1m, etc. — any model:lane label
    50	brainstormed_on: 2026-05-01
    51	implies_spec_type: contract
    52	---
    53	```
    54	
    55	### 1.2 SPEC.md front-matter (shared across all three types)
    56	
    57	| Field | Type | Required | Allowed values | Notes |
    58	|---|---|---|---|---|
    59	| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
    60	| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` | state machine; only owner sets `approved`, `decomposed`, and `closed` |
    61	| `type` | enum | REQUIRED | `task` \| `contract` \| `decision` | determines which template was used |
    62	| `owner` | string | REQUIRED | owner identifier | |
    63	| `repo` | string | REQUIRED | repo name | e.g. `bes-fleet-policy` |
    64	| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
    65	| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
    66	| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
    67	| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
    68	| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
    69	| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |
    70	
    71	Example (Contract SPEC):
    72	
    73	```yaml
    74	---
    75	id: 2026-05-01-bes-spec-authoring-procedure-v1
    76	status: approved
    77	type: contract
    78	owner: HasNoBeef
    79	repo: bes-fleet-policy
    80	branch_policy: main-direct
    81	risk: medium
    82	requires_network: false
    83	requires_secrets: []
    84	ideated_in: specs/2026-05-01-bes-spec-authoring-procedure-v1/IDEA.md
    85	acceptance_commands:
    86	  - test -f agents/specs/SPEC.task.template.md
    87	  - bash agents/scripts/lint-spec.sh specs/<id>/SPEC.md
    88	---
    89	```
    90	
    91	### 1.3 Status state machine
    92	
    93	```text
    94	                  /idea-capture (gate pass)
    95	IDEA.draft ─────────────────────────────► IDEA.ready-for-spec
    96	   ▲                                              │
    97	   │ owner returns                                │ /author-spec
    98	   └─────────────── IDEA.draft ◄──┐               ▼
    99	                                  │      SPEC.draft
   100	                                  │           │
   101	                                  │           │ /review-spec
   102	                                  │           ▼
   103	                                  │   SPEC.needs-revision ─── revise+rerun ─┐
   104	                                  │           ▲                              │
   105	                                  │           │ owner returns                │
   106	                                  │           │                              │
   107	                                  │   SPEC.approved-pending-owner ◄──────────┘
   108	                                  │           │
   109	                                  │           │ owner sets status: approved
   110	                                  │           ▼
   111	                                  │   SPEC.approved
   112	                                  │           │
   113	                                  │           │ /decompose-approved-spec
   114	                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
   115	                                  │           │ emits specs/<id>/tasks/T*.md
   116	                                  │           ▼
   117	                                  │   SPEC.<owner sets decomposed>
   118	                                  │           │
   119	                                  │           │ Linear issues created from TASK.md set;
   120	                                  │           │ Symphony picks them up; execution begins
   121	                                  │           ▼
   122	                                  │   SPEC.in-execution
   123	                                  │           │
   124	                                  │           │ acceptance_commands pass + Completion Report filled
   125	                                  │           ▼
   126	                                  │   SPEC.verified
   127	                                  │           │
   128	                                  │           │ spec evidence captured
   129	                                  │           ▼
   130	                                  │   SPEC.closed
   131	```
   132	
   133	Idempotency: status transitions are monotonic except for the explicit
   134	`needs-revision` and `owner-blocking` reverse edges. `approved`,
   135	`decomposed`, and `closed` MUST NOT revert without owner action.
   136	Owner alone sets `approved`, `decomposed`, and `closed`. The
   137	`spec-review` skill MUST NOT set `approved`. The
   138	`approved-spec-decomposition` skill MUST NOT set `decomposed`. The
   139	`spec-evidence-governance` skill MUST NOT set `closed`. Skills MAY set
   140	`approved-pending-owner` on a clean gate result.
   141	
   142	**Capture-after exception (owner-only).** A Contract or Decision
   143	SPEC MAY land directly at `status: verified` in the same
   144	change-set as the work it specifies, when the work was implemented
   145	before the SPEC was authored under explicit owner directive
   146	(`owner://transcript-<date>`). The per-type quality gate
   147	(`spec-review`) and citation grammar remain REQUIRED; only the
   148	temporal precedence of SPEC-before-work is waived. Reference
   149	precedent: `file://specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC.md`
   150	and capture SE3 at
   151	`file://specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC_EVIDENCE.md`.
   152	Capture-after is an exception path; routine work follows the
   153	normal lifecycle so the BLOCKING review gate runs before
   154	approval.
   155	
   156	### 1.4 TASK.md front-matter
   157	
   158	TASK.md is the per-slice executable artefact emitted by the
   159	`approved-spec-decomposition` skill from an approved SPEC's §11
   160	Execution Plan (Task) or §11 / §14 / §15 (Contract). One TASK.md
   161	== one Linear issue == one Symphony per-issue workspace run. The
   162	parent SPEC remains the immutable execution authority; TASK.md
   163	files are NOT peer authorities.
   164	
   165	| Field | Type | Required | Allowed values | Notes |
   166	|---|---|---|---|---|
   167	| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
   168	| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
   169	| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors Linear active states; only owner sets `done` |
   170	| `owner` | string | REQUIRED | agent id or `unassigned` | |
   171	| `model_route` | string | REQUIRED | model slug from `agents/MODEL_ROUTING.md` Codex or Claude Catalog | primary execution lane |
   172	| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
   173	| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
   174	| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
   175	| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
   176	| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
   177	| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `2026-05-04-agent-parallelism-and-model-routing-v2` §7.1 |
   178	| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
   179	| `linear_issue` | string \| null | REQUIRED | Linear identifier (e.g. `BES-123`) or `null` | null until decomposition reflected in tracker |
   180	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba agents/MODEL_ROUTING.md | sed -n '120,180p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   120	| Task class | Primary route | Secondary route | Notes |
   121	| --- | --- | --- | --- |
   122	| Root fleet management | Codex on `gpt-5.5`, `xhigh` | Claude Opus 4.7 or 4.6 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
   123	| Repo orientation | Codex `gpt-5.5` or `gpt-5.4-mini` | Claude `sonnet` | Use faster models only for bounded read-only inventory. |
   124	| New non-trivial SPEC | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 critique | Claude should review ambiguity before high-risk execution; prefer 4.6 when cost/quality fit is better. |
   125	| Spec review | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` | Both for high-risk specs | Use independent review for public OSS, architecture, security, release, or cross-repo work. |
   126	| Implementation from approved spec | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Claude `sonnet` for creative/supporting work | Write-capable agents need branch/worktree isolation and file ownership; probe 4.6 before assigning writes. |
   127	| Fast fanout / document scan | Codex `gpt-5.4-mini` | Claude `haiku` | Return distilled facts to the root agent; do not let scan agents edit. |
   128	| Multi-agent coding | One lead writer on Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Additional writers only on disjoint files/worktrees | Root fleet manager must define ownership and integration order before edits. |
   129	| Creative/product/design synthesis | Claude `sonnet`, preferably adaptive when configured and available | Claude Opus 4.7, Opus 4.6, or Codex `gpt-5.5` for final technical validation | Useful for tone, concepts, narrative, and design exploration; specs still control execution. |
   130	| Code review | Codex `gpt-5.5` with `code-review` | Claude Opus 4.7 or 4.6 | Findings first, severity ordered, with file/line citations. |
   131	| Public OSS release work | Codex `gpt-5.5` | Claude Opus 4.7 or 4.6 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
   132	| Green room product evaluation | Codex `gpt-5.5`, Claude Opus 4.7, or Claude Opus 4.6 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
   133	| Long-context synthesis | Claude Opus 4.7/4.6 `[1m]` or Sonnet `[1m]` after probe | Codex `gpt-5.5` with scoped docs | Use 1M context only when account support and cost posture are acceptable. |
   134	| Trivial local command | Current root agent | None | Do not spawn agents for simple terminal answers. |
   135	
   136	## Approved SPEC Decomposition
   137	
   138	Run `/decompose-approved-spec` after a SPEC reaches `status:
   139	approved` and before agents begin execution. The phase is
   140	**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
   141	Execution Plan. The approved SPEC remains the immutable execution
   142	authority; decomposition emits durable per-slice TASK.md files
   143	that 1:1 bind to Linear issues and Symphony per-issue workspaces
   144	(`file://agents/skills/approved-spec-decomposition/SKILL.md`,
   145	`file://agents/specs/SPEC.schema.md` §1.4,
   146	`file://specs/2026-05-09-symphony-aligned-execution-layer/SPEC.md`).
   147	
   148	Output: one TASK.md per slice at
   149	`specs/<spec_id>/tasks/T-NN-<slug>.md` (or
   150	`.agents/specs/<spec_id>/tasks/...` in child repos). Front-matter
   151	pins the model lanes (primary `model_route`,
   152	`cross_validation_lane`, `verification_lane`), the dispatch mode,
   153	deps, write_scope, and `acceptance_commands`. Body sections are
   154	Goal, Parent SPEC anchor, Scope, Model dispatch, Acceptance,
   155	Evidence (executor fills), Stop conditions, and Linear binding.
   156	
   157	Model-lane assignment per task class draws from the Routing Matrix
   158	above:
   159	
   160	- `task_class: implementation` → primary Codex `gpt-5.5`,
   161	  cross-validation Claude Opus 4.7/4.6 (different family).
   162	- `task_class: code-review` → cross-family from the implementer.
   163	- `task_class: verification` (behavioral) → different family
   164	  from the implementer; mechanical verification (lint, test) MAY
   165	  share family.
   166	- `task_class: research` / `docs` → fast read lanes acceptable
   167	  for the primary; cross-family reviewer for high-stakes claims.
   168	
   169	`cross_validation_lane` MUST be a different model family from
   170	`model_route`. The decomposition skill REFUSES to emit a TASK.md
   171	without cross-family pairing
   172	(`file://agents/skills/approved-spec-decomposition/SKILL.md` Hard
   173	Rules).
   174	
   175	Mark a slice `AFK` only when ownership is bounded, acceptance
   176	evidence is explicit, no mid-slice owner judgment is needed, and
   177	the cross-validation lane is configured. Otherwise mark `HITL`.
   178	
   179	Owner alone flips the parent SPEC's status `approved →
   180	decomposed`. The decomposition skill MUST NOT.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba agents/OPERATING_MODEL.md | sed -n '230,245p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   230	Each type has a dedicated template at `.agents/specs/SPEC.<type>.template.md`.
   231	Shared front-matter and citation grammar live in
   232	`.agents/specs/SPEC.schema.md`.
   233	
   234	Quality gates are blocking and per-type:
   235	
   236	- Task: bar (b) "verifiable".
   237	- Contract: bar (c) "Symphony-grade", with REQUIRED lint pass.
   238	- Decision: bar (b) plus candidate-comparison structure.
   239	
   240	The `spec-review` skill enforces these as a blocking gate. A spec MUST NOT
   241	advance to `approved` while any blocking criterion fails. RFC 2119 normative
   242	language applies in IDEA.md, Task SPEC, Contract SPEC, and Decision SPEC's
   243	Decision Statement section.
   244	
   245	## Content And Creative Authority

codex
I’ve got the main shape of the artefacts. One concrete candidate-space mismatch is already visible: the research owner-question included a paper/arxiv-style option, while the Decision SPEC’s §5 candidate set does not carry that option forward. I’m checking whether that omission is the only blocking issue or whether the matrix/lock language creates additional blockers.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"\\b(MUST|MUST NOT|REQUIRED|SHALL|SHALL NOT|SHOULD|SHOULD NOT|RECOMMENDED|MAY|OPTIONAL)\\b\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
21:The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
22:`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
223:The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
227:The Product B repo `agentic-installation-methodology` SHALL
236:The methodology body SHALL follow the seven phases plus
245:The Product A repo `agentic-ops-framework` SHALL be repacked
247:Product B v1.0 authoring; the two artefacts SHALL ship as a
250:BES SHALL be named directly throughout Product B's published
251:artefacts; the case-study density REQUIRED by research §7
256:§7 SHALL be published as case data, with sanitization
263:§2.3 SHALL be published as flagged-open; Product B MUST NOT
268:the published SPEC bundle alone — SHALL gate Product B
269:publication. Same-family proxy results MAY inform authoring
270:but MUST NOT substitute for the external pass.
272:Product B's authoring MUST itself follow the v1 BES spec
279:Implementations of this Decision SHOULD prefer earlier-phase
284:Implementations MAY parallelize Phase 0-2 (analysis) across
288:Implementations MAY adopt additional sub-spec facets beyond

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 217ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/IDEA.md
artefact / type:       idea / decision
sections (top-level):  8
citation-prefix hits:  20
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

 succeeded in 2120ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/SPEC.md
artefact / type:       spec / decision
sections (top-level):  15
citation-prefix hits:  52
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "paper|arxiv|workshop|longread|series|SPEC bundle|manifest|catalog|external cross-family|validation|anonym|failure|open research" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "paper|arxiv|workshop|longread|series|SPEC bundle|manifest|catalog|external cross-family|validation|anonym|failure|open research" specs/2026-05-18-agentic-installation-methodology/IDEA.md specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
40:proposes a hybrid (longread + SPEC bundle) shape with a paired
48:external validation) can proceed without further owner-blocking
88:  (Hybrid longread + SPEC bundle, paired release, full
89:  attribution, all failure modes, all open research questions
90:  flagged, external cross-family validation gate).
116:- [x] Cross-family validation timing — resolved (gates
130:| Honest disclosure — failure modes + open questions visible | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
131:| Cross-family validation evidence | research §6 Phase 5; `owner://transcript-2026-05-18` | high |
137:### 5.1 Hybrid — longread + SPEC bundle, paired release
141:  longread (~8-12K words, first-person, BES case-study
142:  density) plus an authoritative SPEC bundle (front-door
143:  manifest + per-facet sub-specs covering architecture,
146:  manifest+catalog as v2.0 in parallel; the paired release
147:  ships both. External cross-family validation pass gates
155:  including Product A repack + cross-family validation
161:### 5.2 Methodology AS a SPEC bundle only
163:- Description: Pure dogfooding; no longread. The methodology
164:  paper IS the manifest+catalog. Readers consume it the way
166:  cross-family validation still required.
178:### 5.3 Single longread engineering blog (~5-10K words)
181:  Product A repack. No cross-family validation gate (nothing
195:### 5.4 Multi-part series (5-7 posts)
199:  validation gate.
206:- Risk: Series fatigue; the high-density failure-mode +
212:| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part |
216:| Honest disclosure (failure modes + open questions) | max | medium | min | min |
217:| Cross-family validation evidence | yes (gates) | yes (gates) | no | no |
223:The studio SHALL adopt Candidate 5.1 (Hybrid — longread +
224:SPEC bundle, paired Product A v2.0 / Product B v1.0 release)
228:ship two paired artefacts: an engineering longread
230:posture; BES case-study density; failure modes as first-class
231:content) and an authoritative SPEC bundle structured as a
232:front-door manifest plus per-facet sub-specs (architecture,
241:sanitization bar; Phase 4 manifest + catalog composition;
243:failure modes as first-class content).
246:into the manifest+catalog shape as v2.0 in parallel with
252:forecloses anonymization.
254:All four-plus failure modes catalogued in
258:transcripts; the failure-mode patterns themselves are the
261:All seven open research questions catalogued in
266:An external cross-family agent validation pass — a
268:the published SPEC bundle alone — SHALL gate Product B
274:longread authoring, SPEC-bundle authoring, validation pass)
285:agents while keeping Phase 3-6 (composition + validation) on
289:the eight catalogued in §6 above when the case-study work
290:surfaces them, provided the additions are catalogued in the
291:front-door manifest and named explicitly in a follow-on
308:first place; research §7 lists the BES failure-mode density
317:shipping only as blog or post-series self-undermines the
329:- Repack of `agentic-ops-framework` v1.1 into manifest +
330:  catalog v2.0.
331:- Authoring of the longread and per-facet sub-specs as
333:- External cross-family validation engagement as a follow-on
340:- Shipping Product B as a blog-only or series-only artefact
341:  without a SPEC bundle. (Reversible only by superseding this
345:- Publishing Product B before the external cross-family
346:  validation pass completes. (Reversible only by superseding
349:  manifest + catalog shape Product B advocates. (Reversible
356:- External cross-family validation pass surfaces a structural
357:  flaw in the manifest+catalog shape that cannot be patched
365:  ownership split + manifest+catalog) before Product B ships;
374:3. Notify dependents: the Product A repack task, the longread
375:   authoring task, the SPEC bundle authoring task, the
376:   cross-family validation engagement.
389:  prove the field-state homework is done; the longread voice
457:repack, longread authoring, SPEC-bundle authoring, validation
472:  slice classes (standup, repack, longread, SPEC-bundle,
473:  validation) but does not bound elapsed time, word counts
479:- **Cross-family validation engagement cost**: §7 makes
480:  external cross-family pass a publication gate. The engagement
484:  validation engagement is harder than estimated, the paired-
509:  the slice list (standup, repack, longread, SPEC-bundle,
510:  validation pass) inside the normative section, which lets

 succeeded in 0ms:
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:16:> the earlier "methodology paper about operating-model extraction"
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:38:non-prescriptive SPEC (or SPEC bundle) that agents can deploy
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:48:- What are the open research problems the methodology has to
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:81:### 2.3 Seven open research questions the methodology has to flag
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:131:| §3.3 External Dependencies | **Explicit runtime-dependency manifest** | Universal |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:133:| §5 Workflow Specification | **Repo-owned contract pattern** with framework-defined schema + free-form body + strict validation. The single most novel-and-portable building block in the document. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:155:### 4.1 Structured customization / variability catalog with deferral contract
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:171:**(a)** a structured catalog of variability — what knobs exist,
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:211:**Not** a monolithic SPEC.md. Per the research, a **manifest +
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:212:catalog hybrid** wins.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:216:- **Front-door manifest** (machine-readable, YAML/JSON) names:
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:219:  pointer to SBOM / dependency manifest; pointer to
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:220:  as-built deployment manifest; signature.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:226:    manifests / Nix flake / Docker compose — pick whichever
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:231:  - `customization/` — the catalog of variability + deferral
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:236:  - `operations/` — failure classes × recovery (Symphony §14
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:278:- The product's failure modes are characterized.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:296:- Operational story (failures, observability, safety)
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:306:one pattern; a multi-file customization catalog is another.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:319:### Phase 4 — Compose the manifest + catalog
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:321:Produce the front-door manifest + per-facet sub-specs per §5.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:338:example). The methodology paper ships standalone (Product B
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:342:### Phase 7 — Publish failure modes as first-class content
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:348:- Ambiguities the validation walkthrough surfaced
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:357:- **Phase 0 maturity signals**: the 2026-05-17 validation run
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:358:  (`file://specs/2026-05-17-operating-model-validation-run/RESEARCH.md`)
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:365:  `fleet-manifest`-style configs are needed, not a single
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:370:- **Phase 4 manifest + catalog**: the BES sanitized framework
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:371:  repo (Product A) IS the worked example of the catalog
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:377:- **Phase 7 failure modes** to disclose (sanitized):
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:380:  - Decomposition phase paper-only across 23 SPECs
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:388:the failure modes themselves are the value.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:411:  (a) single longread engineering blog (~5-10K words);
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:412:  (b) multi-part series (5-7 posts);
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:413:  (c) paper-style (arxiv / workshop);
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:414:  (d) the methodology itself published AS a SPEC bundle
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:415:  (manifest + catalog) — eats its own dogfood;
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:416:  (e) hybrid (longread for narrative + spec bundle for
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:422:  Product A itself. The research strongly recommends manifest
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:423:  + catalog over single SPEC.md. Confirm Product A also
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:430:  paper is overtly a case study; BES is named more directly
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:432:  BES extraction journey"); (ii) anonymized ("the source
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:433:  studio"); (iii) anonymized in body, named in acknowledgements.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:435:- [ ] **Q5**: Which BES failure modes get published as case
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:438:  others); (iii) abstract all into "failure-mode categories"
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:440:- [ ] **Q6**: Honest framing on the 7 open research questions
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:449:- [ ] **Q7**: Cross-family validation pass. Same-family proxy
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:453:  trigger external validation before publishing? Or publish
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:469:5. Cross-family validation walkthrough (per Q7) becomes its
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:486:  ambiguity-handling failure mode)
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:512:- `file://specs/2026-05-17-operating-model-validation-run/RESEARCH.md`
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:517:  (decomposition-phase paper-only case data)
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:529:| Q1 publication shape | **Hybrid — longread + SPEC bundle (manifest + catalog)** | Strongest dogfooding (the methodology IS the manifest+catalog shape it advocates) + readable on-ramp (longread for narrative). Research §5.2 supports manifest+catalog as the right packaging for partial-read agent consumption. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:530:| Q2 phase count | **7 phases + Phase 0 per §6** | Each phase is independently load-bearing per the research. Collapsing trades rigor for readability; the longread carries the narrative load, the SPEC bundle preserves the rigor. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:531:| Q3 Product A repack | **Parallel repack into manifest+catalog → paired release (Product A v2.0 + Product B v1.0)** | Maximum dogfooding: Product B's worked example IS the repacked Product A v2.0. Accept the rework cost on Product A to ship a coherent paired artefact. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:533:| Q5 failure mode disclosure | **All published as case data** | §7 names 4+ failure modes; all surface as case data with sanitized specifics. Failure modes are the value per §8. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:534:| Q6 open research questions | **All 7 from §2.3 published as flagged open** | The honest posture demands disclosure. The methodology helps ADDRESS these questions; it does not pretend to RESOLVE them. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:535:| Q7 cross-family validation | **Practice what we preach — external cross-family validation before publishing** | Phase 5 (per §6) is non-negotiable. Same-family proxy used during authoring; external cross-family run gates publication. |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:554:- The seven open research questions in §2.3 are honestly
specs/2026-05-18-agentic-installation-methodology/IDEA.md:45:customization catalog with deferral contract; per-facet
specs/2026-05-18-agentic-installation-methodology/IDEA.md:61:  §5 recommends manifest+catalog packaging; §6 lays out the
specs/2026-05-18-agentic-installation-methodology/IDEA.md:88:  methodology saying manifest+catalog is the right packaging,
specs/2026-05-18-agentic-installation-methodology/IDEA.md:89:  the methodology artefact itself MUST be a manifest+catalog
specs/2026-05-18-agentic-installation-methodology/IDEA.md:95:  open research questions from research §2.3 are published as
specs/2026-05-18-agentic-installation-methodology/IDEA.md:96:  flagged-open, not papered over. The methodology offers a
specs/2026-05-18-agentic-installation-methodology/IDEA.md:101:- **Methodology MUST publish failure modes as first-class
specs/2026-05-18-agentic-installation-methodology/IDEA.md:102:  content.** Research §7 names 4+ BES failure modes (fastpath
specs/2026-05-18-agentic-installation-methodology/IDEA.md:103:  zero-adoption, decomposition-phase paper-only across 23
specs/2026-05-18-agentic-installation-methodology/IDEA.md:107:- **External cross-family validation MUST gate publication.**
specs/2026-05-18-agentic-installation-methodology/IDEA.md:129:### 4.1 Hybrid — longread + SPEC bundle (manifest + catalog) [RECOMMENDED]
specs/2026-05-18-agentic-installation-methodology/IDEA.md:131:- Sketch: Two paired artefacts. (a) Engineering longread
specs/2026-05-18-agentic-installation-methodology/IDEA.md:133:  experiential, BES case-study density, failure modes as
specs/2026-05-18-agentic-installation-methodology/IDEA.md:134:  first-class content. (b) Authoritative SPEC bundle —
specs/2026-05-18-agentic-installation-methodology/IDEA.md:135:  front-door manifest + per-facet sub-specs (architecture /
specs/2026-05-18-agentic-installation-methodology/IDEA.md:137:  / operations / non-goals) per research §5. The longread is
specs/2026-05-18-agentic-installation-methodology/IDEA.md:138:  the readable entry point; the SPEC bundle is the
specs/2026-05-18-agentic-installation-methodology/IDEA.md:140:- Fit: Maximum dogfooding — the methodology IS the manifest+
specs/2026-05-18-agentic-installation-methodology/IDEA.md:141:  catalog shape it advocates. Maximum on-ramp — the longread
specs/2026-05-18-agentic-installation-methodology/IDEA.md:143:  the SPEC bundle. Aligns with research §5.2 and §8 posture.
specs/2026-05-18-agentic-installation-methodology/IDEA.md:147:  validation pass. Estimate 4-6 weeks elapsed (sanitized
specs/2026-05-18-agentic-installation-methodology/IDEA.md:150:  SPEC bundle can grow until the longread becomes a summary
specs/2026-05-18-agentic-installation-methodology/IDEA.md:154:### 4.2 Methodology AS a SPEC bundle only
specs/2026-05-18-agentic-installation-methodology/IDEA.md:156:- Sketch: Pure dogfooding. No longread. The methodology paper
specs/2026-05-18-agentic-installation-methodology/IDEA.md:157:  IS the manifest+catalog. Readers consume it the way agents
specs/2026-05-18-agentic-installation-methodology/IDEA.md:164:  Product A repack + cross-family validation.
specs/2026-05-18-agentic-installation-methodology/IDEA.md:170:### 4.3 Single longread engineering blog (~5-10K words)
specs/2026-05-18-agentic-installation-methodology/IDEA.md:175:  manifest+catalog but the artefact ignores its own advice.
specs/2026-05-18-agentic-installation-methodology/IDEA.md:178:  needed (the longread can describe the repack as future
specs/2026-05-18-agentic-installation-methodology/IDEA.md:179:  work). No cross-family validation gate needed (no
specs/2026-05-18-agentic-installation-methodology/IDEA.md:185:### 4.4 Multi-part series (5-7 posts)
specs/2026-05-18-agentic-installation-methodology/IDEA.md:189:  independently; series acts as scaffolding.
specs/2026-05-18-agentic-installation-methodology/IDEA.md:197:  the case-study density that lands in parts 5-7 (failure
specs/2026-05-18-agentic-installation-methodology/IDEA.md:198:  modes; cross-family validation) reaches a smaller audience.
specs/2026-05-18-agentic-installation-methodology/IDEA.md:202:**Approach 4.1: Hybrid — longread + SPEC bundle, with paired
specs/2026-05-18-agentic-installation-methodology/IDEA.md:210:  demonstrates the manifest+catalog packaging it advocates.
specs/2026-05-18-agentic-installation-methodology/IDEA.md:211:- The longread carries the case-study density and narrative
specs/2026-05-18-agentic-installation-methodology/IDEA.md:236:- [x] Q5 failure-mode disclosure — resolved §7 (all
specs/2026-05-18-agentic-installation-methodology/IDEA.md:238:- [x] Q6 open research questions — resolved §7 (all 7
specs/2026-05-18-agentic-installation-methodology/IDEA.md:240:- [x] Q7 cross-family validation — resolved §7 (external
specs/2026-05-18-agentic-installation-methodology/IDEA.md:256:  - Q1 → Approach 4.1 (Hybrid longread + SPEC bundle).
specs/2026-05-18-agentic-installation-methodology/IDEA.md:261:  - Q3 → Parallel repack: Product A v2.0 manifest+catalog
specs/2026-05-18-agentic-installation-methodology/IDEA.md:266:  - Q5 → All failure modes from research §7 published as
specs/2026-05-18-agentic-installation-methodology/IDEA.md:269:  - Q6 → All 7 open research questions from research §2.3
specs/2026-05-18-agentic-installation-methodology/IDEA.md:272:  - Q7 → External cross-family validation run gates Product B

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "architecture|deployment|behavior|customization|decisions|quality|operations|non-goals|conformance|reference implementation|signed" specs/2026-05-18-agentic-installation-methodology/SPEC.md specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:22:> They publish an exhaustive but non-prescriptive deployment-grade
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:26:> product direction; user-with-agent owns customization and local
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:27:> deployment. No developer support loop.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:32:> interested in agentic deployment or working with agents.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:61:- **Explicit cross-org ownership split.** Reference-architecture
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:62:  vs. solution-architecture literature comes closest (the
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:69:style customization grammar + Gherkin behavioral acceptance +
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:84:   stable?** Reference-architecture literature warns this is
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:108:   attack surface — supply chain through customization
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:124:ANY product's deployment SPEC. The deep read identified the
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:125:following as portable building blocks (architecture pattern,
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:130:| §2 Goals / Non-Goals | **Negative-space declaration** | Pre-emptively closes ambiguous deployment scope |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:134:| §6 Config Resolution Pipeline + Dynamic Reload + Preflight | **Five-step pipeline structure** | Configuration pipelines are universal; the explicit decomposition is rare and high-quality |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:141:| §17 Three Conformance Profiles | **Core / Extension / Real-Integration tiering** | Reusable conformance harness shape |
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:155:### 4.1 Structured customization / variability catalog with deferral contract
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:162:  concerns, not customization.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:181:Symphony §2.2 does whole-product non-goals; §11.5 does
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:182:integration-boundary non-goals. Almost no methodology does
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:183:this **per facet** ("the deployment spec does NOT cover…", "the
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:184:behavior spec does NOT cover…", "the customization grammar does
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:190:The reference-architecture-vs-solution-architecture distinction
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:217:  spec version; conformance profile claimed; pointers to
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:218:  sub-specs by facet; pointer to executable conformance suite;
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:220:  as-built deployment manifest; signature.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:222:  - `architecture/` — C4 Container-level (Structurizr DSL
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:225:  - `deployment/` — devcontainers / Helm / Kubernetes
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:227:    matches the product; specify the customization knobs in
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:229:  - `behavior/` — Gherkin / Cucumber executable acceptance
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:231:  - `customization/` — the catalog of variability + deferral
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:233:  - `decisions/` — ADRs (Nygard format), append-only,
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:235:  - `quality/` — arc42 §10 + 15-factor conformance overlay.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:236:  - `operations/` — failure classes × recovery (Symphony §14
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:239:  - `non-goals/` — facet-level negative space (§4.2 above;
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:250:  are signed and verifiable.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:255:  the moment (`customization/` to learn knobs; `behavior/` to
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:256:  verify; `operations/` when debugging).
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:261:  structured-data; decision facets want ADRs; behavior wants
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:262:  executable; architecture wants diagrammable.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:265:  architecture / rationale.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:273:When is a product mature enough to publish as a deployment-grade
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:276:  installers that the configuration / customization surface is
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:280:  decisions vs. the implementation accidents.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:281:- The product has an empirical conformance bar — at minimum,
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:286:customization surface is "edit the source."
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:306:one pattern; a multi-file customization catalog is another.
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:487:- `url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:488:  (the architecture-vs-solution distinction)
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:491:- `url://helm.sh/` (the strongest customization-affordance
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:493:- `url://12factor.net/` (the conformance overlay)
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:550:  The "Elixir reference implementation" claim in earlier
specs/2026-05-18-agentic-installation-methodology/SPEC.md:36:prescriptive deployment-grade SPEC that user-dispatched coding
specs/2026-05-18-agentic-installation-methodology/SPEC.md:107:Owner decisions required before implementation:
specs/2026-05-18-agentic-installation-methodology/SPEC.md:119:No further owner-blocking decisions remain at this Decision
specs/2026-05-18-agentic-installation-methodology/SPEC.md:143:  manifest + per-facet sub-specs covering architecture,
specs/2026-05-18-agentic-installation-methodology/SPEC.md:144:  deployment, behavior, customization, decisions, quality,
specs/2026-05-18-agentic-installation-methodology/SPEC.md:145:  operations, non-goals). Product A is repacked into
specs/2026-05-18-agentic-installation-methodology/SPEC.md:167:- Fit with substance: Strong — perfect self-conformance.
specs/2026-05-18-agentic-installation-methodology/SPEC.md:232:front-door manifest plus per-facet sub-specs (architecture,
specs/2026-05-18-agentic-installation-methodology/SPEC.md:233:deployment, behavior, customization, decisions, quality,
specs/2026-05-18-agentic-installation-methodology/SPEC.md:234:operations, non-goals).

codex
**Quality Gate Result**

Result: **FAIL - blocking revision required**. Review was read-only; no mutations. `lint-spec.sh` passes for both IDEA and SPEC, but the cross-family substance gate does not pass.

**Findings**

1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
   §5 omits the upstream `paper-style (arxiv / workshop)` publication candidate from `RESEARCH.md:410-417`. The IDEA also dropped it at `IDEA.md:127`. Add it as a candidate or explicitly justify why it is not in the Decision candidate space.

2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
   The chosen hybrid shape preserves only manifest + eight sub-spec facets, but research’s packaging primitive also includes executable conformance suite and signed bundle at `RESEARCH.md:216-250`. A different-family implementer would likely group these as top-level `conformance/verification` and `provenance/signing/release`, not optional extra facets. `SPEC.md:288-292` makes “additional facets” require amendment, which compounds the mismatch.

3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
   The “Honest disclosure” matrix row is underspecified/mis-scored. The criterion at `SPEC.md:130` is visibility of failure modes + open questions, but longread/series/spec-only formats can still disclose those. The row appears to conflate disclosure with dogfooding and cross-family validation, already separate rows at `SPEC.md:214` and `SPEC.md:217`. This weakens the rationale at `SPEC.md:296-299`.

4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.

**Checks Passed**

RFC 2119 use is clean: only boilerplate definition lines and §7 normative clauses were found. I did not find a binding misuse of the rolls-royce owner framing; it is applied consistently as the strongest-rigour resolver. The issue is incomplete carry-through, not the owner directive itself.


tokens used
157,952
**Quality Gate Result**

Result: **FAIL - blocking revision required**. Review was read-only; no mutations. `lint-spec.sh` passes for both IDEA and SPEC, but the cross-family substance gate does not pass.

**Findings**

1. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:135:BLOCKING`  
   §5 omits the upstream `paper-style (arxiv / workshop)` publication candidate from `RESEARCH.md:410-417`. The IDEA also dropped it at `IDEA.md:127`. Add it as a candidate or explicitly justify why it is not in the Decision candidate space.

2. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:227:BLOCKING`  
   The chosen hybrid shape preserves only manifest + eight sub-spec facets, but research’s packaging primitive also includes executable conformance suite and signed bundle at `RESEARCH.md:216-250`. A different-family implementer would likely group these as top-level `conformance/verification` and `provenance/signing/release`, not optional extra facets. `SPEC.md:288-292` makes “additional facets” require amendment, which compounds the mismatch.

3. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:216:MAJOR`  
   The “Honest disclosure” matrix row is underspecified/mis-scored. The criterion at `SPEC.md:130` is visibility of failure modes + open questions, but longread/series/spec-only formats can still disclose those. The row appears to conflate disclosure with dogfooding and cross-family validation, already separate rows at `SPEC.md:214` and `SPEC.md:217`. This weakens the rationale at `SPEC.md:296-299`.

4. `specs/2026-05-18-agentic-installation-methodology/SPEC.md:338:MAJOR`  
   Locks foreclose blog-only/series-only publication, but not SPEC-bundle-only/no-longread, despite rejecting that at `SPEC.md:306-312`. Because the paper-style option is also absent, §9/§10 do not fully cover the rejected shape space.

**Checks Passed**

RFC 2119 use is clean: only boilerplate definition lines and §7 normative clauses were found. I did not find a binding misuse of the rolls-royce owner framing; it is applied consistently as the strongest-rigour resolver. The issue is incomplete carry-through, not the owner directive itself.


