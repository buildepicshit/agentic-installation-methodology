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
| Failure-mode + open-question publication surface — does the format land failure modes + open questions as first-class content (renamed from "Honest disclosure" per codex remediation finding 1.3) | `owner://transcript-2026-05-18`; research §2.3, §7 | high |
| Executable conformance + signed-distribution surface — does the chosen shape carry an executable conformance suite + signed-distribution manifest (added per codex remediation finding 1.2) | `file://specs/2026-05-17-agentic-installation-methodology/RESEARCH.md` §5.1; `owner://transcript-2026-05-18` | high |
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '220,520p' specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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

The SPEC bundle SHALL include, as **first-class structural
facets** (not optional extras requiring follow-on
amendment), an executable conformance suite and a
signed-distribution manifest surface per research §5.1
(added 2026-05-19 per codex remediation finding 1.2;
refined per codex Round-2 finding to disambiguate
"first-class" structural status from signed-execution
readiness). Implementations MAY ship the conformance
suite as a runnable bundle separate from the prose
facets. The signed-distribution surface — meaning the
manifest schema's signature field + the conformance
suite's signed-execution capability — IS first-class at
v1.0 in the sense that the manifest schema MUST include
the signature field, the conformance suite MUST be
runnable, and the SPEC bundle MUST be packagable as a
signed artefact. The actual cryptographic signing of any
specific release MAY land unsigned at the v1.0 release
(Sigstore tooling wiring is a v1.x slice); the manifest's
`signature.status: unsigned` is the explicit honest
disclosure of this state.

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
the eight catalogued in the §7 Decision Statement above
(architecture, deployment, behavior, customization,
decisions, quality, operations, non-goals) and the two
first-class structural facets added per codex remediation
finding 1.2 (conformance, signed-distribution) when the
case-study work surfaces them, provided the additions are
catalogued in the front-door manifest and named explicitly
in a follow-on Decision SPEC amendment. (Note: §6 is the
trade-off comparison matrix, NOT a facet catalogue; the
authoritative facet list lives here in §7. Fixed per
codex Round-2 stale-reference finding.)

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

- Shipping Product B as any shape that omits either the
  longread OR the SPEC bundle. The chosen Candidate 5.1 is
  longread + SPEC bundle PAIRED; every other shape in §5 is
  REJECTED per its §5.N rationale. Specifically rejected:
  - blog-only (5.3): no SPEC bundle.
  - multi-part series only (5.4): no SPEC bundle.
  - paper-style only (5.5): no longread; even if 5.5 could
    compose with a SPEC bundle (academic-channel-primary +
    bundle-attached), the longread omission means this
    composite shape is also foreclosed.
  - SPEC-bundle-only (5.2 / 5.6): no longread.
  (Reversible only by superseding this Decision. Wording
  tightened per codex Round-2 finding 1.4 PARTIAL: the
  previous "shape-without-SPEC-bundle" umbrella was
  consistent for 5.3 / 5.4 / 5.5-only / 5.2 / 5.6 but did
  not foreclose the academic-primary + SPEC-bundle composite
  variant of 5.5; this rewrite forecloses on the longread
  omission, which catches every rejected shape including
  the composite.)
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

