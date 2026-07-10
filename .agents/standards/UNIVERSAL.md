# Fleet Engineering Excellence — UNIVERSAL standards

Authoritative SPEC:
`file://specs/2026-05-25-fleet-engineering-excellence-standards/SPEC.md`.

These standards apply across every active fleet repo
regardless of language. Per-language overlays live under
`agents/standards/lint/<language>/`.

> **Enforcement status (2026-07-10).** These standards define the
> TARGET engineering bar. Actual mechanical enforcement is PARTIAL:
> only the dependency-hygiene gate is wired into CI today
> (`file://agents/ci/gates.txt`). The per-language lint overlays and
> the CI gates named per-rule below (U6, U11, U12, U14, …) describe the
> intended mechanism; full standards enforcement is deferred to a
> standards-V2 SPEC
> (`file://specs/2026-05-25-fleet-engineering-excellence-standards/SPEC.md`).
> Read a rule's tool/CI line as the target, not a live gate, unless it
> appears in `gates.txt`.

## The rules (universal)

### U1 — Cognitive complexity per function ≤ 15

Per Wave 3 §2.1: cognitive complexity > 15 strongly
predicts defect density. Cyclomatic complexity > 10
shows 2-3× defect density consistently.

Mechanical enforcement: per-language lint rule
(SonarSource cognitive-complexity / ruff C901 /
eslint-plugin-sonarjs).

### U2 — Nesting depth ≤ 4

Per Wave 3: nesting depth > 3 is the comprehension
cliff.

### U3 — No empty catch / bare except / discarded errors

Per Wave 3: 500K+ repo Brazilian-CS study; empty
catches occur at least as often as logging.

Mechanical enforcement per language:
- TS: `@typescript-eslint/no-useless-catch`,
  `no-empty-pattern`
- Python: ruff `BLE001` (bare except)
- bash: `set -e` + explicit error handling
- Go: `errcheck`

### U4 — No `any` / strict type mode

TS: `strict: true` in tsconfig + `@typescript-eslint/no-explicit-any: error`.
Python: `mypy --strict` or `pyright strict` + runtime
validators (zod / pydantic) at module boundaries.

### U5 — No commented-out code blocks

Per Wave 3: Comment Traps 2025 — 58% defect
amplification specifically under AI codegen.

Mechanical enforcement:
- TS: eslint `no-warning-comments` + custom regex
- Python: ruff `ERA001`
- bash: lint via grep

### U6 — Dead-code / unused-import CI gate

Per Wave 3: 20-66% of large apps is unused code.

Per-language tools:
- TS: `knip` or `ts-prune`
- Python: `vulture`
- Go: `deadcode`

### U7 — File-size + function-size soft caps

Maps owner's "no god files" seed. Soft cap = WARN;
hard cap = FAIL (per-language values; see
`agents/standards/lint/<lang>/`).

### U8 — No inline tests in production modules

Per Wave 3 §2.2 + owner's "no inline tests" seed.
Tests MUST live in:
- TS: `__tests__/` directory OR `*.test.ts` /
  `*.spec.ts` sibling files (never inline `describe`/
  `test` calls in source modules).
- Python: `tests/` directory (per Python `src-layout`
  convention); never `*_test.py` files inside `src/`.
- bash: `tests/` directory.

### U9 — Mock-density cap + import-resolution as blocking gate

Per Wave 3: 36% agent commits add mocks vs 26%
non-agent; ~20% of AI-generated samples reference
non-existent packages.

Implementation: per-language lint cap + CI
import-resolution check (overlaps fleet-dependency-hygiene
gate; this standard delegates to that contract for the
import-resolution half).

### U10 — Semver compliance on public surfaces

Per Wave 3 + Maven SemVer study. Public OSS repos
(Wick, Mimir) MUST follow semver; internal repos
MAY use rolling versions if the consumer is internal-
only.

### U11 — Lockfile frozen on CI

`npm ci` / `uv sync --frozen` / `go mod verify` —
never `npm install` or `pip install` in CI without
a lock pin. Overlaps fleet-dependency-hygiene CI gate.

### U12 — PR diff-size gate

Per classical SmartBear/Cisco evidence: 400 LoC warn,
1000 LoC block. TARGET enforcement is CI-level via the
fleet-ci-bootstrap channel, but this gate is NOT yet wired
(see the enforcement-status note at the top of this file).

### U13 — Public-symbol docstring requirement

Per Wave 3 Wen 2019 comment-inconsistencies study.
Every exported symbol on the public surface MUST
carry a docstring stating purpose + invariants.

Per-language enforcement:
- TS: tsdoc/require-description on public exports
- Python: ruff `D102` (public method docstring),
  `D103` (public function)

### U14 — Format-on-CI not auto-fix on push

Format is a blocking lint gate, not a silent auto-fix.
- TS: Prettier (check mode in CI)
- Python: Black / ruff format (check mode in CI)
- bash: `shfmt -d`

### U15 — Boundary input validation

Per Wave 3 CSA 2026: 45% of AI samples introduce
OWASP Top 10. Every external input (HTTP request body,
CLI argv, env var, file content) MUST be validated at
the boundary via a runtime validator
(zod / pydantic / dataclass / etc.).

## Manual-review-only standards (not mechanically enforced)

These ride on top of the mechanical layer; reviewers
flag violations during `code-review`:

- **Naming quality** beyond min-length (semantic
  appropriateness).
- **"Easy to use right, hard to use wrong"** API
  design (Scott Meyers).
- **Comment "why not what"** quality — comments that
  explain rationale, not transcribe code.
- **Premature-abstraction detection** — refusing
  generalisation until the third concrete case.
- **Boy-scout-on-touch** — when modifying a file
  that fails a soft-cap rule, leave it better than
  found (move tests out of source, split god files,
  etc.).

## Per-language lint manifests

See:
- `file://agents/standards/lint/typescript/rules.txt`
- `file://agents/standards/lint/python/rules.txt`
- `file://agents/standards/lint/bash/rules.txt`

Each per-language file documents the concrete tool +
rule + threshold triples that operationalise the
universal rules above.
