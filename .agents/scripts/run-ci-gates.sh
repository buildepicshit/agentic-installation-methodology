#!/usr/bin/env bash
# run-ci-gates.sh — fleet-canonical CI gate runner.
# Per specs/2026-05-25-fleet-ci-bootstrap/SPEC.md §7.
#
# Modes:
#   run-ci-gates.sh                    run all registered gates (fail-collected)
#   run-ci-gates.sh <gate-name>        run a specific gate
#   run-ci-gates.sh --list             list registered gates
#   run-ci-gates.sh --self-test        embedded test suite
#   run-ci-gates.sh --help             usage
#
# Exit codes:
#   0           all gates PASS (or no gates registered)
#   1..254      count of failed gates (fail-collected)
#   255         255+ failed gates (capped)

set -uo pipefail

resolve_gates_manifest() {
    local script_dir
    script_dir="$(cd "$(dirname "$0")" && pwd)"
    local candidates=(
        "${CLAUDE_PROJECT_DIR:-}/agents/ci/gates.txt"
        "${CLAUDE_PROJECT_DIR:-}/.agents/ci/gates.txt"
        "$script_dir/../ci/gates.txt"
    )
    for c in "${candidates[@]}"; do
        if [ -f "$c" ]; then
            echo "$c"
            return 0
        fi
    done
    return 1
}

resolve_script_path() {
    local p="$1"
    local script_dir
    script_dir="$(cd "$(dirname "$0")" && pwd)"
    local candidates=(
        "${CLAUDE_PROJECT_DIR:-}/agents/$p"
        "${CLAUDE_PROJECT_DIR:-}/.agents/$p"
        "$script_dir/../$p"
    )
    for c in "${candidates[@]}"; do
        if [ -e "$c" ]; then
            echo "$c"
            return 0
        fi
    done
    echo ""
    return 1
}