- Check 1: §5 enumerates 6 candidate shapes (5.1-5.6),
  of which 5 are substantively distinct (5.1, 5.2/5.6,
  5.3, 5.4, 5.5) and 1 is an explicit-rename pointer
  (5.6 is by design "Identical reasoning to 5.2; named
  explicitly to be foreclosed in §9"). Each substantively
  distinct shape is independently feasible if chosen. <!-- lint-ok: no-citation -->
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '520,760p' specs/2026-05-18-agentic-installation-methodology/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |

Current-state evidence values supersede §14.1-§14.2:
- citation hits: 64 (per current `lint-spec.sh` invocation)
- candidates × fields: 6 candidates × 5 fields each
- trade-off matrix: 7 criteria × 6 candidates = 42 cells

### 14.1 Files changed (historical; original verification)

- `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
  (new; status: ready-for-spec; 20 citation hits, 0 lint
  errors).
- `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  (new; this artefact; 47 citation hits, 0 lint errors —
  pre-amendment value; current state 64 per §14.0
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
  original verification; 64 current per §14.0).
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
/home/linuxbrew/.linuxbrew/bin/bash -c "find .. -path '*agentic-installation-methodology/reviews/*' -maxdepth 6 -type f | sort" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19/00-SYNTHESIS.md
../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19/04-longread.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find .. -path '*agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md' -type f -print" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 2965ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/SPEC.md
artefact / type:       spec / decision
sections (top-level):  15
citation-prefix hits:  65
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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
session id: 019e4286-d270-7e00-994d-d654f9100b60
--------
user
Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
codex
I’ll do this as a read-only review: first refresh the relevant fleet-policy memory and repo state, then compare the Round-2 findings against the current SPEC and commit `2496545`.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|fleet-policy" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
107:- Symptom: preflight warns that top-level files like `GAME_SEED.md`, `IDEAS_LIBRARY.md`, `.githooks`, and `LICENSE` are unmanaged. Cause: workspace-layout policy drift. Fix: treat it as a fleet-policy/layout issue, not a product-code bug [Task 1]
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
442:- Related skill: skills/fleet-policy-source-first-update/SKILL.md [Task 1][Task 2][Task 3]
446:- Symptom: `node .agents/scripts/preflight.mjs` fails in `bes-fleet-policy`. Cause: the promoted policy repo layout uses `agents/`, not `.agents/`. Fix: treat this repo as a special layout and use `node agents/scripts/preflight.mjs` [Task 1]

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short && git rev-parse --show-toplevel && git branch --show-current' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/bes-fleet-policy
main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files | rg '("'^|/)AGENTS.md$|''^STATUS.md$|''^agents/OPERATING_MODEL.md$|''^agents/MODEL_ROUTING.md$|agentic-installation-methodology|reviews/codex-2026-05-19-round2|specs/2026-05-18-agentic-installation-methodology/SPEC.md'"'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
STATUS.md
AGENTS.md
agents/OPERATING_MODEL.md
specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md
agents/MODEL_ROUTING.md
specs/2026-05-18-agentic-installation-methodology/SPEC.md
specs/2026-05-18-agentic-installation-methodology/IDEA.md
specs/2026-05-17-agentic-installation-methodology/RESEARCH.md
agents/scripts/audit-entry-docs-fixtures/edge-leading-whitespace-import/AGENTS.md
agents/scripts/audit-entry-docs-fixtures/bad-claude-md-no-import/AGENTS.md
agents/scripts/audit-entry-docs-fixtures/good-internal/AGENTS.md

codex
The repo is clean on `main`. I found the policy-memory entry for this repo; now I’m reading the current authority docs plus the target SPEC and review artifacts so the verdicts are based on the live file, not the older summary.
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '220,520p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '130,260p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '500,640p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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
   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
   577	| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
   578	
   579	Current-state evidence values supersede §14.1-§14.2:
   580	- citation hits: 64 (per current `lint-spec.sh` invocation)
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

