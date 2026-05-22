# Codex cross-family review — Chapter 04 prose

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only content-quality review
Date: 2026-05-23
Target: `longread/04-phase-3-sanitization-bar.md` (624
prose words at initial verify; 617 post-Amendment 1)

## Verdict

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR.

Mechanical checks pass. Chapter not too thin under soft-
floors. Remaining MAJOR is failure-note provenance: E2
imports corpus/synthesis material that the Task SPEC
reserved for workpad-grounded "what we did" only.

## MAJOR

### Finding 1 — Failure-note E2 breaks fact-vs-synthesis separation
Severity: MAJOR
Citation: `longread/04-phase-3-sanitization-bar.md:84-90`,
`specs/2026-05-23-longread-chapter-04-phase-3-sanitization-bar/SPEC.md:255-267`

Task SPEC requires E1 + E2 workpad-grounded, synthesis
isolated in E3. Current E2 adds the Sigstore/cosign
provenance analogy ("sign what you ship and let
downstream verify"). Sigstore §3 supports signing/verify
generally but is NOT workpad-grounded evidence for the
BES Phase 3 failure note.

Same class as chapter 02/03 issue: mechanically valid
failure note smuggling extra attribution into the fact
section.

Recommendation: delete the Sigstore sentence from E2 or
move analogy outside the failure note with explicit
synthesis framing. Compliant E2: "We adopted the bar and
applied it to Product A's spec body."

## Checks

- `validate-longread-structure.sh --chapter 04` → PASS,
  624 prose words below advisory 900 target only.
- `check-chapter-04-phase-3-anchors.sh` → PASS.
- `check-chapter-04-failure-note.sh` → PASS (only marker/
  tag shape; doesn't catch E2 provenance).
- `lint-spec.sh ...SPEC.md` → PASS.

## R1 remediation summary (post-fix, 2026-05-23)

- F1 CLOSED: Sigstore reference moved from failure-note
  E2 to Move 3 of the three-sanitization-moves section
  where it actually belongs (as the prior-art frame for
  trust-boundary declarations). E2 trimmed to "We adopted
  the bar and applied it to Product A's spec body."

Chapter post-fix: 617 prose words (was 624). All
mechanical checks remain PASS.

tokens used: 135,033