read_manifest() {
    local manifest="$1"
    awk '
        /^[[:space:]]*#/ { next }
        /^[[:space:]]*$/ { next }
        { sub(/[[:space:]]+#.*$/, ""); print }
    ' "$manifest"
}

run_all_gates() {
    local manifest
    manifest="$(resolve_gates_manifest)" || {
        echo "no gates registered (manifest not found)"
        return 0
    }

    local entries
    entries="$(read_manifest "$manifest")"
    if [ -z "$entries" ]; then
        echo "no gates registered (manifest empty)"
        return 0
    fi

    local total=0
    local passed=0
    local failed=0
    local fail_log
    fail_log="$(mktemp)"

    while IFS=$' \t' read -r name script_rel; do
        [ -z "$name" ] && continue
        total=$((total + 1))
        local script_abs
        script_abs="$(resolve_script_path "$script_rel" || true)"
        if [ -z "$script_abs" ] || [ ! -e "$script_abs" ]; then
            failed=$((failed + 1))
            echo "FAIL: $name (gate script not found at $script_rel)"
            printf '[%s] gate script not found at agents/%s\n' "$name" "$script_rel" >> "$fail_log"
            continue
        fi
        if [ ! -x "$script_abs" ] && ! head -n1 "$script_abs" 2>/dev/null | grep -q '^#!'; then
            failed=$((failed + 1))
            echo "FAIL: $name (gate script not executable)"
            printf '[%s] gate script not executable: %s\n' "$name" "$script_abs" >> "$fail_log"
            continue
        fi
        local gate_stderr
        gate_stderr="$(mktemp)"
        local rc=0
        bash "$script_abs" 2>"$gate_stderr" || rc=$?
        if [ "$rc" -eq 0 ]; then
            passed=$((passed + 1))
            echo "PASS: $name"
        else
            failed=$((failed + 1))
            echo "FAIL: $name (exit $rc)"
            printf '[%s] exit %s\n' "$name" "$rc" >> "$fail_log"
            sed "s/^/[$name] /" "$gate_stderr" >> "$fail_log"
        fi
        rm -f "$gate_stderr"
    done <<< "$entries"

    echo "=== $passed/$total gates passed ==="
    if [ "$failed" -gt 0 ]; then
        echo "--- failures ---" >&2
        cat "$fail_log" >&2
    fi
    rm -f "$fail_log"

    if [ "$failed" -gt 255 ]; then
        return 255
    fi
    return "$failed"
}

list_gates() {
    local manifest
    manifest="$(resolve_gates_manifest)" || {
        echo "no manifest found"
        return 0
    }
    read_manifest "$manifest"
}

self_test() {
    local pass=0
    local fail=0
    local sandbox
    sandbox="$(mktemp -d)"
    mkdir -p "$sandbox/agents/ci"
    mkdir -p "$sandbox/agents/ci/gates"

    local prev_cpd="${CLAUDE_PROJECT_DIR:-}"
    export CLAUDE_PROJECT_DIR="$sandbox"

    run_case() {
        local name="$1"
        local manifest_content="$2"
        local extra_setup="$3"
        local expected_rc="$4"
        local expected_substr="$5"
        printf '%s\n' "$manifest_content" > "$sandbox/agents/ci/gates.txt"
        eval "$extra_setup"
        local out
        out="$("$0" 2>&1)"
        local rc=$?
        if [ "$rc" = "$expected_rc" ] && printf '%s' "$out" | grep -qF "$expected_substr"; then
            pass=$((pass + 1))
            echo "  PASS: $name"
        else
            fail=$((fail + 1))
            echo "  FAIL: $name (expected rc=$expected_rc substr=\"$expected_substr\", got rc=$rc out=$out)" >&2
        fi
        rm -f "$sandbox/agents/ci/gates"/*.sh 2>/dev/null || true
    }

    # Case A: empty manifest → rc 0, "no gates registered"
    run_case "empty-manifest" "" "" 0 "no gates registered"

    # Case B: one PASS gate → rc 0, summary 1/1
    cat > "$sandbox/agents/ci/gates/pass-a.sh" <<'EOF'
#!/usr/bin/env bash
echo "gate A passing"
exit 0
EOF
    chmod +x "$sandbox/agents/ci/gates/pass-a.sh"
    run_case "one-pass" "pass-a ci/gates/pass-a.sh" "" 0 "1/1 gates passed"

    # Case C: one FAIL gate → rc 1, summary 0/1
    cat > "$sandbox/agents/ci/gates/fail-a.sh" <<'EOF'
#!/usr/bin/env bash
echo "gate failing" >&2
exit 7
EOF
    chmod +x "$sandbox/agents/ci/gates/fail-a.sh"
    run_case "one-fail" "fail-a ci/gates/fail-a.sh" "" 1 "0/1 gates passed"

    # Case D: mixed PASS+FAIL → rc 1, summary 1/2, BOTH gates ran (fail-collected)
    cat > "$sandbox/agents/ci/gates/pass-b.sh" <<'EOF'
#!/usr/bin/env bash
exit 0
EOF
    chmod +x "$sandbox/agents/ci/gates/pass-b.sh"
    run_case "mixed-fail-collected" "pass-b ci/gates/pass-b.sh
fail-a ci/gates/fail-a.sh" "" 1 "1/2 gates passed"

    # Case E: missing gate script → FAIL with "not found"
    run_case "missing-script" "missing-gate ci/gates/nonexistent.sh" "" 1 "FAIL: missing-gate (gate script not found"

    # Cleanup
    export CLAUDE_PROJECT_DIR="$prev_cpd"
    rm -rf "$sandbox"

    printf '\nrun-ci-gates self-test: %d PASS, %d FAIL\n' "$pass" "$fail"
    [ "$fail" -eq 0 ]
}

main() {
    case "${1:-}" in
        --help|-h)
            cat <<'USAGE'
run-ci-gates.sh — fleet-canonical CI gate runner

Modes:
  run-ci-gates.sh             run all registered gates (fail-collected)
  run-ci-gates.sh <gate-name> run a specific gate
  run-ci-gates.sh --list      list registered gates
  run-ci-gates.sh --self-test embedded test suite
  run-ci-gates.sh --help      this message

Exit codes:
  0       all gates PASS (or none registered)
  1..254  count of failed gates
  255     255+ failures (capped)
USAGE
            return 0
            ;;
        --list)
            list_gates
            return 0
            ;;
        --self-test)
            self_test
            return $?
            ;;
        "")
            run_all_gates
            return $?
            ;;
        *)
            # Single-gate mode: filter manifest to just this gate.
            local manifest
            manifest="$(resolve_gates_manifest)" || { echo "no manifest" >&2; return 1; }
            local entry
            entry="$(read_manifest "$manifest" | awk -v n="$1" '$1==n {print; exit}')"
            if [ -z "$entry" ]; then
                echo "no such gate: $1" >&2
                return 1
            fi
            local tmp
            tmp="$(mktemp)"
            printf '%s\n' "$entry" > "$tmp"
            local prev_cpd="${CLAUDE_PROJECT_DIR:-}"
            # Run with a one-line manifest by temporarily redirecting.
            # Simpler: just inline-run the single entry.
            local name script_rel
            read -r name script_rel <<< "$entry"
            local script_abs
            script_abs="$(resolve_script_path "$script_rel" || true)"
            rm -f "$tmp"
            if [ -z "$script_abs" ]; then
                echo "FAIL: $name (script not found)" >&2
                return 1
            fi
            bash "$script_abs"
            return $?
            ;;
    esac
}

main "$@"
