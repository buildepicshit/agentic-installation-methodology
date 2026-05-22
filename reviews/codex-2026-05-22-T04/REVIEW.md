# Codex cross-family review R1 — T-04 chapter 03 Phase 2 parameterization surface Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R1 spec-review
Date: 2026-05-22

## Verdict

NEEDS-REVISION — 0 BLOCKER, 2 MAJOR.

## BLOCKER

None.

## MAJOR

### Finding 1 — Failure-note contract reintroduces unsupported causality from chapter 02
Severity: MAJOR
Citation:
`specs/2026-05-22-longread-chapter-03-phase-2-parameterization-surface/SPEC.md:230-241`,
`...IDEA.md:145-154`,
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md:302-307`,
`...:364-366`

Authority supports: Phase 2 question, Symphony
single-file + multi-file shapes, BES distributed with
multiple `fleet-manifest`-style configs. NOT supported:
"we initially leaned toward single-file" / "the facet
inventory forced multi-file" as case-study fact. The
SPEC says "no claims beyond cited authority" but §9
instructs an unsupported causal story.

Recommendation: separate fact from synthesis. Supported
fact stays as fact; "downstream of facet inventory"
mark as `judgment://agent-synthesis`.

### Finding 2 — Helper scripts can still pass broad keyword coverage
Severity: MAJOR
Citation:
`scripts/check-chapter-03-phase-2-anchors.sh:32-61`,
`scripts/check-chapter-03-failure-note.sh:61-73`

Anchors helper greps globally — BES row can pass on
"distributed" + unrelated "multiple". Failure-note
helper accepts generic vocabulary (E1 "surface", E2
"we did", E3 "lesson/pattern") without explicit
markers.

Recommendation: scope checks to paragraph/section level
with co-occurrence; require explicit three-element
markers.

## MINOR

None.

## Advisory

`lint-spec.sh` passes (0/0). T-01..T-03 discipline
mostly carried through: ideated_in, requires_network,
AC↔T parity (14↔14), chapter-strict, soft-floors,
no-padding/no-over-attribution language present.

## R1 remediation summary (post-fix, 2026-05-22)

- F1 CLOSED: §9 + IDEA §5 rewritten with strict fact-
  vs-synthesis separation. "What happened" + "What we
  did" workpad-grounded only. "What generalizes"
  explicitly `judgment://agent-synthesis` tagged.
- F2 CLOSED: anchors helper rewritten to require
  paragraph-level co-occurrence (awk RS=""
  paragraph-mode search). Failure-note helper rewritten
  to require explicit bold markers + `judgment://agent-
  synthesis` tag.

tokens used: 102,692
