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
   591	  pre-amendment value; current state 64 per §14.0
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
   605	  original verification; 64 current per §14.0).
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"citation hits:|current state [0-9]+|Lint citation count|citation count|65|64|§14\\.0\" specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
580:- citation hits: 65 (per current `lint-spec.sh` invocation)
591:  pre-amendment value; current state 64 per §14.0
605:  original verification; 64 current per §14.0).
612:  candidates × 5 fields, 7×6 trade-off matrix per §14.0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find /var/home/hasnobeef -path '*agentic-installation-methodology*' -type f -name '01-parent-decision.md' 2>/dev/null | sort" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 1500ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md

codex
The R4 review file is in the sibling `buildepicshit/agentic-installation-methodology` tree, not at the literal `../../` path from the repo root. One live inconsistency already surfaced in §14: the new §14.0 says 65, while two historical notes still say “current state 64 per §14.0”; I’m checking whether that is in scope for this gate and running the repo lint now.
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
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' agents/OPERATING_MODEL.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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
session id: 019e42e5-b940-7a11-8e0a-38b4beac14f7
--------
user
Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
codex
I’ll treat this as a read-only spec review: confirm the Round 3 findings against the current file and the 71728cf remediation, then look for regressions introduced by that change.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|methodology|Round 4|Round 3" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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
527:- when the user defines the smallest ambitious proof as reproducing a WFC outcome inside Floom's volumetric/BSP/IR multi-ring methodology -> recognize that as the new north-star proof, not a generic demo-polish task [Task 2]

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline --decorate 71728cf' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
 .../SPEC.md                                        | 58 ++++++++++++++++++----
 1 file changed, 48 insertions(+), 10 deletions(-)

codex
The worktree is clean on `main` at 71728cf, so I can review the exact remediation state without separating unrelated local changes. Next I’m reading the target spec, the Round 3 decision, and the affected diff hunks.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg --files specs/2026-05-18-agentic-installation-methodology' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
specs/2026-05-18-agentic-installation-methodology/SPEC.md
specs/2026-05-18-agentic-installation-methodology/IDEA.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --format=fuller --stat --patch --find-renames 71728cf -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
commit 71728cf6ecc78dc65eabd9f5f04253ba9a38a546
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 17:46:52 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 17:46:52 2026 -0700

    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
    
    Round-3 codex re-review caught:
    - MAJOR: §11 Check 1 said "Candidates 5.1-5.6 real and distinct"
      but §5.6 is explicitly "Identical reasoning to 5.2; named
      explicitly to be foreclosed in §9" — an alias not a distinct
      shape. The "5 distinct + 1 alias" structure is by design per
      §7.A, but the §11 wording overclaimed.
    - ADVISORY: §14 Completion Report had pre-amendment evidence
      values (47 citation hits; 4 candidates x 5 fields; 6x4 matrix)
      reflecting original 2026-05-18 verification, not current state
      post Round 1-3 amendments.
    
    Fixes:
    - §11 Check 1 rewritten to acknowledge the 5-distinct + 1-alias
      structure honestly; references the §7.A authority for the alias
      by-design.
    - §14 gains a new §14.0 Amendment Log subsection disclosing the
      post-verification amendment trail (5 -> 3 -> 4 -> current) with
      evidence-value updates. §14.1 + §14.2 retain the historical
      original-verification values + reference §14.0 for current
      state. This is the honest disclosure pattern: don't rewrite
      history, annotate it.
    
    Lint clean post-edit (65 citation hits).
---
 .../SPEC.md                                        | 58 ++++++++++++++++++----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/specs/2026-05-18-agentic-installation-methodology/SPEC.md b/specs/2026-05-18-agentic-installation-methodology/SPEC.md
index 8d12881..f35da8b 100644
--- a/specs/2026-05-18-agentic-installation-methodology/SPEC.md
+++ b/specs/2026-05-18-agentic-installation-methodology/SPEC.md
@@ -502,10 +502,18 @@ Exit procedure:
 
 ## 11. Validation Plan
 
-- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
-  each is independently feasible if chosen. (Updated from
-  5.1-5.4 per codex remediation §7.A which added §5.5
-  paper-style + §5.6 SPEC-bundle-only as REJECTED.)
+- Check 1: §5 enumerates 6 candidate shapes (5.1-5.6),
+  of which 5 are substantively distinct (5.1, 5.2/5.6,
+  5.3, 5.4, 5.5) and 1 is an explicit-rename pointer
+  (5.6 is by design "Identical reasoning to 5.2; named
+  explicitly to be foreclosed in §9"). Each substantively
+  distinct shape is independently feasible if chosen. <!-- lint-ok: no-citation -->
+  The 5.6-as-alias structure is deliberate per codex
+  remediation §7.A (added 2026-05-19) to give the §9
+  Forecloses list an explicit named entry for the
+  shape-without-longread variant; codex Round-3 noted
+  the original "real and distinct" wording overclaimed
+  on 5.6 distinctness and the wording is corrected here.
 - Check 2: Candidate 5.1 (the chosen option) is feasible —
   Product A v1.1 already shipped at
   `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
@@ -552,30 +560,60 @@ are scoped to those SPECs' own gates.
 
 ## 14. Completion Report
 
-### 14.1 Files changed
+### 14.0 Amendment log (post-verification edits)
+
+This Completion Report was filled at original verification
+2026-05-18. Subsequent codex cross-family remediation
+rounds amended §4-§12 of this Decision; the historical
+evidence values in §14.1-§14.2 reflect the original-
+verification state, NOT current state. Per codex Round-3
+ADVISORY finding, this Amendment Log section is added to
+disclose the gap honestly.
+
+| Round | Date | Commits | Net effect on §14.1-§14.2 evidence |
+|---|---|---|---|
+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
+| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
+
+Current-state evidence values supersede §14.1-§14.2:
+- citation hits: 64 (per current `lint-spec.sh` invocation)
+- candidates × fields: 6 candidates × 5 fields each
+- trade-off matrix: 7 criteria × 6 candidates = 42 cells
+
+### 14.1 Files changed (historical; original verification)
 
 - `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   (new; status: ready-for-spec; 20 citation hits, 0 lint
   errors).
 - `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
-  (new; this artefact; 47 citation hits, 0 lint errors).
+  (new; this artefact; 47 citation hits, 0 lint errors —
+  pre-amendment value; current state 64 per §14.0
+  Amendment Log).
 - `specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   (modified; status: research → dispositioned; §11.5 owner
   dispositions table appended).
 
-### 14.2 Commands run
+### 14.2 Commands run (historical; original verification)
 
 - `cmd://bash agents/scripts/lint-spec.sh
   specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   → exit 0 (0 errors, 0 warnings, 20 citation hits).
 - `cmd://bash agents/scripts/lint-spec.sh
   specs/2026-05-18-agentic-installation-methodology/SPEC.md`
-  → exit 0 (0 errors, 0 warnings, 47 citation hits).
+  → exit 0 (0 errors, 0 warnings, 47 citation hits at
+  original verification; 64 current per §14.0).
 - `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
   family proxy; recorded as `severity: advisory`) →
   recommendation `approve-pending-owner`; structural pass
-  (15/15 sections, 4 candidates × 5 fields, 6×4 trade-off
-  matrix, RFC 2119 confined to §7).
+  at original verification (15/15 sections, 4 candidates ×
+  5 fields, 6×4 trade-off matrix, RFC 2119 confined to
+  §7). Current-state structure is 15/15 sections, 6
+  candidates × 5 fields, 7×6 trade-off matrix per §14.0
+  Amendment Log; cross-family Quality Gate evidence in
+  the codex review record at
+  `file://../../../agentic-installation-methodology/reviews/codex-2026-05-19/`
+  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
 
 ### 14.3 Verification result
 

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round5/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 1570ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/SPEC.md
artefact / type:       spec / decision
sections (top-level):  15
citation-prefix hits:  65
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

