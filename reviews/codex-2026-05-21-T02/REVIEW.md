# Codex cross-family review R1 — T-02 chapter 01 Phase 0 Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R1 spec-review
Date: 2026-05-21

## Verdict

NEEDS-REVISION.

No BLOCKER, but four MAJOR issues. T-02 carries most T-01
lessons forward, but not all: citation reachability
regressed, T-10/T-14 can pass under-scoped prose, and §6.6
is read incorrectly.

## BLOCKER

None.

## MAJOR findings

### Finding 1 — T-01 citation-reachability lesson regressed
Severity: MAJOR

`SPEC.md` claims T-01 lessons are applied upfront at
`specs/2026-05-21-longread-chapter-01-phase-0-maturity-check/SPEC.md:157-165`,
but it introduces non-resolving `file://` citations:
glob/brace patterns at `:159-160` and `:247`. The schema
requires `file://` paths to exist at the cited commit.

Recommendation: cite concrete paths individually, or remove
`file://` from glob/pattern prose.

### Finding 2 — T-10 helper too weak for signal coverage
Severity: MAJOR

T-10 says the helper exits 0 iff all four positive signals
and all three anti-signals are covered. The script only
checks one loose substring per signal. S1 can pass on
`deployment surface`; S3 can pass on bare `load-bearing`;
S4 can pass on `acceptance commands`; none prove the
research §6 meanings.

Recommendation: tighten each signal to require paired
anchors.

### Finding 3 — T-14 does not enforce §6.5 three-element structure
Severity: MAJOR

Contract §6.5 requires each phase chapter to end with a
short failure/open-question section using the three-element
structure: what happened / what we did / what pattern
generalizes. T-02 only requires a "failure-mode note" and
T-14 greps failure words anywhere in the chapter. A chapter
could pass by mentioning failure in the opener while
burying or omitting the structured note.

Recommendation: make §8/§9/T-14 explicitly require the
three elements and end-of-chapter placement.

### Finding 4 — §6.6 BES attribution posture misread
Severity: MAJOR

T-02 §12 says "MUST NOT name internal BES SPEC identifiers
or transcript IDs." Contract §6.6 says the opposite:
internal SPEC IDs are sanitization-safe slugs and SHOULD be
cited where they support failure-mode disclosure;
transcript identifiers MAY be cited for owner-verbatim
grounding.

Recommendation: revise T-02 §12 to permit Contract-compliant
SPEC ID and transcript ID citations.

## MINOR

None.

## Advisory

Good carry-through: `ideated_in`, `requires_network: true`,
repo-root path base for most concrete cites, `--chapter 01`,
AC↔T parity, strict corpus-citation language. SPEC + IDEA
lint both exit 0; helper executable + `bash -n` clean.
Chapter 00 coherence: cites the closed chapter-00 SPEC,
avoids restating reader contract.

## R1 remediation summary (post-fixes)

- F1 CLOSED: glob/brace patterns at L159-160 + L247
  replaced with concrete per-file cites.
- F2 CLOSED: helper rewritten to require paired anchors
  per signal (S1: deployed + customization surface; S3:
  load-bearing + implementation accident; S4: conformance
  bar + acceptance commands; etc.).
- F3 CLOSED: §8 + §9 §5 + T-14 rewritten to require the
  §6.5 three-element structure (what happened / what we
  did / what pattern generalizes) AND end-of-chapter
  placement (penultimate section before forward pointer).
  Second helper script
  `scripts/check-chapter-01-failure-note.sh` authored to
  enforce both criteria mechanically.
- F4 CLOSED: §12 reversed — Task MAY cite internal BES
  SPEC IDs + transcript IDs per Contract §6.6; §12 still
  forbids naming unrelated BES product repos per §6.6
  closing paragraph.

tokens used: 228,826
