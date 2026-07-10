---
name: spec-authoring
description: "Use when capturing an IDEA (/idea-capture) or authoring a SPEC.md (/author-spec) under the BES spec-first model. Owns templates, type selection (fastpath / task / contract / decision), shared schema, citation discipline, IDEA-conversation tactics. Hands off to spec-review for the BLOCKING gate. Do not use to review existing specs (spec-review) or implement approved specs (implementation-execution)."
license: internal-only
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls:
      - https://github.com/mattpocock/skills
    borrowed_from:
      - mattpocock/skills
    upstream_status: not-applicable
    last_audited: 2026-07-08
    audit_cadence: annual
    adoption_status: bes-native
    security_review: not-required
    notes: "BES fleet-native spec-authoring procedure. Additionally incorporates externally-adapted questioning patterns absorbed from the Matt Pocock skills collection: (1) the +docs grill layer (body 'The +docs Layer') absorbed 2026-06-30; (2) the facts-vs-decisions split and the shared-understanding comprehension checkpoint added 2026-07-08 from the productivity/grilling primitive @ d574778 (v1.1.0). No new executable or tool surface is added by these prose patterns, so security_review remains not-required. Adoption records: specs/2026-05-05-ai-engineering-tactical-skill-adoption, specs/2026-06-30-lean-skill-consolidation, specs/2026-07-08-pocock-v1.1-alignment-rebaseline."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Spec Authoring

Use this skill to produce IDEA.md and SPEC.md artefacts that pass the
per-type quality gates defined in the inaugural BES spec-authoring
procedure.

This skill does NOT approve specs. After authoring, it hands off to
`spec-review`, which runs the blocking gate and either returns
`approved-pending-owner` or `needs-revision`. Owner alone sets
`approved`.

## When to Use

- The owner has finished an ideation conversation and asks for an
  IDEA artefact captured under `/idea-capture <slug>`.
- An IDEA.md exists with `status: ready-for-spec` and the owner asks
  for a SPEC under `/author-spec`.
- Before hand-writing IDEA.md or SPEC.md content; this skill is the
  authority for which template, which sections, and which citations
  are REQUIRED.
- When picking a spec type for non-trivial work and the choice
  between Task, Contract, and Decision is not obvious.

Do not use this skill for:

- Trivial spec edits (typo fixes, link updates) — edit directly.
- Reviewing a spec already authored — use `spec-review`.
- Implementing an approved spec — use `implementation-execution`.

## Grill Before IDEA

For non-trivial IDEA capture, sharpen the owner conversation before
writing the artefact:

1. **Facts vs. decisions.** Split each open question before asking the
   owner anything: if the answer *can be found by exploring the codebase
   or docs*, it is a **fact** — look it up yourself, do not ask. If it is
   the owner's call — a trade-off, a scope boundary, a preference the code
   cannot reveal — it is a **decision**; put it to the owner and wait for
   the answer (step 2 carries the one-at-a-time pacing). Never spend an
   owner turn on a fact you could have grepped.
2. Ask one owner question at a time.
3. Prefer concrete trade-offs over broad methodology debate.
4. When the design space is ambiguous, present 2-3 viable approaches
   with fit, cost, and risk.
5. Recommend one approach only after the constraints are clear.
6. Capture owner validation as verbatim `owner://transcript-<date>`
   quotes in IDEA.md.
7. Batch disposition is valid: once the candidate space is fully
   articulated, a SINGLE binding owner directive MAY resolve
   multiple open questions at once — capture the verbatim once and
   cite it per resolved item
   (`file://specs/2026-05-18-agentic-installation-methodology/SPEC.md` §14.5).

Do not let grilling become a new approval gate. It is a clarification
tactic that feeds the existing IDEA -> SPEC procedure.

