# SPEC.schema.md — Shared schema for BES specs

Status: v1
Authority: `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§6.1, §8, §10.

This document is the single source of truth for cross-template
conventions used by IDEA.md and SPEC.md (the unified
`SPEC.template.md` with task / contract / decision flavours, plus
`SPEC.fastpath.template.md`). The SPEC and IDEA templates reference
this schema instead of duplicating it.

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
| `brainstormed_by` | string | REQUIRED | agent identifier | e.g. `copilot-gpt-5.6-sol`, `claude-opus-5-1m`, or any other model:lane label |
| `brainstormed_on` | date | REQUIRED | ISO-8601 date | e.g. `2026-05-01` |
| `implies_spec_type` | enum | OPTIONAL | `task` \| `contract` \| `decision` | informational only post-WS-SPEC-lean; all specs use the one unified `SPEC.template.md` |

Literal example: the front-matter block of
`agents/specs/IDEA.template.md` (the file authors copy from).

### 1.2 SPEC.md front-matter (shared across all three types)

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `<YYYY-MM-DD>-<topic>` | folder name MUST equal id |
| `status` | enum | REQUIRED | `draft` \| `needs-revision` \| `owner-blocking` \| `approved-pending-owner` \| `approved` \| `decomposed` \| `in-execution` \| `verified` \| `closed` \| `superseded` | state machine; only owner sets `approved`, `decomposed`, `superseded`, and `closed` |
| `type` | enum | OPTIONAL | `task` \| `contract` \| `decision` \| `fastpath` | informational post-lean; flavours which OPTIONAL sections apply — all specs use the unified `SPEC.template.md` (fastpath uses `SPEC.fastpath.template.md`) |
| `owner` | string | REQUIRED | owner identifier | |
| `repo` | string | REQUIRED | repo name | e.g. `bes-fleet-policy` |
| `branch_policy` | enum | REQUIRED | `worktree-preferred` \| `main-direct` | matches OPERATING_MODEL Workspace Policy |
| `risk` | enum | REQUIRED | `low` \| `medium` \| `high` | |
| `requires_network` | boolean | REQUIRED | `true` \| `false` | |
| `requires_secrets` | list[string] | REQUIRED | env-var names or `[]` | |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands | non-empty OR explicitly `[]` with reason in Acceptance Criteria section; `type: fastpath` MAY use `[]` with the checks inline in the fastpath §4 Acceptance-commands section |
| `ideated_in` | string | REQUIRED | repo-relative path, `no-decision`, OR `null` | path to producing IDEA.md. `null` is valid for `type: fastpath` and for a SPEC declaring `capture_after`. **`no-decision`** records that the ideation conversation happened and yielded no decision — no approach chosen among alternatives, no owner-blocking question resolved — so no artefact was filed (`file://agents/OPERATING_MODEL.md` Required Work Model step 2). Added 2026-07-24: conditional IDEA otherwise had no honest encoding, and the only way to lint clean was to falsely declare `capture_after`. A rule that forces a false declaration is worse than the ceremony it replaced. |
| `capture_after` | string | OPTIONAL | `owner://<ref>` | REQUIRED to use `ideated_in: null` on a non-fastpath SPEC. Declares that the work landed BEFORE the SPEC was filed under an explicit owner directive, per `file://agents/OPERATING_MODEL.md` "Capture-after" — so no IDEA ever existed. MUST match `owner://<ref>` with a non-empty reference starting alphanumeric — never a bare `true` and never a bare scheme: capture-after requires an *explicit* owner directive, and an unattributable flag would let an agent self-authorise skipping the IDEA phase. |
| `tracker_ref` | string | CONDITIONAL | a `https://github.com/<owner>/<repo>/issues/<n>` URL, or the literal `pending` | REQUIRED when the SPEC is a **tracked bundle** — manifest-carried AND expanding to ≥2 tracked units, OR >3 Execution Plan slices, OR owner-directed (`file://agents/OPERATING_MODEL.md` "Work visibility"). Points at the parent tracker issue. `pending` is the legal degraded value written when `gh` is unreachable; the drift audit reports it and nothing gates on it. Any other non-URL value is an error. Forward-only: the owner-sealed exemption below covers this field too, so no landed SPEC is edited to satisfy it. Restored 2026-07-26 (`file://specs/2026-07-26-agent-work-tracking-surface/SPEC.md`) after `3ab9f6c` removed it as ceremony — its absence left agents with nowhere to record work state but memory. |
| — | — | — | — | **Owner-sealed exemption.** At `status: approved`, `decomposed`, `closed` or `superseded`, `lint-spec.sh` skips the `ideated_in` / `capture_after` advisories entirely. Those four are owner-only flips (§1.3), so an agent cannot self-exempt; everything pre-seal is fully checked. Rationale: a landed record MUST NOT be edited to satisfy a rule introduced after it (`file://agents/OPERATING_MODEL.md` "Capture-after"), so warning about it forever is noise that teaches readers to ignore lint. |
| `superseded_by` | string | OPTIONAL | spec id or citation-grammar string | REQUIRED at `status: superseded` unless the superseding authority is stated in the spec body (a commit message alone is NOT sufficient); empty string invalid |

