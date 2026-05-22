# Cross-family review R3 — T-03 chapter 02 facet inventory Task SPEC

R3 after R2 remediation.

## R2 verdict was NEEDS-REVISION (0 BLOCKER, 1 MAJOR)

R2 at `file://reviews/codex-2026-05-22-T03-r2/REVIEW.md`.
R1 F2 closed in R1 (helper paired-anchor rule). R1 F1
remained partial in R2 (stale "hook suite" / "v2.0
customization promotion" / "strict 1:1" / "single-facet"
references in §9 + IDEA + helper header).

## R2 remediation landed

- **§9 paragraph 3** rewrite: removed hook-suite + v2.0
  customization promotion specifics; replaced with
  "bucket split per workpad §7 + hybrid-output reality
  per workpad §6 + chapter MUST NOT name specific
  artefacts beyond workpad authority."
- **§9 paragraph 4** ("Phase 1 failure-mode note")
  cleanup: removed "rather than forcing single-facet"
  phrase; replaced with "so the table reads honestly
  across multi-facet artefacts." The remaining "single-
  facet" hits in helper script headers are intentional
  documentation explaining R1 F1 closure (NOT stale
  guidance to authors).
- **IDEA §5** rewrite: same cleanup as §9. Removed
  schema/hook-tests/SPEC-IDs examples; replaced with
  workpad-grounded framing. Phase 1 failure-mode
  paragraph rewritten to match.
- **IDEA §6 Q1 default**: rewritten to say "stay
  within cited workpad authority; do not enumerate
  hook suite or v2.0 customization."

## R3 target

- `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/SPEC.md`
- `file://specs/2026-05-22-longread-chapter-02-phase-1-facet-inventory/IDEA.md`
- `file://scripts/check-chapter-02-phase-1-facets.sh`
- `file://scripts/check-chapter-02-failure-note.sh`

## R3 mandate

Honest verdict at SEVERITY = MAJOR-or-higher.

Scan specifically:
1. **R2 F1 carry-through**: are §9 + IDEA + helpers
   actually scrubbed of unsupported specifics now? Any
   adjacent paragraph still implies what was removed?
2. **Workpad-grounded substance still intact**: does the
   chapter still have enough Phase 1 content to be a
   useful chapter (seven facets + bucket split +
   hybrid reality + honest failure note)?
3. **Approval-readiness**: ready for owner approval?

## Output

`reviews/codex-2026-05-22-T03-r3/REVIEW.md` (read-only;
emit to stdout if cannot write).

Structure: Verdict, BLOCKER, MAJOR, MINOR, Advisory,
R2 closure table.

Honest. CONVERGENCE-PASS if genuinely ready.
