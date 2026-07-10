---
name: tdd
description: "Use when implementing a behavior change (feature, bug fix) where a runnable test can describe the expected behavior. Write the check first (red), implement (green), refactor. Do not use for refactors that preserve behavior — use implementation-execution alone."
license: unknown
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: adapted
    source_urls:
      - https://github.com/mattpocock/skills
    borrowed_from:
      - mattpocock/skills tdd
    upstream_status: current
    last_audited: 2026-07-08
    audit_cadence: quarterly
    adoption_status: adapted
    security_review: needed
    notes: "BES-adapted from external skill lineage (mattpocock/skills tdd); not a verbatim import. 2026-07-08 (v1.1.0 @ d574778): added the tautological-test anti-pattern (expected values drawn from an independent source of truth, distinct from implementation-coupling). Adoption record: specs/2026-07-08-pocock-v1.1-alignment-rebaseline."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# TDD

Use this skill for behavior changes where a test, fixture, lint case,
scripted check, or executable example can express the desired behavior.

TDD is a tactic, not a universal mandate. Some approved specs verify
through manual review, visual checks, release evidence, or document
lint. Use the verification method required by the approved SPEC.

## Loop

1. Identify the public behavior or contract being changed.
2. Write or update the narrowest meaningful failing check.
3. Run it and confirm it fails for the expected reason.
4. Implement the smallest change that makes the check pass.
5. Re-run the focused check.
6. Refactor only after the check passes.
7. Run the SPEC acceptance commands or directly coupled broader gate.

Work one behavior slice at a time; never write a batch of imagined
tests first and then a batch of implementation.

## Good Checks

- Exercise public behavior rather than private implementation details.
- Describe user-visible, contract-visible, or workflow-visible behavior.
- Stay deterministic.
- Fail clearly when the behavior regresses.
- Fit into the repo's existing test or lint style.
- Draw expected values from an **independent source of truth**, not by
  recomputing them the way the code under test does. An assertion that
  re-derives its expected value with the same logic as the code passes by
  construction — a **tautological test** that proves nothing. This is
  distinct from implementation-coupling below: a check can exercise public
  behavior yet still be tautological if its oracle mirrors the code.

## When Not To Force It

Do not invent a weak test just to satisfy the tactic when:

- The approved SPEC names a different verification method.
- The change is docs-only and covered by spec lint or manual review.
- The behavior requires visual, release, infrastructure, or owner
  review evidence.
- The repo lacks a practical harness and adding one is outside scope.

Record the reason and run the best approved verification instead.

## Hard Rules

- Do not make TDD outrank the approved SPEC acceptance plan.
- Do not add brittle tests that only pin implementation details.
- Do not write tautological tests — assertions whose expected value is
  computed the same way the code computes it (adapted from
  `mattpocock/skills` `tdd` @ `d574778`, v1.1.0, per
  `file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md`
  §11 T6).
- Do not skip existing acceptance commands after the focused check
  passes.
- Do not claim completion without fresh verification output.
