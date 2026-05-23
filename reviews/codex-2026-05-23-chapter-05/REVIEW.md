# Codex cross-family review — Chapter 05 prose

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only R1 prose review
Date: 2026-05-23
Target: `longread/05-phase-4-manifest-catalog-compose.md`
(749 prose words at initial verify; 789 post-Amendment 1)

## Verdict

NEEDS-REVISION — 0 BLOCKER, 1 MAJOR.

## MAJOR

### Finding 1 — Product A v2.0 details attributed to wrong sources
Severity: MAJOR
Citation: `longread/05-phase-4-manifest-catalog-compose.md:80-91`,
`...:98-102`, workpad §7, parent Decision §7

Chapter correctly quoted workpad §7 for "Product A is
the worked example of the catalog shape," but added
"Product A v2.0" + "ships a top-level manifest plus
per-facet sub-specs" attributed to chapter 04 — which
established the sanitization asymmetry, not the
manifest+catalog framing. Parent Decision §7 actually
establishes the v2.0/paired-release/manifest+catalog
binding.

Recommendation: cite parent Decision §7 for the
v2.0/manifest framing; narrow chapter 04 ref to
sanitization asymmetry only.

## R1 remediation summary (post-fix, 2026-05-23)

- F1 CLOSED: "Where BES landed" + failure-note E1
  rewritten. Parent Decision §7 cited explicitly for
  v2.0 + manifest+catalog binding. Chapter 04 ref
  narrowed to "Product A / Product B sanitization
  asymmetry". Workpad §7 quote narrowed to "Product A
  is the worked example" (no v2.0).

Chapter post-fix: 789 prose words (was 749). All
mechanical checks still PASS.

## Clean checks

- Corpus truthfulness for Helm + arc42 + Cucumber-
  Gherkin + C4 + Structurizr DSL + OCI: no MAJOR issue.
- Voice + citation discipline + failure note + Phase 4
  substance + length + forward pointer: clean.

tokens used: 208,087