codex
Round 3’s logged finding matches the user’s summary: the old §11 wording claimed all six candidates were distinct even though 5.6 is an explicit alias of 5.2. I’ve also noticed the §14 update now depends on the exact lint citation count, so I’m waiting on the local lint result before calling that advisory resolved.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
749:**BLOCKING** for Contract/Task SPECs with ≥ 2 slices in §11
837:2496545 (HEAD -> main, origin/main, origin/HEAD) spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
846:    spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
851:    1.2 PARTIAL -> RESOLVED:
862:    1.4 PARTIAL -> RESOLVED:
875:    §11 + §12 stale candidate counts -> FIXED:
876:    - §11 Check 1: "Candidates 5.1-5.4" -> "5.1-5.6".
917:245:### 5.6 SPEC-bundle-only (no longread) [REJECTED]
961:505:- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
1063:-  longread (5.2 / 5.6; added at this amendment).
1075:+  - SPEC-bundle-only (5.2 / 5.6): no longread.
1079:+  consistent for 5.3 / 5.4 / 5.5-only / 5.2 / 5.6 but did
1093:+- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
1096:+  paper-style + §5.6 SPEC-bundle-only as REJECTED.)
1255:   245	### 5.6 SPEC-bundle-only (no longread) [REJECTED]
1282:   272	| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
1734:   452	  - SPEC-bundle-only (5.2 / 5.6): no longread.
1738:   456	  consistent for 5.3 / 5.4 / 5.5-only / 5.2 / 5.6 but did
1791:   505	- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
1794:   508	  paper-style + §5.6 SPEC-bundle-only as REJECTED.)
1827:   541	- [x] AC-6: Completion Report §14 records when and how the
1849:   563	  (modified; status: research → dispositioned; §11.5 owner
1887:   601	  Capture as spec-evidence candidate (§14.5).
1920:specs/2026-05-18-agentic-installation-methodology/SPEC.md:505:- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
1961:  4023	1.1: RESOLVED.  
1964:  4026	1.2: PARTIALLY RESOLVED.  
1967:  4029	1.3: RESOLVED.  
1970:  4032	1.4: PARTIALLY RESOLVED.  
1975:  4037	MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
1977:  4039	MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
1979:  4041	ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
1986:  4048	**Quality Gate Result**
1992:  4054	1.1: RESOLVED.  
1995:  4057	1.2: PARTIALLY RESOLVED.  
1998:  4060	1.3: RESOLVED.  
2001:  4063	1.4: PARTIALLY RESOLVED.  
2006:  4068	MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
2008:  4070	MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
2010:  4072	ADVISORY: The target Decision’s Reversal Plan is §10, not §16. The §16 reference appears in the remediation Contract authority trail, not the target, and should be corrected for audit hygiene. See [remediation SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md:126).
2039:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "§16|§14|§11|§12|§6|§7|§9|§10|Reversal Plan|Validation Plan|Acceptance Criteria|Completion Report|Decision Rationale|Locks|Decision Statement" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
2045:59:  methodology phase structure; §7 BES case-study data; §11.5
2047:96:  §11.5 — owner-dispositions table (per-question binding
2081:541:- [x] AC-6: Completion Report §14 records when and how the
2083:563:  (modified; status: research → dispositioned; §11.5 owner
2087:601:  Capture as spec-evidence candidate (§14.5).
2157:  methodology phase structure; §7 BES case-study data; §11.5
2194:  §11.5 — owner-dispositions table (per-question binding
2246:One collateral issue is emerging in §14: the current §11/§12 counts are fixed, but the Completion Report still records the old review summary with “4 candidates” and “6×4 trade-off matrix.” I’m running the declared lint gates now to separate structural lint status from review-quality status.
2260:   563	  (modified; status: research → dispositioned; §11.5 owner
2298:   601	  Capture as spec-evidence candidate (§14.5).
2433:   484	  — inserted §5.5 (paper-style REJECTED) + §5.6
2579:   175	Patch: insert two new candidates §5.5 and §5.6 with the
2591:   187	- §5.6 SPEC-bundle-only (no longread) — rejected because
2669:187:- §5.6 SPEC-bundle-only (no longread) — rejected because
2677:484:  — inserted §5.5 (paper-style REJECTED) + §5.6
2776:245:### 5.6 SPEC-bundle-only (no longread) [REJECTED]
2778:272:| Criterion | 5.1 Hybrid | 5.2 SPEC-bundle-only | 5.3 Single longread | 5.4 Multi-part | 5.5 Paper-style | 5.6 SPEC-bundle-only [explicit rejection] |
2779:505:- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
2780:508:  paper-style + §5.6 SPEC-bundle-only as REJECTED.)
2806:   245	### 5.6 SPEC-bundle-only (no longread) [REJECTED]
2832:   505	- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
2835:   508	  paper-style + §5.6 SPEC-bundle-only as REJECTED.)
2844:1.2 PARTIAL: RESOLVED.  
2847:1.4 PARTIAL: RESOLVED.  
2850:§7 stale “eight catalogued in §6” reference: RESOLVED.  
2853:§11/§12 stale candidate/matrix counts: RESOLVED for the stale-count defect.  
2854:§11 now says `5.1-5.6`; §12 now says the SPEC compares 6 candidates and has `7 criteria × 6 candidates = 42 cells`. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:528).
2858:MAJOR: §11 now overclaims that Candidates 5.1-5.6 are “real and distinct,” but §5.6 is explicitly an alias/duplicate of §5.2, with “Identical reasoning to 5.2.” That makes Validation Check 1 false as written. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:162), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:245), and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
2860:ADVISORY: §14 Completion Report still records stale evidence: `47 citation hits`, `4 candidates × 5 fields`, and `6×4 trade-off matrix`. Current lint reports 64 citation hits, and the current matrix is 6 candidates × 7 criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:560) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:574).
2862:**Quality Gate Result**
2864:FAIL, review gate only. The four Round-2 follow-ups are remediated, and both declared lint commands pass with 0 errors / 0 warnings. But the new §11 distinctness overclaim is a material validation-plan defect. No mutations were made; working tree remained clean.
2871:1.2 PARTIAL: RESOLVED.  
2874:1.4 PARTIAL: RESOLVED.  
2877:§7 stale “eight catalogued in §6” reference: RESOLVED.  
2880:§11/§12 stale candidate/matrix counts: RESOLVED for the stale-count defect.  
2881:§11 now says `5.1-5.6`; §12 now says the SPEC compares 6 candidates and has `7 criteria × 6 candidates = 42 cells`. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:528).
2885:MAJOR: §11 now overclaims that Candidates 5.1-5.6 are “real and distinct,” but §5.6 is explicitly an alias/duplicate of §5.2, with “Identical reasoning to 5.2.” That makes Validation Check 1 false as written. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:162), [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:245), and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:505).
2887:ADVISORY: §14 Completion Report still records stale evidence: `47 citation hits`, `4 candidates × 5 fields`, and `6×4 trade-off matrix`. Current lint reports 64 citation hits, and the current matrix is 6 candidates × 7 criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:560) and [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:574).
2889:**Quality Gate Result**
2891:FAIL, review gate only. The four Round-2 follow-ups are remediated, and both declared lint commands pass with 0 errors / 0 warnings. But the new §11 distinctness overclaim is a material validation-plan defect. No mutations were made; working tree remained clean.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show 71728cf''^:specs/2026-05-18-agentic-installation-methodology/SPEC.md | nl -ba | sed -n '"'500,620p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
   500	4. Owner approves the superseding Decision; resume execution
   501	   under the new shape.
   502	
   503	## 11. Validation Plan
   504	
   505	- Check 1: Candidates 5.1-5.6 are real and distinct shapes;
   506	  each is independently feasible if chosen. (Updated from
   507	  5.1-5.4 per codex remediation §7.A which added §5.5
   508	  paper-style + §5.6 SPEC-bundle-only as REJECTED.)
   509	- Check 2: Candidate 5.1 (the chosen option) is feasible —
   510	  Product A v1.1 already shipped at
   511	  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
   512	  proves the studio can author + ship public OSS artefacts
   513	  under the v1 procedure; the research workpad's §3, §4, §5
   514	  prove the field-state homework is done; the longread voice
   515	  prove-out is the parent IDEA itself
   516	  (`file://specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   517	  §1, §5).
   518	- Check 3: Locks (§9) and Reversal Plan (§10) are populated
   519	  and coherent; every Lock has a matching reversal path.
   520	- Check 4: All seven owner-blocking questions from the
   521	  research workpad are answered in §7 with citations to
   522	  `owner://transcript-2026-05-18`.
   523	
   524	## 12. Acceptance Criteria
   525	
   526	- [x] AC-1: Decision Statement (§7) names exactly one chosen
   527	      option (Candidate 5.1).
   528	- [x] AC-2: At least 2 candidates compared in §5 with all
   529	      needed fields populated (this SPEC compares 6 post
   530	      codex remediation §7.A which added paper-style and
   531	      SPEC-bundle-only as rejected candidates).
   532	- [x] AC-3: Trade-off matrix (§6) is complete for all
   533	      candidates and criteria (7 criteria × 6 candidates =
   534	      42 cells filled post codex remediation §7.B which
   535	      added "Executable conformance + signed-distribution
   536	      surface" + §7.C which renamed "Honest disclosure" to
   537	      "Failure-mode + open-question publication surface").
   538	- [x] AC-4: Locks (§9) and Reversal Plan (§10) are populated.
   539	- [x] AC-5: Decision Rationale (§8) cites the trade-off
   540	      matrix and owner judgment.
   541	- [x] AC-6: Completion Report §14 records when and how the
   542	      decision was communicated to dependents (the follow-on
   543	      Task / Contract SPECs that descend from this Decision).
   544	- [x] AC-7: `lint-spec.sh` exits 0 against both IDEA.md and
   545	      SPEC.md (front-matter `acceptance_commands`).
   546	
   547	## 13. Open Questions
   548	
   549	None at this Decision layer. Implementation-level questions
   550	that surface during follow-on Task / Contract SPEC authoring
   551	are scoped to those SPECs' own gates.
   552	
   553	## 14. Completion Report
   554	
   555	### 14.1 Files changed
   556	
   557	- `specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   558	  (new; status: ready-for-spec; 20 citation hits, 0 lint
   559	  errors).
   560	- `specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   561	  (new; this artefact; 47 citation hits, 0 lint errors).
   562	- `specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   563	  (modified; status: research → dispositioned; §11.5 owner
   564	  dispositions table appended).
   565	
   566	### 14.2 Commands run
   567	
   568	- `cmd://bash agents/scripts/lint-spec.sh
   569	  specs/2026-05-18-agentic-installation-methodology/IDEA.md`
   570	  → exit 0 (0 errors, 0 warnings, 20 citation hits).
   571	- `cmd://bash agents/scripts/lint-spec.sh
   572	  specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   573	  → exit 0 (0 errors, 0 warnings, 47 citation hits).
   574	- `cmd://spec-review` skill (claude-opus-4-7 reviewer; same-
   575	  family proxy; recorded as `severity: advisory`) →
   576	  recommendation `approve-pending-owner`; structural pass
   577	  (15/15 sections, 4 candidates × 5 fields, 6×4 trade-off
   578	  matrix, RFC 2119 confined to §7).
   579	
   580	### 14.3 Verification result
   581	
   582	PASS. Decision SPEC is well-formed; all seven Acceptance
   583	Criteria checked; lint clean against both artefacts; review
   584	gate passed (with same-family-proxy advisory recorded).
   585	
   586	The Decision cascades by id-citation: follow-on Task / Contract
   587	SPECs that author the slices named in §7 (repo standup,
   588	repack, longread authoring, SPEC-bundle authoring, validation
   589	pass) cite this SPEC's `id`
   590	(`2026-05-18-agentic-installation-methodology`) in their
   591	front-matter `cites_decision:` field and reference the §7
   592	clauses they are implementing.
   593	
   594	### 14.4 Residual risk
   595	
   596	- **Same-family review caveat**: the Decision SPEC was both
   597	  authored and reviewed by Claude-Opus-4.7 lanes. A cross-
   598	  family pass (Codex) is recommended before any follow-on
   599	  Task SPEC reaches `approved` status; the bias risk in the
   600	  candidate-selection step is real and unmitigated by lint.
   601	  Capture as spec-evidence candidate (§14.5).
   602	- **Scope sprawl**: the §7 Decision Statement enumerates five
   603	  slice classes (standup, repack, longread, SPEC-bundle,
   604	  validation) but does not bound elapsed time, word counts
   605	  per facet, or facet-count ceiling. The follow-on Task /
   606	  Contract SPECs are expected to bound those — if any one
   607	  slice exceeds its bound, escalate via a follow-on Decision
   608	  amendment per §9 (the "Implementations may adopt additional
   609	  sub-spec facets" clause).
   610	- **Cross-family validation engagement cost**: §7 makes
   611	  external cross-family pass a publication gate. The engagement
   612	  shape (which external agent family, what dispatch model,
   613	  what acceptance bar) is unspecified in this Decision and
   614	  pushed to a follow-on Task SPEC. The risk: if external
   615	  validation engagement is harder than estimated, the paired-
   616	  release timeline slips. Owner-visible.
   617	
   618	### 14.5 Spec evidence candidates
   619	
   620	- **Decision SPECs cascade by id-citation, not TASK.md

codex
The declared SPEC lint completed clean, but it reports 65 citation-prefix hits. That conflicts with the new §14.0/§14.1/§14.2 text, which still says current state is 64, so the stale-evidence advisory is improved but not fully closed.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "citation hits|64|65|4 candidates|6×4|6 candidates|7×6|42 cells|real and distinct|substantively distinct|Identical reasoning" specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
259:  case-study delivery. Identical reasoning to 5.2; this
506:  of which 5 are substantively distinct (5.1, 5.2/5.6,
508:  (5.6 is by design "Identical reasoning to 5.2; named
515:  the original "real and distinct" wording overclaimed
541:      candidates and criteria (7 criteria × 6 candidates =
542:      42 cells filled post codex remediation §7.B which
575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
580:- citation hits: 64 (per current `lint-spec.sh` invocation)
581:- candidates × fields: 6 candidates × 5 fields each
582:- trade-off matrix: 7 criteria × 6 candidates = 42 cells
587:  (new; status: ready-for-spec; 20 citation hits, 0 lint
590:  (new; this artefact; 47 citation hits, 0 lint errors —
591:  pre-amendment value; current state 64 per §14.0
601:  → exit 0 (0 errors, 0 warnings, 20 citation hits).
604:  → exit 0 (0 errors, 0 warnings, 47 citation hits at
605:  original verification; 64 current per §14.0).
609:  at original verification (15/15 sections, 4 candidates ×
610:  5 fields, 6×4 trade-off matrix, RFC 2119 confined to
612:  candidates × 5 fields, 7×6 trade-off matrix per §14.0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '240,285p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash agents/scripts/lint-spec.sh specs/2026-05-18-agentic-installation-methodology/IDEA.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 284ms:
== lint-spec.sh summary ==
target:                specs/2026-05-18-agentic-installation-methodology/IDEA.md
artefact / type:       idea / decision
sections (top-level):  8
citation-prefix hits:  20
lowercase 2119 hits:   0 (advisory only)
errors:                0
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git log --oneline --decorate --max-count=12 -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
71728cf (HEAD -> main, origin/main, origin/HEAD) spec(amend r3): parent Decision §11 + §14 Round-3 carry-through (codex Round-3 MAJOR + ADVISORY)
2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
dfa6fb6 spec(amend): parent Decision §5/§6/§7/§8/§9 per codex remediation §7.A/§7.B/§7.C (findings 1.1, 1.2, 1.3, 1.4)
2ce1499 spec(fix): scrub RFC 2119 keywords from Completion Report (Decision SPEC §3 rule)
97e65e6 spec(verify): Product B Decision SPEC -> verified; Completion Report filled
487bddf spec(approve): owner flips Product B Decision SPEC -> approved
85b6577 spec: 2026-05-18 agentic-installation-methodology IDEA + Decision SPEC

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline dfa6fb6 -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
dfa6fb6 spec(amend): parent Decision §5/§6/§7/§8/§9 per codex remediation §7.A/§7.B/§7.C (findings 1.1, 1.2, 1.3, 1.4)
 .../SPEC.md                                        | 132 ++++++++++++++++++---
 1 file changed, 114 insertions(+), 18 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline 2496545 -- specs/2026-05-18-agentic-installation-methodology/SPEC.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
2496545 spec(amend r2): parent Decision §4/§6/§7/§9/§11/§12 Round-2 carry-through fixes (codex Round-2 findings 1.2 PARTIAL, 1.4 PARTIAL, §7 stale, §11/§12 stale)
 .../SPEC.md                                        | 93 +++++++++++++++-------
 1 file changed, 64 insertions(+), 29 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "Round 5 amendments|Round [0-9]|round" specs/2026-05-18-agentic-installation-methodology/SPEC.md ../agentic-installation-methodology/reviews/codex-2026-05-19*/01-parent-decision.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:14:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:16:I’ll treat this as a read-only spec review: confirm the Round 3 findings against the current file and the 71728cf remediation, then look for regressions introduced by that change.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:18:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|methodology|Round 4|Round 3" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:46:The worktree is clean on `main` at 71728cf, so I can review the exact remediation state without separating unrelated local changes. Next I’m reading the target spec, the Round 3 decision, and the affected diff hunks.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:73:      post Round 1-3 amendments.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:127:+rounds amended §4-§12 of this Decision; the historical
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:135:+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:136:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:137:+| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:181:+  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:567:Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:765:rounds amended §4-§12 of this Decision; the historical
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:773:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:774:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:775:| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:814:  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:886:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:887:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:888:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:889:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:890:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:891:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:892:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:893:../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:901:/home/linuxbrew/.linuxbrew/bin/bash -c "find .. -path '*agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md' -type f -print" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:903:../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:918:/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:933:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:960:/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files | rg '("'^|/)AGENTS.md$|''^STATUS.md$|''^agents/OPERATING_MODEL.md$|''^agents/MODEL_ROUTING.md$|agentic-installation-methodology|reviews/codex-2026-05-19-round2|specs/2026-05-18-agentic-installation-methodology/SPEC.md'"'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1142:/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '220,520p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1651:   567	rounds amended §4-§12 of this Decision; the historical
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1659:   575	| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1660:   576	| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1661:   577	| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1700:   616	  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1727:Round 3’s logged finding matches the user’s summary: the old §11 wording claimed all six candidates were distinct even though 5.6 is an explicit alias of 5.2. I’ve also noticed the §14 update now depends on the exact lint citation count, so I’m waiting on the local lint result before calling that advisory resolved.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1729:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"MAJOR|ADVISORY|Quality Gate|5\\.6|stale evidence|§14|§11|RESOLVED|New findings|NEW\" ../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1731:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1748:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1757:1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1758:1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1759:1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1760:1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1819:/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1834:Cross-family re-review Round 4 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md. Round 3 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md flagged: MAJOR §11 5.6-distinctness overclaim, ADVISORY §14 stale evidence values. Round 4 remediation at 71728cf. Verify each is RESOLVED + surface any new issues. Output per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1836:I’ll treat this as a read-only spec review: confirm the Round 3 findings against the current file and the 71728cf remediation, then look for regressions introduced by that change.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1838:/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "bes-fleet-policy|agentic-installation|methodology|Round 4|Round 3" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1866:The worktree is clean on `main` at 71728cf, so I can review the exact remediation state without separating unrelated local changes. Next I’m reading the target spec, the Round 3 decision, and the affected diff hunks.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1893:      post Round 1-3 amendments.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1947:+rounds amended §4-§12 of this Decision; the historical
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1955:+| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1956:+| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:1957:+| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2001:+  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2178:575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round4/01-parent-decision.md:2179:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:14:Post-remediation cross-family re-review Round 3 (gpt-5.5). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). Round-2 review at file://../../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md flagged 4 follow-ups: (a) 1.2 PARTIAL — §4 Decision Criteria didn't list new criterion + §7 'first-class at v1.0' vs 'unsigned allowed' tension, (b) 1.4 PARTIAL — §9 umbrella missed academic-primary+SPEC-bundle composite, (c) NEW MAJOR — §7 stale 'eight catalogued in §6' reference (§6 is matrix not catalogue), (d) NEW MAJOR — §11/§12 stale 'Candidates 5.1-5.4 / 6×4 cells'. Round-3 remediation applied at commit 2496545. Verify each Round-2 follow-up is now RESOLVED; surface any new issues the Round-3 amendments introduced. Output: per-finding verdict + new findings + Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:41:/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files | rg '("'^|/)AGENTS.md$|''^STATUS.md$|''^agents/OPERATING_MODEL.md$|''^agents/MODEL_ROUTING.md$|agentic-installation-methodology|reviews/codex-2026-05-19-round2|specs/2026-05-18-agentic-installation-methodology/SPEC.md'"'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1120:/home/linuxbrew/.linuxbrew/bin/bash -c "find .. -path '*agentic-installation-methodology*round2*' -type f -maxdepth 6 | sort" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1122:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1123:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1124:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/02-corpus.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1125:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/03-v2-repack.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1308:/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,260p' ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1323:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1656:   374	Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1909:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"5\\.1-5\\.4|Candidates 5\\.1|compares 4|6 × 4|6x4|six by four|eight catalogued in §6|catalogued in §6|shape-without-SPEC-bundle|first-class at v1\\.0|unsigned at the v1\\.0|MAY land unsigned|signed-execution|academic-channel-primary|academic-primary|composite|longread omission|criteria × candidates|7 criteria|42 cells\" specs/2026-05-18-agentic-installation-methodology/SPEC.md ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1924:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1365:unsigned at the v1.0 release with the signature block
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1925:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1423:the eight catalogued in §6 above when the case-study work
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1926:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1477:- Shipping Product B as any shape-without-SPEC-bundle —
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1927:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1530:- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1928:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1552:      needed fields populated (this SPEC compares 4).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1929:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1554:      candidates and criteria (6 × 4 cells filled).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1930:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2492:   313	unsigned at the v1.0 release with the signature block
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1931:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2553:   371	the eight catalogued in §6 above when the case-study work
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1932:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2607:   425	- Shipping Product B as any shape-without-SPEC-bundle —
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1933:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2660:   478	- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1934:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2682:   500	      needed fields populated (this SPEC compares 4).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1935:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2684:   502	      candidates and criteria (6 × 4 cells filled).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1936:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3162:   192	shape-without-SPEC-bundle" entry consolidating both
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1937:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3459:   313	   289	the eight catalogued in §6 above when the case-study work
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1938:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3539:   192	shape-without-SPEC-bundle" entry consolidating both
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1939:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3882:/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"SPEC-bundle-only|paper-style|eight catalogued|§6 above|signed-distribution|signature|conformance|compares 4|6 × 4|Candidates 5\\.1-5\\.4|§16 Reversal\" specs/2026-05-18-agentic-installation-methodology/SPEC.md /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1940:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3908:specs/2026-05-18-agentic-installation-methodology/SPEC.md:313:unsigned at the v1.0 release with the signature block
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1941:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3910:specs/2026-05-18-agentic-installation-methodology/SPEC.md:371:the eight catalogued in §6 above when the case-study work
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1942:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3916:specs/2026-05-18-agentic-installation-methodology/SPEC.md:478:- Check 1: Candidates 5.1-5.4 are real and distinct shapes;
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1943:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3917:specs/2026-05-18-agentic-installation-methodology/SPEC.md:500:      needed fields populated (this SPEC compares 4).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1944:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3918:specs/2026-05-18-agentic-installation-methodology/SPEC.md:502:      candidates and criteria (6 × 4 cells filled).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1945:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4002:   483	  list to consolidate shape-without-SPEC-bundle entries.
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1946:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4033:SPEC-bundle-only is now named, but §9’s umbrella says “shape-without-SPEC-bundle” while including SPEC-bundle-only, and it forecloses “paper-style only” even though §5.5 says paper-style could carry the same SPEC bundle with academic channel as primary. That leaves an academic-primary + SPEC-bundle path ambiguously unclosed. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:425).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1947:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4037:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1948:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4039:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1949:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4064:SPEC-bundle-only is now named, but §9’s umbrella says “shape-without-SPEC-bundle” while including SPEC-bundle-only, and it forecloses “paper-style only” even though §5.5 says paper-style could carry the same SPEC bundle with academic channel as primary. That leaves an academic-primary + SPEC-bundle path ambiguously unclosed. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:425).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1950:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4068:MAJOR: §7 still says “additional sub-spec facets beyond the eight catalogued in §6 above,” but §6 is the trade-off matrix, not a facet catalog, and the amendment just promoted conformance/signing beyond the original eight. This creates stale authority inside the normative section. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:370).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1951:../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4070:MAJOR: Validation and Acceptance Criteria still describe the pre-amendment candidate/matrix shape: “Candidates 5.1-5.4,” “this SPEC compares 4,” and “6 × 4 cells,” despite the amended §5/§6 now having six candidates and seven criteria. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:478).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1956:/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md | sed -n '4020,4080p'" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1962:  4024	§5.5 now includes paper-style as a rejected candidate with rationale around academic channel fit, latency, format constraints, and audience mismatch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:210).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:1993:  4055	§5.5 now includes paper-style as a rejected candidate with rationale around academic channel fit, latency, format constraints, and audience mismatch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:210).
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:2221:/home/linuxbrew/.linuxbrew/bin/bash -c 'ls -la specs/2026-05-18-agentic-installation-methodology ../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments ../agentic-installation-methodology/reviews/codex-2026-05-19-round2' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
../agentic-installation-methodology/reviews/codex-2026-05-19-round3/01-parent-decision.md:2223:../agentic-installation-methodology/reviews/codex-2026-05-19-round2:
specs/2026-05-18-agentic-installation-methodology/SPEC.md:374:Phase 1-2 facet inventory rather than the other way around).
specs/2026-05-18-agentic-installation-methodology/SPEC.md:567:rounds amended §4-§12 of this Decision; the historical
specs/2026-05-18-agentic-installation-methodology/SPEC.md:575:| Round 5 amendments | 2026-05-19 | `dfa6fb6` | Parent §5 added 5.5 + 5.6; §6 matrix rewritten 7×6; §7 / §9 expanded; lint citation count rose from 47 to 62. |
specs/2026-05-18-agentic-installation-methodology/SPEC.md:576:| Round 3 carry-through | 2026-05-19 | `2496545` | Parent §4 added Executable-conformance criterion; §11/§12 stale counts fixed; §7 facet-catalog reference fixed; §9 longread-omission rewrite. Lint citation count: 64. |
specs/2026-05-18-agentic-installation-methodology/SPEC.md:577:| Round 4 follow-ups | 2026-05-19 | (this commit) | §11 Check 1 5.6 distinctness wording corrected; this Amendment Log added. |
specs/2026-05-18-agentic-installation-methodology/SPEC.md:616:  + `codex-2026-05-19-round2/` + `codex-2026-05-19-round3/`.
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:14:Post-remediation cross-family re-review (gpt-5.5; Round 2 of 2). Target: specs/2026-05-18-agentic-installation-methodology/SPEC.md (Decision SPEC). This is the AMENDED state following codex Round 1 findings 1.1, 1.2, 1.3, 1.4 captured at file://../../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md and addressed by the remediation Contract at file://../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md §7.A, §7.B, §7.C. Specifically verify: (1) finding 1.1 (paper-style candidate added to §5) — does §5.5 actually license the rejection rationale? (2) finding 1.2 (conformance + signing as first-class facets) — does §7 Decision Statement clause + §9 Locks consolidate this correctly? (3) finding 1.3 (honest-disclosure matrix row rename + rescoring) — is the disambiguation effective or just cosmetic? (4) finding 1.4 (SPEC-bundle-only added to §9 forecloses) — is the foreclose list now exhaustive? AND look for NEW issues: did the amendments introduce contradictions with §8 Decision Rationale, §7 RFC 2119 scoping, or §16 Reversal Plan? Output: per-original-finding remediation-verdict (RESOLVED / PARTIALLY RESOLVED / NOT RESOLVED) + any new findings + a final Quality Gate Result. No mutations.
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:746:The repo policy confirms this is a fleet-source review context, and the requested model lane is valid for spec review. Next I’m reading the local spec-review rules plus the target Decision SPEC, prior review note, and remediation Contract so the verdict is grounded in the amended text.
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1416:Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1994:| Prefix | Form | Required surrounding context |
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1997:| `cmd://` | `cmd://<command>` | surrounding prose MUST include the observed result or output excerpt |
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1998:| `url://` | `url://<full-url>` | surrounding prose MUST include fetch-date, OR pair with a `file://` cache reference |
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:1999:| `owner://` | `owner://transcript-<YYYY-MM-DD>` | surrounding prose MUST include the verbatim quote |
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2258:/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2546:   364	Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2760:    54	242:- The correct next move for IKTO is not to ask whether Godot boids are possible; it is to define the product gate around cult-count bands, visibility needs, aggregate pressure/density reads, same-frame gameplay queries, chamber/path constraints, player-facing presentation, and target-hardware performance, then write a small approved spec/task set around those gates [Task 2]
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2795:    89	437:- UsefulIdiots, LEVEL_SET.md, Round 2, The Verb, over-the-shoulder, Arc Raiders, Saros, foundation rebuild, MODEL_ROUTING
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:2990:    20	# SPEC: Codex Remediation Amendments — Round 4-5 Batch
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3452:   306	   282	Phase 1-2 facet inventory rather than the other way around).
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:3880:The remediation did carry the four edits into the amended target, but I’m seeing a couple of carry-through problems around stale anchors and counts. I’m running the lint gate now, then I’ll give a verdict per original finding plus any new blockers/majors.
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4024:§5.5 now includes paper-style as a rejected candidate with rationale around academic channel fit, latency, format constraints, and audience mismatch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:210).
../agentic-installation-methodology/reviews/codex-2026-05-19-round2/01-parent-decision.md:4055:§5.5 now includes paper-style as a rejected candidate with rationale around academic channel fit, latency, format constraints, and audience mismatch. See [SPEC.md](/var/home/hasnobeef/buildepicshit/bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:210).
../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md:54:242:- The correct next move for IKTO is not to ask whether Godot boids are possible; it is to define the product gate around cult-count bands, visibility needs, aggregate pressure/density reads, same-frame gameplay queries, chamber/path constraints, player-facing presentation, and target-hardware performance, then write a small approved spec/task set around those gates [Task 2]
../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md:89:437:- UsefulIdiots, LEVEL_SET.md, Round 2, The Verb, over-the-shoulder, Arc Raiders, Saros, foundation rebuild, MODEL_ROUTING
../agentic-installation-methodology/reviews/codex-2026-05-19/01-parent-decision.md:306:   282	Phase 1-2 facet inventory rather than the other way around).

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
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --exit-code --stat' in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,180p' specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md" in /var/home/hasnobeef/buildepicshit/bes-fleet-policy
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