Literal example: the front-matter block of
`agents/specs/SPEC.template.md` (the file authors copy from).

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
`review-spec` skill MUST NOT set `approved`. The
`decompose-approved-spec` skill MUST NOT set `decomposed`. The
`spec-evidence` skill MUST NOT set `closed`. Skills MAY set
`approved-pending-owner` on a clean gate result.

**Capture-after exception (owner-only).** A Task, Contract, or
Decision SPEC MAY land directly at `status: verified` in the same
change-set as the work it specifies, when the work was implemented
before the SPEC was authored under explicit owner directive
(`owner://transcript-<date>`). The per-type quality gate
(`review-spec`) and citation grammar remain REQUIRED; only the
temporal precedence of SPEC-before-work is waived
(`file://specs/2026-05-15-inbox-channel-and-skill-references-pattern/SPEC.md`;
extended from Contract/Decision to Task per
`file://specs/2026-07-10-fleet-policy-hygiene-sweep/SPEC.md`,
owner-directed — `owner://transcript-2026-07-10` "Codify practice in
schema"). Capture-after is an exception path; routine work follows the
normal lifecycle so the BLOCKING review gate runs before approval.

**Fastpath carve-out (owner-only).** A `type: fastpath` SPEC
(`file://agents/specs/SPEC.fastpath.template.md`) MAY land directly at
`status: closed` in the same commit as the work it records, WITHOUT the
IDEA / blocking-review / decomposition / cross-validation phases, when
ALL fastpath thresholds hold (≤ 5 files, ≤ 300 lines, one component, no manifest-carried touch points, no
public-contract or persisted-state impact, reversible in one commit)
AND an explicit owner directive authorises it (cited in the fastpath
§3). That owner directive supplies the owner action the `closed` flip
requires; the inline commit message is the approval. Fastpath is the
ONLY path that lands at `closed` without first traversing `verified`;
if any threshold fails, escalate to Task/Contract/Decision. (Codified
per `file://specs/2026-07-10-fleet-policy-hygiene-sweep/SPEC.md`,
`owner://transcript-2026-07-10`.)

### 1.4 TASK.md front-matter

TASK.md is the per-slice executable artefact emitted by the
`decompose-approved-spec` skill from an approved SPEC's
Execution Plan. TASK.md is the dispatchable unit, executed directly
by agents; the parent SPEC remains the immutable execution
authority — TASK.md files are NOT peer authorities.

| Field | Type | Required | Allowed values | Notes |
|---|---|---|---|---|
| `id` | string | REQUIRED | `T-NN-<kebab-case-slug>` | unique within parent SPEC's `tasks/` directory |
| `parent_spec` | string | REQUIRED | a SPEC `id` at status `approved`, `decomposed`, `in-execution`, or `verified` | |
| `status` | enum | REQUIRED | `todo` \| `in-progress` \| `in-review` \| `done` \| `blocked` | lifecycle states; only owner sets `done`. **A closed tracker issue does NOT imply `done`.** They are distinct records: a merged PR may auto-close a slice sub-issue via `Closes #N` (a merged PR is external evidence, not an agent's claim) and that moves this field to `in-review` only — the owner still flips `done`. The parent tracker issue is never auto-closed (`file://specs/2026-07-26-agent-work-tracking-surface/SPEC.md` §7.4). |
| `tracker_ref` | string | OPTIONAL | issue URL, or `pending` | the slice sub-issue under the parent SPEC's tracker issue. Absent when the parent bundle is untracked. |
| `owner` | string | REQUIRED | agent id or `unassigned` | |
| `model_route` | string | REQUIRED | model slug from `agents/MODEL_ROUTING.md` Copilot or Claude routing | primary execution lane |
| `cross_validation_lane` | string | CONDITIONAL | model slug; MUST be from a different family than `model_route` | independent diff/artefact reviewer. **REQUIRED only on Rule-20 guardrail work** (a TASK whose touch points include manifest-carried paths); OPTIONAL elsewhere. Scoped 2026-07-24 (owner-directed): it was REQUIRED on every TASK, so ordinary repo-local slices paid for a cross-family reviewer that Rule 20 never asked for. Rule 20 itself is unchanged — see `file://agents/MODEL_ROUTING.md` Rule 20. |
| `verification_lane` | string | REQUIRED | model slug | MAY equal `model_route` for mechanical verification; SHOULD differ for behavioral verification |
| `mode` | enum | REQUIRED | `HITL` \| `AFK` | AFK requires bounded ownership and explicit acceptance |
| `deps` | list[string] | REQUIRED | TASK ids that MUST reach `done` first; `[]` allowed | |
| `write_scope` | enum | REQUIRED | `none` \| `disjoint` \| `overlap` | parallel writes require `disjoint` |
| `acceptance_commands` | list[string] | REQUIRED | runnable commands or `[]` with reason in §5 | subset of parent SPEC's plus task-local checks |

TASK.md status state machine:

```text
todo ──► in-progress ──► in-review ──► <owner sets done>
   │                          ▲
   ▼                          │
blocked ──── unblock ─────────┘
```

Idempotency: `done` is monotonic and owner-set. `blocked` is the
only reverse edge from `in-progress`.

Cross-validation gate (Rule-20 guardrail slices only; skip when the slice
declares no `cross_validation_lane`): `in-progress → in-review` requires findings
from `cross_validation_lane` to be addressed (or explicit
justified pushback) per `agents/skills/review-diff/SKILL.md` and
`agents/skills/review-spec/SKILL.md`. The review artifact itself
MUST carry the Tool-Receipt Block (canonical definition:
`agents/skills/review-diff/SKILL.md`); an artifact without receipts
is INVALID for this gate — treated as not-run
(`specs/2026-07-01-cross-val-tool-receipts/SPEC.md`).

Integration gate: when ALL TASK.md in a parent SPEC's `tasks/`
directory reach `done`, the parent SPEC MAY flip
`decomposed → in-execution → verified` after running the parent's
full `acceptance_commands`. The parent SPEC's §6 Completion
Report aggregates per-task evidence.

## 2. Evidence gate

The evidence gate is SECTION-LEVEL
(`file://specs/2026-07-01-ws-spec-system-lean/SPEC.md`):
`lint-spec.sh` requires that every evidence-bearing section
(Authority Map, Current System Facts, Substance Citations,
Code/Docs Reality Check, Decision Criteria, Candidate Options)
carries at least one SOURCE TOKEN. Memory and training are NOT
citable evidence (per OPERATING_MODEL Memory Policy). Enforcement
is RETAINED — it is not downgraded to convention.

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
(e.g. `file:///tmp/refs/external-source.md`).

### 2.2 What constitutes a citable claim

A *citable claim* is any statement of fact, constraint, decision,
behavior, or requirement that an executor or verifier MUST rely on
(counts, file paths, owner directives, behavioral requirements,
design decisions).

### 2.3 What does NOT require citation

Section headers and document structure, editorial framing and
transitions, restatements of an already-cited claim, definitions
internal to the spec, internal cross-references ("see §7.6"),
pseudocode, and declared domain-model fields.

### 2.4 Examples

Worked per-claim examples were retired with the per-claim lint
(`file://specs/2026-07-01-ws-spec-system-lean/SPEC.md`); any closed
spec under `specs/` is a live example.

### 2.5 Suppression escape hatch

Where the lint flags an evidence-bearing section that is in fact
editorial, the author MAY place the HTML comment
`<!-- lint-ok: no-citation -->` anywhere in that section; it
silences that SECTION's evidence audit. Suppression SHALL be
sparing; pervasive suppression is itself a quality signal and
SHOULD be raised in spec review.

## 3. RFC 2119 usage

RFC 2119 keywords carry normative force wherever they appear
UPPERCASE; lowercase variants are ordinary English — there is no
per-section scoping (`file://specs/2026-07-01-ws-spec-system-lean/SPEC.md`).
A `## Normative Language` preamble is OPTIONAL (RECOMMENDED for
specs that lean heavily on normative keywords).

## 4. Section naming conventions

- Top-level sections: `## N. Title` with Arabic numerals;
  sub-sections `### N.M Title`.
- Front-matter `id` MUST equal the spec folder name.
- Spec id format: `<YYYY-MM-DD>-<kebab-case-topic>`. Pre-schema specs
  authored before this format (the `2026-04-29-*` set and `BES-CP-*`)
  are grandfathered un-migrated as historical record per
  `file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
  §21.1; they are exempt from the id==folder and `branch_policy`-enum
  rules and MUST NOT be retro-fitted.
- `lint-spec.sh` enforces presence of `Problem`, `Acceptance
  Criteria`, and `Completion Report` (`Recommendation` for IDEA;
  `Problem` + `Completion Report` for fastpath). Other section
  names follow the templates.

## 5. Quality-gate handoff to `review-spec`

The review gate is the `review-spec` skill (BLOCKING) — see
`agents/skills/review-spec/SKILL.md` and
`agents/workflows/review-spec.md`. It MUST NOT set
`status: approved` (owner-only; §1.3).

## 6. Cross-references

- Templates: `agents/specs/SPEC.template.md` (unified),
  `agents/specs/SPEC.fastpath.template.md`,
  `agents/specs/IDEA.template.md`.
- Lint script: `agents/scripts/lint-spec.sh`.
- Authoring workflow: `agents/workflows/idea-capture.md`,
  `agents/workflows/author-spec.md`.
- Review workflow: `agents/workflows/review-spec.md`.
- Skills: `agents/skills/author-spec/SKILL.md`,
  `agents/skills/spec-driven-development/SKILL.md`,
  `agents/skills/review-spec/SKILL.md`.
- Authority spec: `specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`.
