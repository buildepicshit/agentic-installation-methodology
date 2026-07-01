# BES Fleet CI — Gate Authoring Contract

This document defines the contract a CI gate MUST satisfy to
register into the fleet CI channel
(`agents/scripts/run-ci-gates.sh`).

Authoritative SPEC:
`file://specs/2026-05-25-fleet-ci-bootstrap/SPEC.md`.

## What a gate is

A CI gate is an executable shell script invoked by the fleet
gate runner. The runner reads `agents/ci/gates.txt`, executes
each registered gate, and reports the collected results.

## Gate script contract

A gate script MUST:

1. **Live under `agents/ci/gates/`** (or wherever its
   registration in `gates.txt` points). Recommended naming:
   `agents/ci/gates/<gate-name>.sh`.
2. **Be executable** (`chmod +x`).
3. **Begin with a shebang** — `#!/usr/bin/env bash` or
   equivalent. The runner invokes via `bash <script>` so the
   shebang is advisory but improves direct-invocation
   ergonomics.
4. **Exit 0 on PASS**, non-zero on FAIL.
5. **Print human-readable diagnostic to stderr on FAIL** —
   the runner prefixes each line with `[<gate-name>]` so
   the final report identifies which gate spoke.
6. **Be idempotent** — running the gate twice on the same
   working tree MUST produce the same exit code.
7. **Be self-contained for its own dependencies** — if the
   gate needs `osv-scanner` / `npm-audit` / etc., the gate
   script checks for the tool's presence and emits a clear
   diagnostic if missing. The runner does NOT manage tool
   installation.
8. **NOT require network** unless explicitly documented in
   its registration. V1 prefers offline-safe gates; gates
   that hit the network MUST be marked in their
   `gates.txt` registration line via a trailing `# network`
   comment.
9. **NOT require secrets**. Any gate that needs secrets
   requires a sibling security-surface SPEC per
   `file://specs/2026-05-25-fleet-security-surface-discipline/IDEA.md`
   shipping first.

## Registration in `gates.txt`

Add one line per gate to `agents/ci/gates.txt`:

```text
<gate-name> <script-path-relative-to-agents>
```

Example:

```text
dep-hygiene-verify  ci/gates/dep-hygiene-verify.sh
standards-lint      ci/gates/standards-lint.sh
```

The runner resolves `<script-path>` fleet-aware: first under
`agents/`, then under `.agents/`, then script-dir-relative
fallback.

## Failure-collected runner semantics

The runner runs ALL registered gates regardless of
intermediate failures (per SPEC §7.1 + IDEA Q4 resolution).
A gate that exits non-zero does NOT short-circuit subsequent
gates. The runner's final exit code is the COUNT of failed
gates (capped at 255).

## Self-test requirement

Every gate SHOULD provide a `--self-test` mode that exercises
its own logic against in-process fixtures. The fleet runner's
own self-test (`run-ci-gates.sh --self-test`) covers the
runner's logic but NOT individual gate logic.

## Adding a new gate

1. Author the gate script under `agents/ci/gates/<name>.sh`.
   Honour the contract above.
2. `chmod +x agents/ci/gates/<name>.sh`.
3. Add the registration line to `agents/ci/gates.txt`.
4. Add the script path to `agents/scripts/fleet-files.txt` so
   it propagates via `fleet-sync.sh`.
5. Regenerate the manifest lock:
   `node agents/scripts/generate-fleet-manifest-lock.mjs`.
6. Verify with `bash agents/scripts/run-ci-gates.sh <name>`
   (single-gate mode) and
   `bash agents/scripts/run-ci-gates.sh` (all gates).
