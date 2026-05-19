Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e3e5f-e741-7c80-9a4c-932e1b781969
--------
user
Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-20-longread-structure/SPEC.md (Contract SPEC, status: in-execution; validator authored, chapters not yet) and the validator script scripts/validate-longread-structure.sh. The SPEC governs the methodology longread structure (8 000-12 000 words across 9 chapters mapping to Phase 0 + Phases 1-7). Look for: (1) chapter taxonomy gaps — is the 8-phase structure the right decomposition, or does gpt-5.5 see a different cut? (2) word-budget realism — are the per-chapter budgets plausible for the topics? (3) voice contract holes — does the first-person experiential rule actually work for every chapter (e.g. Phase 0 maturity-check is hard to first-person)? (4) citation-from-corpus rule enforceability — without a corpus-citation lint, how is this enforced? (5) failure-mode disclosure structure — does the three-element rule actually cover what chapter 08 needs? (6) BES attribution posture — any leakage risks from naming BES while keeping other product repos unnamed? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
codex
I’ll keep this read-only and review it as a gate, not as an implementation pass. I’m going to check the repo authority docs, the target SPEC, and the validator, then report only findings with file/line evidence.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|longread|agentic-ops-framework|Product B|Product A" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "pwd && rg --files | sed -n '1,160p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology
reviews/codex-2026-05-19/04-longread.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/01-parent-decision.md
research/primary-sources/INDEX.md
research/primary-sources/ref-arch-vs-solution-arch.md
research/primary-sources/adr-tools-state.md
research/primary-sources/openspec.md
research/primary-sources/oracle-agent-spec.md
research/primary-sources/structurizr-dsl.md
research/primary-sources/cucumber-gherkin.md
research/primary-sources/kiro.md
research/primary-sources/openapi-3-1.md
research/primary-sources/spec-kit.md
research/primary-sources/leaddev-agent-compiled.md
research/primary-sources/symphony-spec.md
research/primary-sources/12-factor.md
research/primary-sources/sigstore-cosign.md
research/primary-sources/oci-artifacts.md
research/primary-sources/nix-flakes.md
research/primary-sources/helm-values-schema.md
research/primary-sources/diataxis.md
research/primary-sources/adr-nygard.md
research/primary-sources/c4-model.md
research/primary-sources/arc42.md
CLAUDE.md
AGENTS.md
README.md
CONTRIBUTING.md
CODE_OF_CONDUCT.md
LICENSE
specs/2026-05-20-longread-structure/SPEC.md
templates/TASK.template.md
templates/SPEC.task.template.md
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
templates/SPEC.contract.template.md
templates/IDEA.template.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-18-repo-standup/SPEC.md
schema/SPEC.schema.md
hooks/block-edit-on-main.sh
hooks/block-ai-attribution.sh
hooks/block-git-add-all.sh
hooks/block-push-to-main.sh
scripts/validate-skill-frontmatter.sh
scripts/lint-spec.sh
hooks/block-verify-bypass.sh
scripts/check-corpus-completeness.sh
hooks/session-start-context.sh
hooks/verify-reminder.sh
scripts/validate-longread-structure.sh
tests/hooks/run-tests.sh
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/fixtures/msg-clean.txt

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
## main...origin/main
?? reviews/