Confirm shared understanding before drafting: do not begin writing the
IDEA/SPEC artefact until the owner confirms you have reached a shared
understanding of the design. This is a **comprehension checkpoint, not an
approval** — approval remains the owner-only `approved` status flip
(`file://agents/specs/SPEC.schema.md` §1.3); it adds no status and asks no
"do you approve?". It only prevents authoring a well-formed artefact on a
misread of intent. (The facts-vs-decisions split above and this
comprehension checkpoint were adapted 2026-07-08 from `mattpocock/skills`
`skills/productivity/grilling` @ `d574778` (v1.1.0) per
`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md` §11 T3 —
the primitive our 2026-06-30 +docs absorption did not reach.)

### The +docs Layer: Structured Options Cited To Docs

When a grill question has two-or-more viable design paths, use the
"Grill With Docs" pattern — an owner-affirmed augmentation of the grill
clause above (owner affirmation 2026-05-25,
`file://specs/2026-05-25-agent-engineering-craft-discipline/IDEA.md`
§2.3). For each such question:

1. **Run prior-art / research first** if the design space is unclear.
   Capture findings in IDEA §2 or a research-wave artefact.
2. **Frame the question with 2-4 mutually-exclusive options**
   (`AskUserQuestion` supports up to 4).
3. **Each option carries**: a short label (1-5 words); a description
   with the tradeoff named — including the downside, not just the
   upside; and a citation tag where applicable — e.g. "(framing N per
   §2.1 prior art)" or "(matches Wave 3 §2.2 finding)".
4. **Recommend one option** as the default by labeling it
   `(recommended)` — and put it first.
5. **Include "Not yet decided — explore the full surface first"** as an
   option when scope is genuinely open, so the owner can pre-empt
   narrowing.

Pattern hard rules:

- Do not grill on metadata you can decide yourself (slug names, dates,
  file paths). Grill on substantive design only.
- Do not ask "do you approve this?" — that is a confirmation, not a
  grill. Use the existing status-flip flow for approvals.
- Do not bury the recommendation. Put it first + label it
  `(recommended)`.
- Do not skip the docs citation. The owner affirmed the pattern's value
  specifically because the docs grounding lets them check the reasoning
  quickly.

## Reference Architecture First

When a public reference architecture exists for the SPEC's domain,
cite it in §3 Evidence / Authority and mirror its contract shape rather
than re-deriving its primitives. When adopting an external tool
that fits BES procedure (CLI, library, runner), follow the
six-part shape.

Procedure + historical worked examples:
[`references/reference-architecture.md`](references/reference-architecture.md).

## Templates

The authoring templates live at:

- `agents/specs/IDEA.template.md` — the IDEA artefact.
- `agents/specs/SPEC.template.md` — the ONE unified spec format
  (WS-SPEC lean, 2026-07-01). Core sections are required; optional
  sections flex by flavour (task / contract / decision). `type` is
  informational and no longer selects a template.
- `agents/specs/SPEC.fastpath.template.md` — small, reversible,
  owner-directed work (capture-after; lands `closed`).

Cross-template conventions (front-matter schema, evidence gate, section
naming) live in `agents/specs/SPEC.schema.md`.
Templates reference that schema rather than restating it. Read the
schema before authoring.

Open Questions is OPTIONAL for every spec type: authors MAY omit the
heading entirely when empty, or keep it with only `None.` / `N/A`
(`file://specs/2026-05-17-ceremony-weight-refactor/SPEC.md` §7). If
non-empty, the normal per-section checks apply.

In `bes-fleet-policy`, the produced IDEA.md and SPEC.md live at
`specs/<spec_id>/`. In each child fleet repo (per the roster manifests
`agents/scripts/fleet-{internal,oss,local-only}-repos.txt`) they live
at `.agents/specs/<spec_id>/`. The workflow doc at
`agents/workflows/idea-capture.md` encodes this branch.

## Type Selection

All non-fastpath work uses the ONE unified
`agents/specs/SPEC.template.md`. Pick a `type` only to flavour which
OPTIONAL sections you keep; the IDEA's `implies_spec_type` (if set)
carries to the SPEC's `type`. It no longer selects a template.

Decision tree:

0. **Is this small, single-component, reversible work under
   explicit owner directive** meeting ALL of the fastpath
   thresholds carried by `SPEC.fastpath.template.md`?
   YES → `fastpath`. No IDEA, no review, no decomposition.
   Capture-after by default; lands at `status: closed` in the same
   commit as the work. **If ANY threshold is missed, do not use
   fastpath** — fall through to the steps below.
