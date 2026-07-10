---
id: <YYYY-MM-DD>-<kebab-topic>
status: draft
type: task            # task | contract | decision  (optional; flavours OPTIONAL sections only)
owner: HasNoBeef
repo: <repo>
branch_policy: <worktree-preferred | main-direct>
risk: <low | medium | high>
requires_network: false
requires_secrets: []
acceptance_commands:
  - <command that mechanically proves the change; exit 0 = pass>
ideated_in: specs/<id>/IDEA.md
---

# SPEC: <Title>

> One flexible spec format (WS-SPEC lean, 2026-07-01). The CORE sections
> below are REQUIRED for every spec. All other sections are OPTIONAL —
> include the ones that carry weight for THIS change and delete the rest.
> `type` only flavours which optional sections are worth keeping; it no
> longer selects a template. For ≤1-file / ≤50-line / reversible /
> owner-directed work, use `SPEC.fastpath.template.md` instead.

<!-- ============================ CORE (required) ============================ -->

## 1. Problem

What is wrong / missing today and why it matters. Narrative context.

## 2. Goals / Non-Goals

- **Goals:** what this change delivers.
- **Non-Goals:** what it explicitly does NOT do (scope fence).

## 3. Evidence / Authority

The sourced facts this spec relies on. Each content-bearing claim here
carries a **source token** — a path, command, URL, or owner quote
(`file://…`, `cmd://…`, `url://…`, `owner://…`, a backticked `path/file`,
or a ≥25-char verbatim quote). This is the evidence gate `lint-spec.sh`
enforces at section granularity. (Name this "Authority Map",
"Current System Facts", or "Substance Citations" per taste.)

## 4. Acceptance Criteria

- [ ] AC-1: <verifiable outcome> — proven by `acceptance_commands[N]`.
- [ ] AC-N: …

Every AC pairs 1:1 with a check in §5. `acceptance_commands` in
front-matter are the machine proof.

## 5. Test / Validation

How each AC is verified — the exact commands (mirroring
`acceptance_commands`) and any manual checks.

## 6. Completion Report

Filled at execution: spec path and status, files changed, commands run
(with results), anything intentionally left untouched, residual risk,
spec-evidence candidates.

<!-- ========================= OPTIONAL (keep what helps) ==================== -->

## Normative Language <!-- optional -->

RFC 2119 keywords carry normative force when UPPERCASE (`SPEC.schema.md` §3).

## Reality Check · Interfaces / Files · Execution Plan · Rollback · Open Questions <!-- optional, task-flavour -->

Grounding, the files touched, the ordered plan, how to revert, and any
unresolved owner questions.

## Domain Model · Failure Model · Observability · Migration <!-- optional, contract-flavour -->

For stateful / multi-component / protocol work.

<!-- ===================== DECISION FLAVOUR (keep if type: decision) ========= -->

## Decision Criteria · Candidate Options · Trade-off Comparison <!-- decision -->

The criteria × candidates matrix (≥2 named options). RETAINED for decisions.

## Decision Statement <!-- decision -->

The binding choice, in RFC 2119 language.

## Locks · Reversal Plan <!-- decision -->

What the decision fixes, and how to reverse it.
