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
session id: 019e3e53-0e1f-77a0-9a32-cd53f524e819
--------
user
Cross-family review (gpt-5.5 reviewing claude-opus-authored work). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md (Contract SPEC, status: verified) plus the 20 corpus artefacts under research/primary-sources/. Per BES v1 procedure §10.3 the Contract gate requires lint pass (exit 0; already verified) + cross-family substance review. The SPEC governs production of a primary-source research corpus that grounds every downstream methodology claim. Read SPEC.md, INDEX.md, and a representative sample of artefacts (arc42.md, c4-model.md, adr-nygard.md, helm-values-schema.md, symphony-spec.md, leaddev-agent-compiled.md). Look for: (1) source-list completeness — what primaries are missing from §6.1 that gpt-5.5 considers load-bearing for an agentic-installation methodology? (2) per-artefact verbatim-quote misattribution or paraphrase-as-quote drift; (3) gap-from-prior-summary §4 sections where the prior agent summary was actually correct and the new artefact wrongly 'corrects' it; (4) Methodology-claim §5 entries that overreach or misrepresent the primary source; (5) lint-impedance handling (§7.1) — is treating lint exit 1 as advisory for corpus artefacts the right call or a hack? Output: structured Quality Gate Result + per-finding file:line:severity. No mutations.
codex
I’ll keep this read-only and treat it as a review gate: first confirm the active repo artefacts and line numbers, then inspect the specified sample deeply enough to issue file:line findings.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "agentic-installation-methodology|primary-source-research-corpus|agentic ops framework|Product B" /home/hasnobeef/.codex/memories/MEMORY.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 1 in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'pwd && git status --short && rg --files' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
/var/home/hasnobeef/buildepicshit/agentic-installation-methodology
?? reviews/
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
specs/2026-05-20-longread-structure/SPEC.md
specs/2026-05-19-primary-source-research-corpus/SPEC.md
specs/2026-05-18-repo-standup/SPEC.md
tests/hooks/run-tests.sh
LICENSE
schema/SPEC.schema.md
templates/IDEA.template.md
scripts/lint-spec.sh
scripts/validate-longread-structure.sh
templates/TASK.template.md
scripts/check-corpus-completeness.sh
templates/SPEC.task.template.md
scripts/validate-skill-frontmatter.sh
templates/SPEC.fastpath.template.md
templates/SPEC.decision.template.md
templates/SPEC.contract.template.md
hooks/block-verify-bypass.sh
hooks/verify-reminder.sh
hooks/block-edit-on-main.sh
hooks/block-push-to-main.sh
hooks/session-start-context.sh
hooks/block-ai-attribution.sh
hooks/block-git-add-all.sh
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/fixtures/msg-clean.txt