1. **Is this a binding choice between two or more named options
   (stack pick, architecture pick, vendor pick, policy pick)?**
   YES → set `type: decision`. Keep the Decision Criteria / Candidate
   Options / Trade-off / Decision Statement / Locks / Reversal sections
   of `SPEC.template.md`.
2. **Otherwise: does the work specify behavior that future agents
   implement against?** Signs: stateful (state machine, persistence,
   idempotency), multi-component (more than one skill/script/repo
   coordinates), defines a wire or file protocol, has a non-trivial
   failure surface, has observability requirements, will be referenced
   by other specs. YES → set `type: contract` and keep the
   contract-flavour optional sections of `SPEC.template.md` (Domain
   Model, Failure Model, Observability, Migration).
3. **Otherwise: this is concrete, scoped, verifiable work with a
   defined endpoint** (add a file, refactor a module, fix a bug, run
   a migration). → set `type: task` (the default). Use the core
   sections of `SPEC.template.md`; when in doubt and the work is small
   AND meets fastpath thresholds, prefer fastpath; otherwise, task.

Edge cases:

- Mixed Decision-and-implementation work: author the Decision spec
  first, then a follow-on Task or Contract spec for the
  implementation. Do not fold them into one artefact.
- "Refactor" that changes a public contract: this is a Contract spec,
  not a Task spec.
- Owner explicitly directs a type via `judgment://owner`: honour the
  directive; do not re-derive.

## §1 / §5 capture-after defer-shorthand

SPECs landing at `status: verified` via the capture-after exception
(`file://agents/specs/SPEC.schema.md` §1.3) MAY fill §1 Problem and
§5 Test / Validation with a one-paragraph cite-by-id defer to the
producing IDEA's corresponding section, e.g.
`See file://specs/<id>/IDEA.md §1 (capture-after defer).` The defer
MUST resolve to substantive IDEA content, not to another defer.
Validation mechanics live in
`file://agents/skills/spec-review/SKILL.md` "Contract capture-after
defer-shorthand check". For SPECs at any other status, §1 and §5
MUST be filled with substantive content; defer-shorthand is
rejected by the spec-review gate.

## Studio Principles

Studio-level principles (binding tenets that cross every BES
product) are authored as Decision SPECs under the
`studio-principle-<topic>` slug taxonomy.

Conventions, cascade-by-id-citation mechanics, and the
verbatim-to-normative review trace:
[`references/studio-principles.md`](references/studio-principles.md).

## Citation Discipline

Every evidence-bearing section in IDEA.md and SPEC.md MUST carry at
least one source token — a citation prefix (`file://`, `cmd://`,
`url://`, `owner://`, `judgment://owner`, `judgment://agent-synthesis`;
RECOMMENDED), a bare URL, a backticked `path`/command, or a ≥25-char
verbatim/owner quote. The full grammar, positive and negative examples,
and the list of constructs that do NOT require a source token (section
headers, editorial framing, internal definitions, internal
cross-references, pseudocode, domain-model field references) live in
`file://agents/specs/SPEC.schema.md` §2.

Operating principle: agent memory and training are LEGITIMATE INPUTS
to the ideation conversation and to your authoring reasoning. They
are NOT citable evidence in the artefact. This is the input-vs-
artefact distinction recorded in `agents/OPERATING_MODEL.md` Memory
Policy. If you cannot back a claim with `file://`, `cmd://`,
`url://`, or an owner-affirmed judgment, the claim does not belong
in the artefact.

When the lint flags a sentence that is in fact editorial, append
`<!-- lint-ok: no-citation -->` per
`file://agents/specs/SPEC.schema.md` §2.5. Use sparingly; pervasive
suppression is itself a quality signal.

Practice rules:

- PERSIST load-bearing scratch outputs (workflow results, probe
  logs) into `specs/<id>/` BEFORE citing them as `file://`
  authority — session-scratch paths are unrecoverable once the
  session is gone
  (`file://specs/2026-07-01-propagation-machinery-fixes/SPEC_EVIDENCE.md` SE-6).