codex
The memory registry had no direct hit for this new repo, so I’m staying with live repo evidence. The worktree is on `main` with untracked `reviews/`; I’ll ignore those unless they become directly relevant because this pass is scoped to the SPEC and validator.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba AGENTS.md | sed -n '1,220p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	# AGENTS.md — agentic-installation-methodology
     2	
     3	> Entry doc for AGENTS-aware tools (Codex, Cursor, Aider,
     4	> Jules, Copilot, and other AGENTS-spec consumers per
     5	> `https://agents.md`). Claude Code enters via `CLAUDE.md`
     6	> which imports this file.
     7	
     8	## What this repo is
     9	
    10	The home for **Product B** — a published methodology for
    11	**agentic installation**: developers publish exhaustive intent
    12	SPECs instead of binaries; user-with-agent installs from the
    13	SPEC locally, without a developer-in-the-loop support loop.
    14	
    15	Status: **v0.1 scaffold**. No methodology content has been
    16	authored yet. The scaffold ports Product A's spec procedure
    17	discipline verbatim so any subsequent authoring inherits the
    18	same lifecycle, citation grammar, lint, hooks, and CI.
    19	
    20	The sibling repo
    21	[`agentic-ops-framework`](https://github.com/buildepicshit/agentic-ops-framework)
    22	(Product A, v1.1) is the worked case study; the methodology
    23	authored here uses Product A's extraction-and-publication
    24	journey as its primary example.
    25	
    26	## Authority chain
    27	
    28	1. **Parent Decision SPEC** at
    29	   `bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
    30	   (status: verified) binds the shape, scope, and posture of
    31	   this repo's eventual content. Its §7 Decision Statement
    32	   enumerates the five slices that build this repo's content.
    33	2. **`schema/SPEC.schema.md`** — citation grammar, RFC 2119
    34	   scoping, front-matter conventions, status state machine.
    35	3. **`AGENTS.md`** (this file) — repo entry doc.
    36	4. **Active SPECs** under `specs/<id>/` — execution
    37	   contracts for in-flight slices.
    38	5. **Workpad notes / chat history / tool memory** — NEVER
    39	   authoritative. Inputs to your reasoning, not citable
    40	   evidence in artefacts.
    41	
    42	When sources conflict, stop and surface the conflict. Do not
    43	silently pick the convenient rule.
    44	
    45	## Spec lifecycle (per Product A v1.1)
    46	
    47	The 13-phase lifecycle is documented at
    48	`https://github.com/buildepicshit/agentic-ops-framework`
    49	`OPERATING_MODEL.md` and is honoured verbatim here. Short
    50	version:
    51	
    52	1. Preflight — read this AGENTS.md + the schema.
    53	2. Orient — read the active SPEC if one exists.
    54	3. Predict — identify scope-drift risks before authoring.
    55	4. Ideate — `IDEA.md` at `specs/<YYYY-MM-DD>-<slug>/`.
    56	5. Author — typed `SPEC.md` (task / contract / decision /
    57	   fastpath); IDEA must be `ready-for-spec` first.
    58	6. Review (BLOCKING) — per-type quality gate; never sets
    59	   `approved`.
    60	7. Owner approves — owner alone flips
    61	   `approved-pending-owner → approved`.
    62	8. Decompose (for Contract / Task with ≥ 2 slices) —
    63	   durable TASK.md slices under `specs/<id>/tasks/`.
    64	9. Dispatch — each TASK.md becomes a trackable unit of work.
    65	10. Execute — `implementation-execution` against the SPEC.
    66	11. Cross-validate (BLOCKING per task) — different-model-
    67	    family reviewer.
    68	12. Verify — acceptance commands pass; Completion Report
    69	    filled.
    70	13. Report + close — owner flips `verified → closed` after
    71	    spec-evidence governance pass.
    72	
    73	## Engineering standards
    74	
    75	- Conventional Commits 1.0.0.
    76	- Stage files explicitly by name. Do **not** use `git add -A`
    77	  or `git add .` (enforced by `block-git-add-all.sh`).
    78	- Do not commit machine-local files, secrets, or generated
    79	  output.
    80	- Do not add AI attribution to commits, PRs, or generated
    81	  output (enforced by `block-ai-attribution.sh`).
    82	- Do not bypass verify gates (enforced by
    83	  `block-verify-bypass.sh`).
    84	- Do not push to the protected branch unless an active SPEC
    85	  declares `branch_policy: main-direct` (enforced by
    86	  `block-edit-on-main.sh` + `block-push-to-main.sh`).
    87	
    88	## Citation discipline
    89	
    90	Every factual claim in every artefact MUST carry a citation
    91	prefix from the grammar (`file://`, `cmd://`, `url://`,
    92	`owner://`, `decision-authority://<role>:<date>`,
    93	`judgment://owner`, `judgment://agent-synthesis`). Memory and
    94	training data are inputs to your reasoning, not citable
    95	evidence in the artefact. The lint script enforces this.
    96	
    97	When a sentence is in fact editorial framing or an internal
    98	cross-reference, append `<!-- lint-ok: no-citation -->` per
    99	`schema/SPEC.schema.md` §2.5. Use sparingly.
   100	
   101	## Posture
   102	
   103	The methodology is offered as honest experience, not as
   104	prescription. Contributions and authoring should match that
   105	posture: name what you tried, name what you found, name what
   106	didn't work. Don't pretend certainty you don't have.
   107	
   108	The seven open research questions from the parent Decision
   109	SPEC's upstream research workpad are flagged as unresolved;
   110	the methodology helps address them, it does not pretend to
   111	solve them.
   112	
   113	## Branch and remote
   114	
   115	- Default branch: `main`.
   116	- Remote: `git@github.com:buildepicshit/agentic-installation-methodology.git`
   117	  (public, BES org).
   118	- The inaugural SPEC at `specs/2026-05-18-repo-standup/SPEC.md`
   119	  declares `branch_policy: main-direct`. Edits on main are
   120	  permitted while that SPEC is in `approved` /
   121	  `in-execution` / `verified` / `closed`.
   122	
   123	## See also
   124	
   125	- `CONTRIBUTING.md` — how to contribute under the lifecycle.
   126	- `CODE_OF_CONDUCT.md` — interaction norms.
   127	- `schema/SPEC.schema.md` — the schema this repo's SPECs
   128	  conform to.
   129	- `templates/` — the SPEC templates.
   130	- Parent Decision authority:
   131	  `bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
   132	- Sibling repo (worked case study):
   133	  `https://github.com/buildepicshit/agentic-ops-framework`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba schema/SPEC.schema.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-20-longread-structure/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	id: 2026-05-20-longread-structure
     3	status: in-execution
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-installation-methodology
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: false
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md
    13	  - test -d longread
    14	  - bash scripts/validate-longread-structure.sh
    15	cites_decision: 2026-05-18-agentic-installation-methodology
    16	---
    17	
    18	# SPEC: Longread Structure + Content Contract (Slice 3)
    19	
    20	Status: Draft v1
    21	Type: Contract
    22	Purpose: govern the engineering longread that, paired
    23	with the SPEC bundle (slice 4), constitutes Product B
    24	v1.0. Defines the eight-chapter structure (Phase 0 +
    25	Phases 1–7 per the parent Decision §7), per-chapter word
    26	budget, first-person experiential voice contract,
    27	citation-from-corpus rules, failure-mode disclosure
    28	expectations, and BES attribution posture. The longread
    29	content itself is authored under follow-on Task SPECs
    30	(one per chapter) that cite this Contract by id.
    31	
    32	## Normative Language
    33	
    34	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    35	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    36	document are to be interpreted as described in RFC 2119 and RFC 8174
    37	when, and only when, they appear in all capitals.
    38	
    39	## 1. Problem Statement
    40	
    41	The parent Decision SPEC at
    42	`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
    43	§7 binds Product B to ship a paired (longread + SPEC
    44	bundle) release. The SPEC bundle's structural contract
    45	landed at v2.0 of the sibling Product A repo. The
    46	longread — the narrative + case-study artefact aimed at
    47	human readers — has not yet been authored.
    48	
    49	Without a Contract SPEC for the longread's structure,
    50	chapter authoring would proceed without a per-chapter
    51	word budget, voice contract, or citation-from-corpus
    52	rule — producing prose that drifts from the rolls-royce
    53	posture
    54	(`owner://transcript-2026-05-18`) and the
    55	deep-research-not-bullshit constraint
    56	(`decision-authority://owner:2026-05-18`). This SPEC
    57	fixes the contract so per-chapter Task SPECs author
    58	against a stable shape.
    59	
    60	## 2. Goals and Non-Goals
    61	
    62	Goals:
    63	
    64	- Define the longread's eight-chapter structure mapping
    65	  to the methodology's Phase 0 + Phases 1–7
    66	  (`file://../2026-05-19-primary-source-research-corpus/SPEC.md`
    67	  §3.7 phase enumeration; original phase definitions in
    68	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    69	  §6).
    70	- Set per-chapter word budget (target + maximum) so
    71	  total longread length lands in the 8 000–12 000 word
    72	  range per parent Decision §7.
    73	- Set the first-person experiential voice contract
    74	  (per parent Decision §7 and research §8 Posture).
    75	- Set the citation-from-corpus rule: every methodology
    76	  primitive cited in the longread MUST resolve to a
    77	  primary-source corpus entry at
    78	  `file://../../research/primary-sources/<slug>.md §3`,
    79	  not to agent memory or prior summaries.
    80	- Set the failure-mode disclosure expectation: every
    81	  chapter that touches a known failure mode (research §7)
    82	  MUST surface it explicitly, not bury it.
    83	- Set the BES attribution posture: BES is named directly
    84	  throughout (per parent Decision §7 disposition Q4
    85	  "fully named — full transparency"). <!-- lint-ok: no-citation -->
    86	- Author `scripts/validate-longread-structure.sh` as a
    87	  mechanical gate verifying the longread directory has
    88	  the expected chapter files + word counts within budget.
    89	
    90	Non-goals:
    91	
    92	- Authoring the longread CONTENT (per-chapter Task SPECs
    93	  do that).
    94	- Defining the SPEC bundle's content layout (slice 4
    95	  covers that; this SPEC governs longread only).
    96	- Resolving the seven open research questions
    97	  (`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    98	  §2.3). The longread DISCLOSES them as open; it does
    99	  not resolve them.
   100	- Choosing publication channel(s) for the longread
   101	  (blog, paper, OCI artifact). The longread artefact
   102	  lives in this repo at `longread/`; downstream
   103	  publishing channels are a separate Task SPEC.
   104	
   105	## 3. System Overview
   106	
   107	The longread is a directory `longread/` at the repo
   108	root containing nine markdown files:
   109	
   110	```
   111	longread/
   112	├── 00-introduction.md       # frame + intent + posture
   113	├── 01-phase-0-maturity-check.md
   114	├── 02-phase-1-facet-inventory.md
   115	├── 03-phase-2-parameterization-surface.md
   116	├── 04-phase-3-sanitization-bar.md
   117	├── 05-phase-4-manifest-catalog-compose.md
   118	├── 06-phase-5-cross-family-validation.md
   119	├── 07-phase-6-ship.md
   120	└── 08-phase-7-failure-modes-as-first-class-content.md
   121	```
   122	
   123	The introduction (00) carries the narrative frame; the
   124	eight phase chapters (01–08) carry one phase each. The
   125	total target is 8 000–12 000 words across all nine
   126	files. A mechanical check script
   127	(`scripts/validate-longread-structure.sh`) verifies
   128	file presence + per-file word counts within budget.
   129	
   130	## 4. Authority Map
   131	
   132	Active authority:
   133	
   134	- `decision-authority://owner:2026-05-18` — owner
   135	  directive ("Do what is the rolls royce" + "base this
   136	  all in deep research, not make up bullshit"); binds
   137	  the longread's posture and depth.
   138	- Parent Decision SPEC at
   139	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   140	  §7 — binds longread shape (8–12K words; first-person;
   141	  BES case-study density; failure modes first-class)
   142	  and phase structure (Phase 0 + Phases 1–7).
   143	- Verified primary-source corpus at
   144	  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`
   145	  (status: verified) + the 20 artefacts at
   146	  `file://../../research/primary-sources/<slug>.md` —
   147	  the citable evidence base every chapter draws from.
   148	- Dispositioned research workpad at
   149	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   150	  §6 (phase definitions) + §7 (BES case-study data) +
   151	  §8 (posture) + §2.3 (seven open research questions).
   152	- `file://../../schema/SPEC.schema.md` — citation
   153	  grammar, RFC 2119 scoping, front-matter conventions.
   154	
   155	Stale, superseded, or evidence-only sources:
   156	
   157	- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   158	  — superseded research workpad; evidence only.
   159	
   160	Owner decisions required before implementation:
   161	
   162	- [ ] Confirm `longread/` is the right top-level
   163	      directory name (alternatives: `paper/`, `narrative/`,
   164	      `book/`). Default: `longread/`.
   165	- [ ] Confirm per-chapter word budget (§6.2 table)
   166	      lands within the 8 000–12 000 total band. Default:
   167	      yes; adjust per chapter as authoring surfaces real
   168	      length needs.
   169	
   170	## 5. Code/Docs Reality Check
   171	
   172	- The `longread/` directory does not yet exist at the
   173	  time this SPEC is authored (`cmd://ls
   174	  /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/`
   175	  returns AGENTS.md, CLAUDE.md, CONTRIBUTING.md, CODE_OF_CONDUCT.md,
   176	  LICENSE, README.md, research, schema, scripts, specs,
   177	  templates, tests, hooks, .github, .gitignore — no
   178	  longread directory).
   179	- The script `scripts/validate-longread-structure.sh`
   180	  does not yet exist; it is authored under this Contract.
   181	- The primary-source corpus at `research/primary-sources/`
   182	  is verified (slice 1.5,
   183	  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`
   184	  §17 Acceptance Criteria all checked). The longread
   185	  cites the corpus exclusively for methodology primitives.
   186	
   187	## 6. Domain Model
   188	
   189	### 6.1 Chapter taxonomy
   190	
   191	Eight chapters mapping to the methodology's phase
   192	structure per parent Decision §7 (Phase 0 + 1–7) +
   193	one introduction:
   194	
   195	| File | Phase | Title |
   196	|---|---|---|
   197	| `00-introduction.md` | n/a | Why agentic installation; what this longread is + is not; reader contract |
   198	| `01-phase-0-maturity-check.md` | Phase 0 | When a product is ready to be published as a deployment-grade SPEC |
   199	| `02-phase-1-facet-inventory.md` | Phase 1 | Classifying every artefact by facet |
   200	| `03-phase-2-parameterization-surface.md` | Phase 2 | What the spec parameterizes vs hard-codes (the deferral contract) |
   201	| `04-phase-3-sanitization-bar.md` | Phase 3 | Dropping studio context without dropping rigor |
   202	| `05-phase-4-manifest-catalog-compose.md` | Phase 4 | Composing the front-door manifest + per-facet sub-specs |
   203	| `06-phase-5-cross-family-validation.md` | Phase 5 | Validating by a different-family agent walkthrough |
   204	| `07-phase-6-ship.md` | Phase 6 | Shipping the SPEC bundle separately; cross-linking; signing |
   205	| `08-phase-7-failure-modes-as-first-class-content.md` | Phase 7 | Failure modes; open research questions; the honest posture |
   206	
   207	### 6.2 Per-chapter word budget
   208	
   209	| Chapter | Target words | Maximum words |
   210	|---|---|---|
   211	| 00-introduction | 800 | 1 200 |
   212	| 01-phase-0 | 800 | 1 100 |
   213	| 02-phase-1 | 1 000 | 1 400 |
   214	| 03-phase-2 | 1 000 | 1 400 |
   215	| 04-phase-3 | 900 | 1 200 |
   216	| 05-phase-4 | 1 200 | 1 600 |
   217	| 06-phase-5 | 1 000 | 1 400 |
   218	| 07-phase-6 | 800 | 1 100 |
   219	| 08-phase-7 | 1 500 | 2 000 |
   220	| **Total** | **9 000** | **12 400** |
   221	
   222	The total target lands in the parent Decision's
   223	8 000–12 000-word band. The maximum row gives ~4%
   224	margin for chapters that prove longer than estimated
   225	without breaching the band's upper bound.
   226	
   227	### 6.3 Voice contract
   228	
   229	Every chapter MUST follow the first-person experiential
   230	posture per parent Decision §7:
   231	
   232	- Use "we" / "we found" / "we tried" / "we abandoned"
   233	  for studio-experience narration.
   234	- Use direct quotation of owner transcripts
   235	  (`owner://transcript-<date>`) where load-bearing
   236	  rolls-royce / honesty directives anchor methodology
   237	  choices.
   238	- Use direct quotation of corpus entries
   239	  (`file://research/primary-sources/<slug>.md §3`) where
   240	  a primary-source claim is cited.
   241	- Avoid passive voice for studio actions (NOT "the
   242	  framework was extracted from"; YES "we extracted the
   243	  framework from").
   244	- Avoid third-person methodology-vendor voice (NOT "the
   245	  methodology recommends"; YES "we recommend" or "the
   246	  methodology Product B publishes recommends").
   247	- Acknowledge failure first-person: "we did not solve
   248	  this; we name it as an open question."
   249	
   250	### 6.4 Citation-from-corpus rule
   251	
   252	Every methodology primitive (arc42, C4, ADRs, Helm,
   253	Nix, OCI, Sigstore, Symphony, Cucumber, OpenAPI,
   254	Structurizr, Diátaxis, 12-factor, Spec Kit, Kiro,
   255	OpenSpec, Oracle Agent Spec, Cottmeyer's
   256	reference-architecture distinction, LeadDev critique)
   257	MUST cite the corresponding corpus entry at
   258	`file://research/primary-sources/<slug>.md §3`, NOT
   259	agent memory, NOT prior summaries, NOT direct external
   260	URLs as the primary anchor.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-longread-structure.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# validate-longread-structure.sh — mechanical completeness gate for
     3	# the longread directory at longread/.
     4	#
     5	# Authority: file://specs/2026-05-20-longread-structure/SPEC.md
     6	#   §6.1 (chapter taxonomy), §6.2 (per-chapter word budget),
     7	#   §8.2 (script contract), §9.1 / §9.2 (algorithms).
     8	#
     9	# Checks:
    10	# 1. longread/ exists at repo root.
    11	# 2. Each of the nine expected chapter files exists.
    12	# 3. Each file's word count is at or above the per-chapter
    13	#    in-progress floor (50 words) and at or below the §6.2 maximum.
    14	# 4. Total word count is above a permissive total floor and below
    15	#    the per-§6.2 ceiling with margin.
    16	#
    17	# At v1.0-release time the bounds tighten via --release-mode (target
    18	# 8000-12000 total per parent Decision §7); permissive mode is the
    19	# default during authoring.
    20	#
    21	# Word counting strips code fences, YAML blocks, and citation prefix
    22	# tokens (file://, cmd://, url://, owner://, judgment://,
    23	# decision-authority://) so only prose counts.
    24	#
    25	# Exit 0 iff valid; non-zero with diagnostics to stderr.
    26	
    27	set -uo pipefail
    28	
    29	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    30	REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    31	LONGREAD_DIR="$REPO_ROOT/longread"
    32	
    33	RELEASE_MODE=0
    34	if [ "${1:-}" = "--release-mode" ]; then
    35	    RELEASE_MODE=1
    36	fi
    37	
    38	# Per-chapter (target_words max_words) per SPEC §6.2.
    39	declare -A CHAPTER_MAX=(
    40	    [00-introduction.md]=1200
    41	    [01-phase-0-maturity-check.md]=1100
    42	    [02-phase-1-facet-inventory.md]=1400
    43	    [03-phase-2-parameterization-surface.md]=1400
    44	    [04-phase-3-sanitization-bar.md]=1200
    45	    [05-phase-4-manifest-catalog-compose.md]=1600
    46	    [06-phase-5-cross-family-validation.md]=1400
    47	    [07-phase-6-ship.md]=1100
    48	    [08-phase-7-failure-modes-as-first-class-content.md]=2000
    49	)
    50	
    51	# Expected file list in order.
    52	CHAPTER_FILES=(
    53	    "00-introduction.md"
    54	    "01-phase-0-maturity-check.md"
    55	    "02-phase-1-facet-inventory.md"
    56	    "03-phase-2-parameterization-surface.md"
    57	    "04-phase-3-sanitization-bar.md"
    58	    "05-phase-4-manifest-catalog-compose.md"
    59	    "06-phase-5-cross-family-validation.md"
    60	    "07-phase-6-ship.md"
    61	    "08-phase-7-failure-modes-as-first-class-content.md"
    62	)
    63	
    64	# In-progress bounds.
    65	PER_CHAPTER_FLOOR=50
    66	TOTAL_FLOOR=450     # 9 * 50
    67	
    68	# Release-mode bounds (per parent Decision §7).
    69	RELEASE_TOTAL_MIN=8000
    70	RELEASE_TOTAL_MAX=12000
    71	
    72	errors=()
    73	
    74	err() {
    75	    errors+=("$1")
    76	}
    77	
    78	# Count prose words in a file: strip code fences, YAML blocks, and
    79	# citation-prefix tokens; then count whitespace-separated tokens.
    80	count_prose_words() {
    81	    local file="$1"
    82	    awk '
    83	        BEGIN { in_code = 0; in_yaml = 0; yaml_seen = 0 }
    84	        # YAML front-matter: lines bounded by --- at file start.
    85	        /^---$/ {
    86	            if (NR == 1) { in_yaml = 1; yaml_seen = 1; next }
    87	            if (in_yaml) { in_yaml = 0; next }
    88	        }
    89	        in_yaml { next }
    90	        # Code fences (``` or ~~~).
    91	        /^```/ || /^~~~/ {
    92	            in_code = !in_code
    93	            next
    94	        }
    95	        in_code { next }
    96	        { print }
    97	    ' "$file" | \
    98	    # Strip citation-prefix tokens.
    99	    sed -E 's|file://[^[:space:])\]]*||g;
   100	            s|cmd://[^[:space:])\]]*||g;
   101	            s|url://[^[:space:])\]]*||g;
   102	            s|owner://[^[:space:])\]]*||g;
   103	            s|judgment://[^[:space:])\]]*||g;
   104	            s|decision-authority://[^[:space:])\]]*||g' | \
   105	    # Count whitespace-separated tokens.
   106	    wc -w | tr -d ' '
   107	}
   108	
   109	# 1. longread/ exists.
   110	if [ ! -d "$LONGREAD_DIR" ]; then
   111	    printf 'validate-longread-structure: FAIL — longread/ directory not found at %s\n' "$LONGREAD_DIR" >&2
   112	    exit 1
   113	fi
   114	
   115	# 2-3. Per-chapter file presence + word count.
   116	total_words=0
   117	existing_files=0
   118	
   119	for file in "${CHAPTER_FILES[@]}"; do
   120	    path="$LONGREAD_DIR/$file"
   121	    if [ ! -f "$path" ]; then
   122	        err "missing chapter file: longread/$file"
   123	        continue
   124	    fi
   125	
   126	    existing_files=$((existing_files + 1))
   127	    count="$(count_prose_words "$path")"
   128	    total_words=$((total_words + count))
   129	
   130	    if [ "$count" -lt "$PER_CHAPTER_FLOOR" ]; then
   131	        err "longread/$file: $count prose words below in-progress floor ($PER_CHAPTER_FLOOR)"
   132	    fi
   133	
   134	    max="${CHAPTER_MAX[$file]}"
   135	    if [ "$count" -gt "$max" ]; then
   136	        err "longread/$file: $count prose words exceeds §6.2 maximum ($max)"
   137	    fi
   138	done
   139	
   140	# 4. Total word count bounds.
   141	if [ $RELEASE_MODE -eq 1 ]; then
   142	    if [ "$total_words" -lt "$RELEASE_TOTAL_MIN" ]; then
   143	        err "release-mode: total $total_words below release minimum $RELEASE_TOTAL_MIN"
   144	    fi
   145	    if [ "$total_words" -gt "$RELEASE_TOTAL_MAX" ]; then
   146	        err "release-mode: total $total_words exceeds release maximum $RELEASE_TOTAL_MAX"
   147	    fi
   148	else
   149	    # In-progress mode: only enforce the lower per-chapter floor + a
   150	    # permissive total floor so the validator can run during authoring.
   151	    if [ "$total_words" -lt "$TOTAL_FLOOR" ]; then
   152	        err "in-progress: total $total_words below permissive floor $TOTAL_FLOOR"
   153	    fi
   154	fi
   155	
   156	if [ ${#errors[@]} -gt 0 ]; then
   157	    printf 'validate-longread-structure: %d issue(s) found:\n' "${#errors[@]}" >&2
   158	    for e in "${errors[@]}"; do
   159	        printf '  - %s\n' "$e" >&2
   160	    done
   161	    exit 1
   162	fi
   163	
   164	mode="in-progress"
   165	[ $RELEASE_MODE -eq 1 ] && mode="release"
   166	printf 'validate-longread-structure: PASS — mode=%s; %d/9 chapters present; total=%d prose words\n' \
   167	    "$mode" "$existing_files" "$total_words"
   168	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-20-longread-structure/SPEC.md | sed -n '261,620p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   261	
   262	Direct external URLs MAY appear as secondary citations
   263	("for the full spec, see
   264	`url://example.com/foo`") but the canonical anchor for
   265	the longread's claim is the corpus entry.
   266	
   267	Owner-affirmed claims use `owner://transcript-<date>`
   268	inline.
   269	
   270	Agent-synthesized observations use
   271	`judgment://agent-synthesis` — the longread MAY
   272	include these but MUST be sparing; the deep-research
   273	directive favours corpus citations.
   274	
   275	### 6.5 Failure-mode disclosure rule
   276	
   277	The four+ failure modes catalogued in the research
   278	workpad
   279	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   280	§7) are first-class content in chapter 08:
   281	
   282	- Fastpath zero-adoption (research §7 sub-bullet a).
   283	- Decomposition-phase paper-only across 23 SPECs
   284	  (research §7 sub-bullet b).
   285	- Workpad bootstrap gap (research §7 sub-bullet c).
   286	- Four owner-blocking ceremony refactor questions
   287	  (research §7 sub-bullet d).
   288	- Plus any newly-surfaced failure modes from authoring
   289	  the longread itself (chapter 08 author MAY add).
   290	
   291	Each disclosed failure mode follows a three-element
   292	structure:
   293	
   294	1. What happened (verbatim or near-verbatim from the
   295	   research workpad).
   296	2. What we did about it (sanitized; specific BES
   297	   transcript identifiers removed; the pattern
   298	   preserved).
   299	3. What pattern generalizes from the failure
   300	   (`judgment://agent-synthesis` is acceptable here).
   301	
   302	### 6.6 BES attribution posture
   303	
   304	BES is named directly throughout the longread per parent
   305	Decision §7 disposition Q4 ("fully named — full
   306	transparency"). Specifically:
   307	
   308	- "BES" / "the BES studio" used unselfconsciously when
   309	  the studio is the subject.
   310	- Owner identifier (`HasNoBeef`) used in citations of
   311	  owner transcripts.
   312	- Internal SPEC IDs (e.g.
   313	  `2026-05-17-contract-corpus-retrospective-audit`)
   314	  cited where they support a specific failure-mode
   315	  disclosure; the SPEC identifier itself is
   316	  sanitization-safe (it's a slug, not content).
   317	- Internal transcript identifiers
   318	  (`owner://transcript-2026-05-18`) cited where the
   319	  owner-verbatim grounds a methodology choice.
   320	
   321	The studio's product names (other BES product repos —
   322	ACTOCCATUD, Floom, IKTO, etc.) are NOT named in the
   323	longread; they are irrelevant to the methodology
   324	discussion. The studio's identity IS named; specific
   325	unrelated product repos are not.
   326	
   327	## 7. Pipeline Specification
   328	
   329	### 7.1 Authoring sequence
   330	
   331	Per-chapter Task SPECs land in this order (each cites
   332	this Contract by id):
   333	
   334	1. T-01 chapter 00 introduction (frame + reader
   335	   contract).
   336	2. T-02 chapter 01 Phase 0 (maturity check).
   337	3. T-03 chapter 02 Phase 1 (facet inventory).
   338	4. T-04 chapter 03 Phase 2 (parameterization surface).
   339	5. T-05 chapter 04 Phase 3 (sanitization bar).
   340	6. T-06 chapter 05 Phase 4 (manifest+catalog compose).
   341	7. T-07 chapter 06 Phase 5 (cross-family validation).
   342	8. T-08 chapter 07 Phase 6 (ship).
   343	9. T-09 chapter 08 Phase 7 (failure modes as
   344	   first-class content).
   345	
   346	Chapters 01–08 author against the Phase definitions in
   347	the research workpad
   348	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   349	§6); chapter 00 frames + chapter 08 closes.
   350	
   351	Per parent Decision §7 ordering guidance: "earlier-
   352	phase slices SHOULD be authored against Product A's
   353	existing v1.1/v2.0 artefacts so the repack work is
   354	informed by the Phase 1-2 facet inventory rather than
   355	the other way around." The facet inventory is already
   356	done (Product A v2.0 §6.2 facets at the sibling repo);
   357	chapters 02–05 can cite that work as the worked
   358	example.
   359	
   360	### 7.2 Per-chapter Task SPEC contract
   361	
   362	Each per-chapter Task SPEC MUST:
   363	
   364	- Cite this Contract by id (`cites_contract:
   365	  2026-05-20-longread-structure` in front-matter).
   366	- Name the chapter file it authors.
   367	- State the chapter's intended word count
   368	  (target + maximum per §6.2).
   369	- List the primary-source corpus entries the chapter
   370	  cites + the verbatim quotes the chapter incorporates.
   371	- List the failure modes the chapter discloses (if any).
   372	- Pass the `scripts/validate-longread-structure.sh`
   373	  check after the chapter is written.
   374	
   375	The Task SPEC for chapter 00 is the first one
   376	authored; subsequent per-chapter Task SPECs follow
   377	sequentially.
   378	
   379	### 7.3 Cross-chapter coherence
   380	
   381	The longread is read sequentially; each chapter assumes
   382	the previous chapters are read. Cross-chapter
   383	references use `§N "Chapter Title"` form:
   384	
   385	> As we covered in §03 "Phase 1: Facet Inventory" …
   386	
   387	Forward references are avoided where possible; if
   388	necessary, mark explicitly ("Chapter 08 returns to this
   389	question").
   390	
   391	The introduction (chapter 00) gives the reader a
   392	roadmap of all eight phase chapters; the conclusion
   393	(end of chapter 08) gives a synthesis + the seven open
   394	research questions.
   395	
   396	## 8. Schema Specification
   397	
   398	### 8.1 Per-chapter file structure
   399	
   400	Each `longread/NN-...md` file has the structure:
   401	
   402	```markdown
   403	# Chapter NN — <Title>
   404	
   405	<one-paragraph epigraph or framing quote — owner
   406	transcript or corpus verbatim>
   407	
   408	## Section heading
   409	
   410	Body prose with citations inline.
   411	
   412	## Section heading
   413	
   414	…
   415	
   416	---
   417	
   418	**In the next chapter**: <one-sentence forward
   419	pointer to chapter NN+1, OR — for chapter 08 —
   420	"This is the last chapter. The seven open research
   421	questions follow.">
   422	```
   423	
   424	No front-matter (chapter files are not lint-spec
   425	targets; they are prose artefacts). The
   426	`validate-longread-structure.sh` script enforces file
   427	presence + word counts.
   428	
   429	### 8.2 validate-longread-structure.sh contract
   430	
   431	The script:
   432	
   433	1. Verifies `longread/` exists at repo root.
   434	2. Verifies each of the nine expected files exists at
   435	   `longread/<expected-name>.md`.
   436	3. For each file, counts words (excluding code fences,
   437	   YAML blocks, and citation prefix tokens) and
   438	   verifies word count is between 50 (lower placeholder
   439	   bound) and the chapter's §6.2 maximum.
   440	4. Computes total word count; verifies total is
   441	   between 5 000 (lower bound; allows for chapters in
   442	   placeholder state) and 13 000 (~5% over the §6.2
   443	   maximum to allow margin).
   444	5. Exits 0 on full pass; exit 1 with diagnostics
   445	   otherwise.
   446	
   447	The script is permissive on lower bound (50 words per
   448	chapter) so it can run as the longread is being
   449	populated chapter-by-chapter; final validation
   450	re-runs with tightened bounds before the v1.0 release
   451	tag.
   452	
   453	## 9. Reference Algorithms
   454	
   455	### 9.1 Word counting (pseudocode)
   456	
   457	```
   458	function count_words(file_path):
   459	  content = read(file_path)
   460	  # Strip code fences (```…```) and YAML blocks (---…---).
   461	  stripped = strip_code_fences_and_yaml(content)
   462	  # Strip citation prefix tokens (file://, cmd://, url://, etc.).
   463	  stripped = remove_citation_prefixes(stripped)
   464	  # Tokenize on whitespace.
   465	  words = stripped.split()
   466	  return len(words)
   467	```
   468	
   469	The exclusion of citation prefix tokens keeps the
   470	word count focused on prose (not URL slugs).
   471	
   472	### 9.2 Per-file budget check (pseudocode)
   473	
   474	```
   475	function check_budgets():
   476	  errors = []
   477	  for file, (target, max_words) in CHAPTER_BUDGETS.items():
   478	    if not exists(f"longread/{file}"):
   479	      errors.append(f"missing chapter file: {file}")
   480	      continue
   481	    count = count_words(f"longread/{file}")
   482	    if count < 50:
   483	      errors.append(f"{file}: {count} words below placeholder bound 50")
   484	    if count > max_words:
   485	      errors.append(f"{file}: {count} words exceeds maximum {max_words}")
   486	  total = sum(count_words(f"longread/{f}") for f in EXISTING_FILES)
   487	  if total < 5000:
   488	    errors.append(f"total {total} below release bound 5000")
   489	  if total > 13000:
   490	    errors.append(f"total {total} exceeds maximum 13000")
   491	  if errors:
   492	    emit_diagnostics()
   493	    exit 1
   494	  exit 0
   495	```
   496	
   497	## 10. Failure Model
   498	
   499	| Class | Trigger | Recovery |
   500	|---|---|---|
   501	| `chapter-file-missing` | A required `longread/NN-...md` is absent | Author the chapter via the per-chapter Task SPEC; re-run validator |
   502	| `word-budget-exceeded` | A chapter exceeds its §6.2 maximum | Author tightens prose OR the §6.2 table is amended via a follow-on Contract SPEC amendment |
   503	| `citation-not-from-corpus` | The chapter cites an external URL or agent memory for a methodology primitive that has a corpus entry | Reviewer rejects; author rewrites the citation to point at `file://research/primary-sources/<slug>.md §3` |
   504	| `voice-third-person-drift` | A chapter section slips into third-person methodology-vendor voice | Reviewer flags during per-chapter spec-review; author rewrites to first-person experiential |
   505	| `failure-mode-buried` | Chapter 08 (or any chapter touching a known failure mode) discusses it without applying the §6.5 three-element disclosure structure | Reviewer rejects; author re-discloses with what-happened / what-we-did / what-pattern-generalizes structure |
   506	| `bes-redaction-drift` | The longread sanitizes or anonymizes BES against §6.6 ("fully named") | Reviewer rejects; author restores direct BES naming |
   507	
   508	## 11. Trust Boundary / Security
   509	
   510	- No secrets, credentials, or third-party private data
   511	  in the longread. Owner-transcript citations are
   512	  truncated to load-bearing-quote-only, not full
   513	  conversation logs.
   514	- The longread does NOT reveal internal BES studio
   515	  product details beyond what's already public (the
   516	  studio name; the framework + methodology repos that
   517	  ARE the public artefacts). Other BES product repos
   518	  are NOT named (§6.6).
   519	- The longread does NOT expose specific user data,
   520	  customer information, or commercial details. The
   521	  studio is a single-owner studio; there are no third-
   522	  party data concerns.
   523	
   524	## 12. Observability
   525	
   526	- `scripts/validate-longread-structure.sh` exit code is
   527	  the mechanical observability surface.
   528	- Per-chapter spec-review Quality Gate Result is the
   529	  per-chapter quality observability.
   530	- The longread's total word count + per-chapter word
   531	  count is reportable via the validator with a
   532	  `--report` flag (RECOMMENDED extension; not v1.0
   533	  required).
   534	
   535	## 13. Test and Validation Matrix
   536	
   537	| AC | Test |
   538	|---|---|
   539	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md` exits 0 |
   540	| AC-2 | `cmd://test -d longread` exits 0 |
   541	| AC-3 | `cmd://test -x scripts/validate-longread-structure.sh` exits 0 |
   542	| AC-4 | For each chapter file in §6.1: `cmd://test -f longread/<filename>` exits 0 |
   543	| AC-5 | `cmd://bash scripts/validate-longread-structure.sh` exits 0 |
   544	| AC-6 | Total word count is between 8 000 and 12 000 (release-time tightening of validator's permissive bounds) |
   545	| AC-7 | Every per-chapter Task SPEC cites this Contract by id |
   546	| AC-8 | Every methodology primitive in the longread resolves to a corpus entry citation (manual reviewer check during spec-review) |
   547	| AC-9 | Chapter 08 includes the four+ research §7 failure modes with the §6.5 three-element disclosure structure |
   548	
   549	## 14. Implementation Checklist (Definition of Done)
   550	
   551	- [ ] DoD-1: `scripts/validate-longread-structure.sh`
   552	      authored + executable.
   553	- [ ] DoD-2: `longread/` directory exists at repo root.
   554	- [ ] DoD-3: All nine chapter files exist at the
   555	      expected paths per §6.1.
   556	- [ ] DoD-4: Each chapter's word count is within its
   557	      §6.2 budget at release time.
   558	- [ ] DoD-5: Total word count lands within 8 000–
   559	      12 000 at release time.
   560	- [ ] DoD-6: Every chapter authored under a per-
   561	      chapter Task SPEC that cites this Contract by id.
   562	- [ ] DoD-7: Every methodology-primitive citation
   563	      resolves to a corpus entry.
   564	- [ ] DoD-8: Chapter 08 carries the failure-mode
   565	      disclosures per §6.5.
   566	- [ ] DoD-9: Voice + BES attribution conform to §6.3
   567	      + §6.6 (reviewer-enforced).
   568	
   569	## 15. Acceptance Criteria
   570	
   571	(See §13 for tests; checkboxes are the post-execution
   572	verification list.)
   573	
   574	- [ ] AC-1: SPEC lint clean
   575	- [ ] AC-2: longread directory exists
   576	- [ ] AC-3: validate-longread-structure.sh executable
   577	- [ ] AC-4: all 9 chapter files exist
   578	- [ ] AC-5: validator exits 0
   579	- [ ] AC-6: total word count within 8 000–12 000
   580	- [ ] AC-7: every per-chapter Task SPEC cites this
   581	      Contract
   582	- [ ] AC-8: methodology primitives cite corpus
   583	- [ ] AC-9: chapter 08 carries failure-mode
   584	      disclosures per §6.5
   585	
   586	## 16. Rollback Plan
   587	
   588	If the longread structure proves wrong mid-authoring:
   589	
   590	1. Pause in-flight per-chapter Task SPECs at their
   591	   current status.
   592	2. Author a follow-on Contract SPEC amendment that
   593	   adjusts §6.1 (chapter taxonomy) or §6.2 (word
   594	   budgets).
   595	3. Resume Task SPECs against the amended Contract.
   596	
   597	If the entire longread is abandoned (unlikely; would
   598	mean reversing the parent Decision §7 hybrid shape):
   599	
   600	1. The `longread/` directory is preserved as evidence;
   601	   any authored chapters remain as drafts.
   602	2. A follow-on Decision SPEC supersedes the parent
   603	   Decision; this Contract becomes evidence-only.
   604	
   605	## 17. Open Questions
   606	
   607	- [ ] Q1: Word-budget table (§6.2) is initial estimate;
   608	      authoring may surface real lengths that need
   609	      adjustment. Default: amend via follow-on Contract
   610	      SPEC amendment; not a blocker.
   611	- [ ] Q2: Whether the introduction chapter (00) or the
   612	      Phase 7 chapter (08) is the harder authoring
   613	      task. `judgment://agent-synthesis`: chapter 08
   614	      (failure modes + open questions) is harder
   615	      because the BES-specific case data requires
   616	      careful sanitization to "drop ALL studio context"
   617	      while preserving pattern. Plan: author 00 first
   618	      (lower cognitive load); leave 08 for the final
   619	      authoring pass once the methodology's narrative
   620	      has solidified across chapters 01–07.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba schema/SPEC.schema.md | sed -n '260,620p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   260	
   261	1. "The repo-root `/some/path` is gitignored." → `cmd://git
   262	   check-ignore -v some/path` (output excerpt MUST follow).
   263	2. "Owner directed local-only repo." → `decision-authority://owner:2026-01-15`
   264	   (verbatim quote MUST follow).
   265	3. "External reference spec is 2169 lines." → `cmd://wc -l
   266	   /tmp/refs/external-spec.md` (output MUST follow).
   267	4. "OPERATING_MODEL was last updated 2026-01-15." →
   268	   `file://OPERATING_MODEL.md` (heading line citation
   269	   acceptable).
   270	5. "Three failure modes follow." → `file://specs/2026-01-15-example-procedure-v1/IDEA.md`
   271	   §1 (the producing IDEA.md is the source).
   272	
   273	**Negative — citation NOT required:**
   274	
   275	1. `## 6. Domain Model` — section header.
   276	2. "The following entities are defined below." — editorial framing.
   277	3. "An IDEA artefact has front-matter and a body." — internal
   278	   definition.
   279	4. "See §7.6 for the state machine." — internal cross-reference.
   280	5. "The algorithm above iterates until convergence." — internal
   281	   reference to in-document pseudocode.
   282	
   283	### 2.5 Suppression escape hatch
   284	
   285	Where the lint script flags a claim that is in fact an editorial
   286	sentence, the author MAY append the HTML comment
   287	`<!-- lint-ok: no-citation -->` to the offending line. Suppression
   288	comments SHALL be sparing; pervasive suppression is itself a quality
   289	signal and SHOULD be raised in spec review.
   290	
   291	The companion marker `<!-- lint-ok: no-rfc -->` silences the lint's
   292	lowercase-RFC-2119 warning for a single line; use this where a
   293	lowercase keyword appears in unambiguously non-normative prose
   294	(for example, a verbatim block-quote of an external source). Both
   295	markers are line-local: `no-citation` applies to the paragraph
   296	containing the marker, `no-rfc` applies to the line containing it.
   297	
   298	## 3. RFC 2119 adoption rules
   299	
   300	| Artefact / Section | Normative preamble | Keyword usage |
   301	|---|---|---|
   302	| `IDEA.md` | REQUIRED | constraints, recommendations, owner judgments |
   303	| `SPEC.task.md` | REQUIRED | Desired Behavior, Acceptance Criteria, Test Plan, Safety Invariants |
   304	| `SPEC.contract.md` | REQUIRED | throughout normative sections |
   305	| `SPEC.decision.md` | REQUIRED only on §Decision Statement | **MUST NOT** appear outside the Decision Statement section |
   306	
   307	Lint rules:
   308	
   309	- Any RFC 2119 keyword MUST be uppercase to carry normative force.
   310	- Lowercase variants ("must", "should", "may") are ordinary English
   311	  and MUST NOT carry normative force.
   312	- The lint script flags lowercase variants in normative sections as
   313	  *advisory warnings* (exit 2), not blocking failures, to avoid
   314	  false positives on ordinary English usage.
   315	
   316	## 4. Section naming conventions
   317	
   318	- Top-level sections: `## N. Title` with Arabic numerals.
   319	- Sub-sections: `### N.M Title`.
   320	- Sub-sub-sections (RECOMMENDED only when needed): `#### N.M.K Title`.
   321	- Section titles in the shared skeleton MUST match verbatim across
   322	  the three SPEC templates and IDEA template (e.g. "Authority Map"
   323	  is identical wording wherever it appears).
   324	- Front-matter `id` MUST equal the spec folder name.
   325	- Spec id format: `<YYYY-MM-DD>-<kebab-case-topic>`.
   326	
   327	### 4.1 Shared section skeleton
   328	
   329	The following sections, when present, MUST have identical titles
   330	across all spec types (Task / Contract / Decision):
   331	
   332	- `## Normative Language` (preamble, RECOMMENDED in IDEA, REQUIRED in SPECs)
   333	- `## Authority Map`
   334	- `## Code/Docs Reality Check`
   335	- `## Open Questions`
   336	- `## Acceptance Criteria`
   337	- `## Rollback Plan` (REQUIRED in Task, Contract; OPTIONAL in Decision)
   338	- `## Completion Report`
   339	
   340	Type-specific sections (e.g. Domain Model, State Specification,
   341	Failure Model, Trade-off Comparison, Locks, Reversal Plan) appear
   342	only in the templates that REQUIRE them; their titles are also
   343	fixed across templates that include them.
   344	
   345	## 5. Quality-gate handoff to `spec-review`
   346	
   347	When `/review-spec` runs:
   348	
   349	1. Reads front-matter `type`.
   350	2. Selects the per-type quality gate
   351	   (`task` → bar b, `contract` → bar c, `decision` → bar b + candidates).
   352	3. Runs `lint-spec.sh` on the artefact (REQUIRED for `contract`,
   353	   RECOMMENDED for `task` and `decision`).
   354	4. Produces a structured Quality Gate Result with `pass`, `failures`
   355	   (with `criterion`, `evidence`, `severity`).
   356	5. Sets `status: needs-revision` on any blocking failure;
   357	   `status: approved-pending-owner` on a clean pass.
   358	6. Owner sets `status: approved` after reviewing the Quality Gate
   359	   Result and the SPEC.
   360	
   361	The `spec-review` skill MUST NOT set `status: approved`.
   362	
   363	## 6. Cross-references
   364	
   365	- Templates: `templates/SPEC.task.template.md`,
   366	  `templates/SPEC.contract.template.md`,
   367	  `templates/SPEC.decision.template.md`,
   368	  `templates/SPEC.fastpath.template.md`,
   369	  `templates/IDEA.template.md`,
   370	  `templates/TASK.template.md`.
   371	- Lint script: `scripts/lint-spec.sh`.
   372	- Skill validator: `scripts/validate-skill-frontmatter.sh`.
   373	- Procedure-only skills: `skills/verification/SKILL.md`,
   374	  `skills/code-review/SKILL.md`, `skills/release-pr/SKILL.md`,
   375	  `skills/spec-evidence-governance/SKILL.md`,
   376	  `skills/diagnosis/SKILL.md`, `skills/tdd/SKILL.md`.
   377	- Operating model: `OPERATING_MODEL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

codex
I’ve confirmed the parent Decision is stronger than the local SPEC in a few places: it binds hybrid longread + SPEC bundle, 8-12K words, first-person BES case-study posture, all four-plus failure modes, all seven open questions, and external cross-family validation. Now I’m checking whether the local contract and script actually preserve those gates during chapter authoring.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '221,360p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '260,520p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	id: 2026-05-19-primary-source-research-corpus
     3	status: verified
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-installation-methodology
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: true
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
    13	  - test -f research/primary-sources/INDEX.md
    14	  - bash scripts/check-corpus-completeness.sh
    15	cites_decision: 2026-05-18-agentic-installation-methodology
    16	---
    17	
    18	# SPEC: Primary-Source Research Corpus (Deep-Research Preface)
    19	
    20	Status: Draft v1
    21	Type: Contract
    22	Purpose: govern the production of a structured primary-source
    23	research corpus that grounds every methodology claim in
    24	arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
    25	Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
    26	Agent Spec / reference-architecture literature before any
    27	methodology content (longread, SPEC bundle) lands. The corpus
    28	is the citable evidence base downstream slices draw from;
    29	the SPEC defines its shape, completeness gates, and
    30	citation discipline.
    31	
    32	## Normative Language
    33	
    34	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    35	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    36	document are to be interpreted as described in RFC 2119 and RFC 8174
    37	when, and only when, they appear in all capitals.
    38	
    39	## 1. Problem Statement
    40	
    41	The 2026-05-17 research workpad
    42	(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
    43	or upstream
    44	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
    45	§12 Verification Caveats records that several primary
    46	sources were "access-denied and characterized via WebSearch
    47	summaries cross-checked against multiple sources" — arc42,
    48	C4, ADR, Diátaxis, 12-factor. The methodology Product B
    49	publishes draws heavily on those primitives (research §3,
    50	§4, §5). Owner directive
    51	`decision-authority://owner:2026-05-18` ("base this all in
    52	deep research and best practices - not make up bullshit")
    53	forecloses publishing claims grounded in agent summaries
    54	when the primaries themselves are reachable with proper
    55	tooling (WebFetch, archive.org, primary-PDF retrieval). The
    56	methodology body (longread + SPEC bundle) MUST NOT land
    57	before each in-scope primary has a structured corpus entry
    58	that captures the verbatim claims the methodology depends
    59	on. This SPEC defines the corpus shape, the per-source
    60	artefact template, the completeness gate, and the citation
    61	discipline that binds the longread and SPEC bundle
    62	authoring slices to the corpus rather than to agent memory.
    63	
    64	## 2. Goals and Non-Goals
    65	
    66	Goals:
    67	
    68	- Define an exhaustive in-scope source list with rationale
    69	  per entry.
    70	- Define the per-source artefact template: front-matter,
    71	  fetch metadata, verbatim claim extracts, gap from prior
    72	  agent summary, citation surface.
    73	- Define a completeness gate enforced by a check script
    74	  (`scripts/check-corpus-completeness.sh`) so the corpus's
    75	  state is mechanically verifiable.
    76	- Establish the citation grammar binding: every methodology
    77	  claim in downstream artefacts MUST cite a corpus entry
    78	  via `file://research/primary-sources/<slug>.md§<n>`, not
    79	  agent memory.
    80	
    81	Non-goals:
    82	
    83	- Authoring the methodology longread or SPEC bundle
    84	  (subsequent slices).
    85	- Repacking Product A v1.1 into manifest+catalog v2.0
    86	  (sibling slice).
    87	- Resolving the seven open research questions enumerated in
    88	  the dispositioned research workpad §2.3 — the corpus
    89	  informs them; it does not pretend to resolve them.
    90	- A literature review essay. The corpus is structured
    91	  source artefacts, not synthesized prose.
    92	
    93	## 3. System Overview
    94	
    95	The deep-research corpus is a directory at
    96	`research/primary-sources/` inside this repo. Each in-scope
    97	source has one structured artefact at
    98	`research/primary-sources/<slug>.md`. An `INDEX.md` at the
    99	directory root lists every in-scope source, its slug, its
   100	current status (`pending` / `primary-read-complete` /
   101	`access-blocked` / `superseded`), and a one-line summary of
   102	the verbatim claims the methodology depends on from that
   103	source. A check script
   104	(`scripts/check-corpus-completeness.sh`) walks the index and
   105	reports gaps (`pending` entries, `access-blocked` entries
   106	without an alternative-source-found note, slugs in the
   107	index that lack a file under `research/primary-sources/`).
   108	
   109	Downstream methodology slices (longread, SPEC bundle) cite
   110	the corpus exclusively for primitives derived from these
   111	sources. Lint at the corpus-citation surface is enforced by
   112	a follow-on extension to `scripts/lint-spec.sh` (out of
   113	scope for this SPEC; deferred to a follow-on Task SPEC).
   114	
   115	The corpus is append-only on a per-entry basis; an entry
   116	may be superseded by a follow-on entry (slug-suffixed
   117	`-vN`) but never deleted. Provenance is preserved.
   118	
   119	## 4. Authority Map
   120	
   121	Active authority:
   122	
   123	- `decision-authority://owner:2026-05-18` — owner directive
   124	  ("base this all in deep research and best practices - not
   125	  make up bullshit") binding deep-primary-source discipline
   126	  before any methodology content lands.
   127	- Parent Decision SPEC at
   128	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   129	  §7 — binds Product B shape; §9 Locks unlock authoring of
   130	  follow-on slices including this preface.
   131	- Dispositioned research workpad at
   132	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   133	  §12 Verification Caveats — names the specific access-
   134	  denied primaries that this corpus closes the gap on.
   135	- `file://schema/SPEC.schema.md` — citation grammar,
   136	  RFC 2119 scoping rules, front-matter schema.
   137	
   138	Stale, superseded, or evidence-only:
   139	
   140	- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   141	  — superseded research workpad; evidence-only.
   142	
   143	Owner decisions required before implementation:
   144	
   145	- [ ] Confirm the §6 Domain Model source list is exhaustive
   146	      for v1.0; subsequent additions land as follow-on
   147	      Contract SPEC amendments.
   148	
   149	## 5. Code/Docs Reality Check
   150	
   151	- The `research/primary-sources/` directory does not yet
   152	  exist (`cmd://ls research/` returns "No such file" before
   153	  this slice executes).
   154	- The check script `scripts/check-corpus-completeness.sh`
   155	  does not yet exist (`cmd://test -f
   156	  scripts/check-corpus-completeness.sh` exits non-zero
   157	  pre-execution).
   158	- The `WebFetch` tool is the primary retrieval mechanism;
   159	  fallback is `cmd://curl -fsSL --max-time 30` for
   160	  endpoints WebFetch fails on, with archive.org
   161	  (`url://web.archive.org/web/*/`) as the
   162	  access-blocked fallback.
   163	
   164	## 6. Domain Model
   165	
   166	### 6.1 In-scope sources (v1.0)
   167	
   168	| Slug | Source | Primary URL | Why in scope |
   169	|---|---|---|---|
   170	| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
   171	| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
   172	| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
   173	| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
   174	| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
   175	| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
   176	| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
   177	| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
   178	| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
   179	| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
   180	| symphony-spec | OpenAI Symphony SPEC.md | `url://github.com/openai/symphony/blob/main/SPEC.md` | In-the-wild operating-model-as-SPEC; research §3 transferable building blocks |
   181	| spec-kit | GitHub Spec Kit | `url://github.com/github/spec-kit` | Closest spec-as-authoring tool; research §2.1 |
   182	| kiro | Kiro spec-driven IDE | `url://kiro.dev` | Spec-driven IDE; research §2.1 |
   183	| openspec | OpenSpec project | `url://github.com/Fission-AI/OpenSpec` | New agentic spec project; surfaced by recent field state |
   184	| oracle-agent-spec | Oracle Agent Spec | `url://github.com/oracle/agent-spec` | Spec-as-agent-description; research §2.1 |
   185	| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
   186	| leaddev-agent-compiled | LeadDev "Can you trust the spec" article | `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software` | Closest published statement of the agentic-installation hypothesis (as risk); research §2.2 |
   187	| cucumber-gherkin | Cucumber / Gherkin reference | `url://cucumber.io/docs/gherkin/reference/` | Behavioral acceptance primitive; research §5.1 |
   188	| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
   189	| structurizr-dsl | Structurizr DSL (C4 implementation) | `url://docs.structurizr.com/dsl` | Machine-readable C4; research §5.1 |
   190	
   191	`SOURCE_LIST_VERSION: v1.0` — additions land as follow-on
   192	Contract SPEC amendments per §17 Open Questions.
   193	
   194	### 6.2 Per-source artefact schema
   195	
   196	Each `research/primary-sources/<slug>.md` is a markdown
   197	document with the following front-matter and section
   198	structure:
   199	
   200	```yaml
   201	---
   202	slug: <slug>            # matches §6.1 row
   203	source_name: "<Full name>"
   204	primary_url: "<URL>"
   205	fetched_via: "WebFetch" | "curl" | "archive.org" | "manual"
   206	fetched_on: <YYYY-MM-DD>
   207	fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
   208	fetch_evidence: "<one-line digest of fetch result or
   209	                  fallback used>"
   210	supersedes: <slug>      # OPTIONAL; for vN entries
   211	methodology_relevance: |
   212	  <one-paragraph statement of which methodology claims
   213	   draw on this source>
   214	---
   215	```
   216	
   217	Required sections (in order):
   218	
   219	1. **§1 Source identity** — name, canonical URL,
   220	   maintainer / publisher, license / copyright posture
   221	   (the bar for fair-use excerpts in our corpus).
   222	2. **§2 Fetch trace** — what was attempted, what worked,
   223	   what was blocked. Cites the agent tool calls
   224	   (`cmd://WebFetch <url>`, `cmd://curl -fsSL <url>`)
   225	   with one-line outcome digests.
   226	3. **§3 Verbatim claims this corpus depends on** —
   227	   the primary's own words, quoted. Each quote is
   228	   attributed by §-and-paragraph (or chapter / section
   229	   identifier from the source) and accompanied by a
   230	   methodology-relevance note. Quotes MAY be excerpted
   231	   per fair-use limits per §6.3.
   232	4. **§4 Gap from prior summary characterization** — what
   233	   the 2026-05-17 research workpad (or earlier agent
   234	   summaries) got right, what it got wrong or imprecise,
   235	   and what new primary-anchored claims are now available
   236	   to the methodology body.
   237	5. **§5 Downstream-citation surface** — the set of
   238	   methodology claims this entry now licenses, expressed
   239	   as `methodology-claim: "<claim>"` paired with the
   240	   §1-§3 anchor that supports it.
   241	6. **§6 Open questions surfaced by the primary read** —
   242	   things the primary itself doesn't answer that the
   243	   methodology may have to flag as open. Distinct from
   244	   the seven research-workpad open questions; these
   245	   are primary-anchored unknowns.
   246	
   247	### 6.3 Citation and fair-use posture
   248	
   249	Verbatim quotes in §3 of each artefact are excerpts for
   250	research and methodology purposes; per US fair-use
   251	doctrine (and equivalents in other jurisdictions), the
   252	corpus is editorial commentary on published sources, not
   253	republication. Each quote is bounded — typically
   254	≤ 50 words, never exceeding the smaller of (a) one
   255	paragraph of source text or (b) 200 words. The artefact
   256	is the methodology's editorial citation surface, not a
   257	mirror. When the source's license is permissive
   258	(Apache-2.0 / MIT / CC-BY for documentation), longer
   259	excerpts MAY be included with attribution.
   260	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/INDEX.md | sed -n '1,240p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	# Primary-source corpus index
     2	
     3	Source-list version: v1.0
     4	Last updated: 2026-05-19
     5	
     6	Per
     7	`file://../../specs/2026-05-19-primary-source-research-corpus/SPEC.md`
     8	§6.1, §6.4. Every slug listed below has a corresponding
     9	artefact file at `research/primary-sources/<slug>.md`. The
    10	check script `scripts/check-corpus-completeness.sh` enforces
    11	the bijection and the completeness state.
    12	
    13	| Slug | Status | Fetched on | Methodology summary |
    14	|---|---|---|---|
    15	| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
    16	| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
    17	| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
    18	| adr-tools-state | primary-read-complete | 2026-05-19 | adr.github.io community; ADR template catalogue (Nygard, MADR, Y-statements); state-of-practice |
    19	| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
    20	| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
    21	| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
    22	| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); strongest reproducibility primitive |
    23	| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
    24	| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
    25	| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
    26	| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
    27	| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
    28	| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
    29	| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
    30	| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
    31	| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
    32	| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
    33	| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
    34	| structurizr-dsl | primary-read-complete | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code |
    35	
    36	## Status legend
    37	
    38	- `pending` — source not yet fetched; corpus incomplete.
    39	- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
    40	- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
    41	- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
    42	- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "ls -l scripts/validate-longread-structure.sh && test -d longread; printf 'longread_dir_exit=%s\\n' \""'$?"' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
-rwxr-xr-x. 1 hasnobeef hasnobeef 5358 May 18 20:31 scripts/validate-longread-structure.sh
longread_dir_exit=0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "bash -n scripts/validate-longread-structure.sh && printf 'bash -n OK\\n'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
bash -n OK

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 824ms:
== lint-spec.sh summary ==
target:                specs/2026-05-20-longread-structure/SPEC.md
artefact / type:       spec / contract
sections (top-level):  22
citation-prefix hits:  37
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

codex
The local lint passes and the validator script is syntactically valid/executable. `longread/` does exist in this checkout, so I’m doing one light read of its file list/count behavior to distinguish expected in-progress looseness from a contract bug.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find longread -maxdepth 1 -type f -printf '%f\\n' | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-longread-structure.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
validate-longread-structure: 10 issue(s) found:
  - missing chapter file: longread/00-introduction.md
  - missing chapter file: longread/01-phase-0-maturity-check.md
  - missing chapter file: longread/02-phase-1-facet-inventory.md
  - missing chapter file: longread/03-phase-2-parameterization-surface.md
  - missing chapter file: longread/04-phase-3-sanitization-bar.md
  - missing chapter file: longread/05-phase-4-manifest-catalog-compose.md
  - missing chapter file: longread/06-phase-5-cross-family-validation.md
  - missing chapter file: longread/07-phase-6-ship.md
  - missing chapter file: longread/08-phase-7-failure-modes-as-first-class-content.md
  - in-progress: total 0 below permissive floor 450

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-longread-structure.sh --release-mode' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
validate-longread-structure: 10 issue(s) found:
  - missing chapter file: longread/00-introduction.md
  - missing chapter file: longread/01-phase-0-maturity-check.md
  - missing chapter file: longread/02-phase-1-facet-inventory.md
  - missing chapter file: longread/03-phase-2-parameterization-surface.md
  - missing chapter file: longread/04-phase-3-sanitization-bar.md
  - missing chapter file: longread/05-phase-4-manifest-catalog-compose.md
  - missing chapter file: longread/06-phase-5-cross-family-validation.md
  - missing chapter file: longread/07-phase-6-ship.md
  - missing chapter file: longread/08-phase-7-failure-modes-as-first-class-content.md
  - release-mode: total 0 below release minimum 8000

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-20-longread-structure/SPEC.md | sed -n '620,760p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   620	      has solidified across chapters 01–07.
   621	- [ ] Q3: Cross-family review for THIS Contract SPEC
   622	      and for the per-chapter Task SPECs. Per parent
   623	      Decision §7, cross-family review is BLOCKING per
   624	      slice. Same-family proxy is the default fallback;
   625	      external Codex pass is the rigorous path. Default:
   626	      same-family proxy with explicit caveat; escalate
   627	      to external review before the v1.0 release tag.
   628	- [ ] Q4: Should the longread include diagrams (e.g.
   629	      a phase-flow diagram, a manifest+catalog shape
   630	      diagram)? Default: no diagrams in v1.0; the
   631	      SPEC bundle (slice 4) carries diagrammatic
   632	      artefacts. The longread is prose-only.
   633	
   634	None of Q1–Q4 is `owner-blocking`; all can land as
   635	follow-on Contract SPEC amendments without rework of
   636	chapters already authored.
   637	
   638	## 18. Migration / Coexistence
   639	
   640	This is a greenfield artefact; nothing migrates. The
   641	research workpad
   642	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   643	is the upstream synthesis (the hypothesis space); the
   644	longread is the published synthesis (the methodology
   645	as procedure). The workpad is evidence-only;
   646	downstream readers consume the longread, not the
   647	workpad.
   648	
   649	The longread cites the workpad ONLY where the
   650	workpad's §7 case-study data is the source — e.g.
   651	chapter 08's failure-mode disclosures cite the
   652	workpad's §7 directly with sanitization for specific <!-- lint-ok: no-citation -->
   653	internal SPEC identifiers.
   654	
   655	## 19. Completion Report
   656	
   657	### 19.1 Files changed
   658	
   659	(to be filled — at Verification phase)
   660	
   661	### 19.2 Commands run
   662	
   663	(to be filled — at Verification phase)
   664	
   665	### 19.3 Verification result
   666	
   667	(to be filled — at Verification phase)
   668	
   669	### 19.4 Residual risk
   670	
   671	(to be filled — at Verification phase)
   672	
   673	### 19.5 Spec evidence candidates
   674	
   675	(to be filled — durable lessons for the
   676	spec-evidence-governance skill)

codex
**Quality Gate Result: FAIL**

Cross-family review found blocking contract gaps. No mutations made.

**Findings**

1. `specs/2026-05-20-longread-structure/SPEC.md:539`: BLOCKING  
   Final acceptance does not run release-mode validation. The front matter calls `bash scripts/validate-longread-structure.sh`, while the script’s default mode only enforces 50 words/chapter and 450 total words (`scripts/validate-longread-structure.sh:64`, `scripts/validate-longread-structure.sh:148`). AC-6 says 8,000-12,000 words, but the command set does not prove it.

2. `specs/2026-05-20-longread-structure/SPEC.md:250`: BLOCKING  
   Corpus-citation discipline is not enforceable mechanically. The SPEC requires corpus citations for every methodology primitive, but AC-8 is explicitly manual (`SPEC.md:546`) and the validator only checks file presence/word counts (`scripts/validate-longread-structure.sh:109`). The prior corpus SPEC also says lint enforcement is deferred (`specs/2026-05-19-primary-source-research-corpus/SPEC.md:109`).

3. `specs/2026-05-20-longread-structure/SPEC.md:547`: BLOCKING  
   Chapter 08 acceptance only requires the four-plus failure modes, but parent authority also requires all seven open research questions be published as flagged-open. Parent lines `../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:261` require this; local SPEC only mentions them in roadmap prose at `SPEC.md:391`, not in AC/DoD.

4. `specs/2026-05-20-longread-structure/SPEC.md:219`: MAJOR  
   Per-chapter maximums sum to 12,400 while the parent longread bound is 12,000 (`../bes-fleet-policy/.../SPEC.md:227`). The text says this gives margin “without breaching” the upper bound (`SPEC.md:222`), but it does breach the parent band and conflicts with release-mode max 12,000 (`scripts/validate-longread-structure.sh:68`).

5. `specs/2026-05-20-longread-structure/SPEC.md:275`: MAJOR  
   Failure modes are structurally pushed into chapter 08, but upstream research defines Phase 7 as “for each phase, document” failures/open questions (`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:342`). I would keep the 8-phase decomposition because parent authority binds it, but add a required phase-local failure/open-question note in chapters 01-07, with chapter 08 as synthesis.

6. `specs/2026-05-20-longread-structure/SPEC.md:312`: MAJOR  
   BES attribution posture leaks more than the stated rule. The SPEC says other product repos are not named, but names `ACTOCCATUD`, `Floom`, and `IKTO` in the public contract itself (`SPEC.md:321`). It also permits internal SPEC IDs and transcript identifiers, while parent authority says sanitization is limited to those internal identifiers/transcripts (`../bes-fleet-policy/.../SPEC.md:254`).

7. `specs/2026-05-20-longread-structure/SPEC.md:229`: MEDIUM  
   The first-person voice rule is too absolute for Phase 0. Phase 0 is a maturity rubric (`../bes-fleet-policy/.../RESEARCH.md:271`), so it needs a permitted pattern like “we used this readiness test” plus generalized criteria. As written, the chapter can either sound awkwardly first-person or drift into the forbidden vendor voice.

**Checks Run**

`bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md` passed.  
`bash -n scripts/validate-longread-structure.sh` passed.  
The validator currently fails in both default and release mode because chapter files are absent; that is expected for the stated in-execution/chapter-not-yet-authored state.
tokens used
87,506
**Quality Gate Result: FAIL**

Cross-family review found blocking contract gaps. No mutations made.

**Findings**

1. `specs/2026-05-20-longread-structure/SPEC.md:539`: BLOCKING  
   Final acceptance does not run release-mode validation. The front matter calls `bash scripts/validate-longread-structure.sh`, while the script’s default mode only enforces 50 words/chapter and 450 total words (`scripts/validate-longread-structure.sh:64`, `scripts/validate-longread-structure.sh:148`). AC-6 says 8,000-12,000 words, but the command set does not prove it.

2. `specs/2026-05-20-longread-structure/SPEC.md:250`: BLOCKING  
   Corpus-citation discipline is not enforceable mechanically. The SPEC requires corpus citations for every methodology primitive, but AC-8 is explicitly manual (`SPEC.md:546`) and the validator only checks file presence/word counts (`scripts/validate-longread-structure.sh:109`). The prior corpus SPEC also says lint enforcement is deferred (`specs/2026-05-19-primary-source-research-corpus/SPEC.md:109`).

3. `specs/2026-05-20-longread-structure/SPEC.md:547`: BLOCKING  
   Chapter 08 acceptance only requires the four-plus failure modes, but parent authority also requires all seven open research questions be published as flagged-open. Parent lines `../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md:261` require this; local SPEC only mentions them in roadmap prose at `SPEC.md:391`, not in AC/DoD.

4. `specs/2026-05-20-longread-structure/SPEC.md:219`: MAJOR  
   Per-chapter maximums sum to 12,400 while the parent longread bound is 12,000 (`../bes-fleet-policy/.../SPEC.md:227`). The text says this gives margin “without breaching” the upper bound (`SPEC.md:222`), but it does breach the parent band and conflicts with release-mode max 12,000 (`scripts/validate-longread-structure.sh:68`).

5. `specs/2026-05-20-longread-structure/SPEC.md:275`: MAJOR  
   Failure modes are structurally pushed into chapter 08, but upstream research defines Phase 7 as “for each phase, document” failures/open questions (`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:342`). I would keep the 8-phase decomposition because parent authority binds it, but add a required phase-local failure/open-question note in chapters 01-07, with chapter 08 as synthesis.

6. `specs/2026-05-20-longread-structure/SPEC.md:312`: MAJOR  
   BES attribution posture leaks more than the stated rule. The SPEC says other product repos are not named, but names `ACTOCCATUD`, `Floom`, and `IKTO` in the public contract itself (`SPEC.md:321`). It also permits internal SPEC IDs and transcript identifiers, while parent authority says sanitization is limited to those internal identifiers/transcripts (`../bes-fleet-policy/.../SPEC.md:254`).

7. `specs/2026-05-20-longread-structure/SPEC.md:229`: MEDIUM  
   The first-person voice rule is too absolute for Phase 0. Phase 0 is a maturity rubric (`../bes-fleet-policy/.../RESEARCH.md:271`), so it needs a permitted pattern like “we used this readiness test” plus generalized criteria. As written, the chapter can either sound awkwardly first-person or drift into the forbidden vendor voice.

**Checks Run**

`bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md` passed.  
`bash -n scripts/validate-longread-structure.sh` passed.  
The validator currently fails in both default and release mode because chapter files are absent; that is expected for the stated in-execution/chapter-not-yet-authored state.
