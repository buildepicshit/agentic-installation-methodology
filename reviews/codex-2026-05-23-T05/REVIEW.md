# Codex cross-family review R1 — T-05 chapter 04 Phase 3 Task SPEC

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R1 spec-review
Date: 2026-05-23

## Verdict

NEEDS-REVISION — 0 BLOCKER, 2 MAJOR.

## MAJOR

### Finding 1 — IDEA cites non-existent repo-local parent Decision
Severity: MAJOR
Citation: `IDEA.md:57-61`

IDEA §2 cites `file://specs/2026-05-18-agentic-installation-methodology/SPEC.md` — file does not exist locally. Actual parent Decision is in sibling `../bes-fleet-policy/specs/...`. SPEC uses correct path elsewhere.

Recommendation: fix IDEA §2 cite to
`file://../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.

### Finding 2 — Asymmetry helper false-pass risk
Severity: MAJOR
Citation: `scripts/check-chapter-04-phase-3-anchors.sh:73-77`

Asymmetry check accepts `asymmetr`+`longread/product b/case study/case-study` OR `named throughout`+ same. A paragraph that mentions "asymmetry" + "longread" without naming Product A sanitization, BES disposition, or Q4 basis passes — this is the exact load-bearing claim T-05 is supposed to police.

Recommendation: require both sides in same paragraph — Product A + sanitization/drop-ALL AND Product B + case-study/named/full-transparency.

## R1 remediation summary (post-fix, 2026-05-23)

- F1 CLOSED: IDEA §2 path corrected.
- F2 CLOSED: asymmetry check rewritten as
  paragraph-level both-sides match. Verified loose-
  asymmetry chapter FAILs; full-asymmetry paragraph
  PASSes.

tokens used: 179,500
