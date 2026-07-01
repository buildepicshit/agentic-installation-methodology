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
| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `copilot-gpt-5.5`, `claude-opus-4-8-1m`, or any other model:lane label |
| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-05-01` |
| `implies_spec_type` | enum | OPTIONAL | `task` \| `contract` \| `decision` | informational only post-WS-SPEC-lean; all specs use the one unified `SPEC.template.md` |

Example:

```yaml
---
id: bes-spec-authoring-procedure-v1
spec_id: 2026-05-01-bes-spec-authoring-procedure-v1
status: ready-for-spec
owner: HasNoBeef
brainstormed_by: copilot-gpt-5.5  # or claude-opus-4-8-1m, etc. — any model:lane label
brainstormed_on: 2026-05-01
implies_spec_type: contract
---
```

### 1.2 SPEC.md front-matter (shared across all three types)

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` \| `superseded` | state machine; only owner sets `approved`, `decomposed`, `superseded`, and `closed` |
| `type` | enum | REQUIRED | `task` \| `contract` \| `decision` | determines which template was used |
| `owner` | string | REQUIRED | owner identifier | |
| `repo` | string | REQUIRED | repo name | e.g. `bes-fleet-policy` |
| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section |
| `ideated_in` | string | REQUIRED | repo-relative path | path to producing IDEA.md |
| `superseded_by` | string | OPTIONAL | spec id or citation-grammar string | REQUIRED at `status: superseded` unless the superseding authority is stated in the spec body (a commit message alone is NOT sufficient); empty string invalid |

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
                                  │           │ TASK.md set dispatched to agents;
                                  │           │ execution begins
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
                                  │
                                  │   side-exit (retired before execution):
                                  │   SPEC.approved │ SPEC.decomposed
                                  │           │
                                  │           │ owner sets status: superseded
                                  │           ▼
                                  │   SPEC.superseded  (terminal; no exit edges)
```

`superseded` is the owner-set terminal status for a spec retired
BEFORE execution — superseded by a later spec, a reset, or a
redesign. `in-execution` and later statuses deliberately have no
edge to `superseded`: a spec that began execution exits via
`verified → closed` or stays at its current status; retiring
mid-execution work is a separate owner decision outside this
status machine. On flip, `superseded_by` (§1.2) names the
superseding authority unless the spec body states it.

Idempotency: status transitions are monotonic except for the explicit
`needs-revision` and `owner-blocking` reverse edges. `approved`,
`decomposed`, `closed`, and `superseded` MUST NOT revert without owner action.
Owner alone sets `approved`, `decomposed`, `superseded`, and `closed`. The
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
Execution Plan (Task) or §11 / §14 / §15 (Contract). TASK.md is the
dispatchable unit and is executed directly by agents; no external
tracker (e.g. Linear) and no dispatcher (e.g. Symphony) is required —
the fleet has never run either, and neither is a precondition for
task creation. The parent SPEC remains the immutable execution
authority; TASK.md files are NOT peer authorities.

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | tracker-agnostic lifecycle states; only owner sets `done` |
| `owner` | string | REQUIRED | agent id or `unassigned` | |
| `model_route` | string | REQUIRED | model slug from `agents/MODEL_ROUTING.md` Copilot or Claude routing | primary execution lane |
| `cross_validation_lane` | string | REQUIRED | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer |
| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
| `parallelism_evaluated` | boolean | REQUIRED | `true` | MUST be `true`; records evaluation per `2026-05-04-agent-parallelism-and-model-routing-v2` §7.1 |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |
| `tracker_ref` | string \| null | OPTIONAL | external tracker id (e.g. `BES-123`) or absent | OPTIONAL — present only if an external tracker is in use; no tracker is required and none is run by default |

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

## 2. Evidence gate

WS-SPEC lean (2026-07-01, `file://specs/2026-07-01-ws-spec-system-lean/SPEC.md`):
the heavy per-claim six-prefix grammar + section-inheritance heuristic is
replaced by a lighter SECTION-LEVEL evidence gate. `lint-spec.sh` requires
that every evidence-bearing section (Authority Map, Current System Facts,
Substance Citations, Code/Docs Reality Check, Decision Criteria, Candidate
Options) carries at least one SOURCE TOKEN. Memory and training are NOT
citable evidence (per OPERATING_MODEL Memory Policy). Enforcement is
RETAINED — it is not downgraded to convention.

### 2.1 Accepted source tokens

Any of: a citation prefix (below), a bare URL, a backticked `path/file` or
command, or a ≥25-char verbatim / owner quote. Citation prefixes remain the
RECOMMENDED, most auditable form:

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
- **Restatements within a paragraph of an already-cited claim** —
  one citation at the source statement; subsequent references in the
  same paragraph or list inherit it.
- **Definitions internal to the spec** — when the spec defines a
  term, the definition does not need an external citation.
- **References to other sections of the same document** — "see §7.6"
  is not a claim.
- **Pseudocode and reference algorithms** — line-level pseudocode
  does not require per-line citation; the algorithm as a whole is
  authored synthesis.