codex
Lint confirms the actual current SPEC citation count is 65 with zero errors and warnings. The remaining question is internal consistency: §14.0 now reports 65, but §14.1 and §14.2 still point to “64 current per §14.0,” so I’m checking the R4 wording and acceptance commands before I call the gate.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "Quality Gate Result|PARTIAL|partial|citation-count|citation count|64 vs 65|65|64|new findings|remaining|RESOLVED|ADVISORY" /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
27:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
41:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
56:commit 71728cf6ecc78dc65eabd9f5f04253ba9a38a546
62:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
70:    - ADVISORY: §14 Completion Report had pre-amendment evidence
86:    Lint clean post-edit (65 citation hits).
92:index 8d12881..f35da8b 100644
130:+ADVISORY finding, this Amendment Log section is added to
135:+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
140:+- citation hits: 64 (per current `lint-spec.sh` invocation)
152:+  pre-amendment value; current state 64 per §14.0
168:+  original verification; 64 current per §14.0).
354:  agents do — partial reads per facet. Product A repack +
449:  the methodology the way agents do — partial reads
647:  tightened per codex Round-2 finding 1.4 PARTIAL: the
768:ADVISORY finding, this Amendment Log section is added to
773:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
778:- citation hits: 64 (per current `lint-spec.sh` invocation)
789:  pre-amendment value; current state 64 per §14.0
803:  original verification; 64 current per §14.0).
907: succeeded in 2965ms:
912:citation-prefix hits:  65
930:session id: 019e4286-d270-7e00-994d-d654f9100b60
933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
935:I’ll do this as a read-only review: first refresh the relevant fleet-policy memory and repo state, then compare the Round-2 findings against the current SPEC and commit `2496545`.
947:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
1007:   417	- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
1183:Wave 3 (remaining validation-run punch list IDEAs, landed):
1483:   164	- Description: Pure dogfooding; no longread. The methodology
1484:   165	  paper IS the manifest+catalog. Readers consume it the way
1485:   166	  agents do — partial reads per facet. Product A repack +
1575:   256	  the methodology the way agents do — partial reads
1582:/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '500,640p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
1648:   564	
1649:   565	This Completion Report was filled at original verification
1654:   570	ADVISORY finding, this Amendment Log section is added to
1659:   575	| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
1664:   580	- citation hits: 64 (per current `lint-spec.sh` invocation)
1675:   591	  pre-amendment value; current state 64 per §14.0
1689:   605	  original verification; 64 current per §14.0).
1724:   640	- **Scope sprawl**: the §7 Decision Statement enumerates five
1727:Round 3’s logged finding matches the user’s summary: the old §11 wording claimed all six candidates were distinct even though 5.6 is an explicit alias of 5.2. I’ve also noticed the §14 update now depends on the exact lint citation count, so I’m waiting on the local lint result before calling that advisory resolved.
1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
1733:837:2496545 (HEAD -> main, origin/main, origin/HEAD) spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
1734:846:    spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
1735:851:    1.2 PARTIAL -> RESOLVED:
1736:862:    1.4 PARTIAL -> RESOLVED:
1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
1761:1961:  4023	1.1: RESOLVED.  
1762:1964:  4026	1.2: PARTIALLY RESOLVED.  
1763:1967:  4029	1.3: RESOLVED.  
1764:1970:  4032	1.4: PARTIALLY RESOLVED.  
1767:1979:  4041	ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
1768:1986:  4048	**Quality Gate Result**
1769:1992:  4054	1.1: RESOLVED.  
1770:1995:  4057	1.2: PARTIALLY RESOLVED.  
1771:1998:  4060	1.3: RESOLVED.  
1772:2001:  4063	1.4: PARTIALLY RESOLVED.  
1775:2010:  4072	ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
1799:2844:1.2 PARTIAL: RESOLVED.  
1800:2847:1.4 PARTIAL: RESOLVED.  
1801:2850:§7 stale “eight catalogued in §6” reference: RESOLVED.  
1802:2853:§11/§12 stale candidate/matrix counts: RESOLVED for the stale-count defect.  
1805:2860:ADVISORY: §14 Completion Report still records stale evidence: `47 citation hits`, `4 candidates × 5 fields`, and `6×4 trade-off matrix`. Current lint reports 64 citation hits, and the current matrix is 6 candidates × 7 criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:560) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:574).
1806:2862:**Quality Gate Result**
1807:2864:FAIL, review gate only. The four Round-2 follow-ups are remediated, and both declared lint commands pass with 0 errors / 0 warnings. But the new §11 distinctness overclaim is a material validation-plan defect. No mutations were made; working tree remained clean.
1808:2871:1.2 PARTIAL: RESOLVED.  
1809:2874:1.4 PARTIAL: RESOLVED.  
1810:2877:§7 stale “eight catalogued in §6” reference: RESOLVED.  
1811:2880:§11/§12 stale candidate/matrix counts: RESOLVED for the stale-count defect.  
1814:2887:ADVISORY: §14 Completion Report still records stale evidence: `47 citation hits`, `4 candidates × 5 fields`, and `6×4 trade-off matrix`. Current lint reports 64 citation hits, and the current matrix is 6 candidates × 7 criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:560) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:574).
1815:2889:**Quality Gate Result**
1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
1847:417:- rollout_summaries/2026-05-05T14-56-40-A0X0-ai_engineering_tactical_skill_adoption_and_assets_propagatio.md (cwd=/var/home/hasnobeef/buildepicshit/bes-fleet-policy, rollout_path=/home/hasnobeef/.codex/sessions/2026/05/05/rollout-2026-05-05T07-56-40-019df8a4-265c-7a40-8f10-b156678ed87a.jsonl, updated_at=2026-05-05T17:04:39+00:00, thread_id=019df8a4-265c-7a40-8f10-b156678ed87a, decision + skill implementation + Assets sync)
1861:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
1876:commit 71728cf6ecc78dc65eabd9f5f04253ba9a38a546
1882:    spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
1890:    - ADVISORY: §14 Completion Report had pre-amendment evidence
1906:    Lint clean post-edit (65 citation hits).
1912:index 8d12881..f35da8b 100644
1950:+ADVISORY finding, this Amendment Log section is added to
1955:+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
1960:+- citation hits: 64 (per current `lint-spec.sh` invocation)
1972:+  pre-amendment value; current state 64 per §14.0
1988:+  original verification; 64 current per §14.0).
2109:   564	  dispositions table appended).
2110:   565	
2168:The declared SPEC lint completed clean, but it reports 65 citation-prefix hits. That conflicts with the new §14.0/§14.1/§14.2 text, which still says current state is 64, so the stale-evidence advisory is improved but not fully closed.
2170:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "citation hits|64|65|4 candidates|6×4|6 candidates|7×6|42 cells|real and distinct|substantively distinct|Identical reasoning" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
2178:575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2180:580:- citation hits: 64 (per current `lint-spec.sh` invocation)
2185:591:  pre-amendment value; current state 64 per §14.0
2188:605:  original verification; 64 current per §14.0).
2212:   256	  the methodology the way agents do — partial reads
2220:   264	  (`judgment://agent-synthesis`.)
2221:   265	- Cost: Medium-low — one artefact shape.
2263:71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
2264:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
2267:97e65e6 spec(verify): Product B Decision SPEC -> verified; Completion Report filled
2269:85b6577 spec: 2026-05-18 agentic-installation-methodology IDEA + Decision SPEC
2279:/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline 2496545 -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
2281:2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
2283: 1 file changed, 64 insertions(+), 29 deletions(-)
2288:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
2294:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:135:+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2295:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2299:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:765:rounds amended §4-§12 of this Decision; the historical
2300:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:773:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2301:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2315:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
2318:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1651:   567	rounds amended §4-§12 of this Decision; the historical
2319:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1659:   575	| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2320:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2323:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1727:Round 3’s logged finding matches the user’s summary: the old §11 wording claimed all six candidates were distinct even though 5.6 is an explicit alias of 5.2. I’ve also noticed the §14 update now depends on the exact lint citation count, so I’m waiting on the local lint result before calling that advisory resolved.
2324:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
2325:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
2326:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
2332:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
2338:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1955:+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2339:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2342:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2178:575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2343:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2344:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
2352:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
2353:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1656:   374	Phase 1-2 facet inventory rather than the other way around).
2355:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1924:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1365:unsigned at the v1.0 release with the signature block
2380:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1949:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4064:SPEC-bundle-only is now named, but §9’s umbrella says “shape-without-SPEC-bundle” while including SPEC-bundle-only, and it forecloses “paper-style only” even though §5.5 says paper-style could carry the same SPEC bundle with academic channel as primary. That leaves an academic-primary + SPEC-bundle path ambiguously unclosed. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:425).
2390:specs/2026-05-18-agentic-installation-methodology/SPEC.md:575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
2391:specs/2026-05-18-agentic-installation-methodology/SPEC.md:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
2394:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
2402:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2546:   364	Phase 1-2 facet inventory rather than the other way around).
2828:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
2830:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
2834:No new major or blocking issues found. The only remaining issue is the narrowed §14 citation-count mismatch above.
2836:**Quality Gate Result**
2838:PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.
2845:- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
2847:- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).
2851:No new major or blocking issues found. The only remaining issue is the narrowed §14 citation-count mismatch above.
2853:**Quality Gate Result**
2855:PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'tail -n 160 /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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


