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
session id: 019e3e5a-27b8-7a72-a137-905c977e0336
--------
user
Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md (Contract SPEC, status: verified) plus the actual v2.0 reorganization landed at commit 5f59f7b (v2.0.0 tagged). The SPEC governs reorganization of agentic-ops-framework from v1.1 single-tree into v2.0 manifest+catalog packaging. Read the SPEC, spec-bundle/manifest.yaml, the 8 facet primary files (architecture/CONTEXT.md, deployment/install.md, behavior/features/, customization/contract.md, decisions/INDEX.md, quality/requirements.md, operations/failures.md, non-goals/INDEX.md), and the validate-manifest.sh script. Look for: (1) facet-set completeness — what does gpt-5.5 think is missing or wrongly grouped? (2) manifest schema gaps — what fields should exist but don't (e.g. SBOM ref, schema URI, content-hash)? (3) v1.1->v2.0 migration index incompleteness — are there cross-reference paths inside artefacts that still point at old locations? (4) the 'scaffold-grade content reserved for v2.x' framing — is that honest or fig-leaf? (5) validate-manifest.sh false-positives/negatives. Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
codex
I’ll keep this read-only and treat it as a quality-gate review. First I’m going to orient on the declared authority files and the target SPEC, then I’ll inspect the manifest/facets/script and search for migration-path drift.
  → Orient on authority files and target commit state
  • Read SPEC, manifest, facet files, and validator
  • Search for v1.1 path drift and migration gaps
  • Assess validator false positives/negatives
  • Produce structured quality gate findings
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git rev-parse --show-toplevel HEAD && git tag --points-at HEAD && git show -s --format='%H%n%s%n%ci' 5f59f7b" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-ops-framework
5f59f7b9d0b33c82c46a727574a81c645a33e823
v2.0.0
5f59f7b9d0b33c82c46a727574a81c645a33e823
spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled
2026-05-18 20:20:36 -0700

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg --files | sort | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
AGENTS.md
CHANGELOG.md
CLAUDE.md
CODE_OF_CONDUCT.md
CONTRIBUTING.md
LICENSE
OPERATING_MODEL.md
README.md
examples/README.md
examples/contract-webhook-signing/IDEA.md
examples/contract-webhook-signing/SPEC.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md
examples/decision-conventional-commits/IDEA.md
examples/decision-conventional-commits/SPEC.md
examples/fastpath-fix-readme-typo/SPEC.md
examples/task-add-structured-logging/IDEA.md
examples/task-add-structured-logging/SPEC.md
hooks/block-ai-attribution.sh
hooks/block-edit-on-main.sh
hooks/block-git-add-all.sh
hooks/block-push-to-main.sh
hooks/block-verify-bypass.sh
hooks/session-start-context.sh
hooks/verify-reminder.sh
scripts/audit-entry-docs.sh
scripts/audit-fleet-compliance.sh
scripts/fleet-commands.example.txt
scripts/fleet-files.example.txt
scripts/fleet-hook-fixtures.example.txt
scripts/fleet-hooks.example.txt
scripts/fleet-internal-repos.example.txt
scripts/fleet-known-repos.txt
scripts/fleet-local-only-repos.example.txt
scripts/fleet-oss-gitignore.example.txt
scripts/fleet-oss-repos.example.txt
scripts/fleet-skills.example.txt
scripts/fleet-sync.sh
scripts/lint-spec.sh
scripts/preflight-config.example.json
scripts/preflight.mjs
scripts/send-fleet-message.sh
scripts/validate-manifest.sh
scripts/validate-skill-frontmatter.sh
spec-bundle/architecture/CONTEXT.md
spec-bundle/architecture/solution-strategy.md
spec-bundle/behavior/features/hook-blocks-ai-attribution.feature
spec-bundle/behavior/features/lint-citation-grammar.feature
spec-bundle/customization/contract.md
spec-bundle/customization/knobs.schema.json
spec-bundle/decisions/INDEX.md
spec-bundle/deployment/install.md
spec-bundle/deployment/requirements.md
spec-bundle/manifest.yaml
spec-bundle/non-goals/INDEX.md
spec-bundle/operations/failures.md
spec-bundle/operations/observability.md
spec-bundle/operations/safety-invariants.md
spec-bundle/operations/workflow-universal.md
spec-bundle/quality/12-factor-overlay.md
spec-bundle/quality/requirements.md
spec-bundle/schema/SPEC.schema.md
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
specs/2026-05-18-v1.0-release-foundations/SPEC.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
tests/hooks/fixtures/msg-clean.txt
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/run-tests.sh

codex
The repo is clean on `main` at `5f59f7b9…`, and `v2.0.0` points at that commit. I’m reading the spec bundle and lifecycle/schema docs now so the findings are grounded in the repo’s own contract rather than expectations imported from elsewhere.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba OPERATING_MODEL.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Operating Model
     2	
     3	The operating model the framework encodes. This document is the
     4	high-level overview; the schema, templates, lint, and hooks are the
     5	machine-enforced surface.
     6	
     7	## Lifecycle
     8	
     9	Non-trivial agent work follows thirteen phases:
    10	
    11	1. **Preflight** — confirm the repo + workspace state is sane
    12	   (workspace layout, hooks installed, MCP config sane).
    13	2. **Orient** — read the entry docs, status, and any active
    14	   spec; build a citable map of the work surface.
    15	3. **Predict** — name the known-likely failure modes and the
    16	   ambiguous owner intent up front.
    17	4. **Ideate** — produce `IDEA.md` capturing problem, substance,
    18	   constraints, approaches considered, recommendation, and any
    19	   owner-blocking open questions.
    20	5. **Author** — produce `SPEC.md` from a ready-for-spec IDEA,
    21	   selecting the type (task / contract / decision) by the
    22	   implied shape; fastpath is a separate type for trivial
    23	   reversible work.
    24	6. **Review** (BLOCKING) — run the per-type quality gate
    25	   (`lint-spec.sh`) and structured review against bar criteria.
    26	   Outcome: `needs-revision` or `approved-pending-owner`.
    27	7. **Approve** — owner alone sets `approved`. Skills MUST NOT.
    28	8. **Decompose** (BLOCKING for Contract/Task with ≥2 slices) —
    29	   emit per-slice `TASK.md` artefacts. Each TASK.md pins
    30	   `model_route`, `cross_validation_lane` (different family
    31	   REQUIRED), and `verification_lane`. Owner alone flips
    32	   `approved → decomposed`.
    33	9. **Dispatch** — TASK.md artefacts feed your tracker / dispatch
    34	   runtime. The framework doesn't dictate the runtime.
    35	10. **Execute** — bounded implementation from an approved
    36	    (and decomposed) spec.
    37	11. **Cross-validate** (BLOCKING per task) — review on a model
    38	    family different from the implementer. No exceptions.
    39	12. **Verify** — run acceptance commands; fill the Completion
    40	    Report; status moves to `verified`.
    41	13. **Report + close** — owner alone sets `closed` after a
    42	    spec-evidence-governance pass on durable lessons.
    43	
    44	## Agent roles
    45	
    46	Most non-trivial work passes through five roles. One agent MAY
    47	fill more than one role across a session; an agent MUST NOT
    48	fill conflicting roles within a single artefact.
    49	
    50	- **Planner** — writes IDEA / SPEC from project facts and owner
    51	  intent. Bounded by the citation grammar.
    52	- **Spec reviewer** — runs the BLOCKING per-type quality gate.
    53	  Rejects ambiguity, unsafe assumptions, and missing tests.
    54	  Sets `needs-revision` or `approved-pending-owner`; never
    55	  `approved`.
    56	- **Executor** — edits code, configs, and directly-coupled
    57	  tests/docs inside the approved scope. Reports scope drift
    58	  rather than silently absorbing it.
    59	- **Verifier** — runs acceptance commands and inspects diffs.
    60	  Records fresh evidence. Cross-family verifier MUST run on a
    61	  different model family from the executor for behavioral
    62	  verification.
    63	- **Archivist** — promotes durable lessons from completed work
    64	  into spec evidence, backlog proposals, or operating-model
    65	  amendments. Emits candidates; does not set `closed` on parent
    66	  SPECs.
    67	
    68	## Spec types
    69	
    70	| Type | When |
    71	|---|---|
    72	| `task` | Concrete, scoped, verifiable work with a defined endpoint. Default when in doubt and the work is small. |
    73	| `contract` | Stateful, multi-component, protocol-defining work. Lint required. |
    74	| `decision` | Binding choice between named options. RFC 2119 keywords appear only in the Decision Statement section. |
    75	| `fastpath` | Owner-directed trivial reversible work. One file, ≤50 lines, no public-contract impact. Lands at `status: closed` in the same commit as the work. No IDEA, no review gate, no decomposition. |
    76	
    77	Capture-after exception (`status: verified` directly under
    78	explicit decision-authority directive) is documented in the
    79	schema for cases where work shipped before the spec was
    80	authored.
    81	
    82	## Workspace policy
    83	
    84	- Use a separate branch or worktree for parallel write-capable
    85	  agents. Multiple writers MUST NOT edit the same files
    86	  concurrently without a worktree boundary.
    87	- Stage files explicitly. The fleet-baseline hook rejects
    88	  `git add .` and `git add -A`. Bulk staging quietly captures
    89	  unrelated work and is a recurring source of failed reviews.
    90	- Keep generated scratch, machine-local caches, and personal
    91	  credentials out of tracked source. `.mcp.json` is machine-
    92	  local and gitignored; the framework ships with no active
    93	  MCP servers by default.
    94	- Protected branches require an active SPEC declaring
    95	  `branch_policy: main-direct` to allow direct edits and
    96	  pushes. Without that declaration, hooks block both.
    97	- Public OSS repos require extra release hygiene. Do not push
    98	  doc-only agent-control churn to a public surface unless the
    99	  owner approves a low-noise PR plan with explicit CI impact.
   100	
   101	## Citation grammar
   102	
   103	Every factual claim in any artefact carries a prefix:
   104	
   105	| Prefix | Use |
   106	|---|---|
   107	| `file://` | Repository path. The most common cite. |
   108	| `cmd://` | Shell or tool command, with the observed output recorded inline. |
   109	| `url://` | External URL with a fetch date. |
   110	| `decision-authority://<role>:<date>` | A binding directive from a named decision-holder (owner, product lead, tech lead, governance committee, etc.). |
   111	| `owner://` | Shorthand for `decision-authority://owner:<date>` in single-owner studios. |
   112	| `judgment://owner` | Owner-affirmed judgment. Paired with a `decision-authority://` cite. |
   113	| `judgment://agent-synthesis` | Agent inference. MUST be paired with decision-authority affirmation. |
   114	
   115	Agent memory and training data are LEGITIMATE INPUTS to ideation
   116	and authoring reasoning. They are NOT citable evidence in
   117	artefacts. If a claim cannot be backed by one of the prefixes
   118	above, it does not belong in the artefact.
   119	
   120	## Memory boundary
   121	
   122	Long ideation conversations require active agent participation
   123	using full context. In artefacts (IDEA.md, SPEC.md, completion
   124	reports, spec evidence), every fact-bearing claim carries a
   125	cite per the grammar above. The boundary is sharp: the
   126	conversation is the input; the artefact is the evidence.
   127	
   128	Practical implications:
   129	
   130	- Agents draft options, inventories, and questions during
   131	  ideation. Drafts are planning evidence only until the owner
   132	  records the selected direction in an approved spec.
   133	- Durable facts MUST cite their source. Restating training
   134	  knowledge as a spec claim without a cite is a lint failure.
   135	- Memory across sessions is carried by the SESSION_JOURNAL.md
   136	  workpad and the spec corpus, not by agent-private memory
   137	  stores.
   138	
   139	## Owner-only state transitions
   140	
   141	The status state machine has three transitions only the owner
   142	sets:
   143	
   144	- `approved-pending-owner → approved` (after a clean gate)
   145	- `approved → decomposed` (after decomposition emits TASK.md)
   146	- `verified → closed` (after a spec-evidence-governance pass)
   147	
   148	Skills MUST NOT set any of these three. The gate-passing
   149	`spec-review` skill sets `approved-pending-owner` on a clean
   150	result; the `spec-evidence-governance` skill emits candidate
   151	captures but does not flip `closed`.
   152	
   153	## Lightweight ceremony modes
   154	
   155	The 13-phase lifecycle is the default for non-trivial work. Two
   156	lightweight modes coexist:
   157	
   158	**Fastpath SPEC type** applies when ALL of: ≤1 file changed,
   159	≤50 lines, single component, no public-contract or persisted-
   160	state impact, reversible in one commit, explicit owner
   161	directive. Skips IDEA, review, decomposition, cross-validation;
   162	lands at `status: closed` in the same commit as the work. If
   163	ANY threshold fails, escalate to task / contract / decision.
   164	
   165	**Capture-after** on task / contract / decision SPECs is
   166	permitted under explicit decision-authority directive when
   167	(a) the artefacts pass lint and the per-type gate, (b) the SPEC
   168	is filed before the next change to the affected surface, and
   169	(c) the SPEC lands at `status: verified` with the Completion
   170	Report filled. Reference: `schema/SPEC.schema.md` §1.3.
   171	
   172	These modes exist because the 13-phase ceremony is heavier than
   173	necessary for tiny but non-trivial work. They are NOT escape
   174	hatches — thresholds are objective and lint-enforced.
   175	
   176	## Parallel execution policy
   177	
   178	Before substantial research, code review, verification, or
   179	implementation, agents evaluate whether independent parts of
   180	the task can run in parallel.
   181	
   182	Fanout when:
   183	
   184	- Subtasks are independent or file ownership is disjoint.
   185	- Expected wall-clock savings exceed coordination cost.
   186	- Write scope is `none` or `disjoint` (per the TASK.md
   187	  `write_scope` field).
   188	- Each worker has a bounded role, allowed files or read-only
   189	  scope, and a defined output shape.
   190	- One primary agent remains accountable for integration, final
   191	  verification interpretation, and reporting.
   192	
   193	Preferred fanout cases:
   194	
   195	- Research / inventory / static analysis (read-only).
   196	- Independent verification streams (lint + test + build).
   197	- Code review on multiple independent diffs.
   198	- Documentation audits across non-overlapping surfaces.
   199	
   200	Implementation work MAY fan out only when write ownership is
   201	disjoint or isolated by branch / worktree. Multiple write-
   202	capable agents MUST NOT edit the same files concurrently.
   203	
   204	Owner-interactive planning stays serial. Do not run multiple
   205	unresolved owner-conversation tracks in parallel. Trivial local
   206	commands, tightly-coupled single-file edits, urgent blocking
   207	steps, and owner-interactive ideation remain local unless the
   208	owner explicitly requests fanout.
   209	
   210	Record the parallelism decision in the workpad or TASK.md
   211	front-matter (`parallelism_evaluated: true`) before dispatch.
   212	
   213	## Cross-family review
   214	
   215	Decomposed work requires a cross-family review pass between
   216	`in-progress` and `in-review` on every TASK.md. The reviewer
   217	agent runs on a different model family from the implementer.
   218	Findings are recorded in the workpad; the implementer addresses
   219	them or pushes back explicitly per the PR feedback protocol.
   220	
   221	Cross-family review is the most important quality-control
   222	primitive in the operating model. Same-family review is a
   223	permissible *fallback* (with the limitation honestly labelled
   224	in the artefact) only when the execution context cannot
   225	dispatch cross-family. The fallback does not satisfy the
   226	BLOCKING rule; it documents a deferral that owner-led external
   227	dispatch resolves.
   228	
   229	When the execution context can only dispatch one model family
   230	(e.g., a Claude-Code-only session that can't spawn Codex /
   231	Gemini), the agent MUST: (a) perform a same-family verification
   232	with a different lane / subagent type; (b) label the limitation
   233	in the artefact; (c) document the deferral as residual risk;
   234	(d) leave the strict cross-family pass as an owner-triggered
   235	follow-on.
   236	
   237	## Documentation placement
   238	
   239	Three layers of documentation coexist; each has a canonical
   240	home:
   241	
   242	- **Orchestration content** (specs, audits, migration
   243	  proposals): `specs/` or your policy repo's equivalent. These
   244	  are agent-control artefacts.
   245	- **Durable product architecture**: the repo's native docs
   246	  path (`docs/`, `docs/architecture/`, etc.). These are reader-
   247	  facing and outlive any single SPEC.
   248	- **Workpads** (per-repo session continuity + feedback +
   249	  inbound messages): root-level files (`SESSION_JOURNAL.md`,
   250	  `AGENT_FEEDBACK.md`, `AGENT_INBOX.md` if used).
   251	
   252	Public-facing repos treat agent-control content as gitignored.
   253	Fleet content lays into the working tree but never reaches
   254	GitHub at OSS posture.
   255	
   256	Audits start as scratch; they don't move directly into public
   257	docs. Rewrite them for the intended audience after approval.
   258	
   259	## Content and creative authority
   260	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/schema/SPEC.schema.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# SPEC.schema.md — Shared schema for spec-driven framework
     2	
     3	Status: v1.
     4	
     5	This document is the single source of truth for cross-template
     6	conventions used by IDEA.md and the four SPEC.md types
     7	(Task / Contract / Decision / Fastpath). The four SPEC templates
     8	and the IDEA / TASK templates reference this schema instead of
     9	duplicating it.
    10	
    11	## Normative Language
    12	
    13	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    14	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    15	document are to be interpreted as described in RFC 2119 and RFC 8174
    16	when, and only when, they appear in all capitals.
    17	
    18	`Implementation-defined` means the behavior is part of the contract
    19	but this schema does not prescribe a single universal policy. The
    20	implementation MUST document the selected behavior in the affected
    21	artefact.
    22	
    23	## 1. Front-matter schema
    24	
    25	Every IDEA.md and SPEC.md MUST begin with a YAML front-matter block
    26	delimited by `---` on its own line.
    27	
    28	### 1.1 IDEA.md front-matter
    29	
    30	| Field | Type | Required | Allowed values | Notes |
    31	|---|---|---|---|---|
    32	| `id` | string | REQUIRED | kebab-case slug | matches `<topic>` portion of spec_id |
    33	| `spec_id` | string | REQUIRED | `<YYYY-MM-DD>-<id>` | id of the SPEC this IDEA feeds |
    34	| `status` | enum | REQUIRED | `draft` \| `ready-for-spec` \| `owner-blocking` \| `archived` | initial value `draft` |
    35	| `owner` | string | REQUIRED | owner identifier | e.g. `owner-A` |
    36	| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `codex-gpt-5.5`, `claude-opus-4-7-1m`, or any other model:lane label |
    37	| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-01-15` |
    38	| `implies_spec_type` | enum | REQUIRED | `task` \| `contract` \| `decision` | drives template selection in `/author-spec` |
    39	
    40	Example:
    41	
    42	```yaml
    43	---
    44	id: example-procedure-v1
    45	spec_id: 2026-01-15-example-procedure-v1
    46	status: ready-for-spec
    47	owner: owner-A
    48	brainstormed_by: codex-gpt-5.5  # or claude-opus-4-7-1m, etc. — any model:lane label
    49	brainstormed_on: 2026-01-15
    50	implies_spec_type: contract
    51	---
    52	```
    53	
    54	### 1.2 SPEC.md front-matter (shared across all three types)
    55	
    56	| Field | Type | Required | Allowed values | Notes |
    57	|---|---|---|---|---|
    58	| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
    59	| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` | state machine; only owner sets `approved`, `decomposed`, and `closed` |
    60	| `type` | enum | REQUIRED | `task` \| `contract` \| `decision` | determines which template was used |
    61	| `owner` | string | REQUIRED | owner identifier | |
    62	| `repo` | string | REQUIRED | repo name | e.g. `your-policy-repo` |
    63	| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
    64	| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
    65	| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
    66	| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
    67	| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
    68	| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |
    69	
    70	Example (Contract SPEC):
    71	
    72	```yaml
    73	---
    74	id: 2026-01-15-example-procedure-v1
    75	status: approved
    76	type: contract
    77	owner: owner-A
    78	repo: your-policy-repo
    79	branch_policy: main-direct
    80	risk: medium
    81	requires_network: false
    82	requires_secrets: []
    83	ideated_in: specs/2026-01-15-example-procedure-v1/IDEA.md
    84	acceptance_commands:
    85	  - test -f templates/SPEC.task.template.md
    86	  - bash scripts/lint-spec.sh specs/<id>/SPEC.md
    87	---
    88	```
    89	
    90	### 1.3 Status state machine
    91	
    92	```text
    93	                  /idea-capture (gate pass)
    94	IDEA.draft ─────────────────────────────► IDEA.ready-for-spec
    95	   ▲                                              │
    96	   │ owner returns                                │ /author-spec
    97	   └─────────────── IDEA.draft ◄──┐               ▼
    98	                                  │      SPEC.draft
    99	                                  │           │
   100	                                  │           │ /review-spec
   101	                                  │           ▼
   102	                                  │   SPEC.needs-revision ─── revise+rerun ─┐
   103	                                  │           ▲                              │
   104	                                  │           │ owner returns                │
   105	                                  │           │                              │
   106	                                  │   SPEC.approved-pending-owner ◄──────────┘
   107	                                  │           │
   108	                                  │           │ owner sets status: approved
   109	                                  │           ▼
   110	                                  │   SPEC.approved
   111	                                  │           │
   112	                                  │           │ /decompose-approved-spec
   113	                                  │           │ (BLOCKING for Contract/Task with ≥2 slices)
   114	                                  │           │ emits specs/<id>/tasks/T*.md
   115	                                  │           ▼
   116	                                  │   SPEC.<owner sets decomposed>
   117	                                  │           │
   118	                                  │           │ tracker issues created from TASK.md set;
   119	                                  │           │ dispatcher picks them up; execution begins
   120	                                  │           ▼
   121	                                  │   SPEC.in-execution
   122	                                  │           │
   123	                                  │           │ acceptance_commands pass + Completion Report filled
   124	                                  │           ▼
   125	                                  │   SPEC.verified
   126	                                  │           │
   127	                                  │           │ spec evidence captured
   128	                                  │           ▼
   129	                                  │   SPEC.closed
   130	```
   131	
   132	Idempotency: status transitions are monotonic except for the explicit
   133	`needs-revision` and `owner-blocking` reverse edges. `approved`,
   134	`decomposed`, and `closed` MUST NOT revert without owner action.
   135	Owner alone sets `approved`, `decomposed`, and `closed`. The
   136	`spec-review` skill MUST NOT set `approved`. The
   137	`approved-spec-decomposition` skill MUST NOT set `decomposed`. The
   138	`spec-evidence-governance` skill MUST NOT set `closed`. Skills MAY set
   139	`approved-pending-owner` on a clean gate result.
   140	
   141	**Capture-after exception (decision-authority only).** A Contract
   142	or Decision SPEC MAY land directly at `status: verified` in the
   143	same change-set as the work it specifies, when the work was
   144	implemented before the SPEC was authored under explicit
   145	decision-authority directive (`decision-authority://<role>:<date>`
   146	or `owner://transcript-<date>`). The per-type quality gate
   147	(`spec-review`) and citation grammar remain REQUIRED; only the
   148	temporal precedence of SPEC-before-work is waived. Capture-after
   149	is an exception path; routine work follows the normal lifecycle
   150	so the BLOCKING review gate runs before approval.
   151	
   152	### 1.4 TASK.md front-matter
   153	
   154	TASK.md is the per-slice executable artefact emitted by the
   155	`approved-spec-decomposition` skill from an approved SPEC's §11
   156	Execution Plan (Task) or §11 / §14 / §15 (Contract). One TASK.md
   157	== one tracker issue == one isolated workspace run. The parent
   158	SPEC remains the immutable execution authority; TASK.md files
   159	are NOT peer authorities.
   160	
   161	| Field | Type | Required | Allowed values | Notes |
   162	|---|---|---|---|---|
   163	| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
   164	| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
   165	| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | mirrors tracker active states; only owner sets `done` |
   166	| `owner` | string | REQUIRED | agent id or `unassigned` | |
   167	| `model_route` | string | REQUIRED | model slug from your model-routing policy | primary execution lane |
   168	| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
   169	| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
   170	| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
   171	| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
   172	| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
   173	| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `your parallelism-and-routing SPEC` §7.1 |
   174	| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
   175	| `tracker_issue` | string \| null | REQUIRED | tracker identifier (e.g. `PROJ-123`) or `null` | null until decomposition reflected in tracker |
   176	
   177	TASK.md status state machine:
   178	
   179	```text
   180	todo ──► in-progress ──► in-review ──► <owner sets done>
   181	   │                          ▲
   182	   ▼                          │
   183	blocked ──── unblock ─────────┘
   184	```
   185	
   186	Idempotency: `done` is monotonic and owner-set. `blocked` is the
   187	only reverse edge from `in-progress`.
   188	
   189	Cross-validation gate: `in-progress → in-review` requires findings
   190	from `cross_validation_lane` to be addressed (or explicit
   191	justified pushback) per `skills/code-review/SKILL.md` and the
   192	spec-review skill in your harness.
   193	
   194	Integration gate: when ALL TASK.md in a parent SPEC's `tasks/`
   195	directory reach `done`, the parent SPEC MAY flip
   196	`decomposed → in-execution → verified` after running the parent's
   197	full `acceptance_commands`. The parent SPEC's §17 / §19 Completion
   198	Report aggregates per-task evidence.
   199	
   200	## 2. Citation grammar
   201	
   202	Every factual claim in IDEA.md or SPEC.md MUST carry a citation
   203	prefix from the table below. Memory and training are NOT citable
   204	evidence (per OPERATING_MODEL Memory Policy, input-vs-artefact
   205	distinction).
   206	
   207	### 2.1 Allowed prefixes
   208	
   209	| Prefix | Form | Required surrounding context |
   210	|---|---|---|
   211	| `file://` | `file://<repo-relative-or-absolute-path>` | MAY include `#<line>` or `§<section>` suffix; path MUST exist at the cited commit |
   212	| `cmd://` | `cmd://<command>` | surrounding prose MUST include the observed result or output excerpt |
   213	| `url://` | `url://<full-url>` | surrounding prose MUST include fetch-date, OR pair with a `file://` cache reference |
   214	| `decision-authority://<role>:<date>` | `<role>` ∈ {`owner`, `product-lead`, `tech-lead`, `governance-committee`, `<your-role>`} | binding directive; surrounding prose MUST include the verbatim quote or directive record |
   215	| `owner://` | `owner://transcript-<YYYY-MM-DD>` | shorthand for `decision-authority://owner:<date>` in single-owner studios; surrounding prose MUST include verbatim quote |
   216	| `judgment://owner` | literal | binding by ownership not external evidence; MUST be attributable to a decision-authority record |
   217	| `judgment://agent-synthesis` | literal | MUST be paired with decision-authority affirmation captured via `decision-authority://` or `owner://` |
   218	
   219	Repo-relative `file://` paths are RECOMMENDED. Absolute paths are
   220	RECOMMENDED only when the cited file is outside the repo.
   221	
   222	**Precondition.** The citation grammar presumes the studio has a
   223	named decision-authority (single owner, named product lead, or
   224	governance committee) that produces attributable directives.
   225	Multi-stakeholder organizations without a named decision-authority
   226	SHOULD define one before adopting the schema.
   227	
   228	### 2.2 What constitutes a citable claim
   229	
   230	A *citable claim* is any statement of fact, constraint, decision,
   231	behavior, or requirement that an executor or verifier MUST rely on.
   232	Examples: counts, file paths, line numbers, owner directives,
   233	constraints, behavioral requirements, design decisions.
   234	
   235	### 2.3 What does NOT require citation
   236	
   237	The following SHALL NOT be flagged as missing citations:
   238	
   239	- **Section headers and document structure** — `## 1. Problem` is not
   240	  a claim.
   241	- **Editorial framing and transitions** — "The following sections
   242	  specify ...", "We now turn to ...".
   243	- **Restatements within a paragraph of an already-cited claim** —
   244	  one citation at the source statement; subsequent references in the
   245	  same paragraph or list inherit it.
   246	- **Definitions internal to the spec** — when the spec defines a
   247	  term, the definition does not need an external citation.
   248	- **References to other sections of the same document** — "see §7.6"
   249	  is not a claim.
   250	- **Pseudocode and reference algorithms** — line-level pseudocode
   251	  does not require per-line citation; the algorithm as a whole is
   252	  authored synthesis.
   253	- **Domain model field declarations** — once declared in the Domain
   254	  Model section, downstream sections may reference fields without
   255	  citation.
   256	
   257	### 2.4 Examples
   258	
   259	**Positive — citation REQUIRED:**
   260	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '1,340p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
    15	  - bash scripts/lint-spec.sh spec-bundle/manifest.yaml
    16	cites_decision: 2026-05-18-agentic-installation-methodology
    17	---
    18	
    19	# SPEC: Product A v2.0 — Manifest+Catalog Repack (Slice 2)
    20	
    21	Status: Draft v1
    22	Type: Contract
    23	Purpose: govern the v1.1 → v2.0 reorganization of
    24	agentic-ops-framework from a single-tree layout into a
    25	front-door-manifest + per-facet-catalog shape that
    26	exemplifies the methodology Product B publishes. Defines
    27	the v2.0 directory layout, the manifest schema, the
    28	per-facet sub-spec contracts (architecture / deployment /
    29	behavior / customization / decisions / quality /
    30	operations / non-goals), the migration path from v1.1, and
    31	the v2.0 conformance suite. Every methodology primitive
    32	cited here resolves to a primary-source artefact in the
    33	sibling repo's
    34	`research/primary-sources/<slug>.md` corpus.
    35	
    36	## Normative Language
    37	
    38	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    39	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    40	document are to be interpreted as described in RFC 2119 and RFC 8174
    41	when, and only when, they appear in all capitals.
    42	
    43	## 1. Problem Statement
    44	
    45	The parent Decision SPEC at
    46	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
    47	§7 binds the studio to repack the agentic-ops-framework
    48	v1.1 (the worked-case-study product) into the
    49	manifest+catalog shape the methodology advocates, as the
    50	paired-release artefact accompanying Product B v1.0. The
    51	methodology's recommended packaging
    52	(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
    53	§3 transferable building blocks;
    54	`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
    55	§3 manifest+descriptors+layers) is incompatible with
    56	Product A v1.1's current single-tree layout. Without the
    57	repack, Product B's longread would advocate manifest+catalog
    58	while its worked example shipped as a single tree —
    59	violating the rolls-royce dogfooding constraint
    60	(`owner://transcript-2026-05-18`).
    61	
    62	This SPEC defines the v2.0 layout, the front-door manifest
    63	schema, the per-facet sub-spec contracts grounded in the
    64	methodology's primary-source corpus, and the migration
    65	path from v1.1 → v2.0. <!-- lint-ok: no-citation -->
    66	
    67	## 2. Goals and Non-Goals
    68	
    69	Goals:
    70	
    71	- Define the v2.0 directory layout that exemplifies
    72	  manifest+catalog packaging
    73	  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
    74	  §3).
    75	- Author the front-door `spec-bundle/manifest.yaml`
    76	  schema (machine-readable; lists spec_version,
    77	  conformance_profile, pointers to per-facet sub-specs,
    78	  signature placeholder).
    79	- Author per-facet sub-spec contracts for the eight
    80	  facets enumerated in research §5.1 (the methodology's
    81	  packaging recommendation).
    82	- Author a `scripts/validate-manifest.sh` mechanical
    83	  gate that checks the manifest references every named
    84	  sub-spec and every sub-spec is registered in the
    85	  manifest.
    86	- Define a v1.1 → v2.0 migration index: for each v1.1
    87	  top-level entry, which v2.0 facet absorbs it (or which
    88	  v2.0 entry replaces it).
    89	- Preserve every v1.1 capability (lint, hooks, skills,
    90	  CI) — v2.0 reorganizes; it MUST NOT regress
    91	  functionality.
    92	
    93	Non-goals:
    94	
    95	- Renaming the framework (it remains
    96	  `agentic-ops-framework`).
    97	- Removing v1.1's `skills/` content (skills are a
    98	  first-class facet of v2.0, just located under
    99	  `spec-bundle/skills/` per the new layout).
   100	- Adopting OCI-artifact distribution at v2.0 (the
   101	  manifest's signature field is reserved but not
   102	  populated; OCI-distribution lands at v2.x once
   103	  Sigstore signing tooling is wired in).
   104	- Cross-repo refactor of the sibling fleet repos that
   105	  consume Product A's `.agents/` content via
   106	  `fleet-sync.sh` (any consumer-side changes are
   107	  separate Task SPECs in the fleet repos).
   108	- Authoring the methodology longread or per-facet
   109	  sub-spec CONTENT for Product B itself — that is
   110	  slice 3 / 4 of the parent Decision.
   111	
   112	## 3. System Overview
   113	
   114	The v2.0 framework reorganizes around a front-door
   115	manifest plus eight per-facet sub-spec directories:
   116	
   117	```
   118	agentic-ops-framework/
   119	├── LICENSE
   120	├── README.md                          # v2.0 entry + migration note
   121	├── AGENTS.md
   122	├── CLAUDE.md
   123	├── CONTRIBUTING.md
   124	├── CODE_OF_CONDUCT.md
   125	├── CHANGELOG.md                       # v2.0 entry added
   126	├── OPERATING_MODEL.md                 # remains; canonical operating-model
   127	├── spec-bundle/
   128	│   ├── manifest.yaml                  # front-door manifest
   129	│   ├── architecture/
   130	│   ├── deployment/
   131	│   ├── behavior/
   132	│   ├── customization/
   133	│   ├── decisions/
   134	│   ├── quality/
   135	│   ├── operations/
   136	│   ├── non-goals/
   137	│   ├── skills/                        # the framework's own skills (was /skills/)
   138	│   ├── templates/                     # SPEC templates (was /templates/)
   139	│   ├── schema/                        # SPEC.schema.md (was /schema/)
   140	│   └── conformance/                   # executable conformance suite
   141	├── scripts/                           # lint-spec, validate-manifest, etc.
   142	├── hooks/                             # PreToolUse hooks (unchanged in scope)
   143	├── tests/                             # hook tests + future facet tests
   144	├── specs/                             # internal SPECs (framework's own ledger)
   145	├── examples/                          # worked IDEA+SPEC examples (unchanged)
   146	├── workflow/                          # UNIVERSAL.md (unchanged)
   147	├── workpads/                          # workpad templates (unchanged)
   148	└── .github/workflows/                 # CI (updated to validate manifest)
   149	```
   150	
   151	Top-level keeps the OSS-repo conventional set (LICENSE,
   152	README, CONTRIBUTING, etc.) plus existing scripts/, hooks/,
   153	tests/, specs/, examples/. The new `spec-bundle/`
   154	directory is the actual manifest+catalog artefact — what a
   155	consumer fetches if they want only the methodology
   156	artefact, not the framework's git history.
   157	
   158	## 4. Authority Map
   159	
   160	Active authority for this contract:
   161	
   162	- `decision-authority://owner:2026-05-18` — owner
   163	  directive ("Do what is the rolls royce" + "base this
   164	  all in deep research, not make up bullshit"); binds
   165	  the repack as the methodology's worked-example
   166	  dogfood.
   167	- Parent Decision SPEC
   168	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   169	  §7 — names this slice; §9 Locks unlock the repack
   170	  upon Decision approval.
   171	- Sibling Contract SPEC
   172	  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   173	  (status: verified) — the primary-source corpus this
   174	  repack draws methodology primitives from.
   175	- `file://schema/SPEC.schema.md` — citation grammar,
   176	  RFC 2119 scoping, front-matter schema.
   177	
   178	Active primary-source citations (corpus-grounded):
   179	
   180	- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   181	  §3 — operating-model-as-SPEC; 18-section pattern.
   182	- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
   183	  §3 — manifest+descriptors+layers.
   184	- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   185	  §3 — 12-section architecture-documentation template.
   186	- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
   187	  §3 — four-level architecture hierarchy.
   188	- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
   189	  §3 — Nygard ADR template.
   190	- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
   191	  §3 — customization-affordance prior art.
   192	- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
   193	  §3 — reproducibility primitive.
   194	- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
   195	  §3 — behavioural-acceptance primitive.
   196	- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   197	  §3 — operating-system-boundary contract.
   198	- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
   199	  §3 — architecture-as-code DSL.
   200	
   201	Stale, superseded, or evidence-only sources:
   202	
   203	- `file://CHANGELOG.md` v1.0 / v1.1 entries — describe
   204	  the current state being repacked, not the target.
   205	
   206	Owner decisions required before implementation:
   207	
   208	- [ ] Confirm `spec-bundle/` is the right top-level
   209	      directory name (alternatives: `bundle/`, `spec/`,
   210	      `dist/`). Default: `spec-bundle/`.
   211	- [ ] Confirm v2.0 is a breaking change worth advertising
   212	      (vs. continuous-add at v1.x). Default: yes, v2.0;
   213	      the parent Decision binds the dogfooding posture
   214	      that a v1.x cosmetic update cannot satisfy.
   215	
   216	## 5. Code/Docs Reality Check
   217	
   218	Existing v1.1 top-level (verified by
   219	`cmd://ls /var/home/hasnobeef/buildepicshit/agentic-ops-framework/`):
   220	
   221	- `LICENSE`, `README.md`, `AGENTS.md` is absent in v1.1
   222	  but is the canonical entry doc per the methodology
   223	  (note: v1.1 has `OPERATING_MODEL.md` instead; both
   224	  exist in v2.0). <!-- lint-ok: no-citation -->
   225	
   226	Hmm — actually checking
   227	`cmd://ls /var/home/hasnobeef/buildepicshit/agentic-ops-framework/`:
   228	top-level is `CHANGELOG.md`, `CODE_OF_CONDUCT.md`,
   229	`CONTRIBUTING.md`, `docs`, `examples`, `hooks`, `LICENSE`,
   230	`OPERATING_MODEL.md`, `README.md`, `schema`, `scripts`,
   231	`skills`, `specs`, `templates`, `tests`, `workflow`,
   232	`workpads`.
   233	
   234	(`judgment://agent-synthesis` from filesystem listing at
   235	authoring time.)
   236	
   237	There is no `AGENTS.md` in v1.1's top-level. v2.0 adds it
   238	per the methodology's AGENTS-aware tool guidance
   239	(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   240	§3 transferable building block 5 — repo-owned contract
   241	pattern).
   242	
   243	There is no `manifest.yaml` in v1.1. v2.0 introduces it as
   244	the front-door artefact. <!-- lint-ok: no-citation -->
   245	
   246	Skills, templates, schema currently live at top-level
   247	(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
   248	them under `spec-bundle/` so the manifest can address
   249	them as per-facet sub-spec resources. <!-- lint-ok: no-citation -->
   250	
   251	## 6. Domain Model
   252	
   253	### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
   254	
   255	The manifest is the bundle's single source of truth for
   256	what the bundle contains and what conformance profile it
   257	claims. Schema:
   258	
   259	```yaml
   260	# spec-bundle/manifest.yaml
   261	spec_version: "2.0.0"               # semver; this manifest schema version
   262	bundle_version: "2.0.0"             # semver; this specific bundle release
   263	conformance_profile: "core"         # core | extension | real-integration
   264	generated_on: "YYYY-MM-DD"          # ISO date the bundle was assembled
   265	generator: "agentic-ops-framework"   # source repo identifier
   266	
   267	intent:
   268	  product_name: "agentic-ops-framework"
   269	  product_purpose: |
   270	    <one-paragraph statement of what the product is for>
   271	  developer_authority:
   272	    - role: "framework maintainer"
   273	      identity: "HasNoBeef <github:HasNoBeef>"
   274	  installer_authority:
   275	    - role: "user-with-agent"
   276	      capabilities_floor: "any-reasonably-capable-coding-agent"
   277	
   278	facets:
   279	  architecture:
   280	    path: "architecture/"
   281	    primary: "architecture/CONTEXT.md"
   282	  deployment:
   283	    path: "deployment/"
   284	    primary: "deployment/install.md"
   285	  behavior:
   286	    path: "behavior/"
   287	    primary: "behavior/features/"
   288	  customization:
   289	    path: "customization/"
   290	    primary: "customization/contract.md"
   291	  decisions:
   292	    path: "decisions/"
   293	    primary: "decisions/INDEX.md"
   294	  quality:
   295	    path: "quality/"
   296	    primary: "quality/requirements.md"
   297	  operations:
   298	    path: "operations/"
   299	    primary: "operations/failures.md"
   300	  non-goals:
   301	    path: "non-goals/"
   302	    primary: "non-goals/INDEX.md"
   303	
   304	resources:
   305	  schema:
   306	    path: "schema/SPEC.schema.md"
   307	  templates:
   308	    path: "templates/"
   309	  skills:
   310	    path: "skills/"
   311	  conformance:
   312	    path: "conformance/"
   313	
   314	signature:
   315	  status: "unsigned"                # signed | unsigned
   316	  # When signed: cosign signature + Rekor inclusion proof
   317	  # populated per
   318	  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
   319	```
   320	
   321	Manifest validation rules (enforced by
   322	`scripts/validate-manifest.sh`):
   323	
   324	1. `spec_version` matches the schema version this SPEC
   325	   §6.1 defines (currently `2.0.0`).
   326	2. `conformance_profile` is one of {`core`, `extension`,
   327	   `real-integration`}
   328	   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   329	   §3 three-profile model).
   330	3. Every facet listed in `facets:` has a corresponding
   331	   directory under `spec-bundle/<facet>/` containing the
   332	   named `primary` file.
   333	4. Every directory under `spec-bundle/` (except
   334	   `resources/` items) is listed in `facets:`.
   335	5. `intent.product_name` matches the repo name.
   336	
   337	### 6.2 Per-facet sub-spec contracts
   338	
   339	#### 6.2.1 architecture/
   340	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/architecture/CONTEXT.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Architecture — System Context
     2	
     3	Per arc42 §3 Context and Scope
     4	(`file://../../research/primary-sources/arc42.md` §3) and
     5	the C4 model System Context level
     6	(`file://../../research/primary-sources/c4-model.md` §3),
     7	this file states what the framework is, who its users are,
     8	and what surrounding systems it interacts with.
     9	
    10	Note: the canonical research-primary-source corpus lives in
    11	the sibling repo `agentic-installation-methodology` at
    12	`research/primary-sources/`. Cross-repo `file://` paths in
    13	this document resolve relative to that sibling.
    14	
    15	## Product (system) under consideration
    16	
    17	**agentic-ops-framework** — a framework for operating
    18	engineering work with coding agents under spec-first
    19	discipline.
    20	
    21	Concretely, the framework ships:
    22	- A typed SPEC schema with citation grammar, RFC 2119
    23	  scoping, and a status state machine
    24	  (`file://../schema/SPEC.schema.md`).
    25	- Six templates (IDEA + 4 SPEC types + TASK) at
    26	  `file://../templates/`.
    27	- A lint script (`file://../../scripts/lint-spec.sh`) that
    28	  enforces the schema per artefact type.
    29	- A skill catalog (`file://../skills/`) covering the
    30	  spec lifecycle plus multi-repo patterns.
    31	- Seven PreToolUse hooks (`file://../../hooks/`) enforcing
    32	  studio discipline (no AI attribution, no bulk staging,
    33	  no verify-bypass, no push-to-protected-branch).
    34	- A hermetic 33-case hook test harness
    35	  (`file://../../tests/hooks/run-tests.sh`).
    36	- Six worked IDEA+SPEC examples
    37	  (`file://../../examples/`).
    38	- A CI workflow (`file://../../.github/workflows/ci.yml`)
    39	  that runs lint + skill-frontmatter + hook tests +
    40	  manifest validation on every push.
    41	
    42	## Users (per arc42 §3 stakeholder framing)
    43	
    44	| User class | Goal | Authority |
    45	|---|---|---|
    46	| Framework adopter (a studio or team operating coding agents) | Install + customize the framework; author specs in their own repos | Owner-with-agent in their own context |
    47	| Coding agent (Claude, Codex, Gemini, etc.) | Read the framework's discipline; author + execute against it | Bounded by the spec lifecycle + hook discipline |
    48	| Framework maintainer (HasNoBeef) | Steward the framework's evolution; author spec changes | Final authority on framework direction |
    49	
    50	## Surrounding systems
    51	
    52	The framework does NOT include but interacts with:
    53	
    54	- **GitHub** (or any git host) — the framework's own
    55	  release artefacts + adopter repos live there.
    56	- **Issue trackers** (Linear / GitHub Issues / others) —
    57	  the framework's autonomous-issue-dispatch skill assumes
    58	  a tracker exists; the contract is tracker-agnostic.
    59	- **AI coding assistants** (Claude Code, Codex, Gemini CLI,
    60	  Cursor, Aider, etc.) — the framework's AGENTS.md
    61	  contract per `url://agents.md` is consumed by any
    62	  AGENTS-aware tool.
    63	- **Per-language toolchains** (the languages an adopter's
    64	  product is implemented in) — out of scope of the
    65	  framework itself; the framework is operating-model, not
    66	  language-runtime.
    67	
    68	## Boundary (what the framework does NOT cover)
    69	
    70	- The framework does NOT prescribe a programming language.
    71	- The framework does NOT bundle an agent runtime; agents
    72	  are dispatched by the adopter's tooling (Claude Code
    73	  CLI, Codex CLI, Symphony, etc.).
    74	- The framework does NOT enforce a particular tracker;
    75	  see Symphony for that pattern
    76	  (`file://../../research/primary-sources/symphony-spec.md`
    77	  §3).
    78	
    79	See also: `solution-strategy.md` for arc42 §4 Solution
    80	Strategy; `../non-goals/INDEX.md` for the formal facet-level
    81	non-goal enumeration.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '337,760p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   337	### 6.2 Per-facet sub-spec contracts
   338	
   339	#### 6.2.1 architecture/
   340	
   341	Carries:
   342	- `CONTEXT.md` — system-context narrative (arc42 §3
   343	  Context and Scope per
   344	  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   345	  §3).
   346	- One or more `.dsl` files — C4-model architecture
   347	  expressed in Structurizr DSL
   348	  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
   349	  §3) — Container + Component diagrams MAY be present;
   350	  Code-level diagrams MAY be omitted per
   351	  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
   352	  §3 (Code-level "are typically generated rather than
   353	  authored").
   354	- `solution-strategy.md` — arc42 §4 Solution Strategy
   355	  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   356	  §3.
   357	
   358	#### 6.2.2 deployment/
   359	
   360	Carries:
   361	- `install.md` — installation procedure (prose +
   362	  cmd:// citations to required commands).
   363	- `requirements.md` — runtime + tooling requirements
   364	  (12-factor Factor II "Dependencies" framing per
   365	  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   366	  §3).
   367	- `topology.md` — for fleet-deployable products, the
   368	  expected topology + per-environment configuration
   369	  posture.
   370	
   371	#### 6.2.3 behavior/
   372	
   373	Carries:
   374	- `features/*.feature` — Gherkin Given-When-Then
   375	  scenarios per
   376	  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
   377	  §3. Each feature file is simultaneously documentation,
   378	  contract, and executable acceptance test (step
   379	  definitions are the installer's responsibility).
   380	- For products with HTTP APIs: `openapi.yaml` per
   381	  OpenAPI 3.1.0
   382	  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
   383	  §3). For Product A specifically, no HTTP API → no
   384	  openapi.yaml at v2.0.
   385	
   386	#### 6.2.4 customization/
   387	
   388	The novel facet (research §4.1; not natively modelled by
   389	arc42, C4, ADRs, or any single prior art). Carries:
   390	- `contract.md` — the deferral contract: what the
   391	  framework provides by default vs what is deferred to
   392	  the installer, with the constraints for each
   393	  deferred surface.
   394	- `knobs.schema.json` — JSON Schema (Helm-style per
   395	  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
   396	  §3) describing the customization knobs the installer
   397	  may turn.
   398	- `profiles/*.yaml` — named reference profiles
   399	  (research §4.1's "starter profiles" with trade-offs
   400	  documented per profile).
   401	
   402	#### 6.2.5 decisions/
   403	
   404	ADR-style decision records per
   405	`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
   406	§3 Nygard template. Carries:
   407	- `INDEX.md` — list of decisions with id, title,
   408	  status (proposed / accepted / deprecated /
   409	  superseded), date, and one-line summary.
   410	- `<seq>-<slug>.md` — per-decision artefacts (Title /
   411	  Context / Decision / Consequences / Status).
   412	
   413	For Product A specifically, the decisions populating
   414	v2.0 trace back to the framework's existing internal
   415	SPECs (BES-sanitized): spec-authoring-procedure-v1,
   416	ceremony-weight-refactor, decomposition-pattern,
   417	fastpath-introduction.
   418	
   419	#### 6.2.6 quality/
   420	
   421	Quality requirements + conformance gates per arc42 §10
   422	Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   423	§3). Carries:
   424	- `requirements.md` — quality scenarios (performance,
   425	  reliability, security, maintainability, etc.) with
   426	  measurable acceptance criteria.
   427	- `12-factor-overlay.md` — for cloud-native products,
   428	  the per-factor conformance posture
   429	  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   430	  §3).
   431	
   432	#### 6.2.7 operations/
   433	
   434	Carries:
   435	- `failures.md` — failure classes × recovery posture
   436	  per Symphony §14 pattern
   437	  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   438	  §3 transferable building block 10).
   439	- `observability.md` — three-tier observability
   440	  (required logging / recommended snapshot / optional
   441	  HTTP) per Symphony §13 pattern.
   442	- `safety-invariants.md` — MUST-numbered list per
   443	  Symphony §9.5 pattern.
   444	
   445	#### 6.2.8 non-goals/
   446	
   447	The second novel facet (research §4.2). Carries:
   448	- `INDEX.md` — facet-level negative space; for each
   449	  of the other seven facets, a stated non-goal section
   450	  ("the architecture/ facet does NOT cover …",
   451	  "behavior/ does NOT model …", etc.).
   452	
   453	### 6.3 Conformance suite (spec-bundle/conformance/)
   454	
   455	The executable yes/no signal layer. Carries:
   456	- Conformance check scripts that run against an
   457	  installation and exit 0 iff the install conforms to
   458	  the manifest's claimed `conformance_profile`.
   459	- Reference test data + fixtures.
   460	
   461	Conformance profiles (per Symphony §17 model):
   462	- **core**: required for any conforming install.
   463	- **extension**: required only for installs that ship
   464	  optional features.
   465	- **real-integration**: environment-dependent smoke
   466	  checks; recommended before production.
   467	
   468	## 7. Pipeline Specification
   469	
   470	### 7.1 v1.1 → v2.0 migration index
   471	
   472	| v1.1 path | v2.0 destination | Notes |
   473	|---|---|---|
   474	| `LICENSE` | `LICENSE` | unchanged |
   475	| `README.md` | `README.md` | rewritten for v2.0; adds migration note |
   476	| `CONTRIBUTING.md` | `CONTRIBUTING.md` | unchanged |
   477	| `CODE_OF_CONDUCT.md` | `CODE_OF_CONDUCT.md` | unchanged |
   478	| `CHANGELOG.md` | `CHANGELOG.md` | v2.0 entry added |
   479	| `OPERATING_MODEL.md` | `OPERATING_MODEL.md` + `spec-bundle/operations/safety-invariants.md` cross-link | content stays; new sub-spec cross-links |
   480	| (new) `AGENTS.md` | `AGENTS.md` | new at v2.0; ports content from OPERATING_MODEL |
   481	| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
   482	| `templates/` | `spec-bundle/templates/` | relocated |
   483	| `skills/` | `spec-bundle/skills/` | relocated |
   484	| `scripts/` | `scripts/` | top-level (tooling, not bundle content) |
   485	| `hooks/` | `hooks/` | top-level (tooling) |
   486	| `tests/` | `tests/` | top-level (tooling) |
   487	| `specs/` | `specs/` | top-level (framework's own SPEC ledger) |
   488	| `examples/` | `examples/` | top-level (worked IDEA+SPEC examples) |
   489	| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
   490	| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
   491	| `docs/` | absorbed into per-facet sub-spec READMEs | content reorganized; original `docs/` removed |
   492	| (new) `spec-bundle/manifest.yaml` | `spec-bundle/manifest.yaml` | new front-door |
   493	| (new) `spec-bundle/{architecture,deployment,behavior,customization,decisions,quality,operations,non-goals}/` | as named | new facet directories |
   494	| (new) `spec-bundle/conformance/` | as named | new conformance suite |
   495	| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |
   496	
   497	### 7.2 Execution order
   498	
   499	1. Author `spec-bundle/manifest.yaml` per §6.1 schema
   500	   (initial facet directories may be placeholder; the
   501	   manifest first, then population).
   502	2. Author `scripts/validate-manifest.sh` per §6.1
   503	   validation rules; verify it rejects the placeholder
   504	   bundle (test that the gate fires).
   505	3. Move existing artefacts per §7.1 migration index;
   506	   update internal cross-references (lint will catch
   507	   broken file:// paths).
   508	4. Populate the new facet sub-spec contracts per §6.2
   509	   with the minimum-viable content that lets the
   510	   manifest reference resolved files. Initially this is
   511	   placeholder content with cross-references back to
   512	   existing OPERATING_MODEL.md / examples/ / etc.; the
   513	   manifest validates structurally.
   514	5. Populate `spec-bundle/decisions/` with the first
   515	   ADR-style entries (the framework's own decisions
   516	   inventory).
   517	6. Update `scripts/lint-spec.sh` to recognize the new
   518	   manifest as a valid lint target.
   519	7. Update `.github/workflows/ci.yml` to add
   520	   `validate-manifest` as a CI job.
   521	8. Update `README.md` + `AGENTS.md` to point to the new
   522	   `spec-bundle/` as the methodology artefact entry.
   523	9. Add `CHANGELOG.md` v2.0 entry documenting the
   524	   reorganization.
   525	10. Tag `v2.0.0` once `validate-manifest` + lint +
   526	    hook-tests all pass on the repacked tree.
   527	
   528	### 7.3 Migration semantics
   529	
   530	v2.0 is a **breaking** change to top-level layout. Consumers
   531	who fetched v1.1 by file paths under `schema/`,
   532	`templates/`, `skills/`, `workflow/`, `workpads/` will need
   533	to update their paths. The `CHANGELOG.md` v2.0 entry and
   534	the v2.0 README's migration note enumerate the path
   535	changes.
   536	
   537	For the fleet-sync.sh consumers (the eight BES repos
   538	that consume Product A's content via `fleet-files.txt`),
   539	the manifest in `fleet-files.txt` is updated to point at
   540	the new `spec-bundle/<facet>/` paths. This is a separate
   541	Task SPEC in `bes-fleet-policy` once v2.0 lands; it is
   542	explicitly out of scope here.
   543	
   544	## 8. Schema Specification
   545	
   546	### 8.1 Manifest schema (formal)
   547	
   548	The manifest is YAML. Top-level keys (REQUIRED unless
   549	noted):
   550	
   551	| Field | Type | Required | Notes |
   552	|---|---|---|---|
   553	| `spec_version` | string (semver) | yes | This manifest schema's version |
   554	| `bundle_version` | string (semver) | yes | This bundle release |
   555	| `conformance_profile` | enum | yes | `core` \| `extension` \| `real-integration` |
   556	| `generated_on` | string (ISO date) | yes | YYYY-MM-DD |
   557	| `generator` | string | yes | Source repo identifier |
   558	| `intent` | object | yes | See §8.2 |
   559	| `facets` | object | yes | See §8.3 |
   560	| `resources` | object | OPTIONAL | See §8.4 |
   561	| `signature` | object | OPTIONAL | See §8.5 |
   562	
   563	### 8.2 `intent` block
   564	
   565	| Field | Type | Required |
   566	|---|---|---|
   567	| `product_name` | string | yes |
   568	| `product_purpose` | string (multi-line) | yes |
   569	| `developer_authority` | list[role+identity] | yes |
   570	| `installer_authority` | list[role+capabilities_floor] | yes |
   571	
   572	### 8.3 `facets` block
   573	
   574	A map from facet name to facet record. Recognized facet
   575	names: `architecture`, `deployment`, `behavior`,
   576	`customization`, `decisions`, `quality`, `operations`,
   577	`non-goals`. Each facet record:
   578	
   579	| Field | Type | Required |
   580	|---|---|---|
   581	| `path` | string (relative) | yes |
   582	| `primary` | string (relative-to-bundle) | yes — the entry file for the facet |
   583	
   584	Additional facets MAY appear; `validate-manifest.sh`
   585	allows extensions but warns.
   586	
   587	### 8.4 `resources` block
   588	
   589	| Field | Type |
   590	|---|---|
   591	| `schema` | object with `path` |
   592	| `templates` | object with `path` |
   593	| `skills` | object with `path` |
   594	| `conformance` | object with `path` |
   595	
   596	### 8.5 `signature` block
   597	
   598	At v2.0 launch:
   599	- `status: unsigned` is the default.
   600	- Signed fields (`cosign_signature`, `rekor_inclusion`,
   601	  `signing_identity`) are reserved; populate at v2.x
   602	  when Sigstore tooling is wired in.
   603	
   604	## 9. Reference Algorithms
   605	
   606	### 9.1 validate-manifest (pseudocode)
   607	
   608	```
   609	function validate_manifest():
   610	  manifest = parse_yaml("spec-bundle/manifest.yaml")
   611	  errors = []
   612	
   613	  # 1. Schema version match.
   614	  if manifest.spec_version != "2.0.0":
   615	    errors.append("spec_version: expected 2.0.0, got " + manifest.spec_version)
   616	
   617	  # 2. Conformance profile valid.
   618	  if manifest.conformance_profile not in ["core", "extension", "real-integration"]:
   619	    errors.append("conformance_profile invalid")
   620	
   621	  # 3. Required top-level fields.
   622	  for field in ["bundle_version", "generated_on", "generator",
   623	                "intent", "facets"]:
   624	    if field not in manifest:
   625	      errors.append("missing field: " + field)
   626	
   627	  # 4. intent block well-formed.
   628	  for f in ["product_name", "product_purpose",
   629	            "developer_authority", "installer_authority"]:
   630	    if f not in manifest.intent:
   631	      errors.append("intent missing: " + f)
   632	
   633	  # 5. Facets bijection: every listed facet has a directory
   634	  #    with the named primary file; every spec-bundle/
   635	  #    subdir (except resource subdirs) is listed.
   636	  listed_facets = set(manifest.facets.keys())
   637	  fs_subdirs = set(filter(is_dir, ls("spec-bundle/"))) - RESOURCE_DIRS
   638	  if listed_facets != fs_subdirs:
   639	    errors.append("facets mismatch: listed but not on fs " +
   640	                  str(listed_facets - fs_subdirs) +
   641	                  "; on fs but not listed " +
   642	                  str(fs_subdirs - listed_facets))
   643	
   644	  for fname, fdef in manifest.facets.items():
   645	    if not exists("spec-bundle/" + fdef.primary):
   646	      errors.append("facet " + fname + " primary file missing: " + fdef.primary)
   647	
   648	  # 6. Product name matches repo.
   649	  if manifest.intent.product_name != "agentic-ops-framework":
   650	    errors.append("intent.product_name mismatch")
   651	
   652	  if errors:
   653	    print_errors(errors)
   654	    exit 1
   655	  exit 0
   656	```
   657	
   658	## 10. Failure Model
   659	
   660	| Class | Trigger | Recovery |
   661	|---|---|---|
   662	| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
   663	| `facet-fs-mismatch` | Facet listed in manifest has no directory, or directory exists with no manifest entry | Author reconciles; either populate the directory or remove the facet entry |
   664	| `facet-primary-missing` | A facet's `primary` file does not exist | Author creates the file (with placeholder content if needed) and re-runs |
   665	| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
   666	| `conformance-suite-regression` | A previously passing conformance test now fails after the repack | Author fixes the regression OR reverts the touch that caused it (the repack must preserve v1.1 functional capabilities) |
   667	
   668	## 11. Trust Boundary / Security
   669	
   670	- The repack does not introduce new attack surface. The
   671	  manifest is read-only data; `validate-manifest.sh` is
   672	  a read-only check.
   673	- The signature field is reserved unsigned at v2.0.
   674	  Sigstore signing
   675	  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
   676	  §3) lands at v2.x as a follow-on Task SPEC.
   677	- The migration does not delete user-created files; only
   678	  framework-owned artefacts are relocated. Anything
   679	  under user's gitignored paths is untouched.
   680	- No secrets are introduced; no requires_secrets in
   681	  front-matter.
   682	
   683	## 12. Observability
   684	
   685	- `validate-manifest.sh` prints diagnostic lines to
   686	  stderr per failed check; exit 0 iff all checks pass.
   687	- CI job `validate-manifest` runs on every push +
   688	  pull request; CI status is the observability surface
   689	  for bundle health.
   690	- The bundle's `spec_version` field is the
   691	  user-observable schema version; consumers can pin
   692	  against a specific schema version.
   693	
   694	## 13. Test and Validation Matrix
   695	
   696	| AC | Test |
   697	|---|---|
   698	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` exits 0 |
   699	| AC-2 | `cmd://test -f spec-bundle/manifest.yaml` exits 0 |
   700	| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
   701	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
   702	| AC-5 | `cmd://bash tests/hooks/run-tests.sh` reports 33 pass / 0 fail (no regressions from repack) |
   703	| AC-6 | `cmd://bash scripts/lint-spec.sh examples/*/IDEA.md examples/*/SPEC.md` lint clean on every example (no regressions) |
   704	| AC-7 | `cmd://gh -R buildepicshit/agentic-ops-framework run list --limit 1` shows post-repack CI run with conclusion: success |
   705	| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
   706	| AC-9 | `CHANGELOG.md` contains a `## v2.0` entry documenting the reorganization + breaking-changes index |
   707	
   708	## 14. Implementation Checklist (Definition of Done)
   709	
   710	- [ ] DoD-1: `spec-bundle/manifest.yaml` authored
   711	      conforming to §6.1 / §8 schema.
   712	- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
   713	      `cmd://bash scripts/validate-manifest.sh` exits 0
   714	      against the populated bundle.
   715	- [ ] DoD-3: §7.1 migration index executed; every v1.1
   716	      artefact accounted for (moved, removed, or
   717	      retained-at-top-level).
   718	- [ ] DoD-4: Each of the eight facets per §6.2 has a
   719	      `<facet>/<primary>` file (initially MAY be a
   720	      stub with cross-references; v2.x slices populate
   721	      richer content).
   722	- [ ] DoD-5: `AGENTS.md` authored at top level per §3
   723	      and §6.2's repo-owned-contract pattern.
   724	- [ ] DoD-6: `CHANGELOG.md` v2.0 entry added with
   725	      migration index summary.
   726	- [ ] DoD-7: CI workflow updated to include
   727	      `validate-manifest` job; all CI jobs pass on the
   728	      repacked main.
   729	- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
   730	      DoD-1 through DoD-7 are met.
   731	
   732	## 15. Acceptance Criteria
   733	
   734	(See §13 for tests; checkboxes are the post-execution
   735	verification list.)
   736	
   737	- [x] AC-1: SPEC lint clean
   738	- [x] AC-2: manifest exists
   739	- [x] AC-3: validate-manifest exits 0
   740	- [x] AC-4: every facet has primary file
   741	- [x] AC-5: hook tests 33/33 pass (no regression)
   742	- [x] AC-6: example lint clean (no regression)
   743	- [x] AC-7: CI green post-repack
   744	- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
   745	- [x] AC-9: CHANGELOG v2.0 entry present
   746	
   747	## 16. Rollback Plan
   748	
   749	If the repack surfaces a critical regression:
   750	
   751	1. The repack is a single PR (or coordinated commit
   752	   series); revert that PR via `git revert`.
   753	2. v1.1 remains the tagged release; consumers who
   754	   pinned v1.1 are unaffected.
   755	3. Author a follow-on Contract SPEC amending §6 / §7
   756	   to address the regression cause.
   757	
   758	If a partial repack lands and is later abandoned:
   759	
   760	1. The unpopulated facets are left with placeholder

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/manifest.yaml | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	spec_version: "2.0.0"
     2	bundle_version: "2.0.0"
     3	conformance_profile: "core"
     4	generated_on: "2026-05-19"
     5	generator: "agentic-ops-framework"
     6	
     7	intent:
     8	  product_name: "agentic-ops-framework"
     9	  product_purpose: |
    10	    A framework for operating engineering work with coding
    11	    agents under spec-first discipline: typed IDEA → SPEC
    12	    artefacts with citation grammar, RFC 2119 scoping rules,
    13	    a per-type quality gate, owner-only authority transitions,
    14	    and a hermetic hook test harness. The framework eats its
    15	    own dog food and is offered as honest experience from one
    16	    studio's working internal practice.
    17	  developer_authority:
    18	    - role: "framework maintainer"
    19	      identity: "HasNoBeef <github:HasNoBeef>"
    20	  installer_authority:
    21	    - role: "user-with-agent"
    22	      capabilities_floor: "any-reasonably-capable-coding-agent"
    23	
    24	facets:
    25	  architecture:
    26	    path: "architecture/"
    27	    primary: "architecture/CONTEXT.md"
    28	  deployment:
    29	    path: "deployment/"
    30	    primary: "deployment/install.md"
    31	  behavior:
    32	    path: "behavior/"
    33	    primary: "behavior/features/"
    34	  customization:
    35	    path: "customization/"
    36	    primary: "customization/contract.md"
    37	  decisions:
    38	    path: "decisions/"
    39	    primary: "decisions/INDEX.md"
    40	  quality:
    41	    path: "quality/"
    42	    primary: "quality/requirements.md"
    43	  operations:
    44	    path: "operations/"
    45	    primary: "operations/failures.md"
    46	  non-goals:
    47	    path: "non-goals/"
    48	    primary: "non-goals/INDEX.md"
    49	
    50	resources:
    51	  schema:
    52	    path: "schema/SPEC.schema.md"
    53	  templates:
    54	    path: "templates/"
    55	  skills:
    56	    path: "skills/"
    57	  conformance:
    58	    path: "conformance/"
    59	
    60	signature:
    61	  status: "unsigned"

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
    27	EXPECTED_SPEC_VERSION="2.0.0"
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
   140	# Parse primary field per facet — look for two-space-indented "primary:".
   141	current_facet=""
   142	while IFS= read -r line; do
   143	    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
   144	        current_facet="${BASH_REMATCH[1]}"
   145	    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   146	        primary="${BASH_REMATCH[1]}"
   147	        # Strip trailing quote if any.
   148	        primary="${primary%\"}"
   149	        # Primary may be a file or a directory (e.g., behavior/features/).
   150	        if [[ "$primary" == */ ]]; then
   151	            if [ ! -d "$BUNDLE_DIR/$primary" ]; then
   152	                err "facet '$current_facet' primary directory missing: $primary"
   153	            fi
   154	        else
   155	            if [ ! -f "$BUNDLE_DIR/$primary" ]; then
   156	                err "facet '$current_facet' primary file missing: $primary"
   157	            fi
   158	        fi
   159	    elif [[ "$line" =~ ^[a-z_-] ]]; then
   160	        current_facet=""
   161	    fi
   162	done < "$MANIFEST"
   163	
   164	if [ ${#errors[@]} -gt 0 ]; then
   165	    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
   166	    for e in "${errors[@]}"; do
   167	        printf '  - %s\n' "$e" >&2
   168	    done
   169	    exit 1
   170	fi
   171	
   172	printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
   173	    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
   174	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba .github/workflows/ci.yml | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	name: CI
     2	
     3	on:
     4	  push:
     5	    branches: [main]
     6	  pull_request:
     7	    branches: [main]
     8	
     9	jobs:
    10	  lint-spec:
    11	    name: lint worked examples
    12	    runs-on: ubuntu-latest
    13	    steps:
    14	      - uses: actions/checkout@v4
    15	
    16	      - name: Lint Task example IDEA
    17	        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/IDEA.md
    18	
    19	      - name: Lint Task example SPEC
    20	        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/SPEC.md
    21	
    22	      - name: Lint Contract example IDEA
    23	        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/IDEA.md
    24	
    25	      - name: Lint Contract example SPEC
    26	        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/SPEC.md
    27	
    28	      - name: Lint Decision example IDEA
    29	        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/IDEA.md
    30	
    31	      - name: Lint Decision example SPEC
    32	        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/SPEC.md
    33	
    34	      - name: Lint Fastpath example SPEC
    35	        run: bash scripts/lint-spec.sh examples/fastpath-fix-readme-typo/SPEC.md
    36	
    37	  validate-skills:
    38	    name: validate skill frontmatter
    39	    runs-on: ubuntu-latest
    40	    steps:
    41	      - uses: actions/checkout@v4
    42	      - run: bash scripts/validate-skill-frontmatter.sh
    43	
    44	  test-hooks:
    45	    name: hook test harness
    46	    runs-on: ubuntu-latest
    47	    steps:
    48	      - uses: actions/checkout@v4
    49	      - name: Install jq
    50	        run: sudo apt-get install -y jq
    51	      - name: Run hook tests
    52	        run: bash tests/hooks/run-tests.sh
    53	
    54	  validate-manifest:
    55	    name: validate spec-bundle manifest (v2.0)
    56	    runs-on: ubuntu-latest
    57	    steps:
    58	      - uses: actions/checkout@v4
    59	      - name: Validate manifest schema + facet bijection
    60	        run: bash scripts/validate-manifest.sh
    61	
    62	  preflight-self-check:
    63	    name: preflight runs clean on the framework
    64	    runs-on: ubuntu-latest
    65	    steps:
    66	      - uses: actions/checkout@v4
    67	      - name: Verify preflight.mjs parses + runs
    68	        run: node --check scripts/preflight.mjs

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '758,980p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   758	If a partial repack lands and is later abandoned:
   759	
   760	1. The unpopulated facets are left with placeholder
   761	   content (cross-references to OPERATING_MODEL.md /
   762	   existing artefacts). v2.0 ships with `partial`
   763	   conformance_profile noted in the manifest.
   764	2. A follow-on Task SPEC completes the facets.
   765	
   766	## 17. Open Questions
   767	
   768	- [ ] Q1: Should `spec-bundle/skills/` (relocated from
   769	      `skills/`) require any content sanitization
   770	      beyond v1.1's already-clean state? Default: no;
   771	      v1.1 v1.1 skills are already
   772	      generic-fleet-friendly post the v1.1 release.
   773	- [ ] Q2: Should the conformance suite at
   774	      `spec-bundle/conformance/` ship runnable tests at
   775	      v2.0 launch, or be a placeholder for v2.x? Default:
   776	      placeholder at v2.0; the conformance suite is its
   777	      own follow-on Task SPEC.
   778	- [ ] Q3: Cross-family review for THIS Contract SPEC
   779	      and for the repack execution. Per parent
   780	      Decision §7, cross-family review is BLOCKING per
   781	      slice. Same-family proxy is the default fallback;
   782	      external Codex pass is the rigorous path.
   783	      Default: same-family proxy with explicit caveat;
   784	      escalate if owner directs.
   785	- [ ] Q4: Should `fleet-sync.sh` (in `bes-fleet-policy`)
   786	      be updated in lockstep with v2.0 launch, or
   787	      announce-then-update? Default: announce-then-
   788	      update; the fleet repos pin v1.1 paths until a
   789	      separate Task SPEC migrates them.
   790	
   791	None of Q1-Q4 is `owner-blocking`; all can be deferred
   792	to follow-on Task SPECs.
   793	
   794	## 18. Migration / Coexistence
   795	
   796	v2.0 supersedes v1.1's top-level layout. Coexistence
   797	strategy: <!-- lint-ok: no-citation -->
   798	
   799	- v1.1 remains the tagged release; consumers continue
   800	  to fetch v1.1 by tag until they choose to upgrade. <!-- lint-ok: no-citation -->
   801	- v2.0 ships under the same repo URL; the v2.0.0 tag
   802	  marks the breaking-layout boundary. <!-- lint-ok: no-citation -->
   803	- The CHANGELOG.md v2.0 entry contains the migration
   804	  index (§7.1 above) so consumers can find their
   805	  artefacts' new homes. <!-- lint-ok: no-citation -->
   806	- For 30 days after v2.0 release, the repo MAY keep
   807	  symlinks from old paths (`schema/SPEC.schema.md` →
   808	  `spec-bundle/schema/SPEC.schema.md`) to ease
   809	  transition. After 30 days, symlinks are removed. <!-- lint-ok: no-citation -->
   810	
   811	## 19. Completion Report
   812	
   813	### 19.1 Files changed
   814	
   815	60 files changed in commit `1104e3a`
   816	(2016 insertions / 72 deletions):
   817	
   818	**Created** (24 new files):
   819	- `AGENTS.md` (new top-level entry doc)
   820	- `CLAUDE.md` (new Claude Code entry doc; imports AGENTS.md)
   821	- `scripts/validate-manifest.sh` (mechanical completeness
   822	  gate)
   823	- `spec-bundle/manifest.yaml` (front-door manifest)
   824	- `spec-bundle/architecture/CONTEXT.md` +
   825	  `solution-strategy.md`
   826	- `spec-bundle/deployment/install.md` +
   827	  `requirements.md`
   828	- `spec-bundle/behavior/features/lint-citation-grammar.feature`
   829	  + `hook-blocks-ai-attribution.feature`
   830	- `spec-bundle/customization/contract.md` +
   831	  `knobs.schema.json`
   832	- `spec-bundle/decisions/INDEX.md`
   833	- `spec-bundle/quality/requirements.md` +
   834	  `12-factor-overlay.md`
   835	- `spec-bundle/operations/failures.md` +
   836	  `observability.md` + `safety-invariants.md`
   837	- `spec-bundle/non-goals/INDEX.md`
   838	
   839	**Renamed** (33 files via `git mv`; history preserved):
   840	- `schema/SPEC.schema.md` →
   841	  `spec-bundle/schema/SPEC.schema.md`
   842	- `templates/*.template.md` (6 files) →
   843	  `spec-bundle/templates/*.template.md`
   844	- `skills/<name>/SKILL.md` (20 skills) →
   845	  `spec-bundle/skills/<name>/SKILL.md`
   846	- `skills/<name>/references/*.md` (4 references) →
   847	  `spec-bundle/skills/<name>/references/*.md`
   848	- `workflow/UNIVERSAL.md` →
   849	  `spec-bundle/operations/workflow-universal.md`
   850	- `workpads/*.template.md` (3 files) →
   851	  `spec-bundle/templates/workpads/*.template.md`
   852	
   853	**Modified** (4 files):
   854	- `.github/workflows/ci.yml` — adds `validate-manifest`
   855	  job (5 jobs total now)
   856	- `CHANGELOG.md` — v2.0 entry with migration index
   857	- `README.md` — rewritten for v2.0 with v1.x migration
   858	  table
   859	- `scripts/validate-skill-frontmatter.sh` — scans
   860	  `spec-bundle/skills/` (was `skills/`)
   861	
   862	**Removed**:
   863	- `docs/` (was empty)
   864	- `workflow/` (after UNIVERSAL.md moved)
   865	
   866	### 19.2 Commands run
   867	
   868	- `cmd://mkdir -p spec-bundle/{architecture,deployment,
   869	  behavior/features,customization/profiles,decisions,
   870	  quality,operations,non-goals,conformance}`.
   871	- `cmd://git mv schema spec-bundle/schema` +
   872	  `templates spec-bundle/templates` +
   873	  `skills spec-bundle/skills` +
   874	  `workpads spec-bundle/templates/workpads`.
   875	- `cmd://mv workflow/UNIVERSAL.md
   876	  spec-bundle/operations/workflow-universal.md` +
   877	  `git rm -r workflow` + `rmdir docs`.
   878	- `cmd://chmod +x scripts/validate-manifest.sh`.
   879	- `cmd://bash scripts/lint-spec.sh
   880	  specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
   881	  — exit 0 (0 errors, 0 warnings, 50 citation hits).
   882	- `cmd://bash scripts/validate-manifest.sh` — exit 0
   883	  (PASS — manifest schema 2.0.0, conformance core, 8
   884	  facets).
   885	- `cmd://bash scripts/validate-skill-frontmatter.sh` —
   886	  exit 0 (clean; 20 skills under spec-bundle/skills/).
   887	- `cmd://bash tests/hooks/run-tests.sh` — 33 pass /
   888	  0 fail.
   889	- `cmd://node --check scripts/preflight.mjs` — clean.
   890	- Per-example lint: 7 examples × `bash scripts/lint-spec.sh
   891	  examples/*/IDEA.md examples/*/SPEC.md` — all exit 0.
   892	- `cmd://git add` (explicit; no bulk staging) + commit
   893	  + `git push origin main`.
   894	- `cmd://gh -R buildepicshit/agentic-ops-framework run
   895	  list --limit 1` — CI run `26074043565` reports
   896	  `conclusion: success`.
   897	
   898	### 19.3 Verification result
   899	
   900	PASS. All 9 ACs met except AC-8 (v2.0.0 tag) which is
   901	pending immediately after this commit lands. CI is
   902	green on the v2.0 repack commit (`1104e3a`); five jobs
   903	pass (lint-spec, validate-skills, test-hooks,
   904	validate-manifest, preflight-self-check).
   905	
   906	The manifest+catalog packaging successfully exemplifies
   907	the methodology the sibling repo
   908	`agentic-installation-methodology` publishes. The
   909	worked-case-study contract is discharged: Product A's
   910	v2.0 IS the manifest+catalog shape Product B
   911	advocates.
   912	
   913	### 19.4 Residual risk
   914	
   915	- **Scaffold-grade content in several facets**: the
   916	  spec-bundle/conformance/ directory is empty;
   917	  per-decision ADRs at spec-bundle/decisions/ADR-NNN-
   918	  <slug>.md are not yet authored (only INDEX is); the
   919	  Structurizr DSL diagrams at
   920	  spec-bundle/architecture/*.dsl are not yet authored.
   921	  This is explicitly documented in CHANGELOG v2.0 as
   922	  "reserved for v2.x". The bundle is structurally
   923	  complete but content-thin in those facets.
   924	- **Cross-reference rot**: existing internal SPECs
   925	  under specs/ that referenced `file://schema/...`,
   926	  `file://templates/...`, `file://skills/...` paths
   927	  now point at locations that no longer exist. The
   928	  lint script does not validate file:// paths deeply,
   929	  so these are not caught by CI. They are historical
   930	  artefacts; consumers who follow the references will
   931	  hit 404s. Acceptable per the SPEC §10 F-4 failure
   932	  class; a follow-on cross-reference validator script
   933	  could close this gap in v2.x.
   934	- **No symlink shims**: the SPEC §18 mentioned
   935	  optional 30-day symlinks from v1.x paths to v2.0
   936	  paths to ease transition. These were NOT created.
   937	  Rationale: v1.1 tag is unchanged; consumers pin v1.1
   938	  if they don't want to update paths. Adding symlinks
   939	  in main would complicate the layout without
   940	  benefit. If consumer feedback indicates pain, can be
   941	  added in a v2.0.1 patch.
   942	- **Same-family review caveat**: this SPEC was both
   943	  authored and self-reviewed by Claude-Opus-4.7 lanes.
   944	  Cross-family pass (Codex) on the v2.0 repack commit
   945	  is recommended before tagging v2.0.0 final — but
   946	  the rolls-royce / keep-rolling owner directive
   947	  preferred momentum; cross-family pass can land
   948	  before the paired-release with Product B v1.0.
   949	
   950	### 19.5 Spec evidence candidates
   951	
   952	- **Manifest+catalog packaging is practical for OSS
   953	  framework repos**. The v2.0 reorganization preserved
   954	  all functionality (33/33 hook tests; 7/7 example
   955	  lint; CI green) while reorganizing 33 existing files
   956	  + adding 24 new artefacts. The pattern generalises:
   957	  any OSS framework with schema + templates + skills +
   958	  resources can adopt manifest+catalog packaging
   959	  without functional regression. Capture under
   960	  `spec-evidence-governance` skill: "manifest+catalog
   961	  is a low-risk reorganization for established
   962	  frameworks; the cost is migration index + path
   963	  updates in entry docs; the benefit is the front-
   964	  door manifest as a single source of truth for what
   965	  the bundle contains."
   966	- **Scaffold-grade facet content is honest at v2.0**.
   967	  Several facets ship with placeholder / cross-link
   968	  content (per-decision ADRs are INDEX-only; conformance
   969	  suite is empty). Rather than wait for full content,
   970	  v2.0 ships the structural contract NOW with explicit
   971	  CHANGELOG "reserved for v2.x" framing. This
   972	  honest-disclosure posture aligns with the methodology's
   973	  own §8 Posture from the parent Decision SPEC. Capture
   974	  as authoring pattern: "when reorganizing into a new
   975	  packaging shape, ship the structural contract at the
   976	  release boundary and document content gaps as
   977	  `reserved for next.x` rather than blocking on full
   978	  content."
   979	- **git-mv preserves history through reorganization**.
   980	  All 33 renamed files retained git history (the

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '980,1080p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   980	  All 33 renamed files retained git history (the
   981	  `R` status code in `git status`). The commit diff
   982	  shows each rename with `(100%)` similarity, meaning
   983	  GitHub's file-history UI will follow the moves
   984	  correctly. This is non-obvious — naïve copy-and-
   985	  remove would have shown as separate add+remove pairs
   986	  and lost the history. Capture as authoring pattern
   987	  for any future repack: "use `git mv` for every
   988	  reorganization, never `cp + rm`."
   989	- **`validate-manifest.sh` was the right scaffolding
   990	  order**. Authoring the validation script BEFORE the
   991	  manifest + facet primaries meant the script could be
   992	  tested by deliberately failing (7 missing primaries
   993	  detected on first run) before any successful
   994	  validation. The TDD-style approach surfaced one bug
   995	  immediately (bash strict-mode unbound variable on
   996	  empty issues array) that the always-pass-on-success
   997	  flow would have missed. Capture under `tdd` skill
   998	  guidance: "write the gate that detects absence
   999	  before authoring what the gate measures."

codex
The SPEC itself already records residual risks around empty conformance, missing ADRs/DSLs, and cross-reference rot. I’m now checking whether the actual bundle and validator make those risks explicit enough, and whether anything release-blocking slipped past as “structural completion.”
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/deployment/install.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Deployment — Install
     2	
     3	How an adopter installs the framework into their own studio
     4	/ team / fleet. The framework does not require a runtime
     5	service; "install" here means: lay the framework's
     6	artefacts into the adopter's repository tree (or fleet of
     7	repositories) and adopt the lifecycle.
     8	
     9	## Install modes
    10	
    11	### Single-repo adoption
    12	
    13	The simplest case. An adopter copies the relevant pieces
    14	of the framework into their own repo:
    15	
    16	```bash
    17	# 1. Clone the framework.
    18	git clone https://github.com/buildepicshit/agentic-ops-framework.git
    19	cd agentic-ops-framework
    20	
    21	# 2. From the target repo's root, copy the framework's
    22	#    discipline artefacts.
    23	TARGET=/path/to/your/repo
    24	cp -r spec-bundle/schema     "$TARGET/"
    25	cp -r spec-bundle/templates  "$TARGET/"
    26	cp -r spec-bundle/skills     "$TARGET/.agents/skills/"
    27	cp -r hooks                  "$TARGET/"
    28	cp scripts/lint-spec.sh      "$TARGET/scripts/"
    29	cp scripts/validate-skill-frontmatter.sh "$TARGET/scripts/"
    30	
    31	# 3. Author the target repo's AGENTS.md / CLAUDE.md per
    32	#    file://../skills/agents-md-improver/SKILL.md
    33	#    conventions.
    34	```
    35	
    36	The exact paths under the target repo vary by adopter
    37	convention; see the AGENTS.md guidance for the
    38	recommended layout.
    39	
    40	### Fleet adoption (multi-repo)
    41	
    42	For studios operating a fleet of related repos, the
    43	framework's `cross-repo-policy-enforcement` and
    44	`cross-repo-informational-channel` skills
    45	(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
    46	`file://../skills/cross-repo-informational-channel/SKILL.md`)
    47	describe the propagation pattern. A source policy repo
    48	holds the canonical artefacts; child repos sync via a
    49	`fleet-sync.sh`-style script driven by per-fleet manifests.
    50	
    51	The example manifests at
    52	`file://../../scripts/fleet-*.example.txt` show the shape.
    53	
    54	### v0.1 scaffold-only adoption
    55	
    56	For a new repo (no prior history), see the worked example
    57	at the sibling
    58	`url://github.com/buildepicshit/agentic-installation-methodology`
    59	repo's `specs/2026-05-18-repo-standup/SPEC.md` — that
    60	repo's v0.1 scaffold port is the canonical worked
    61	example of fresh-repo adoption.
    62	
    63	## Post-install verification
    64	
    65	After installation, the adopter runs:
    66	
    67	```bash
    68	bash scripts/lint-spec.sh <path-to-your-first-IDEA-or-SPEC>
    69	bash scripts/validate-skill-frontmatter.sh
    70	bash tests/hooks/run-tests.sh
    71	```
    72	
    73	Each MUST exit 0 for the adoption to be considered
    74	correctly seated.
    75	
    76	## Customization knobs
    77	
    78	What an adopter is expected to tailor:
    79	
    80	- The set of skills they adopt (the full catalog of 20
    81	  is opt-in by skill).
    82	- The set of hooks they enable in their `.claude/`
    83	  settings (the seven hooks are opt-in individually).
    84	- The CI workflow's job set (the framework's
    85	  `ci.yml` is a starting point, not a contract).
    86	- The lint exit-2 (advisory) threshold (whether CI
    87	  treats exit 2 as a failure or warning).
    88	
    89	For the full deferral contract see `../customization/contract.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in spec-bundle/behavior/features/*.feature; do nl -ba "$f" | sed -n '"'1,220p'; done" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	Feature: block-ai-attribution.sh rejects co-author trailers
     2	  The framework's posture is that AI tools are inputs to your
     3	  thinking, not credited authors. The hook enforces this at
     4	  commit time.
     5	
     6	  Background:
     7	    Given the hook at hooks/block-ai-attribution.sh is installed
     8	    And the hook intercepts Bash tool calls for `git commit`
     9	
    10	  Scenario: Commit message with Co-Authored-By Claude trailer is blocked
    11	    Given a commit message containing "Co-Authored-By: Claude"
    12	    When the agent attempts `git commit -m "<message>"`
    13	    Then the hook exits non-zero
    14	    And the commit does not land
    15	
    16	  Scenario: Commit message with Co-Authored-By GPT trailer is blocked
    17	    Given a commit message containing "Co-Authored-By: GPT-4"
    18	    When the agent attempts the commit
    19	    Then the hook exits non-zero
    20	
    21	  Scenario: Commit message that mentions Claude in prose is allowed
    22	    Given a commit message body that says "CLAUDE.md updated to ..."
    23	    And the message has no Co-Authored-By trailer
    24	    When the agent attempts the commit
    25	    Then the hook exits zero
    26	    And the commit lands
    27	
    28	  Scenario: Heredoc body that quotes a co-author trailer is allowed
    29	    Given a commit message body that documents a rejected trailer pattern
    30	    And the body wraps "Co-Authored-By:" in a code fence or quote
    31	    When the agent attempts the commit
    32	    Then the hook does not false-positive on the quoted text
     1	Feature: Lint enforces citation grammar on SPEC artefacts
     2	  Per Gherkin conventions
     3	  (file://../../../research/primary-sources/cucumber-gherkin.md §3)
     4	  and the schema's citation grammar at
     5	  file://../../schema/SPEC.schema.md §2.
     6	
     7	  Background:
     8	    Given a repo with the framework's scripts/lint-spec.sh
     9	    And the schema at spec-bundle/schema/SPEC.schema.md
    10	
    11	  Scenario: Fact-bearing paragraph without citation prefix is rejected
    12	    Given a SPEC.md whose §1 Problem section makes a factual claim
    13	    And that claim has no citation prefix in scope
    14	    When the author runs `bash scripts/lint-spec.sh <path>`
    15	    Then the lint exits non-zero
    16	    And stderr contains "fact-bearing paragraph lacks citation prefix"
    17	
    18	  Scenario: Cited paragraph passes
    19	    Given a SPEC.md whose §1 Problem cites a `file://` source
    20	    When the author runs `bash scripts/lint-spec.sh <path>`
    21	    Then the lint reports zero citation errors
    22	
    23	  Scenario: Editorial framing with lint-ok marker is allowed
    24	    Given a SPEC.md paragraph that is editorial cross-reference
    25	    And the paragraph carries `<!-- lint-ok: no-citation -->`
    26	    When the author runs `bash scripts/lint-spec.sh <path>`
    27	    Then the lint reports zero citation errors for that paragraph
    28	
    29	  Scenario: Lowercase RFC 2119 keyword in normative section is advisory
    30	    Given a SPEC.md §7 Decision Statement using lowercase "must"
    31	    When the author runs `bash scripts/lint-spec.sh <path>`
    32	    Then the lint reports a warning (exit code 2)
    33	    And the artefact MAY still pass owner approval after warning review

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/customization/contract.md | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Customization — Deferral Contract
     2	
     3	The novel facet per research §4.1 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
     4	§3 articulates the gap as risk; this contract closes it as
     5	procedure). Following Helm values-schema patterns
     6	(`file://../../research/primary-sources/helm-values-schema.md`
     7	§3) for the JSON Schema validation layer.
     8	
     9	This document states **what the framework provides by
    10	default** and **what is deferred to the adopter (the
    11	installing user-with-agent)**, with constraints on each
    12	deferred surface.
    13	
    14	## Provided by default (developer-owned)
    15	
    16	The framework SHIPS the following as immutable contract:
    17	
    18	- The IDEA / SPEC / TASK template structure
    19	  (`file://../templates/`).
    20	- The schema's citation grammar (`file://`, `cmd://`,
    21	  `url://`, `owner://`, `decision-authority://<role>:<date>`,
    22	  `judgment://owner`, `judgment://agent-synthesis`) and the
    23	  RFC 2119 scoping rules per artefact type
    24	  (`file://../schema/SPEC.schema.md` §2, §3).
    25	- The 13-phase lifecycle states (Preflight → Orient →
    26	  Predict → Ideate → Author → Review → Approve →
    27	  Decompose → Dispatch → Execute → Cross-validate →
    28	  Verify → Report+Close).
    29	- The owner-only authority transitions
    30	  (`approved`, `decomposed`, `closed` flip only by owner).
    31	- The hard rules in the seven PreToolUse hooks (no AI
    32	  attribution, no bulk staging, no verify-bypass, no
    33	  push-to-protected-branch, edit-on-main only with
    34	  branch_policy declared, session-start-context emit,
    35	  verify-reminder on Stop).
    36	
    37	The adopter MUST NOT alter these contracts without
    38	authoring their own superseding Decision SPEC in their
    39	own repo.
    40	
    41	## Deferred to the adopter (installer-owned)
    42	
    43	The following customization knobs are deferred to the
    44	adopter; the framework expects them to be set in the
    45	adopter's context:
    46	
    47	### K-1: Skill catalog scope
    48	
    49	Knob: which of the 20 published skills the adopter
    50	adopts in their repo's `.agents/skills/` (or equivalent).
    51	
    52	Default: adopt the seven lifecycle skills
    53	(`repo-orientation`, `spec-authoring`, `spec-review`,
    54	`fast-path`, `implementation-execution`, `verification`,
    55	`spec-evidence-governance`).
    56	
    57	Constraint: if the adopter adopts ANY skill, they MUST
    58	include `spec-authoring` and `spec-review` (they are the
    59	lifecycle's IDEA → SPEC → review gate; adopting downstream
    60	skills without them violates the lifecycle).
    61	
    62	### K-2: Hook activation set
    63	
    64	Knob: which of the seven hooks the adopter enables in
    65	their `.claude/settings.json` (or equivalent
    66	PreToolUse-hook surface).
    67	
    68	Default: enable all seven hooks; the framework's discipline
    69	assumes all are active.
    70	
    71	Constraint: the four block-* hooks (block-ai-attribution,
    72	block-edit-on-main, block-git-add-all, block-verify-bypass)
    73	are the MINIMUM viable set; disabling any of them is
    74	ALLOWED per local risk acceptance but the adopter inherits
    75	responsibility for the discipline they enforce.
    76	
    77	### K-3: Branch policy declaration
    78	
    79	Knob: per-SPEC `branch_policy` front-matter — values
    80	`worktree-preferred` (default; agents work in worktrees)
    81	or `main-direct` (edits on main allowed during this SPEC's
    82	in-execution/verified/closed phases).
    83	
    84	Default: `worktree-preferred`.
    85	
    86	Constraint: `main-direct` is permissible only for SPECs
    87	that the adopter has approved with the
    88	`block-edit-on-main` + `block-push-to-main` hooks
    89	honouring the policy.
    90	
    91	### K-4: CI job set
    92	
    93	Knob: which CI jobs the adopter runs.
    94	
    95	Default: lint-spec + validate-skill-frontmatter +
    96	hook-test-harness + validate-manifest (the four jobs in
    97	the framework's reference CI workflow).
    98	
    99	Constraint: lint-spec MUST run on every push; the rest
   100	are recommended.
   101	
   102	### K-5: Tracker integration
   103	
   104	Knob: which issue tracker the adopter uses + how their
   105	SPEC slices map to tracker issues.
   106	
   107	Default: no binding (issue tracker integration is
   108	adopter-provided).
   109	
   110	Constraint: per the `autonomous-issue-dispatch` skill
   111	(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
   112	if the adopter uses tracker-driven dispatch, their TASK.md
   113	slices SHOULD map 1:1 to tracker issues.
   114	
   115	### K-6: Verification gate sensitivity
   116	
   117	Knob: whether the adopter treats lint advisory (exit 2)
   118	as a CI failure or warning.
   119	
   120	Default: exit 2 is advisory (CI passes; reviewer notes).
   121	
   122	Constraint: for Contract SPECs the lint MUST exit 0;
   123	exit 2 is permissible only for Task / Decision / Fastpath.
   124	
   125	### K-7: Cross-family review enforcement
   126	
   127	Knob: whether the adopter requires external cross-family
   128	review or accepts same-family proxy.
   129	
   130	Default: external cross-family review RECOMMENDED for
   131	every approved-pending-owner → approved transition;
   132	same-family proxy ACCEPTABLE with explicit caveat.
   133	
   134	Constraint: the framework's own evolution requires
   135	external cross-family for Contract SPECs that touch
   136	the schema or lifecycle.
   137	
   138	## Customization examples
   139	
   140	For named reference profiles, see `profiles/*.yaml` (to
   141	be populated as v2.x slices land). Initial profile
   142	candidates:
   143	
   144	- `solo-developer.yaml` — minimal skill set, all hooks
   145	  enabled, exit 2 = failure (strict).
   146	- `studio-fleet.yaml` — full skill set + cross-repo
   147	  patterns, fleet-sync configured, exit 2 = advisory.
   148	- `open-source-project.yaml` — full skill set, no AI
   149	  attribution strict, public OSS posture gitignore
   150	  patterns adopted.
   151	
   152	## Schema
   153	
   154	The mechanical knob enumeration is in `knobs.schema.json`
   155	(JSON Schema; to be populated). The schema validates an
   156	adopter's `customization.yaml` (or equivalent) against
   157	this contract.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/decisions/INDEX.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Decisions — Index
     2	
     3	ADR-style decision records per Nygard's foundational
     4	template (`file://../../research/primary-sources/adr-nygard.md`
     5	§3): five-section Title / Context / Decision /
     6	Consequences / Status.
     7	
     8	Status lifecycle (Nygard §3): `proposed` → `accepted` →
     9	`deprecated` → `superseded`.
    10	
    11	| ID | Title | Status | Date |
    12	|---|---|---|---|
    13	| ADR-001 | Spec-first discipline (IDEA → SPEC → review → approve) | accepted | 2026-05-01 |
    14	| ADR-002 | Citation grammar with seven prefixes | accepted | 2026-05-01 |
    15	| ADR-003 | Owner-only authority transitions | accepted | 2026-05-01 |
    16	| ADR-004 | RFC 2119 keywords confined to §7 in Decision SPECs | accepted | 2026-05-01 |
    17	| ADR-005 | Capture-after exception for owner-directed urgent fixes | accepted | 2026-05-17 |
    18	| ADR-006 | Fastpath SPEC type for ≤50-line, single-file, reversible work | accepted | 2026-05-13 |
    19	| ADR-007 | Cross-family review BLOCKING per slice | accepted | 2026-05-04 |
    20	| ADR-008 | Manifest+catalog packaging for v2.0 | accepted | 2026-05-19 |
    21	
    22	Per-decision artefacts live at `ADR-NNN-<slug>.md` (to be
    23	populated as v2.x slices land; current v2.0 inventory is
    24	the index only, with the underlying decisions traceable
    25	to the framework's internal SPEC ledger at
    26	`file://../../specs/`).
    27	
    28	## Why this format
    29	
    30	- Nygard's lightweight thesis
    31	  (`file://../../research/primary-sources/adr-nygard.md`
    32	  §3 verbatim "Large documents are never kept up to date.
    33	  Small, modular documents have at least a chance at
    34	  being updated"): each ADR is ≤2 pages.
    35	- The state-of-practice ADR ecosystem catalogue
    36	  (`file://../../research/primary-sources/adr-tools-state.md`
    37	  §3) lists alternatives (MADR, Y-statements) — the
    38	  framework adopts Nygard's template as the minimum
    39	  contract; adopters MAY use MADR's richer fields in
    40	  their own repos.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/quality/requirements.md | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Quality — Requirements
     2	
     3	Per arc42 §10 Quality
     4	(`file://../../research/primary-sources/arc42.md` §3) and
     5	the top quality goals named in
     6	`../architecture/solution-strategy.md`.
     7	
     8	## Quality scenarios
     9	
    10	### Q-1: Citation precision
    11	
    12	**Quality attribute**: completeness + traceability.
    13	
    14	**Scenario**: a reviewer skims any artefact in the
    15	framework or any adopter's artefact authored under the
    16	framework's discipline.
    17	
    18	**Stimulus**: the reviewer asks "where does this claim
    19	come from?"
    20	
    21	**Response**: every factual claim resolves to a citation
    22	prefix (`file://`, `cmd://`, `url://`, `owner://`,
    23	`decision-authority://<role>:<date>`, `judgment://owner`,
    24	or `judgment://agent-synthesis`).
    25	
    26	**Response measure**: `scripts/lint-spec.sh` exits 0 on
    27	the artefact; manual reviewer can follow every citation
    28	to its source.
    29	
    30	### Q-2: Mechanical verifiability
    31	
    32	**Quality attribute**: reproducibility + automation.
    33	
    34	**Scenario**: CI runs on a push.
    35	
    36	**Stimulus**: a contributor opens a PR with new spec
    37	content + skill changes + hook changes.
    38	
    39	**Response**: four CI jobs run automatically (lint-spec,
    40	validate-skill-frontmatter, test-hooks, validate-manifest)
    41	and each reports pass/fail without human judgment.
    42	
    43	**Response measure**: CI exit codes; no manual review
    44	needed for mechanical conformance.
    45	
    46	### Q-3: Hermetic test surface
    47	
    48	**Quality attribute**: reliability + isolation.
    49	
    50	**Scenario**: hook tests run in CI on a fresh
    51	clone.
    52	
    53	**Stimulus**: `bash tests/hooks/run-tests.sh`.
    54	
    55	**Response**: every hook test creates an ephemeral git
    56	sandbox; tests do not depend on the host repo's
    57	branch state, working tree, or HEAD.
    58	
    59	**Response measure**: 33 pass / 0 fail consistently
    60	across local dev machine, CI runner, and forked
    61	contributor environments.
    62	
    63	### Q-4: Honest disclosure
    64	
    65	**Quality attribute**: transparency + integrity.
    66	
    67	**Scenario**: a reader consumes any framework artefact.
    68	
    69	**Stimulus**: they want to know what the framework
    70	does NOT cover, what failed, and what's unresolved.
    71	
    72	**Response**: every artefact's `non-goals/`,
    73	`Completion Report.residual_risk`, and `Open Questions`
    74	sections explicitly enumerate gaps + failures + open
    75	questions.
    76	
    77	**Response measure**: reviewer can recover the
    78	framework's intended scope from artefacts alone, without
    79	needing access to authoring chat history.
    80	
    81	### Q-5: Cross-family review robustness
    82	
    83	**Quality attribute**: defect detection + decision
    84	quality.
    85	
    86	**Scenario**: a Contract SPEC is authored by a
    87	Claude-family agent.
    88	
    89	**Stimulus**: the SPEC enters spec-review.
    90	
    91	**Response**: a different-family reviewer (Codex /
    92	Gemini / etc.) runs the §10.3 Contract gate; same-
    93	family proxy is acceptable with explicit caveat
    94	recorded.
    95	
    96	**Response measure**: same-family-proxy advisories are
    97	visible in the Quality Gate Result; external review
    98	runs at owner discretion.
    99	
   100	### Q-6: No regressions on lifecycle gates
   101	
   102	**Quality attribute**: stability + backward compatibility.
   103	
   104	**Scenario**: a framework change lands (new skill,
   105	schema change, hook change).
   106	
   107	**Stimulus**: CI runs on the change.
   108	
   109	**Response**: existing examples + hook tests + lint
   110	on the inaugural SPEC continue to pass.
   111	
   112	**Response measure**: zero example-lint regressions; 33
   113	hook tests still pass.
   114	
   115	## See also
   116	
   117	- `12-factor-overlay.md` for the operating-system-
   118	  boundary contract per
   119	  `file://../../research/primary-sources/12-factor.md` §3.
   120	- `../operations/safety-invariants.md` for the MUST-
   121	  numbered safety list.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/operations/failures.md | sed -n '1,300p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Operations — Failure Model
     2	
     3	Failure classes × recovery posture per the Symphony §14
     4	pattern
     5	(`file://../../research/primary-sources/symphony-spec.md`
     6	§3 — transferable building block 10).
     7	
     8	## Failure classes
     9	
    10	### F-1: Lint regression
    11	
    12	**Trigger**: a change to a spec / skill / template
    13	causes `scripts/lint-spec.sh` to exit non-zero.
    14	
    15	**Detection**: CI's `lint-spec` job; local `bash
    16	scripts/lint-spec.sh <target>` invocation.
    17	
    18	**Recovery**:
    19	1. Author reads the lint stderr; addresses each
    20	   diagnostic (citation prefix missing, RFC 2119 keyword
    21	   in wrong section, etc.).
    22	2. Re-runs lint locally until exit 0.
    23	3. CI re-runs on push.
    24	
    25	**Operator lever**: none required; mechanical fix.
    26	
    27	### F-2: Hook test failure
    28	
    29	**Trigger**: `bash tests/hooks/run-tests.sh` reports a
    30	fail.
    31	
    32	**Detection**: CI's `test-hooks` job; local invocation.
    33	
    34	**Recovery**:
    35	1. Identify the failing test from harness output.
    36	2. If a hook regressed: fix the hook + add test for the
    37	   regression (TDD per the `tdd` skill).
    38	3. If the test itself was wrong: fix the test fixture
    39	   or the assertion.
    40	
    41	**Operator lever**: none for the framework's own
    42	hooks; an adopter may disable specific hooks per K-2
    43	in `../customization/contract.md`.
    44	
    45	### F-3: Manifest validation failure
    46	
    47	**Trigger**: `bash scripts/validate-manifest.sh` exits
    48	non-zero.
    49	
    50	**Detection**: CI's `validate-manifest` job; local
    51	invocation.
    52	
    53	**Recovery**:
    54	1. Read stderr diagnostics: which facet is missing? which
    55	   primary file is absent?
    56	2. Reconcile manifest vs. filesystem (add missing
    57	   facet directory + primary, or remove orphan
    58	   directory, or update manifest entry).
    59	3. Re-run validate-manifest until PASS.
    60	
    61	**Operator lever**: schema version drift requires a
    62	Contract SPEC amendment to §6.1 of the repack SPEC.
    63	
    64	### F-4: Cross-reference rot
    65	
    66	**Trigger**: an artefact's `file://X` reference points
    67	at a path that no longer exists (after a refactor).
    68	
    69	**Detection**: lint-spec.sh does not validate file paths
    70	deeply; manual review or a separate cross-reference
    71	checker (out of scope for v2.0).
    72	
    73	**Recovery**:
    74	1. Update the reference to the new path.
    75	2. Consider authoring a Task SPEC for a cross-reference-
    76	   validator script as a v2.x slice.
    77	
    78	**Operator lever**: none.
    79	
    80	### F-5: CI workflow regression
    81	
    82	**Trigger**: a change to `.github/workflows/ci.yml`
    83	breaks CI.
    84	
    85	**Detection**: CI fails on the first push after the
    86	workflow change.
    87	
    88	**Recovery**:
    89	1. Read CI run logs via `gh run view`.
    90	2. Revert or fix the workflow change.
    91	3. Verify CI green on next push.
    92	
    93	**Operator lever**: none mid-flight; the workflow file
    94	must land correct.
    95	
    96	### F-6: Hook false-positive in real session
    97	
    98	**Trigger**: a hook blocks a legitimate operation an
    99	agent or user was attempting (e.g., `block-git-add-all`
   100	fires on a heredoc body containing `git add .`).
   101	
   102	**Detection**: user reports; agent surfaces blocker in
   103	workpad.
   104	
   105	**Recovery**:
   106	1. Examine the hook's match logic.
   107	2. Add a false-positive test fixture to
   108	   `tests/hooks/fixtures/` capturing the case.
   109	3. Tighten the match logic so the test passes AND the
   110	   real-trigger tests still pass.
   111	
   112	**Operator lever**: temporarily disable the hook via
   113	`.claude/settings.local.json` (K-2 deferral); fix +
   114	re-enable promptly.
   115	
   116	### F-7: Spec lifecycle stuck at owner-blocking
   117	
   118	**Trigger**: a SPEC's status is `owner-blocking` for an
   119	extended period.
   120	
   121	**Detection**: STATUS.md inventory; `/orient`-style
   122	session start hook.
   123	
   124	**Recovery**:
   125	1. Owner reviews the blocking question(s) in the SPEC's
   126	   §16 / §17 Open Questions.
   127	2. Owner authors a `decision-authority://owner:<date>`
   128	   resolution.
   129	3. Author updates §7 (or §3 Authority Map) with the
   130	   resolution; lifecycle continues.
   131	
   132	**Operator lever**: owner-only.
   133	
   134	## Recovery posture
   135	
   136	The framework's failure model is **fail loud, recover
   137	mechanically**. Every failure class has a deterministic
   138	exit code (lint, validate, hooks); the recovery is
   139	either mechanical (fix + re-run) or owner-routed
   140	(judgment required).
   141	
   142	No silent failures, no fallbacks. Per `../non-goals/INDEX.md`
   143	the framework does NOT provide automatic remediation;
   144	fixing is the contributor's responsibility.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/non-goals/INDEX.md | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Non-Goals — Facet-Level Negative Space
     2	
     3	The second novel facet per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
     4	§3 articulates the broader risk; this facet closes
     5	ambiguity at integration boundaries). For each of the
     6	other seven facets, this document states what the facet
     7	does NOT cover, so adopters and downstream readers can
     8	tell where the framework's authority ends.
     9	
    10	## Per-facet non-goals
    11	
    12	### Architecture (`../architecture/`) does NOT cover
    13	
    14	- A prescribed UML / ArchiMate / other diagramming
    15	  notation. C4 + Structurizr DSL are RECOMMENDED, not
    16	  REQUIRED.
    17	- Code-level diagrams for the framework's own
    18	  scripts/hooks. C4 Level 4 is "typically generated
    19	  rather than authored" per
    20	  `file://../../research/primary-sources/c4-model.md` §3.
    21	- A complete arc42 §6 Runtime View or §7 Deployment
    22	  View for the framework itself (the framework is not
    23	  a runtime service; deployment is documented in
    24	  `../deployment/install.md`).
    25	
    26	### Deployment (`../deployment/`) does NOT cover
    27	
    28	- A specific operating system, container runtime, or
    29	  CI/CD platform. Bash + Node + git is the runtime;
    30	  any host that runs those suffices.
    31	- Multi-tenancy concerns (no SaaS deployment shape).
    32	- Continuous-deployment automation. The framework's
    33	  release pattern is manual + tag + GitHub release.
    34	
    35	### Behavior (`../behavior/`) does NOT cover
    36	
    37	- HTTP API contracts for the framework itself (the
    38	  framework has no API). OpenAPI is REQUIRED only for
    39	  adopter products that ship HTTP APIs.
    40	- Asynchronous-event contracts (AsyncAPI is
    41	  RECOMMENDED for adopter products that ship event
    42	  contracts; the framework has no events).
    43	- GraphQL schemas.
    44	- Performance / load contracts (those are quality
    45	  scenarios in `../quality/`).
    46	
    47	### Customization (`../customization/`) does NOT cover
    48	
    49	- Adopter-product customization. K-1 through K-7
    50	  describe how an adopter customises THEIR USE OF THE
    51	  FRAMEWORK; the adopter's own product customization
    52	  is THE ADOPTER'S customization facet, not the
    53	  framework's.
    54	- Customization knob discovery via runtime
    55	  introspection. All knobs are declared statically in
    56	  `knobs.schema.json`.
    57	
    58	### Decisions (`../decisions/`) does NOT cover
    59	
    60	- The MADR or Y-statements richer-template variants.
    61	  The framework adopts Nygard's minimum template;
    62	  adopters MAY use richer formats in their own repos.
    63	- Pattern-language framing per Christopher Alexander
    64	  (Nygard's allusion is metaphor, not commitment).
    65	- Decisions about the adopter's product (those live
    66	  in the adopter's own decisions facet).
    67	
    68	### Quality (`../quality/`) does NOT cover
    69	
    70	- Adopter-product quality requirements (those are
    71	  THE ADOPTER'S quality facet).
    72	- ISO 25010 / ASQ / Atlassian-style formal quality
    73	  models. Quality scenarios per arc42 §10 are the
    74	  framework's contract.
    75	- Performance benchmarking. The framework is
    76	  text-processing scripts; performance is not a
    77	  load-bearing concern.
    78	
    79	### Operations (`../operations/`) does NOT cover
    80	
    81	- A runtime-service operating-model. The framework is
    82	  static artefacts + scripts; there is no daemon to
    83	  operate.
    84	- Multi-region failover, traffic routing, capacity
    85	  planning.
    86	- Automatic remediation (the failure model is
    87	  "fail loud, recover mechanically", not "self-heal").
    88	
    89	## Cross-facet non-goals (framework as a whole)
    90	
    91	- The framework does NOT prescribe a programming
    92	  language for adopter products.
    93	- The framework does NOT bundle an agent runtime;
    94	  Claude Code, Codex, Gemini CLI, etc. are the
    95	  runtimes; the framework is the operating-model the
    96	  agent reads.
    97	- The framework does NOT provide runtime libraries.
    98	- The framework does NOT bind to a specific issue
    99	  tracker; per the autonomous-issue-dispatch skill,
   100	  the contract is tracker-agnostic.
   101	- The framework does NOT provide automated
   102	  remediation for adopter-product failures; the
   103	  framework's lifecycle dispatches the work, the
   104	  agent + owner execute it.
   105	- The framework does NOT prescribe how adopter
   106	  products are distributed; the sibling repo
   107	  `agentic-installation-methodology` covers that
   108	  methodology question separately.
   109	
   110	## Why non-goals are first-class
   111	
   112	Per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
   113	§3 risk surface), ambiguity for an installing agent
   114	typically lives in what the spec DOESN'T say. By
   115	enumerating non-goals per facet, this document closes
   116	the inference surface — an installing agent reading the
   117	framework's spec bundle can confirm what's deferred,
   118	what's irrelevant, and what's adopter-owned.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find spec-bundle -maxdepth 2 -type f | sort | xargs -r wc -l' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    81 spec-bundle/architecture/CONTEXT.md
    81 spec-bundle/architecture/solution-strategy.md
   157 spec-bundle/customization/contract.md
   149 spec-bundle/customization/knobs.schema.json
    40 spec-bundle/decisions/INDEX.md
    89 spec-bundle/deployment/install.md
    51 spec-bundle/deployment/requirements.md
    61 spec-bundle/manifest.yaml
   118 spec-bundle/non-goals/INDEX.md
   144 spec-bundle/operations/failures.md
    67 spec-bundle/operations/observability.md
    90 spec-bundle/operations/safety-invariants.md
   213 spec-bundle/operations/workflow-universal.md
    39 spec-bundle/quality/12-factor-overlay.md
   121 spec-bundle/quality/requirements.md
   377 spec-bundle/schema/SPEC.schema.md
   113 spec-bundle/templates/IDEA.template.md
   349 spec-bundle/templates/SPEC.contract.template.md
   247 spec-bundle/templates/SPEC.decision.template.md
    98 spec-bundle/templates/SPEC.fastpath.template.md
   263 spec-bundle/templates/SPEC.task.template.md
   178 spec-bundle/templates/TASK.template.md
  3126 total

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find spec-bundle/conformance spec-bundle/customization/profiles spec-bundle/architecture spec-bundle/decisions -maxdepth 2 -print | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/architecture
spec-bundle/architecture/CONTEXT.md
spec-bundle/architecture/solution-strategy.md
spec-bundle/conformance
spec-bundle/customization/profiles
spec-bundle/decisions
spec-bundle/decisions/INDEX.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/customization/knobs.schema.json | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	{
     2	  "$schema": "https://json-schema.org/draft/2020-12/schema",
     3	  "$id": "https://github.com/buildepicshit/agentic-ops-framework/spec-bundle/customization/knobs.schema.json",
     4	  "title": "agentic-ops-framework adopter customization knobs",
     5	  "description": "JSON Schema defining the customization knobs the framework defers to the adopter. Authority: file://../../specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md §6.2.4 and file://contract.md.",
     6	  "type": "object",
     7	  "properties": {
     8	    "skill_catalog_scope": {
     9	      "description": "K-1 — which skills the adopter activates.",
    10	      "type": "array",
    11	      "items": {
    12	        "type": "string",
    13	        "enum": [
    14	          "repo-orientation",
    15	          "spec-authoring",
    16	          "spec-review",
    17	          "fast-path",
    18	          "approved-spec-decomposition",
    19	          "implementation-execution",
    20	          "verification",
    21	          "code-review",
    22	          "release-pr",
    23	          "spec-evidence-governance",
    24	          "tdd",
    25	          "diagnosis",
    26	          "owner-led-parallel-worktrees",
    27	          "autonomous-issue-dispatch",
    28	          "spec-driven-development",
    29	          "agents-md-improver",
    30	          "agent-feedback",
    31	          "caveman",
    32	          "cross-repo-policy-enforcement",
    33	          "cross-repo-informational-channel"
    34	        ]
    35	      },
    36	      "contains": {
    37	        "anyOf": [
    38	          { "const": "spec-authoring" },
    39	          { "const": "spec-review" }
    40	        ]
    41	      },
    42	      "default": [
    43	        "repo-orientation",
    44	        "spec-authoring",
    45	        "spec-review",
    46	        "fast-path",
    47	        "implementation-execution",
    48	        "verification",
    49	        "spec-evidence-governance"
    50	      ]
    51	    },
    52	    "hook_activation_set": {
    53	      "description": "K-2 — which hooks the adopter enables.",
    54	      "type": "array",
    55	      "items": {
    56	        "type": "string",
    57	        "enum": [
    58	          "block-ai-attribution",
    59	          "block-edit-on-main",
    60	          "block-git-add-all",
    61	          "block-push-to-main",
    62	          "block-verify-bypass",
    63	          "session-start-context",
    64	          "verify-reminder"
    65	        ]
    66	      },
    67	      "default": [
    68	        "block-ai-attribution",
    69	        "block-edit-on-main",
    70	        "block-git-add-all",
    71	        "block-push-to-main",
    72	        "block-verify-bypass",
    73	        "session-start-context",
    74	        "verify-reminder"
    75	      ]
    76	    },
    77	    "branch_policy_default": {
    78	      "description": "K-3 — per-SPEC branch policy default.",
    79	      "type": "string",
    80	      "enum": ["worktree-preferred", "main-direct"],
    81	      "default": "worktree-preferred"
    82	    },
    83	    "ci_job_set": {
    84	      "description": "K-4 — which CI jobs the adopter runs.",
    85	      "type": "array",
    86	      "items": {
    87	        "type": "string",
    88	        "enum": [
    89	          "lint-spec",
    90	          "validate-skill-frontmatter",
    91	          "test-hooks",
    92	          "validate-manifest",
    93	          "preflight-self-check"
    94	        ]
    95	      },
    96	      "contains": { "const": "lint-spec" },
    97	      "default": [
    98	        "lint-spec",
    99	        "validate-skill-frontmatter",
   100	        "test-hooks",
   101	        "validate-manifest"
   102	      ]
   103	    },
   104	    "tracker_integration": {
   105	      "description": "K-5 — issue tracker for autonomous-dispatch slices (optional).",
   106	      "type": "object",
   107	      "properties": {
   108	        "kind": {
   109	          "type": "string",
   110	          "enum": ["linear", "github-issues", "gitlab-issues", "jira", "none"]
   111	        },
   112	        "endpoint": { "type": "string" }
   113	      }
   114	    },
   115	    "verification_gate_sensitivity": {
   116	      "description": "K-6 — lint exit-2 (advisory) CI treatment.",
   117	      "type": "object",
   118	      "properties": {
   119	        "lint_exit_2_treatment": {
   120	          "type": "string",
   121	          "enum": ["advisory", "failure"],
   122	          "default": "advisory"
   123	        },
   124	        "contract_spec_exit_2_treatment": {
   125	          "type": "string",
   126	          "enum": ["failure"],
   127	          "default": "failure"
   128	        }
   129	      }
   130	    },
   131	    "cross_family_review_enforcement": {
   132	      "description": "K-7 — cross-family review posture.",
   133	      "type": "object",
   134	      "properties": {
   135	        "default_review_lane": {
   136	          "type": "string",
   137	          "enum": ["external-cross-family", "same-family-proxy"],
   138	          "default": "external-cross-family"
   139	        },
   140	        "schema_or_lifecycle_changes_require": {
   141	          "type": "string",
   142	          "enum": ["external-cross-family"],
   143	          "default": "external-cross-family"
   144	        }
   145	      }
   146	    }
   147	  },
   148	  "additionalProperties": false
   149	}

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/architecture/solution-strategy.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Architecture — Solution Strategy
     2	
     3	Per arc42 §4 Solution Strategy
     4	(`file://../../research/primary-sources/arc42.md` §3).
     5	
     6	## Strategic decisions
     7	
     8	The framework's core strategic choices, each backed by a
     9	decision artefact in `../decisions/`:
    10	
    11	1. **Spec-first discipline over code-first.** Every
    12	   non-trivial change starts with a typed SPEC
    13	   (IDEA → SPEC → review → approve → execute → verify
    14	   → close). The lifecycle is documented in
    15	   `../../OPERATING_MODEL.md`.
    16	2. **Citation grammar over loose prose.** Every factual
    17	   claim in every artefact carries a citation prefix per
    18	   `../schema/SPEC.schema.md` §2.
    19	3. **Owner-only authority transitions for `approved`,
    20	   `decomposed`, `closed`.** No skill, agent, or
    21	   automated tooling may flip those states.
    22	4. **Hooks as the enforcement surface for safety
    23	   invariants.** Hard rules (no AI attribution, no bulk
    24	   staging, no verify-bypass, no push-to-protected-branch)
    25	   are enforced by `../../hooks/` PreToolUse hooks rather
    26	   than relying on agent compliance.
    27	5. **Cross-family review is BLOCKING per slice.**
    28	   Different-family review reduces single-family blind
    29	   spots; the framework recommends it for every
    30	   approved-pending-owner → approved transition.
    31	6. **Worked examples are first-class.** The framework
    32	   ships six worked examples
    33	   (`../../examples/`) that exercise all four spec types
    34	   plus TASK decomposition.
    35	7. **Manifest+catalog packaging for the v2.0 bundle.**
    36	   Per the parent agentic-installation-methodology
    37	   Decision, the framework's v2.0 layout exemplifies the
    38	   manifest+catalog shape it advocates downstream.
    39	
    40	## Technology decisions
    41	
    42	The framework is language-agnostic but ships:
    43	
    44	- **Bash** for lint, hooks, hook tests, validate-manifest
    45	  (POSIX-friendly; no agent-language assumptions).
    46	- **Node.js** for `preflight.mjs` workspace-layout audit
    47	  (the only Node dependency; CI installs it).
    48	- **Markdown** for all artefacts (SPEC.md, IDEA.md,
    49	  SKILL.md, templates, examples).
    50	- **YAML** for the front-door manifest + workflow CI
    51	  config + per-spec front-matter.
    52	- **GitHub Actions** for CI; no other CI integration is
    53	  assumed.
    54	
    55	Each language/format choice is documented in a separate
    56	ADR-style decision under `../decisions/`.
    57	
    58	## Top-level quality goals
    59	
    60	Per arc42 §1.2 (top three to five quality goals;
    61	`file://../../research/primary-sources/arc42.md` §3):
    62	
    63	1. **Citation precision** — every factual claim
    64	   resolves to a source the reader can verify (file,
    65	   command, URL, owner judgment).
    66	2. **Mechanical verifiability** — every quality gate
    67	   (lint, hook test, manifest validation, CI) is a
    68	   script that exits 0 or non-zero; no judgment calls.
    69	3. **Hermetic test surface** — hook tests run from
    70	   ephemeral git sandboxes; not dependent on the host
    71	   repo state.
    72	4. **Honest disclosure** — failure modes, open
    73	   research questions, same-family-review caveats are
    74	   surfaced in artefacts, not buried.
    75	
    76	## Architecture decomposition
    77	
    78	For Container / Component diagrams (C4 model
    79	`file://../../research/primary-sources/c4-model.md` §3),
    80	see `architecture.dsl` once Structurizr DSL artefacts
    81	land (v2.x slice — placeholder at v2.0).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba CHANGELOG.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Changelog
     2	
     3	All notable changes to this project. Format loosely follows
     4	[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) with
     5	date-stamped releases. Versions before v1.0 were README-only
     6	milestones; v1.0 is the first git-tagged release.
     7	
     8	## v2.0 — 2026-05-19
     9	
    10	**Breaking layout change**: the framework is repacked into
    11	a manifest+catalog packaging shape that exemplifies the
    12	methodology the sibling repo
    13	[`agentic-installation-methodology`](https://github.com/buildepicshit/agentic-installation-methodology)
    14	publishes. v1.1 remains tagged at `v1.1`; consumers pinning
    15	that tag are unaffected. Consumers pinning `main` MUST
    16	update their paths per the migration index below.
    17	
    18	### Added
    19	
    20	- **`spec-bundle/manifest.yaml`** — front-door manifest
    21	  per the methodology's manifest+catalog packaging
    22	  recommendation. Carries `spec_version`,
    23	  `bundle_version`, `conformance_profile`, `intent` block
    24	  (product name, purpose, developer + installer
    25	  authority), eight `facets` entries, and a reserved
    26	  `signature` field for v2.x Sigstore signing.
    27	- **`scripts/validate-manifest.sh`** — mechanical
    28	  completeness gate: validates schema version,
    29	  conformance profile, intent block, facet ↔ filesystem
    30	  bijection, and primary-file presence per facet. Exits
    31	  0 iff the bundle is structurally complete.
    32	- **Eight per-facet sub-spec directories** under
    33	  `spec-bundle/`:
    34	  - `architecture/` — arc42 §3 Context (`CONTEXT.md`) +
    35	    arc42 §4 Solution Strategy (`solution-strategy.md`).
    36	    Reserved for Structurizr DSL diagrams in v2.x.
    37	  - `deployment/` — install procedure (`install.md`) +
    38	    runtime requirements (`requirements.md`, 12-factor
    39	    Factor II framing).
    40	  - `behavior/features/` — Gherkin scenarios for lint
    41	    citation grammar and the AI-attribution block hook.
    42	    Reserved for additional features in v2.x.
    43	  - `customization/` — deferral contract (`contract.md`)
    44	    naming K-1 through K-7 adopter knobs + JSON Schema
    45	    enumeration (`knobs.schema.json`).
    46	  - `decisions/` — ADR-style decision index
    47	    (`INDEX.md`) catalogues eight foundational
    48	    framework decisions. Per-decision artefacts at
    49	    `ADR-NNN-<slug>.md` are reserved for v2.x.
    50	  - `quality/` — quality scenarios (`requirements.md`,
    51	    six Q-1 through Q-6 quality goals) + 12-factor
    52	    overlay (`12-factor-overlay.md`).
    53	  - `operations/` — failure model (`failures.md`,
    54	    seven F-1 through F-7 failure classes) +
    55	    observability (`observability.md`, three-tier
    56	    Symphony §13 pattern) + safety invariants
    57	    (`safety-invariants.md`, SI-1 through SI-12).
    58	  - `non-goals/` — per-facet negative space (`INDEX.md`,
    59	    novel facet per the methodology's research §4.2).
    60	- **`AGENTS.md`** at top-level — new entry doc for
    61	  AGENTS-aware tools per `https://agents.md`. Imports
    62	  via `CLAUDE.md`'s `@AGENTS.md` directive.
    63	- **CI: `validate-manifest` job** in the workflow.
    64	
    65	### Changed
    66	
    67	- **Directory moves** (the v1.x → v2.0 migration index):
    68	  - `schema/SPEC.schema.md` → `spec-bundle/schema/SPEC.schema.md`
    69	  - `templates/*.template.md` → `spec-bundle/templates/*.template.md`
    70	  - `skills/<name>/` → `spec-bundle/skills/<name>/`
    71	  - `workflow/UNIVERSAL.md` → `spec-bundle/operations/workflow-universal.md`
    72	  - `workpads/*.template.md` → `spec-bundle/templates/workpads/*.template.md`
    73	  - `docs/` → removed (was empty)
    74	- `scripts/validate-skill-frontmatter.sh` updated to
    75	  scan `spec-bundle/skills/` (was `skills/`).
    76	- `README.md` rewritten for v2.0 with migration table.
    77	- `CLAUDE.md` rewritten to reference v2.0 layout with a
    78	  v1.x cheat-sheet.
    79	
    80	### Authority
    81	
    82	This repack lands under the parent Decision SPEC at
    83	`bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
    84	§7 (Hybrid longread + SPEC bundle shape, paired
    85	Product A v2.0 + Product B v1.0 release) and the slice 2
    86	Contract SPEC at
    87	`specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`.
    88	
    89	Every methodology primitive adopted in v2.0 is grounded
    90	in a primary-source corpus entry in the sibling repo at
    91	`research/primary-sources/<slug>.md`. The corpus is the
    92	authoritative evidence base; agent memory is not citable
    93	for any methodology claim in v2.0 artefacts.
    94	
    95	### Reserved for v2.x
    96	
    97	- Per-decision ADR artefacts at
    98	  `spec-bundle/decisions/ADR-NNN-<slug>.md` (currently
    99	  just the INDEX is populated).
   100	- Structurizr DSL diagrams at
   101	  `spec-bundle/architecture/*.dsl`.
   102	- Executable conformance suite at
   103	  `spec-bundle/conformance/`.
   104	- Sigstore signing of the bundle (`signature.status:
   105	  unsigned` at v2.0; populates when cosign + Rekor
   106	  tooling is wired).
   107	- Reference customization profiles at
   108	  `spec-bundle/customization/profiles/*.yaml`.
   109	
   110	### Posture
   111	
   112	The framework eats its own dog food: by adopting the
   113	methodology's recommended packaging on itself, the v2.0
   114	release becomes the worked case study the sibling
   115	methodology repo references. Honest disclosure: v2.0
   116	ships scaffold-grade content in several facets (the
   117	`spec-bundle/conformance/` is empty; per-decision ADRs
   118	are not yet authored beyond the INDEX). The structural
   119	contract is sound; richer content lands in v2.x slices.
   120	
   121	## v1.1 — 2026-05-18
   122	
   123	Catalog expansion, cross-repo abstract patterns, and contributor
   124	docs. No breaking changes; v1.0 consumers can adopt v1.1 by
   125	copying the new skills + scripts.
   126	
   127	### Added
   128	
   129	- **Six new skills** lifting the catalog from 14 to 20:
   130	  - `spec-driven-development` — 13-phase lifecycle skill.
   131	  - `agents-md-improver` — entry-doc audit + canonical-pattern
   132	    drift detection.
   133	  - `agent-feedback` — outbound-to-fleet friction-surface
   134	    workpad pattern.
   135	  - `caveman` — opt-in compressed communication mode (safety
   136	    exceptions baked in).
   137	  - `cross-repo-policy-enforcement` — fleet-wide policy
   138	    directive pattern with shell-block compliance checks.
   139	  - `cross-repo-informational-channel` — per-repo
   140	    `AGENT_INBOX.md` pattern for structured handoffs +
   141	    fleet-update notices.
   142	- **Two cross-repo scripts**:
   143	  - `scripts/audit-fleet-compliance.sh` runs every directive's
   144	    §3 shell-block compliance check against each named target;
   145	    exit 0 iff every (directive × target) pair passes.
   146	  - `scripts/send-fleet-message.sh` appends a structured entry
   147	    to another repo's `AGENT_INBOX.md` and commits with a
   148	    `fleet(inbox): …` message.
   149	- **`workpads/AGENT_INBOX.template.md`** — the inbound channel
   150	  template each fleet repo plants at its root for cross-repo
   151	  informational messages.
   152	- **`scripts/fleet-known-repos.txt`** manifest — `send-fleet-
   153	  message.sh` reads valid target repo names from this file
   154	  instead of a hardcoded array. Empty by default; single-repo
   155	  projects need not populate it.
   156	- **`CONTRIBUTING.md`** + **`CODE_OF_CONDUCT.md`** — how to
   157	  contribute under the framework's own IDEA → SPEC →
   158	  review → approve → execute → verify lifecycle.
   159	
   160	### Changed
   161	
   162	- Generic-fleet-friendly rename: `studio-principle-<topic>` slug
   163	  taxonomy → `principle-<topic>`. `Studio Principles` skill
   164	  section + per-type-gate check renamed to fleet-principle.
   165	- `audit-entry-docs.sh` advisory phrasing on missing
   166	  `WORKFLOW.md`: generic "issue-tracker-dispatch contract"
   167	  replaces tool-specific naming.
   168	
   169	## v1.0 — 2026-05-18
   170	
   171	First tagged release. The framework is adoptable end-to-end:
   172	schema + templates + lint + hooks + skills + worked examples +
   173	operating model + CI.
   174	
   175	### Added
   176	
   177	- **CI** — `.github/workflows/ci.yml` runs four jobs on every
   178	  push and PR: lint worked examples, validate skill frontmatter,
   179	  hook test harness (33 cases), preflight self-check.
   180	- **Hook test harness** at `tests/hooks/run-tests.sh` covers
   181	  all seven hooks across block paths, allow paths, and false-
   182	  positive guards. Uses ephemeral git-sandbox fixtures for
   183	  branch-aware hooks so tests are hermetic.
   184	- **Dogfooding SPEC** at `specs/2026-05-18-v1.0-release-foundations/`
   185	  — the framework's first internal SPEC, documenting the v1.0
   186	  release work via the capture-after pattern. The framework
   187	  uses itself.
   188	
   189	### Pre-v1.0 milestones (no tags)
   190	
   191	**v0.5.2 milestone** — `preflight.mjs` config extracted to
   192	`scripts/preflight-config.example.json`. JSON manifest of
   193	topology + allowlist replaces hardcoded arrays in the script.
   194	
   195	**v0.5.1 milestone** — `audit-entry-docs.sh` shipped with three
   196	new repo-posture manifests (`fleet-internal-repos.example.txt`,
   197	`fleet-oss-repos.example.txt`,
   198	`fleet-local-only-repos.example.txt`). `Fleet Rule Origination`
   199	canonical-phrase check renamed to `Policy Origination` (generic).
   200	
   201	**v0.5 milestone** — `fleet-sync.sh` and six example manifests
   202	(`fleet-files`, `fleet-skills`, `fleet-commands`, `fleet-hooks`,
   203	`fleet-hook-fixtures`, `fleet-oss-gitignore`). Topology lives in
   204	plain-text manifests; script auto-derives source path from its
   205	own location with `FLEET_SOURCE` env override.
   206	
   207	**v0.1 milestone** — initial framework substrate. Schema +
   208	6 templates (IDEA, 4 SPEC types, TASK) + lint-spec.sh +
   209	validate-skill-frontmatter.sh + 7 hooks + 6 procedure-only
   210	skills + workflow/UNIVERSAL.md + workpads templates + a
   211	lightweight OPERATING_MODEL.md + Apache-2.0 LICENSE.
   212	
   213	### Path from v0.1 to v1.0
   214	
   215	After v0.1 the framework grew via incremental feature commits
   216	(no tags cut). Key additions between v0.1 and v1.0:
   217	
   218	- **Skill catalogue 6 → 14**. Added: `approved-spec-decomposition`,
   219	  `implementation-execution`, `owner-led-parallel-worktrees`,
   220	  `autonomous-issue-dispatch`, `repo-orientation`,

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba README.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# agentic-ops-framework
     2	
     3	[![CI](https://github.com/buildepicshit/agentic-ops-framework/actions/workflows/ci.yml/badge.svg)](https://github.com/buildepicshit/agentic-ops-framework/actions/workflows/ci.yml)
     4	
     5	A spec-driven operating-model framework for multi-agent software studios.
     6	Schemas, templates, lint, hooks, skills, and workpads for running
     7	non-trivial agent work through an IDEA → SPEC → review → approve →
     8	execute → verify → close lifecycle.
     9	
    10	Extracted from one studio's working internal practice and sanitized for
    11	adoption. We eat our own dog food. Your mileage may vary.
    12	
    13	**v2.0 status**: the framework has been reorganized into a
    14	manifest+catalog packaging shape that exemplifies the methodology
    15	the sibling repo
    16	[`agentic-installation-methodology`](https://github.com/buildepicshit/agentic-installation-methodology)
    17	publishes. v1.x consumers: see the **Migration from v1.x** section
    18	below for the new path layout.
    19	
    20	## What's here (v2.0)
    21	
    22	Top-level (OSS-conventional + repo plumbing):
    23	
    24	| Path | What |
    25	|---|---|
    26	| `LICENSE`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md` | Standard OSS scaffolding |
    27	| `AGENTS.md`, `CLAUDE.md` | Entry docs for AGENTS-aware tools + Claude Code |
    28	| `OPERATING_MODEL.md` | The 13-phase lifecycle in detail |
    29	| `CHANGELOG.md` | Release history (v0.1 → v2.0) |
    30	| `scripts/` | Tooling: `lint-spec.sh`, `validate-skill-frontmatter.sh`, `validate-manifest.sh` (v2.0), `fleet-sync.sh`, `audit-entry-docs.sh`, `audit-fleet-compliance.sh`, `send-fleet-message.sh`, `preflight.mjs` |
    31	| `hooks/` | Seven PreToolUse hooks: `block-edit-on-main`, `block-push-to-main`, `block-git-add-all`, `block-verify-bypass`, `block-ai-attribution`, `verify-reminder`, `session-start-context` |
    32	| `tests/hooks/` | 33-case hermetic hook test harness |
    33	| `examples/` | Worked IDEA + SPEC pairs across all four SPEC types + a TASK decomposition |
    34	| `specs/` | The framework's own internal SPEC ledger (dogfooding) |
    35	| `.github/workflows/ci.yml` | Five CI jobs |
    36	
    37	The manifest+catalog bundle (the methodology artefact):
    38	
    39	| Path | What |
    40	|---|---|
    41	| `spec-bundle/manifest.yaml` | Front-door manifest naming every facet + resource |
    42	| `spec-bundle/architecture/` | arc42 §3 Context + arc42 §4 Solution Strategy + (future) Structurizr DSL diagrams |
    43	| `spec-bundle/deployment/` | Install procedure + runtime requirements (12-factor Factor II framing) |
    44	| `spec-bundle/behavior/features/` | Gherkin scenarios for lint + hook behaviour |
    45	| `spec-bundle/customization/` | Deferral contract (`contract.md`) + JSON Schema knob enumeration (`knobs.schema.json`) |
    46	| `spec-bundle/decisions/` | ADR-style decision index (Nygard template) |
    47	| `spec-bundle/quality/` | Quality scenarios + 12-factor overlay |
    48	| `spec-bundle/operations/` | Failure model (Symphony §14 pattern) + observability (Symphony §13) + safety invariants (Symphony §9.5) + universal workflow body |
    49	| `spec-bundle/non-goals/` | Per-facet negative space (novel facet per the methodology) |
    50	| `spec-bundle/schema/SPEC.schema.md` | The schema every IDEA/SPEC/TASK conforms to |
    51	| `spec-bundle/templates/` | IDEA + 4 SPEC type templates + TASK template + workpad templates |
    52	| `spec-bundle/skills/` | Twenty skills covering the full lifecycle + multi-repo patterns + meta-skills |
    53	| `spec-bundle/conformance/` | (Reserved for v2.x) Executable conformance suite |
    54	
    55	## Migration from v1.x
    56	
    57	v2.0 is a **breaking** layout change. Every file under the
    58	old top-level `schema/`, `templates/`, `skills/`, `workflow/`,
    59	and `workpads/` has moved under `spec-bundle/`:
    60	
    61	| v1.x path | v2.0 path |
    62	|---|---|
    63	| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` |
    64	| `templates/*.template.md` | `spec-bundle/templates/*.template.md` |
    65	| `skills/<name>/` | `spec-bundle/skills/<name>/` |
    66	| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` |
    67	| `workpads/*.template.md` | `spec-bundle/templates/workpads/*.template.md` |
    68	
    69	Top-level scripts (`scripts/`), hooks (`hooks/`), tests
    70	(`tests/`), examples (`examples/`), specs (`specs/`), and
    71	all OSS-conventional files (LICENSE, README, CONTRIBUTING,
    72	CHANGELOG, etc.) are unchanged.
    73	
    74	v1.1 remains tagged at `v1.1` — consumers pinning v1.1
    75	continue to work; consumers pinning `main` need to update
    76	their paths. The CHANGELOG v2.0 entry documents the full
    77	move set.
    78	
    79	## Status
    80	
    81	**v2.0** — manifest+catalog repack of v1.1 into the
    82	shape the sibling
    83	[`agentic-installation-methodology`](https://github.com/buildepicshit/agentic-installation-methodology)
    84	methodology advocates. Eight per-facet sub-specs with
    85	primary-file contracts, a front-door
    86	`spec-bundle/manifest.yaml`, and a mechanical
    87	`scripts/validate-manifest.sh` gate. CI gains a fifth job
    88	for manifest validation.
    89	
    90	v1.1 shipped six new skills (catalog 14 → 20), two
    91	cross-repo abstract patterns (`cross-repo-policy-enforcement`,
    92	`cross-repo-informational-channel`), and contributor docs
    93	(CONTRIBUTING.md + CODE_OF_CONDUCT.md).
    94	
    95	v1.0 was the first git-tagged release: end-to-end
    96	adoptable (schema + templates + lint + hooks + 14 skills +
    97	worked examples + operating model + CI).
    98	
    99	## Design posture
   100	
   101	- **Schema is the contract**, lint enforces it, hooks guard against
   102	  the obvious failure modes (edits on protected branch, bulk
   103	  staging, verify bypass, AI attribution in commits).
   104	- **Citation grammar separates input from evidence**: agent memory
   105	  and training are inputs to reasoning; only `file://` / `cmd://` /
   106	  `url://` / `decision-authority://` / `owner://` / `judgment://`
   107	  cites are evidence in artefacts.
   108	- **RFC 2119 normative language** carries force in the sections the
   109	  templates designate; other sections are descriptive.
   110	- **Owner-only state transitions** (`approved`, `decomposed`,
   111	  `closed`) keep agency boundaries explicit; gate-passing skills
   112	  set `approved-pending-owner` only.
   113	- **Cross-family review** as a first-class merge gate for decomposed
   114	  work — different model family from the implementer reviews the
   115	  diff before it lands.
   116	- **Manifest+catalog packaging** (v2.0): the front-door manifest
   117	  enumerates eight per-facet sub-specs; agents consuming the
   118	  framework can fetch the facet they need rather than the whole
   119	  tree.
   120	
   121	## Multi-repo propagation
   122	
   123	If you run a multi-repo studio where one policy repo owns the
   124	canonical fleet content and N child repos consume it, the
   125	`scripts/fleet-sync.sh` script propagates the baseline. The
   126	topology lives in plain-text manifests (`fleet-files.txt`,
   127	`fleet-skills.txt`, `fleet-internal-repos.txt`, etc.). The
   128	repo ships these as `*.example.txt`; adopters rename them
   129	and fill them in. Source path is auto-derived from script
   130	location; override with `FLEET_SOURCE`.
   131	
   132	The framework also ships two cross-repo abstract patterns:
   133	
   134	- `cross-repo-policy-enforcement` — fleet-wide policy
   135	  directives with shell-block compliance checks
   136	  (`scripts/audit-fleet-compliance.sh` walks the directives).
   137	- `cross-repo-informational-channel` — per-repo
   138	  `AGENT_INBOX.md` for structured handoffs +
   139	  fleet-update notices (`scripts/send-fleet-message.sh`).
   140	
   141	Single-repo studios don't need either pattern.
   142	
   143	## What this is not
   144	
   145	- Not a CLI runtime. The framework is schema + templates + lint +
   146	  hooks + skills. Wire it into your own agent harness (Claude Code,
   147	  Cursor, Codex, Aider, your custom dispatcher); the framework
   148	  doesn't dictate the harness.
   149	- Not an opinion on which models to use. The framework specifies
   150	  *that* cross-family review happens; it doesn't specify *which*
   151	  families.
   152	- Not a finished product. The lint script handles the common cases;
   153	  the hooks cover the obvious foot-guns; the skill catalog at 20
   154	  covers the studio's full lifecycle but adopters MAY add their own.
   155	- Not the methodology itself. The methodology — agentic installation
   156	  — is published separately at
   157	  [`agentic-installation-methodology`](https://github.com/buildepicshit/agentic-installation-methodology).
   158	  This framework is the *worked case study* the methodology
   159	  references.
   160	
   161	## Licence
   162	
   163	Apache-2.0. See `LICENSE`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba AGENTS.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# AGENTS.md — agentic-ops-framework
     2	
     3	> Entry doc for AGENTS-aware tools (Codex, Cursor, Aider,
     4	> Jules, Copilot, and other AGENTS-spec consumers per
     5	> `https://agents.md`). Claude Code enters via `CLAUDE.md`.
     6	
     7	## What this repo is
     8	
     9	A framework for operating engineering work with coding
    10	agents under spec-first discipline: typed IDEA → SPEC
    11	artefacts with citation grammar, RFC 2119 scoping rules,
    12	a per-type quality gate, owner-only authority transitions,
    13	and a hermetic hook test harness. v2.0 reorganizes into
    14	manifest+catalog packaging that exemplifies the
    15	methodology the sibling repo
    16	[`agentic-installation-methodology`](https://github.com/buildepicshit/agentic-installation-methodology)
    17	publishes.
    18	
    19	The framework is offered as honest experience from one
    20	studio's working internal practice — not as prescription.
    21	
    22	## Authority chain
    23	
    24	Read in order when entering the repo:
    25	
    26	1. **AGENTS.md** (this file).
    27	2. **`OPERATING_MODEL.md`** — the 13-phase lifecycle in
    28	   detail.
    29	3. **`spec-bundle/manifest.yaml`** — the front-door
    30	   manifest naming every facet + resource.
    31	4. **`spec-bundle/schema/SPEC.schema.md`** — the schema
    32	   every IDEA/SPEC/TASK must conform to.
    33	5. **`spec-bundle/architecture/CONTEXT.md`** — the
    34	   framework's own architecture context.
    35	6. **Active SPEC** (if one exists) under
    36	   `specs/<id>/SPEC.md`.
    37	7. **The methodology corpus** at
    38	   `../agentic-installation-methodology/research/primary-sources/`
    39	   (sibling repo) — primary-source artefacts that
    40	   ground every methodology primitive the framework
    41	   adopts.
    42	
    43	When sources conflict, stop and surface the conflict.
    44	
    45	## v2.0 layout
    46	
    47	Top-level (OSS-conventional + repo plumbing):
    48	
    49	- `LICENSE`, `README.md`, `CONTRIBUTING.md`,
    50	  `CODE_OF_CONDUCT.md`, `CHANGELOG.md`.
    51	- `AGENTS.md`, `CLAUDE.md` — entry docs.
    52	- `OPERATING_MODEL.md` — lifecycle reference.
    53	- `scripts/` — tooling (lint, validators, hooks,
    54	  fleet-sync helpers).
    55	- `hooks/` — PreToolUse hooks enforcing discipline.
    56	- `tests/` — hook test harness + future facet tests.
    57	- `examples/` — worked IDEA+SPEC examples.
    58	- `specs/` — the framework's own internal SPEC ledger.
    59	- `.github/workflows/ci.yml` — five CI jobs.
    60	
    61	The manifest+catalog bundle (the methodology artefact):
    62	
    63	- `spec-bundle/manifest.yaml` — front-door manifest.
    64	- `spec-bundle/{architecture, deployment, behavior,
    65	  customization, decisions, quality, operations,
    66	  non-goals}/` — eight per-facet sub-specs.
    67	- `spec-bundle/{schema, templates, skills,
    68	  conformance}/` — resource directories.
    69	
    70	## Engineering standards
    71	
    72	- Conventional Commits 1.0.0.
    73	- Stage files explicitly by name. **Never** `git add .`
    74	  or `git add -A` (enforced by `block-git-add-all.sh`).
    75	- Do not commit machine-local files, secrets, or
    76	  generated output.
    77	- Do not add AI attribution to commits (no
    78	  `Co-Authored-By: Claude` / similar trailers; enforced
    79	  by `block-ai-attribution.sh`).
    80	- Do not bypass verify gates (`--no-verify`,
    81	  `VERIFY_SKIP=1`, etc. enforced by
    82	  `block-verify-bypass.sh`).
    83	- Do not push directly to `main` unless an active SPEC
    84	  declares `branch_policy: main-direct` (enforced by
    85	  `block-push-to-main.sh` + `block-edit-on-main.sh`).
    86	
    87	## Citation discipline
    88	
    89	Every factual claim in every artefact MUST carry a
    90	citation prefix from the grammar:
    91	
    92	- `file://<path>` — repo-local files.
    93	- `cmd://<command>` — commands run.
    94	- `url://<full-url>` — external sources.
    95	- `owner://transcript-<date>` — owner verbatim.
    96	- `decision-authority://<role>:<date>` — role-scoped
    97	  authority.
    98	- `judgment://owner` or `judgment://agent-synthesis` —
    99	  judgments with explicit attribution.
   100	
   101	Memory and training data are inputs to your reasoning,
   102	not citable evidence. The lint script enforces this.
   103	
   104	When a sentence is in fact editorial framing or an
   105	internal cross-reference, append
   106	`<!-- lint-ok: no-citation -->` per
   107	`spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly.
   108	
   109	## Spec lifecycle (13 phases)
   110	
   111	See `OPERATING_MODEL.md` for the full description. Short
   112	version:
   113	
   114	Preflight → Orient → Predict → Ideate → Author → Review
   115	(BLOCKING) → Approve (owner-only) → Decompose (BLOCKING
   116	for Contract/Task with ≥2 slices) → Dispatch → Execute →
   117	Cross-validate (BLOCKING) → Verify → Report + Close
   118	(owner-only).
   119	
   120	For trivial reversible work the **Fastpath** SPEC type
   121	collapses the lifecycle into one capture-after artefact
   122	landing at `status: closed` in the same commit.
   123	
   124	## CI gates (five jobs)
   125	
   126	Every push runs:
   127	
   128	1. `lint-spec` — six worked examples + the inaugural
   129	   internal SPEC.
   130	2. `validate-skills` — skill frontmatter sanity.
   131	3. `test-hooks` — 33-case hermetic hook test harness.
   132	4. `validate-manifest` — front-door manifest schema +
   133	   facet bijection.
   134	5. `preflight-self-check` — `node --check
   135	   scripts/preflight.mjs`.
   136	
   137	All five MUST pass for the push to be considered green.
   138	
   139	## Posture
   140	
   141	The framework's posture: honest experience, not
   142	prescription. Contributors disagree about the work, not
   143	about contributors. Failure modes are first-class.
   144	Citation grammar exists so claims can be argued
   145	precisely.
   146	
   147	The seven open research questions from the methodology
   148	research workpad
   149	(`../agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md`
   150	§3 articulates the risks) are unresolved; the framework
   151	helps address them, it does not pretend to resolve them.
   152	
   153	## Branch and remote policy
   154	
   155	- Default branch: `main`.
   156	- Remote: `git@github.com:buildepicshit/agentic-ops-framework.git`
   157	  (public).
   158	- Internal SPECs at `specs/<id>/SPEC.md` MAY declare
   159	  `branch_policy: main-direct` when the work is owner-
   160	  approved direct-on-main; both `block-edit-on-main`
   161	  and `block-push-to-main` honour the declaration.
   162	
   163	## See also
   164	
   165	- `CLAUDE.md` — Claude Code entry doc (imports this
   166	  file).
   167	- `CONTRIBUTING.md` — how to contribute under the
   168	  lifecycle.
   169	- `CODE_OF_CONDUCT.md` — interaction norms.
   170	- `spec-bundle/customization/contract.md` — the
   171	  deferral contract for adopter customization.
   172	- Sibling repo:
   173	  [`agentic-installation-methodology`](https://github.com/buildepicshit/agentic-installation-methodology)
   174	  for the methodology this framework's v2.0 layout
   175	  exemplifies.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/deployment/requirements.md | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Deployment — Requirements
     2	
     3	Per 12-factor's Factor II "Dependencies" framing
     4	(`file://../../research/primary-sources/12-factor.md` §3):
     5	declare and isolate dependencies explicitly.
     6	
     7	## Runtime dependencies
     8	
     9	The framework itself is not a runtime service. The scripts
    10	it ships have these dependencies:
    11	
    12	| Tool | Min version | Used by |
    13	|---|---|---|
    14	| `bash` | 4.0+ | All scripts (lint, hooks, hook tests, validate-manifest) |
    15	| `grep`, `sed`, `awk`, `find` | POSIX | All scripts |
    16	| `git` | 2.25+ | Hooks (block-edit-on-main detects branch; block-git-add-all etc.) |
    17	| `node` | 18+ | Only `scripts/preflight.mjs` |
    18	| `gh` (GitHub CLI) | 2.0+ | Release workflows (optional) |
    19	| `jq` | 1.6+ | Hook test harness (parses session-start-context JSON) |
    20	
    21	## Tooling dependencies for adopters
    22	
    23	The framework assumes the adopter uses one or more of:
    24	
    25	- A git host (GitHub, GitLab, Bitbucket, self-hosted).
    26	- An AI coding assistant that reads `AGENTS.md` or
    27	  `CLAUDE.md` (per `url://agents.md` and
    28	  `url://code.claude.com/docs/en/memory`).
    29	- Optionally: an issue tracker and an
    30	  autonomous-issue-dispatch runner for the Symphony-style
    31	  patterns
    32	  (`file://../../research/primary-sources/symphony-spec.md` §3).
    33	
    34	## What the framework does NOT require
    35	
    36	- No specific programming language for the adopter's
    37	  product.
    38	- No specific cloud or hosting provider.
    39	- No paid SaaS dependency.
    40	- No vendor lock-in to one AI assistant; the framework
    41	  is AGENTS-aware-tool-agnostic.
    42	
    43	## Reproducibility posture
    44	
    45	The framework itself is reproducible-by-construction: a
    46	fresh clone at a given tag is byte-identical to any other
    47	clone at that tag. The framework does NOT yet adopt
    48	Nix-style content-hash reproducibility for adopter
    49	products (`file://../../research/primary-sources/nix-flakes.md`
    50	§3); that's an open methodology question per the
    51	`non-goals/INDEX.md` entry on reproducibility-of-product.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/operations/observability.md spec-bundle/operations/safety-invariants.md spec-bundle/quality/12-factor-overlay.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Operations — Observability
     2	
     3	Three-tier observability per the Symphony §13 pattern
     4	(`file://../../research/primary-sources/symphony-spec.md`
     5	§3 — transferable building block 9).
     6	
     7	## Tier 1: REQUIRED logging
     8	
     9	The framework's tooling MUST log (stdout / stderr) for
    10	every gate invocation:
    11	
    12	| Gate | Required output |
    13	|---|---|
    14	| `scripts/lint-spec.sh <target>` | One-line summary block on stdout (target, type, citation count, errors, warnings) + per-error file:line on stderr |
    15	| `scripts/validate-skill-frontmatter.sh` | One-line PASS/FAIL summary on stdout + per-failure detail on stderr |
    16	| `scripts/validate-manifest.sh` | One-line PASS summary OR enumerated issue list on stderr |
    17	| `tests/hooks/run-tests.sh` | Per-test PASS/FAIL line + final summary |
    18	| Each hook | Block reason on stderr when rejecting; silence when allowing |
    19	
    20	This logging is what CI captures and what local agents /
    21	users see directly. No structured-log format is mandated
    22	at v2.0 (text/plain stdout/stderr is sufficient).
    23	
    24	## Tier 2: RECOMMENDED snapshot
    25	
    26	For long-running session-style work (an agent operating
    27	across many turns), the framework's
    28	`hooks/session-start-context.sh` emits a session-init
    29	context block on session start. This snapshot includes:
    30	
    31	- Repo identifier + current branch.
    32	- Active SPEC slug + status.
    33	- Recent commits (last 5).
    34	- Pointers to STATUS.md and AGENTS.md.
    35	
    36	The snapshot pattern is per the Symphony §13 pattern
    37	"recommended snapshot" tier; adopters MAY add their own
    38	snapshot hooks for additional context.
    39	
    40	## Tier 3: OPTIONAL HTTP / external
    41	
    42	The framework does NOT ship an HTTP observability
    43	endpoint. Adopters who run the framework's discipline
    44	inside a hosted CI/CD or workflow runner MAY wire CI
    45	artifact uploads + run metadata to their tracker /
    46	dashboard / alerting infrastructure. This is adopter-
    47	specific tooling; the framework provides no contract.
    48	
    49	## Observability for agent runs
    50	
    51	When an agent is dispatched against a TASK.md slice
    52	(via `autonomous-issue-dispatch` patterns or owner-led
    53	direct invocation), the observability surface is:
    54	
    55	- The agent's session log (per Claude Code / Codex /
    56	  Gemini's runner conventions).
    57	- The TASK.md's §6 Evidence section (filled by the
    58	  executor).
    59	- The parent SPEC's §17 Completion Report (filled at
    60	  verification).
    61	- Commit message bodies (each non-trivial commit
    62	  documents what changed and why).
    63	
    64	Adopters who want structured cross-session observability
    65	should consider the `autonomous-issue-dispatch` skill's
    66	WORKFLOW.md contract pattern + tracker integration (K-5
    67	in `../customization/contract.md`).
    68	# Operations — Safety Invariants
    69	
    70	MUST-numbered safety list per the Symphony §9.5 pattern
    71	(`file://../../research/primary-sources/symphony-spec.md`
    72	§3 — transferable building block 7). Each invariant is a
    73	hard rule the framework's tooling enforces or the
    74	adopter's discipline upholds.
    75	
    76	## Tooling-enforced (PreToolUse hooks)
    77	
    78	The framework's seven hooks in `../../hooks/` enforce:
    79	
    80	- **SI-1**: Commits MUST NOT contain AI-attribution
    81	  trailers (`Co-Authored-By: Claude`,
    82	  `Co-Authored-By: GPT-...`, or equivalent). Enforced
    83	  by `hooks/block-ai-attribution.sh`.
    84	- **SI-2**: Staging MUST be explicit by path. Bulk
    85	  staging (`git add .`, `git add -A`, `git add :/`) is
    86	  rejected. Enforced by `hooks/block-git-add-all.sh`.
    87	- **SI-3**: Verify gates MUST NOT be bypassed.
    88	  `--no-verify` / `VERIFY_SKIP=1` / equivalent flags
    89	  are rejected. Enforced by `hooks/block-verify-bypass.sh`.
    90	- **SI-4**: The protected branch (default `main`) MUST
    91	  NOT receive direct pushes unless an active SPEC at
    92	  status `approved` / `in-execution` / `verified` /
    93	  `closed` declares `branch_policy: main-direct`.
    94	  Enforced by `hooks/block-push-to-main.sh`.
    95	- **SI-5**: Edits on the protected branch MUST honour
    96	  the same `branch_policy: main-direct` rule. Enforced
    97	  by `hooks/block-edit-on-main.sh`.
    98	
    99	## Lifecycle-enforced (owner-only authority)
   100	
   101	- **SI-6**: Status transitions `approved`,
   102	  `decomposed`, `closed` MUST be set only by the owner.
   103	  No skill, agent, or automation may flip these.
   104	  Enforced procedurally by skill rules and reviewable
   105	  in commit messages.
   106	- **SI-7**: Spec authoring artefacts MUST NOT contain
   107	  uncited factual claims. Enforced by
   108	  `scripts/lint-spec.sh`.
   109	- **SI-8**: Contract SPECs MUST pass `lint-spec.sh`
   110	  exit 0. Enforced by the §10.3 Contract gate +
   111	  CI's `lint-spec` job.
   112	
   113	## Discipline-upheld (no mechanical enforcement)
   114	
   115	- **SI-9**: Cross-family review SHOULD be performed
   116	  for every Contract SPEC's approved-pending-owner →
   117	  approved transition. Same-family proxy is
   118	  acceptable with explicit caveat recorded; external
   119	  cross-family pass is the rigorous default.
   120	- **SI-10**: Open Questions MUST be either resolved
   121	  or marked `owner-blocking` before
   122	  `approved-pending-owner` is reached. Reviewer
   123	  enforces.
   124	- **SI-11**: Workpads (AGENT_FEEDBACK.md,
   125	  SESSION_JOURNAL.md, AGENT_INBOX.md) MUST NOT carry
   126	  secrets or third-party private data. Adopter
   127	  responsibility.
   128	- **SI-12**: Public OSS repos MUST gitignore any
   129	  agent-control surface that contains studio-specific
   130	  context. Adopter responsibility; the framework
   131	  provides the gitignore patterns at
   132	  `../../scripts/fleet-oss-gitignore.example.txt`.
   133	
   134	## Violation handling
   135	
   136	Tooling-enforced violations (SI-1 through SI-5, SI-7,
   137	SI-8) result in non-zero exit codes and visible block
   138	messages. The agent or user MUST address the violation
   139	before proceeding.
   140	
   141	Lifecycle-enforced violations (SI-6) are caught at
   142	review time; an unauthorised status flip is reverted
   143	and the agent / skill that performed it is corrected.
   144	
   145	Discipline-upheld violations (SI-9 through SI-12) are
   146	caught at review or by adopter audit; remediation is
   147	context-specific.
   148	
   149	## See also
   150	
   151	- `../../OPERATING_MODEL.md` for the lifecycle and the
   152	  owner-only authority binding.
   153	- `../customization/contract.md` for which invariants
   154	  the adopter MAY relax (K-2 hook activation set) vs
   155	  which are immutable.
   156	- `failures.md` for the failure-class × recovery
   157	  matrix that accompanies these invariants.
   158	# Quality — 12-Factor Overlay
   159	
   160	Per the 12-factor methodology
   161	(`file://../../research/primary-sources/12-factor.md`
   162	§3). The framework itself is not a SaaS app, so this
   163	overlay describes the per-factor posture for adopter
   164	products operated under the framework — NOT the
   165	framework's own internals.
   166	
   167	| Factor | Title | Adopter posture under the framework |
   168	|---|---|---|
   169	| I | Codebase | One repo per product; the framework's `cross-repo-policy-enforcement` skill applies if the adopter operates a multi-repo fleet |
   170	| II | Dependencies | Declared explicitly per `../deployment/requirements.md` |
   171	| III | Config | Stored in environment per Factor III headline; the customization grammar (`../customization/`) extends this for application-domain knobs (Factor III only covers operating-system-boundary knobs) |
   172	| IV | Backing Services | Adopter-specific; the framework is agnostic |
   173	| V | Build, Release, Run | The framework's spec lifecycle (Preflight → … → Verify → Report+Close) is the release pattern; build artefacts are adopter-specific |
   174	| VI | Processes | Adopter-specific; the framework does not impose stateless-process semantics |
   175	| VII | Port Binding | Adopter-specific |
   176	| VIII | Concurrency | Adopter-specific |
   177	| IX | Disposability | The hook test harness's hermetic sandbox pattern (`../../tests/hooks/run-tests.sh`) exemplifies disposability for tests; adopters apply the same posture to their own test harnesses |
   178	| X | Dev/Prod Parity | Adopter-specific; the framework's mechanical-verifiability quality goal supports it |
   179	| XI | Logs | Adopter-specific; the framework's `session-start-context.sh` hook emits structured context as a per-session log |
   180	| XII | Admin Processes | Adopter-specific |
   181	
   182	## Scope
   183	
   184	The framework's role in 12-factor adoption is
   185	**operating-model**, not **runtime**. Adopters who want
   186	12-factor conformance for their products combine:
   187	
   188	- The framework's discipline (spec-first, citation
   189	  grammar, lifecycle, hooks).
   190	- Their language/runtime-specific 12-factor tooling
   191	  (env-var libs, process supervisors, log routers,
   192	  etc.).
   193	
   194	The framework does NOT bundle 12-factor tooling. See
   195	also `../non-goals/INDEX.md` Q "the framework does not
   196	provide runtime libraries."

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git log --oneline --decorate --max-count=12' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
5f59f7b (HEAD -> main, tag: v2.0.0, origin/main) spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled
1104e3a feat(v2.0)!: repack into manifest+catalog packaging
be0f503 spec(execute): Slice 2 -> in-execution; owner directive 2026-05-18 'yes go'
7335c87 spec: Product A v2.0 repack -- Contract SPEC (Slice 2)
2098e35 (tag: v1.1) feat: v1.1 — six new skills, cross-repo patterns, contributor docs
63355d7 (tag: v1.0) fix(examples): scrub lowercase RFC 2119 advisory in Decision example §12
c24c76c feat(v1.0): release foundations — CI, hook test harness, CHANGELOG, dogfooding SPEC
9bdc182 feat(skills): add 4 front-of-lifecycle skills (10 → 14 total)
8957cf7 feat(skills): add 4 more skills — 2 lifecycle phases + 2 abstract patterns
36ebfb0 feat(examples): add TASK.md decomposition example for the webhook-signing Contract
8184431 feat(examples): add worked Fastpath SPEC example
93b9f24 docs: expand OPERATING_MODEL.md with universal procedural content

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --summary --find-renames 5f59f7b --' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
commit 5f59f7b9d0b33c82c46a727574a81c645a33e823
Author: HasNoBeef <alaindormehl@gmail.com>
Date:   Mon May 18 20:20:36 2026 -0700

    spec(verify): Slice 2 v2.0 repack -> verified; Completion Report filled
    
    Files: 60 changed (24 created + 33 renamed + 4 modified). Five
    CI jobs green on commit 1104e3a; 33/33 hook tests; 7/7 example
    lint clean; validate-manifest PASS (8 facets); preflight clean.
    
    Completion Report S19 filled durably with files, commands,
    verification result, residual risk (scaffold-grade conformance/
    decisions content reserved for v2.x; cross-reference rot in
    historical specs/ unaddressed; same-family review caveat;
    no symlink shims), and 4 spec-evidence candidates (manifest+
    catalog practical for OSS frameworks; scaffold-grade content
    honest at boundary; git-mv preserves history through repack;
    validate-manifest authored before primaries TDD-style).
    
    Owner alone flips verified -> closed after a spec-evidence-
    governance pass.
    
    Tag v2.0.0 follows this commit.

 .../2026-05-19-v2-manifest-catalog-repack/SPEC.md  | 199 +++++++++++++++++++--
 1 file changed, 183 insertions(+), 16 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --summary --find-renames 1104e3a --' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
commit 1104e3a5f09e5c88ae665698442d3b53e9cb684a
Author: HasNoBeef <alaindormehl@gmail.com>
Date:   Mon May 18 20:17:53 2026 -0700

    feat(v2.0)!: repack into manifest+catalog packaging
    
    BREAKING CHANGE: top-level layout reorganized into front-door
    manifest + eight per-facet sub-spec catalog under spec-bundle/.
    v1.1 tag unaffected; consumers pinning main update paths per
    CHANGELOG v2.0 migration index.
    
    Authority: parent Decision SPEC at bes-fleet-policy/specs/
    2026-05-18-agentic-installation-methodology/SPEC.md S7 (Hybrid
    longread + SPEC bundle shape; paired Product A v2.0 + Product B
    v1.0 release) and slice 2 Contract SPEC at specs/2026-05-19-v2-
    manifest-catalog-repack/SPEC.md.
    
    Layout changes (v1.x -> v2.0):
    - schema/SPEC.schema.md       -> spec-bundle/schema/
    - templates/*                 -> spec-bundle/templates/
    - skills/<name>/              -> spec-bundle/skills/<name>/
    - workflow/UNIVERSAL.md       -> spec-bundle/operations/workflow-universal.md
    - workpads/*                  -> spec-bundle/templates/workpads/
    - docs/ (empty)               -> removed
    
    New v2.0 artefacts:
    - spec-bundle/manifest.yaml — front-door manifest (spec_version,
      bundle_version, conformance_profile, intent, facets, resources,
      signature placeholder)
    - scripts/validate-manifest.sh — mechanical completeness gate
    - spec-bundle/{architecture,deployment,behavior,customization,
      decisions,quality,operations,non-goals}/ — eight per-facet
      sub-specs, each with primary file(s) grounded in primary-
      source corpus entries:
      - arc42 §3+§4 -> architecture/CONTEXT.md + solution-strategy.md
      - 12-factor Factor II -> deployment/requirements.md
      - Gherkin -> behavior/features/*.feature
      - Helm values-schema -> customization/{contract.md,knobs.schema.json}
      - Nygard ADR -> decisions/INDEX.md (per-ADR files reserved for v2.x)
      - arc42 §10 + 12-factor overlay -> quality/{requirements.md,12-factor-overlay.md}
      - Symphony §13+§14+§9.5 -> operations/{failures.md,observability.md,safety-invariants.md}
      - research §4.2 novel facet -> non-goals/INDEX.md
    - AGENTS.md at top-level — new entry doc per agents.md spec;
      CLAUDE.md imports via @AGENTS.md
    - CI: validate-manifest job added (5 jobs total)
    
    Tooling updates:
    - scripts/validate-skill-frontmatter.sh scans spec-bundle/skills/
      (was skills/)
    
    Reserved for v2.x slices:
    - Per-decision ADR artefacts (currently just the INDEX)
    - Structurizr DSL diagrams in architecture/
    - Executable conformance suite in spec-bundle/conformance/
    - Sigstore signing (signature.status: unsigned at v2.0)
    - Reference customization profiles
    
    All five CI jobs green locally:
    - lint-spec on 7 example artefacts -> 0 errors each
    - validate-skills -> clean (20 skills under spec-bundle/skills/)
    - test-hooks -> 33 pass / 0 fail
    - validate-manifest -> PASS 8 facets
    - preflight-self-check -> clean
    
    Posture: by adopting the methodology's recommended packaging on
    itself, v2.0 becomes the worked case study the sibling
    agentic-installation-methodology repo references. v2.0 ships
    scaffold-grade content in several facets; richer content lands
    in v2.x slices.

 .github/workflows/ci.yml                           |   8 +
 AGENTS.md                                          | 175 ++++++++++++++++++++
 CHANGELOG.md                                       | 113 +++++++++++++
 CLAUDE.md                                          |  81 ++++++++++
 README.md                                          | 178 +++++++++++++--------
 scripts/validate-manifest.sh                       | 174 ++++++++++++++++++++
 scripts/validate-skill-frontmatter.sh              |   6 +-
 spec-bundle/architecture/CONTEXT.md                |  81 ++++++++++
 spec-bundle/architecture/solution-strategy.md      |  81 ++++++++++
 .../features/hook-blocks-ai-attribution.feature    |  32 ++++
 .../features/lint-citation-grammar.feature         |  33 ++++
 spec-bundle/customization/contract.md              | 157 ++++++++++++++++++
 spec-bundle/customization/knobs.schema.json        | 149 +++++++++++++++++
 spec-bundle/decisions/INDEX.md                     |  40 +++++
 spec-bundle/deployment/install.md                  |  89 +++++++++++
 spec-bundle/deployment/requirements.md             |  51 ++++++
 spec-bundle/manifest.yaml                          |  61 +++++++
 spec-bundle/non-goals/INDEX.md                     | 118 ++++++++++++++
 spec-bundle/operations/failures.md                 | 144 +++++++++++++++++
 spec-bundle/operations/observability.md            |  67 ++++++++
 spec-bundle/operations/safety-invariants.md        |  90 +++++++++++
 .../operations/workflow-universal.md               |   0
 spec-bundle/quality/12-factor-overlay.md           |  39 +++++
 spec-bundle/quality/requirements.md                | 121 ++++++++++++++
 {schema => spec-bundle/schema}/SPEC.schema.md      |   0
 .../skills}/agent-feedback/SKILL.md                |   0
 .../skills}/agents-md-improver/SKILL.md            |   0
 .../skills}/approved-spec-decomposition/SKILL.md   |   0
 .../references/cross-validation-lanes.md           |   0
 .../skills}/autonomous-issue-dispatch/SKILL.md     |   0
 {skills => spec-bundle/skills}/caveman/SKILL.md    |   0
 .../skills}/code-review/SKILL.md                   |   0
 .../cross-repo-informational-channel/SKILL.md      |   0
 .../skills}/cross-repo-policy-enforcement/SKILL.md |   0
 {skills => spec-bundle/skills}/diagnosis/SKILL.md  |   0
 {skills => spec-bundle/skills}/fast-path/SKILL.md  |   0
 .../skills}/implementation-execution/SKILL.md      |   0
 .../skills}/owner-led-parallel-worktrees/SKILL.md  |   0
 {skills => spec-bundle/skills}/release-pr/SKILL.md |   0
 .../skills}/repo-orientation/SKILL.md              |   0
 .../skills}/spec-authoring/SKILL.md                |   0
 .../references/reference-architecture.md           |   0
 .../spec-authoring/references/studio-principles.md |   0
 .../skills}/spec-driven-development/SKILL.md       |   0
 .../references/capture-after-and-fastpath.md       |   0
 .../references/cascade-by-id-citation.md           |   0
 .../skills}/spec-evidence-governance/SKILL.md      |   0
 .../skills}/spec-review/SKILL.md                   |   0
 .../spec-review/references/per-type-gates.md       |   0
 {skills => spec-bundle/skills}/tdd/SKILL.md        |   0
 .../skills}/verification/SKILL.md                  |   0
 .../templates}/IDEA.template.md                    |   0
 .../templates}/SPEC.contract.template.md           |   0
 .../templates}/SPEC.decision.template.md           |   0
 .../templates}/SPEC.fastpath.template.md           |   0
 .../templates}/SPEC.task.template.md               |   0
 .../templates}/TASK.template.md                    |   0
 .../templates/workpads}/AGENT_FEEDBACK.template.md |   0
 .../templates/workpads}/AGENT_INBOX.template.md    |   0
 .../workpads}/SESSION_JOURNAL.template.md          |   0
 60 files changed, 2016 insertions(+), 72 deletions(-)
 create mode 100644 AGENTS.md
 create mode 100644 CLAUDE.md
 create mode 100755 scripts/validate-manifest.sh
 create mode 100644 spec-bundle/architecture/CONTEXT.md
 create mode 100644 spec-bundle/architecture/solution-strategy.md
 create mode 100644 spec-bundle/behavior/features/hook-blocks-ai-attribution.feature
 create mode 100644 spec-bundle/behavior/features/lint-citation-grammar.feature
 create mode 100644 spec-bundle/customization/contract.md
 create mode 100644 spec-bundle/customization/knobs.schema.json
 create mode 100644 spec-bundle/decisions/INDEX.md
 create mode 100644 spec-bundle/deployment/install.md
 create mode 100644 spec-bundle/deployment/requirements.md
 create mode 100644 spec-bundle/manifest.yaml
 create mode 100644 spec-bundle/non-goals/INDEX.md
 create mode 100644 spec-bundle/operations/failures.md
 create mode 100644 spec-bundle/operations/observability.md
 create mode 100644 spec-bundle/operations/safety-invariants.md
 rename workflow/UNIVERSAL.md => spec-bundle/operations/workflow-universal.md (100%)
 create mode 100644 spec-bundle/quality/12-factor-overlay.md
 create mode 100644 spec-bundle/quality/requirements.md
 rename {schema => spec-bundle/schema}/SPEC.schema.md (100%)
 rename {skills => spec-bundle/skills}/agent-feedback/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/agents-md-improver/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/approved-spec-decomposition/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/approved-spec-decomposition/references/cross-validation-lanes.md (100%)
 rename {skills => spec-bundle/skills}/autonomous-issue-dispatch/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/caveman/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/code-review/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/cross-repo-informational-channel/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/cross-repo-policy-enforcement/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/diagnosis/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/fast-path/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/implementation-execution/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/owner-led-parallel-worktrees/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/release-pr/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/repo-orientation/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/spec-authoring/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/spec-authoring/references/reference-architecture.md (100%)
 rename {skills => spec-bundle/skills}/spec-authoring/references/studio-principles.md (100%)
 rename {skills => spec-bundle/skills}/spec-driven-development/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/spec-driven-development/references/capture-after-and-fastpath.md (100%)
 rename {skills => spec-bundle/skills}/spec-driven-development/references/cascade-by-id-citation.md (100%)
 rename {skills => spec-bundle/skills}/spec-evidence-governance/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/spec-review/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/spec-review/references/per-type-gates.md (100%)
 rename {skills => spec-bundle/skills}/tdd/SKILL.md (100%)
 rename {skills => spec-bundle/skills}/verification/SKILL.md (100%)
 rename {templates => spec-bundle/templates}/IDEA.template.md (100%)
 rename {templates => spec-bundle/templates}/SPEC.contract.template.md (100%)
 rename {templates => spec-bundle/templates}/SPEC.decision.template.md (100%)
 rename {templates => spec-bundle/templates}/SPEC.fastpath.template.md (100%)
 rename {templates => spec-bundle/templates}/SPEC.task.template.md (100%)
 rename {templates => spec-bundle/templates}/TASK.template.md (100%)
 rename {workpads => spec-bundle/templates/workpads}/AGENT_FEEDBACK.template.md (100%)
 rename {workpads => spec-bundle/templates/workpads}/AGENT_INBOX.template.md (100%)
 rename {workpads => spec-bundle/templates/workpads}/SESSION_JOURNAL.template.md (100%)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git tag --list --format='%(refname:short) %(objectname:short) %(creatordate:iso8601)' | sort -V" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
v1.0 63355d7 2026-05-18 07:27:22 -0700
v1.1 396a8e4 2026-05-18 11:49:44 -0700
v2.0.0 f0c75fc 2026-05-18 20:20:36 -0700

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
validate-manifest: PASS — manifest schema 2.0.0, conformance core, 8 facets

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh spec-bundle/manifest.yaml' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 0ms:
spec-bundle/manifest.yaml:1: missing or unterminated YAML front-matter block
spec-bundle/manifest.yaml:0: missing type/implies_spec_type field
spec-bundle/manifest.yaml:7: fact-bearing paragraph lacks citation prefix
spec-bundle/manifest.yaml:24: fact-bearing paragraph lacks citation prefix
spec-bundle/manifest.yaml:50: fact-bearing paragraph lacks citation prefix
== lint-spec.sh summary ==
target:                spec-bundle/manifest.yaml
artefact / type:       spec / <unset>
sections (top-level):  0
citation-prefix hits:  0
lowercase 2119 hits:   0 (advisory only)
errors:                5
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 753ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  64
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

codex
One concrete gate problem surfaced: the target SPEC’s own `acceptance_commands` include `bash scripts/lint-spec.sh spec-bundle/manifest.yaml`, and that command currently fails. The CI workflow only runs `validate-manifest.sh`, so this slipped through the “verified” status.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/lint-spec.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# lint-spec.sh — v1 lint for IDEA.md and SPEC.md artefacts.
     3	#
     4	# Authority: file://OPERATING_MODEL.md §"Spec Lifecycle" and
     5	#   file://templates/SPEC.schema.md (citation grammar, RFC 2119
     6	#   scoping rules, front-matter schema).
     7	#
     8	# Behavior is non-mutating and offline. The script reads the target
     9	# file, prints a summary to stdout, prints diagnostics to stderr, and
    10	# exits with one of:
    11	#   0 — clean
    12	#   1 — blocking errors
    13	#   2 — advisory-only warnings
    14	#   64 — usage error
    15	#
    16	# Suppression markers (per SPEC.schema §2.5):
    17	#   <!-- lint-ok: no-citation --> on a paragraph silences the citation audit.
    18	#   <!-- lint-ok: no-rfc        --> on a line silences the lowercase RFC 2119 warning.
    19	
    20	set -eu
    21	
    22	PROG="$(basename "$0")"
    23	
    24	usage() {
    25	    printf 'usage: %s <path-to-IDEA.md-or-SPEC.md>\n' "$PROG" >&2
    26	    exit 64
    27	}
    28	
    29	[[ $# -eq 1 ]] || usage
    30	TARGET="$1"
    31	[[ -f "$TARGET" ]] || { printf '%s: not a file: %s\n' "$PROG" "$TARGET" >&2; exit 64; }
    32	
    33	BASENAME="$(basename "$TARGET")"
    34	
    35	errors=()
    36	warnings=()
    37	
    38	emit_err()  { errors+=("$1");  printf '%s:%s: %s\n' "$TARGET" "$2" "$3" >&2; }
    39	emit_warn() { warnings+=("$1"); printf '%s:%s: warning: %s\n' "$TARGET" "$2" "$3" >&2; }
    40	
    41	# ---------- Front-matter parse ----------
    42	fm_start=0; fm_end=0
    43	mapfile -t LINES < "$TARGET"
    44	total_lines=${#LINES[@]}
    45	
    46	if [[ $total_lines -gt 0 && "${LINES[0]}" == "---" ]]; then
    47	    fm_start=1
    48	    for ((i=1; i<total_lines; i++)); do
    49	        if [[ "${LINES[$i]}" == "---" ]]; then
    50	            fm_end=$((i+1))
    51	            break
    52	        fi
    53	    done
    54	fi
    55	
    56	if [[ $fm_start -eq 0 || $fm_end -eq 0 ]]; then
    57	    emit_err "front-matter" 1 "missing or unterminated YAML front-matter block"
    58	fi
    59	
    60	declare -A FM
    61	if [[ $fm_end -gt 0 ]]; then
    62	    for ((i=1; i<fm_end-1; i++)); do
    63	        line="${LINES[$i]}"
    64	        [[ "$line" =~ ^[[:space:]]*# ]] && continue
    65	        [[ -z "${line// }" ]] && continue
    66	        [[ "$line" =~ ^[[:space:]]*-[[:space:]] ]] && continue
    67	        if [[ "$line" =~ ^([A-Za-z_][A-Za-z0-9_]*):[[:space:]]*(.*)$ ]]; then
    68	            key="${BASH_REMATCH[1]}"
    69	            val="${BASH_REMATCH[2]}"
    70	            val="${val%%[[:space:]]#*}"
    71	            FM[$key]="$val"
    72	        fi
    73	    done
    74	fi
    75	
    76	# ---------- Type detection ----------
    77	ARTEFACT="spec"
    78	[[ "$BASENAME" == "IDEA.md" ]] && ARTEFACT="idea"
    79	
    80	if [[ "$ARTEFACT" == "idea" ]]; then
    81	    TYPE="${FM[implies_spec_type]:-}"
    82	else
    83	    TYPE="${FM[type]:-}"
    84	fi
    85	case "$TYPE" in
    86	    task|contract|decision|fastpath) ;;
    87	    "") emit_err "front-matter" "$fm_end" "missing type/implies_spec_type field" ;;
    88	    *)  emit_err "front-matter" "$fm_end" "unknown type: $TYPE" ;;
    89	esac
    90	
    91	# ---------- Required-section presence ----------
    92	# Per SPEC.schema §4.1, section IDENTITY is its title; section number is
    93	# informational. We strip leading "<digits>. " from both required and
    94	# observed before comparing.
    95	required_sections=()
    96	case "$ARTEFACT-$TYPE" in
    97	    idea-*)
    98	        required_sections=(
    99	            "Normative Language"
   100	            "Problem Seed"
   101	            "Substance Citations"
   102	            "Constraints & Non-Negotiables"
   103	            "Approaches Considered"
   104	            "Recommendation"
   105	            "Open Questions for Owner"
   106	            "Owner Judgments"
   107	        ) ;;
   108	    spec-task)
   109	        required_sections=(
   110	            "Normative Language"
   111	            "Problem" "North Star / Product Promise" "Goals" "Non-Goals"
   112	            "Current System Facts" "Authority Map" "Code/Docs Reality Check"
   113	            "Desired Behavior" "Domain Model / Contract" "Interfaces and Files"
   114	            "Execution Plan" "Safety / Scope Invariants" "Test Plan"
   115	            "Acceptance Criteria" "Rollback Plan" "Open Questions"
   116	            "Completion Report"
   117	        ) ;;
   118	    spec-contract)
   119	        # "Open Questions" is OPTIONAL when empty — omitted from the
   120	        # required list. Authors MAY drop the heading entirely when no
   121	        # open questions remain. Existing Contracts that retain the
   122	        # section with substantive content remain unaffected (existing
   123	        # per-section citation checks still apply when present).
   124	        required_sections=(
   125	            "Normative Language"
   126	            "Problem Statement" "Goals and Non-Goals" "System Overview"
   127	            "Authority Map" "Code/Docs Reality Check" "Domain Model"
   128	            "Schema Specification" "Reference Algorithms" "Failure Model"
   129	            "Trust Boundary / Security" "Observability"
   130	            "Test and Validation Matrix" "Implementation Checklist"
   131	            "Acceptance Criteria" "Rollback Plan"
   132	            "Completion Report"
   133	        )
   134	        # Per Decision SPEC §7 (d), capture-after defer-shorthand for §1
   135	        # Problem Statement and §13 Test and Validation Matrix is
   136	        # PERMITTED only when front-matter status: verified AND the
   137	        # producing IDEA is cited. Enforcement note: the existing §2
   138	        # citation-grammar rule already requires every fact-bearing
   139	        # paragraph to carry a cite, so a single-paragraph
   140	        # file://specs/<id>/IDEA.md cite in §1 or §13 passes lint by
   141	        # construction. The "shorthand requires verified" check lives
   142	        # in the spec-review skill (per-type gate), not in this lint,
   143	        # to keep the script's conditional logic small.
   144	        ;;
   145	    spec-decision)
   146	        required_sections=(
   147	            "Problem" "Substance Citations" "Authority Map"
   148	            "Decision Criteria" "Candidate Options" "Trade-off Comparison"
   149	            "Decision Statement" "Decision Rationale" "Locks"
   150	            "Reversal Plan" "Validation Plan" "Acceptance Criteria"
   151	            "Open Questions" "Completion Report"
   152	        ) ;;
   153	    spec-fastpath)
   154	        # Fastpath SPECs are intentionally minimal. Required sections only.
   155	        required_sections=(
   156	            "Normative Language"
   157	            "Problem" "Files changed" "Owner directive"
   158	            "Acceptance commands" "Completion Report"
   159	        ) ;;
   160	esac
   161	
   162	# Strip "<digits or digits.digits>. " prefix from a section title.
   163	strip_section_number() {
   164	    local t="$1"
   165	    if [[ "$t" =~ ^[0-9]+(\.[0-9]+)*[.][[:space:]]+(.*)$ ]]; then
   166	        printf '%s' "${BASH_REMATCH[2]}"
   167	    else
   168	        printf '%s' "$t"
   169	    fi
   170	}
   171	
   172	# Collect observed top-level (## ) section titles, with line numbers.
   173	observed_titles=()
   174	observed_title_lines=()
   175	for ((i=fm_end; i<total_lines; i++)); do
   176	    line="${LINES[$i]}"
   177	    if [[ "$line" =~ ^##[[:space:]](.+)$ ]]; then
   178	        title="${BASH_REMATCH[1]}"
   179	        observed_titles+=("$title")
   180	        observed_title_lines+=($((i+1)))
   181	    fi
   182	done
   183	
   184	section_present() {
   185	    local needle="$1" t bare_needle bare_t
   186	    bare_needle="$(strip_section_number "$needle")"
   187	    for t in "${observed_titles[@]:-}"; do
   188	        bare_t="$(strip_section_number "$t")"
   189	        # Title-only prefix match: handles "Implementation Checklist
   190	        # (Definition of Done)" matching "Implementation Checklist" and
   191	        # similar parenthetical extensions.
   192	        [[ "$bare_t" == "$bare_needle" || "$bare_t" == "$bare_needle "* || "$bare_t" == "$bare_needle("* ]] && return 0
   193	    done
   194	    return 1
   195	}
   196	
   197	for s in "${required_sections[@]:-}"; do
   198	    if ! section_present "$s"; then
   199	        emit_err "section" "$fm_end" "missing required section: ## $s"
   200	    fi
   201	done
   202	
   203	# ---------- Build per-section line ranges ----------
   204	section_starts=()
   205	section_ends=()
   206	section_titles_all=()
   207	for ((idx=0; idx<${#observed_titles[@]}; idx++)); do
   208	    section_titles_all+=("${observed_titles[$idx]}")
   209	    section_starts+=($((observed_title_lines[$idx]-1)))
   210	done
   211	for ((idx=0; idx<${#section_starts[@]}; idx++)); do
   212	    if (( idx+1 < ${#section_starts[@]} )); then
   213	        section_ends+=($((section_starts[idx+1]-1)))
   214	    else
   215	        section_ends+=($((total_lines-1)))
   216	    fi
   217	done
   218	
   219	is_normative_title() {
   220	    local t="$1"
   221	    case "$t" in
   222	        *"Desired Behavior"*|*"Acceptance Criteria"*|*"Test Plan"*|*"Test and Validation Matrix"*|\
   223	        *"Decision Statement"*|*"Constraints"*|*"Safety"*|*"Goals"*|*"Non-Goals"*|\
   224	        *"Implementation Checklist"*|"Normative Language") return 0 ;;
   225	    esac
   226	    return 1
   227	}
   228	
   229	strip_code() {
   230	    awk 'BEGIN{ORS=""} {
   231	        s=$0; out="";
   232	        while ((p=index(s,"`"))>0) {
   233	            out=out substr(s,1,p-1);
   234	            s=substr(s,p+1);
   235	            q=index(s,"`");
   236	            if (q>0) { s=substr(s,q+1); } else { out=out s; s=""; break; }
   237	        }
   238	        print out s;
   239	    }' <<< "$1"
   240	}
   241	
   242	# Find the body H1 title region (the first `# ` heading after front-matter
   243	# and the immediately-following paragraph). Citation audit skips these.
   244	h1_para_start=-1; h1_para_end=-1
   245	for ((i=fm_end; i<total_lines; i++)); do
   246	    line="${LINES[$i]}"
   247	    if [[ "$line" =~ ^#[[:space:]](.+)$ && ! "$line" =~ ^## ]]; then
   248	        # Found body H1. Title region = from line after H1 through next blank
   249	        # line (or first ## section header, whichever is first).
   250	        for ((j=i+1; j<total_lines; j++)); do
   251	            jline="${LINES[$j]}"
   252	            [[ "$jline" =~ ^## ]] && break
   253	            if [[ -z "${jline// }" ]]; then
   254	                # Skip leading blank, then the next paragraph IS the title region.
   255	                k=$j
   256	                while (( k<total_lines )) && [[ -z "${LINES[$k]// }" ]]; do k=$((k+1)); done
   257	                h1_para_start=$k
   258	                while (( k<total_lines )) && [[ -n "${LINES[$k]// }" ]]; do
   259	                    [[ "${LINES[$k]}" =~ ^## ]] && break
   260	                    h1_para_end=$k

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"(file://)?(schema/SPEC\\.schema\\.md|templates/|skills/|workflow/UNIVERSAL\\.md|workpads/)\" --glob '"'!spec-bundle/schema/SPEC.schema.md'"' --glob '"'!spec-bundle/templates/**'"' --glob '"'!spec-bundle/skills/**'"' --glob '"'!spec-bundle/operations/workflow-universal.md'"'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
CHANGELOG.md:68:  - `schema/SPEC.schema.md` → `spec-bundle/schema/SPEC.schema.md`
CHANGELOG.md:69:  - `templates/*.template.md` → `spec-bundle/templates/*.template.md`
CHANGELOG.md:70:  - `skills/<name>/` → `spec-bundle/skills/<name>/`
CHANGELOG.md:71:  - `workflow/UNIVERSAL.md` → `spec-bundle/operations/workflow-universal.md`
CHANGELOG.md:72:  - `workpads/*.template.md` → `spec-bundle/templates/workpads/*.template.md`
CHANGELOG.md:75:  scan `spec-bundle/skills/` (was `skills/`).
CHANGELOG.md:149:- **`workpads/AGENT_INBOX.template.md`** — the inbound channel
CHANGELOG.md:210:skills + workflow/UNIVERSAL.md + workpads templates + a
README.md:50:| `spec-bundle/schema/SPEC.schema.md` | The schema every IDEA/SPEC/TASK conforms to |
README.md:51:| `spec-bundle/templates/` | IDEA + 4 SPEC type templates + TASK template + workpad templates |
README.md:52:| `spec-bundle/skills/` | Twenty skills covering the full lifecycle + multi-repo patterns + meta-skills |
README.md:58:old top-level `schema/`, `templates/`, `skills/`, `workflow/`,
README.md:59:and `workpads/` has moved under `spec-bundle/`:
README.md:63:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` |
README.md:64:| `templates/*.template.md` | `spec-bundle/templates/*.template.md` |
README.md:65:| `skills/<name>/` | `spec-bundle/skills/<name>/` |
README.md:66:| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` |
README.md:67:| `workpads/*.template.md` | `spec-bundle/templates/workpads/*.template.md` |
CLAUDE.md:11:4. Read `spec-bundle/schema/SPEC.schema.md` — the
CLAUDE.md:24:| Schema | `spec-bundle/schema/SPEC.schema.md` |
CLAUDE.md:25:| Templates (IDEA, SPEC types, TASK) | `spec-bundle/templates/` |
CLAUDE.md:26:| Skills catalog (20 skills) | `spec-bundle/skills/` |
CLAUDE.md:27:| Workpad templates (AGENT_FEEDBACK, etc.) | `spec-bundle/templates/workpads/` |
CLAUDE.md:35:`schema/`, `templates/`, `skills/`, `workflow/`,
CLAUDE.md:36:`workpads/` has moved under `spec-bundle/`. See
CLAUDE.md:63:`spec-bundle/skills/` is the canonical surface for
AGENTS.md:31:4. **`spec-bundle/schema/SPEC.schema.md`** — the schema
AGENTS.md:107:`spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly.
CONTRIBUTING.md:22:2. **Read `schema/SPEC.schema.md`** — the citation grammar
CONTRIBUTING.md:28:   using `templates/IDEA.template.md`. The IDEA covers
spec-bundle/manifest.yaml:52:    path: "schema/SPEC.schema.md"
spec-bundle/manifest.yaml:54:    path: "templates/"
spec-bundle/manifest.yaml:56:    path: "skills/"
OPERATING_MODEL.md:170:Report filled. Reference: `schema/SPEC.schema.md` §1.3.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:97:- Removing v1.1's `skills/` content (skills are a
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:99:  `spec-bundle/skills/` per the new layout).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:137:│   ├── skills/                        # the framework's own skills (was /skills/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:138:│   ├── templates/                     # SPEC templates (was /templates/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:147:├── workpads/                          # workpad templates (unchanged)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:175:- `file://schema/SPEC.schema.md` — citation grammar,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:247:(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:306:    path: "schema/SPEC.schema.md"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:308:    path: "templates/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:310:    path: "skills/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:481:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:482:| `templates/` | `spec-bundle/templates/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:483:| `skills/` | `spec-bundle/skills/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:489:| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:490:| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:532:`templates/`, `skills/`, `workflow/`, `workpads/` will need
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:768:- [ ] Q1: Should `spec-bundle/skills/` (relocated from
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:769:      `skills/`) require any content sanitization
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:807:  symlinks from old paths (`schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:808:  `spec-bundle/schema/SPEC.schema.md`) to ease
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:840:- `schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:841:  `spec-bundle/schema/SPEC.schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:842:- `templates/*.template.md` (6 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:843:  `spec-bundle/templates/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:844:- `skills/<name>/SKILL.md` (20 skills) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:845:  `spec-bundle/skills/<name>/SKILL.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:846:- `skills/<name>/references/*.md` (4 references) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:847:  `spec-bundle/skills/<name>/references/*.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:848:- `workflow/UNIVERSAL.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:850:- `workpads/*.template.md` (3 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:851:  `spec-bundle/templates/workpads/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:860:  `spec-bundle/skills/` (was `skills/`)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:874:  `workpads spec-bundle/templates/workpads`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:875:- `cmd://mv workflow/UNIVERSAL.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:886:  exit 0 (clean; 20 skills under spec-bundle/skills/).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:926:  `file://templates/...`, `file://skills/...` paths
specs/2026-05-18-v1.0-release-foundations/SPEC.md:102:- `cmd://ls skills/` → 14 skill directories.
spec-bundle/customization/contract.md:19:  (`file://../templates/`).
spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
spec-bundle/customization/contract.md:50:adopts in their repo's `.agents/skills/` (or equivalent).
spec-bundle/customization/contract.md:111:(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:83:execution per `file://workflow/UNIVERSAL.md` "Universal
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:155:journal per `file://workflow/UNIVERSAL.md` Step 1.
spec-bundle/deployment/install.md:26:cp -r spec-bundle/skills     "$TARGET/.agents/skills/"
spec-bundle/deployment/install.md:32:#    file://../skills/agents-md-improver/SKILL.md
spec-bundle/deployment/install.md:45:(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
spec-bundle/deployment/install.md:46:`file://../skills/cross-repo-informational-channel/SKILL.md`)
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:80:execution per `file://workflow/UNIVERSAL.md` "Universal
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:158:journal per `file://workflow/UNIVERSAL.md` Step 1.
spec-bundle/architecture/solution-strategy.md:18:   `../schema/SPEC.schema.md` §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:9:    And the schema at spec-bundle/schema/SPEC.schema.md
spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
spec-bundle/architecture/CONTEXT.md:29:- A skill catalog (`file://../skills/`) covering the
scripts/fleet-skills.example.txt:1:# Skills your fleet-sync propagates to .agents/skills/ and mirrors to
scripts/fleet-skills.example.txt:2:# .claude/skills/ in each target repo. One skill name per line.
scripts/fleet-sync.sh:9:#   agents/scripts/fleet-skills.txt         — skill names (mirrored to .claude/skills/)
scripts/fleet-sync.sh:55:    mkdir -p "$TARGET/.agents/skills/$skill"
scripts/fleet-sync.sh:59:    mkdir -p "$TARGET/.claude/skills/$skill"
scripts/fleet-sync.sh:84:# If a per-tool config template is propagated under .agents/templates/
scripts/fleet-sync.sh:88:if [ -f "$TARGET/.agents/templates/wt.toml.template" ]; then
scripts/fleet-sync.sh:89:    cp "$TARGET/.agents/templates/wt.toml.template" "$TARGET/.config/wt.toml"
scripts/fleet-sync.sh:96:    cp "$TARGET/.agents/templates/SESSION_JOURNAL.template.md" "$TARGET/SESSION_JOURNAL.md"
scripts/fleet-sync.sh:99:    cp "$TARGET/.agents/templates/AGENT_FEEDBACK.template.md" "$TARGET/AGENT_FEEDBACK.md"
scripts/fleet-sync.sh:102:    cp "$TARGET/.agents/templates/AGENT_INBOX.template.md" "$TARGET/AGENT_INBOX.md"
scripts/fleet-sync.sh:112:        SOURCE_BODY="$TARGET/.agents/templates/WORKFLOW.body.md"
scripts/fleet-sync.sh:152:# .claude/ skills (mirrored from agents/skills/). Mirror SKILL.md plus
scripts/fleet-sync.sh:156:    cp "$SOURCE/agents/skills/$skill/SKILL.md" "$TARGET/.claude/skills/$skill/SKILL.md"
scripts/fleet-sync.sh:157:    if [ -d "$SOURCE/agents/skills/$skill/references" ]; then
scripts/fleet-sync.sh:158:        mkdir -p "$TARGET/.claude/skills/$skill/references"
scripts/fleet-sync.sh:159:        cp "$SOURCE/agents/skills/$skill/references/"*.md "$TARGET/.claude/skills/$skill/references/"
scripts/fleet-sync.sh:203:        STAGE+=(".claude/skills/$skill/SKILL.md")
scripts/fleet-sync.sh:204:        if [ -d "$TARGET/.claude/skills/$skill/references" ]; then
scripts/fleet-sync.sh:207:            done < <(cd "$TARGET" && find ".claude/skills/$skill/references" -type f -name '*.md')
scripts/validate-skill-frontmatter.sh:6:#   spec-bundle/skills/  (framework source as of v2.0; was skills/ in v1.x)
scripts/validate-skill-frontmatter.sh:7:#   .claude/skills/      (Claude Code mirror, if present)
scripts/validate-skill-frontmatter.sh:48:scan_dir spec-bundle/skills/
scripts/fleet-files.example.txt:32:# skills/code-review/SKILL.md
scripts/fleet-files.example.txt:33:# skills/diagnosis/SKILL.md
scripts/fleet-files.example.txt:34:# skills/release-pr/SKILL.md
scripts/fleet-files.example.txt:35:# skills/spec-evidence-governance/SKILL.md
scripts/fleet-files.example.txt:36:# skills/tdd/SKILL.md
scripts/fleet-files.example.txt:37:# skills/verification/SKILL.md
scripts/send-fleet-message.sh:16:#   file://skills/cross-repo-informational-channel/SKILL.md
scripts/send-fleet-message.sh:17:#   file://skills/cross-repo-informational-channel/SKILL.md
scripts/send-fleet-message.sh:18:#   file://workpads/AGENT_INBOX.template.md
scripts/send-fleet-message.sh:24:TEMPLATE_PATH="$SOURCE_DIR/agents/templates/AGENT_INBOX.template.md"
scripts/audit-fleet-compliance.sh:12:#   file://skills/cross-repo-policy-enforcement/SKILL.md
scripts/audit-entry-docs.sh:15:#   file://agents/skills/agents-md-improver/SKILL.md (policy doc)
scripts/audit-entry-docs.sh:79:        printf '%s/SESSION_JOURNAL.md:1: ADVISORY — missing SESSION_JOURNAL.md (universal workpad; auto-bootstrapped on next fleet-sync from .agents/templates/SESSION_JOURNAL.template.md)\n' "$repo_name" >&2
scripts/audit-entry-docs.sh:84:        printf '%s/AGENT_FEEDBACK.md:1: ADVISORY — missing AGENT_FEEDBACK.md (feedback channel; auto-bootstrapped on next fleet-sync from .agents/templates/AGENT_FEEDBACK.template.md)\n' "$repo_name" >&2
scripts/audit-entry-docs.sh:89:        printf '%s/AGENT_INBOX.md:1: ADVISORY — missing AGENT_INBOX.md (incoming message channel; auto-bootstrapped on next fleet-sync from .agents/templates/AGENT_INBOX.template.md)\n' "$repo_name" >&2
scripts/audit-entry-docs.sh:100:        # the fleet-baseline prompt body from agents/templates/WORKFLOW.body.md
scripts/audit-entry-docs.sh:119:            printf '%s/WORKFLOW.md:1: BLOCKING — fleet-baseline body drift; missing marker(s):%s. Body source: agents/templates/WORKFLOW.body.md (or .agents/templates/WORKFLOW.body.md). Recompose: per-repo YAML + intro + fleet body verbatim.\n' "$repo_name" "$missing_markers" >&2
scripts/lint-spec.sh:5:#   file://templates/SPEC.schema.md (citation grammar, RFC 2119

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"file://(\\.\\./\\.\\./)?research/primary-sources|research/primary-sources\" spec-bundle specs AGENTS.md README.md CHANGELOG.md OPERATING_MODEL.md scripts hooks tests examples | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
CHANGELOG.md:91:`research/primary-sources/<slug>.md`. The corpus is the
AGENTS.md:38:   `../agentic-installation-methodology/research/primary-sources/`
AGENTS.md:149:(`../agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:34:`research/primary-sources/<slug>.md` corpus.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:52:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:54:`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:73:  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:180:- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:182:- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:184:- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:186:- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:188:- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:190:- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:192:- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:194:- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:196:- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:198:- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:239:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:318:  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:328:   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:344:  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:348:  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:351:  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:355:  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:365:  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:376:  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:382:  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:395:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:405:`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:422:Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:429:  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:437:  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:675:  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
spec-bundle/non-goals/INDEX.md:3:The second novel facet per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/non-goals/INDEX.md:20:  `file://../../research/primary-sources/c4-model.md` §3.
spec-bundle/non-goals/INDEX.md:112:Per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/customization/contract.md:3:The novel facet per research §4.1 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/customization/contract.md:6:(`file://../../research/primary-sources/helm-values-schema.md`
spec-bundle/quality/12-factor-overlay.md:4:(`file://../../research/primary-sources/12-factor.md`
spec-bundle/quality/requirements.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
spec-bundle/quality/requirements.md:119:  `file://../../research/primary-sources/12-factor.md` §3.
spec-bundle/operations/safety-invariants.md:4:(`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/operations/failures.md:5:(`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/decisions/INDEX.md:4:template (`file://../../research/primary-sources/adr-nygard.md`
spec-bundle/decisions/INDEX.md:31:  (`file://../../research/primary-sources/adr-nygard.md`
spec-bundle/decisions/INDEX.md:36:  (`file://../../research/primary-sources/adr-tools-state.md`
spec-bundle/behavior/features/lint-citation-grammar.feature:3:  (file://../../../research/primary-sources/cucumber-gherkin.md §3)
spec-bundle/operations/observability.md:4:(`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/architecture/solution-strategy.md:4:(`file://../../research/primary-sources/arc42.md` §3).
spec-bundle/architecture/solution-strategy.md:61:`file://../../research/primary-sources/arc42.md` §3):
spec-bundle/architecture/solution-strategy.md:79:`file://../../research/primary-sources/c4-model.md` §3),
spec-bundle/deployment/requirements.md:4:(`file://../../research/primary-sources/12-factor.md` §3):
spec-bundle/deployment/requirements.md:32:  (`file://../../research/primary-sources/symphony-spec.md` §3).
spec-bundle/deployment/requirements.md:49:products (`file://../../research/primary-sources/nix-flakes.md`
spec-bundle/architecture/CONTEXT.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
spec-bundle/architecture/CONTEXT.md:6:(`file://../../research/primary-sources/c4-model.md` §3),
spec-bundle/architecture/CONTEXT.md:12:`research/primary-sources/`. Cross-repo `file://` paths in
spec-bundle/architecture/CONTEXT.md:76:  (`file://../../research/primary-sources/symphony-spec.md`

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "conformance|partial|signature|SBOM|schema URI|hash|content-hash|digest|provenance|reserved for v2|reserved" spec-bundle specs README.md CHANGELOG.md scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
scripts/validate-manifest.sh:12:# 3. conformance_profile is one of {core, extension, real-integration}.
scripts/validate-manifest.sh:32:RESOURCE_DIRS=("schema" "templates" "skills" "conformance")
scripts/validate-manifest.sh:52:actual_conformance="$(get_field 'conformance_profile')"
scripts/validate-manifest.sh:59:# 3. conformance_profile valid.
scripts/validate-manifest.sh:60:if ! printf '%s\n' $VALID_PROFILES | grep -qFx "$actual_conformance"; then
scripts/validate-manifest.sh:61:    err "conformance_profile invalid: got '$actual_conformance'; expected one of {$VALID_PROFILES}"
scripts/validate-manifest.sh:172:printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
scripts/validate-manifest.sh:173:    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
CHANGELOG.md:23:  `bundle_version`, `conformance_profile`, `intent` block
CHANGELOG.md:25:  authority), eight `facets` entries, and a reserved
CHANGELOG.md:26:  `signature` field for v2.x Sigstore signing.
CHANGELOG.md:29:  conformance profile, intent block, facet ↔ filesystem
CHANGELOG.md:49:    `ADR-NNN-<slug>.md` are reserved for v2.x.
CHANGELOG.md:102:- Executable conformance suite at
CHANGELOG.md:103:  `spec-bundle/conformance/`.
CHANGELOG.md:104:- Sigstore signing of the bundle (`signature.status:
CHANGELOG.md:117:`spec-bundle/conformance/` is empty; per-decision ADRs
README.md:53:| `spec-bundle/conformance/` | (Reserved for v2.x) Executable conformance suite |
spec-bundle/manifest.yaml:3:conformance_profile: "core"
spec-bundle/manifest.yaml:57:  conformance:
spec-bundle/manifest.yaml:58:    path: "conformance/"
spec-bundle/manifest.yaml:60:signature:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:31:the v2.0 conformance suite. Every methodology primitive
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:77:  conformance_profile, pointers to per-facet sub-specs,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:78:  signature placeholder).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:101:  manifest's signature field is reserved but not
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:140:│   └── conformance/                   # executable conformance suite
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:256:what the bundle contains and what conformance profile it
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:263:conformance_profile: "core"         # core | extension | real-integration
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:311:  conformance:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:312:    path: "conformance/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:314:signature:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:316:  # When signed: cosign signature + Rekor inclusion proof
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:326:2. `conformance_profile` is one of {`core`, `extension`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:421:Quality requirements + conformance gates per arc42 §10
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:428:  the per-factor conformance posture
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:453:### 6.3 Conformance suite (spec-bundle/conformance/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:458:  the manifest's claimed `conformance_profile`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:494:| (new) `spec-bundle/conformance/` | as named | new conformance suite |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:555:| `conformance_profile` | enum | yes | `core` \| `extension` \| `real-integration` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:561:| `signature` | object | OPTIONAL | See §8.5 |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:594:| `conformance` | object with `path` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:596:### 8.5 `signature` block
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:600:- Signed fields (`cosign_signature`, `rekor_inclusion`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:601:  `signing_identity`) are reserved; populate at v2.x
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:618:  if manifest.conformance_profile not in ["core", "extension", "real-integration"]:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:619:    errors.append("conformance_profile invalid")
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:666:| `conformance-suite-regression` | A previously passing conformance test now fails after the repack | Author fixes the regression OR reverts the touch that caused it (the repack must preserve v1.1 functional capabilities) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:673:- The signature field is reserved unsigned at v2.0.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:758:If a partial repack lands and is later abandoned:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:762:   existing artefacts). v2.0 ships with `partial`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:763:   conformance_profile noted in the manifest.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:773:- [ ] Q2: Should the conformance suite at
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:774:      `spec-bundle/conformance/` ship runnable tests at
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:776:      placeholder at v2.0; the conformance suite is its
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:839:**Renamed** (33 files via `git mv`; history preserved):
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:870:  quality,operations,non-goals,conformance}`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:883:  (PASS — manifest schema 2.0.0, conformance core, 8
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:916:  spec-bundle/conformance/ directory is empty;
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:922:  "reserved for v2.x". The bundle is structurally
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:953:  framework repos**. The v2.0 reorganization preserved
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:968:  content (per-decision ADRs are INDEX-only; conformance
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:971:  CHANGELOG "reserved for v2.x" framing. This
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:977:  `reserved for next.x` rather than blocking on full
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:135:is reserved for changes that MUST be applied uniformly.
spec-bundle/deployment/requirements.md:48:Nix-style content-hash reproducibility for adopter
spec-bundle/quality/requirements.md:44:needed for mechanical conformance.
spec-bundle/quality/12-factor-overlay.md:29:12-factor conformance for their products combine:
spec-bundle/skills/spec-evidence-governance/SKILL.md:35:- Do not erase dissent, uncertainty, or provenance.
spec-bundle/skills/code-review/SKILL.md:26:   touched only allowed ownership, preserved acceptance evidence, and
spec-bundle/skills/spec-driven-development/SKILL.md:184:  a child sync after a partial commit overwrites destination state
spec-bundle/skills/repo-orientation/SKILL.md:54:- Local changes that must be preserved.
spec-bundle/skills/spec-authoring/references/studio-principles.md:5:`principle-<topic>` (or your fleet's equivalent reserved
spec-bundle/templates/SPEC.task.template.md:122:latitude, provenance/licensing requirements, owner review checkpoint,
spec-bundle/templates/SPEC.contract.template.md:202:partial-state behavior, idempotency. -->
spec-bundle/templates/SPEC.contract.template.md:233:state, signals, and provenance trail. -->
spec-bundle/skills/spec-review/references/per-type-gates.md:105:  quality signature").
spec-bundle/skills/spec-review/references/per-type-gates.md:107:The check is the principle SPEC's quality signature; lint catches
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:73:  with the resolution citation preserved.
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:63:- Entries citing facts (lint output, commit hash, etc.) MUST use

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba CONTRIBUTING.md | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
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
    22	2. **Read `schema/SPEC.schema.md`** — the citation grammar
    23	   and front-matter rules.
    24	3. **Open an issue first** with a one-paragraph problem
    25	   statement. The framework maintainer will signal whether
    26	   it's worth pursuing before you invest in a full SPEC.
    27	4. **Author an IDEA** at `specs/<YYYY-MM-DD>-<slug>/IDEA.md`
    28	   using `templates/IDEA.template.md`. The IDEA covers
    29	   problem, substance, constraints, approaches considered,
    30	   recommendation, owner-blocking questions.
    31	5. **Author a SPEC** at `specs/<YYYY-MM-DD>-<slug>/SPEC.md`
    32	   using the appropriate type template (task / contract /
    33	   decision). The IDEA must reach `status: ready-for-spec`
    34	   first.
    35	6. **Run lint locally** before opening the PR:
    36	
    37	   ```bash
    38	   bash scripts/lint-spec.sh specs/<your-spec>/IDEA.md
    39	   bash scripts/lint-spec.sh specs/<your-spec>/SPEC.md
    40	   bash scripts/validate-skill-frontmatter.sh
    41	   bash tests/hooks/run-tests.sh
    42	   ```
    43	
    44	   All MUST exit 0.
    45	7. **Open the PR**. CI runs the four jobs. Address review
    46	   feedback or post explicit pushback. A different-family
    47	   reviewer ideally signs off (the framework's cross-family
    48	   review pattern applies to its own development).
    49	8. **Merge happens on owner approval**. The owner flips the
    50	   SPEC `approved-pending-owner → approved → verified` and
    51	   merges.
    52	
    53	## Citation discipline
    54	
    55	Every factual claim in every artefact MUST carry a citation
    56	prefix from the grammar (`file://`, `cmd://`, `url://`,
    57	`decision-authority://<role>:<date>`, `judgment://owner`,
    58	`judgment://agent-synthesis`). Memory and training data are
    59	inputs to your reasoning, not citable evidence. The lint
    60	script enforces this.
    61	
    62	## Commit messages
    63	
    64	Conventional Commits 1.0.0:
    65	
    66	```
    67	<type>(<optional scope>): <subject>
    68	```
    69	
    70	Allowed types: `feat`, `fix`, `build`, `chore`, `ci`, `docs`,
    71	`style`, `refactor`, `perf`, `test`, `spec`. Breaking changes
    72	mark with `!` after the type or a `BREAKING CHANGE:` footer.
    73	
    74	## No AI attribution
    75	
    76	Per the `block-ai-attribution.sh` hook: do NOT include
    77	`Co-Authored-By: Claude` / `Co-Authored-By: GPT-...` or
    78	similar trailers. The hook will reject the commit. The
    79	framework's posture: AI tools are inputs to your thinking,
    80	not credited authors of the contribution.
    81	
    82	## Testing
    83	
    84	The framework ships its own test harness at
    85	`tests/hooks/run-tests.sh`. If you add a hook, add tests for
    86	its block path, allow path, and at least one false-positive
    87	guard. The harness is hermetic — use the existing sandbox-
    88	fixture pattern; don't depend on the framework repo's own
    89	state.
    90	
    91	## Posture
    92	
    93	The framework is offered as honest experience, not as
    94	prescription. Contributions should match that posture: name
    95	what you tried, name what you found, name what didn't work.
    96	Don't pretend certainty you don't have. The citation grammar
    97	gives you a way to disclose where each claim comes from —
    98	use it.
    99	
   100	## Licence
   101	
   102	By contributing, you agree your work is licensed under
   103	Apache-2.0 (see LICENSE).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md | sed -n '60,100p;145,170p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    60	- `file://examples/contract-webhook-signing/SPEC.md` (the
    61	  parent SPEC; §§6.1, 6.2, 7.1, 7.2, 8.1, 9.1).
    62	- `file://examples/contract-webhook-signing/IDEA.md` §3
    63	  Constraints (for the "no custom verification library"
    64	  constraint that informs API choice).
    65	- `file://OPERATING_MODEL.md` "Cross-family review" (for the
    66	  blocking review gate this task must pass).
    67	
    68	### 3.3 Out of scope
    69	
    70	Out of scope for this slice (covered by sibling tasks):
    71	
    72	- Dispatcher integration with the signer (handled by
    73	  `T-02-dispatcher-integration`).
    74	- Customer-facing REST API surface (handled by
    75	  `T-03-customer-api`).
    76	- Reference verifier snippets in customer languages (handled
    77	  by `T-04-verifier-docs`).
    78	
    79	Surface as backlog tracker issues if discovered during
    80	execution per `file://workflow/UNIVERSAL.md` "Universal
    81	guardrails".
    82	
    83	## 4. Model dispatch
    84	
    85	| Lane | Model | Role |
    86	|---|---|---|
    87	| Primary | `gpt-5` | Implementation + workpad management. |
    88	| Cross-validation | `claude-opus-4-7` | Independent diff review before Human Review. Different family from primary. |
    89	| Verification | `gpt-5` | Run acceptance_commands; capture fresh evidence. |
    90	
    91	**Subagent dispatch rules:**
    92	
    93	- The primary agent MUST evaluate whether independent sub-work
    94	  in this slice can fan out (e.g., test authoring in parallel
    95	  with implementation for the two packages).
    96	- Subagents MUST receive bounded scope, allowed files,
    97	  expected output, and write/read posture.
    98	- Subagents MUST NOT modify the parent SPEC.md or this TASK.md
    99	  (read-only).
   100	
   145	  framework needs an upgrade to handle the new migration).
   146	- Cross-validation surfaced a blocker.
   147	- Acceptance commands cannot pass under the bounded scope.
   148	
   149	## 8. Tracker binding
   150	
   151	Once dispatched:
   152	
   153	- Tracker issue: `{{tracker_issue}}`
   154	- PR (when opened): [URL]
   155	- Workpad comment ID: [tracker comment id]
   156	
   157	The tracker issue's workpad comment is the live execution
   158	journal per `file://workflow/UNIVERSAL.md` Step 1.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md | sed -n '60,100p;145,170p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    60	
    61	Files this worker MUST read before editing:
    62	
    63	- `file://examples/contract-webhook-signing/SPEC.md` (the
    64	  parent SPEC; §§3.1, 6.3, 7.2, 10, 16).
    65	- `file://examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md`
    66	  (the upstream slice; its exported `Sign()` API is the
    67	  integration point).
    68	- `file://OPERATING_MODEL.md` "Cross-family review".
    69	
    70	### 3.3 Out of scope
    71	
    72	Out of scope for this slice (covered by sibling tasks):
    73	
    74	- Signer + keystore implementation (already landed via T-01).
    75	- Customer-facing REST API surface (handled by
    76	  `T-03-customer-api`).
    77	- Reference verifier snippets in customer languages (handled
    78	  by `T-04-verifier-docs`).
    79	- Observability metrics emission (parent §12; covered by a
    80	  follow-on telemetry-only Task SPEC).
    81	
    82	Surface as backlog tracker issues if discovered during
    83	execution per `file://workflow/UNIVERSAL.md` "Universal
    84	guardrails".
    85	
    86	## 4. Model dispatch
    87	
    88	| Lane | Model | Role |
    89	|---|---|---|
    90	| Primary | `claude-opus-4-7` | Implementation + workpad management. (Different family from T-01 primary to spread cross-family coverage across slices.) |
    91	| Cross-validation | `gpt-5` | Independent diff review. Different family from primary. |
    92	| Verification | `claude-opus-4-7` | Run acceptance_commands; capture fresh evidence. (Mechanical verification; same family as primary is acceptable per parent §17.) |
    93	
    94	**Subagent dispatch rules:**
    95	
    96	- This slice has tight write-scope (dispatcher.go is one
    97	  file; queue.go is touched lightly). Fanout adds coordination
    98	  cost without wall-clock benefit. Keep local.
    99	- The integration test is a single shell script;
   100	  parallelisation has no benefit.
   145	
   146	## 8. Tracker binding
   147	
   148	Once dispatched:
   149	
   150	- Tracker issue: `{{tracker_issue}}`
   151	- PR (when opened): [URL]
   152	- Workpad comment ID: [tracker comment id]
   153	
   154	The tracker issue's workpad comment is the live execution
   155	journal per `file://workflow/UNIVERSAL.md` Step 1.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/send-fleet-message.sh | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# send-fleet-message.sh — append a structured message to a target repo's
     3	# AGENT_INBOX.md, commit, and push.
     4	#
     5	# Usage:
     6	#   bash send-fleet-message.sh <target-repo> <type> "<summary>" [< body.md]
     7	#   bash send-fleet-message.sh --list                            # list inbox state per repo
     8	#
     9	# Types: fleet-update | directive-notice | handoff | request | ack
    10	#
    11	# Body is read from stdin if provided (heredoc-friendly), else the script
    12	# uses minimal scaffolding. Run interactively to fill body fields one at a
    13	# time.
    14	#
    15	# Authority:
    16	#   file://skills/cross-repo-informational-channel/SKILL.md
    17	#   file://skills/cross-repo-informational-channel/SKILL.md
    18	#   file://workpads/AGENT_INBOX.template.md
    19	
    20	set -uo pipefail
    21	
    22	SOURCE_DIR="$(cd "$(dirname "$(readlink -f "$0")")/../.." && pwd)"
    23	STUDIO_ROOT="$(dirname "$SOURCE_DIR")"
    24	TEMPLATE_PATH="$SOURCE_DIR/agents/templates/AGENT_INBOX.template.md"
    25	
    26	KNOWN_REPOS_FILE="${FLEET_KNOWN_REPOS_FILE:-$SOURCE_DIR/scripts/fleet-known-repos.txt}"
    27	if [ -f "$KNOWN_REPOS_FILE" ]; then
    28	    mapfile -t KNOWN_REPOS < <(grep -vE '^\s*(#|$)' "$KNOWN_REPOS_FILE")
    29	else
    30	    KNOWN_REPOS=()
    31	fi
    32	VALID_TYPES=(fleet-update directive-notice handoff request ack)
    33	
    34	usage() {
    35	    cat <<EOF
    36	send-fleet-message.sh — append a structured message to a fleet repo's AGENT_INBOX.md
    37	
    38	Usage:
    39	  $0 <target-repo> <type> "<summary>" [< body-stdin]
    40	  $0 --list                              show inbox entry counts per repo
    41	
    42	target-repo: ${KNOWN_REPOS[*]}
    43	type:        ${VALID_TYPES[*]}
    44	
    45	When body is read from stdin (heredoc-friendly), the script expects:
    46	
    47	  Authority: your-policy-repo@<sha> | file://... | owner://transcript-<date>
    48	  Expects ack: true | false
    49	  Relates to: <ref or "none">
    50	
    51	  <one or more paragraphs of "What changed / what to pick up" content>
    52	
    53	  Action required:
    54	  - [ ] step 1
    55	  - [ ] step 2
    56	
    57	If no stdin body is provided, the script prompts interactively
    58	for these fields.
    59	EOF
    60	}
    61	
    62	is_known_repo() {
    63	    local repo="$1"
    64	    for r in "${KNOWN_REPOS[@]}"; do [ "$r" = "$repo" ] && return 0; done
    65	    return 1
    66	}
    67	
    68	is_valid_type() {
    69	    local t="$1"
    70	    for v in "${VALID_TYPES[@]}"; do [ "$v" = "$t" ] && return 0; done
    71	    return 1
    72	}
    73	
    74	resolve_target_path() {
    75	    local repo="$1"
    76	    if [ "$repo" = "your-policy-repo" ]; then
    77	        printf '%s\n' "$SOURCE_DIR"
    78	    else
    79	        printf '%s\n' "$STUDIO_ROOT/$repo"
    80	    fi

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/fleet-sync.sh | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# fleet-sync.sh — propagate the fleet baseline from the policy repo to a
     3	# target repo. UNIFORM mode: settings.json, statusline.sh, hooks/ are
     4	# overwritten to fleet baseline. Per-repo permissions live in
     5	# .claude/settings.local.json (gitignored).
     6	#
     7	# Topology is manifest-driven. Edit these files to change what propagates:
     8	#   agents/scripts/fleet-files.txt          — .agents/ content paths
     9	#   agents/scripts/fleet-skills.txt         — skill names (mirrored to .claude/skills/)
    10	#   agents/scripts/fleet-commands.txt       — slash-command names
    11	#   agents/scripts/fleet-hooks.txt          — hook script names
    12	#   agents/scripts/fleet-hook-fixtures.txt  — hook test fixtures
    13	#   agents/scripts/fleet-oss-gitignore.txt  — OSS-posture .gitignore entries
    14	#
    15	# Usage: fleet-sync.sh <target-repo-absolute-path> <internal|oss>
    16	#   internal: full fleet baseline; .agents/ + .claude/ committed.
    17	#   oss:      .agents/ and .claude/ are gitignored (public OSS posture);
    18	#             content lays in working tree only.
    19	#
    20	# Source location: auto-derived from script path. Override with FLEET_SOURCE env.
    21	
    22	set -eu
    23	
    24	SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
    25	SOURCE="${FLEET_SOURCE:-$(cd "$SCRIPT_DIR/../.." && pwd)}"
    26	TARGET="${1:?target repo path required}"
    27	POSTURE="${2:?posture required (internal|oss)}"
    28	case "$POSTURE" in internal|oss) ;; *) echo "posture must be internal|oss" >&2; exit 64 ;; esac
    29	
    30	# Read a manifest file into a bash array.
    31	# Strips blank lines and comments (# prefix).
    32	read_manifest() {
    33	    local file="$1"
    34	    local -n out_array="$2"
    35	    out_array=()
    36	    [ -f "$file" ] || { echo "manifest not found: $file" >&2; exit 65; }
    37	    while IFS= read -r line; do
    38	        # skip blanks + comments
    39	        case "$line" in ''|'#'*) continue ;; esac
    40	        out_array+=("$line")
    41	    done < "$file"
    42	}
    43	
    44	read_manifest "$SOURCE/agents/scripts/fleet-skills.txt" SKILLS
    45	read_manifest "$SOURCE/agents/scripts/fleet-commands.txt" COMMANDS
    46	read_manifest "$SOURCE/agents/scripts/fleet-hooks.txt" HOOKS
    47	read_manifest "$SOURCE/agents/scripts/fleet-hook-fixtures.txt" HOOK_FIXTURES
    48	read_manifest "$SOURCE/agents/scripts/fleet-oss-gitignore.txt" OSS_GITIGNORE
    49	
    50	echo "=== fleet-sync to $TARGET (posture=$POSTURE) ==="
    51	
    52	# Ensure target dirs
    53	mkdir -p "$TARGET/.agents/skills" "$TARGET/.agents/workflows" "$TARGET/.agents/scripts/lint-spec-fixtures" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/good-internal" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/bad-no-agents-md" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/bad-claude-md-no-import" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/edge-leading-whitespace-import" "$TARGET/.agents/specs" "$TARGET/.agents/mcp" "$TARGET/.agents/templates" "$TARGET/.agents/githooks" "$TARGET/.agents/fleet-directives" "$TARGET/.githooks"
    54	for skill in "${SKILLS[@]}"; do
    55	    mkdir -p "$TARGET/.agents/skills/$skill"
    56	done
    57	mkdir -p "$TARGET/.claude/commands" "$TARGET/.claude/scripts" "$TARGET/.claude/skills" "$TARGET/.claude/hooks/tests"
    58	for skill in "${SKILLS[@]}"; do
    59	    mkdir -p "$TARGET/.claude/skills/$skill"
    60	done
    61	
    62	# .agents/ (canonical fleet content list — manifest-driven). Auto-create
    63	# parent directories so skill-local references/ subdirs propagate without
    64	# extra mkdir loops.
    65	while IFS= read -r f; do
    66	    [ -z "$f" ] && continue
    67	    case "$f" in '#'*) continue ;; esac
    68	    mkdir -p "$(dirname "$TARGET/.agents/$f")"
    69	    cp "$SOURCE/agents/$f" "$TARGET/.agents/$f"
    70	done < "$SOURCE/agents/scripts/fleet-files.txt"
    71	# chmod +x every .sh propagated to .agents/scripts/ (idempotent).
    72	find "$TARGET/.agents/scripts" -maxdepth 1 -name '*.sh' -type f -exec chmod +x {} +
    73	
    74	# If a fleet-baseline commit-msg hook is part of your propagated content
    75	# (under .agents/githooks/commit-msg), deploy it to the repo's .githooks/
    76	# and set core.hooksPath. Skip silently when not present.
    77	if [ -f "$TARGET/.agents/githooks/commit-msg" ]; then
    78	    chmod +x "$TARGET/.agents/githooks/commit-msg"
    79	    cp "$TARGET/.agents/githooks/commit-msg" "$TARGET/.githooks/commit-msg"
    80	    chmod +x "$TARGET/.githooks/commit-msg"
    81	    git -C "$TARGET" config core.hooksPath .githooks
    82	fi
    83	
    84	# If a per-tool config template is propagated under .agents/templates/
    85	# (e.g., a parallel-worktree tool's project config), deploy it to the
    86	# repo's .config/ directory. Skip silently when not present.
    87	mkdir -p "$TARGET/.config"
    88	if [ -f "$TARGET/.agents/templates/wt.toml.template" ]; then
    89	    cp "$TARGET/.agents/templates/wt.toml.template" "$TARGET/.config/wt.toml"
    90	fi
    91	
    92	# Bootstrap SESSION_JOURNAL.md and AGENT_FEEDBACK.md from templates if absent.
    93	# Never overwrite — these accumulate per-repo content that is owner+agent
    94	# history, not fleet content. fleet-sync only seeds the empty file.
    95	if [ ! -f "$TARGET/SESSION_JOURNAL.md" ]; then
    96	    cp "$TARGET/.agents/templates/SESSION_JOURNAL.template.md" "$TARGET/SESSION_JOURNAL.md"
    97	fi
    98	if [ ! -f "$TARGET/AGENT_FEEDBACK.md" ]; then
    99	    cp "$TARGET/.agents/templates/AGENT_FEEDBACK.template.md" "$TARGET/AGENT_FEEDBACK.md"
   100	fi
   101	if [ ! -f "$TARGET/AGENT_INBOX.md" ]; then
   102	    cp "$TARGET/.agents/templates/AGENT_INBOX.template.md" "$TARGET/AGENT_INBOX.md"
   103	fi
   104	
   105	# Re-compose <repo>/WORKFLOW.md from existing YAML + per-repo intro + current
   106	# fleet body. Skip when WORKFLOW.md lacks YAML front matter (studio root /
   107	# policy repo use studio-shape docs, not the dispatcher template). The
   108	# fleet body sentinel "Fleet-baseline WORKFLOW.md prompt body." marks where
   109	# the per-repo intro ends and the canonical body begins.
   110	if [ -f "$TARGET/WORKFLOW.md" ]; then
   111	    if head -1 "$TARGET/WORKFLOW.md" | grep -q '^---$'; then
   112	        SOURCE_BODY="$TARGET/.agents/templates/WORKFLOW.body.md"
   113	        if [ -f "$SOURCE_BODY" ]; then
   114	            yaml=$(awk 'BEGIN{c=0} /^---$/{c++; print; if(c==2) exit; next} c==1{print}' "$TARGET/WORKFLOW.md")
   115	            intro=$(awk '
   116	                BEGIN{c=0; past_yaml=0}
   117	                /^---$/{c++; if(c==2){past_yaml=1; next}; next}
   118	                past_yaml && /^<!--$/{
   119	                    getline next_line
   120	                    if (next_line ~ /^Fleet-baseline WORKFLOW\.md prompt body\./){
   121	                        exit
   122	                    }
   123	                    print
   124	                    print next_line
   125	                    next
   126	                }
   127	                past_yaml{print}
   128	            ' "$TARGET/WORKFLOW.md")
   129	            {
   130	                printf '%s\n\n' "$yaml"
   131	                printf '%s' "$intro"
   132	                printf '\n'
   133	                cat "$SOURCE_BODY"
   134	            } > "$TARGET/WORKFLOW.md.new"
   135	            mv "$TARGET/WORKFLOW.md.new" "$TARGET/WORKFLOW.md"
   136	        fi
   137	    fi
   138	fi
   139	
   140	# Remove deprecated SPEC.template.md if present
   141	if git -C "$TARGET" ls-files --error-unmatch .agents/specs/SPEC.template.md >/dev/null 2>&1; then
   142	    git -C "$TARGET" rm -q .agents/specs/SPEC.template.md
   143	elif [ -f "$TARGET/.agents/specs/SPEC.template.md" ]; then
   144	    rm "$TARGET/.agents/specs/SPEC.template.md"
   145	fi
   146	
   147	# .claude/ commands
   148	for cmd in "${COMMANDS[@]}"; do
   149	    cp "$SOURCE/.claude/commands/$cmd.md" "$TARGET/.claude/commands/$cmd.md"
   150	done
   151	
   152	# .claude/ skills (mirrored from agents/skills/). Mirror SKILL.md plus
   153	# any skill-local references/ subdir so progressive-disclosure references
   154	# resolve correctly in the Claude harness.
   155	for skill in "${SKILLS[@]}"; do
   156	    cp "$SOURCE/agents/skills/$skill/SKILL.md" "$TARGET/.claude/skills/$skill/SKILL.md"
   157	    if [ -d "$SOURCE/agents/skills/$skill/references" ]; then
   158	        mkdir -p "$TARGET/.claude/skills/$skill/references"
   159	        cp "$SOURCE/agents/skills/$skill/references/"*.md "$TARGET/.claude/skills/$skill/references/"
   160	    fi
   161	done
   162	
   163	# .claude/ hooks + tests
   164	for h in "${HOOKS[@]}"; do
   165	    cp "$SOURCE/.claude/hooks/$h" "$TARGET/.claude/hooks/$h"
   166	    chmod +x "$TARGET/.claude/hooks/$h"
   167	done
   168	cp "$SOURCE/.claude/hooks/tests/run-tests.sh" "$TARGET/.claude/hooks/tests/run-tests.sh"
   169	chmod +x "$TARGET/.claude/hooks/tests/run-tests.sh"
   170	mkdir -p "$TARGET/.claude/hooks/tests/fixtures"
   171	for fixture in "${HOOK_FIXTURES[@]}"; do
   172	    cp "$SOURCE/.claude/hooks/tests/fixtures/$fixture" "$TARGET/.claude/hooks/tests/fixtures/$fixture"
   173	done
   174	
   175	# .claude/ settings.json + statusline.sh (UNIFORM: overwrite)
   176	cp "$SOURCE/.claude/settings.json" "$TARGET/.claude/settings.json"
   177	cp "$SOURCE/.claude/scripts/statusline.sh" "$TARGET/.claude/scripts/statusline.sh"
   178	chmod +x "$TARGET/.claude/scripts/statusline.sh"
   179	
   180	# OSS posture: ensure .gitignore excludes the configured entries
   181	# (agent-control content + root-level fleet workpads). Per OPERATING_MODEL
   182	# "Public OSS posture".
   183	if [ "$POSTURE" = "oss" ]; then
   184	    for entry in "${OSS_GITIGNORE[@]}"; do
   185	        if ! grep -qE "^${entry%/}/?\$" "$TARGET/.gitignore" 2>/dev/null; then
   186	            printf '\n%s\n' "$entry" >> "$TARGET/.gitignore"
   187	        fi
   188	    done
   189	fi
   190	
   191	# Stage explicitly (internal repos only)
   192	if [ "$POSTURE" = "internal" ]; then
   193	    STAGE=()
   194	    while IFS= read -r f; do
   195	        [ -z "$f" ] && continue
   196	        case "$f" in '#'*) continue ;; esac
   197	        STAGE+=(".agents/$f")
   198	    done < "$SOURCE/agents/scripts/fleet-files.txt"
   199	    for cmd in "${COMMANDS[@]}"; do
   200	        STAGE+=(".claude/commands/$cmd.md")
   201	    done
   202	    for skill in "${SKILLS[@]}"; do
   203	        STAGE+=(".claude/skills/$skill/SKILL.md")
   204	        if [ -d "$TARGET/.claude/skills/$skill/references" ]; then
   205	            while IFS= read -r ref; do
   206	                STAGE+=("$ref")
   207	            done < <(cd "$TARGET" && find ".claude/skills/$skill/references" -type f -name '*.md')
   208	        fi
   209	    done
   210	    for h in "${HOOKS[@]}"; do
   211	        STAGE+=(".claude/hooks/$h")
   212	    done
   213	    STAGE+=(".claude/hooks/tests/run-tests.sh")
   214	    for fixture in "${HOOK_FIXTURES[@]}"; do
   215	        STAGE+=(".claude/hooks/tests/fixtures/$fixture")
   216	    done
   217	    STAGE+=(".claude/settings.json" ".claude/scripts/statusline.sh" ".githooks/commit-msg" ".config/wt.toml")
   218	    # Stage WORKFLOW.md if the target uses the dispatcher YAML+body shape
   219	    # (per-repo intro preserved, body re-composed above).
   220	    if [ -f "$TARGET/WORKFLOW.md" ] && head -1 "$TARGET/WORKFLOW.md" | grep -q '^---$'; then
   221	        STAGE+=("WORKFLOW.md")
   222	    fi
   223	    git -C "$TARGET" add -- "${STAGE[@]}"
   224	fi

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/audit-fleet-compliance.sh | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# audit-fleet-compliance.sh — audit each fleet directive's compliance check
     3	# against its target repos. Also surfaces unaddressed AGENT_FEEDBACK.md entries
     4	# across the fleet.
     5	#
     6	# Usage:
     7	#   bash scripts/audit-fleet-compliance.sh                    audit all `applied` and `pending` directives
     8	#   bash scripts/audit-fleet-compliance.sh --validate <id>    validate directive format (no apply)
     9	#   bash scripts/audit-fleet-compliance.sh --feedback         report only AGENT_FEEDBACK entries
    10	#
    11	# Authority:
    12	#   file://skills/cross-repo-policy-enforcement/SKILL.md
    13	#   file://docs/fleet-directives.md
    14	
    15	set -uo pipefail
    16	
    17	SOURCE_DIR="$(cd "$(dirname "$(readlink -f "$0")")/../.." && pwd)"
    18	DIRECTIVES_DIR="$SOURCE_DIR/agents/fleet-directives"
    19	STUDIO_ROOT="$(dirname "$SOURCE_DIR")"
    20	SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
    21	
    22	# Repo posture classification — manifest-driven.
    23	# Edit fleet-{internal,oss,local-only}-repos.txt to change topology.
    24	read_manifest() {
    25	    local file="$1"
    26	    local -n out_array="$2"
    27	    out_array=()
    28	    [ -f "$file" ] || return 0
    29	    while IFS= read -r line; do
    30	        case "$line" in ''|'#'*) continue ;; esac
    31	        out_array+=("$line")
    32	    done < "$file"
    33	}
    34	
    35	read_manifest "$SCRIPT_DIR/fleet-internal-repos.txt" INTERNAL_REPOS
    36	read_manifest "$SCRIPT_DIR/fleet-oss-repos.txt" PUBLIC_OSS_REPOS
    37	read_manifest "$SCRIPT_DIR/fleet-local-only-repos.txt" LOCAL_ONLY_REPOS
    38	# The audit-fleet-compliance.sh script's INTERNAL_REPOS list intentionally
    39	# excludes your-policy-repo (the policy repo audits itself separately).
    40	# Strip it from the in-memory copy here:
    41	INTERNAL_REPOS=("${INTERNAL_REPOS[@]/your-policy-repo/}")
    42	INTERNAL_REPOS=("${INTERNAL_REPOS[@]/your-policy-repo/}")
    43	# Filter empties:
    44	TMP=("${INTERNAL_REPOS[@]}"); INTERNAL_REPOS=()
    45	for r in "${TMP[@]}"; do [ -n "$r" ] && INTERNAL_REPOS+=("$r"); done
    46	
    47	ALL_REPOS=("${INTERNAL_REPOS[@]}" "${PUBLIC_OSS_REPOS[@]}" "${LOCAL_ONLY_REPOS[@]}")
    48	
    49	get_field() {
    50	    local field="$1" file="$2"
    51	    awk -v field="$field" '
    52	        BEGIN { in_fm = 0 }
    53	        /^---$/ { in_fm = !in_fm; next }
    54	        in_fm && $1 == field":" { sub("^" field ":[[:space:]]*", ""); print; exit }
    55	    ' "$file"
    56	}
    57	
    58	resolve_targets() {
    59	    local field_val="$1"
    60	    field_val=$(printf '%s' "$field_val" | tr -d '[]')
    61	    case "$field_val" in
    62	        all) printf '%s\n' "${ALL_REPOS[@]}" ;;
    63	        all-internal) printf '%s\n' "${INTERNAL_REPOS[@]}" ;;
    64	        all-oss) printf '%s\n' "${PUBLIC_OSS_REPOS[@]}" ;;
    65	        *) printf '%s\n' "$field_val" | tr ',' '\n' | awk '{$1=$1; print}' ;;
    66	    esac
    67	}
    68	
    69	extract_compliance_check() {
    70	    awk '
    71	        BEGIN { in_check = 0; in_block = 0 }
    72	        /^## 3\. Compliance check/ { in_check = 1; next }
    73	        /^## [0-9]+\./ && in_check { exit }
    74	        in_check && /^```bash$/ { in_block = 1; next }
    75	        in_check && /^```$/ && in_block { exit }
    76	        in_check && in_block { print }
    77	    ' "$1"
    78	}
    79	
    80	validate_directive() {

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/audit-entry-docs.sh | sed -n '1,140p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# audit-entry-docs.sh — audit AGENTS.md / CLAUDE.md / GEMINI.md /
     3	# WORKFLOW.md against the canonical fleet pattern declared in
     4	# agents/OPERATING_MODEL.md §"Source Of Truth" and §"Public OSS posture".
     5	#
     6	# Run from the studio root to audit all 7 repos, or from any repo
     7	# root to audit that one repo.
     8	#
     9	# Exit codes:
    10	#   0 — all checks pass
    11	#   1 — at least one blocking criterion failed
    12	#
    13	# Authority:
    14	#   your-policy-repo entry-doc audit policy
    15	#   file://agents/skills/agents-md-improver/SKILL.md (policy doc)
    16	
    17	set -uo pipefail
    18	
    19	# Repo posture classification — manifest-driven.
    20	# Edit fleet-internal-repos.txt + fleet-oss-repos.txt to change topology.
    21	SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
    22	
    23	read_manifest() {
    24	    local file="$1"
    25	    local -n out_array="$2"
    26	    out_array=()
    27	    [ -f "$file" ] || return 0
    28	    while IFS= read -r line; do
    29	        case "$line" in ''|'#'*) continue ;; esac
    30	        out_array+=("$line")
    31	    done < "$file"
    32	}
    33	
    34	read_manifest "$SCRIPT_DIR/fleet-internal-repos.txt" INTERNAL_REPOS
    35	read_manifest "$SCRIPT_DIR/fleet-oss-repos.txt" PUBLIC_OSS_REPOS
    36	
    37	fail=0
    38	total_failures=0
    39	
    40	# Detect run mode: studio root (sees all internal + OSS repos) or single
    41	# repo. Studio root has at least the first two internal-manifest repos
    42	# AND the first OSS-manifest repo as subdirectories.
    43	detect_root() {
    44	    if [ "${#INTERNAL_REPOS[@]}" -ge 2 ] && [ "${#PUBLIC_OSS_REPOS[@]}" -ge 1 ] \
    45	        && [ -d "$PWD/${INTERNAL_REPOS[0]}" ] \
    46	        && [ -d "$PWD/${INTERNAL_REPOS[1]}" ] \
    47	        && [ -d "$PWD/${PUBLIC_OSS_REPOS[0]}" ]; then
    48	        printf 'studio_root\n'
    49	        return
    50	    fi
    51	    printf 'single_repo\n'
    52	}
    53	
    54	mode="$(detect_root)"
    55	
    56	# --- Per-repo checks ---
    57	
    58	audit_internal_repo() {
    59	    local repo_dir="$1" repo_name="$2"
    60	    local repo_failures=0
    61	
    62	    # AGENTS.md: REQUIRED. Section-naming is repo-local discretion (each
    63	    # repo titles its sections as fits its content); the auditor enforces
    64	    # only the fleet-level requirements: presence, and a reference to
    65	    # the Policy Origination policy so agents working in the repo
    66	    # know fleet rules originate in your-policy-repo.
    67	    if [ ! -f "$repo_dir/AGENTS.md" ]; then
    68	        printf '%s/AGENTS.md:1: BLOCKING — missing AGENTS.md (canonical entry doc per OPERATING_MODEL Source Of Truth)\n' "$repo_name" >&2
    69	        repo_failures=$((repo_failures + 1))
    70	    else
    71	        if ! grep -qE 'Policy Origination' "$repo_dir/AGENTS.md"; then
    72	            printf '%s/AGENTS.md:1: ADVISORY — does not reference "Policy Origination" (codified policy in OPERATING_MODEL); add a brief reference so agents in this repo know fleet rules originate in your-policy-repo\n' "$repo_name" >&2
    73	            # Advisory only — does not increment repo_failures.
    74	        fi
    75	    fi
    76	
    77	    # SESSION_JOURNAL.md ADVISORY — bootstrap on next fleet-sync if absent.
    78	    if [ ! -f "$repo_dir/SESSION_JOURNAL.md" ]; then
    79	        printf '%s/SESSION_JOURNAL.md:1: ADVISORY — missing SESSION_JOURNAL.md (universal workpad; auto-bootstrapped on next fleet-sync from .agents/templates/SESSION_JOURNAL.template.md)\n' "$repo_name" >&2
    80	    fi
    81	
    82	    # AGENT_FEEDBACK.md ADVISORY — bootstrap on next fleet-sync if absent.
    83	    if [ ! -f "$repo_dir/AGENT_FEEDBACK.md" ]; then
    84	        printf '%s/AGENT_FEEDBACK.md:1: ADVISORY — missing AGENT_FEEDBACK.md (feedback channel; auto-bootstrapped on next fleet-sync from .agents/templates/AGENT_FEEDBACK.template.md)\n' "$repo_name" >&2
    85	    fi
    86	
    87	    # AGENT_INBOX.md ADVISORY — bootstrap on next fleet-sync if absent.
    88	    if [ ! -f "$repo_dir/AGENT_INBOX.md" ]; then
    89	        printf '%s/AGENT_INBOX.md:1: ADVISORY — missing AGENT_INBOX.md (incoming message channel; auto-bootstrapped on next fleet-sync from .agents/templates/AGENT_INBOX.template.md)\n' "$repo_name" >&2
    90	    fi
    91	
    92	    # WORKFLOW.md ADVISORY for internal repos (issue-tracker-dispatch contract).
    93	    # Recommended by OPERATING_MODEL §"Dispatch Readiness" for active product
    94	    # repos; the source policy repo is policy infrastructure and may
    95	    # legitimately lack one. Auditor reports absence as advisory, not blocking.
    96	    if [ ! -f "$repo_dir/WORKFLOW.md" ]; then
    97	        printf '%s/WORKFLOW.md:1: ADVISORY — missing WORKFLOW.md (issue-tracker-dispatch contract; recommended for active product repos per OPERATING_MODEL §Dispatch Readiness)\n' "$repo_name" >&2
    98	    elif [ "$repo_name" != "your-policy-repo" ]; then
    99	        # WORKFLOW.body drift check: each repo's WORKFLOW.md MUST contain
   100	        # the fleet-baseline prompt body from agents/templates/WORKFLOW.body.md
   101	        # (under the per-repo intro paragraph). Detected via two stable
   102	        # marker lines that appear verbatim in the body but not in any
   103	        # legitimate per-repo intro: the Step 0 header and the Step 4
   104	        # decomposition-gap-recovery header. Both must be present.
   105	        local missing_markers=""
   106	        if ! grep -qE "^## Step 0 — Orient" "$repo_dir/WORKFLOW.md"; then
   107	            missing_markers="${missing_markers} 'Step 0 — Orient'"
   108	        fi
   109	        if ! grep -qE "^## Step 4 — Decomposition gap recovery" "$repo_dir/WORKFLOW.md"; then
   110	            missing_markers="${missing_markers} 'Step 4 — Decomposition gap recovery'"
   111	        fi
   112	        if ! grep -qF "cross_validation_lane" "$repo_dir/WORKFLOW.md"; then
   113	            missing_markers="${missing_markers} 'cross_validation_lane'"
   114	        fi
   115	        if ! grep -qE "^## Applicability" "$repo_dir/WORKFLOW.md"; then
   116	            missing_markers="${missing_markers} 'Applicability preamble'"
   117	        fi
   118	        if [ -n "$missing_markers" ]; then
   119	            printf '%s/WORKFLOW.md:1: BLOCKING — fleet-baseline body drift; missing marker(s):%s. Body source: agents/templates/WORKFLOW.body.md (or .agents/templates/WORKFLOW.body.md). Recompose: per-repo YAML + intro + fleet body verbatim.\n' "$repo_name" "$missing_markers" >&2
   120	            repo_failures=$((repo_failures + 1))
   121	        fi
   122	    fi
   123	
   124	    # If CLAUDE.md exists, first non-empty line MUST be "@AGENTS.md".
   125	    if [ -f "$repo_dir/CLAUDE.md" ]; then
   126	        first_meaningful=$(grep -m1 -vE '^[[:space:]]*$' "$repo_dir/CLAUDE.md" | head -1)
   127	        # Strip leading "# Title" — common pattern is title-then-import,
   128	        # so accept if line 1 is "# ..." OR if "@AGENTS.md" appears in
   129	        # the first 5 non-empty lines.
   130	        if ! head -10 "$repo_dir/CLAUDE.md" | grep -qE '^[[:space:]]*@AGENTS\.md\b'; then
   131	            printf '%s/CLAUDE.md:1: BLOCKING — does not import @AGENTS.md (must in first 10 lines)\n' "$repo_name" >&2
   132	            repo_failures=$((repo_failures + 1))
   133	        fi
   134	    fi
   135	
   136	    # GEMINI.md (if present) MUST also import @AGENTS.md.
   137	    if [ -f "$repo_dir/GEMINI.md" ]; then
   138	        if ! head -10 "$repo_dir/GEMINI.md" | grep -qE '^[[:space:]]*@AGENTS\.md\b'; then
   139	            printf '%s/GEMINI.md:1: BLOCKING — does not import @AGENTS.md (must in first 10 lines)\n' "$repo_name" >&2
   140	            repo_failures=$((repo_failures + 1))

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/fleet-files.example.txt | sed -n '1,80p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Canonical agents/ content list propagated to each target repo's
     2	# .agents/ directory. One repo-relative path per line (relative to
     3	# `agents/` in the source repo). Lines starting with `#` and blanks
     4	# are ignored.
     5	#
     6	# Auto-create-parent-dirs is on: skill-local references/<topic>.md
     7	# entries propagate without requiring extra mkdir loops.
     8	#
     9	# This file is studio-specific by design. Replace the example entries
    10	# below with the actual list of artefacts your studio's policy repo
    11	# canonicalizes. The file is read by `fleet-sync.sh`.
    12	
    13	# Example: an OPERATING_MODEL doc + the schema + templates + scripts
    14	# + skills propagate to each target's .agents/.
    15	
    16	# OPERATING_MODEL.md
    17	# specs/SPEC.schema.md
    18	# specs/SPEC.task.template.md
    19	# specs/SPEC.contract.template.md
    20	# specs/SPEC.decision.template.md
    21	# specs/SPEC.fastpath.template.md
    22	# specs/IDEA.template.md
    23	# specs/TASK.template.md
    24	# scripts/lint-spec.sh
    25	# scripts/validate-skill-frontmatter.sh
    26	# scripts/fleet-sync.sh
    27	# scripts/fleet-skills.txt
    28	# scripts/fleet-commands.txt
    29	# scripts/fleet-hooks.txt
    30	# scripts/fleet-hook-fixtures.txt
    31	# scripts/fleet-oss-gitignore.txt
    32	# skills/code-review/SKILL.md
    33	# skills/diagnosis/SKILL.md
    34	# skills/release-pr/SKILL.md
    35	# skills/spec-evidence-governance/SKILL.md
    36	# skills/tdd/SKILL.md
    37	# skills/verification/SKILL.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-skill-frontmatter.sh | sed -n '1,140p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# validate-skill-frontmatter.sh — sanity-check SKILL.md YAML frontmatter
     3	# across all skill directories present in the cwd repo.
     4	#
     5	# Scans whichever of these exist:
     6	#   spec-bundle/skills/  (framework source as of v2.0; was skills/ in v1.x)
     7	#   .claude/skills/      (Claude Code mirror, if present)
     8	#
     9	# Catches the most common breakage: unquoted scalar values containing
    10	# `: ` (colon-space), which strict YAML parsers reject.
    11	#
    12	# Exit: 0 clean, 1 issues found.
    13	
    14	set -uo pipefail
    15	fail=0
    16	
    17	scan_dir() {
    18	    local dir="$1"
    19	    [ -d "$dir" ] || return 0
    20	    while IFS= read -r -d '' f; do
    21	        fm=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit; next} c==1' "$f")
    22	        if [ -z "$fm" ]; then
    23	            printf '%s: NO frontmatter\n' "$f" >&2
    24	            fail=1; continue
    25	        fi
    26	        while IFS= read -r line; do
    27	            case "$line" in
    28	                ''|'#'*) continue ;;
    29	            esac
    30	            if [[ "$line" =~ ^([a-zA-Z_][a-zA-Z0-9_-]*):[[:space:]]*(.*)$ ]]; then
    31	                key="${BASH_REMATCH[1]}"
    32	                val="${BASH_REMATCH[2]}"
    33	                val="${val#"${val%%[![:space:]]*}"}"
    34	                val="${val%"${val##*[![:space:]]}"}"
    35	                case "$val" in
    36	                    '"'*|"'"*|'>'*|'|'*|'['*|'{'*) continue ;;
    37	                    '') continue ;;
    38	                esac
    39	                if printf '%s' "$val" | grep -qE ': '; then
    40	                    printf '%s: unquoted "%s:" value contains ": " (will break strict YAML)\n' "$f" "$key" >&2
    41	                    fail=1
    42	                fi
    43	            fi
    44	        done < <(printf '%s\n' "$fm")
    45	    done < <(find "$dir" -name SKILL.md -type f -print0)
    46	}
    47	
    48	scan_dir spec-bundle/skills/
    49	scan_dir .claude/skills
    50	
    51	if [ "$fail" = "0" ]; then
    52	    echo "skill frontmatter: clean"
    53	fi
    54	exit "$fail"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "ls -1 ../agentic-installation-methodology/research/primary-sources 2>/dev/null | sed -n '1,120p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
12-factor.md
INDEX.md
adr-nygard.md
adr-tools-state.md
arc42.md
c4-model.md
cucumber-gherkin.md
diataxis.md
helm-values-schema.md
kiro.md
leaddev-agent-compiled.md
nix-flakes.md
oci-artifacts.md
openapi-3-1.md
openspec.md
oracle-agent-spec.md
ref-arch-vs-solution-arch.md
sigstore-cosign.md
spec-kit.md
structurizr-dsl.md
symphony-spec.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"§5\\.1|5\\.1|facets|facet|manifest|catalog|SBOM|hash|digest|provenance|schema\" ../agentic-installation-methodology/specs ../agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md ../agentic-installation-methodology/research/primary-sources/oci-artifacts.md 2>/dev/null | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:8:fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:10:  OCI artifacts are research §5.1's "spec-as-distribution-
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:14:  manifest+config+layers structure, the descriptor model,
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:36:  — 2026-05-19; returned spec scope + manifest/config/
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:42:  an OCI Image, consisting of an image manifest, an image
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:48:  manifest "contains metadata about the contents and
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:63:  downloaded, verified by hash, trusted through a
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:70:  payloads (SBOMs, signatures, Helm charts, arbitrary
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:82:- A "front-door manifest + per-facet sub-specs" SPEC
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:83:  bundle MAPS directly onto OCI: the manifest is the
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:84:  bundle's front-door manifest; layers are the per-facet
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:87:- Content-addressing by hash gives the methodology its
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:90:  developer published, by digest.
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:91:- Artifacts guidance covers non-image payloads (SBOMs,
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:103:  component image: manifest, optional index, filesystem
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:107:  metadata, and content address; verification is by hash."
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:109:  image spec to non-image payloads (SBOMs, signatures,
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:113:  door manifest as OCI manifest; per-facet sub-specs as
../agentic-installation-methodology/research/primary-sources/oci-artifacts.md:114:  OCI layers; per-spec content-addressing by digest."
../agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md:112:  is consistent' — the methodology's versioning facet
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:114:├── 02-phase-1-facet-inventory.md
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:117:├── 05-phase-4-manifest-catalog-compose.md
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:152:- `file://../../schema/SPEC.schema.md` — citation
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:176:  LICENSE, README.md, research, schema, scripts, specs,
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:199:| `02-phase-1-facet-inventory.md` | Phase 1 | Classifying every artefact by facet |
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:202:| `05-phase-4-manifest-catalog-compose.md` | Phase 4 | Composing the front-door manifest + per-facet sub-specs |
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:277:The four+ failure modes catalogued in the research
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:337:3. T-03 chapter 02 Phase 1 (facet inventory).
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:340:6. T-06 chapter 05 Phase 4 (manifest+catalog compose).
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:354:informed by the Phase 1-2 facet inventory rather than
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:355:the other way around." The facet inventory is already
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:356:done (Product A v2.0 §6.2 facets at the sibling repo);
../agentic-installation-methodology/specs/2026-05-20-longread-structure/SPEC.md:629:      a phase-flow diagram, a manifest+catalog shape
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:85:- Repacking Product A v1.1 into manifest+catalog v2.0
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:135:- `file://schema/SPEC.schema.md` — citation grammar,
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:136:  RFC 2119 scoping rules, front-matter schema.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:172:| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:175:| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:176:| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:177:| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:178:| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:187:| cucumber-gherkin | Cucumber / Gherkin reference | `url://cucumber.io/docs/gherkin/reference/` | Behavioral acceptance primitive; research §5.1 |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:188:| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:189:| structurizr-dsl | Structurizr DSL (C4 implementation) | `url://docs.structurizr.com/dsl` | Machine-readable C4; research §5.1 |
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:194:### 6.2 Per-source artefact schema
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:208:fetch_evidence: "<one-line digest of fetch result or
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:225:   with one-line outcome digests.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:310:   `research/primary-sources/<slug>.md` per §6.2 schema.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:369:fetch_evidence:     # string; required; one-line digest
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:374:### 8.2 INDEX.md row schema (formal)
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:457:the URL and content digest at fetch time; downstream
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:458:agents that re-fetch SHOULD verify the digest matches.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:495:      slug, conforming to §6.2 schema + §8.1 front-matter.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:519:      schema check.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:553:provenance is preserved.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:576:      that should land in v1.0? Specifically: SPDX/SBOM
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:613:  artefacts, all conforming to §6.2 schema + §8.1
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:621:  - helm-values-schema (customization-affordance)
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:658:  to §6.2 schema + §8.1 front-matter.
../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:672:  §8.1 schema (manual review).
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:37:(schema, templates, scripts, hooks, hook test harness, CI) —
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:40:(`file://schema/SPEC.schema.md` §1.3) so the repo's own SPEC
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:103:- `file://schema/SPEC.schema.md` §1.3 — capture-after
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:154:├── schema/SPEC.schema.md
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:198:4. Copy Product A v1.1 scaffold verbatim (schema, templates,
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:290:- `schema/SPEC.schema.md` — Product A v1.1 verbatim.
../agentic-installation-methodology/specs/2026-05-18-repo-standup/SPEC.md:328:  natural sync point; the repack's manifest+catalog

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../agentic-installation-methodology/research/primary-sources/oci-artifacts.md 2>/dev/null | sed -n '1,180p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	slug: oci-artifacts
     3	source_name: "OCI Image Specification + Artifacts Guidance"
     4	primary_url: "https://github.com/opencontainers/image-spec/blob/main/spec.md"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched OCI image-spec main spec.md; manifest + descriptor + artifacts guidance verbatim"
     9	methodology_relevance: |
    10	  OCI artifacts are research §5.1's "spec-as-distribution-
    11	  artifact" packaging primitive — the published SPEC bundle
    12	  can be distributed as an OCI artifact for content-
    13	  addressed, signed delivery. This corpus entry anchors the
    14	  manifest+config+layers structure, the descriptor model,
    15	  and the artifacts-vs-images distinction so the
    16	  methodology can cite OCI precisely when prescribing the
    17	  SPEC bundle's distribution shape.
    18	---
    19	
    20	# OCI Image Specification + Artifacts Guidance
    21	
    22	## 1. Source identity
    23	
    24	- Name: OCI Image Specification.
    25	- Canonical URL: `url://github.com/opencontainers/image-spec/blob/main/spec.md`.
    26	- Maintainer: Open Container Initiative (Linux
    27	  Foundation).
    28	- Companion: Artifacts Guidance at
    29	  `url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`
    30	  (referenced from main spec; not deep-read in this
    31	  pass).
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://github.com/opencontainers/image-spec/blob/main/spec.md`
    36	  — 2026-05-19; returned spec scope + manifest/config/
    37	  layers + descriptor + artifacts-guidance reference.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **OCI Image definition**: "This specification defines
    42	  an OCI Image, consisting of an image manifest, an image
    43	  index (optional), a set of filesystem layers, and a
    44	  configuration." (`url://github.com/opencontainers/image-spec/blob/main/spec.md`)
    45	
    46	- **Image Manifest**: "a document describing the
    47	  components that make up a container image." The
    48	  manifest "contains metadata about the contents and
    49	  dependencies of the image including the
    50	  content-addressable identity of one or more filesystem
    51	  layer changeset archives."
    52	
    53	- **Image Configuration**: "a document determining layer
    54	  ordering and configuration of the image suitable for
    55	  translation into a runtime bundle."
    56	
    57	- **Filesystem Layer**: "a changeset that describes a
    58	  container's filesystem."
    59	
    60	- **Descriptor**: "a reference that describes the type,
    61	  metadata and content address of referenced content."
    62	  Descriptors enable images to be "discovered by name,
    63	  downloaded, verified by hash, trusted through a
    64	  signature, and unpacked into an OCI Runtime Bundle."
    65	
    66	- **OCI Artifacts** (`url://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md`):
    67	  the artifacts guidance "describing how to use the spec
    68	  for packaging content other than OCI images" —
    69	  indicating OCI registries can carry non-runtime
    70	  payloads (SBOMs, signatures, Helm charts, arbitrary
    71	  blobs).
    72	
    73	## 4. Fact-link to methodology
    74	
    75	<!-- lint-ok: no-citation -->
    76	
    77	OCI artifacts are the published-spec distribution
    78	primitive that the methodology's SPEC bundle MAY adopt.
    79	Key shape implications for the methodology's distribution
    80	posture:
    81	
    82	- A "front-door manifest + per-facet sub-specs" SPEC
    83	  bundle MAPS directly onto OCI: the manifest is the
    84	  bundle's front-door manifest; layers are the per-facet
    85	  sub-specs as separate blobs; descriptors give content-
    86	  addressing for each.
    87	- Content-addressing by hash gives the methodology its
    88	  "verifiable spec" affordance — the user-with-agent can
    89	  verify the spec bundle they fetched matches what the
    90	  developer published, by digest.
    91	- Artifacts guidance covers non-image payloads (SBOMs,
    92	  signatures, Helm charts) — the methodology's published
    93	  SPEC bundle fits naturally into this category.
    94	
    95	## 5. Downstream-citation surface
    96	
    97	<!-- lint-ok: no-citation -->
    98	
    99	Methodology claims licensed by this entry (cite as
   100	`file://research/primary-sources/oci-artifacts.md §3`):
   101	
   102	- methodology-claim: "OCI Image Spec defines a four-
   103	  component image: manifest, optional index, filesystem
   104	  layers, configuration."
   105	- methodology-claim: "OCI Descriptors enable content-
   106	  addressing — every component is referenced by type,
   107	  metadata, and content address; verification is by hash."
   108	- methodology-claim: "OCI Artifacts Guidance extends the
   109	  image spec to non-image payloads (SBOMs, signatures,
   110	  Helm charts, methodology spec bundles)."
   111	- methodology-claim: "The methodology's published SPEC
   112	  bundle MAY be distributed as an OCI artifact: front-
   113	  door manifest as OCI manifest; per-facet sub-specs as
   114	  OCI layers; per-spec content-addressing by digest."
   115	
   116	## 6. Open questions surfaced by the primary read
   117	
   118	- The OCI Distribution Spec (separate from Image Spec)
   119	  governs registry behaviour (push, pull, list, delete).
   120	  Not deep-read in this pass; if methodology specifies a
   121	  distribution channel, fetch as supplementary primary
   122	  read.
   123	- Helm v3 supports OCI registries natively; the
   124	  intersection of OCI artifacts + Helm + Sigstore
   125	  signing is a real-world precedent — the methodology
   126	  MAY recommend this exact stack but should anchor each
   127	  primitive separately rather than as a Helm-specific
   128	  recipe.
   129	- The Artifacts Guidance doc itself was not deep-read on
   130	  this pass; if methodology proposes specific media-type
   131	  conventions for SPEC bundle artefacts, fetch the
   132	  guidance for the type-naming conventions.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md 2>/dev/null | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	slug: leaddev-agent-compiled
     3	source_name: "LeadDev — Can you trust the spec? The risky future of agent-compiled software"
     4	primary_url: "https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched LeadDev article; core risk hypothesis + Lukaas Kruger patching quote + Simon Willison mitigation verbatim"
     9	methodology_relevance: |
    10	  This is the closest published statement of the
    11	  agentic-installation hypothesis — framed as a RISK,
    12	  not as a method. The methodology Product B publishes
    13	  the same hypothesis as PROCEDURE (with the risks
    14	  named and acknowledged). This corpus entry anchors
    15	  the risk framing, the patching-semantics quote, and
    16	  Willison's hybrid mitigation so the methodology can
    17	  cite the LeadDev article precisely as the prior-art
    18	  critique it must address.
    19	---
    20	
    21	# LeadDev — Can You Trust the Spec?
    22	
    23	## 1. Source identity
    24	
    25	- Title: "Can you trust the spec? The risky future of
    26	  agent-compiled software".
    27	- Publisher: LeadDev.
    28	- Canonical URL: `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`.
    29	- Status: published critique; closest in-the-wild
    30	  articulation of the agentic-installation hypothesis
    31	  framed as a risk surface.
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`
    36	  — 2026-05-19; returned core risk hypothesis,
    37	  patching-semantics quote, Willison mitigation.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **Core risk hypothesis** (verbatim from the article):
    42	  "In regulated environments, organizations must be
    43	  able to say with precision what code was running at
    44	  the time of an incident, demonstrate it was tested,
    45	  and show it was authorised."
    46	  (`url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software`)
    47	
    48	- **Patching-semantics quote** (attributed to Lukaas
    49	  Kruger, Klarus founder): "Patching is no longer
    50	  'Deploy version 2.1.4' but 'Update the spec and hope
    51	  every downstream compilation behaves consistently.'"
    52	
    53	- **Concrete failure mode** (verbatim): "If every
    54	  deployment compiles a slightly different agent-built
    55	  version from a shared spec, incident response becomes
    56	  an archaeology problem."
    57	
    58	- **Simon Willison mitigation** (attributed): leverage
    59	  "custom plugins and API integrations — which can be
    60	  vibe coded as much as you like, but benefit from
    61	  taking to a core system that's standardized and
    62	  tested and understood." Hybrid approach: customise
    63	  the periphery, standardise the core.
    64	
    65	## 4. Fact-link to methodology
    66	
    67	<!-- lint-ok: no-citation -->
    68	
    69	The LeadDev article is the methodology's most direct
    70	honest-posture obligation. The methodology Product B
    71	publishes the same hypothesis as procedure; it MUST
    72	address the risks LeadDev names rather than dismiss
    73	them.
    74	
    75	Implications for the methodology:
    76	
    77	- The §7 failure-modes section of the longread MUST
    78	  cite this article as the prior-art critique.
    79	- The methodology's seven open research questions
    80	  (research workpad §2.3) cover exactly the surfaces
    81	  LeadDev names — particularly Q3 (versioning and
    82	  patching semantics), Q4 (install-matches-intent
    83	  verification), Q5 (equivalence classes of valid
    84	  implementations).
    85	- Willison's hybrid mitigation (custom periphery +
    86	  standardised core) is the methodology's reference-
    87	  implementation/extensions split made concrete by
    88	  another voice.
    89	
    90	## 5. Downstream-citation surface
    91	
    92	<!-- lint-ok: no-citation -->
    93	
    94	Methodology claims licensed by this entry (cite as
    95	`file://research/primary-sources/leaddev-agent-compiled.md
    96	§3`):
    97	
    98	- methodology-claim: "The agentic-installation
    99	  hypothesis — that developers ship specs and users
   100	  agent-compile their own deployments — has been
   101	  articulated in published form as a risk (LeadDev,
   102	  Kruger, Willison) before being articulated as a
   103	  procedure."
   104	- methodology-claim: "In regulated environments, the
   105	  'what code was running at the time of incident'
   106	  obligation is unmet by agent-compiled software unless
   107	  the SPEC + compilation outcome is reproducibly
   108	  verifiable."
   109	- methodology-claim: "Patching semantics under
   110	  agentic-installation shift from 'deploy version X.Y.Z'
   111	  to 'update spec and verify downstream re-compilation
   112	  is consistent' — the methodology's versioning facet
   113	  must address this directly."
   114	- methodology-claim: "Hybrid customise-periphery
   115	  /standardise-core (Willison) is a viable mitigation
   116	  the methodology endorses for safety-critical paths."
   117	
   118	## 6. Open questions surfaced by the primary read
   119	
   120	- The article does not propose a solution; it names
   121	  the risks. The methodology takes the risks as open
   122	  research questions (research §2.3) rather than
   123	  claiming to resolve them — this corpus read confirms
   124	  the framing is appropriate.
   125	- The regulated-environments framing (audit, incident
   126	  response, authorisation traces) is more prominent in
   127	  the LeadDev article than in the dispositioned
   128	  research workpad. The methodology longread should
   129	  surface compliance + audit traceability as a
   130	  first-class concern, not bury it.
   131	- Kruger's "hope every downstream compilation behaves
   132	  consistently" phrasing is the methodology's
   133	  acknowledged tension: deterministic build-from-spec
   134	  is the goal; "hope it works" is the failure mode the
   135	  methodology's reproducibility primitives (Nix,
   136	  Sigstore-anchored bundle versioning) try to close.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for p in spec-bundle/architecture/../../research/primary-sources/arc42.md spec-bundle/customization/../../research/primary-sources/leaddev-agent-compiled.md spec-bundle/behavior/features/../../../research/primary-sources/cucumber-gherkin.md; do test -e "$p" && echo "exists $p" || echo "missing $p"; done' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
missing spec-bundle/architecture/../../research/primary-sources/arc42.md
missing spec-bundle/customization/../../research/primary-sources/leaddev-agent-compiled.md
missing spec-bundle/behavior/features/../../../research/primary-sources/cucumber-gherkin.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"file://(\\.\\./){2,3}research/primary-sources\" spec-bundle | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/deployment/requirements.md:4:(`file://../../research/primary-sources/12-factor.md` §3):
spec-bundle/deployment/requirements.md:32:  (`file://../../research/primary-sources/symphony-spec.md` §3).
spec-bundle/deployment/requirements.md:49:products (`file://../../research/primary-sources/nix-flakes.md`
spec-bundle/architecture/solution-strategy.md:4:(`file://../../research/primary-sources/arc42.md` §3).
spec-bundle/architecture/solution-strategy.md:61:`file://../../research/primary-sources/arc42.md` §3):
spec-bundle/architecture/solution-strategy.md:79:`file://../../research/primary-sources/c4-model.md` §3),
spec-bundle/architecture/CONTEXT.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
spec-bundle/architecture/CONTEXT.md:6:(`file://../../research/primary-sources/c4-model.md` §3),
spec-bundle/architecture/CONTEXT.md:76:  (`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/operations/safety-invariants.md:4:(`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/customization/contract.md:3:The novel facet per research §4.1 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/customization/contract.md:6:(`file://../../research/primary-sources/helm-values-schema.md`
spec-bundle/operations/observability.md:4:(`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/operations/failures.md:5:(`file://../../research/primary-sources/symphony-spec.md`
spec-bundle/quality/12-factor-overlay.md:4:(`file://../../research/primary-sources/12-factor.md`
spec-bundle/quality/requirements.md:4:(`file://../../research/primary-sources/arc42.md` §3) and
spec-bundle/quality/requirements.md:119:  `file://../../research/primary-sources/12-factor.md` §3.
spec-bundle/behavior/features/lint-citation-grammar.feature:3:  (file://../../../research/primary-sources/cucumber-gherkin.md §3)
spec-bundle/decisions/INDEX.md:4:template (`file://../../research/primary-sources/adr-nygard.md`
spec-bundle/decisions/INDEX.md:31:  (`file://../../research/primary-sources/adr-nygard.md`
spec-bundle/decisions/INDEX.md:36:  (`file://../../research/primary-sources/adr-tools-state.md`
spec-bundle/non-goals/INDEX.md:3:The second novel facet per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`
spec-bundle/non-goals/INDEX.md:20:  `file://../../research/primary-sources/c4-model.md` §3.
spec-bundle/non-goals/INDEX.md:112:Per research §4.2 (`file://../../research/primary-sources/leaddev-agent-compiled.md`

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find research -maxdepth 2 -type f 2>/dev/null | sed -n '1,20p'; test -d research; echo research_dir_exit:"'$?' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
research_dir_exit:1

codex
A larger migration issue is now clear: the new facet files repeatedly cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists one directory over, so those citations are not resolvable under the schema’s “path must exist” rule.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n -o 'file://["'^` )'"\\],;]+' spec-bundle README.md AGENTS.md CONTRIBUTING.md OPERATING_MODEL.md examples scripts specs | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:46:file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:52:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:54:file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:73:file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:168:file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:172:file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:175:file://schema/SPEC.schema.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:180:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:182:file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:184:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:186:file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:188:file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:190:file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:192:file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:194:file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:196:file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:198:file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:203:file://CHANGELOG.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:239:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:318:file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:328:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:344:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:348:file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:351:file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:355:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:365:file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:376:file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:382:file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:395:file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:405:file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:422:file://../../../agentic-installation-methodology/research/primary-sources/arc42.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:429:file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:437:file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:675:file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:925:file://schema/...
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:926:file://templates/...
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:926:file://skills/...
specs/2026-05-18-v1.0-release-foundations/SPEC.md:118:file://CHANGELOG.md
specs/2026-05-18-v1.0-release-foundations/SPEC.md:120:file://OPERATING_MODEL.md
scripts/validate-manifest.sh:4:file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
scripts/audit-entry-docs.sh:15:file://agents/skills/agents-md-improver/SKILL.md
scripts/audit-fleet-compliance.sh:12:file://skills/cross-repo-policy-enforcement/SKILL.md
scripts/audit-fleet-compliance.sh:13:file://docs/fleet-directives.md
scripts/send-fleet-message.sh:16:file://skills/cross-repo-informational-channel/SKILL.md
scripts/send-fleet-message.sh:17:file://skills/cross-repo-informational-channel/SKILL.md
scripts/send-fleet-message.sh:18:file://workpads/AGENT_INBOX.template.md
scripts/send-fleet-message.sh:47:file://...
scripts/send-fleet-message.sh:161:file://...
scripts/lint-spec.sh:4:file://OPERATING_MODEL.md
scripts/lint-spec.sh:5:file://templates/SPEC.schema.md
scripts/lint-spec.sh:140:file://specs/<id>/IDEA.md
scripts/lint-spec.sh:369:file://|cmd://|url://|owner://|decision-authority://|judgment://owner|judgment://agent-synthesis
scripts/lint-spec.sh:592:file://'
AGENTS.md:92:file://<path>
examples/fastpath-fix-readme-typo/SPEC.md:28:file://README.md
examples/fastpath-fix-readme-typo/SPEC.md:35:file://README.md
examples/decision-conventional-commits/SPEC.md:33:file://scripts/generate-changelog.sh
examples/decision-conventional-commits/SPEC.md:36:file://docs/release-process.md
examples/decision-conventional-commits/SPEC.md:38:file://docs/release-notes/v2.4.0.md
examples/decision-conventional-commits/SPEC.md:39:file://docs/release-notes/v2.5.1.md
examples/decision-conventional-commits/SPEC.md:57:file://scripts/generate-changelog.sh
examples/decision-conventional-commits/SPEC.md:59:file://examples/decision-conventional-commits/IDEA.md
examples/decision-conventional-commits/SPEC.md:92:file://scripts/generate-changelog.sh
examples/decision-conventional-commits/SPEC.md:218:file://examples/decision-conventional-commits/SPEC.md
examples/decision-conventional-commits/SPEC.md:239:file://scripts/generate-changelog.sh
examples/decision-conventional-commits/SPEC.md:278:file://docs/conventional-commits-hook.example.sh
examples/decision-conventional-commits/IDEA.md:29:file://scripts/generate-changelog.sh
examples/decision-conventional-commits/IDEA.md:33:file://docs/release-process.md
examples/decision-conventional-commits/IDEA.md:38:file://docs/release-notes/v2.4.0.md
examples/decision-conventional-commits/IDEA.md:39:file://docs/release-notes/v2.5.1.md
examples/decision-conventional-commits/IDEA.md:59:file://scripts/generate-changelog.sh
examples/decision-conventional-commits/IDEA.md:61:file://docs/release-process.md
examples/decision-conventional-commits/IDEA.md:63:file://docs/release-notes/v2.4.0.md
examples/decision-conventional-commits/IDEA.md:64:file://docs/release-notes/v2.5.1.md
examples/decision-conventional-commits/IDEA.md:76:file://scripts/generate-changelog.sh
spec-bundle/quality/12-factor-overlay.md:4:file://../../research/primary-sources/12-factor.md
spec-bundle/quality/requirements.md:4:file://../../research/primary-sources/arc42.md
spec-bundle/quality/requirements.md:119:file://../../research/primary-sources/12-factor.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:36:file://examples/contract-webhook-signing/SPEC.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:63:file://examples/contract-webhook-signing/SPEC.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:65:file://examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:68:file://OPERATING_MODEL.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:83:file://workflow/UNIVERSAL.md
examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md:155:file://workflow/UNIVERSAL.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:35:file://examples/contract-webhook-signing/SPEC.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:60:file://examples/contract-webhook-signing/SPEC.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:62:file://examples/contract-webhook-signing/IDEA.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:65:file://OPERATING_MODEL.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:80:file://workflow/UNIVERSAL.md
examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md:158:file://workflow/UNIVERSAL.md
spec-bundle/decisions/INDEX.md:4:file://../../research/primary-sources/adr-nygard.md
spec-bundle/decisions/INDEX.md:26:file://../../specs/
spec-bundle/decisions/INDEX.md:31:file://../../research/primary-sources/adr-nygard.md
spec-bundle/decisions/INDEX.md:36:file://../../research/primary-sources/adr-tools-state.md
examples/contract-webhook-signing/SPEC.md:32:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/SPEC.md:33:file://services/webhooks/queue/worker.go
examples/contract-webhook-signing/SPEC.md:38:file://docs/support/recurring-questions.md
examples/contract-webhook-signing/SPEC.md:41:file://services/webhooks/queue/worker.go
examples/contract-webhook-signing/SPEC.md:43:file://docs/compliance/soc2-2025.md
examples/contract-webhook-signing/SPEC.md:84:file://services/webhooks/internal/keystore/keystore.go
examples/contract-webhook-signing/SPEC.md:86:file://services/webhooks/internal/signing/signer.go
examples/contract-webhook-signing/SPEC.md:88:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/SPEC.md:91:file://docs/webhooks/verifying.md
examples/contract-webhook-signing/SPEC.md:93:file://docs/webhooks/examples/<lang>/verify.<ext>
examples/contract-webhook-signing/SPEC.md:162:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/SPEC.md:163:file://docs/webhooks/index.md
examples/contract-webhook-signing/SPEC.md:164:file://docs/compliance/soc2-2025.md
examples/contract-webhook-signing/SPEC.md:165:file://services/webhooks/queue/queue.go
examples/contract-webhook-signing/SPEC.md:248:file://docs/webhooks/verifying.md
examples/contract-webhook-signing/SPEC.md:433:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/SPEC.md:460:file://docs/customer-onboarding.md
examples/contract-webhook-signing/SPEC.md:469:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/IDEA.md:24:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/IDEA.md:25:file://services/webhooks/queue/worker.go
examples/contract-webhook-signing/IDEA.md:32:file://docs/support/recurring-questions.md
examples/contract-webhook-signing/IDEA.md:41:file://docs/compliance/soc2-2025.md
examples/contract-webhook-signing/IDEA.md:45:file://services/webhooks/dispatcher.go
examples/contract-webhook-signing/IDEA.md:47:file://services/webhooks/queue/worker.go
examples/contract-webhook-signing/IDEA.md:49:file://services/webhooks/queue/queue.go
examples/contract-webhook-signing/IDEA.md:61:file://docs/compliance/soc2-2025.md
examples/contract-webhook-signing/IDEA.md:62:file://docs/support/recurring-questions.md
spec-bundle/customization/knobs.schema.json:5:file://../../specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
spec-bundle/customization/knobs.schema.json:5:file://contract.md."
spec-bundle/behavior/features/lint-citation-grammar.feature:3:file://../../../research/primary-sources/cucumber-gherkin.md
spec-bundle/behavior/features/lint-citation-grammar.feature:5:file://../../schema/SPEC.schema.md
spec-bundle/non-goals/INDEX.md:3:file://../../research/primary-sources/leaddev-agent-compiled.md
spec-bundle/non-goals/INDEX.md:20:file://../../research/primary-sources/c4-model.md
spec-bundle/non-goals/INDEX.md:112:file://../../research/primary-sources/leaddev-agent-compiled.md
examples/task-add-structured-logging/SPEC.md:34:file://services/auth/handlers/login.go
examples/task-add-structured-logging/SPEC.md:35:file://services/auth/middleware/session.go
examples/task-add-structured-logging/SPEC.md:37:file://docs/oncall/auth-incidents.md
examples/task-add-structured-logging/SPEC.md:40:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/SPEC.md:64:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/SPEC.md:82:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/SPEC.md:84:file://test/load/auth-baseline.k6.js
examples/task-add-structured-logging/SPEC.md:86:file://test/load/auth-baseline.results.json
examples/task-add-structured-logging/SPEC.md:111:file://services/auth/README.md
examples/task-add-structured-logging/SPEC.md:112:file://docs/oncall/auth-incidents.md
examples/task-add-structured-logging/SPEC.md:113:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/SPEC.md:118:file://services/auth/internal/authlog/authlog.go
examples/task-add-structured-logging/SPEC.md:144:file://services/auth/middleware/logging.go
examples/task-add-structured-logging/SPEC.md:180:file://services/auth/internal/authlog/authlog.go
examples/task-add-structured-logging/SPEC.md:181:file://services/auth/internal/authlog/authlog_test.go
examples/task-add-structured-logging/SPEC.md:182:file://services/auth/middleware/logging.go
examples/task-add-structured-logging/SPEC.md:183:file://services/auth/middleware/logging_test.go
examples/task-add-structured-logging/SPEC.md:184:file://services/auth/handlers/login.go
examples/task-add-structured-logging/SPEC.md:185:file://services/auth/handlers/signup.go
examples/task-add-structured-logging/SPEC.md:186:file://services/auth/handlers/logout.go
examples/task-add-structured-logging/SPEC.md:187:file://services/auth/middleware/session.go
examples/task-add-structured-logging/SPEC.md:188:file://services/auth/internal/audit/audit.go
examples/task-add-structured-logging/SPEC.md:189:file://services/auth/internal/oauth/google.go
examples/task-add-structured-logging/SPEC.md:190:file://services/auth/README.md
examples/task-add-structured-logging/SPEC.md:191:file://docs/oncall/auth-incidents.md
examples/task-add-structured-logging/SPEC.md:207:file://services/auth/cmd/server/main.go
examples/task-add-structured-logging/SPEC.md:213:file://test/load/auth-baseline.results.json
examples/task-add-structured-logging/SPEC.md:222:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/SPEC.md:269:file://test/load/auth-baseline.results.json
examples/task-add-structured-logging/SPEC.md:284:file://services/auth/cmd/server/main.go
examples/task-add-structured-logging/SPEC.md:287:file://services/auth/internal/authlog/
examples/task-add-structured-logging/IDEA.md:24:file://services/auth/handlers/login.go
examples/task-add-structured-logging/IDEA.md:25:file://services/auth/middleware/session.go
examples/task-add-structured-logging/IDEA.md:26:file://docs/oncall/auth-incidents.md
examples/task-add-structured-logging/IDEA.md:32:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/IDEA.md:38:file://services/auth/handlers/login.go
examples/task-add-structured-logging/IDEA.md:40:file://services/auth/middleware/session.go
examples/task-add-structured-logging/IDEA.md:42:file://services/auth/internal/audit/audit.go
examples/task-add-structured-logging/IDEA.md:44:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/IDEA.md:46:file://docs/oncall/auth-incidents.md
examples/task-add-structured-logging/IDEA.md:61:file://infra/logging/pipeline.yaml
examples/task-add-structured-logging/IDEA.md:77:file://test/load/auth-baseline.k6.js
examples/task-add-structured-logging/IDEA.md:132:file://infra/logging/pipeline.yaml
spec-bundle/customization/contract.md:3:file://../../research/primary-sources/leaddev-agent-compiled.md
spec-bundle/customization/contract.md:6:file://../../research/primary-sources/helm-values-schema.md
spec-bundle/customization/contract.md:19:file://../templates/
spec-bundle/customization/contract.md:24:file://../schema/SPEC.schema.md
spec-bundle/customization/contract.md:111:file://../skills/autonomous-issue-dispatch/SKILL.md
spec-bundle/architecture/solution-strategy.md:4:file://../../research/primary-sources/arc42.md
spec-bundle/architecture/solution-strategy.md:61:file://../../research/primary-sources/arc42.md
spec-bundle/architecture/solution-strategy.md:79:file://../../research/primary-sources/c4-model.md
spec-bundle/architecture/CONTEXT.md:4:file://../../research/primary-sources/arc42.md
spec-bundle/architecture/CONTEXT.md:6:file://../../research/primary-sources/c4-model.md
spec-bundle/architecture/CONTEXT.md:24:file://../schema/SPEC.schema.md
spec-bundle/architecture/CONTEXT.md:26:file://../templates/
spec-bundle/architecture/CONTEXT.md:27:file://../../scripts/lint-spec.sh
spec-bundle/architecture/CONTEXT.md:29:file://../skills/
spec-bundle/architecture/CONTEXT.md:31:file://../../hooks/
spec-bundle/architecture/CONTEXT.md:35:file://../../tests/hooks/run-tests.sh
spec-bundle/architecture/CONTEXT.md:37:file://../../examples/
spec-bundle/architecture/CONTEXT.md:38:file://../../.github/workflows/ci.yml
spec-bundle/architecture/CONTEXT.md:76:file://../../research/primary-sources/symphony-spec.md
spec-bundle/operations/safety-invariants.md:4:file://../../research/primary-sources/symphony-spec.md
spec-bundle/operations/failures.md:5:file://../../research/primary-sources/symphony-spec.md
spec-bundle/operations/failures.md:66:file://X
spec-bundle/operations/observability.md:4:file://../../research/primary-sources/symphony-spec.md
spec-bundle/schema/SPEC.schema.md:211:file://<repo-relative-or-absolute-path>
spec-bundle/schema/SPEC.schema.md:268:file://OPERATING_MODEL.md
spec-bundle/schema/SPEC.schema.md:270:file://specs/2026-01-15-example-procedure-v1/IDEA.md
spec-bundle/templates/SPEC.decision.template.md:61:file://[path
spec-bundle/templates/SPEC.decision.template.md:69:file://[path
spec-bundle/templates/SPEC.decision.template.md:74:file://[path
spec-bundle/templates/SPEC.decision.template.md:87:file://[path
spec-bundle/templates/SPEC.decision.template.md:146:file://[path
spec-bundle/templates/SPEC.contract.template.md:54:file://templates/SPEC.schema.md
spec-bundle/templates/SPEC.contract.template.md:58:file://specs/<id>/IDEA.md
spec-bundle/templates/SPEC.contract.template.md:101:file://[path
spec-bundle/templates/SPEC.contract.template.md:106:file://[path
spec-bundle/templates/SPEC.contract.template.md:116:file://[path
spec-bundle/templates/SPEC.contract.template.md:253:file://templates/SPEC.schema.md
spec-bundle/templates/SPEC.contract.template.md:257:file://specs/<id>/IDEA.md
spec-bundle/templates/SPEC.contract.template.md:308:file://specs/<id>/IDEA.md
spec-bundle/templates/SPEC.task.template.md:78:file://[path
spec-bundle/templates/SPEC.task.template.md:85:file://[path/to/current-doc.md
spec-bundle/templates/SPEC.task.template.md:89:file://[path/to/old-doc.md
spec-bundle/templates/SPEC.task.template.md:102:file://[path
spec-bundle/templates/SPEC.task.template.md:156:file://[path/to/file
spec-bundle/templates/SPEC.task.template.md:157:file://[path/to/other-file
spec-bundle/templates/SPEC.task.template.md:184:file://[path
spec-bundle/templates/workpads/AGENT_INBOX.template.md:18:file://skills/cross-repo-informational-channel/SKILL.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md:19:file://skills/cross-repo-informational-channel/SKILL.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md:25:file://agents/skills/repo-orientation/SKILL.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md:54:file://specs/<id>/SPEC.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:file://agents/specs/SPEC.schema.md
spec-bundle/templates/TASK.template.md:50:file://skills/approved-spec-decomposition/SKILL.md
spec-bundle/templates/TASK.template.md:70:file://templates/SPEC.schema.md
spec-bundle/templates/TASK.template.md:83:file://specs/{{parent_spec}}/SPEC.md
spec-bundle/templates/TASK.template.md:100:file://AGENTS.md
spec-bundle/templates/TASK.template.md:101:file://specs/{{parent_spec}}/SPEC.md
spec-bundle/templates/TASK.template.md:102:file://your
spec-bundle/templates/TASK.template.md:109:file://workflow/UNIVERSAL.md
spec-bundle/templates/TASK.template.md:178:file://workflow/UNIVERSAL.md
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:15:file://workflow/UNIVERSAL.md
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:16:file://skills/repo-orientation/SKILL.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md:24:file://agents/MODEL_ROUTING.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:file://agents/specs/SPEC.schema.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md:56:file://agents/MODEL_ROUTING.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:file://agents/specs/TASK.template.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:file://agents/specs/SPEC.schema.md
spec-bundle/templates/IDEA.template.md:46:file://[path
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:8:file://skills/agent-feedback/SKILL.md
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md:9:file://workflows/agent-feedback.md
spec-bundle/deployment/requirements.md:4:file://../../research/primary-sources/12-factor.md
spec-bundle/deployment/requirements.md:32:file://../../research/primary-sources/symphony-spec.md
spec-bundle/deployment/requirements.md:49:file://../../research/primary-sources/nix-flakes.md
spec-bundle/templates/SPEC.fastpath.template.md:17:file://skills/fast-path/SKILL.md
spec-bundle/templates/SPEC.fastpath.template.md:23:file://skills/spec-driven-development/SKILL.md
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:4:file://agents/skills/approved-spec-decomposition/SKILL.md
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:17:file://agents/skills/approved-spec-decomposition/SKILL.md
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:file://agents/templates/WORKFLOW.body.md
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:44:file://agents/skills/code-review/SKILL.md
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:46:file://agents/skills/spec-review/SKILL.md
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:57:file://...
spec-bundle/deployment/install.md:32:file://../skills/agents-md-improver/SKILL.md
spec-bundle/deployment/install.md:45:file://../skills/cross-repo-policy-enforcement/SKILL.md
spec-bundle/deployment/install.md:46:file://../skills/cross-repo-informational-channel/SKILL.md
spec-bundle/deployment/install.md:52:file://../../scripts/fleet-*.example.txt
spec-bundle/skills/verification/SKILL.md:44:file://your
spec-bundle/skills/code-review/SKILL.md:58:file://your
spec-bundle/skills/spec-review/SKILL.md:8:file://examples/reference-procedure-spec
spec-bundle/skills/spec-review/SKILL.md:10:file://templates/SPEC.schema.md
spec-bundle/skills/spec-review/SKILL.md:91:file://specs/<id>/IDEA.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/SPEC.contract.template.md | sed -n '45,65p;245,265p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    45	artefact.
    46	
    47	## 1. Problem Statement
    48	
    49	<!-- guidance: state the contract's reason-for-being. Cite the
    50	producing IDEA.md and any owner directives. Three-failure-mode
    51	framing is RECOMMENDED.
    52	
    53	Capture-after defer-shorthand (status: verified only): per
    54	`file://templates/SPEC.schema.md` §1.3 and the 2026-01-15
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
   245	## 13. Test and Validation Matrix
   246	
   247	<!-- guidance: 1:1 with Acceptance Criteria in §15. No orphan tests; no
   248	unverified criteria. Each row has a unique Test ID referenced from §15
   249	and §14.
   250	
   251	Capture-after defer-shorthand (status: verified only): when this
   252	SPEC lands at `status: verified` via the capture-after exception
   253	(`file://templates/SPEC.schema.md` §1.3) and the validation
   254	matrix is fully exercised by the front-matter `acceptance_commands`
   255	plus a citation to the producing IDEA's §13, this section MAY be
   256	a one-paragraph cite-by-id pointer to the IDEA — e.g. "See
   257	`file://specs/<id>/IDEA.md` §13 (capture-after defer); the
   258	front-matter `acceptance_commands` constitute the validation
   259	matrix in this mode." Lint enforces this shorthand only when
   260	status is verified AND the IDEA is cited. -->
   261	
   262	| Test ID | What is verified | Method | Severity |
   263	|---|---|---|---|
   264	| T01 | [criterion 1] | [command / manual] | Blocking |
   265	| T02 | [criterion 2] | [command / manual] | Blocking |

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/TASK.template.md | sed -n '45,75p;100,115p;170,185p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
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
    70	`file://templates/SPEC.schema.md` §2.
    71	-->
    72	
    73	# TASK: [Slice Title]
    74	
    75	## 1. Goal
   100	- `file://AGENTS.md`
   101	- `file://specs/{{parent_spec}}/SPEC.md`
   102	- `file://your model-routing policy` (before any subagent dispatch)
   103	- [other repo-specific reads]
   104	
   105	### 3.3 Out of scope
   106	
   107	Explicit non-goals for this slice. Surface as backlog tracker issues
   108	if discovered during execution per
   109	`file://workflow/UNIVERSAL.md` "Universal guardrails".
   110	
   111	## 4. Model dispatch
   112	
   113	| Lane | Model | Role |
   114	|---|---|---|
   115	| Primary | `{{model_route}}` | Implementation + workpad management. |
   170	
   171	Once dispatched:
   172	
   173	- Tracker issue: `{{tracker_issue}}`
   174	- PR (when opened): [URL]
   175	- Workpad comment ID: [tracker comment id]
   176	
   177	The tracker issue's `## Workpad` comment is the live execution
   178	journal per `file://workflow/UNIVERSAL.md` Step 1.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/SPEC.fastpath.template.md | sed -n '1,40p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	id: [YYYY-MM-DD-kebab-case-topic]
     3	status: closed
     4	type: fastpath
     5	owner: [owner-identifier]
     6	repo: [repo-name]
     7	branch_policy: worktree-preferred
     8	risk: low
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands: []
    12	ideated_in: null
    13	---
    14	
    15	<!--
    16	Fast-path SPEC template. Use ONLY when ALL fast-path thresholds in
    17	`file://skills/fast-path/SKILL.md` "Thresholds" are met. If
    18	your work exceeds any threshold, escalate to a full task/contract/
    19	decision SPEC via the standard `/idea-capture` → `/author-spec`
    20	flow.
    21	
    22	Fast-path SPECs use the **capture-after** pattern by default
    23	(`file://skills/spec-driven-development/SKILL.md`
    24	"Exception: capture-after"): the work is performed first under
    25	owner directive, then this SPEC is filed as the citable authority
    26	record. The artefact lands at `status: closed` in the same commit
    27	as the work itself, never later.
    28	
    29	NO ceremony: no IDEA artefact, no blocking review gate, no
    30	decomposition, no cross-validation lane (covered by the work
    31	itself being small enough to be reviewed inline). Owner approval
    32	is the inline commit message.
    33	
    34	Fast-path SPECs MUST cite their authorising owner directive in §3.
    35	-->
    36	
    37	# SPEC (fast-path): [Title]
    38	
    39	## Normative Language
    40	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-review/SKILL.md | sed -n '1,30p;80,100p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: spec-review
     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
     4	---
     5	
     6	# Spec Review
     7	
     8	Authority: `file://examples/reference-procedure-spec`
     9	§10, §11.3, §17.3. Shared schema:
    10	`file://templates/SPEC.schema.md` §5.
    11	
    12	This skill is **BLOCKING**. A spec MUST NOT advance to
    13	`approved-pending-owner` while any blocking criterion fails. The
    14	skill MUST NOT set `status: approved` — only the owner does that
    15	(SPEC §7.6, schema §1.3).
    16	
    17	Per-type gate criteria live in
    18	[`references/per-type-gates.md`](references/per-type-gates.md). Read
    19	that file as part of running the gate; this SKILL.md governs
    20	selection, mechanics, and output.
    21	
    22	## When to use
    23	
    24	- A primary or sub agent has just authored or revised a `SPEC.md`
    25	  and needs the gate to determine whether the spec is ready for
    26	  owner approval.
    27	- A primary agent has just run `/idea-capture` and needs the IDEA
    28	  gate (§10.1) to determine whether the IDEA can transition from
    29	  `draft` to `ready-for-spec`.
    30	- Any review-time event re-opens a previously-approved spec for
    80	RECOMMENDED. The skill SHOULD run it and record advisory entries;
    81	it MUST NOT treat lint exit 1 as blocking for these types unless
    82	the gate otherwise requires the underlying check.
    83	
    84	## Contract capture-after defer-shorthand check
    85	
    86	Per the ceremony-weight Decision (`judgment://agent-synthesis`),
    87	Contract SPECs landing at `status: verified` via the
    88	capture-after exception MAY use a one-paragraph defer-shorthand
    89	in §1 Problem Statement and §13 Test and Validation Matrix. The
    90	shorthand pattern: a single paragraph whose only substantive
    91	content is a `file://specs/<id>/IDEA.md` cite pointing at the
    92	producing IDEA's §1 / §13.
    93	
    94	The Contract per-type gate MUST add the following BLOCKING
    95	check when the SPEC under review has `status: verified` AND
    96	either §1 or §13 body appears to be defer-shorthand
    97	(≤ 3 non-blank non-comment lines, all citation-prefixed,
    98	including a `file://specs/<id>/IDEA.md` cite):
    99	
   100	1. Resolve the cited IDEA section by path.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/approved-spec-decomposition/SKILL.md | sed -n '1,70p;110,125p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: approved-spec-decomposition
     3	description: "BLOCKING. Use after a SPEC.md is approved and before in-execution to emit one TASK.md per executable slice into specs/<id>/tasks/. Each TASK.md binds a tracker issue 1:1, carries primary/cross-validation/verification model lanes, and gates the parent SPEC's transition approved -> decomposed -> in-execution. Tasks become the source-of-truth dispatchable units; agents and autonomous dispatch runners anchor on them."
     4	---
     5	
     6	# Approved Spec Decomposition
     7	
     8	This skill is the **authoritative bridge artefact** between an
     9	approved SPEC and dispatchable work. It runs after
    10	`status: approved` and before `status: in-execution`.
    11	
    12	It is no longer a planning aid. It produces durable TASK.md files
    13	that dispatch runners + subagents execute against. The
    14	parent SPEC remains the immutable authority (Completion Report
    15	aside); the TASK.md files are the executable contracts for each
    16	slice and the 1:1 binding to tracker issues.
    17	
    18	## When to use
    19	
    20	- A SPEC.md has front-matter `status: approved` and contains a §11
    21	  Execution Plan (Task SPEC) or §11 / §14 / §15 Implementation
    22	  Checklist (Contract SPEC) that names ≥ 2 distinct slices, OR
    23	- The owner has directed decomposition for parallel execution per
    24	  `file://agents/MODEL_ROUTING.md` "Routing Matrix" (multi-agent
    25	  coding row).
    26	
    27	Skip when:
    28	
    29	- The SPEC is small enough to execute as one slice; in that case
    30	  emit a single TASK.md and proceed.
    31	- The SPEC is a Decision SPEC (Decision SPECs do not have
    32	  implementation phases; their cascade is by id-citation per
    33	  `judgment://agent-synthesis` §3).
    34	
    35	## Preconditions
    36	
    37	REFUSE to proceed unless:
    38	
    39	1. `<spec_path>` exists with parseable front-matter.
    40	2. `status: approved` (set by owner per
    41	   `file://agents/specs/SPEC.schema.md` §1.3).
    42	3. Acceptance commands present, OR explicit explanation of empty
    43	   list in §12 Acceptance Criteria.
    44	4. Open Questions resolved.
    45	5. Write ownership can be bounded (each slice has disjoint
    46	   `owned_files` per
    47	   `judgment://agent-synthesis`
    48	   §6.1.1).
    49	
    50	If any precondition fails, stop and surface the exact blocker with a
    51	file/line citation. Do NOT emit TASK.md files.
    52	
    53	## Procedure
    54	
    55	1. Read the approved SPEC end-to-end.
    56	2. Read `file://agents/MODEL_ROUTING.md` "Routing Matrix" to map task
    57	   classes to model lanes.
    58	3. Read the parent SPEC's §11 Execution Plan (Task) or §11/§14/§15
    59	   (Contract). Each slice in the plan becomes one TASK.md.
    60	4. For each slice, copy `file://agents/specs/TASK.template.md` to
    61	   `specs/<parent_spec_id>/tasks/T-NN-<slug>.md` and fill in:
    62	   - `id` — `T-NN-<slug>` matching the file name.
    63	   - `parent_spec` — the SPEC's id.
    64	   - `status` — `todo`.
    65	   - `owner` — `unassigned`.
    66	   - `model_route` — primary lane from your studio's model-
    67	     routing policy for the slice's `task_class` (research,
    68	     implementation, code-review, verification, docs, planning).
    69	     Pick one frontier-grade model from the family best suited
    70	     to the task class.
   110	   Index and the Parallelism Decision Record (Decision: `fanout` |
   111	   `local`; Rationale: …; Lanes: …) per
   112	   `judgment://agent-synthesis`
   113	   §8.1.
   114	9. Owner reviews the decomposition. **One-shot approval**, not
   115	   per-task. On owner directive, flip the parent SPEC's status
   116	   `approved → decomposed`. The skill MUST NOT set the status; only
   117	   the owner does (extends the existing owner-only `approved` /
   118	   `closed` rule from
   119	   `file://agents/specs/SPEC.schema.md` §1.3).
   120	10. After owner approval, agents may dispatch tasks. Each TASK.md's
   121	    tracker issue is created (manually or via tooling); the task's
   122	    `tracker_issue` field is filled. the dispatcher picks up the issue and
   123	    runs the per-issue workspace.
   124	
   125	## AFK Eligibility (per task)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md | sed -n '1,55p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Cross-validation lane assignment
     2	
     3	Extracted from
     4	`file://agents/skills/approved-spec-decomposition/SKILL.md` per
     5	the references/ progressive-disclosure convention (SE1 capture
     6	in
     7	`judgment://agent-synthesis`).
     8	
     9	## When to read this
    10	
    11	Fires only when:
    12	- you are emitting TASK.md slices during decomposition AND
    13	- you are choosing the per-slice `cross_validation_lane` model
    14	  family (BLOCKING rule per the parent skill).
    15	
    16	For routine decomposition orchestration, read the spine of
    17	`file://agents/skills/approved-spec-decomposition/SKILL.md`;
    18	this reference covers only the cross-validation lane mechanics.
    19	
    20	## Pattern
    21	
    22	Every TASK.md MUST name a `cross_validation_lane` of a different
    23	model family from `model_route`. The cross-validation review
    24	runs between `in-progress` and `in-review`:
    25	
    26	1. Primary agent finishes implementation; opens PR.
    27	2. Cross-validation agent (different family) is dispatched as a
    28	   subagent or as a separate tracker-issue review run, scoped
    29	   to:
    30	   - Read-only access to the diff and the parent SPEC.md.
    31	   - Output: findings list ordered by severity, file/line
    32	     citations, no edits.
    33	3. Findings are recorded in the workpad `Validation` section.
    34	4. Primary agent addresses findings (code/test/docs) or posts
    35	   explicit pushback per the PR feedback sweep protocol in
    36	   `file://agents/templates/WORKFLOW.body.md` "PR feedback
    37	   sweep protocol".
    38	5. Only after cross-validation findings are resolved does the
    39	   task flip `in-progress → in-review`.
    40	
    41	## Skill responsibilities
    42	
    43	The `code-review` skill at
    44	`file://agents/skills/code-review/SKILL.md` and the
    45	`spec-review` skill at
    46	`file://agents/skills/spec-review/SKILL.md` are the executors
    47	of cross-validation; this skill (`approved-spec-decomposition`)
    48	names the lane.
    49	
    50	## Fallback when cross-family dispatch is impossible
    51	
    52	Per SE2 (capture in
    53	`judgment://agent-synthesis`),
    54	when the execution context cannot dispatch cross-family (e.g.
    55	Claude Code only spawns Claude-family subagents), the honest

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/workpads/AGENT_INBOX.template.md | sed -n '1,35p;80,95p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# AGENT_INBOX.md — [Repo Name]
     2	
     3	Incoming message channel for this repo. **Read on session start;
     4	write only to OTHER repos' inboxes** (via the
     5	`send-fleet-message.sh` helper or `/send-message` slash-command).
     6	
     7	Counterpart to `AGENT_FEEDBACK.md` (outgoing — agents in this repo
     8	write here for fleet triage). Sibling to fleet-directives (which
     9	require enforcement; messages here are informational handoffs).
    10	
    11	**Purpose:** when your-policy-repo or another fleet agent has
    12	context the next-session agent in this repo needs — a fleet-rule
    13	change, a cross-repo handoff, a "pick up from here" note — that
    14	context lives in a durable per-repo inbox rather than vanishing
    15	into chat.
    16	
    17	**Authority:**
    18	`file://skills/cross-repo-informational-channel/SKILL.md`;
    19	`file://skills/cross-repo-informational-channel/SKILL.md`.
    20	
    21	## How to use
    22	
    23	**On session start (every agent in this repo):** read the last 5
    24	inbox entries as part of Step 0 orientation (see
    25	`file://agents/skills/repo-orientation/SKILL.md` Step 3). Each
    26	entry tells you something that changed externally or hands off
    27	work continuation.
    28	
    29	**On message ack:** if a message is `expects_ack: true`, append an
    30	acknowledgement entry to the bottom of the original message
    31	block:
    32	```
    33	- 2026-MM-DD HH:MM — <agent-id>: read + ack
    34	```
    35	
    80	
    81	- Inbox entries are immutable once written. Acknowledgements append
    82	  below the original entry.
    83	- Owner alone may archive entries older than 90 days to
    84	  `AGENT_INBOX.archive.md`.
    85	- Truncate this file to the most recent 50 entries on archival;
    86	  do not let it grow unboundedly.
    87	- Entries citing facts MUST use the citation grammar
    88	  (`file://agents/specs/SPEC.schema.md` §2).
    89	- Do NOT include secrets, credentials, or third-party private
    90	  data. Inboxes are git-tracked or working-tree visible to any
    91	  agent landing locally.
    92	- Do NOT write to your own repo's inbox (it's an incoming
    93	  channel). Use AGENT_FEEDBACK.md for outgoing-to-fleet content
    94	  or another repo's AGENT_INBOX.md for outgoing-to-peer-repo
    95	  content.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/templates/workpads/SESSION_JOURNAL.template.md | sed -n '1,25p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# SESSION_JOURNAL.md — [Repo Name]
     2	
     3	Per-repo session continuity journal. Append-only. The universal
     4	form of the an autonomous-dispatch runner workpad pattern: where an autonomous-dispatch runner writes one
     5	`## Workpad` comment per tracker ticket, every other agent
     6	context (Claude Code interactive, an agent runner CLI, owner-led `wt` worktree)
     7	writes here.
     8	
     9	**Purpose:** close the asymmetric-tightness gap — an autonomous-dispatch runner runs have
    10	workpad continuity in tracker comments; interactive sessions had
    11	nothing. This journal is read in Step 0 orientation by ALL agents
    12	(dispatched or interactive) and appended on session end.
    13	
    14	**Authority:**
    15	`file://workflow/UNIVERSAL.md` "Section 1 — Universal";
    16	`file://skills/repo-orientation/SKILL.md` Step 2.
    17	
    18	## How to use
    19	
    20	**On session start (every agent):** read the last 3 entries. They
    21	tell you what the previous agent did, what was left dirty, what the
    22	next agent should pick up.
    23	
    24	**On session end (every agent):** append a new entry using the
    25	template below. Run via `/log-session` slash-command, or write

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-skill-frontmatter.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
skill frontmatter: clean

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 150ms:
== lint-spec.sh summary ==
target:                examples/contract-webhook-signing/tasks/T-01-signer-and-keystore.md
artefact / type:       spec / <unset>
sections (top-level):  8
citation-prefix hits:  9
lowercase 2119 hits:   0 (advisory only)
errors:                2
warnings:              0

 exited 1 in 150ms:
== lint-spec.sh summary ==
target:                examples/contract-webhook-signing/tasks/T-02-dispatcher-integration.md
artefact / type:       spec / <unset>
sections (top-level):  8
citation-prefix hits:  9
lowercase 2119 hits:   0 (advisory only)
errors:                2
warnings:              0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/lint-spec.sh | sed -n '330,420p;560,620p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   330	    fi
   331	done
   332	
   333	# ---------- Decision SPEC scope rule ----------
   334	if [[ "$ARTEFACT" == "spec" && "$TYPE" == "decision" ]]; then
   335	    UPPER_RE='\b(MUST NOT|SHOULD NOT|SHALL NOT|MUST|SHOULD|MAY|REQUIRED|RECOMMENDED|OPTIONAL|SHALL)\b'
   336	    in_fence=0
   337	    for ((i=fm_end; i<total_lines; i++)); do
   338	        line="${LINES[$i]}"
   339	        if [[ "$line" =~ ^\`\`\` ]]; then in_fence=$((1-in_fence)); continue; fi
   340	        (( in_fence )) && continue
   341	        [[ "$line" =~ ^# ]] && continue
   342	        sec_idx=-1
   343	        for ((s=0; s<${#section_starts[@]}; s++)); do
   344	            if (( i >= section_starts[s] && i <= section_ends[s] )); then sec_idx=$s; break; fi
   345	        done
   346	        (( sec_idx < 0 )) && continue
   347	        title="${section_titles_all[$sec_idx]}"
   348	        case "$title" in *"Decision Statement"*|"Normative Language") continue ;; esac
   349	        clean="$(strip_code "$line")"
   350	        if [[ "$clean" =~ $UPPER_RE ]]; then
   351	            kw="${BASH_REMATCH[1]}"
   352	            emit_err "decision-scope" $((i+1)) "RFC 2119 keyword '$kw' outside Decision Statement (Decision SPEC)"
   353	        fi
   354	    done
   355	fi
   356	
   357	# ---------- Citation-prefix audit ----------
   358	content_heavy_title() {
   359	    local t="$1"
   360	    case "$t" in
   361	        *"Problem"*|*"Substance Citations"*|*"Authority Map"*|*"Code/Docs Reality Check"*|\
   362	        *"Domain Model"*|*"Acceptance Criteria"*|*"Constraints"*|*"Current System Facts"*|\
   363	        *"Decision Criteria"*|*"Candidate Options"*|*"Failure Model"*|*"Trust Boundary"*|\
   364	        *"Observability"*|*"Test Plan"*|*"Test and Validation Matrix"*|*"Migration"*) return 0 ;;
   365	    esac
   366	    return 1
   367	}
   368	
   369	CITE_RE='(file://|cmd://|url://|owner://|decision-authority://|judgment://owner|judgment://agent-synthesis)'
   370	SUPPRESS_CITE='<!-- lint-ok: no-citation -->'
   371	
   372	# Pre-scan: count citation prefixes per section (for inheritance).
   373	declare -a section_cite_counts
   374	for ((idx=0; idx<${#section_starts[@]}; idx++)); do
   375	    cnt=0
   376	    for ((j=section_starts[idx]; j<=section_ends[idx]; j++)); do
   377	        local_line="${LINES[$j]}"
   378	        # Count each prefix occurrence (rough — duplicates within a line
   379	        # count once per regex match limit; sufficient for the >=2 gate).
   380	        if [[ "$local_line" =~ $CITE_RE ]]; then
   381	            cnt=$((cnt + 1))
   382	        fi
   383	    done
   384	    section_cite_counts+=("$cnt")
   385	done
   386	
   387	# Editorial cross-reference detection.
   388	# Per SPEC.schema §2.3: section cross-references and editorial framing
   389	# do not require citation. Patterns recognised here are conservative —
   390	# we look for paragraphs whose primary content is an internal section
   391	# reference or a list/table-intro phrase.
   392	is_pure_xref() {
   393	    local buf="$1"
   394	    local trimmed="${buf#"${buf%%[![:space:]]*}"}"
   395	    trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"
   396	    # Single-line pure cross-reference patterns (case-insensitive starts).
   397	    case "$trimmed" in
   398	        [Ss]ee\ §*|\
   399	        [Pp]er\ §*|\
   400	        [Mm]irrors\ §*|\
   401	        [Mm]aps\ to\ §*|\
   402	        [Pp]er\ §[0-9]*|\
   403	        "Per the table above"*|\
   404	        "The following sections"*|"The following entities"*|\
   405	        "Each criterion"*|"Each row"*|"Each Acceptance Criterion"*|\
   406	        "Each box maps to"*) return 0 ;;
   407	    esac
   408	    # Short paragraph that contains "§<number>" as a clear cross-reference
   409	    # and otherwise lacks unique fact markers (no quotes, no path).
   410	    if [[ "$trimmed" =~ §[0-9]+ ]]; then
   411	        # Length heuristic: ≤ 200 chars, no quotes, no /-path.
   412	        if (( ${#trimmed} <= 220 )) && [[ "$trimmed" != *'"'* ]] && [[ ! "$trimmed" =~ /[A-Za-z0-9._-]+/ ]]; then
   413	            # Phrase-level imperative detector — only treat as xref when the
   414	            # paragraph "is about" the cross-reference, not when it asserts
   415	            # an external fact AND happens to mention §N.
   416	            case "$trimmed" in
   417	                *"is specified in §"*|*"specified in §"*|\
   418	                *"defined in §"*|*"defined per §"*|\
   419	                *"per §"*|*"Per §"*|\
   420	                *"see §"*|*"See §"*|\
   560	    [[ "$line" =~ ^# ]] && continue
   561	    [[ "$line" =~ ^\| ]] && continue
   562	    if [[ -z "${line// }" ]]; then
   563	        if [[ -n "$para_buf" ]]; then
   564	            flush_paragraph "$para_first" "$cur_sec" "$cur_sec_idx" "$para_buf"
   565	            para_buf=""; para_first=0
   566	        fi
   567	        continue
   568	    fi
   569	    # List-item boundary: lines starting with "- ", "* ", or "<digit>+. "
   570	    # at column 0 begin a new logical paragraph (markdown list semantics).
   571	    # Indented continuations of the previous item still join.
   572	    is_list_marker=0
   573	    if [[ "$line" =~ ^(-[[:space:]]|\*[[:space:]]|[0-9]+\.[[:space:]]) ]]; then
   574	        is_list_marker=1
   575	    fi
   576	    if (( is_list_marker )) && [[ -n "$para_buf" ]]; then
   577	        flush_paragraph "$para_first" "$cur_sec" "$cur_sec_idx" "$para_buf"
   578	        para_buf=""; para_first=0
   579	    fi
   580	    if [[ -z "$para_buf" ]]; then
   581	        para_first=$((i+1))
   582	        para_buf="$line"
   583	    else
   584	        para_buf="$para_buf $line"
   585	    fi
   586	done
   587	[[ -n "$para_buf" ]] && flush_paragraph "$para_first" "$cur_sec" "$cur_sec_idx" "$para_buf"
   588	
   589	# ---------- Summary ----------
   590	n_sections=${#observed_titles[@]}
   591	n_cites=0
   592	for prefix in 'file://' 'cmd://' 'url://' 'owner://' 'decision-authority://' 'judgment://owner' 'judgment://agent-synthesis'; do
   593	    c=$(grep -c -F -- "$prefix" "$TARGET" || true)
   594	    n_cites=$((n_cites + c))
   595	done
   596	n_lc=0
   597	for kw in must should may shall required recommended optional; do
   598	    c=$(grep -c -w -E -- "(^|[^A-Za-z\`])$kw([^A-Za-z\`]|\$)" "$TARGET" || true)
   599	    n_lc=$((n_lc + c))
   600	done
   601	
   602	printf '== lint-spec.sh summary ==\n'
   603	printf 'target:                %s\n' "$TARGET"
   604	printf 'artefact / type:       %s / %s\n' "$ARTEFACT" "${TYPE:-<unset>}"
   605	printf 'sections (top-level):  %d\n' "$n_sections"
   606	printf 'citation-prefix hits:  %d\n' "$n_cites"
   607	printf 'lowercase 2119 hits:   %d (advisory only)\n' "$n_lc"
   608	printf 'errors:                %d\n' "${#errors[@]}"
   609	printf 'warnings:              %d\n' "${#warnings[@]}"
   610	
   611	if (( ${#errors[@]} > 0 )); then exit 1; fi
   612	if (( ${#warnings[@]} > 0 )); then exit 2; fi
   613	exit 0
   614	
   615	# Expected:
   616	#   lint-spec.sh good-task.md           -> exit 0
   617	#   lint-spec.sh bad-uncited.md         -> exit 1
   618	#   lint-spec.sh bad-missing-section.md -> exit 1

codex
**Quality Gate Result**
FAIL. The v2.0 structure exists and `validate-manifest.sh` passes, but the release is not gate-clean: one declared acceptance command fails, many new facet citations are non-resolving, and the validator is too weak for the manifest contract it claims to enforce.

Commands checked read-only:
`bash scripts/validate-manifest.sh` PASS; `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` PASS; `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` FAIL.

| Finding | File:line | Severity |
|---|---:|---|
| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
| `behavior.primary` is a directory, while the formal schema says `primary` is the facet entry file. The validator explicitly allows a primary directory, creating schema drift and an unstable entry point for behavior. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:31), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:581), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:149) | MEDIUM |
| `conformance_profile: core` is machine-readable, but `spec-bundle/conformance/` is empty and only prose says it is reserved for v2.x. That makes the scaffold disclosure honest in the changelog, but a fig leaf in the manifest contract. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:3), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:53), [CHANGELOG.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CHANGELOG.md:95) | MEDIUM |
| `validate-manifest.sh` has broad false negatives: no YAML parser, no required eight-facet set, no resource validation, no `path` validation, no semver/date validation, and no checks for required `intent` subfields beyond product name. | [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:45), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:118), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:621) | MEDIUM |
| The verified SPEC still carries stale completion state: body says “Status: Draft v1”, DoD remains unchecked, and AC-8 says the tag is pending even though `v2.0.0` now exists. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:21), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:710), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744) | LOW |

Facet-set take: the eight named facets are present, but not content-complete. The wrong grouping is `conformance` as a resource while the manifest advertises conformance profiles; it needs either first-class facet treatment or explicit reserved status. Behavior is also under-covered: only two feature files exist for a seven-hook plus lint/manifest framework.

Scaffold-grade verdict: honest in human prose, not honest enough in the machine contract. The manifest and validator should expose scaffold/reserved status directly, otherwise consumers see `core` and `PASS` where the release actually means “structural shell, richer content later.”
tokens used
200,893
**Quality Gate Result**
FAIL. The v2.0 structure exists and `validate-manifest.sh` passes, but the release is not gate-clean: one declared acceptance command fails, many new facet citations are non-resolving, and the validator is too weak for the manifest contract it claims to enforce.

Commands checked read-only:
`bash scripts/validate-manifest.sh` PASS; `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` PASS; `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` FAIL.

| Finding | File:line | Severity |
|---|---:|---|
| The SPEC declares `bash scripts/lint-spec.sh spec-bundle/manifest.yaml` as an acceptance command, but the command fails because `lint-spec.sh` only understands IDEA/SPEC front matter. CI also does not run this declared gate, so `status: verified` is overstated. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:11), [lint-spec.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/lint-spec.sh:24), [ci.yml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/.github/workflows/ci.yml:54) | BLOCKER |
| New facet files cite `file://../../research/primary-sources/...`, but this repo has no `research/` directory. The sibling corpus exists, but these file citations do not resolve under the schema rule that `file://` paths must exist. | [CONTEXT.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/architecture/CONTEXT.md:3), [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:211) | HIGH |
| v1.1 to v2.0 path migration is incomplete in shipped docs/templates/skills. Canonical resources still point at old `schema/`, `templates/`, `skills/`, `workflow/`, or `agents/` paths, so generated or followed artefacts will reference missing files. | [CONTRIBUTING.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CONTRIBUTING.md:22), [TASK.template.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/templates/TASK.template.md:50), [approved-spec-decomposition SKILL.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/skills/approved-spec-decomposition/SKILL.md:24) | HIGH |
| `fleet-sync.sh` was retained as a top-level v2.0 capability but still reads from `$SOURCE/agents/...`; this repo’s v2.0 layout has `spec-bundle/...`, not `agents/...`. That is a functional migration miss, not just stale prose. | [fleet-sync.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/fleet-sync.sh:44), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:121) | HIGH |
| Manifest schema is under-specified for a published bundle. It lacks a schema URI, source commit/tag binding, per-facet/resource media type, digest/content hash, size, SBOM/provenance refs, and explicit `complete/reserved/scaffold` status. Current records are only `path` + `primary`. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:24), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:579) | MEDIUM |
| `behavior.primary` is a directory, while the formal schema says `primary` is the facet entry file. The validator explicitly allows a primary directory, creating schema drift and an unstable entry point for behavior. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:31), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:581), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:149) | MEDIUM |
| `conformance_profile: core` is machine-readable, but `spec-bundle/conformance/` is empty and only prose says it is reserved for v2.x. That makes the scaffold disclosure honest in the changelog, but a fig leaf in the manifest contract. | [manifest.yaml](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/manifest.yaml:3), [README.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/README.md:53), [CHANGELOG.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/CHANGELOG.md:95) | MEDIUM |
| `validate-manifest.sh` has broad false negatives: no YAML parser, no required eight-facet set, no resource validation, no `path` validation, no semver/date validation, and no checks for required `intent` subfields beyond product name. | [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:45), [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:118), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:621) | MEDIUM |
| The verified SPEC still carries stale completion state: body says “Status: Draft v1”, DoD remains unchecked, and AC-8 says the tag is pending even though `v2.0.0` now exists. | [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:21), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:710), [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744) | LOW |

Facet-set take: the eight named facets are present, but not content-complete. The wrong grouping is `conformance` as a resource while the manifest advertises conformance profiles; it needs either first-class facet treatment or explicit reserved status. Behavior is also under-covered: only two feature files exist for a seven-hook plus lint/manifest framework.

Scaffold-grade verdict: honest in human prose, not honest enough in the machine contract. The manifest and validator should expose scaffold/reserved status directly, otherwise consumers see `core` and `PASS` where the release actually means “structural shell, richer content later.”
