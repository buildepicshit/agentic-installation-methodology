# R2 — T-09 chapter 08 Phase 7 failure modes Task SPEC

Final chapter — methodology's synthesis chapter.
R1 returned 2 MAJOR; both addressed below.

## R1 findings and remediation

### R1 F1 — §6.5 three-element enforcement on cross-phase modes

R1 finding: SPEC §8/§9/§13/§14 + the anchors helper only
required the 4 cross-phase failure modes to be present
by anchor term. Per Contract §6.5 the chapter MUST
disclose each mode with the three-element structure
(`**What happened.**` / `**What we did.**` /
`**What pattern generalizes.**`). Chapter 08 could pass
T-9/T-14/AC-14 while listing the four modes without
that structure.

Remediation:
- SPEC §8 Desired Behavior: now requires each cross-
  phase mode disclosure to carry the §6.5 three-element
  structure with literal bold markers.
- SPEC §9 Domain Model §3: now requires each of the 4
  cross-phase modes to be disclosed using the §6.5
  three-element structure; cataloguing alone is non-
  conformant.
- SPEC §13 T-9: helper covers 7 rows (was 6); added F2
  row.
- SPEC §13 T-14: each cross-phase mode MUST be
  disclosed with §6.5 three-element structure;
  mechanically enforced by T-9 F2 row.
- SPEC §14 AC-14: mirrors T-14 strengthening.
- Anchors helper `scripts/check-chapter-08-phase-7-
  anchors.sh`: docstring updated 6 rows → 7 rows; new
  F2 if-block requires each of the three bold markers
  (`**What happened.**`, `**What we did.**`,
  `**What pattern generalizes.**`) to occur ≥ 4 times
  in the chapter (one per cross-phase mode at minimum).

### R1 F2 — closing-line helper too loose + IDEA conflict

R1 finding: closing helper grepped for three substrings
in the last 15 lines without requiring `follow.`
period, exact ordering, or no prose after. IDEA §6 had
a conflicting "NOT 'In the next chapter'" statement
that contradicted Contract §8.1's literal text.

Remediation:
- Closing helper `scripts/check-chapter-08-closing.sh`
  rewritten: takes the chapter's final non-blank
  paragraph, collapses whitespace, and requires a
  byte-exact match against `**In the next chapter**:
  This is the last chapter. The seven open research
  questions follow.` — no prose may follow this
  paragraph.
- IDEA §6 forward-pointer bullet: removed "NOT 'In the
  next chapter'"; replaced with the exact literal
  text. The chapter uses the same
  `**In the next chapter**:` label as all earlier
  chapters with body text declaring this is the last
  chapter.

## Target

`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/SPEC.md`
`file://specs/2026-05-24-longread-chapter-08-phase-7-failure-modes/IDEA.md`
`file://scripts/check-chapter-08-phase-7-anchors.sh`
`file://scripts/check-chapter-08-closing.sh`

## R2 mandate

MAJOR-or-higher. CONVERGENCE-PASS if R1 F1 + F2 both
closed cleanly with no new defects introduced.

Output: `reviews/codex-2026-05-24-T09-r2/REVIEW.md`
(read-only sandbox; emit to stdout if cannot write).