- Before any §-anchor sweep, classify every hit as a live-template
  reference (drift — remap) or a cross-doc citation to a specific
  spec's own numbering (legitimate — keep), and sweep by DIRECTORY,
  not enumerated file lists
  (`file://specs/2026-07-01-leandown-doc-reconciliation/SPEC_EVIDENCE.md` SE-2 + SE-5).

## Quality Gate Handoff

This skill MUST NOT set `status: approved` on any artefact.
Authority for approval rests with the owner alone, per
`file://agents/specs/SPEC.schema.md` §1.3 and
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md`
§7.6.

After authoring:

1. Set IDEA.md or SPEC.md `status: draft`.
2. Hand off to `spec-review`. For IDEA.md the gate is §10.1 of the
   authority spec; for SPEC.md it is §10.2 (task), §10.3 (contract),
   or §10.4 (decision).
3. `spec-review` runs `lint-spec.sh` (REQUIRED for Contract,
   RECOMMENDED for Task and Decision) and produces a structured
   Quality Gate Result.
4. On a clean pass, `spec-review` sets `status: approved-pending-owner`
   (SPEC) or `status: ready-for-spec` (IDEA). On any blocking
   failure, `spec-review` sets `status: needs-revision` (SPEC) or
   leaves `status: draft` (IDEA) and surfaces failures with file:line
   citations.
5. Owner reviews the gate result and the artefact. Owner alone
   transitions SPEC.md to `status: approved`.

If `spec-review` returns `needs-revision`, return to this skill: read
the failures, revise the artefact, re-hand-off. Do not silently
escalate failures to `owner-blocking`; that status is for unresolved
Open Questions, not for gate failures.

## Acceptance-Command Authoring

- Acceptance commands MUST be satisfiable at execution time —
  commands that read COMMIT state (`git grep` on not-yet-tracked
  files, `git diff --quiet` on regenerated lockfiles with embedded
  timestamps) only pass post-commit. Use `git grep --untracked`,
  compare generated entries excluding metadata, or note the
  commit-state dependency explicitly in the Test Plan
  (`file://specs/2026-06-09-mutation-probe-isolation-discipline/SPEC_EVIDENCE.md` SE2).
- A SPEC that changes a schema enum or an owner-only status class
  MUST include an enumerate-consumers step in its Execution Plan:
  `rg` the exact list literal across `agents/` and `.claude/` and
  paste the hit list into the SPEC before execution
  (`file://specs/2026-06-09-superseded-terminal-status/SPEC_EVIDENCE.md` SE1).
- A schema relaxation that REMOVES a required entry MUST include a
  full type-corpus re-lint as an acceptance step (every existing
  artefact of that type re-linted clean), per
  `file://specs/2026-05-17-ceremony-weight-refactor-execute/SPEC.md` §17.5 SE2.
- When single-sourcing a duplicated canonical list, grep by the
  list's VALUES (the member names), not only the expected identifier
  or filename
  (`file://specs/2026-06-30-fleet-roster-single-source/SPEC_EVIDENCE.md` SE-1).
- Prefer acceptance commands that test the structural INVARIANT over
  ones that pin owner-mutable membership VALUES; when values move on
  after verification, record the supersession in the SPEC (same
  file, SE-3).
- A criterion's PROSE must not assert more than its pinned command
  tests — encode the discriminating assertion in the command itself
  (same file, SE-4).
- For deletion/lean SPECs: re-verify cut ranges line-by-line against
  the LIVE file before cutting, not against the audit summary that
  nominated them
  (`file://specs/2026-06-30-lean-doc-ceremony-cut/SPEC_EVIDENCE.md` SE-1).

## Hard Rules

- Do not author IDEA.md or SPEC.md without reading
  `agents/specs/SPEC.schema.md` first.
- Do not use a SPEC template without first picking a type per the
  decision tree above.
- Do not put uncited factual claims in any artefact. Memory is
  input, not evidence.
- Do not set `status: approved`. The owner does that.
- Do not silently mix Decision and implementation work in one spec.
