#!/usr/bin/env bash
# validate-standards.sh — verify the standards manifests are
# well-formed. Per
# specs/2026-05-25-fleet-engineering-excellence-standards/SPEC.md §7.
#
# Modes:
#   validate-standards.sh                 validate all language manifests
#   validate-standards.sh --self-test     embedded test suite
#   validate-standards.sh --help

set -uo pipefail

resolve_standards_root() {
    local script_dir
    script_dir="$(cd "$(dirname "$0")" && pwd)"
    local candidates=(
        "${CLAUDE_PROJECT_DIR:-}/agents/standards"
        "${CLAUDE_PROJECT_DIR:-}/.agents/standards"
        "$script_dir/../standards"
    )
    for c in "${candidates[@]}"; do
        if [ -d "$c" ]; then echo "$c"; return 0; fi
    done
    return 1
}

validate_manifest() {
    local file="$1"
    local errors=0
    [ -f "$file" ] || { echo "FAIL: missing $file"; return 1; }
    # Each non-comment line must be: <rule-id> <tool> <name> <threshold>
    while IFS= read -r line; do
        case "$line" in '#'*|'') continue ;; esac
        local fields
        fields=$(echo "$line" | awk '{print NF}')
        if [ "$fields" -lt 3 ]; then
            echo "FAIL: $file: malformed line: $line"
            errors=$((errors + 1))
        fi
        # Rule-id must start with U
        if ! echo "$line" | grep -qE '^U[0-9]+[[:space:]]'; then
            echo "FAIL: $file: rule-id must start with U<n>: $line"
            errors=$((errors + 1))
        fi
    done < "$file"
    [ "$errors" -eq 0 ] && echo "PASS: $file"
    return "$errors"
}

validate_all() {
    local root
    root="$(resolve_standards_root)" || {
        echo "FAIL: standards root not found"
        return 1
    }
    [ -f "$root/UNIVERSAL.md" ] || { echo "FAIL: UNIVERSAL.md missing"; return 1; }
    echo "PASS: UNIVERSAL.md present"
    local total_err=0
    for lang_dir in "$root/lint"/*; do
        [ -d "$lang_dir" ] || continue
        local manifest="$lang_dir/rules.txt"
        validate_manifest "$manifest"
        total_err=$((total_err + $?))
    done
    return "$total_err"
}

self_test() {
    local pass=0 fail=0
    local sandbox
    sandbox="$(mktemp -d)"
    mkdir -p "$sandbox/agents/standards/lint/test"

    write_uni() { printf 'manifesto\n' > "$sandbox/agents/standards/UNIVERSAL.md"; }
    write_manifest() { printf '%s\n' "$1" > "$sandbox/agents/standards/lint/test/rules.txt"; }

    run_case() {
        local name="$1" universal="$2" manifest="$3" expected="$4"
        if [ "$universal" = "yes" ]; then write_uni; else rm -f "$sandbox/agents/standards/UNIVERSAL.md"; fi
        write_manifest "$manifest"
        CLAUDE_PROJECT_DIR="$sandbox" validate_all >/dev/null 2>&1
        local actual=$?
        if [ "$actual" = "$expected" ]; then
            pass=$((pass + 1))
            echo "  PASS: $name"
        else
            fail=$((fail + 1))
            echo "  FAIL: $name (expected $expected, got $actual)" >&2
        fi
    }

    run_case "valid-manifest" "yes" "U1 tool rule 15" 0
    run_case "missing-universal" "no" "U1 tool rule 15" 1
    run_case "malformed-line" "yes" "garbage line" 2  # 2 errors: malformed + rule-id
    run_case "bad-rule-id" "yes" "X1 tool rule 15" 1

    rm -rf "$sandbox"
    printf '\nvalidate-standards self-test: %d PASS, %d FAIL\n' "$pass" "$fail"
    [ "$fail" -eq 0 ]
}

case "${1:-}" in
    --help|-h)
        echo "validate-standards.sh — verify standards manifests"
        echo "Modes: --self-test | --help | (no args = validate)"
        ;;
    --self-test)
        self_test; exit $?
        ;;
    *)
        validate_all; exit $?
        ;;
esac
