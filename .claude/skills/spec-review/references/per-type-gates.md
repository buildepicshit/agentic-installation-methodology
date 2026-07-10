# Per-Type Gate Criteria

Detailed criteria for each gate type. Authority:
`file://specs/2026-05-01-bes-spec-authoring-procedure-v1/SPEC.md` §10,
**as amended by the WS-SPEC lean-down**
(`file://specs/2026-07-01-ws-spec-system-lean/SPEC.md`): one unified
template, `type` OPTIONAL, no per-section RFC scope, "Contract-grade"
bar naming. Where this file diverges from the ORIGINAL 2026-05-01 text
because of that owner-approved lean-down, the lean-down governs; where
it diverges from the authority for any OTHER reason, the authority wins
and this file MUST be updated to match.

All criteria are **blocking** unless tagged `advisory`.

## IDEA gate (§10.1)

- All REQUIRED sections of the live `agents/specs/IDEA.template.md`
  present and non-empty (or explicit `N/A: <reason>`). The
  Normative Language preamble is OPTIONAL (SPEC.schema §3).
- Every evidence-bearing section carries at least one source token
  (a citation prefix — RECOMMENDED — or a bare URL / backticked
  `path`/command / ≥25-char quote) per SPEC.schema §2.
- Every Owner Judgment in §7 is attributed with a verbatim
  transcript quote.
- Every `judgment://agent-synthesis` claim is paired with owner-
  affirmation in transcript.
- Every Open Question is either resolved or explicitly marked
  `owner-blocking` (the latter blocks transition to
  `ready-for-spec`).
- `implies_spec_type` front-matter, IF set, is one of `task`,
  `contract`, or `decision` (OPTIONAL / informational post-lean per
  SPEC.schema §1.1; absence does not block the gate).
- RFC 2119 keywords used in the IDEA are uppercase. Lowercase
  variants in normative-feeling sentences are advisory (severity
  `advisory`).

## Task SPEC gate, bar (b) "verifiable" (§10.2)

- All REQUIRED core sections of the unified
  `agents/specs/SPEC.template.md` present and non-empty.
- Every external fact cites a source per SPEC.schema §2.
- Every entity in the Domain Model section has a full schema
  (type, nullability; example RECOMMENDED).
- All Acceptance Criteria are checkbox items; each is paired with
  a Test Plan entry.
- Front-matter `acceptance_commands` is non-empty, OR set to `[]`
  with an explicit reason in the Acceptance Criteria section.
- All Open Questions resolved or marked `owner-blocking` (latter
  blocks approval).
- RFC 2119 keywords uppercase.

## Contract SPEC gate, bar (c) "Contract-grade" (§10.3)

- All Task gate (bar b) criteria above, applied where they fit
  Contract sections. (The Normative Language preamble is OPTIONAL
  post-lean per SPEC.schema §3; uppercase RFC 2119 keywords carry
  force regardless.)
- Test and Validation Matrix is 1:1 with Acceptance Criteria — no
  orphan tests, no unverified criteria.
- Definition of Done checklist mirrors the Test Matrix.
- When behavior is stateful, a state machine is named with states,
  transitions, triggers, and idempotency rules.
- Pseudocode for non-trivial algorithms.
- Failure Model section present with failure classes and recovery
  behavior.
- Observability section present.
- Trust Boundary / Security section present.
- `agents/scripts/lint-spec.sh` exits 0 on this SPEC (exit 2 is
  advisory and does not block; exit 1 is blocking).

## Decision SPEC gate, bar (b) + candidate-comparison (§10.4)

- Task gate (bar b) criteria above, applied where they fit Decision
  sections.
- Candidate Options table has ≥ 2 candidates, each with all
  required fields (description, fit-with-substance,
  fit-with-constraints, cost, risk).
- Decision Criteria are sourced (substance citation or
  `judgment://owner`).
- Trade-off Comparison present.
- Decision Statement present, in RFC 2119 normative language.
  (Per SPEC.schema §3 there is no per-section RFC 2119 scoping —
  uppercase keywords carry force wherever they appear; the Decision
  Statement is simply where the binding normative clause is expected.)
- Locks section present (MAY state `no locks` with reason).
- Reversal Plan present (MAY state `irreversible: <reason>`).

### Studio-principle Decision SPECs — additional check

When the SPEC slug matches `studio-principle-*` (per
`file://agents/skills/spec-authoring/SKILL.md`), apply the
**verbatim-to-normative trace** check in addition to the standard
Decision gate:

- Every RFC 2119 clause in the Decision Statement section MUST trace
  back to a specific owner verbatim (`owner://transcript-<date>`
  quote) or to a `judgment://owner` capture in the upstream IDEA.
- Failure mode: a normative clause with no upstream owner anchor
  signals the principle is being authored ahead of owner intent.
  Record as `criterion: principle-not-owner-anchored`,
  `severity: blocking`; route to `needs-revision`.
- Authority:
  `file://specs/2026-05-02-studio-principle-ai/SPEC_EVIDENCE.md` §5.

Lint catches the structural failure (uncited claims) but not the
semantic walk from owner verbatim to normative clause; the walk is
a `spec-review` responsibility for principle SPECs.