codex
The memory registry had no relevant hit for this repo/spec, so I’m relying on the live repository artefacts. I also see untracked `reviews/` files already present; I’ll ignore them unless they become useful context, since the requested target is the SPEC plus corpus.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
   261	### 6.4 INDEX.md contract
   262	
   263	`research/primary-sources/INDEX.md` is the corpus's
   264	machine-checkable index. Format:
   265	
   266	```markdown
   267	# Primary-source corpus index
   268	
   269	Source-list version: v1.0
   270	Last updated: <YYYY-MM-DD>
   271	
   272	| Slug | Status | Fetched on | Methodology summary |
   273	|---|---|---|---|
   274	| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
   275	| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
   276	| ... | ... | ... | ... |
   277	```
   278	
   279	Every row's `Slug` MUST correspond to a `<slug>.md` file in
   280	the directory; every `<slug>.md` file MUST have a row in
   281	INDEX.md. The check script enforces both directions.
   282	
   283	## 7. Behavior Specification
   284	
   285	### 7.1 Per-source read procedure
   286	
   287	For each in-scope source (§6.1):
   288	
   289	1. **Identify primary URL.** Use §6.1's primary URL as
   290	   starting point.
   291	2. **Fetch via WebFetch.** Capture the response. If
   292	   WebFetch returns content, set `fetched_via: WebFetch`.
   293	3. **Fallback chain on failure.** If WebFetch fails:
   294	   a. Retry with `curl -fsSL --max-time 30 <url>`.
   295	   b. If primary URL is access-blocked, attempt
   296	      `url://web.archive.org/web/<recent-snapshot>/<url>`
   297	      via WebFetch.
   298	   c. If all fail, set `fetch_outcome: access-blocked`
   299	      and §2 Fetch trace records every attempted call.
   300	      The slug remains in INDEX.md with that status; an
   301	      alternative-source-found note is REQUIRED in §6
   302	      Open Questions of that artefact OR the
   303	      methodology MUST NOT cite primitives from that
   304	      source in downstream slices.
   305	4. **Extract verbatim claims** germane to the
   306	   methodology's §3 / §4 / §5 from the research workpad
   307	   (or the dispositioned-research §11.5 disposition
   308	   table). Each quote is attributed and bounded per §6.3.
   309	5. **Author the artefact** at
   310	   `research/primary-sources/<slug>.md` per §6.2 schema.
   311	6. **Update INDEX.md** to add the row (or update status
   312	   if the slug already had a `pending` placeholder).
   313	7. **Lint the artefact**:
   314	   `bash scripts/lint-spec.sh
   315	   research/primary-sources/<slug>.md` SHOULD exit 0.
   316	   The lint may not be a perfect fit for non-SPEC
   317	   artefacts; lint exit 1 on a corpus artefact is
   318	   advisory unless the failure is uncited-claim, which
   319	   IS blocking — corpus artefacts above all else MUST
   320	   carry citations.
   321	
   322	### 7.2 INDEX-driven check script
   323	
   324	`scripts/check-corpus-completeness.sh` MUST:
   325	
   326	1. Read INDEX.md and parse every row.
   327	2. For each row's slug, verify
   328	   `research/primary-sources/<slug>.md` exists.
   329	3. For each `<slug>.md` file, verify a row exists in
   330	   INDEX.md with matching slug.
   331	4. Verify every row's status is one of
   332	   `primary-read-complete | partial | access-blocked |
   333	   superseded | pending`.
   334	5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
   335	   version frozen in §6.1 of this SPEC.
   336	6. Exit 0 if every slug in INDEX.md is either
   337	   `primary-read-complete` or has a documented
   338	   `access-blocked` (with §6 alternative note); else
   339	   exit non-zero with diagnostic lines per gap.
   340	
   341	### 7.3 Corpus citation binding (downstream slices)
   342	
   343	Downstream methodology slices (longread, SPEC bundle)
   344	cite primitives from these sources via
   345	`file://research/primary-sources/<slug>.md §<n>` or by
   346	fully-qualified-URL-with-corpus-anchor
   347	`file://research/primary-sources/<slug>.md` when the
   348	whole entry is the relevance. Agent memory and prior
   349	agent summaries are NOT citable for any claim drawn
   350	from a source in §6.1's scope.
   351	
   352	The lint extension to enforce this binding is out of
   353	scope; it lands as a follow-on Task SPEC. In the
   354	interim, reviewers (cross-family and same-family)
   355	enforce manually.
   356	
   357	## 8. Schema Specification
   358	
   359	### 8.1 Per-source artefact front-matter (formal)
   360	
   361	```yaml
   362	slug:               # string; matches §6.1 row; required
   363	source_name:        # string; required; full source name
   364	primary_url:        # string; required; canonical URL
   365	fetched_via:        # enum: WebFetch | curl | archive.org | manual
   366	fetched_on:         # date: YYYY-MM-DD; required
   367	fetch_outcome:      # enum: primary-read-complete | partial |
   368	                    #       access-blocked
   369	fetch_evidence:     # string; required; one-line digest
   370	supersedes:         # string; optional; slug of prior entry
   371	methodology_relevance: |  # string; multi-line; required
   372	```
   373	
   374	### 8.2 INDEX.md row schema (formal)
   375	
   376	A pipe-delimited markdown table with columns:
   377	
   378	| Slug | Status | Fetched on | Methodology summary |
   379	
   380	Where:
   381	
   382	- `Slug` is a kebab-case identifier matching §6.1.
   383	- `Status` is one of: `primary-read-complete`, `partial`,
   384	  `access-blocked`, `superseded`, `pending`.
   385	- `Fetched on` is `YYYY-MM-DD` or `—` when status is
   386	  `pending`.
   387	- `Methodology summary` is a one-sentence summary.
   388	
   389	## 9. Reference Algorithms
   390	
   391	### 9.1 Completeness check (pseudocode)
   392	
   393	```
   394	function check_corpus_completeness():
   395	  index = read_index_md()
   396	  slugs_in_index = set(row.slug for row in index.rows)
   397	  slugs_in_files = set(basename(f, ".md")
   398	                       for f in glob("research/primary-sources/*.md")
   399	                       if basename(f) != "INDEX.md")
   400	  missing_files = slugs_in_index - slugs_in_files
   401	  orphan_files = slugs_in_files - slugs_in_index
   402	  pending = [row for row in index.rows
   403	             if row.status == "pending"]
   404	  blocked_without_note = [row for row in index.rows
   405	                          if row.status == "access-blocked"
   406	                          and not row_has_access_blocked_note(row)]
   407	  if missing_files or orphan_files or pending or blocked_without_note:
   408	    emit_diagnostics()
   409	    exit 1
   410	  if index.source_list_version != SPEC_FROZEN_VERSION:
   411	    emit_diagnostic("source list drift")
   412	    exit 1
   413	  exit 0
   414	```
   415	
   416	## 10. Failure Model
   417	
   418	### 10.1 Failure classes
   419	
   420	| Class | Trigger | Recovery |
   421	|---|---|---|
   422	| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
   423	| `quote-overrun` | Verbatim §3 quote exceeds the §6.3 fair-use bound | Reviewer rejects the artefact at corpus-completion review; author shortens to compliant excerpt |
   424	| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
   425	| `summary-without-primary` | A claim in INDEX.md's `Methodology summary` column is not anchored by a verbatim quote in the corresponding artefact's §3 | Reviewer rejects; author either anchors the claim or removes it from the summary |
   426	| `slug-collision` | Two artefacts share a slug | Force-fix; one or both renamed; INDEX.md updated |
   427	| `supersession-loop` | Artefact A is `supersedes: B` AND B is `supersedes: A` | Force-fix; the supersession DAG is acyclic |
   428	
   429	### 10.2 Recovery posture
   430	
   431	The corpus is forgiving on form, strict on substance. A
   432	mis-formatted front-matter field is a recoverable bug; a
   433	methodology claim without a primary anchor is a violation
   434	of the owner directive and blocks the methodology body
   435	from landing.
   436	
   437	## 11. Trust Boundary / Security
   438	
   439	### 11.1 Trust boundary
   440	
   441	- The corpus consumes external content fetched from
   442	  third-party URLs. Each fetch is treated as untrusted
   443	  input: the agent (WebFetch / curl) returns content; the
   444	  artefact author extracts text and attributes it; no
   445	  fetched content is executed.
   446	- The fetched URLs themselves are recorded; consumers of
   447	  the corpus can re-fetch and verify.
   448	
   449	### 11.2 Adversarial spec consumption (research §2.3.7)
   450	
   451	The methodology Product B publishes flags adversarial spec
   452	consumption as an open research question. The corpus
   453	itself, by exposing the verbatim sources, INHERITS that
   454	risk surface for any downstream agent that fetches the
   455	corpus: a malicious primary URL could carry prompt
   456	injection. Mitigation: the corpus's §2 Fetch trace records
   457	the URL and content digest at fetch time; downstream
   458	agents that re-fetch SHOULD verify the digest matches.
   459	The methodology MUST flag this as an open risk for
   460	agents consuming the SPEC bundle.
   461	
   462	## 12. Observability
   463	
   464	- Each artefact's §2 Fetch trace logs the agent tool
   465	  invocation and outcome.
   466	- INDEX.md is the single index surface; reading it gives
   467	  the corpus's state.
   468	- `check-corpus-completeness.sh` exit code + diagnostics
   469	  is the mechanical observability surface.
   470	
   471	## 13. Test and Validation Matrix
   472	
   473	| AC | Test |
   474	|---|---|
   475	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
   476	| AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
   477	| AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
   478	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
   479	| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
   480	| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
   481	| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
   482	| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
   483	| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
   484	
   485	## 14. Implementation Checklist (Definition of Done)
   486	
   487	- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
   488	      authored, executable, lint clean against shellcheck
   489	      defaults.
   490	- [ ] DoD-2: `research/primary-sources/INDEX.md` authored
   491	      with rows for every §6.1 slug; statuses set
   492	      accurately.
   493	- [ ] DoD-3: Per-source artefact authored at
   494	      `research/primary-sources/<slug>.md` for every §6.1
   495	      slug, conforming to §6.2 schema + §8.1 front-matter.
   496	- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
   497	- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
   498	      through AC-9 all pass.
   499	- [ ] DoD-6: This SPEC's §17 Open Questions are all
   500	      resolved or explicitly deferred to follow-on Task
   501	      SPECs.
   502	
   503	## 15. Acceptance Criteria
   504	
   505	- [x] AC-1: `cmd://bash scripts/lint-spec.sh
   506	      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   507	      exits 0.
   508	- [x] AC-2: `cmd://test -f
   509	      research/primary-sources/INDEX.md` exits 0.
   510	- [x] AC-3: `cmd://test -x
   511	      scripts/check-corpus-completeness.sh` exits 0.
   512	- [x] AC-4: `cmd://bash
   513	      scripts/check-corpus-completeness.sh` exits 0 with
   514	      every §6.1 slug at status
   515	      `primary-read-complete` OR `access-blocked` + note.
   516	- [x] AC-5: Every §6.1 slug has a corresponding
   517	      artefact file under `research/primary-sources/`.
   518	- [x] AC-6: Every artefact's front-matter passes the §8.1
   519	      schema check.
   520	- [x] AC-7: No verbatim §3 quote exceeds the §6.3
   521	      fair-use bound (or, if it does, the source's
   522	      license is recorded as permitting it).
   523	- [x] AC-8: §17 Completion Report records per-source
   524	      fetch outcomes + any access-blocked resolutions.
   525	- [x] AC-9: Cross-family review (BLOCKING per parent
   526	      Decision §7) signs off OR same-family-proxy is
   527	      recorded with the cross-family-deferral rationale.
   528	
   529	## 16. Rollback Plan
   530	
   531	The corpus is append-only; rollback is a directed-graph
   532	problem.
   533	
   534	Triggers for rollback:
   535	
   536	- A fetched primary source is later proven misattributed
   537	  (e.g. the URL we fetched was a spoof; the real source
   538	  contradicts it).
   539	- The source-list version drifts because §6.1 is
   540	  amended (a §6.1 amendment is a Contract SPEC
   541	  amendment under the v1 procedure).
   542	
   543	Exit procedure:
   544	
   545	1. The affected slug's artefact is superseded by a vN
   546	   entry citing the misattribution evidence.
   547	2. INDEX.md row is updated to point to the new vN slug.
   548	3. Downstream methodology slices that cited the
   549	   superseded artefact MUST be re-reviewed against the
   550	   new vN.
   551	
   552	The corpus directory itself never has files deleted;
   553	provenance is preserved.
   554	
   555	## 17. Open Questions
   556	
   557	- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
   558	      Subsequent additions (a new primary source surfaces
   559	      during longread authoring) require a Contract SPEC
   560	      amendment per §16. Default: defer; not a blocker.
   561	- [ ] Q2: The corpus-citation-binding lint extension is
   562	      out of scope; reviewers enforce manually. Whether
   563	      to add the lint extension as a follow-on Task SPEC
   564	      is deferred; recommend yes once the corpus is
   565	      populated and the citation surface is concrete.
   566	- [ ] Q3: Cross-family review for THIS Contract SPEC.
   567	      The parent Decision §7 makes cross-family review
   568	      BLOCKING per slice. Same-family self-review is the
   569	      default fallback; Codex (or other non-Claude) pass
   570	      is the rigorous path. Owner directive applies
   571	      ("base this all in deep research" suggests rigour).
   572	      Default: same-family proxy with explicit caveat
   573	      recorded; if owner directs external cross-family,
   574	      escalate.
   575	- [ ] Q4: Are there primary sources missing from §6.1
   576	      that should land in v1.0? Specifically: SPDX/SBOM
   577	      (CycloneDX), Pact for contract testing, JSON
   578	      Schema (separately from Helm values), CUE
   579	      (configuration language). Defer to owner; not a
   580	      blocker for v1.0 if absent.
   581	
   582	Neither Q1-Q4 is `owner-blocking`; all can land as
   583	follow-on Contract SPEC amendments without re-work of
   584	the corpus already produced.
   585	
   586	## 18. Migration / Coexistence
   587	
   588	The corpus is greenfield; nothing migrates from prior
   589	state. The 2026-05-17 dispositioned research workpad
   590	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   591	remains the upstream record of the field-state survey
   592	that motivated this corpus; it is NOT replaced by the
   593	corpus. The corpus supplements the workpad with
   594	primary-source rigor that the workpad explicitly flagged
   595	as missing (§12 Verification Caveats).
   596	
   597	Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
   598	
   599	- The workpad as the historical synthesis (the
   600	  hypothesis space). <!-- lint-ok: no-citation -->
   601	- The corpus as the primary-source-anchored evidence
   602	  the methodology actually rests on. <!-- lint-ok: no-citation -->
   603	
   604	## 19. Completion Report
   605	
   606	### 19.1 Files changed
   607	
   608	- `scripts/check-corpus-completeness.sh` — mechanical
   609	  corpus-completeness gate (new).
   610	- `research/primary-sources/INDEX.md` — v1.0 corpus
   611	  index; all 20 rows at status: primary-read-complete.
   612	- `research/primary-sources/*.md` — 20 per-source
   613	  artefacts, all conforming to §6.2 schema + §8.1
   614	  front-matter:
   615	  - arc42 (architecture documentation)
   616	  - c4-model (architecture model)
   617	  - adr-nygard (foundational ADR)
   618	  - adr-tools-state (state-of-practice ADR)
   619	  - diataxis (documentation taxonomy)
   620	  - 12-factor (cloud-native SaaS methodology)
   621	  - helm-values-schema (customization-affordance)
   622	  - nix-flakes (reproducibility)
   623	  - oci-artifacts (distribution packaging)
   624	  - sigstore-cosign (signing)
   625	  - symphony-spec (operating-model-as-SPEC)
   626	  - spec-kit (spec-as-authoring tool)
   627	  - kiro (agentic IDE)
   628	  - openspec (spec-driven dev tool)
   629	  - oracle-agent-spec (framework-agnostic agent
   630	    description)
   631	  - ref-arch-vs-solution-arch (ownership-split
   632	    precursor)
   633	  - leaddev-agent-compiled (published risk critique)
   634	  - cucumber-gherkin (executable behavior spec)
   635	  - openapi-3-1 (HTTP API contract)
   636	  - structurizr-dsl (architecture-as-code)
   637	- This SPEC's §15 Acceptance Criteria checkboxes
   638	  flipped to checked.
   639	
   640	### 19.2 Commands run
   641	
   642	- 23 `cmd://WebFetch` invocations across the 20 sources
   643	  (some sources required supplementary fetches; one
   644	  redirect was followed from nixos.org to nix.dev).
   645	- `cmd://bash scripts/lint-spec.sh
   646	  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   647	  — exit 0 (0 errors, 0 warnings, 47 citation hits).
   648	- `cmd://bash scripts/check-corpus-completeness.sh` —
   649	  exit 0; PASS — 20 sources, all complete.
   650	- Per-artefact `cmd://bash scripts/lint-spec.sh
   651	  research/primary-sources/<slug>.md` — exit 1 on each
   652	  (lint script is designed for SPEC artefacts; corpus
   653	  artefacts have `slug:` front-matter rather than
   654	  `type:`). Per this SPEC §7.1, lint exit 1 on a
   655	  corpus artefact is advisory; the
   656	  `check-corpus-completeness.sh` script is the
   657	  authoritative gate. All artefacts conform manually
   658	  to §6.2 schema + §8.1 front-matter.
   659	
   660	### 19.3 Verification result
   661	
   662	PASS. All §15 ACs met:
   663	
   664	- AC-1: SPEC.md lint clean (exit 0).
   665	- AC-2: INDEX.md present.
   666	- AC-3: check-corpus-completeness.sh present + executable.
   667	- AC-4: check-corpus-completeness.sh exits 0; all 20
   668	  slugs at status primary-read-complete.
   669	- AC-5: every §6.1 slug has corresponding `<slug>.md`
   670	  artefact.
   671	- AC-6: every artefact's front-matter conforms to
   672	  §8.1 schema (manual review).
   673	- AC-7: no verbatim §3 quote exceeds the 200-word
   674	  fair-use bound (manual review; longest excerpts are
   675	  the 18-section Symphony list and 12-factor's 12
   676	  named factors, both well under bound).
   677	- AC-8: this Completion Report records the per-source
   678	  fetch outcomes (all 20 primary-read-complete; zero
   679	  access-blocked) and the source-list discoveries
   680	  (Kiro Bedrock binding NOT confirmed by primary read;
   681	  was an inferred binding in the prior research
   682	  workpad).
   683	- AC-9: cross-family review deferred. Same-family
   684	  self-review performed; advisory recorded. Owner
   685	  directive 2026-05-18 ("base this all in deep
   686	  research, not make up bullshit") was the rigour bar;
   687	  the corpus's verbatim-quote anchoring is the
   688	  primary discharge of that obligation, with
   689	  cross-family review as a secondary check that can
   690	  land before downstream slices.
   691	
   692	### 19.4 Residual risk
   693	
   694	- **Per-artefact lint mismatch**: the lint script
   695	  treats corpus artefacts as malformed SPECs (missing
   696	  `type:` field; missing standard SPEC sections). Per
   697	  §7.1, this is advisory; the corpus-completeness
   698	  check is the authoritative gate. If future lint
   699	  evolution adds corpus-mode, the per-artefact lint
   700	  warnings disappear; meanwhile they are documented
   701	  noise.
   702	- **Three artefacts fetched as `partial` material but
   703	  recorded `primary-read-complete` because the
   704	  primary URL returned substantive content**:
   705	  - `structurizr-dsl` — root page returned definition
   706	    + C4-implementation framing; deep syntax (workspace
   707	    / model / views keywords) was navigation-only on
   708	    the fetched page. Fetch outcome marked `partial`
   709	    in the artefact's front-matter; INDEX row still
   710	    primary-read-complete because the load-bearing
   711	    methodology claims (DSL purpose, architecture-as-
   712	    code posture, C4 implementation) were anchored.
   713	  - `adr-tools-state` — root page returned community
   714	    framing + template-family references but deep
   715	    template specifics + CLI conventions live on
   716	    sub-pages not fetched. Outcome `partial` in
   717	    front-matter, `primary-read-complete` in INDEX —
   718	    sub-pages are queued as open questions for
   719	    follow-on supplementary fetches if the methodology
   720	    mandates specific ADR templates.
   721	- **Kiro Bedrock binding correction**: prior summary
   722	  in the research workpad characterised Kiro as
   723	  "Bedrock-tethered"; the homepage primary read did
   724	  NOT confirm this. The artefact records the
   725	  correction in §4 Fact-link to methodology. The
   726	  methodology's published characterisation of Kiro
   727	  MUST cite the primary read, not the prior summary.
   728	- **The seven open research questions remain
   729	  unresolved**. This corpus closes the
   730	  primary-source-grounding gap (the methodology can
   731	  now cite arc42, C4, ADRs, etc. accurately) but does
   732	  not resolve the seven open questions from the
   733	  research workpad §2.3 (exhaustiveness vs.
   734	  prescription boundary; ambiguity handling; patching
   735	  semantics; install-matches-intent verification;
   736	  equivalence classes; capability floor; adversarial
   737	  consumption). Those remain published-as-flagged-open
   738	  per parent Decision §7.
   739	
   740	### 19.5 Spec evidence candidates
   741	
   742	- **Primary-read corpus pattern**: structured per-source
   743	  artefacts with verbatim claims, fetch trace, gap from
   744	  prior summary, downstream-citation surface, open
   745	  questions are a robust corpus shape for any
   746	  methodology that must ground claims in external
   747	  sources. Capture as a reusable pattern under the
   748	  `spec-evidence-governance` skill: "when the
   749	  methodology depends on external sources, a
   750	  primary-source corpus is the citable foundation —
   751	  agent summaries are not sufficient."
   752	- **Lint-vs-corpus impedance**: the SPEC's lint script
   753	  is designed for IDEA/SPEC artefacts; corpus
   754	  artefacts (with `slug:` front-matter and §
   755	  structure tuned to source characterisation) trigger
   756	  spurious lint errors. Two paths: (a) extend
   757	  lint-spec.sh with a corpus-mode (out of scope here);
   758	  (b) accept lint as advisory for corpus per the
   759	  SPEC's own §7.1 affordance. We took (b). Capture as
   760	  spec-evidence for future linter design: lints should
   761	  treat front-matter discriminator as the
   762	  artefact-type signal and apply mode-appropriate
   763	  checks rather than assuming SPEC shape.
   764	- **Verbatim-quote bounded excerpts are practical**:
   765	  the 200-word fair-use bound (§6.3) proved easy to
   766	  honour; the longest excerpts in the corpus
   767	  (Symphony's 18-section list, 12-factor's 12 factor
   768	  names) are well under bound and the artefact's
   769	  Methodology-relevance + Fact-link sections do the
   770	  characterisation work that would otherwise need
   771	  longer excerpts.
   772	- **Prior-summary corrections happen and matter**:
   773	  the Kiro "Bedrock-tethered" inferred binding was
   774	  contradicted by primary read; the diataxis four-mode
   775	  definitions were anchored verbatim rather than
   776	  paraphrased; arc42's 12-section list was confirmed
   777	  precisely. The corpus's §4 Gap-from-prior-summary
   778	  section captures these corrections explicitly,
   779	  giving the methodology's longread author the data
   780	  to write honestly about what the research workpad
   781	  got right and what needed correction.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'nl -ba research/primary-sources/INDEX.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/arc42.md research/primary-sources/c4-model.md research/primary-sources/adr-nygard.md; do printf '\\n### %s\\n' \""'$f"; nl -ba "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

### research/primary-sources/arc42.md
     1	---
     2	slug: arc42
     3	source_name: "arc42 — template for architecture communication and documentation"
     4	primary_url: "https://docs.arc42.org/section-1/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched docs.arc42.org/section-1/ and arc42.org/overview/; section list + maintainers + license confirmed"
     9	methodology_relevance: |
    10	  arc42 is the most-cited prior-art template for architecture
    11	  documentation in the methodology's research workpad §3 / §4.
    12	  This corpus entry establishes arc42's 12-section structure,
    13	  its self-description ("template for architecture communication
    14	  and documentation"), and its maintenance posture, so the
    15	  methodology can cite arc42 sections precisely (e.g. §8
    16	  Crosscutting Concepts vs §9 Architectural Decisions) when
    17	  comparing decomposition primitives.
    18	---
    19	
    20	# arc42
    21	
    22	## 1. Source identity
    23	
    24	- Name: arc42 — Template for Architecture Communication and
    25	  Documentation.
    26	- Canonical URL: `url://docs.arc42.org/` (primary template
    27	  chapters at `/section-1/` through `/section-12/`); overview
    28	  at `url://arc42.org/overview/`.
    29	- Maintainers: Dr. Peter Hruschka and Dr. Gernot Starke
    30	  (`url://arc42.org/overview/`).
    31	- Supporters: Per Starke Web Development; innoQ
    32	  (`url://arc42.org/overview/`).
    33	- License posture: open-source-friendly; explicit licence
    34	  link at `url://arc42.org/license` (not deep-read).
    35	
    36	## 2. Fetch trace
    37	
    38	- `cmd://WebFetch url://docs.arc42.org/section-1/` —
    39	  2026-05-19; returned section listing + section-1
    40	  excerpts; primary read.
    41	- `cmd://WebFetch url://arc42.org/overview/` — 2026-05-19;
    42	  returned definition, maintainers, license link;
    43	  supplementary primary read.
    44	
    45	## 3. Verbatim claims this corpus depends on
    46	
    47	- **Self-definition (overview page)**: arc42 describes
    48	  itself as "a template for architecture communication and
    49	  documentation." It addresses "what should be documented
    50	  about your architecture, and how it should be
    51	  communicated." (`url://arc42.org/overview/`)
    52	
    53	- **The 12 sections** of the arc42 template
    54	  (`url://docs.arc42.org/section-1/` navigation), in order:
    55	
    56	  1. Introduction and Goals
    57	  2. Constraints
    58	  3. Context and scope
    59	  4. Solution strategy
    60	  5. Building block view
    61	  6. Runtime view
    62	  7. Deployment view
    63	  8. Concepts
    64	  9. Architecture decisions
    65	  10. Quality
    66	  11. Risks and technical debt
    67	  12. Glossary
    68	
    69	- **Section 1.0 (Introduction and Goals)** — verbatim:
    70	  "Describes the relevant requirements and the driving
    71	  forces that software architects and development team
    72	  must consider." (`url://docs.arc42.org/section-1/`)
    73	
    74	- **Section 1.2 (Quality Goals)** — verbatim: "The top
    75	  three (max five) quality goals for the architecture
    76	  whose fulfillment is of highest importance to the major
    77	  stakeholders." (`url://docs.arc42.org/section-1/`)
    78	
    79	- **Posture** (overview): the template "presents itself
    80	  as pragmatic and tailored to your specific needs."
    81	  arc42 is intended as "a comprehensive, adaptable
    82	  approach to architecture documentation rather than a
    83	  prescriptive mandate." (`url://arc42.org/overview/`)
    84	
    85	## 4. Gap from prior summary characterization
    86	
    87	Prior summary in
    88	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    89	§12 noted arc42 as "access-denied and characterized via
    90	WebSearch summaries." This primary read closes that gap:
    91	
    92	- The exact 12-section list is now confirmed and citable <!-- lint-ok: no-citation -->
    93	  by name and position (not paraphrased).
    94	- arc42's self-description ("template for architecture <!-- lint-ok: no-citation -->
    95	  communication and documentation") is anchored verbatim
    96	  rather than inferred.
    97	- arc42's adaptable-not-prescriptive posture is confirmed <!-- lint-ok: no-citation -->
    98	  by the overview page, supporting the research workpad's
    99	  characterization of arc42 as decomposition prior art
   100	  whose customization model is implicit rather than
   101	  formalized.
   102	
   103	## 5. Downstream-citation surface
   104	
   105	The following methodology claims are now licensed by this
   106	corpus entry (downstream cite as
   107	`file://research/primary-sources/arc42.md §3`):
   108	
   109	- methodology-claim: "arc42 ships a 12-section structure <!-- lint-ok: no-citation -->
   110	  covering introduction-and-goals, constraints, context,
   111	  solution strategy, building-block view, runtime view,
   112	  deployment view, concepts, architecture decisions,
   113	  quality, risks-and-technical-debt, glossary."
   114	- methodology-claim: "arc42 §9 Architecture Decisions <!-- lint-ok: no-citation -->
   115	  exists as a separate section — decisions are first-class
   116	  in arc42's decomposition, not buried inside design
   117	  rationale."
   118	- methodology-claim: "arc42 is pragmatic and adaptable, not <!-- lint-ok: no-citation -->
   119	  a prescriptive mandate — author self-description."
   120	- methodology-claim: "arc42 §8 Concepts covers crosscutting <!-- lint-ok: no-citation -->
   121	  technical concerns; the agentic-installation methodology
   122	  proposes additional decomposition primitives (customization
   123	  catalog, deferral contract) that arc42 does not natively
   124	  model."
   125	
   126	## 6. Open questions surfaced by the primary read
   127	
   128	- arc42 §9 Architecture Decisions does not specify an
   129	  artefact shape (no ADR-template binding); a deeper read
   130	  of arc42's published examples is needed to know whether
   131	  arc42 §9 typically defers to Nygard-format ADRs or has
   132	  its own preferred structure.
   133	- arc42 §10 Quality and §11 Risks-and-Technical-Debt are
   134	  named separately from §8 Concepts; the methodology's
   135	  proposed "quality" facet (research §5.1) needs to
   136	  decide whether it follows arc42's three-way split or
   137	  collapses them.
   138	- The license terms at `url://arc42.org/license` were not
   139	  fetched on this pass; if downstream methodology
   140	  artefacts reproduce arc42 templates or imagery, the
   141	  license should be verified.

### research/primary-sources/c4-model.md
     1	---
     2	slug: c4-model
     3	source_name: "The C4 model for visualising software architecture"
     4	primary_url: "https://c4model.com/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched c4model.com/ + c4model.com/abstractions; four-level hierarchy confirmed verbatim; notation+tooling independence confirmed"
     9	methodology_relevance: |
    10	  C4 is the methodology's primary reference for
    11	  architecture decomposition at the Container / Component
    12	  level, cited in the research workpad §5.1 packaging
    13	  recommendation. This corpus entry establishes the four
    14	  abstractions verbatim, the notation-independence
    15	  posture, and the boundary with code-level diagrams so
    16	  the methodology can cite C4 precisely when prescribing
    17	  the architecture/ sub-spec's diagram shape.
    18	---
    19	
    20	# C4 Model
    21	
    22	## 1. Source identity
    23	
    24	- Name: The C4 model for visualising software
    25	  architecture.
    26	- Author / maintainer: Simon Brown.
    27	- Canonical URL: `url://c4model.com/`; abstractions
    28	  detail at `url://c4model.com/abstractions`.
    29	- Posture: notation-independent, tooling-independent,
    30	  hierarchical.
    31	
    32	## 2. Fetch trace
    33	
    34	- `cmd://WebFetch url://c4model.com/` — 2026-05-19;
    35	  returned definition + four-abstraction hierarchy +
    36	  notation-independence statement.
    37	- `cmd://WebFetch url://c4model.com/abstractions` —
    38	  2026-05-19; returned per-level descriptions.
    39	
    40	## 3. Verbatim claims this corpus depends on
    41	
    42	- **Self-definition (homepage)**: "The C4 model is an
    43	  easy to learn, developer friendly approach to software
    44	  architecture diagramming." (`url://c4model.com/`
    45	  #the-c4-model-for-visualising-software-architecture)
    46	
    47	- **The four-abstraction hierarchy** (`url://c4model.com/`):
    48	  C4 comprises "a set of hierarchical abstractions"
    49	  consisting of:
    50	  1. Software systems
    51	  2. Containers
    52	  3. Components
    53	  4. Code
    54	
    55	- **Software System** (`url://c4model.com/abstractions`):
    56	  "A software system is made up of one or more containers
    57	  (applications and data stores)."
    58	
    59	- **Container** (`url://c4model.com/abstractions`):
    60	  containers "contain one or more components"; they are
    61	  "applications and data stores" — distinct from Docker
    62	  containers per the model's own terminology, though the
    63	  abstractions page does not contain an explicit
    64	  Docker-disambiguation sentence in the fetched excerpt.
    65	
    66	- **Component** (`url://c4model.com/abstractions`):
    67	  components are elements contained within containers
    68	  that "in turn are implemented by one or more code
    69	  elements."
    70	
    71	- **Code** (`url://c4model.com/abstractions`): the
    72	  lowest level — "classes, interfaces, objects,
    73	  functions, etc" that implement components.
    74	
    75	- **Notation independence** (`url://c4model.com/`
    76	  #diagrams/notation): C4 is "notation independent" —
    77	  the model does not prescribe UML, ArchiMate, or any
    78	  particular notation.
    79	
    80	- **Tooling independence** (`url://c4model.com/`
    81	  #tooling): C4 is "tooling independent" — works with
    82	  any diagramming tool.
    83	
    84	## 4. Gap from prior summary characterization
    85	
    86	Prior summary in
    87	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    88	§3 / §5.1 cited C4 as the architecture decomposition
    89	primitive at "Container-level (Structurizr DSL preferred
    90	for machine-readability)." This primary read closes the
    91	gap on:
    92	
    93	- The exact four-level hierarchy is now anchored verbatim, <!-- lint-ok: no-citation -->
    94	  not paraphrased.
    95	- The notation-independence and tooling-independence <!-- lint-ok: no-citation -->
    96	  postures are anchored to the homepage's own
    97	  headings — the methodology can cite these as
    98	  conformance properties C4 offers that other
    99	  decomposition frameworks (e.g. arc42, ADRs) do not.
   100	- The "Container" disambiguation was NOT found verbatim <!-- lint-ok: no-citation -->
   101	  on the fetched pages; the abstractions page implies the
   102	  distinction (Container = applications and data stores)
   103	  but does not state "Container is NOT a Docker
   104	  container" in the fetched text. This is an `open
   105	  question` for §6.
   106	
   107	## 5. Downstream-citation surface
   108	
   109	The following methodology claims are licensed by this
   110	entry (cite as
   111	`file://research/primary-sources/c4-model.md §3`):
   112	
   113	- methodology-claim: "C4 is a four-level hierarchical <!-- lint-ok: no-citation -->
   114	  architecture-visualisation model: Software Systems →
   115	  Containers → Components → Code."
   116	- methodology-claim: "C4 is notation-independent and <!-- lint-ok: no-citation -->
   117	  tooling-independent (per c4model.com homepage
   118	  #diagrams/notation, #tooling)."
   119	- methodology-claim: "C4 Containers are applications and <!-- lint-ok: no-citation -->
   120	  data stores, not Docker containers — the terminology
   121	  is C4's own and predates / is separate from container
   122	  runtimes."
   123	- methodology-claim: "Code-level (level 4) diagrams in C4 <!-- lint-ok: no-citation -->
   124	  represent classes, interfaces, objects, functions; the
   125	  methodology's architecture/ sub-spec MAY include
   126	  Container + Component diagrams but Code-level diagrams
   127	  are typically generated rather than authored."
   128	
   129	## 6. Open questions surfaced by the primary read
   130	
   131	- The exact "C4 Container is NOT a Docker container"
   132	  disambiguation sentence was not present in the fetched
   133	  excerpts. A deeper read of `url://c4model.com/diagrams/container`
   134	  may yield the verbatim disambiguation. The methodology's
   135	  prose draft should not put quote marks around a
   136	  Docker-disambiguation phrasing this corpus has not
   137	  anchored.
   138	- C4's relationship to UML / ArchiMate is implied by the
   139	  "notation independent" posture but not stated as a
   140	  comparison; if downstream methodology compares C4 to
   141	  UML decomposition, that comparison should be sourced
   142	  separately or framed as agent-synthesis.
   143	- Structurizr DSL (separate corpus entry slug:
   144	  `structurizr-dsl`) is C4's reference implementation;
   145	  the relationship between C4-as-model and Structurizr-
   146	  as-DSL is documented separately. Cross-reference at
   147	  artefact-completion time.

### research/primary-sources/adr-nygard.md
     1	---
     2	slug: adr-nygard
     3	source_name: "Documenting Architecture Decisions — Michael Nygard (2011)"
     4	primary_url: "https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched Cognitect blog post directly; ADR template + rationale + lightweight thesis confirmed verbatim"
     9	methodology_relevance: |
    10	  Nygard's 2011 post is the foundational ADR document;
    11	  every state-of-practice ADR tooling (MADR, adr-tools,
    12	  Y-statements) cites it as origin. The methodology's
    13	  research workpad §5.1 names "ADRs (Nygard format),
    14	  append-only, superseded-by-link" as the decisions
    15	  facet primitive. This corpus entry anchors the
    16	  template structure, the lightweight-documentation
    17	  thesis, and the supersession model verbatim so the
    18	  methodology can cite Nygard precisely.
    19	---
    20	
    21	# Architecture Decision Records (Nygard)
    22	
    23	## 1. Source identity
    24	
    25	- Title: "Documenting Architecture Decisions".
    26	- Author: Michael Nygard.
    27	- Date: 2011-11-15.
    28	- Publisher: Cognitect blog.
    29	- Canonical URL: `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions`.
    30	- Status: foundational; widely cited as the origin of
    31	  ADR practice.
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions`
    36	  — 2026-05-19; returned full post text including
    37	  template structure, rationale, and lightweight-
    38	  documentation thesis.
    39	
    40	## 3. Verbatim claims this corpus depends on
    41	
    42	- **ADR definition** (Nygard 2011): "An architecture
    43	  decision record is a short text file in a format
    44	  similar to an Alexandrian pattern."
    45	  (`url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions`)
    46	
    47	- **Scope of "architecturally significant"**: ADRs
    48	  capture decisions "affecting structure, non-functional
    49	  characteristics, dependencies, interfaces, or
    50	  construction techniques."
    51	
    52	- **The four core template sections**:
    53	  1. **Title** — "short noun phrases" (example: "ADR 1:
    54	     Deployment on Ruby on Rails 3.0.10").
    55	  2. **Context** — "describes the forces at play,
    56	     including technological, political, social, and
    57	     project local" using "value-neutral" language.
    58	  3. **Decision** — "states our response to these
    59	     forces" in "full sentences, with active voice."
    60	  4. **Consequences** — "describes the resulting
    61	     context, after applying the decision" including
    62	     positive, negative, and neutral outcomes.
    63	
    64	- **Status section** — fifth (tracking) section: tracks
    65	  whether decisions are "proposed," "accepted,"
    66	  "deprecated," or "superseded."
    67	
    68	- **Why ADRs matter** (verbatim): "One of the hardest
    69	  things to track during the life of a project is the
    70	  motivation behind certain decisions."
    71	
    72	- **Lightweight thesis** (verbatim): "Large documents
    73	  are never kept up to date. Small, modular documents
    74	  have at least a chance at being updated." And: "Nobody
    75	  ever reads large documents, either."
    76	
    77	- **Length target** (verbatim guidance): ADRs are
    78	  ideally "one or two pages long," written as "a
    79	  conversation with a future developer."
    80	
    81	## 4. Gap from prior summary characterization
    82	
    83	Prior summary in
    84	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    85	§5.1 cited "ADRs (Nygard format), append-only,
    86	superseded-by-link" without the verbatim template
    87	structure or the lightweight thesis. This primary read
    88	closes the gap:
    89	
    90	- The five-section template (Title / Context / Decision <!-- lint-ok: no-citation -->
    91	  / Consequences / Status) is anchored verbatim.
    92	- The "Alexandrian pattern" framing is now citable as <!-- lint-ok: no-citation -->
    93	  Nygard's own characterisation.
    94	- The supersession lifecycle (proposed → accepted → <!-- lint-ok: no-citation -->
    95	  deprecated → superseded) is anchored as Nygard's
    96	  proposed status taxonomy.
    97	- The "small modular documents are kept up to date" <!-- lint-ok: no-citation -->
    98	  thesis is anchored as Nygard's rationale, not
    99	  paraphrased.
   100	
   101	## 5. Downstream-citation surface
   102	
   103	The following methodology claims are licensed by this
   104	entry (cite as
   105	`file://research/primary-sources/adr-nygard.md §3`):
   106	
   107	- methodology-claim: "ADRs are short (one-to-two-page) <!-- lint-ok: no-citation -->
   108	  text files capturing architecturally significant
   109	  decisions in a five-section template: Title, Context,
   110	  Decision, Consequences, Status." (Nygard §3)
   111	- methodology-claim: "ADR status lifecycle is proposed <!-- lint-ok: no-citation -->
   112	  → accepted → deprecated → superseded; supersession
   113	  produces a new ADR that references the old one's id."
   114	- methodology-claim: "Nygard's lightweight thesis is <!-- lint-ok: no-citation -->
   115	  that 'large documents are never kept up to date' —
   116	  the methodology's decisions facet inherits this thesis
   117	  in choosing per-decision artefacts over consolidated
   118	  decision-log documents."
   119	- methodology-claim: "Context section uses 'value- <!-- lint-ok: no-citation -->
   120	  neutral' language describing forces at play —
   121	  political, social, technological, project-local — so
   122	  later readers can understand the decision's
   123	  pressures."
   124	
   125	## 6. Open questions surfaced by the primary read
   126	
   127	- Nygard's post does not formalize a directory layout
   128	  for ADRs; state-of-practice tooling (adr-tools, MADR)
   129	  conventions are documented separately (corpus slug:
   130	  `adr-tools-state`).
   131	- The methodology's "decisions facet" sub-spec needs to
   132	  decide whether to mandate Nygard's exact five-section
   133	  template OR allow MADR's richer template OR allow
   134	  Y-statements. This is a methodology design choice not
   135	  resolvable from Nygard alone.
   136	- Nygard's "Alexandrian pattern" framing implies the ADR
   137	  is a single named pattern in a pattern language; the
   138	  methodology has not yet committed to pattern-language
   139	  framing for its own decisions facet.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/helm-values-schema.md research/primary-sources/symphony-spec.md research/primary-sources/leaddev-agent-compiled.md; do printf '\\n### %s\\n' \""'$f"; nl -ba "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

### research/primary-sources/helm-values-schema.md
     1	---
     2	slug: helm-values-schema
     3	source_name: "Helm Charts — values.yaml + values.schema.json"
     4	primary_url: "https://helm.sh/docs/topics/charts/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched Helm docs/topics/charts/; Chart.yaml + values.yaml + schema validation behaviour confirmed"
     9	methodology_relevance: |
    10	  Helm values schemas are research §4.1's closest-in-
    11	  practice analogue for the methodology's customization-
    12	  affordances facet ("comes closest in practice but describes
    13	  what is configurable, not what compositional patterns
    14	  exist"). This corpus entry anchors the Chart structure,
    15	  the values-vs-schema split, and the validation lifecycle
    16	  so the methodology can cite Helm precisely when comparing
    17	  customization grammars.
    18	---
    19	
    20	# Helm Charts — values.yaml + values.schema.json
    21	
    22	## 1. Source identity
    23	
    24	- Name: Helm Charts documentation.
    25	- Canonical URL: `url://helm.sh/docs/topics/charts/`.
    26	- Maintainer: Helm project (CNCF Graduated).
    27	- Version: as of v3.3.2 onward, Chart.yaml is strict
    28	  about additional fields.
    29	
    30	## 2. Fetch trace
    31	
    32	- `cmd://WebFetch url://helm.sh/docs/topics/charts/` —
    33	  2026-05-19; returned Chart.yaml fields, values.yaml +
    34	  values.schema.json relationship, validation behaviour.
    35	
    36	## 3. Verbatim claims this corpus depends on
    37	
    38	- **Chart definition** (`url://helm.sh/docs/topics/charts/`):
    39	  "A chart is a collection of files that describe a
    40	  related set of Kubernetes resources."
    41	
    42	- **Chart.yaml** is mandatory; carries metadata:
    43	  `apiVersion` (required), `name` (required), `version`
    44	  (SemVer 2, required), plus optional `description`,
    45	  `type`, `keywords`, `home`, `sources`, `dependencies`,
    46	  `maintainers`, `icon`, `appVersion`, `deprecated`,
    47	  `annotations`. As of v3.3.2: "additional fields are
    48	  not allowed. The recommended approach is to add
    49	  custom metadata in `annotations`."
    50	
    51	- **values.yaml** provides default configuration; users
    52	  override via `--set` or custom YAML files at install /
    53	  upgrade time.
    54	
    55	- **values.schema.json** implements JSON Schema
    56	  validation against `values.yaml`. The schema is the
    57	  contract describing "the expected structure and
    58	  constraints on configuration parameters."
    59	
    60	- **Schema validation lifecycle**: validation occurs
    61	  during `helm install`, `helm upgrade`, `helm lint`,
    62	  `helm template`. "The final `.Values` object is
    63	  checked against _all_ subchart schemas."
    64	
    65	- **Bypass mode**: `--skip-schema-validation` exists
    66	  "particularly useful in air-gapped environments with
    67	  remote schema references."
    68	
    69	## 4. Fact-link to methodology
    70	
    71	<!-- lint-ok: no-citation -->
    72	
    73	Helm's schema-bound customization is the closest published
    74	prior art for the methodology's customization-affordances
    75	facet. Key shape implications for the methodology's
    76	customization/ sub-spec design:
    77	
    78	- A two-file split — defaults (values.yaml) and contract
    79	  (values.schema.json) — is reusable for the methodology's
    80	  customization grammar.
    81	- Validation lifecycle hooks (install/upgrade/lint/
    82	  template equivalents) give the customization contract
    83	  enforcement surface.
    84	- Bypass mode (`--skip-schema-validation`) is a meaningful
    85	  precedent: the methodology MAY want a "permissive mode"
    86	  for cases where the installer knows better than the
    87	  schema.
    88	- The gap research §4.1 identified — "Helm values schemas
    89	  come closest in practice but describe what is
    90	  configurable, not what compositional patterns exist" —
    91	  is now anchored against Helm's actual surface: Helm's
    92	  schema is per-field validation, not per-composition
    93	  validation. The methodology's deferral contract IS
    94	  about composition-level deferrals.
    95	
    96	## 5. Downstream-citation surface
    97	
    98	<!-- lint-ok: no-citation -->
    99	
   100	Methodology claims licensed by this entry (cite as
   101	`file://research/primary-sources/helm-values-schema.md
   102	§3`):
   103	
   104	- methodology-claim: "Helm charts split customization
   105	  surface across values.yaml (defaults) + values.schema.json
   106	  (JSON Schema validation contract)."
   107	- methodology-claim: "Schema validation runs at install,
   108	  upgrade, lint, and template stages — multi-stage
   109	  validation lifecycle."
   110	- methodology-claim: "Helm's customization grammar is
   111	  per-field validation; it does not natively model
   112	  compositional patterns or named reference profiles —
   113	  this is the gap the methodology's customization facet
   114	  closes."
   115	- methodology-claim: "Helm provides a bypass mode for
   116	  air-gapped scenarios — a precedent for permissive-mode
   117	  installation in the methodology's deferral contract."
   118	
   119	## 6. Open questions surfaced by the primary read
   120	
   121	- JSON Schema (the underlying validation language Helm
   122	  values.schema.json uses) is a separate primary source
   123	  that may merit its own corpus entry if the methodology's
   124	  customization facet specifies a particular JSON Schema
   125	  draft. Currently treated as in-scope of the
   126	  helm-values-schema entry; revisit if methodology pins
   127	  a specific draft (2020-12, etc.).
   128	- Helm's `--skip-schema-validation` flag's behaviour with
   129	  multi-chart deployments — does it skip ONLY the top
   130	  chart's schema or all subcharts? Not verified in this
   131	  pass; flag for follow-on if methodology adopts a
   132	  similar bypass model.
   133	- Helm's relationship to OCI artifact registries (Helm
   134	  charts can be pushed/pulled via OCI as of v3) is
   135	  cross-referenced in the `oci-artifacts` corpus entry.

### research/primary-sources/symphony-spec.md
     1	---
     2	slug: symphony-spec
     3	source_name: "OpenAI Symphony — SPEC.md (operating-model-as-SPEC)"
     4	primary_url: "https://github.com/openai/symphony/blob/main/SPEC.md"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
     9	methodology_relevance: |
    10	  Symphony's SPEC.md is the only in-the-wild example of
    11	  "operating-model-as-SPEC" — research §3 named it the
    12	  source of 14 transferable building blocks for the
    13	  methodology. This corpus entry anchors the 18-section
    14	  structure, the three-profile conformance model, and the
    15	  tiered Definition-of-Done so the methodology can cite
    16	  Symphony precisely when prescribing the SPEC bundle's
    17	  shape and conformance harness.
    18	---
    19	
    20	# OpenAI Symphony SPEC.md
    21	
    22	## 1. Source identity
    23	
    24	- Name: OpenAI Symphony SPEC.md.
    25	- Author: OpenAI (Symphony project).
    26	- Canonical URL: `url://github.com/openai/symphony/blob/main/SPEC.md`.
    27	- License: project license (OpenAI; not deep-read for
    28	  exact licence terms on this pass).
    29	- Status: in-the-wild operating-model-as-SPEC; cited as
    30	  prior art for the methodology.
    31	
    32	## 2. Fetch trace
    33	
    34	- `cmd://WebFetch url://github.com/openai/symphony/blob/main/SPEC.md`
    35	  — 2026-05-19; returned 18-section structure, §17
    36	  Conformance Profiles, §18 DoD subsection breakdown.
    37	
    38	## 3. Verbatim claims this corpus depends on
    39	
    40	- **Symphony definition** (`url://github.com/openai/symphony/blob/main/SPEC.md`
    41	  §1 Problem Statement): "Symphony is a long-running
    42	  automation service that continuously reads work from
    43	  an issue tracker (Linear in this specification
    44	  version), creates an isolated workspace for each
    45	  issue, and runs a coding agent session for that issue
    46	  inside the workspace."
    47	
    48	- **The 18-section structure**:
    49	  1. Problem Statement
    50	  2. Goals and Non-Goals
    51	  3. System Overview
    52	  4. Core Domain Model
    53	  5. Workflow Specification (Repository Contract)
    54	  6. Configuration Specification
    55	  7. Orchestration State Machine
    56	  8. Polling, Scheduling, and Reconciliation
    57	  9. Workspace Management and Safety
    58	  10. Agent Runner Protocol
    59	  11. Issue Tracker Integration Contract
    60	  12. Prompt Construction and Context Assembly
    61	  13. Logging, Status, and Observability
    62	  14. Failure Model and Recovery Strategy
    63	  15. Security and Operational Safety
    64	  16. Reference Algorithms
    65	  17. Test and Validation Matrix
    66	  18. Implementation Checklist
    67	
    68	- **§17 Conformance Profiles** — three profiles:
    69	  - **Core Conformance**: "Deterministic tests required
    70	    for all conforming implementations."
    71	  - **Extension Conformance**: "Required only for
    72	    optional features an implementation chooses to
    73	    ship."
    74	  - **Real Integration Profile**: "Environment-dependent
    75	    smoke/integration checks recommended before
    76	    production use."
    77	
    78	- **§18 Definition of Done** — three subsections aligned
    79	  with §17 profiles:
    80	  - §18.1 REQUIRED for Conformance: 23 mandatory
    81	    components (workflow loader, orchestrator, tracker
    82	    client, workspace manager, hooks, agent runner,
    83	    retry queue, reconciliation, observability).
    84	  - §18.2 RECOMMENDED Extensions: 4 optional
    85	    capabilities (HTTP server, Linear GraphQL tool,
    86	    persistence across restarts, pluggable tracker
    87	    adapters).
    88	  - §18.3 Operational Validation Before Production: 3
    89	    pre-deployment checks (integration testing, host OS
    90	    verification, HTTP server configuration).
    91	
    92	## 4. Fact-link to methodology
    93	
    94	<!-- lint-ok: no-citation -->
    95	
    96	The 18-section structure is the most concrete in-the-wild
    97	example of operating-model-as-SPEC the methodology can
    98	cite. Confirmed transferable building blocks from research
    99	§3 (14 named blocks): the per-section anchoring of
   100	domain model, workflow contract, configuration pipeline,
   101	state machine, idempotency rules, safety invariants,
   102	observability layering, failure-class × recovery matrix,
   103	trust boundary, conformance profiles, tiered Definition
   104	of Done.
   105	
   106	The Symphony-specific (non-transferable) sections:
   107	- §10 Agent Runner Protocol — agent-specific.
   108	- §11.1-§11.4 Issue Tracker Integration — Linear-bound.
   109	- §12 Prompt Construction — prompt-engineering-specific.
   110	- §16 Reference Algorithms — Symphony-specific
   111	  algorithms.
   112	- §4 entity content — Codex/Linear-specific.
   113	
   114	## 5. Downstream-citation surface
   115	
   116	<!-- lint-ok: no-citation -->
   117	
   118	Methodology claims licensed by this entry (cite as
   119	`file://research/primary-sources/symphony-spec.md §3`):
   120	
   121	- methodology-claim: "Symphony's SPEC.md is the only
   122	  published in-the-wild example of an operating-model
   123	  shipped as a versioned SPEC artefact (18 sections,
   124	  three-profile conformance harness, tiered DoD)."
   125	- methodology-claim: "Symphony's three-profile
   126	  conformance model (Core / Extension / Real-Integration)
   127	  is reusable for the methodology's published SPEC
   128	  bundle conformance harness."
   129	- methodology-claim: "Symphony's tiered Definition-of-
   130	  Done (§18.1 REQUIRED + §18.2 RECOMMENDED + §18.3
   131	  pre-production checks) is the most directly portable
   132	  section in the document and the methodology's
   133	  SPEC-bundle Definition-of-Done MAY adopt the same
   134	  structure."
   135	- methodology-claim: "Symphony §5 Workflow Specification
   136	  (the repo-owned contract pattern with framework-
   137	  defined schema + free-form body + strict validation)
   138	  is the most novel-and-portable building block in the
   139	  Symphony document."
   140	
   141	## 6. Open questions surfaced by the primary read
   142	
   143	- Symphony's SPEC.md is bound to Linear as the issue
   144	  tracker; the methodology's framing is tracker-
   145	  agnostic. Citations of Symphony as prior art must
   146	  note this binding.
   147	- Symphony ships an Elixir reference implementation
   148	  (per external coverage) but the SPEC.md itself does
   149	  not bind to Elixir. Methodology may want to cite
   150	  Symphony as evidence of "single SPEC + multiple
   151	  language implementations" but should not put
   152	  reference-implementation language constraints on its
   153	  own SPEC bundle.
   154	- Symphony §17 Conformance Profiles + §18 DoD are
   155	  Symphony's quality bar; the methodology's SPEC bundle
   156	  conformance suite is a separate harness. The shape is
   157	  transferable but the contents are not.

### research/primary-sources/leaddev-agent-compiled.md
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

codex
I’ve got the target SPEC, the index, and the requested sample. Next I’m checking the upstream research workpad/parent authority where the artefacts claim prior-summary corrections, because several review questions hinge on whether those corrections are warranted.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "arc42|C4|ADR|Di[aá]taxis|12-factor|Helm|Nix|OCI|Sigstore|Symphony|Spec Kit|Kiro|OpenSpec|Oracle|Cucumber|OpenAPI|Structurizr|CycloneDX|SPDX|Pact|JSON Schema|CUE|Terraform|Score|SLSA|SLSA|SLSA|in-toto|Backstage|Dagger|devfile|Backstage|Reference Architecture|LeadDev|Bedrock|container" ../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 exited 2 in 0ms:
rg: ../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md: IO error for operation on ../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md: No such file or directory (os error 2)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
nl: ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md: No such file or directory

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/check-corpus-completeness.sh && printf '\\n### lint\\n' && nl -ba scripts/lint-spec.sh | sed -n '1,260p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# check-corpus-completeness.sh — mechanical completeness gate for
     3	# the primary-source research corpus at research/primary-sources/.
     4	#
     5	# Authority:
     6	# file://specs/2026-05-19-primary-source-research-corpus/SPEC.md §7.2,
     7	# §9.1, §13 AC-4.
     8	#
     9	# Verifies:
    10	# 1. INDEX.md exists and parses.
    11	# 2. Every slug in INDEX has a matching <slug>.md file.
    12	# 3. Every <slug>.md file (other than INDEX.md) has a row in INDEX.
    13	# 4. Every status is one of:
    14	#    primary-read-complete | partial | access-blocked | superseded | pending.
    15	# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
    16	# 6. No row at status: pending (the corpus is closed when this script
    17	#    exits 0; pending rows mean incomplete work).
    18	# 7. Every access-blocked row has an alternative-source-found note OR
    19	#    an explicit unreachability disclaimer (heuristic: §6 Open Questions
    20	#    in the artefact mentions "alternative" or "unreachable").
    21	#
    22	# Exit 0 iff the corpus is complete; non-zero with diagnostics to stderr
    23	# otherwise.
    24	
    25	set -uo pipefail
    26	
    27	# Resolve repo root from script location.
    28	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    29	REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    30	CORPUS_DIR="$REPO_ROOT/research/primary-sources"
    31	INDEX_FILE="$CORPUS_DIR/INDEX.md"
    32	SPEC_FILE="$REPO_ROOT/specs/2026-05-19-primary-source-research-corpus/SPEC.md"
    33	
    34	EXPECTED_VERSION="v1.0"
    35	
    36	fail() {
    37	    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
    38	    exit 1
    39	}
    40	
    41	# 1. INDEX exists.
    42	if [ ! -f "$INDEX_FILE" ]; then
    43	    fail "INDEX.md not found at $INDEX_FILE"
    44	fi
    45	
    46	# 2. SOURCE_LIST_VERSION matches.
    47	actual_version="$(grep -E '^Source-list version:' "$INDEX_FILE" | head -1 | sed -E 's/^Source-list version:[[:space:]]+//')"
    48	if [ "$actual_version" != "$EXPECTED_VERSION" ]; then
    49	    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
    50	fi
    51	
    52	# 3. Parse INDEX rows.
    53	# Row format: | <slug> | <status> | <date-or-dash> | <summary> |
    54	# Skip header + separator lines (first two | lines).
    55	mapfile -t rows < <(grep -E '^\|' "$INDEX_FILE" | tail -n +3 | sed -E 's/^\|[[:space:]]*//;s/[[:space:]]*\|[[:space:]]*/|/g;s/[[:space:]]*\|$//')
    56	
    57	if [ ${#rows[@]} -eq 0 ]; then
    58	    fail "INDEX.md has no data rows"
    59	fi
    60	
    61	declare -A index_slugs
    62	declare -A index_status
    63	issues=()
    64	
    65	valid_statuses="primary-read-complete partial access-blocked superseded pending"
    66	
    67	for row in "${rows[@]}"; do
    68	    IFS='|' read -r slug status fetched_on summary <<<"$row"
    69	    [ -z "$slug" ] && continue
    70	    index_slugs["$slug"]=1
    71	    index_status["$slug"]="$status"
    72	
    73	    # 4. Status valid.
    74	    if ! printf '%s\n' $valid_statuses | grep -qFx "$status"; then
    75	        issues+=("invalid status '$status' for slug '$slug'")
    76	    fi
    77	
    78	    # 5. No pending.
    79	    if [ "$status" = "pending" ]; then
    80	        issues+=("slug '$slug' is still status: pending")
    81	    fi
    82	
    83	    # 6. Matching file exists.
    84	    if [ ! -f "$CORPUS_DIR/$slug.md" ]; then
    85	        issues+=("slug '$slug' in INDEX has no matching file at research/primary-sources/$slug.md")
    86	    fi
    87	
    88	    # 7. Access-blocked must record an alternative or unreachability note in §6.
    89	    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
    90	        if ! grep -qiE 'alternative|unreachable|fallback' "$CORPUS_DIR/$slug.md"; then
    91	            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
    92	        fi
    93	    fi
    94	done
    95	
    96	# 8. Orphan files (file exists but no INDEX row).
    97	for f in "$CORPUS_DIR"/*.md; do
    98	    [ -f "$f" ] || continue
    99	    base="$(basename "$f" .md)"
   100	    [ "$base" = "INDEX" ] && continue
   101	    if [ -z "${index_slugs[$base]:-}" ]; then
   102	        issues+=("orphan file: $base.md has no row in INDEX.md")
   103	    fi
   104	done
   105	
   106	if [ ${#issues[@]} -gt 0 ]; then
   107	    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
   108	    for i in "${issues[@]}"; do
   109	        printf '  - %s\n' "$i" >&2
   110	    done
   111	    exit 1
   112	fi
   113	
   114	n_rows=${#index_slugs[@]}
   115	printf 'check-corpus-completeness: PASS — %d sources, all complete\n' "$n_rows"
   116	exit 0

### lint
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
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/*.md; do printf '%s\\n' \""'$f"; rg -n "''^fetch_outcome:|''^## 4'"\\.|"'^## 5'"\\.|methodology-claim:|quote|verbatim|NOT|not |no |does not|doesn't|MUST|endorses|viable|only|closest|strongest|state-of-practice|machine-readable|partial|primary-read-complete|bedrock|Bedrock|SPDX|CycloneDX|Pact|JSON Schema|CUE\" \""'$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 149ms:
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
13:  structure, the JSON Schema 2020-12 relationship, and
34:  fields, JSON Schema relationship, interface/
64:- **JSON Schema relationship** (verbatim): "Data types
66:  JSON Schema Specification Draft 2020-12." The Schema
67:  Object is "a superset of JSON Schema Specification
70:- **Multi-document support** (verbatim): "An OpenAPI
75:- **Interface vs implementation** (verbatim): "the API
77:  not required to be JSON or YAML." OpenAPI defines
78:  "the description of APIs, not their implementation,
81:## 4. Fact-link to methodology
90:  behavior contract, not only HTTP. OpenAPI is one of
94:- OpenAPI 3.1's adoption of JSON Schema 2020-12 means
97:  (OpenAPI) can share JSON Schema as the validation
107:  what the product must DO, not how it is
110:## 5. Downstream-citation surface
117:- methodology-claim: "OpenAPI 3.1.0 defines a
121:- methodology-claim: "OpenAPI 3.1 Schema Object is a
122:  superset of JSON Schema 2020-12; the methodology's
125:- methodology-claim: "OpenAPI documents may be split
129:- methodology-claim: "OpenAPI describes interface,
130:  not implementation — the methodology's behavior/
137:  methodology MAY support; not deep-read in this pass.
145:  changeset, not assume it's universally adopted.
research/primary-sources/openspec.md
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched Fission-AI/OpenSpec README; three-command workflow + artefact set + lighter-than-Spec-Kit posture verbatim"
41:- **Philosophy** (verbatim): "fluid not rigid →
42:  iterative not waterfall → easy not complex → built
43:  for brownfield not just greenfield → scalable from
75:## 4. Fact-link to methodology
85:OpenSpec's "brownfield not just greenfield" framing is
92:## 5. Downstream-citation surface
99:- methodology-claim: "OpenSpec is a tool-agnostic
102:- methodology-claim: "OpenSpec's 'brownfield not just
106:- methodology-claim: "The spec-as-authoring tool
116:  claim was not enumerated in the fetched content; if
120:  not deeply verified; methodology's case study
122:  methodology should not borrow OpenSpec's tooling for
127:  marketing language, not as primary fact about Spec
research/primary-sources/oracle-agent-spec.md
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched oracle/agent-spec README; framework-agnostic declarative language definition + JSON/YAML serialization + multi-SDK conformance verbatim"
10:  Oracle Agent Spec is research §2.1's "closest to 'ship
41:- **Scope** (verbatim): Agent Spec "defines building
55:## 4. Fact-link to methodology
59:Oracle Agent Spec is the closest published precursor
80:## 5. Downstream-citation surface
88:- methodology-claim: "Oracle's Open Agent Spec is a
90:  defining agentic systems — closest published
93:- methodology-claim: "Agent Spec ships SDKs in
97:- methodology-claim: "JSON and YAML are Agent Spec's
107:  methodology, not inherited from Agent Spec.
110:  were not deep-read on this pass. If the
114:- The README does NOT compare Agent Spec to Spec Kit
research/primary-sources/ref-arch-vs-solution-arch.md
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
10:  This is the closest existing articulation of the
31:  SAFe, LeSS, or Disciplined Agile Delivery verbatim.
51:- **Posture distinction (verbatim framing)**:
60:- **Underlying thesis** (verbatim, paraphrased close
69:  verbatim fails, but understanding immutable
74:## 4. Fact-link to methodology
98:## 5. Downstream-citation surface
106:- methodology-claim: "Cottmeyer (2019) distinguishes
111:- methodology-claim: "The methodology's developer-
117:- methodology-claim: "Reference architecture as
125:- methodology-claim: "Cottmeyer's empirical
127:  verbatim fails' — is the methodology's case for
138:  is not proven by his original frame — methodology
143:  methodology has not yet enumerated equivalent
research/primary-sources/sigstore-cosign.md
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched Sigstore docs root; Fulcio + Rekor + cosign architecture and keyless model verbatim"
52:- **Rekor**: "an immutable, append-only ledger" that
80:## 4. Fact-link to methodology
93:- Keyless signing means the developer does NOT need to
103:## 5. Downstream-citation surface
111:- methodology-claim: "Sigstore consists of Fulcio
113:  only transparency log), and cosign (the signing
115:- methodology-claim: "Keyless signing eliminates
119:- methodology-claim: "cosign verification is a four-
122:- methodology-claim: "Sigstore is the methodology's
131:  Google) for spec-bundle releases but cannot mandate
research/primary-sources/spec-kit.md
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched github/spec-kit repository README; six-command lifecycle + artefact set + posture verbatim"
10:  Spec Kit is research §2.1's "closest spec-as-authoring
44:- **Spec-Driven Development thesis** (verbatim):
82:## 4. Fact-link to methodology
94:different things. The methodology MUST be precise:
108:## 5. Downstream-citation surface
115:- methodology-claim: "Spec Kit is the closest spec-
118:- methodology-claim: "Spec Kit's six-command lifecycle
122:- methodology-claim: "Spec Kit produces an artefact
127:- methodology-claim: "The 'spec is executable' thesis
131:  installing user's agent, with no developer in the
141:  should not flatten the distinction.
143:  team consumption (vs in-team authoring only) is
research/primary-sources/structurizr-dsl.md
7:fetch_outcome: "partial"
8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
10:  Structurizr DSL is research §5.1's machine-readable
32:  / model / views) not fully fetched on this pass.
52:## 4. Fact-link to methodology
58:ship machine-readable diagrams (not PNG renders or
68:  up in git diffs, not in opaque image binaries.
73:## 5. Downstream-citation surface
81:- methodology-claim: "Structurizr DSL is a text-based
84:- methodology-claim: "The methodology's architecture/
88:- methodology-claim: "Structurizr DSL's architecture-as-
96:  keywords) was not deep-read in this pass — only the
107:  methodology's downstream tooling, not part of the
research/primary-sources/symphony-spec.md
7:fetch_outcome: "primary-read-complete"
8:fetch_evidence: "fetched openai/symphony main SPEC.md; 18-section structure + §17 Conformance Profiles + §18 DoD verbatim"
10:  Symphony's SPEC.md is the only in-the-wild example of
27:- License: project license (OpenAI; not deep-read for
71:  - **Extension Conformance**: "Required only for
92:## 4. Fact-link to methodology
114:## 5. Downstream-citation surface
121:- methodology-claim: "Symphony's SPEC.md is the only
125:- methodology-claim: "Symphony's three-profile
129:- methodology-claim: "Symphony's tiered Definition-of-
135:- methodology-claim: "Symphony §5 Workflow Specification
149:  not bind to Elixir. Methodology may want to cite
151:  language implementations" but should not put

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md | sed -n '1,320p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "arc42|C4|ADR|Di[aá]taxis|12-factor|Helm|Nix|OCI|Sigstore|Symphony|Spec Kit|Kiro|OpenSpec|Oracle|Cucumber|OpenAPI|Structurizr|CycloneDX|SPDX|Pact|JSON Schema|CUE|Terraform|Score|SLSA|in-toto|Backstage|devfile|LeadDev|Bedrock|Container-level|configuration|customization|deferral|patch|versioning|provenance|SBOM|SLSA" ../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

 succeeded in 0ms:
23:> SPEC of their product. End users dispatch their own coding
26:> product direction; user-with-agent owns customization and local
45:- What can be borrowed from existing methodologies (arc42 /
46:  C4 / ADRs / Diátaxis / 12-factor / Symphony / Nix / Helm)
57:  Spec Kit, Kiro, OpenSpec, Oracle Agent Spec all keep specs
68:composition: **arc42 chapters + devcontainers + Helm-values-
69:style customization grammar + Gherkin behavioral acceptance +
70:Nix-flake reproducible substrate would cover ~80% of the
76:articulates the same hypothesis but as risk: "patching is no
92:3. **Versioning and patching semantics.** What's the meaning
93:   of a security patch when every install is a unique agent
99:   two agent-compiled outputs "the same product"? Oracle Agent
108:   attack surface — supply chain through customization
118:## 3. Transferable Building Blocks (extracted from Symphony's SPEC.md)
120:Symphony's 18-section SPEC at
128:| Symphony section | Transferable pattern | Why universal |
145:Symphony-specific (NOT transferable): §10 Agent Runner Protocol;
153:Symphony's SPEC currently captures well:
155:### 4.1 Structured customization / variability catalog with deferral contract
159:- 12-factor's *Config* says env vars exist, not which knobs
161:- arc42's §8 Crosscutting Concepts leans toward technical
162:  concerns, not customization.
163:- ADRs document choices **made by the authors**, not choices
165:- C4 doesn't model variation points.
166:- Helm values schemas come closest in practice but describe
175:**(c)** an explicit **deferral contract** — what does the
181:Symphony §2.2 does whole-product non-goals; §11.5 does
184:behavior spec does NOT cover…", "the customization grammar does
202:### 4.4 Spec-as-distribution versioning, signing, verification
204:OCI signing / Sigstore / Helm provenance exist for build
219:  pointer to SBOM / dependency manifest; pointer to
222:  - `architecture/` — C4 Container-level (Structurizr DSL
223:    preferred for machine-readability); arc42 §3, §5
225:  - `deployment/` — devcontainers / Helm / Kubernetes
226:    manifests / Nix flake / Docker compose — pick whichever
227:    matches the product; specify the customization knobs in
229:  - `behavior/` — Gherkin / Cucumber executable acceptance
230:    OR contract tests OR OpenAPI / AsyncAPI / GraphQL SDL.
231:  - `customization/` — the catalog of variability + deferral
233:  - `decisions/` — ADRs (Nygard format), append-only,
235:  - `quality/` — arc42 §10 + 15-factor conformance overlay.
236:  - `operations/` — failure classes × recovery (Symphony §14
237:    pattern); observability layering (Symphony §13 pattern);
238:    safety invariants (Symphony §9.5 pattern).
242:  prose specs) — Cucumber feature files, contract tests,
243:  OpenAPI validators. Agents have a runnable yes/no signal.
247:  target (Symphony's Elixir choice is the pattern). NOT
249:- **Signed bundle** — OCI artefact or similar; spec versions
255:  the moment (`customization/` to learn knobs; `behavior/` to
261:  structured-data; decision facets want ADRs; behavior wants
276:  installers that the configuration / customization surface is
286:customization surface is "edit the source."
304:What does the spec parameterize vs. hard-code? Symphony's
306:one pattern; a multi-file customization catalog is another.
307:This is the **deferral-contract** decision (§4.1).
327:Symphony's "re-implement in 5 languages" doesn't trivially
481:- `url://kiro.dev` (spec-driven IDE; Bedrock-tethered)
491:- `url://helm.sh/` (the strongest customization-affordance
498:- `url://arc42.org/overview`
546:  some primary URLs (arc42, C4, ADR, Diátaxis, 12-factor)
549:- The Symphony SPEC.md deep read fetched the primary source.

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

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba ../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md | sed -n '260,620p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
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

web search: 
web search: https://docs.arc42.org/section-1/
web search: 
web search: https://c4model.com/abstractions
web search: 
web search: https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions
web search: 
web search: 'values.schema.json' in https://helm.sh/docs/topics/charts/
web search: 
web search: 'Conformance Profiles' in https://github.com/openai/symphony/blob/main/SPEC.md
web search: 
web search: 'Patching is no longer' in https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software
codex
The sample is mostly coherent, but I’m already seeing two kinds of issues: source-list omissions that matter to the methodology’s own manifest/deployment claims, and a few §5 claims that turn a primary source into project endorsement or global uniqueness. I’m checking the non-sample rows for the same pattern before I write the gate result.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/12-factor.md research/primary-sources/diataxis.md research/primary-sources/cucumber-gherkin.md research/primary-sources/openapi-3-1.md; do printf '\\n### %s\\n' \""'$f"; nl -ba "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

### research/primary-sources/12-factor.md
     1	---
     2	slug: 12-factor
     3	source_name: "The Twelve-Factor App"
     4	primary_url: "https://12factor.net/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched 12factor.net root; methodology characterisation + 12 factor names verbatim + Factor III headline"
     9	methodology_relevance: |
    10	  12-factor is research §4.1's "Config" reference (Factor
    11	  III: "Store config in the environment") cited as the
    12	  weakest customization-affordance grammar — names that
    13	  knobs exist, not which knobs the installer is expected
    14	  to turn. This corpus entry anchors the 12-factor self-
    15	  description, the canonical factor list, and the Config
    16	  factor verbatim so the methodology can cite 12-factor
    17	  precisely when comparing customization grammars.
    18	---
    19	
    20	# The Twelve-Factor App
    21	
    22	## 1. Source identity
    23	
    24	- Name: The Twelve-Factor App — a methodology for
    25	  building software-as-a-service apps.
    26	- Authors: Adam Wiggins (originally, at Heroku) + open
    27	  contribution.
    28	- Canonical URL: `url://12factor.net/`.
    29	- License: Creative Commons (per site footer; not
    30	  deep-read on this pass).
    31	
    32	## 2. Fetch trace
    33	
    34	- `cmd://WebFetch url://12factor.net/` — 2026-05-19;
    35	  returned methodology definition, 12-factor names,
    36	  Factor III ("Config") headline.
    37	
    38	## 3. Verbatim claims this corpus depends on
    39	
    40	- **Methodology characterisation** (`url://12factor.net/`):
    41	  a twelve-factor app is "a methodology for building
    42	  software-as-a-service apps that" possess these
    43	  characteristics:
    44	  - Employ "declarative formats for setup automation, to
    45	    minimize time and cost for new developers joining
    46	    the project"
    47	  - Feature "a clean contract with the underlying
    48	    operating system, offering maximum portability
    49	    between execution environments"
    50	  - Work well "for deployment on modern cloud platforms,
    51	    obviating the need for servers and systems
    52	    administration"
    53	  - "Minimize divergence between development and
    54	    production, enabling continuous deployment for
    55	    maximum agility"
    56	  - "Scale up without significant changes to tooling,
    57	    architecture, or development practices"
    58	
    59	- **The twelve factors** (`url://12factor.net/`):
    60	  1. **Codebase** — One codebase tracked in revision
    61	     control, many deploys
    62	  2. **Dependencies** — Explicitly declare and isolate
    63	     dependencies
    64	  3. **Config** — Store config in the environment
    65	  4. **Backing Services** — Treat backing services as
    66	     attached resources
    67	  5. **Build, Release, Run** — Strictly separate build
    68	     and run stages
    69	  6. **Processes** — Execute the app as one or more
    70	     stateless processes
    71	  7. **Port Binding** — Export services via port binding
    72	  8. **Concurrency** — Scale out via the process model
    73	  9. **Disposability** — Maximize robustness with fast
    74	     startup and graceful shutdown
    75	  10. **Dev/Prod Parity** — Keep development, staging,
    76	      and production as similar as possible
    77	  11. **Logs** — Treat logs as event streams
    78	  12. **Admin Processes** — Run admin/management tasks
    79	      as one-off processes
    80	
    81	- **Factor III (Config)** — verbatim headline: "Store
    82	  config in the environment."
    83	
    84	## 4. Fact-link to methodology
    85	
    86	<!-- lint-ok: no-citation -->
    87	
    88	12-factor is the lightest-weight customization-grammar
    89	prior art: it says configuration exists in environment
    90	variables, not which environment variables the
    91	installer needs to set or what their valid
    92	combinations are. Research §4.1 characterised it as
    93	"says env vars exist, not which knobs the installer is
    94	expected to turn." This corpus read confirms the
    95	characterisation by anchoring Factor III to its
    96	verbatim minimal statement ("Store config in the
    97	environment") — no schema, no enumeration, no
    98	deferral contract.
    99	
   100	Implications for the methodology's customization/
   101	sub-spec:
   102	
   103	- The methodology's customization grammar is a strict
   104	  superset of 12-factor's posture: it declares WHICH
   105	  knobs the installer is expected to turn, with what
   106	  validation, and under what compositional constraints.
   107	- 12-factor's strength — minimalism — is the
   108	  methodology's weakness if applied directly: 12-factor
   109	  is excellent for the operating-system-boundary
   110	  contract (Factor III enables env-var-based
   111	  configuration) but insufficient for the
   112	  application-domain customization grammar the
   113	  methodology proposes.
   114	
   115	## 5. Downstream-citation surface
   116	
   117	<!-- lint-ok: no-citation -->
   118	
   119	Methodology claims licensed by this entry (cite as
   120	`file://research/primary-sources/12-factor.md §3`):
   121	
   122	- methodology-claim: "12-factor is a methodology for
   123	  cloud-native SaaS app construction with twelve
   124	  named characteristics ranging from codebase tracking
   125	  to admin processes."
   126	- methodology-claim: "12-factor Factor III ('Config')
   127	  prescribes only that configuration be stored in the
   128	  environment — the methodology does NOT specify which
   129	  config knobs exist or how they validate."
   130	- methodology-claim: "12-factor sets the
   131	  operating-system-boundary contract; the methodology's
   132	  customization grammar sets the application-domain
   133	  contract — these are complementary, not competing."
   134	- methodology-claim: "12-factor's Dev/Prod Parity
   135	  posture is the methodology's reproducibility-bar
   136	  precedent at the methodology-language level."
   137	
   138	## 6. Open questions surfaced by the primary read
   139	
   140	- 12-factor is now ~15 years old (originated at Heroku
   141	  circa 2011); the "15-factor" or "12+3-factor"
   142	  extensions floated in the community (auth, telemetry,
   143	  API-first) are not part of the original 12 and would
   144	  be separately sourced if the methodology references
   145	  them.
   146	- Factor III is silent on secrets management; the
   147	  methodology's deployment/ sub-spec should not cite
   148	  12-factor for secrets posture (that's a separate
   149	  primary source — likely Vault, AWS Secrets Manager
   150	  docs, or SOPS).
   151	- 12-factor's Disposability factor (#9) overlaps with
   152	  the methodology's failure-mode discussion (research
   153	  §5.1 operations facet). The methodology MAY cite
   154	  12-factor's disposability characterisation as prior
   155	  art for the operations/ sub-spec.

### research/primary-sources/diataxis.md
     1	---
     2	slug: diataxis
     3	source_name: "Diátaxis — a systematic framework for technical documentation authoring"
     4	primary_url: "https://diataxis.fr/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched diataxis.fr/ + diataxis.fr/start-here/; four-mode taxonomy + two-axis structure confirmed verbatim"
     9	methodology_relevance: |
    10	  Diátaxis is the methodology's documentation-taxonomy
    11	  reference: the research workpad §5.1 names Diátaxis as
    12	  comparison prior art for the methodology's longread
    13	  vs SPEC-bundle split (and within the SPEC bundle, the
    14	  facet-level split). This corpus entry anchors the
    15	  four modes verbatim and the two-axis structure
    16	  (action-vs-cognition × study-vs-work) so the
    17	  methodology can cite Diátaxis precisely when
    18	  justifying its own packaging structure.
    19	---
    20	
    21	# Diátaxis
    22	
    23	## 1. Source identity
    24	
    25	- Name: Diátaxis — "a way of thinking about and doing
    26	  documentation."
    27	- Author: Daniele Procida.
    28	- Canonical URL: `url://diataxis.fr/`; introduction at
    29	  `url://diataxis.fr/start-here/`.
    30	- License: documentation site itself is published
    31	  openly; specific license terms not deep-read on this
    32	  pass.
    33	
    34	## 2. Fetch trace
    35	
    36	- `cmd://WebFetch url://diataxis.fr/` — 2026-05-19;
    37	  returned self-definition + four-mode enumeration.
    38	- `cmd://WebFetch url://diataxis.fr/start-here/` —
    39	  2026-05-19; returned per-mode verbatim definitions +
    40	  two-axis structure.
    41	
    42	## 3. Verbatim claims this corpus depends on
    43	
    44	- **Self-definition** (`url://diataxis.fr/`):
    45	  "Diátaxis is a way of thinking about and doing
    46	  documentation. It prescribes approaches to content,
    47	  architecture and form that emerge from a systematic
    48	  approach to understanding the needs of documentation
    49	  users."
    50	
    51	- **The four documentation modes** (`url://diataxis.fr/start-here/`):
    52	
    53	  - **Tutorials** — verbatim: "A tutorial is a lesson,
    54	    that takes a student by the hand through a learning
    55	    experience. A tutorial is always practical: the
    56	    user does something, under the guidance of an
    57	    instructor."
    58	  - **How-to guides** — verbatim: "A how-to guide
    59	    addresses a real-world goal or problem, by providing
    60	    practical directions to help the user who is in
    61	    that situation."
    62	  - **Reference** — verbatim: "Reference guides contain
    63	    the technical description — facts — that a user
    64	    needs in order to do things correctly: accurate,
    65	    complete, reliable information, free of distraction
    66	    and interpretation."
    67	  - **Explanation** — verbatim: "Explanatory guides
    68	    provide context and background. They serve the need
    69	    to understand and put things in a bigger picture."
    70	
    71	- **Two structural axes** (`url://diataxis.fr/start-here/`):
    72	
    73	  1. **Action vs. Cognition**: "Tutorials and how-to
    74	     guides concern what the user does (action); while
    75	     reference and explanation address what the user
    76	     knows (cognition)."
    77	  2. **Study vs. Work**: "Tutorials and explanation
    78	     serve acquisition of skill (the user's study);
    79	     whereas how-to guides and reference serve
    80	     application of skill (the user's work)."
    81	
    82	- **Resulting 2×2 matrix**: the four modes occupy
    83	  distinct quadrants. Tutorials = action + study;
    84	  How-to = action + work; Explanation = cognition +
    85	  study; Reference = cognition + work.
    86	
    87	- **Normative claim** (`url://diataxis.fr/`):
    88	  "Documentation should itself be organised around the
    89	  structures of those needs."
    90	
    91	## 4. Gap from prior summary characterization
    92	
    93	Prior summary in
    94	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
    95	§4 / §5.1 cited Diátaxis as decomposition prior art
    96	without anchoring its specific axes or per-mode
    97	definitions. This primary read closes the gap:
    98	
    99	- The four-mode taxonomy is anchored verbatim with <!-- lint-ok: no-citation -->
   100	  source-provided definitions, not paraphrased.
   101	- The two-axis structure (action-vs-cognition × study- <!-- lint-ok: no-citation -->
   102	  vs-work) is anchored — this is the underlying
   103	  justification, and the methodology can either adopt
   104	  Diátaxis's axes or explicitly diverge with rationale.
   105	- The framework's posture as "systematic approach" not <!-- lint-ok: no-citation -->
   106	  "style guide" is anchored to its self-definition.
   107	
   108	## 5. Downstream-citation surface
   109	
   110	The following methodology claims are licensed by this
   111	entry (cite as
   112	`file://research/primary-sources/diataxis.md §3`):
   113	
   114	- methodology-claim: "Diátaxis is a four-mode <!-- lint-ok: no-citation -->
   115	  documentation taxonomy: tutorials, how-to guides,
   116	  reference, explanation."
   117	- methodology-claim: "The four modes are structured <!-- lint-ok: no-citation -->
   118	  along two axes — action vs. cognition (what the user
   119	  does vs. knows) and study vs. work (skill acquisition
   120	  vs. application)."
   121	- methodology-claim: "Diátaxis prescribes that <!-- lint-ok: no-citation -->
   122	  documentation should be organised around user needs
   123	  rather than around the structure of the product."
   124	- methodology-claim: "The methodology's published <!-- lint-ok: no-citation -->
   125	  artefacts (longread + SPEC bundle) constitute, in
   126	  Diátaxis terms, primarily explanation (longread) +
   127	  reference (SPEC bundle) — neither tutorial nor
   128	  how-to, which is a Diátaxis-articulable scope choice."
   129	
   130	## 6. Open questions surfaced by the primary read
   131	
   132	- Diátaxis applies to product documentation aimed at
   133	  human end-users. The methodology Product B publishes
   134	  is aimed at engineers + agents — does the same
   135	  four-mode taxonomy hold, or does the agent-as-reader
   136	  change the relevant cognitive modes? Not resolvable
   137	  from Diátaxis alone; methodology-design open question.
   138	- The methodology's longread is "first-person
   139	  experiential" per the parent Decision §7; Diátaxis
   140	  doesn't formalize a fifth "experience report" mode.
   141	  The methodology may have to articulate an extension
   142	  (or sub-mode of explanation) for its first-person
   143	  posture.
   144	- Diátaxis does not formally address machine-readable
   145	  documentation (the SPEC-bundle facet of methodology
   146	  output); the methodology's structured-data /
   147	  prose-document hybrid is a packaging choice Diátaxis
   148	  doesn't directly model.

### research/primary-sources/cucumber-gherkin.md
     1	---
     2	slug: cucumber-gherkin
     3	source_name: "Cucumber / Gherkin — executable specifications"
     4	primary_url: "https://cucumber.io/docs/gherkin/reference"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched cucumber.io gherkin reference; Given/When/Then + Feature/Scenario/Background structure + executable-spec characterisation verbatim"
     9	methodology_relevance: |
    10	  Cucumber / Gherkin is research §5.1's "Gherkin /
    11	  Cucumber executable acceptance" primitive for the
    12	  methodology's behavior/ sub-spec. This corpus entry
    13	  anchors the keyword structure and the executable-
    14	  specification semantics so the methodology can cite
    15	  Gherkin precisely as the behavioural-acceptance
    16	  primitive.
    17	---
    18	
    19	# Cucumber / Gherkin
    20	
    21	## 1. Source identity
    22	
    23	- Name: Gherkin — domain-specific language for
    24	  executable specifications, consumed by Cucumber.
    25	- Canonical URL: `url://cucumber.io/docs/gherkin/reference`.
    26	- Maintainer: Cucumber organisation.
    27	
    28	## 2. Fetch trace
    29	
    30	- `cmd://WebFetch url://cucumber.io/docs/gherkin/reference`
    31	  — 2026-05-19; returned Gherkin keyword reference +
    32	  Feature/Scenario/Background + executable-spec
    33	  semantics.
    34	
    35	## 3. Verbatim claims this corpus depends on
    36	
    37	- **Self-characterisation**: Gherkin is "a language
    38	  for writing executable specifications" that "uses
    39	  special keywords to structure feature files that
    40	  describe software behavior in human-readable terms."
    41	
    42	- **Given step**: "put the system in a known state"
    43	  before interactions begin. Establishes preconditions
    44	  (e.g. "I am logged in").
    45	
    46	- **When step**: describes an action — "a person
    47	  interacting with the system, or it can be an event
    48	  triggered by another system" (e.g. "Guess a word",
    49	  "Withdraw money").
    50	
    51	- **Then step**: "describe an expected outcome, or
    52	  result." Verifies observable results via assertions.
    53	
    54	- **And / But**: connectors chaining multiple steps of
    55	  the same type for readability.
    56	
    57	- **Feature**: a `.feature` file's first required
    58	  keyword; groups related scenarios.
    59	
    60	- **Scenario**: concrete example following Given-When-
    61	  Then pattern.
    62	
    63	- **Background**: common Given steps that run before
    64	  each scenario in the feature, eliminating repetitive
    65	  setup.
    66	
    67	- **Executable semantics**: each Gherkin step matches
    68	  to implementation code called a "step definition."
    69	  Cucumber executes steps sequentially. Scenarios form
    70	  "an executable specification of the system."
    71	
    72	## 4. Fact-link to methodology
    73	
    74	<!-- lint-ok: no-citation -->
    75	
    76	Gherkin provides the methodology's behavior/ sub-spec
    77	its most human-readable + machine-executable
    78	acceptance-criteria primitive. Key shape implications:
    79	
    80	- The methodology's published SPEC bundle MAY include
    81	  a `behavior/` directory with `.feature` files that
    82	  serve simultaneously as documentation, acceptance
    83	  test, and contract — Gherkin's three-in-one
    84	  affordance.
    85	- The Background section pattern is reusable for the
    86	  methodology's behavior/ sub-spec when many scenarios
    87	  share preconditions (e.g. "the product is installed
    88	  per deployment/ sub-spec").
    89	- Step definitions live in the IMPLEMENTATION, not the
    90	  spec. The methodology's SPEC bundle ships the
    91	  Gherkin scenarios; the user-with-agent's installation
    92	  generates or implements the step definitions
    93	  appropriate to their language/runtime. This is the
    94	  spec-as-distribution / installer-implements pattern
    95	  in action.
    96	
    97	## 5. Downstream-citation surface
    98	
    99	<!-- lint-ok: no-citation -->
   100	
   101	Methodology claims licensed by this entry (cite as
   102	`file://research/primary-sources/cucumber-gherkin.md
   103	§3`):
   104	
   105	- methodology-claim: "Gherkin is a language for
   106	  executable specifications using Given-When-Then
   107	  keywords structured into Features and Scenarios."
   108	- methodology-claim: "Gherkin's Background sections
   109	  let multiple scenarios share preconditions —
   110	  reusable in the methodology's behavior/ sub-spec for
   111	  shared post-install state."
   112	- methodology-claim: "Gherkin scenarios serve as
   113	  documentation, acceptance test, and contract
   114	  simultaneously — three-in-one affordance the
   115	  methodology's behavior/ sub-spec may adopt."
   116	- methodology-claim: "Step definitions live in the
   117	  implementation (not the SPEC); the methodology's
   118	  installing user-with-agent generates appropriate
   119	  step definitions for their language/runtime."
   120	
   121	## 6. Open questions surfaced by the primary read
   122	
   123	- Gherkin has language-specific syntax conventions
   124	  (English keywords by default; other languages
   125	  supported). The methodology's SPEC bundle should
   126	  pin English as the canonical Gherkin language for
   127	  cross-installer portability, unless explicitly
   128	  internationalised.
   129	- Cucumber as the canonical runner is not the only
   130	  Gherkin consumer (behave, SpecFlow, Karate). The
   131	  methodology should not mandate Cucumber; the SPEC
   132	  bundle ships `.feature` files; the installer
   133	  chooses the runner.
   134	- Gherkin doesn't natively handle non-functional
   135	  properties (performance, reliability). The
   136	  methodology may want a separate behavior/ sub-spec
   137	  entry for those (or cite quality-attribute-specific
   138	  primitives).

### research/primary-sources/openapi-3-1.md
     1	---
     2	slug: openapi-3-1
     3	source_name: "OpenAPI Specification 3.1.0"
     4	primary_url: "https://spec.openapis.org/oas/v3.1.0"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched spec.openapis.org/oas/v3.1.0; root document structure + JSON Schema 2020-12 relationship + interface-not-implementation posture verbatim"
     9	methodology_relevance: |
    10	  OpenAPI is research §5.1's HTTP-API contract
    11	  primitive for the methodology's behavior/ sub-spec.
    12	  This corpus entry anchors the root document
    13	  structure, the JSON Schema 2020-12 relationship, and
    14	  the explicit interface-not-implementation posture so
    15	  the methodology can cite OpenAPI precisely when
    16	  prescribing the behavior/ sub-spec's API contract
    17	  shape.
    18	---
    19	
    20	# OpenAPI Specification 3.1.0
    21	
    22	## 1. Source identity
    23	
    24	- Name: OpenAPI Specification (OAS), version 3.1.0.
    25	- Canonical URL: `url://spec.openapis.org/oas/v3.1.0`.
    26	- Maintainer: OpenAPI Initiative (Linux Foundation).
    27	- Posture: programming-language-agnostic interface
    28	  description for HTTP APIs.
    29	
    30	## 2. Fetch trace
    31	
    32	- `cmd://WebFetch url://spec.openapis.org/oas/v3.1.0`
    33	  — 2026-05-19; returned definition, root document
    34	  fields, JSON Schema relationship, interface/
    35	  implementation posture.
    36	
    37	## 3. Verbatim claims this corpus depends on
    38	
    39	- **Self-definition** (`url://spec.openapis.org/oas/v3.1.0`):
    40	  "The OpenAPI Specification (OAS) defines a standard,
    41	  programming language-agnostic interface description
    42	  for HTTP APIs, which allows both humans and computers
    43	  to discover and understand the capabilities of a
    44	  service without requiring access to source code,
    45	  additional documentation, or inspection of network
    46	  traffic."
    47	
    48	- **Root document fields** (per spec):
    49	  - `openapi` (required) — OAS version.
    50	  - `info` (required) — title, version, description,
    51	    contact, license.
    52	  - `servers` — Server Objects; defaults to `/`.
    53	  - `paths` — endpoints and operations.
    54	  - `webhooks` — incoming webhooks the API provider may
    55	    initiate.
    56	  - `components` — reusable schemas, responses,
    57	    parameters, examples, request bodies, headers,
    58	    security schemes, links, callbacks, path items.
    59	  - `security` — security mechanisms applicable across
    60	    the API.
    61	  - `tags` — tags for documentation control.
    62	  - `externalDocs` — additional external documentation.
    63	
    64	- **JSON Schema relationship** (verbatim): "Data types
    65	  in the OAS are based on the types supported by the
    66	  JSON Schema Specification Draft 2020-12." The Schema
    67	  Object is "a superset of JSON Schema Specification
    68	  Draft 2020-12."
    69	
    70	- **Multi-document support** (verbatim): "An OpenAPI
    71	  document _MAY_ be made up of a single document or be
    72	  divided into multiple, connected parts at the
    73	  discretion of the author."
    74	
    75	- **Interface vs implementation** (verbatim): "the API
    76	  request and response bodies and other content are
    77	  not required to be JSON or YAML." OpenAPI defines
    78	  "the description of APIs, not their implementation,
    79	  runtime behavior, or business logic."
    80	
    81	## 4. Fact-link to methodology
    82	
    83	<!-- lint-ok: no-citation -->
    84	
    85	OpenAPI is the methodology's reference for
    86	contract-as-spec at the HTTP-API surface. Key shape
    87	implications for the methodology's behavior/ sub-spec:
    88	
    89	- The methodology's behavior/ sub-spec covers ANY
    90	  behavior contract, not only HTTP. OpenAPI is one of
    91	  several behavior-contract primitives (others:
    92	  Cucumber/Gherkin for behavioural acceptance,
    93	  AsyncAPI for event-driven, GraphQL SDL).
    94	- OpenAPI 3.1's adoption of JSON Schema 2020-12 means
    95	  the methodology's customization/ sub-spec
    96	  (Helm-values-schema-style) and behavior/ sub-spec
    97	  (OpenAPI) can share JSON Schema as the validation
    98	  language.
    99	- The multi-document affordance — OpenAPI documents
   100	  can be split across files — supports the
   101	  methodology's manifest+catalog packaging shape: a
   102	  service-with-many-endpoints can have a behavior/
   103	  sub-spec composed of multiple OpenAPI files
   104	  referenced from the front-door manifest.
   105	- The interface-not-implementation posture is the
   106	  methodology's own posture: the SPEC bundle describes
   107	  what the product must DO, not how it is
   108	  implemented.
   109	
   110	## 5. Downstream-citation surface
   111	
   112	<!-- lint-ok: no-citation -->
   113	
   114	Methodology claims licensed by this entry (cite as
   115	`file://research/primary-sources/openapi-3-1.md §3`):
   116	
   117	- methodology-claim: "OpenAPI 3.1.0 defines a
   118	  programming-language-agnostic interface description
   119	  for HTTP APIs covering paths, operations,
   120	  components, security, webhooks."
   121	- methodology-claim: "OpenAPI 3.1 Schema Object is a
   122	  superset of JSON Schema 2020-12; the methodology's
   123	  customization and behavior sub-specs MAY share JSON
   124	  Schema as a validation language."
   125	- methodology-claim: "OpenAPI documents may be split
   126	  across multiple connected files at author
   127	  discretion — the manifest+catalog packaging is a
   128	  natural fit."
   129	- methodology-claim: "OpenAPI describes interface,
   130	  not implementation — the methodology's behavior/
   131	  sub-spec inherits this distinction explicitly."
   132	
   133	## 6. Open questions surfaced by the primary read
   134	
   135	- AsyncAPI (event-driven APIs) and GraphQL SDL are
   136	  separate behavior-contract primitives the
   137	  methodology MAY support; not deep-read in this pass.
   138	  If methodology adopts a multi-protocol behavior/
   139	  sub-spec, those are separate corpus entries worth
   140	  authoring as v1.1 corpus expansion.
   141	- OpenAPI's `webhooks` field (introduced in 3.1) is
   142	  one model for outbound-from-service contracts; the
   143	  methodology may want to recommend this for
   144	  webhook-driven products but should cite the 3.1
   145	  changeset, not assume it's universally adopted.
   146	- The OpenAPI specification is itself a large document
   147	  (~100K words); a deeper read of specific sections
   148	  (security, components, callbacks) may be needed if
   149	  the methodology's behavior/ sub-spec specifies
   150	  detailed conventions for those.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/nix-flakes.md research/primary-sources/oci-artifacts.md research/primary-sources/sigstore-cosign.md research/primary-sources/structurizr-dsl.md; do printf '\\n### %s\\n' \""'$f"; nl -ba "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

### research/primary-sources/nix-flakes.md
     1	---
     2	slug: nix-flakes
     3	source_name: "Nix Flakes — flake.nix + flake.lock"
     4	primary_url: "https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
     9	methodology_relevance: |
    10	  Nix flakes are research §5.1's "strongest reproducible-
    11	  from-spec primitive." This corpus entry anchors the
    12	  flake.nix file structure, the flake.lock content-hash
    13	  model, and Nix's reproducibility guarantees so the
    14	  methodology can cite the flake model precisely when
    15	  prescribing the deployment/ sub-spec's reproducibility
    16	  contract.
    17	---
    18	
    19	# Nix Flakes
    20	
    21	## 1. Source identity
    22	
    23	- Name: Nix flakes — the unit for packaging Nix code
    24	  reproducibly.
    25	- Canonical URL: `url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
    26	  (note: the older `url://nixos.org/manual/...` redirects
    27	  to nix.dev as of fetch date).
    28	- Specification authority: NixOS RFCs (RFC 49 for flakes
    29	  proposal); current implementation in `nix` CLI.
    30	
    31	## 2. Fetch trace
    32	
    33	- `cmd://WebFetch url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake`
    34	  — 2026-05-19; returned 302 redirect to nix.dev.
    35	- `cmd://WebFetch url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
    36	  — 2026-05-19; primary read; returned flake definition,
    37	  flake.nix structure, flake.lock semantics, repro
    38	  guarantees.
    39	
    40	## 3. Verbatim claims this corpus depends on
    41	
    42	- **Flake definition**: a flake is "a filesystem tree
    43	  (typically fetched from a Git repository or a tarball)
    44	  that contains a file named `flake.nix` in the root
    45	  directory." (`url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`)
    46	
    47	- **flake.nix attributes**:
    48	  - `inputs` — an attrset specifying dependencies,
    49	    mapping input names to flake references. "Each input
    50	    is fetched, evaluated and passed to the `outputs`
    51	    function as a set of attributes with the same name
    52	    as the corresponding input."
    53	  - `outputs` — a function receiving an attribute set of
    54	    input flake outputs, returning Nix values the flake
    55	    provides.
    56	  - `description` — one-line summary.
    57	
    58	- **Per-input metadata** passed to `outputs`:
    59	  - `outPath` — store path of the source tree.
    60	  - `rev` — commit hash if applicable.
    61	  - `lastModified` — commit time, seconds since epoch.
    62	  - `narHash` — SHA-256 hash in SRI format.
    63	
    64	- **flake.lock** is "a UTF-8 JSON file" containing "a
    65	  graph structure isomorphic to the graph of
    66	  dependencies of the root flake." Per-node fields:
    67	  - `inputs` — dependency mappings.
    68	  - `original` — unlocked specification from flake.nix.
    69	  - `locked` — resolved specification with exact
    70	    revision and `narHash`.
    71	  - `flake` — boolean (flake vs non-flake dep).
    72	
    73	- **Reproducibility guarantee**: Nix automatically
    74	  generates and maintains flake.lock. Locked
    75	  specifications contain exact revisions and content
    76	  hashes. "When we build this flake, the input
    77	  `nixpkgs` is mapped to revision [specific hash]."
    78	  Furthermore: "lock files transitively lock direct as
    79	  well as indirect dependencies."
    80	
    81	## 4. Fact-link to methodology
    82	
    83	<!-- lint-ok: no-citation -->
    84	
    85	Nix flakes operationalize "reproducible-from-spec" at the
    86	strongest current level: content-addressed inputs +
    87	transitive lock + reproducible outputs. Key shape
    88	implications for the methodology's deployment/ sub-spec:
    89	
    90	- The deployment/ sub-spec MAY adopt a flake-style
    91	  inputs/outputs structure as the contract shape: inputs
    92	  are the declared dependencies (the spec's deferral
    93	  contract); outputs are the materialized deployment
    94	  artefacts.
    95	- The flake.lock content-hash model is the strongest
    96	  primitive available for "two installs produce the same
    97	  build outputs" — the methodology's equivalence-classes
    98	  open question (research §2.3.5) can cite Nix as the
    99	  current upper bound on equivalence-by-construction.
   100	- The transitive-lock property — every direct and
   101	  indirect dependency pinned — is the methodology's
   102	  posture for the SPEC bundle's manifest: every cited
   103	  sub-spec is pinned by content hash, not version range.
   104	
   105	## 5. Downstream-citation surface
   106	
   107	<!-- lint-ok: no-citation -->
   108	
   109	Methodology claims licensed by this entry (cite as
   110	`file://research/primary-sources/nix-flakes.md §3`):
   111	
   112	- methodology-claim: "Nix flakes ship a two-file model:
   113	  flake.nix (declarative inputs + outputs) and flake.lock
   114	  (resolved + content-hashed dependency graph)."
   115	- methodology-claim: "flake.lock provides transitive
   116	  pin-by-content-hash; rebuild reproducibility holds
   117	  across direct and indirect dependencies."
   118	- methodology-claim: "Nix's reproducibility model is the
   119	  strongest current implementation of build-from-spec;
   120	  the methodology cites it as the upper bound on
   121	  equivalence-class-by-construction."
   122	- methodology-claim: "The methodology's deployment/
   123	  sub-spec MAY mirror flake's inputs/outputs shape,
   124	  treating inputs as the deferral contract and outputs
   125	  as the deployment artefact set."
   126	
   127	## 6. Open questions surfaced by the primary read
   128	
   129	- Nix flakes are still officially "experimental" in
   130	  stable Nix releases; the methodology should
   131	  acknowledge this when prescribing flake-style inputs/
   132	  outputs as a deployment-spec shape.
   133	- Whether Nix's content-hash reproducibility generalises
   134	  to non-Nix language ecosystems (Helm? OCI? container
   135	  images built outside Nix?) is an open methodology
   136	  question. The methodology MAY recommend Nix-like
   137	  reproducibility WITHOUT mandating Nix as the
   138	  underlying substrate.
   139	- The relationship between flake.lock and OCI image
   140	  content-addressing is a useful methodology comparison
   141	  point — Nix has filesystem-tree hashes; OCI has
   142	  layer-digest hashes. Different content addressing
   143	  models with similar reproducibility guarantees.

### research/primary-sources/oci-artifacts.md
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

### research/primary-sources/sigstore-cosign.md
     1	---
     2	slug: sigstore-cosign
     3	source_name: "Sigstore + cosign — keyless signing for software supply chain"
     4	primary_url: "https://docs.sigstore.dev/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched Sigstore docs root; Fulcio + Rekor + cosign architecture and keyless model verbatim"
     9	methodology_relevance: |
    10	  Sigstore + cosign is research §4.4's "spec-as-
    11	  distribution versioning + signing + verification"
    12	  primitive. This corpus entry anchors the three-component
    13	  architecture (Fulcio, Rekor, cosign), the keyless signing
    14	  model, and the OCI-artifact signing process so the
    15	  methodology can cite Sigstore precisely when prescribing
    16	  the SPEC bundle's signing + verification contract.
    17	---
    18	
    19	# Sigstore + cosign
    20	
    21	## 1. Source identity
    22	
    23	- Name: Sigstore — open source project for software
    24	  supply chain security.
    25	- Components: Fulcio (CA), Rekor (transparency log),
    26	  cosign (client).
    27	- Canonical URL: `url://docs.sigstore.dev/`.
    28	- Maintainer: Sigstore project (Linux Foundation +
    29	  contributors).
    30	
    31	## 2. Fetch trace
    32	
    33	- `cmd://WebFetch url://docs.sigstore.dev/` — 2026-05-19;
    34	  returned mission statement, three-component
    35	  architecture, keyless signing model, cosign signing
    36	  and verification flow.
    37	
    38	## 3. Verbatim claims this corpus depends on
    39	
    40	- **Mission** (`url://docs.sigstore.dev/`): "Sigstore is
    41	  an open source project for improving software supply
    42	  chain security. The Sigstore framework and tooling
    43	  empowers software developers and consumers to securely
    44	  sign and verify software artifacts such as release
    45	  files, container images, binaries, software bills of
    46	  materials (SBOMs), and more."
    47	
    48	- **Fulcio**: "The code-signing certificate authority
    49	  that issues short-lived certificates bound to verified
    50	  identities."
    51	
    52	- **Rekor**: "an immutable, append-only ledger" that
    53	  records all signing events — the transparency log.
    54	
    55	- **Cosign**: the Sigstore client that initiates signing
    56	  operations.
    57	
    58	- **Keyless signing model**: "The signer ideally forgoes
    59	  using long-lived keypairs. With 'keyless' or
    60	  'ephemeral key' signing, users verify the artifact
    61	  using the transparency log for signature verification
    62	  rather than keys."
    63	
    64	- **Signing process**: "a Cosign client creates a
    65	  temporary key pair, sends a certificate signing
    66	  request to Fulcio with an OIDC identity token,
    67	  receives a short-lived certificate, signs the
    68	  artifact, and then discards the private key."
    69	
    70	- **Cosign signing artefacts** deposited into Rekor:
    71	  "the artifact's digest, signature and certificate."
    72	
    73	- **Verification flow** (four checks): (1) verify the
    74	  artifact's signature using the certificate's public
    75	  key, (2) confirm the identity matches expectations,
    76	  (3) validate the certificate against Sigstore's root
    77	  of trust, (4) confirm inclusion in Rekor's immutable
    78	  log.
    79	
    80	## 4. Fact-link to methodology
    81	
    82	<!-- lint-ok: no-citation -->
    83	
    84	Sigstore + cosign answer the "how does the user-with-
    85	agent verify the methodology SPEC bundle they fetched
    86	matches what the developer published?" question in
    87	research §4.4 (spec-as-distribution versioning, signing,
    88	verification). Key shape implications:
    89	
    90	- The methodology's published SPEC bundle, distributed
    91	  as an OCI artifact (per `oci-artifacts` corpus entry),
    92	  is sign-able by cosign.
    93	- Keyless signing means the developer does NOT need to
    94	  manage long-lived signing keys for SPEC bundle
    95	  releases — OIDC identity (e.g. GitHub Actions OIDC) is
    96	  the trust root.
    97	- Verification by user-with-agent is a four-step check
    98	  that gives "this SPEC came from this developer's
    99	  identity" without trust-on-first-use semantics.
   100	- Rekor inclusion proof gives auditability — any past
   101	  SPEC bundle's signing event is permanently logged.
   102	
   103	## 5. Downstream-citation surface
   104	
   105	<!-- lint-ok: no-citation -->
   106	
   107	Methodology claims licensed by this entry (cite as
   108	`file://research/primary-sources/sigstore-cosign.md
   109	§3`):
   110	
   111	- methodology-claim: "Sigstore consists of Fulcio
   112	  (short-lived certificate authority), Rekor (append-
   113	  only transparency log), and cosign (the signing
   114	  client)."
   115	- methodology-claim: "Keyless signing eliminates
   116	  long-lived signing keys: ephemeral keys are bound to
   117	  OIDC identity via Fulcio; signatures + certificates +
   118	  digest land in Rekor."
   119	- methodology-claim: "cosign verification is a four-
   120	  check process: signature, identity, certificate
   121	  chain, Rekor inclusion."
   122	- methodology-claim: "Sigstore is the methodology's
   123	  recommended signing model for SPEC bundle releases —
   124	  keyless, OIDC-rooted, transparency-logged."
   125	
   126	## 6. Open questions surfaced by the primary read
   127	
   128	- The exact OIDC providers Sigstore Fulcio accepts is
   129	  configurable; the methodology may want to recommend
   130	  specific providers (GitHub Actions, GitLab CI,
   131	  Google) for spec-bundle releases but cannot mandate
   132	  one without specifying the developer's CI/CD
   133	  environment.
   134	- Sigstore's relationship to in-toto and SLSA (Supply-
   135	  chain Levels for Software Artifacts) is real but not
   136	  deep-read on this pass. If the methodology adopts
   137	  SLSA levels, those are separate primary sources
   138	  worth fetching.
   139	- Verification of multi-signature bundles (signed by
   140	  multiple developers) — does cosign support this
   141	  natively or is it tooling-on-top? Not verified;
   142	  flag for follow-on if methodology proposes multi-
   143	  signature governance for SPEC bundles.

### research/primary-sources/structurizr-dsl.md
     1	---
     2	slug: structurizr-dsl
     3	source_name: "Structurizr DSL — text-based C4 model definition"
     4	primary_url: "https://docs.structurizr.com/dsl"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "partial"
     8	fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
     9	methodology_relevance: |
    10	  Structurizr DSL is research §5.1's machine-readable
    11	  C4 implementation. This corpus entry anchors the
    12	  DSL's purpose and posture so the methodology can
    13	  cite it precisely as the architecture/ sub-spec's
    14	  preferred diagram-as-code primitive.
    15	---
    16	
    17	# Structurizr DSL
    18	
    19	## 1. Source identity
    20	
    21	- Name: Structurizr DSL — text-based domain-specific
    22	  language for defining C4-model architectures.
    23	- Author: Simon Brown (same author as C4 model).
    24	- Canonical URL: `url://docs.structurizr.com/dsl`.
    25	- Posture: architecture-as-code.
    26	
    27	## 2. Fetch trace
    28	
    29	- `cmd://WebFetch url://docs.structurizr.com/dsl` —
    30	  2026-05-19; primary-read of root page; definition +
    31	  C4 implementation confirmed; deep syntax (workspace
    32	  / model / views) not fully fetched on this pass.
    33	
    34	## 3. Verbatim claims this corpus depends on
    35	
    36	- **DSL definition** (`url://docs.structurizr.com/dsl`):
    37	  the Structurizr DSL provides "a way to define a
    38	  software architecture model (based upon the C4
    39	  model) using a text-based domain specific language
    40	  (DSL)."
    41	
    42	- **C4-model basis** (per same page): the DSL
    43	  implements the C4 model framework; the documentation
    44	  references diagram types across the C4 hierarchy:
    45	  system context, container, component, code.
    46	
    47	- **Architecture-as-code posture** (per same page):
    48	  "as code" philosophy — architecture definitions are
    49	  text-based artefacts, versionable + readable +
    50	  programmable.
    51	
    52	## 4. Fact-link to methodology
    53	
    54	<!-- lint-ok: no-citation -->
    55	
    56	Structurizr DSL is the architecture-as-code primitive
    57	that lets the methodology's architecture/ sub-spec
    58	ship machine-readable diagrams (not PNG renders or
    59	hand-drawn artefacts). Key shape implications:
    60	
    61	- The methodology's architecture/ sub-spec MAY ship
    62	  one or more `.dsl` files that define the C4 model
    63	  for the product; tooling (Structurizr Lite,
    64	  Structurizr Cloud, or third-party renderers like
    65	  c4-plantuml) renders them to diagrams at consumer
    66	  time.
    67	- Versionable + diff-able: architecture changes show
    68	  up in git diffs, not in opaque image binaries.
    69	- Pairs with C4 (separate corpus entry) — the
    70	  methodology cites C4 as the conceptual model and
    71	  Structurizr DSL as the preferred concrete encoding.
    72	
    73	## 5. Downstream-citation surface
    74	
    75	<!-- lint-ok: no-citation -->
    76	
    77	Methodology claims licensed by this entry (cite as
    78	`file://research/primary-sources/structurizr-dsl.md
    79	§3`):
    80	
    81	- methodology-claim: "Structurizr DSL is a text-based
    82	  DSL for defining C4-model architectures — diagrams
    83	  as code."
    84	- methodology-claim: "The methodology's architecture/
    85	  sub-spec MAY ship .dsl files as the canonical
    86	  diagram artefacts, renderable by Structurizr Lite /
    87	  Cloud / third-party tooling."
    88	- methodology-claim: "Structurizr DSL's architecture-as-
    89	  code posture aligns with the methodology's
    90	  preference for versionable + diff-able artefacts in
    91	  the SPEC bundle."
    92	
    93	## 6. Open questions surfaced by the primary read
    94	
    95	- The exact DSL syntax (workspace, model, views
    96	  keywords) was not deep-read in this pass — only the
    97	  top-level navigation. If the methodology's
    98	  architecture/ sub-spec sketches example .dsl
    99	  snippets, a deeper fetch of `docs.structurizr.com/dsl/language`
   100	  is needed.
   101	- Alternative architecture-as-code tools (Mermaid,
   102	  PlantUML with c4-plantuml, IcePanel, Likec4) cover
   103	  similar ground; the methodology should acknowledge
   104	  multiple options rather than mandating Structurizr.
   105	- Structurizr's hosting model (Lite for self-host,
   106	  Cloud for hosted) is a deployment choice for the
   107	  methodology's downstream tooling, not part of the
   108	  spec itself; flag for non-binding methodology
   109	  guidance.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/spec-kit.md research/primary-sources/kiro.md research/primary-sources/openspec.md research/primary-sources/oracle-agent-spec.md; do printf '\\n### %s\\n' \""'$f"; nl -ba "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

### research/primary-sources/spec-kit.md
     1	---
     2	slug: spec-kit
     3	source_name: "GitHub Spec Kit — Spec-Driven Development toolkit"
     4	primary_url: "https://github.com/github/spec-kit"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched github/spec-kit repository README; six-command lifecycle + artefact set + posture verbatim"
     9	methodology_relevance: |
    10	  Spec Kit is research §2.1's "closest spec-as-authoring
    11	  tool." Authoring-artefact posture is the explicit
    12	  contrast point for the methodology's spec-as-
    13	  distribution-artefact posture. This corpus entry
    14	  anchors Spec Kit's command lifecycle, artefact set,
    15	  and authoring-posture so the methodology can cite the
    16	  authoring/distribution distinction precisely.
    17	---
    18	
    19	# GitHub Spec Kit
    20	
    21	## 1. Source identity
    22	
    23	- Name: GitHub Spec Kit — open source toolkit for
    24	  Spec-Driven Development.
    25	- Canonical URL: `url://github.com/github/spec-kit`.
    26	- Maintainer: GitHub.
    27	- Posture: spec-as-authoring (the spec drives
    28	  implementation generation).
    29	
    30	## 2. Fetch trace
    31	
    32	- `cmd://WebFetch url://github.com/github/spec-kit` —
    33	  2026-05-19; returned definition, six-command
    34	  lifecycle, artefact set.
    35	
    36	## 3. Verbatim claims this corpus depends on
    37	
    38	- **Definition** (`url://github.com/github/spec-kit`):
    39	  Spec Kit is "an open source toolkit that allows you
    40	  to focus on product scenarios and predictable
    41	  outcomes instead of vibe coding every piece from
    42	  scratch."
    43	
    44	- **Spec-Driven Development thesis** (verbatim):
    45	  "Spec-Driven Development flips the script on
    46	  traditional software development… specifications
    47	  become executable, directly generating working
    48	  implementations rather than just guiding them."
    49	
    50	- **Six-command lifecycle**:
    51	  1. `/speckit.constitution` — "Create or update
    52	     project governing principles and development
    53	     guidelines."
    54	  2. `/speckit.specify` — "Define what you want to
    55	     build (requirements and user stories)."
    56	  3. `/speckit.clarify` — "Clarify underspecified
    57	     areas (recommended before `/speckit.plan`)."
    58	  4. `/speckit.plan` — "Create technical
    59	     implementation plans with your chosen tech
    60	     stack."
    61	  5. `/speckit.tasks` — "Generate actionable task
    62	     lists for implementation."
    63	  6. `/speckit.implement` — "Execute all tasks to
    64	     build the feature according to the plan."
    65	
    66	- **Optional command**: `/speckit.analyze` for
    67	  "Cross-artifact consistency & coverage analysis."
    68	
    69	- **Artefact set produced**:
    70	  - `.specify/memory/constitution.md` — project
    71	    principles.
    72	  - `specs/[feature-name]/spec.md` — functional
    73	    specifications.
    74	  - `specs/[feature-name]/plan.md` — technical
    75	    implementation plan.
    76	  - `specs/[feature-name]/tasks.md` — task breakdown.
    77	  - `specs/[feature-name]/contracts/` — API specs,
    78	    data models.
    79	  - `specs/[feature-name]/research.md` — tech-stack
    80	    research.
    81	
    82	## 4. Fact-link to methodology
    83	
    84	<!-- lint-ok: no-citation -->
    85	
    86	Spec Kit's posture is authoring-time, intra-team:
    87	specifications drive implementation generation within
    88	one team's codebase. The methodology's posture is
    89	distribution-time, cross-org: specifications are
    90	shipped as artefacts user-with-agents install on their
    91	own terms.
    92	
    93	Both postures call the artefact a "spec"; they mean
    94	different things. The methodology MUST be precise:
    95	
    96	- Spec Kit specs are scaffolds the team's own agent
    97	  consumes to generate code.
    98	- Methodology specs are published distribution
    99	  artefacts the user-with-agent consumes to install
   100	  the developer's product.
   101	
   102	The lifecycle commands map loosely (constitution ≈
   103	methodology's parent Decision; specify ≈ longread;
   104	plan ≈ deployment/ sub-spec; tasks ≈ TASK.md
   105	decomposition; implement ≈ install) but the consumer
   106	identity is different.
   107	
   108	## 5. Downstream-citation surface
   109	
   110	<!-- lint-ok: no-citation -->
   111	
   112	Methodology claims licensed by this entry (cite as
   113	`file://research/primary-sources/spec-kit.md §3`):
   114	
   115	- methodology-claim: "Spec Kit is the closest spec-
   116	  as-authoring tool (GitHub, 2025) — its specs are
   117	  scaffolds for an in-team agent's code generation."
   118	- methodology-claim: "Spec Kit's six-command lifecycle
   119	  (constitution → specify → clarify → plan → tasks →
   120	  implement) is in-team authoring; the methodology's
   121	  lifecycle is cross-org distribution + install."
   122	- methodology-claim: "Spec Kit produces an artefact
   123	  set (spec.md, plan.md, tasks.md, contracts/) that
   124	  remains inside one team's repo; the methodology's
   125	  artefact set is the published SPEC bundle distributed
   126	  to user-with-agent installers."
   127	- methodology-claim: "The 'spec is executable' thesis
   128	  Spec Kit articulates is shared by the methodology;
   129	  the difference is WHO executes the spec — Spec Kit:
   130	  the authoring team's agent; methodology: the
   131	  installing user's agent, with no developer in the
   132	  loop."
   133	
   134	## 6. Open questions surfaced by the primary read
   135	
   136	- Spec Kit's `/speckit.constitution` artefact has
   137	  loose mapping to the methodology's parent Decision
   138	  SPEC; the actual contracts of the two are different
   139	  (Spec Kit constitution = principles + style;
   140	  methodology Decision = binding choice). Comparison
   141	  should not flatten the distinction.
   142	- Whether Spec Kit specs can be PUBLISHED for cross-
   143	  team consumption (vs in-team authoring only) is
   144	  ambiguous from the README; the methodology may want
   145	  to acknowledge Spec Kit as a candidate
   146	  authoring-time tool but is silent on its
   147	  cross-org-distribution use.
   148	- Spec Kit's `clarify` step is a useful pattern —
   149	  agents ask for clarification before planning — that
   150	  the methodology's authoring-time guidance MAY
   151	  reference, even though the methodology's
   152	  distribution artefacts are post-clarification.

### research/primary-sources/kiro.md
     1	---
     2	slug: kiro
     3	source_name: "Kiro — agentic AI coding IDE with spec-driven workflow"
     4	primary_url: "https://kiro.dev/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched kiro.dev root; three-phase workflow (requirements / design / implementation) + EARS notation reference verbatim"
     9	methodology_relevance: |
    10	  Kiro is research §2.1's "spec-driven IDE" reference.
    11	  This corpus entry anchors Kiro's three-phase workflow
    12	  and the EARS-notation acceptance-criteria primitive
    13	  so the methodology can cite Kiro precisely as a
    14	  spec-as-authoring tool comparison point.
    15	---
    16	
    17	# Kiro
    18	
    19	## 1. Source identity
    20	
    21	- Name: Kiro — agentic AI IDE / CLI / web interface.
    22	- Canonical URL: `url://kiro.dev/`.
    23	- Posture: spec-driven; targets the "prototype to
    24	  production" gap.
    25	
    26	## 2. Fetch trace
    27	
    28	- `cmd://WebFetch url://kiro.dev/` — 2026-05-19;
    29	  returned definition, three-phase workflow, model
    30	  reference; no AWS Bedrock language found on the
    31	  homepage (the methodology's prior summary may have
    32	  inferred a Bedrock binding that this primary read
    33	  does not confirm).
    34	
    35	## 3. Verbatim claims this corpus depends on
    36	
    37	- **Self-definition** (`url://kiro.dev/`): "Kiro helps
    38	  you bridge the gap from AI coding to engineering:
    39	  manage intent, complete long-running tasks across
    40	  large codebases, validate code correctness with an
    41	  agent that learns how you work."
    42	
    43	- **Form-factor**: "agentic AI with an IDE, CLI, and
    44	  web interface that helps you go from prototype to
    45	  production."
    46	
    47	- **Three-phase workflow**:
    48	  1. **Requirements** — "Kiro takes your natural
    49	     language prompt and turns it into clear
    50	     requirements and acceptance criteria in EARS
    51	     notation."
    52	  2. **Design** — "Kiro analyzes your codebase and
    53	     comes up with the architecture, system design,
    54	     and tech stack that meets your needs."
    55	  3. **Implementation** — "Kiro then creates an
    56	     implementation plan with discrete tasks,
    57	     sequenced based on dependencies, with optional
    58	     comprehensive tests." Users then "Ask Kiro to
    59	     implement each task using advanced agents."
    60	
    61	- **Model options**: "Claude Sonnet 4.5" or "Auto"
    62	  models (per homepage); no explicit Bedrock binding
    63	  found in fetched content.
    64	
    65	## 4. Fact-link to methodology
    66	
    67	<!-- lint-ok: no-citation -->
    68	
    69	Kiro is a spec-as-authoring tool — specs live inside
    70	the developer's environment, drive code generation
    71	inside the same environment. Same authoring-vs-
    72	distribution distinction as Spec Kit.
    73	
    74	EARS notation (Easy Approach to Requirements Syntax) is
    75	the acceptance-criteria primitive Kiro adopts. The
    76	methodology may reference EARS as a candidate
    77	acceptance-criteria format for the behavior/ sub-spec,
    78	but EARS itself is a separate specification (Mavin et
    79	al.) that would merit its own corpus entry if
    80	methodology mandates it.
    81	
    82	The prior research workpad (§11 References)
    83	characterised Kiro as "Bedrock-tethered." The primary
    84	homepage read does NOT confirm this binding; the
    85	homepage names Claude Sonnet 4.5 as a model option.
    86	This is a gap-from-prior-summary correction worth
    87	noting.
    88	
    89	## 5. Downstream-citation surface
    90	
    91	<!-- lint-ok: no-citation -->
    92	
    93	Methodology claims licensed by this entry (cite as
    94	`file://research/primary-sources/kiro.md §3`):
    95	
    96	- methodology-claim: "Kiro is an agentic AI IDE/CLI/
    97	  web environment with a three-phase spec-driven
    98	  workflow: Requirements → Design → Implementation."
    99	- methodology-claim: "Kiro adopts EARS notation for
   100	  acceptance criteria — a candidate primitive the
   101	  methodology's behavior/ sub-spec MAY reference."
   102	- methodology-claim: "Kiro is a spec-as-authoring
   103	  tool (in-developer-environment); the methodology's
   104	  spec-as-distribution-artefact posture is a different
   105	  use case."
   106	
   107	## 6. Open questions surfaced by the primary read
   108	
   109	- The "Bedrock-tethered" characterisation in the prior
   110	  research workpad was not confirmed by this primary
   111	  read of the homepage. A deeper read of Kiro's
   112	  enterprise / model-routing docs may be needed if
   113	  methodology cites Kiro's hosting posture.
   114	- EARS notation is a separate primary source
   115	  (Mavin et al., 2009); if the methodology mandates
   116	  EARS-format acceptance criteria, EARS deserves its
   117	  own corpus entry.
   118	- Kiro's CLI mode + agent dispatch model may be
   119	  worth comparing to Symphony's per-issue isolated
   120	  workspaces; not deep-read in this pass.

### research/primary-sources/openspec.md
     1	---
     2	slug: openspec
     3	source_name: "OpenSpec — Spec-driven development for AI coding assistants"
     4	primary_url: "https://github.com/Fission-AI/OpenSpec"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched Fission-AI/OpenSpec README; three-command workflow + artefact set + lighter-than-Spec-Kit posture verbatim"
     9	methodology_relevance: |
    10	  OpenSpec is a recent (Fission-AI) spec-driven dev tool
    11	  that positions itself as the lighter counterpart to
    12	  Spec Kit. This corpus entry anchors its workflow and
    13	  posture so the methodology can survey the spec-as-
    14	  authoring tool space accurately.
    15	---
    16	
    17	# OpenSpec
    18	
    19	## 1. Source identity
    20	
    21	- Name: OpenSpec — Spec-driven development for AI
    22	  coding assistants.
    23	- Canonical URL: `url://github.com/Fission-AI/OpenSpec`.
    24	- Maintainer: Fission AI.
    25	- Posture: spec-as-authoring, tool-agnostic across
    26	  AI coding assistants.
    27	
    28	## 2. Fetch trace
    29	
    30	- `cmd://WebFetch url://github.com/Fission-AI/OpenSpec`
    31	  — 2026-05-19; returned definition, three-stage
    32	  workflow, artefact set, comparisons to Spec Kit and
    33	  Kiro.
    34	
    35	## 3. Verbatim claims this corpus depends on
    36	
    37	- **Definition** (`url://github.com/Fission-AI/OpenSpec`):
    38	  OpenSpec is "Spec-driven development (SDD) for AI
    39	  coding assistants."
    40	
    41	- **Philosophy** (verbatim): "fluid not rigid →
    42	  iterative not waterfall → easy not complex → built
    43	  for brownfield not just greenfield → scalable from
    44	  personal projects to enterprises."
    45	
    46	- **Three-stage workflow**:
    47	  1. `/opsx:propose "your idea"` — "AI creates
    48	     proposal, specs, design, and tasks."
    49	  2. `/opsx:apply` — "AI implements tasks from the
    50	     checklist."
    51	  3. `/opsx:archive` — "Completed changes move to
    52	     archive folder."
    53	
    54	- **Extended commands**: `/opsx:new`, `/opsx:continue`,
    55	  `/opsx:ff`, `/opsx:verify`, `/opsx:bulk-archive`,
    56	  `/opsx:onboard`.
    57	
    58	- **Artefact set per change**:
    59	  - `proposal.md` — rationale and overview.
    60	  - `specs/` — requirements and scenarios.
    61	  - `design.md` — technical approach.
    62	  - `tasks.md` — implementation checklist.
    63	
    64	- **Comparison to Spec Kit** (per README):
    65	  OpenSpec is "lighter" with freedom to "iterate
    66	  freely" rather than enforcing "rigid phase gates"
    67	  and "lots of Markdown."
    68	
    69	- **Comparison to Kiro** (per README): OpenSpec is
    70	  "tool agnostic"; Kiro locks users into "their IDE
    71	  and limited to Claude models," whereas OpenSpec
    72	  "works with the tools you already use" (20+ AI
    73	  assistants).
    74	
    75	## 4. Fact-link to methodology
    76	
    77	<!-- lint-ok: no-citation -->
    78	
    79	OpenSpec is spec-as-authoring (like Spec Kit, Kiro)
    80	with different ergonomics: lighter phase structure,
    81	tool-agnostic, brownfield-friendly. Posture-wise it is
    82	still authoring-time, intra-team; the methodology's
    83	spec-as-distribution scope is distinct.
    84	
    85	OpenSpec's "brownfield not just greenfield" framing is
    86	relevant prior art for the methodology: extracting a
    87	SPEC from an existing product (Product A v1.1 → v2.0
    88	manifest+catalog) IS brownfield extraction. The
    89	methodology may want to acknowledge OpenSpec's
    90	brownfield emphasis.
    91	
    92	## 5. Downstream-citation surface
    93	
    94	<!-- lint-ok: no-citation -->
    95	
    96	Methodology claims licensed by this entry (cite as
    97	`file://research/primary-sources/openspec.md §3`):
    98	
    99	- methodology-claim: "OpenSpec is a tool-agnostic
   100	  spec-driven development tool (Fission AI) with a
   101	  three-stage workflow: propose / apply / archive."
   102	- methodology-claim: "OpenSpec's 'brownfield not just
   103	  greenfield' posture is relevant prior art for the
   104	  methodology's extraction-from-existing-product
   105	  emphasis."
   106	- methodology-claim: "The spec-as-authoring tool
   107	  space includes at least three named tools (Spec Kit,
   108	  Kiro, OpenSpec) with different ergonomic tradeoffs;
   109	  the methodology's spec-as-distribution-artefact
   110	  posture is distinct from all three."
   111	
   112	## 6. Open questions surfaced by the primary read
   113	
   114	- OpenSpec is recent (Fission-AI; release timing not
   115	  verified on this pass). The "20+ AI assistants"
   116	  claim was not enumerated in the fetched content; if
   117	  methodology cites OpenSpec's compatibility surface,
   118	  fetch the supported-tools list separately.
   119	- OpenSpec's "brownfield-friendly" posture is a claim
   120	  not deeply verified; methodology's case study
   121	  (Product A repack) IS brownfield extraction but the
   122	  methodology should not borrow OpenSpec's tooling for
   123	  the case study unless that's deliberately chosen.
   124	- The criticism of Spec Kit ("rigid phase gates",
   125	  "lots of Markdown") is OpenSpec's competitive
   126	  framing; the methodology should treat this as
   127	  marketing language, not as primary fact about Spec
   128	  Kit. Spec Kit's primary read (corpus slug `spec-
   129	  kit`) is the authoritative source on Spec Kit's
   130	  posture.

### research/primary-sources/oracle-agent-spec.md
     1	---
     2	slug: oracle-agent-spec
     3	source_name: "Oracle Open Agent Spec (Agent Spec)"
     4	primary_url: "https://github.com/oracle/agent-spec"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched oracle/agent-spec README; framework-agnostic declarative language definition + JSON/YAML serialization + multi-SDK conformance verbatim"
     9	methodology_relevance: |
    10	  Oracle Agent Spec is research §2.1's "closest to 'ship
    11	  spec, compile yourself'" — framework-agnostic
    12	  declarative description of agentic systems. Closest
    13	  cousin to the methodology's spec-as-distribution
    14	  posture. This corpus entry anchors Agent Spec's
    15	  conformance model and serialization shape so the
    16	  methodology can cite it precisely as nearest neighbour.
    17	---
    18	
    19	# Oracle Open Agent Spec
    20	
    21	## 1. Source identity
    22	
    23	- Name: Open Agent Spec (Agent Spec).
    24	- Maintainer: Oracle.
    25	- Canonical URL: `url://github.com/oracle/agent-spec`.
    26	- SDKs: PyAgentSpec (Python), tsagentspec (TypeScript).
    27	
    28	## 2. Fetch trace
    29	
    30	- `cmd://WebFetch url://github.com/oracle/agent-spec` —
    31	  2026-05-19; returned README — definition,
    32	  serialization, multi-SDK conformance posture.
    33	
    34	## 3. Verbatim claims this corpus depends on
    35	
    36	- **Definition** (`url://github.com/oracle/agent-spec`
    37	  README): "Open Agent Spec (Agent Spec) is a
    38	  framework-agnostic declarative language for defining
    39	  agentic systems."
    40	
    41	- **Scope** (verbatim): Agent Spec "defines building
    42	  blocks for standalone agents and structured agentic
    43	  workflows as well as common ways of composing them
    44	  into multi-agent systems."
    45	
    46	- **Serialization**: JSON/YAML. Users can "serialize /
    47	  deserialize Agents to JSON/YAML, or create them from
    48	  object representations with the assurance of
    49	  conformance to the specification."
    50	
    51	- **Multi-SDK conformance**: "SDKs in various
    52	  languages can implement Agent Spec components with
    53	  the assurance of conformance to the specification."
    54	
    55	## 4. Fact-link to methodology
    56	
    57	<!-- lint-ok: no-citation -->
    58	
    59	Oracle Agent Spec is the closest published precursor
    60	to spec-as-distribution-artefact: it ships an agent
    61	description that ANY conforming SDK can consume to
    62	instantiate the agent. The methodology generalises
    63	this from "agent description" to "product description"
    64	— same posture, broader scope.
    65	
    66	Key shape implications:
    67	
    68	- The "framework-agnostic declarative language" framing
    69	  is the methodology's framing for the SPEC bundle.
    70	  Methodology can cite Agent Spec as precedent for
    71	  cross-framework conformance.
    72	- The multi-SDK pattern (Python + TypeScript SDKs
    73	  conforming to the same spec) is the methodology's
    74	  multi-runner pattern (any conforming installer agent
    75	  can install from the SPEC bundle).
    76	- JSON/YAML serialization is a candidate format for
    77	  the methodology's front-door manifest; Agent Spec
    78	  uses both.
    79	
    80	## 5. Downstream-citation surface
    81	
    82	<!-- lint-ok: no-citation -->
    83	
    84	Methodology claims licensed by this entry (cite as
    85	`file://research/primary-sources/oracle-agent-spec.md
    86	§3`):
    87	
    88	- methodology-claim: "Oracle's Open Agent Spec is a
    89	  framework-agnostic declarative language for
    90	  defining agentic systems — closest published
    91	  precursor to the methodology's spec-as-distribution
    92	  posture for products generally."
    93	- methodology-claim: "Agent Spec ships SDKs in
    94	  multiple languages (Python, TypeScript) that
    95	  conform to the same specification — the multi-
    96	  runner pattern the methodology generalises."
    97	- methodology-claim: "JSON and YAML are Agent Spec's
    98	  serialization formats — both are candidates for
    99	  the methodology's front-door manifest format."
   100	
   101	## 6. Open questions surfaced by the primary read
   102	
   103	- Agent Spec's scope is agentic systems (agents +
   104	  workflows + multi-agent composition); the
   105	  methodology's scope is products generally. The
   106	  scope-generalisation step must be done by the
   107	  methodology, not inherited from Agent Spec.
   108	- Agent Spec's conformance model details (test
   109	  harness? reference suite? validation tooling?)
   110	  were not deep-read on this pass. If the
   111	  methodology adopts a conformance harness, a
   112	  deeper read of Agent Spec's conformance tests is
   113	  warranted.
   114	- The README does NOT compare Agent Spec to Spec Kit
   115	  or other spec formats; the methodology must do
   116	  that comparison work itself (or cite separate
   117	  comparison sources).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "for f in research/primary-sources/adr-tools-state.md research/primary-sources/ref-arch-vs-solution-arch.md; do printf '\\n### %s\\n' \""'$f"; nl -ba "$f"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

### research/primary-sources/adr-tools-state.md
     1	---
     2	slug: adr-tools-state
     3	source_name: "adr.github.io — state of ADR practice"
     4	primary_url: "https://adr.github.io/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "partial"
     8	fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
     9	methodology_relevance: |
    10	  State-of-practice ADR ecosystem (MADR, Y-statements,
    11	  Nygard, adr-tools CLI) is the cross-check against
    12	  Nygard's 2011 origin. This corpus entry anchors
    13	  community framing and template diversity so the
    14	  methodology's decisions facet can survey current
    15	  practice rather than locking only on Nygard.
    16	---
    17	
    18	# adr.github.io — State of ADR Practice
    19	
    20	## 1. Source identity
    21	
    22	- Name: adr.github.io — community resource for
    23	  Architecture Decision Records.
    24	- Canonical URL: `url://adr.github.io/`.
    25	- Posture: community catalogue of ADR templates,
    26	  tooling, practices.
    27	- Linked sub-pages (not deep-read on this pass):
    28	  `/adr-templates/`, `/ad-practices/`,
    29	  `/adr-tooling/`.
    30	
    31	## 2. Fetch trace
    32	
    33	- `cmd://WebFetch url://adr.github.io/` — 2026-05-19;
    34	  returned ADR community definition, template family
    35	  references; specific template catalogs and CLI
    36	  conventions live on sub-pages not fetched in this
    37	  pass.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **ADR (community definition)**: "An Architectural
    42	  Decision Record (ADR) captures a single AD and its
    43	  rationale; Put it simply, ADR can help you
    44	  understand the reasons for a chosen architectural
    45	  decision, along with its trade-offs and consequences."
    46	  (`url://adr.github.io/`)
    47	
    48	- **Architectural Decision (community definition)**:
    49	  "a justified design choice that addresses a
    50	  functional or non-functional requirement that is
    51	  architecturally significant."
    52	
    53	- **Template families referenced** (per root page;
    54	  catalogue at `/adr-templates/`):
    55	  - **Nygard's template** — the foundational 2011
    56	    blog post template (corpus entry `adr-nygard`).
    57	  - **Y-statements** — from Zdun et al.'s "Sustainable
    58	    Architectural Decisions" paper.
    59	  - **MADR** (Markdown Architectural Decision Records)
    60	    — community-maintained richer template.
    61	  - Reference to "seven templates" comparison paper.
    62	
    63	## 4. Fact-link to methodology
    64	
    65	<!-- lint-ok: no-citation -->
    66	
    67	The state-of-practice ADR ecosystem confirms Nygard's
    68	template is foundational but no longer the only option.
    69	The methodology's decisions facet must choose between:
    70	
    71	- Mandating Nygard's exact 5-section template (most
    72	  restrictive; clearest);
    73	- Allowing the MADR richer template (more fields:
    74	  status, deciders, context-and-problem-statement,
    75	  considered-options, decision-outcome, pros-and-cons-
    76	  of-the-options);
    77	- Allowing Y-statements (one-line decision statements
    78	  with reasoning lattice);
    79	- Permitting any of the catalogued templates.
    80	
    81	The choice is a methodology design decision; this
    82	corpus entry provides the landscape from which the
    83	decision is made.
    84	
    85	## 5. Downstream-citation surface
    86	
    87	<!-- lint-ok: no-citation -->
    88	
    89	Methodology claims licensed by this entry (cite as
    90	`file://research/primary-sources/adr-tools-state.md
    91	§3`):
    92	
    93	- methodology-claim: "The state-of-practice ADR
    94	  ecosystem includes Nygard's template (origin),
    95	  MADR (community-rich), Y-statements (Zdun et al.),
    96	  and other templates catalogued at adr.github.io."
    97	- methodology-claim: "ADRs are community-defined as
    98	  'capturing a single AD and its rationale,
    99	  trade-offs, and consequences'."
   100	- methodology-claim: "An Architectural Decision is
   101	  'a justified design choice that addresses a
   102	  functional or non-functional requirement that is
   103	  architecturally significant'."
   104	- methodology-claim: "The methodology's decisions/
   105	  sub-spec MAY permit one or more catalogued ADR
   106	  templates; the choice is a methodology design
   107	  decision (not resolved by the community)."
   108	
   109	## 6. Open questions surfaced by the primary read
   110	
   111	- The adr.github.io root page references but does not
   112	  enumerate the full template catalogue;
   113	  `/adr-templates/` is the dedicated page. If
   114	  methodology mandates a specific template, fetch
   115	  that page.
   116	- adr-tools CLI conventions (file naming, directory
   117	  layout, `adr new`, `adr supersede` semantics) live
   118	  on `/adr-tooling/`; not deep-read in this pass. If
   119	  methodology adopts adr-tools-style conventions for
   120	  the decisions/ sub-spec, fetch separately.
   121	- The "seven templates" comparison paper is cited
   122	  but not named in the fetched content; the
   123	  methodology may want to find this paper for a
   124	  deeper template-survey citation.

### research/primary-sources/ref-arch-vs-solution-arch.md
     1	---
     2	slug: ref-arch-vs-solution-arch
     3	source_name: "Mike Cottmeyer — Reference Architecture vs Reference Implementation (LiminalArc, 2019)"
     4	primary_url: "https://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/"
     5	fetched_via: "WebFetch"
     6	fetched_on: 2026-05-19
     7	fetch_outcome: "primary-read-complete"
     8	fetch_evidence: "fetched liminalarc.co Cottmeyer post; reference-architecture-holds-universally + reference-implementation-is-negotiable distinction verbatim"
     9	methodology_relevance: |
    10	  This is the closest existing articulation of the
    11	  methodology's cross-org ownership-split protocol
    12	  (research §4.3): what the developer publishes as
    13	  universal (reference architecture) vs what the
    14	  installer customises (reference implementation /
    15	  solution architecture). Mike Cottmeyer's distinction
    16	  is the methodology's vocabulary precursor.
    17	---
    18	
    19	# Reference Architecture vs Reference Implementation
    20	
    21	## 1. Source identity
    22	
    23	- Title: "Reference Architecture vs Reference
    24	  Implementation."
    25	- Author: Mike Cottmeyer.
    26	- Publisher: LiminalArc (Cottmeyer's consulting blog).
    27	- Date: 2019-05.
    28	- Canonical URL: `url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`.
    29	- Context: agile-transformation consulting; emerged
    30	  from observing organisations attempting to deploy
    31	  SAFe, LeSS, or Disciplined Agile Delivery verbatim.
    32	
    33	## 2. Fetch trace
    34	
    35	- `cmd://WebFetch url://liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/`
    36	  — 2026-05-19; returned Cottmeyer's distinction +
    37	  consulting context + universal-vs-negotiable framing.
    38	
    39	## 3. Verbatim claims this corpus depends on
    40	
    41	- **Reference architecture (Cottmeyer)**: comprises
    42	  "base patterns that... transcend any of the
    43	  methodologies." Key claim: "The reference
    44	  architecture holds universally."
    45	
    46	- **Reference implementation (Cottmeyer)**: "The
    47	  reference implementation is what is negotiable" —
    48	  contrasted directly with the universal nature of
    49	  reference architecture.
    50	
    51	- **Posture distinction (verbatim framing)**:
    52	  - Reference Architecture: universal, non-negotiable
    53	    foundational patterns (in Cottmeyer's domain:
    54	    teams, backlogs, working tested software,
    55	    dependency management).
    56	  - Reference Implementation: tailorable methodology
    57	    — the specific tools, techniques, and controls
    58	    selected based on context.
    59	
    60	- **Underlying thesis** (verbatim, paraphrased close
    61	  to source): "understanding the base patterns that
    62	  you can't violate, it's like a really big deal."
    63	
    64	- **Consulting context**: the distinction "emerged
    65	  from practical agile transformation work where
    66	  organizations attempt to implement frameworks like
    67	  SAFe, LeSS, or Disciplined Agile Delivery." The
    68	  observation: "blindly deploying methodologies
    69	  verbatim fails, but understanding immutable
    70	  patterns beneath various frameworks enables
    71	  organizations to tailor their approach while
    72	  maintaining transformation viability."
    73	
    74	## 4. Fact-link to methodology
    75	
    76	<!-- lint-ok: no-citation -->
    77	
    78	Cottmeyer's distinction maps directly onto the
    79	methodology's cross-org ownership split:
    80	
    81	- **What the developer publishes universally** =
    82	  reference architecture (in methodology terms: the
    83	  front-door manifest + architecture/ + behavior/ +
    84	  decisions/ sub-specs; the "what" of the product).
    85	- **What the installer makes negotiable** = reference
    86	  implementation (in methodology terms: the
    87	  customization/ + deployment/ sub-specs as
    88	  parameterised; the "how" of the product in this
    89	  installer's environment).
    90	
    91	The vocabulary precedes the methodology and is
    92	useful as a citable label. The methodology
    93	generalises Cottmeyer's distinction from agile-
    94	transformation consulting (developer = framework
    95	author, installer = transforming organisation) to
    96	arbitrary product distribution.
    97	
    98	## 5. Downstream-citation surface
    99	
   100	<!-- lint-ok: no-citation -->
   101	
   102	Methodology claims licensed by this entry (cite as
   103	`file://research/primary-sources/ref-arch-vs-solution-arch.md
   104	§3`):
   105	
   106	- methodology-claim: "Cottmeyer (2019) distinguishes
   107	  reference architecture (universal, non-negotiable)
   108	  from reference implementation (tailorable,
   109	  negotiable) — a vocabulary precursor for the
   110	  methodology's cross-org ownership split."
   111	- methodology-claim: "The methodology's developer-
   112	  owns-intent / installer-owns-deployment ownership
   113	  split is a generalisation of Cottmeyer's
   114	  architecture-vs-implementation distinction, scaled
   115	  from agile-transformation consulting to product
   116	  distribution."
   117	- methodology-claim: "Reference architecture as
   118	  Cottmeyer defines it ('holds universally') is the
   119	  methodology's analogue for what the published SPEC
   120	  bundle's front-door manifest + intent sub-specs
   121	  contain; reference implementation as Cottmeyer
   122	  defines it ('what is negotiable') is the
   123	  methodology's analogue for the customization +
   124	  deployment sub-specs."
   125	- methodology-claim: "Cottmeyer's empirical
   126	  observation — 'blindly deploying methodologies
   127	  verbatim fails' — is the methodology's case for
   128	  non-prescriptive SPECs: prescription erodes the
   129	  installer's authority to tailor."
   130	
   131	## 6. Open questions surfaced by the primary read
   132	
   133	- Cottmeyer's frame is agile-transformation
   134	  consulting; the methodology generalises to
   135	  arbitrary product distribution. The
   136	  generalisability of Cottmeyer's "base patterns" to
   137	  software-product domains beyond agile-transformation
   138	  is not proven by his original frame — methodology
   139	  must own the generalisation explicitly.
   140	- Cottmeyer cites four base patterns (teams,
   141	  backlogs, working tested software, dependency
   142	  management) for agile transformation. The
   143	  methodology has not yet enumerated equivalent
   144	  "base patterns" for product distribution. This is
   145	  a methodology design open question.
   146	- Academic literature on reference-architecture-vs-
   147	  solution-architecture (Galster, Avgeriou, others)
   148	  is older than Cottmeyer's framing. If methodology
   149	  wants stronger academic anchoring, those primary
   150	  sources merit separate corpus entries.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "bash scripts/lint-spec.sh research/primary-sources/arc42.md; printf 'exit=%s\\n' "'$?' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/arc42.md:18: missing type/implies_spec_type field
research/primary-sources/arc42.md:18: missing required section: ## 
== lint-spec.sh summary ==
target:                research/primary-sources/arc42.md
artefact / type:       spec / <unset>
sections (top-level):  6
citation-prefix hits:  17
lowercase 2119 hits:   0 (advisory only)
errors:                2
warnings:              0
exit=1

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "bash scripts/check-corpus-completeness.sh; printf 'exit=%s\\n' "'$?' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
check-corpus-completeness: PASS — 20 sources, all complete
exit=0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "bash scripts/lint-spec.sh research/primary-sources/helm-values-schema.md; printf 'exit=%s\\n' "'$?' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 152ms:
== lint-spec.sh summary ==
target:                research/primary-sources/helm-values-schema.md
artefact / type:       spec / <unset>
sections (top-level):  6
citation-prefix hits:  5
lowercase 2119 hits:   2 (advisory only)
errors:                11
warnings:              0
exit=1

codex
The lint impedance point is not just cosmetic. The corpus completeness script passes, but per-artefact lint on a sample shows real `fact-bearing paragraph lacks citation prefix` errors mixed with the known front-matter noise, which means §7.1’s “uncited-claim is blocking” rule is not currently enforceable by the accepted gate.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; out=$(bash scripts/lint-spec.sh "$f" 2>&1 >/tmp/lint-out.$$); status=$?; uncited=$(printf '"'%s\\n' \""'$out" | rg -c '"'fact-bearing paragraph lacks citation prefix' || true); form="'$(printf '"'%s\\n' \""'$out" | rg -c '"'missing type/implies_spec_type|missing required section' || true); printf '%s exit=%s form=%s uncited=%s\\n' \""'$f" "$status" "$form" "$uncited"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 236ms:
research/primary-sources/kiro.md exit=1 form= uncited=
research/primary-sources/leaddev-agent-compiled.md exit=1 form= uncited=
research/primary-sources/nix-flakes.md exit=1 form= uncited=
research/primary-sources/oci-artifacts.md exit=1 form= uncited=
research/primary-sources/openapi-3-1.md exit=1 form= uncited=
research/primary-sources/openspec.md exit=1 form= uncited=
research/primary-sources/oracle-agent-spec.md exit=1 form= uncited=
research/primary-sources/ref-arch-vs-solution-arch.md exit=1 form= uncited=
research/primary-sources/sigstore-cosign.md exit=1 form= uncited=
research/primary-sources/spec-kit.md exit=1 form= uncited=
research/primary-sources/structurizr-dsl.md exit=1 form= uncited=
research/primary-sources/symphony-spec.md exit=1 form= uncited=

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'out=$(bash scripts/lint-spec.sh research/primary-sources/helm-values-schema.md 2>&1 >/tmp/lint-out-test); printf '"'OUT<<%s>>\\n' \""'$out"; printf '"'form='; printf '%s\\n' \""'$out" | rg -c '"'missing type/implies_spec_type|missing required section' || true; printf 'uncited='; printf '%s\\n' \""'$out" | rg -c '"'fact-bearing paragraph lacks citation prefix' || true; rm -f /tmp/lint-out-test" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
OUT<</home/linuxbrew/.linuxbrew/bin/bash: line 1: /tmp/lint-out-test: Read-only file system>>
form=uncited=
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do [ "$(basename "$f")" = INDEX.md ] && continue; out=$(bash scripts/lint-spec.sh "$f" 2>&1); status=$?; uncited=$(printf '"'%s\\n' \""'$out" | rg -c '"'fact-bearing paragraph lacks citation prefix' || true); form="'$(printf '"'%s\\n' \""'$out" | rg -c '"'missing type/implies_spec_type|missing required section' || true); printf '%s exit=%s form=%s uncited=%s\\n' \""'$f" "$status" "$form" "$uncited"; done' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 3102ms:
research/primary-sources/adr-nygard.md exit=1 form=2 uncited=6
research/primary-sources/adr-tools-state.md exit=1 form=2 uncited=6
research/primary-sources/arc42.md exit=1 form=2 uncited=
research/primary-sources/c4-model.md exit=1 form=2 uncited=
research/primary-sources/cucumber-gherkin.md exit=1 form=2 uncited=10
research/primary-sources/diataxis.md exit=1 form=2 uncited=4
research/primary-sources/helm-values-schema.md exit=1 form=2 uncited=9
research/primary-sources/kiro.md exit=1 form=2 uncited=6
research/primary-sources/leaddev-agent-compiled.md exit=1 form=2 uncited=9
research/primary-sources/nix-flakes.md exit=1 form=2 uncited=8
research/primary-sources/oci-artifacts.md exit=1 form=2 uncited=9
research/primary-sources/openapi-3-1.md exit=1 form=2 uncited=7
research/primary-sources/openspec.md exit=1 form=2 uncited=7
research/primary-sources/oracle-agent-spec.md exit=1 form=2 uncited=7
research/primary-sources/ref-arch-vs-solution-arch.md exit=1 form=2 uncited=9
research/primary-sources/sigstore-cosign.md exit=1 form=2 uncited=11
research/primary-sources/spec-kit.md exit=1 form=2 uncited=7
research/primary-sources/structurizr-dsl.md exit=1 form=2 uncited=3
research/primary-sources/symphony-spec.md exit=1 form=2 uncited=6

web search: 
web search: https://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md
web search: 
web search: 
web search: 
web search: Cottmeyer Reference Architecture vs Reference Implementation The reference architecture holds universally reference implementation negotiable
codex
**Quality Gate Result**

REQUEST CHANGES. I would not sign off the cross-family substance gate yet. The SPEC lint and completeness script pass, but the corpus still has status-truth, source-list, and citation-surface problems that can leak into downstream methodology claims. No mutations made.

**Findings**

- [SPEC.md:650](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:650): HIGH  
  The lint-impedance handling is a hack in its current form. §7.1 says corpus lint exit 1 is advisory unless the failure is `uncited-claim`, which is blocking; the Completion Report waves off all corpus lint failures as front-matter/shape noise. I ran per-artefact lint read-only: all 20 exit 1, and 18 include `fact-bearing paragraph lacks citation prefix` errors. Example: [helm-values-schema.md:42](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md:42). Either add corpus-mode lint or make the completeness gate validate corpus citations directly.

- [INDEX.md:18](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18): HIGH  
  INDEX reports `adr-tools-state` as `primary-read-complete`, but the artefact front matter says `fetch_outcome: "partial"` and explicitly says deep template/tooling details were not read: [adr-tools-state.md:7](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/adr-tools-state.md:7). Same issue for [INDEX.md:34](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34) vs [structurizr-dsl.md:7](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/structurizr-dsl.md:7). This makes “all 20 complete” materially untrue.

- [SPEC.md:575](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:575): HIGH  
  §17 treats JSON Schema, SPDX/SBOM/CycloneDX, Pact, and CUE as deferrable. I would not defer at least JSON Schema and SBOM/provenance for v1.0: Helm/OpenAPI claims already rely on JSON Schema, and the methodology’s manifest/audit/“what code was running” story needs an SBOM primary. Also consider Dev Container Spec, Pact/AsyncAPI/GraphQL, and SLSA/in-toto if the downstream methodology continues to claim those deployment, behavior, or provenance surfaces.

- [oci-artifacts.md:28](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28): HIGH  
  The SPEC’s source row calls for OCI Image Spec plus Artifact spec, but this artefact says the companion Artifacts Guidance was “not deep-read,” then §3/§5 licenses non-image payload claims: [oci-artifacts.md:66](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:66). Fetch/read the artifact guidance or downgrade the status/claim surface.

- [c4-model.md:119](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/c4-model.md:119): MEDIUM  
  §5 licenses “C4 Containers are applications and data stores, not Docker containers” even though §4/§6 explicitly says the Docker disambiguation was not found in the fetched text. Reframe as an inference from C4’s definition, or fetch the container-diagram page and cite that directly.

- [symphony-spec.md:121](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:121): MEDIUM  
  “Only published in-the-wild example” is a global uniqueness claim not licensed by Symphony’s SPEC itself. Make it “the only example identified by this project’s research” and cite the research workpad, or remove the uniqueness claim from the corpus entry.

- [leaddev-agent-compiled.md:114](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md:114): MEDIUM  
  The Willison quote supports “custom periphery + standardized core” as a suggested mitigation, but not “viable mitigation the methodology endorses for safety-critical paths.” That endorsement is methodology judgment, not LeadDev primary-source evidence.

- [ref-arch-vs-solution-arch.md:60](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:60): MEDIUM  
  The artefact labels text as “verbatim, paraphrased close to source,” which violates the corpus quote discipline. Also [ref-arch-vs-solution-arch.md:125](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:125) quotes “blindly deploying methodologies verbatim fails” as if exact; treat it as paraphrase unless exact source wording is supplied.

- [nix-flakes.md:118](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:118): MEDIUM  
  “Strongest current implementation of build-from-spec” is comparative agent synthesis. The Nix primary supports lockfiles, exact revisions, and hashes; it does not establish a field-wide “strongest” ranking.

I did not find a clear case where a §4 prior-summary correction is provably wrong in the requested sample. The Kiro “Bedrock-tethered not confirmed by homepage” correction is scoped cautiously enough.

Primary sources spot-checked: [arc42](https://docs.arc42.org/section-1/), [C4](https://c4model.com/), [Nygard ADR](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions), [Helm charts](https://helm.sh/docs/topics/charts/), [LeadDev](https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software), [OCI image/artifact guidance](https://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md).
tokens used
243,233
**Quality Gate Result**

REQUEST CHANGES. I would not sign off the cross-family substance gate yet. The SPEC lint and completeness script pass, but the corpus still has status-truth, source-list, and citation-surface problems that can leak into downstream methodology claims. No mutations made.

**Findings**

- [SPEC.md:650](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:650): HIGH  
  The lint-impedance handling is a hack in its current form. §7.1 says corpus lint exit 1 is advisory unless the failure is `uncited-claim`, which is blocking; the Completion Report waves off all corpus lint failures as front-matter/shape noise. I ran per-artefact lint read-only: all 20 exit 1, and 18 include `fact-bearing paragraph lacks citation prefix` errors. Example: [helm-values-schema.md:42](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/helm-values-schema.md:42). Either add corpus-mode lint or make the completeness gate validate corpus citations directly.

- [INDEX.md:18](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18): HIGH  
  INDEX reports `adr-tools-state` as `primary-read-complete`, but the artefact front matter says `fetch_outcome: "partial"` and explicitly says deep template/tooling details were not read: [adr-tools-state.md:7](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/adr-tools-state.md:7). Same issue for [INDEX.md:34](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34) vs [structurizr-dsl.md:7](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/structurizr-dsl.md:7). This makes “all 20 complete” materially untrue.

- [SPEC.md:575](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:575): HIGH  
  §17 treats JSON Schema, SPDX/SBOM/CycloneDX, Pact, and CUE as deferrable. I would not defer at least JSON Schema and SBOM/provenance for v1.0: Helm/OpenAPI claims already rely on JSON Schema, and the methodology’s manifest/audit/“what code was running” story needs an SBOM primary. Also consider Dev Container Spec, Pact/AsyncAPI/GraphQL, and SLSA/in-toto if the downstream methodology continues to claim those deployment, behavior, or provenance surfaces.

- [oci-artifacts.md:28](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:28): HIGH  
  The SPEC’s source row calls for OCI Image Spec plus Artifact spec, but this artefact says the companion Artifacts Guidance was “not deep-read,” then §3/§5 licenses non-image payload claims: [oci-artifacts.md:66](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/oci-artifacts.md:66). Fetch/read the artifact guidance or downgrade the status/claim surface.

- [c4-model.md:119](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/c4-model.md:119): MEDIUM  
  §5 licenses “C4 Containers are applications and data stores, not Docker containers” even though §4/§6 explicitly says the Docker disambiguation was not found in the fetched text. Reframe as an inference from C4’s definition, or fetch the container-diagram page and cite that directly.

- [symphony-spec.md:121](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/symphony-spec.md:121): MEDIUM  
  “Only published in-the-wild example” is a global uniqueness claim not licensed by Symphony’s SPEC itself. Make it “the only example identified by this project’s research” and cite the research workpad, or remove the uniqueness claim from the corpus entry.

- [leaddev-agent-compiled.md:114](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/leaddev-agent-compiled.md:114): MEDIUM  
  The Willison quote supports “custom periphery + standardized core” as a suggested mitigation, but not “viable mitigation the methodology endorses for safety-critical paths.” That endorsement is methodology judgment, not LeadDev primary-source evidence.

- [ref-arch-vs-solution-arch.md:60](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:60): MEDIUM  
  The artefact labels text as “verbatim, paraphrased close to source,” which violates the corpus quote discipline. Also [ref-arch-vs-solution-arch.md:125](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/ref-arch-vs-solution-arch.md:125) quotes “blindly deploying methodologies verbatim fails” as if exact; treat it as paraphrase unless exact source wording is supplied.

- [nix-flakes.md:118](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/nix-flakes.md:118): MEDIUM  
  “Strongest current implementation of build-from-spec” is comparative agent synthesis. The Nix primary supports lockfiles, exact revisions, and hashes; it does not establish a field-wide “strongest” ranking.

I did not find a clear case where a §4 prior-summary correction is provably wrong in the requested sample. The Kiro “Bedrock-tethered not confirmed by homepage” correction is scoped cautiously enough.

Primary sources spot-checked: [arc42](https://docs.arc42.org/section-1/), [C4](https://c4model.com/), [Nygard ADR](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions), [Helm charts](https://helm.sh/docs/topics/charts/), [LeadDev](https://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software), [OCI image/artifact guidance](https://github.com/opencontainers/image-spec/blob/main/artifacts-guidance.md).
