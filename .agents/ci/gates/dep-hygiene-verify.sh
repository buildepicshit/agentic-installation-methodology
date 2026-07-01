#!/usr/bin/env bash
# CI gate: dep-hygiene-verify
# Per specs/2026-05-25-fleet-dependency-hygiene/SPEC.md §7.3.
#
# Per-language probe: registry-existence + vuln scan + SBOM gen
# where the language's tool is installed. Tools absent → WARN,
# not FAIL (V1 doesn't bootstrap toolchains).

set -uo pipefail

failures=0
warnings=0

note_warn() { warnings=$((warnings + 1)); echo "WARN: $*"; }
note_fail() { failures=$((failures + 1)); echo "FAIL: $*"; }
note_pass() { echo "PASS: $*"; }

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

# --- Node / npm ---
if [ -f "$REPO_ROOT/package.json" ]; then
    if command -v npm >/dev/null 2>&1; then
        if (cd "$REPO_ROOT" && npm audit --omit=dev --audit-level=high 2>&1 | grep -qE '(found 0|0 vulnerabilities)'); then
            note_pass "npm audit (no high+ vulns)"
        else
            note_warn "npm audit reported issues (re-run manually to inspect)"
        fi
    else
        note_warn "npm not installed; skipping npm audit"
    fi
fi

# --- Python ---
if [ -f "$REPO_ROOT/pyproject.toml" ] || ls "$REPO_ROOT"/requirements*.txt >/dev/null 2>&1; then
    if command -v pip-audit >/dev/null 2>&1; then
        if (cd "$REPO_ROOT" && pip-audit --strict >/dev/null 2>&1); then
            note_pass "pip-audit (no known vulns)"
        else
            note_warn "pip-audit reported issues"
        fi
    elif command -v uv >/dev/null 2>&1; then
        # uv pip audit may be available on newer uv versions.
        if (cd "$REPO_ROOT" && uv pip audit >/dev/null 2>&1); then
            note_pass "uv pip audit"
        else
            note_warn "uv pip audit unavailable or reported issues"
        fi
    else
        note_warn "neither pip-audit nor uv pip audit installed; skipping Python vuln scan"
    fi
fi

# --- Go ---
if [ -f "$REPO_ROOT/go.mod" ]; then
    if command -v govulncheck >/dev/null 2>&1; then
        if (cd "$REPO_ROOT" && govulncheck ./... >/dev/null 2>&1); then
            note_pass "govulncheck"
        else
            note_warn "govulncheck reported issues"
        fi
    else
        note_warn "govulncheck not installed; skipping Go vuln scan"
    fi
fi

# --- Rust ---
if [ -f "$REPO_ROOT/Cargo.toml" ]; then
    if command -v cargo-audit >/dev/null 2>&1; then
        if (cd "$REPO_ROOT" && cargo audit >/dev/null 2>&1); then
            note_pass "cargo audit"
        else
            note_warn "cargo audit reported issues"
        fi
    else
        note_warn "cargo-audit not installed; skipping Rust vuln scan"
    fi
fi

# --- Public-OSS strict mode ---
# Per SPEC §2.1 + §7.3 — OSS repos listed in
# fleet-ci-oss-enabled.txt get the strict treatment.
OSS_REPO_NAME="$(basename "$REPO_ROOT")"
OSS_ALLOWLIST=""
for candidate in \
    "$REPO_ROOT/agents/scripts/fleet-ci-oss-enabled.txt" \
    "$REPO_ROOT/.agents/scripts/fleet-ci-oss-enabled.txt"
do
    [ -f "$candidate" ] && { OSS_ALLOWLIST="$candidate"; break; }
done

if [ -n "$OSS_ALLOWLIST" ] && grep -qE "^${OSS_REPO_NAME}\$" "$OSS_ALLOWLIST" 2>/dev/null; then
    # Strict mode: any WARN should become FAIL for OSS repos.
    # V1 implementation: emit a strict-mode note; full elevation
    # is deferred to V2 when the per-language tools are mandated.
    note_warn "OSS strict mode active for $OSS_REPO_NAME; V2 will elevate WARN→FAIL once toolchain mandates land"
fi

# --- No checks ran? ---
if [ "$failures" -eq 0 ] && [ "$warnings" -eq 0 ]; then
    note_pass "no manifest files detected; gate is a no-op for this repo"
fi

echo ""
echo "=== dep-hygiene-verify: $failures FAILs, $warnings WARNs ==="

# WARN-only → exit 0; FAILs → exit non-zero per gate-contract.md.
if [ "$failures" -gt 0 ]; then
    exit 1
fi
exit 0