- **Domain model field declarations** — once declared in the Domain
  Model section, downstream sections may reference fields without
  citation.

### 2.4 Examples

**Positive — citation REQUIRED:**

1. "The studio-root `/.agents/` is gitignored." → `cmd://git -C
   /var/home/hasnobeef/buildepicshit check-ignore -v .agents/`
   (output excerpt MUST follow).
2. "Owner directed local-only repo." → `owner://transcript-2026-05-01`
   (verbatim quote MUST follow).
3. "Symphony spec is 2169 lines." → `cmd://wc -l
   /tmp/ikto-refs/symphony-spec.md` (output MUST follow).
4. "OPERATING_MODEL was last updated 2026-04-29." →
   `file://agents/OPERATING_MODEL.md` (heading line citation
   acceptable).
5. "Three failure modes follow." → `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/IDEA.md`
   §1 (the producing IDEA.md is the source).

**Negative — citation NOT required:**

1. `## 6. Domain Model` — section header.
2. "The following entities are defined below." — editorial framing.
3. "An IDEA artefact has front-matter and a body." — internal
   definition.
4. "See §7.6 for the state machine." — internal cross-reference.
5. "The algorithm above iterates until convergence." — internal
   reference to in-document pseudocode.

### 2.5 Suppression escape hatch

Where the lint script flags a claim that is in fact an editorial
sentence, the author MAY append the HTML comment
`<!-- lint-ok: no-citation -->` to the offending line. Suppression
comments SHALL be sparing; pervasive suppression is itself a quality
signal and SHOULD be raised in spec review.

The companion marker `<!-- lint-ok: no-rfc -->` silences the lint's
lowercase-RFC-2119 warning for a single line; use this where a
lowercase keyword appears in unambiguously non-normative prose
(for example, a verbatim block-quote of an external source). Both
markers are line-local: `no-citation` applies to the paragraph
containing the marker, `no-rfc` applies to the line containing it.

## 3. RFC 2119 usage

WS-SPEC lean (2026-07-01): per-section scope enforcement is REMOVED. RFC
2119 keywords carry normative force wherever they appear UPPERCASE;
lowercase variants are ordinary English. `lint-spec.sh` no longer scopes
keywords to specific sections and no longer emits per-section RFC warnings.
A `## Normative Language` preamble is OPTIONAL (RECOMMENDED for specs that
lean heavily on normative keywords).

## 4. Section naming conventions

- Top-level sections: `## N. Title` with Arabic numerals.
- Sub-sections: `### N.M Title`.
- Sub-sub-sections (RECOMMENDED only when needed): `#### N.M.K Title`.
- Section titles in the shared skeleton MUST match verbatim across
  the three SPEC templates and IDEA template (e.g. "Authority Map"
  is identical wording wherever it appears).
- Front-matter `id` MUST equal the spec folder name.
- Spec id format: `<YYYY-MM-DD>-<kebab-case-topic>`.

### 4.1 Shared section skeleton

The following sections, when present, MUST have identical titles
across all spec types (Task / Contract / Decision):

- `## Normative Language` (preamble, RECOMMENDED in IDEA, REQUIRED in SPECs)
- `## Authority Map`
- `## Code/Docs Reality Check`
- `## Open Questions`
- `## Acceptance Criteria`
- `## Rollback Plan` (REQUIRED in Task, Contract; OPTIONAL in Decision)
- `## Completion Report`

Type-specific sections (e.g. Domain Model, State Specification,
Failure Model, Trade-off Comparison, Locks, Reversal Plan) appear
only in the templates that REQUIRE them; their titles are also
fixed across templates that include them.

## 5. Quality-gate handoff to `spec-review`

When `/review-spec` runs:

1. Reads front-matter `type`.
2. Selects the per-type quality gate
   (`task` → bar b, `contract` → bar c, `decision` → bar b + candidates).
3. Runs `lint-spec.sh` on the artefact (REQUIRED for `contract`,
   RECOMMENDED for `task` and `decision`).
4. Produces a structured Quality Gate Result with `pass`, `failures`
   (with `criterion`, `evidence`, `severity`).
5. Sets `status: needs-revision` on any blocking failure;
   `status: approved-pending-owner` on a clean pass.
6. Owner sets `status: approved` after reviewing the Quality Gate
   Result and the SPEC.

The `spec-review` skill MUST NOT set `status: approved`.

## 6. Cross-references

- Templates: `agents/specs/SPEC.template.md` (unified),
  `agents/specs/SPEC.fastpath.template.md`,
  `agents/specs/IDEA.template.md`.
- Lint script: `agents/scripts/lint-spec.sh`.
- Authoring workflow: `agents/workflows/idea-capture.md`,
  `agents/workflows/author-spec.md`.
- Review workflow: `agents/workflows/review-spec.md`.
- Skills: `agents/skills/spec-authoring/SKILL.md`,
  `agents/skills/spec-driven-development/SKILL.md`,
  `agents/skills/spec-review/SKILL.md`.
- Authority spec: `specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`.
