# Codex cross-family review R3 — T-03 chapter 02 Phase 1 facet inventory Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R3 spec-review after R2 remediation
Date: 2026-05-22

## Verdict

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR. R2 F1 carry-through
incomplete: §9 + IDEA still mention `hook-suite` and `v2.0
customization promotion` (even as the names inside the
prohibition wording — the names leak forward via the rule
itself).

## BLOCKER

None.

## MAJOR

### Finding 1 — R2 F1 carry-through incomplete
Severity: MAJOR
Citation:
`specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md:241-244`,
`specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/IDEA.md:156-163`

§9 paragraph 3 now says "the chapter MUST NOT name
specific artefacts beyond what the cited workpad
authority supports" — but cites `hook-suite` and `v2.0-
customization` as the prohibited examples. IDEA §6 Q1
does the same. The example names still appear in the
authoring contract via the prohibition itself.

The cited workpad supports the seven facets + hybrid
output + bucket split, not the specific examples named.

Recommendation: remove the concrete example names from
the prohibition wording. Keep the rule generic — "do not
name specific artefacts beyond workpad authority unless
a citable source is added."

## MINOR

None.

## Advisory

Remaining `strict 1:1` / `single-facet` mentions in
`scripts/check-chapter-02-failure-note.sh` header
comments document rejected framing; helper code no
longer enforces them. Not MAJOR but should be cleaned
to avoid reintroducing stale guidance.

Substantive Phase 1 shape intact:
- Seven facets required (§8).
- Bucket split + hybrid reality required (§8).
- Three-element failure note structure preserved.
- Facet helper uses paired anchors.

Mechanical checks: lint 0/0; both helpers `bash -n`
clean.

## R2 closure table

| R2 item | R3 status | Evidence |
|---|---:|---|
| F1 — scrub stale specifics from §9 + IDEA + helpers | NOT CLOSED — MAJOR | Example names still appear in prohibition wording in §9 + IDEA Q1. |
| F2 — helper paired-anchor rule | CLOSED | Paired anchors in `check-chapter-02-phase-1-facets.sh`. |
| Workpad-grounded substance intact | CLOSED | Seven facets + bucket split + hybrid output all present. |
| Approval-readiness | NOT READY | One MAJOR remains. |

tokens used: 89,499
