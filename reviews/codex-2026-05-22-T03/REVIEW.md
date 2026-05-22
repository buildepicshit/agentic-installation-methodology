# Codex cross-family review R1 — T-03 chapter 02 Phase 1 facet inventory Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R1 spec-review
Date: 2026-05-22

## Verdict

NEEDS-REVISION — 0 BLOCKER, 2 MAJOR. The Task SPEC
carries most T-01/T-02 lessons correctly: `ideated_in`,
`requires_network`, repo-root/sibling paths, AC↔T parity,
chapter-strict soft-floor semantics, corpus-citation
strictness, §6.6 attribution posture, and no padding-for-
budget language. Two MAJOR issues remain.

## BLOCKER

None.

## MAJOR findings

### Finding 1 — Phase 1 failure-mode specifics not in cited authority
Severity: MAJOR
Citation:
`specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md:237`,
`...:9.4 Phase 1 failure note section`

§9 and §16 instruct the author to use specific BES case-
study claims — hook suite as hybrid example, v2.0
customization facet promotion, and "we tried strict 1:1
classification; hybrid artefacts forced revision" — but
the cited research authority only says Phase 1 output is
"often hybrid (one artefact serves multiple facets)" and
that BES classified components into
generalizable/mixed/studio-specific buckets. Contract
§6.5 requires "what happened" to be verbatim or near-
verbatim from the workpad; "strict 1:1 classification"
is not present in the reviewed authority set.

Recommendation: rewrite §9, §16, and the failure-note
helper to stay within the cited record — anchor "what
happened" on the hybrid-output reality the workpad
actually names. E1 anchors should target "hybrid" /
"multiple facets" / "did not fit cleanly", not "strict
1:1" or "single-facet".

### Finding 2 — facet helper accepts bare single anchors
Severity: MAJOR
Citation:
`scripts/check-chapter-02-phase-1-facets.sh:29`

T-9 claims the helper exits 0 iff the chapter contains
paired anchors for all seven facets, the bucket split,
and the hybrid concept; the helper accepts single bare
tokens for every facet and every bucket (`architecture`,
`mixed`, `operations`, etc.). A chapter could pass by
listing keywords without actually covering the bucket
split or facet intent. Same class as T-02 R1 F2.

Recommendation: strengthen the helper with paired anchors
per facet (label + intent-role term) and per bucket
(label + bucket/classification term). Same pattern as
`check-chapter-01-phase-0-signals.sh`.

## MINOR

None.

## Advisory

The soft-floors regime is applied correctly in T-03
itself: front matter has `word_budget_target: 1000` and
`word_budget_max: 1300`, T-3/AC-3 treat the target as
advisory, `acceptance_commands` include `--chapter 02`.
Separate from T-03, the Contract validator help text
still contains stale lower-bound wording in a few
explanatory lines, but the active validator code path
and T-03 semantics use the amended advisory-target
behavior.

tokens used: 203,402