codex
**Per-Finding Verdict**

- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).

- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).

**New Findings**

No new major or blocking issues found. The only remaining issue is the narrowed §14 citation-count mismatch above.

**Quality Gate Result**

PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.


tokens used
106,390
**Per-Finding Verdict**

- MAJOR §11 5.6-distinctness overclaim: RESOLVED. §11 now says there are 6 enumerated candidates, 5 substantive shapes, and treats `5.6` as an explicit alias/pointer for `5.2`. That matches §5.6’s own “Identical reasoning to 5.2” text. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).

- ADVISORY §14 stale evidence values: PARTIALLY RESOLVED. §14 now correctly labels the original `47 citation hits`, `4 candidates x 5 fields`, and `6x4` matrix as historical, and records the current candidate/matrix shape. But the new current-state lint count is still stale: §14 says `64`, while the current lint run reports `65` citation-prefix hits. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:579).

**New Findings**

No new major or blocking issues found. The only remaining issue is the narrowed §14 citation-count mismatch above.

**Quality Gate Result**

PASS WITH ADVISORY, not clean. Declared lint gates pass: IDEA `0 errors / 0 warnings / 20 citation hits`; SPEC `0 errors / 0 warnings / 65 citation hits`. Worktree remained clean. The Round 4 remediation still needs the §14 `64` values updated to `65` before both Round 3 findings can be called fully resolved.



exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 140ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/IDEA.md
artefact / type:       idea / decision
sections (top-level):  8
citation-prefix hits:  20
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "current state 64|64 current|citation hits: 64|Lint citation count: 64|current state 65|65 current|citation hits: 65|Lint citation count: 65" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 65. |
580:- citation hits: 65 (per current `lint-spec.sh` invocation)
591:  pre-amendment value; current state 64 per §14.0
605:  original verification; 64 current per §14.0).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '568,608p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
   591	  pre-amendment value; current state 64 per §14.0
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
   605	  original verification; 64 current per §14.0).
   606	- `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
   607	  family proxy; recorded as `severity: advisory`) →
   608	  recommendation `approve-pending-owner`; structural pass

codex
**Quality Gate Result: PASS WITH ADVISORY, not clean.**

R4 advisory is **partially closed**, not fully closed. Commit `595d167` fixed the primary §14.0 values: current lint count now says `65`, and local lint agrees: SPEC lint passes with `0 errors / 0 warnings / 65 citation-prefix hits`.

Remaining advisory: §14.1 and §14.2 still contradict §14.0 by saying current state is `64`:
- [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:591)
- [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:605)

No new major or blocking issues found. Verified no mutations: worktree clean; `git diff --check` clean. Acceptance lint also passes for IDEA: `0 errors / 0 warnings / 20 citation-prefix hits`.


tokens used
90,930
**Quality Gate Result: PASS WITH ADVISORY, not clean.**

R4 advisory is **partially closed**, not fully closed. Commit `595d167` fixed the primary §14.0 values: current lint count now says `65`, and local lint agrees: SPEC lint passes with `0 errors / 0 warnings / 65 citation-prefix hits`.

Remaining advisory: §14.1 and §14.2 still contradict §14.0 by saying current state is `64`:
- [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:591)
- [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:605)

No new major or blocking issues found. Verified no mutations: worktree clean; `git diff --check` clean. Acceptance lint also passes for IDEA: `0 errors / 0 warnings / 20 citation-prefix hits`.


