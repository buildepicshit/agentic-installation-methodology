#!/usr/bin/env bash
# validate-deps-declaration.sh — helper for dependency-hygiene
# contract per specs/2026-05-25-fleet-dependency-hygiene/SPEC.md §7.1.
#
# Validates that a proposed manifest edit is covered by the active
# SPEC's dep declarations (deps_added / deps_changed /
# deps_removed / dep_emergency / dep_scope_override).
#
# Exit codes:
#   0  PASS
#   1  WARN (advisory)
#   2  FAIL (block)
#
# Modes:
#   validate-deps-declaration.sh "<command-or-path>"
#   validate-deps-declaration.sh -            (stdin)
#   validate-deps-declaration.sh --self-test
#   validate-deps-declaration.sh --help

set -uo pipefail

# Manifest file patterns (per SPEC §6.1.2).
MANIFEST_REGEX='(package(-lock)?\.json|pnpm-lock\.yaml|pyproject\.toml|requirements[^[:space:]]*\.txt|uv\.lock|Pipfile(\.lock)?|go\.(mod|sum)|Cargo\.(toml|lock))'

# Install-command patterns.
INSTALL_REGEX='(npm[[:space:]]+(install|i|add)|pnpm[[:space:]]+(install|add)|yarn[[:space:]]+add|pip[[:space:]]+install|pip3[[:space:]]+install|uv[[:space:]]+add|poetry[[:space:]]+add|go[[:space:]]+get|cargo[[:space:]]+add)\b'

# Pure build/test invocations are not dependency changes even when
# they name a manifest (e.g. `cargo build --manifest-path X/Cargo.toml`)
# — ACTOCCATUD 2026-06-02 false-positive. Their spans (up to the next
# command separator) are stripped before manifest matching; install
# commands elsewhere in a compound line still match.
BUILD_CMD_REGEX='(cargo[[:space:]]+(build|run|test|check|clippy|fmt|doc|bench)|go[[:space:]]+(build|run|test|vet|generate))[^;&|]*'

# Detection noise: heredoc bodies and quoted strings merely
# MENTIONING a manifest are not edits (same immunity pattern as
# validate-cli-invocation.sh; this validator blocked a heredoc that
# only mentioned a manifest filename, 2026-06-05).
strip_detection_noise() {
    awk '
        BEGIN { in_heredoc = 0; tag = "" }
        {
            line = $0
            if (in_heredoc) {
                if (line ~ ("^[[:space:]]*" tag "$")) { in_heredoc = 0; tag = "" }
                next
            }
            if (match(line, /<<-?[[:space:]]*['\''"]?[A-Za-z_][A-Za-z0-9_]*['\''"]?/)) {
                t = substr(line, RSTART, RLENGTH)
                sub(/^<<-?[[:space:]]*/, "", t)
                gsub(/['\''"]/, "", t)
                in_heredoc = 1; tag = t
            }
            gsub(/'\''[^'\'']*'\''/, "", line)
            gsub(/"[^"]*"/, "", line)
            print line
        }
    '
}

detect_manifest_edit() {
    local input="$1"
    # Strip heredoc bodies + quoted strings, then build-command spans.
    input="$(printf '%s' "$input" | strip_detection_noise)"
    local stripped
    stripped="$(printf '%s' "$input" | sed -E "s/${BUILD_CMD_REGEX}//g")"
    if printf '%s' "$stripped" | grep -qE "$MANIFEST_REGEX"; then
        return 0
    fi
    if printf '%s' "$input" | grep -qE "$INSTALL_REGEX"; then
        return 0
    fi
    return 1
}

# Find the active SPEC. Walks up the working tree looking for a
# specs/ directory with at least one SPEC at status approved or
# in-execution. Returns absolute path to the SPEC or empty string.
find_active_spec() {
    local root
    root="${ACTIVE_SPEC_DIR:-${CLAUDE_PROJECT_DIR:-$(pwd)}}"
    if [ -n "${ACTIVE_SPEC_DIR:-}" ] && [ -d "$ACTIVE_SPEC_DIR" ]; then
        # In test contexts, the helper is pointed at a specific
        # specs dir.
        find "$ACTIVE_SPEC_DIR" -maxdepth 3 -name 'SPEC.md' 2>/dev/null | head -n1
        return
    fi
    # Real run: walk current cwd to find specs/ then look for
    # the most recently-modified SPEC at status approved /
    # in-execution.
    local current="$root"
    while [ "$current" != "/" ]; do
        # Source-repo layout (specs/) AND child-repo layout
        # (.agents/specs/) — the latter was never checked, making the
        # gate inoperative-but-blocking in every child repo
        # (ACTOCCATUD 2026-06-02). Most-recently-modified wins.
        local sd candidate
        for sd in "$current/specs" "$current/.agents/specs"; do
            [ -d "$sd" ] || continue
            candidate="$(find "$sd" -maxdepth 3 -name 'SPEC.md' -print0 2>/dev/null \
                | xargs -0 grep -l -E '^status:[[:space:]]+(approved|in-execution)' 2>/dev/null \
                | xargs -r ls -t 2>/dev/null \
                | head -n1)"
            if [ -n "$candidate" ]; then
                echo "$candidate"
                return
            fi
        done
        current="$(dirname "$current")"
    done
    echo ""
}

# Read a YAML scalar from SPEC front-matter. Usage: read_front_matter
# <spec-file> <key>
read_front_matter() {
    local file="$1"
    local key="$2"
    awk -v key="$key" '
        BEGIN { in_fm = 0; depth = 0 }
        /^---[[:space:]]*$/ {
            depth++
            if (depth == 1) { in_fm = 1; next }
            if (depth == 2) { in_fm = 0; exit }
        }
        in_fm {
            if (match($0, "^" key ":[[:space:]]*(.*)$", m)) {
                print m[1]
                exit
            }
        }
    ' "$file"
}

# Test whether a YAML list-or-scalar value contains the given item.
yaml_list_contains() {
    local raw="$1"
    local item="$2"
    [ -z "$raw" ] && return 1
    # Normalise: strip [], split on commas, trim whitespace, compare.
    local stripped="${raw#[}"
    stripped="${stripped%]}"
    local IFS=','
    local elem
    for elem in $stripped; do
        # Trim whitespace from both ends.
        elem="${elem## }"
        elem="${elem%% }"
        if [ "$elem" = "$item" ]; then
            return 0
        fi
    done
    return 1
}

# Extract proposed package names from the command/path.
extract_packages() {
    local input="$1"
    # npm install foo bar; pip install foo==1; uv add foo; etc.
    printf '%s' "$input" | grep -oE "$INSTALL_REGEX[[:space:]]+[A-Za-z0-9_./@-]+" \
        | sed -E "s/$INSTALL_REGEX[[:space:]]+//" \
        | tr ' ' '\n' \
        | sed 's/==.*//; s/@.*//; s/.*\///' \
        | grep -v '^-' \
        | grep -v '^$' \
        || true
}

validate_command_line() {
    local input="$1"

    if ! detect_manifest_edit "$input"; then
        return 0
    fi

    local spec
    spec="$(find_active_spec)"
    if [ -z "$spec" ]; then
        echo "FAIL: manifest edit detected but no active SPEC found at status approved/in-execution"
        return 2
    fi

    local emergency override
    emergency="$(read_front_matter "$spec" 'dep_emergency')"
    override="$(read_front_matter "$spec" 'dep_scope_override')"

    if [ "$emergency" = "true" ]; then
        echo "PASS: dep_emergency=true in active SPEC ($spec); manifest edit authorised"
        return 0
    fi

    if [ "$override" = "true" ]; then
        echo "WARN: dep_scope_override=true in active SPEC ($spec); manifest edit allowed with advisory"
        return 1
    fi

    local added changed removed
    added="$(read_front_matter "$spec" 'deps_added')"
    changed="$(read_front_matter "$spec" 'deps_changed')"
    removed="$(read_front_matter "$spec" 'deps_removed')"

    # Extract proposed packages.
    local pkgs
    pkgs="$(extract_packages "$input")"

    if [ -z "$pkgs" ]; then
        # Manifest path mentioned but no specific package extractable
        # (e.g. direct edit). Require ANY of the dep declarations
        # to be present.
        if [ -n "$added" ] || [ -n "$changed" ] || [ -n "$removed" ]; then
            echo "PASS: active SPEC declares dep changes ($spec)"
            return 0
        fi
        echo "FAIL: manifest edit detected; active SPEC ($spec) has no deps_added/deps_changed/deps_removed declaration"
        return 2
    fi

    # Specific packages — verify each is declared.
    local missing=""
    while IFS= read -r pkg; do
        [ -z "$pkg" ] && continue
        if yaml_list_contains "$added" "$pkg" || \
           yaml_list_contains "$changed" "$pkg" || \
           yaml_list_contains "$removed" "$pkg"; then
            continue
        fi
        missing="$missing $pkg"
    done <<< "$pkgs"

    if [ -n "$missing" ]; then
        echo "FAIL: dep change for$missing not declared in active SPEC ($spec deps_added/deps_changed/deps_removed)"
        return 2
    fi

    echo "PASS: dep change declared in active SPEC ($spec)"
    return 0
}

self_test() {
    local pass=0 fail=0
    local sandbox
    sandbox="$(mktemp -d)"
    mkdir -p "$sandbox/specs/active"

    write_spec() {
        local file="$sandbox/specs/active/SPEC.md"
        cat > "$file" <<EOF
---
id: test-active
status: in-execution
type: contract
owner: test
$1
---
# Test SPEC
EOF
    }

    run_case() {
        local name="$1" frontmatter="$2" input="$3" expected="$4"
        write_spec "$frontmatter"
        ACTIVE_SPEC_DIR="$sandbox/specs/active" validate_command_line "$input" >/dev/null 2>&1
        local actual=$?
        if [ "$actual" = "$expected" ]; then
            pass=$((pass + 1))
            printf '  PASS: %s\n' "$name"
        else
            fail=$((fail + 1))
            printf '  FAIL: %s (expected %s, got %s)\n' "$name" "$expected" "$actual" >&2
        fi
    }

    # T12: undeclared npm install foo → BLOCK
    run_case "undeclared-npm-install" "" "npm install foo" 2

    # T13: declared via deps_added → PASS
    run_case "declared-deps_added" \
        "deps_added: [foo]" \
        "npm install foo" 0

    # T14: dep_emergency: true → PASS
    run_case "dep-emergency" \
        "dep_emergency: true" \
        "npm install foo" 0

    # T15: dep_scope_override: true → WARN
    run_case "dep-scope-override-warn" \
        "dep_scope_override: true" \
        "npm install foo" 1

    # T16: non-manifest commit → PASS silently
    run_case "non-manifest-commit-allowed" \
        "" \
        "git commit -m 'no manifest'" 0

    # Extra: pip install variant
    run_case "declared-pip-install" \
        "deps_added: [requests]" \
        "pip install requests" 0

    # Extra: undeclared pip install
    run_case "undeclared-pip-install" "" "pip install requests" 2

    # Extra: direct package.json edit without declaration
    run_case "undeclared-direct-manifest-edit" \
        "" \
        "sed -i 's/foo/bar/' package.json" 2

    # T24: heredoc body merely MENTIONING a manifest is immune.
    run_case "heredoc-mention-immune" \
        "" \
        'cat > /tmp/notes.md <<EOF
this text mentions Cargo.toml and package.json
EOF' 0

    # T25: quoted string merely MENTIONING a manifest is immune.
    run_case "quoted-mention-immune" \
        "" \
        'git commit -m "docs: explain the Cargo.toml gotcha"' 0

    # T20: pure build with --manifest-path is NOT a dep change
    # (ACTOCCATUD 2026-06-02 false-positive).
    run_case "build-manifest-path-not-dep-change" \
        "" \
        "cargo build --manifest-path spike/Cargo.toml" 0

    # T21: build followed by an undeclared cargo add still blocks.
    run_case "build-then-undeclared-cargo-add" \
        "" \
        "cargo build --manifest-path spike/Cargo.toml && cargo add godot" 2

    # T22: declared cargo add passes.
    run_case "declared-cargo-add" \
        "deps_added: [godot]" \
        "cargo add godot" 0

    # T23: child-repo layout — active SPEC under .agents/specs/ is
    # found via the CLAUDE_PROJECT_DIR walk (no ACTIVE_SPEC_DIR).
    local sandbox2
    sandbox2="$(mktemp -d)"
    mkdir -p "$sandbox2/.agents/specs/active"
    cat > "$sandbox2/.agents/specs/active/SPEC.md" <<'EOF2'
---
id: test-child-layout
status: in-execution
type: task
owner: test
deps_added: [godot]
---
# Test child-layout SPEC
EOF2
    local actual23
    ACTIVE_SPEC_DIR= CLAUDE_PROJECT_DIR="$sandbox2" validate_command_line "cargo add godot" >/dev/null 2>&1
    actual23=$?
    if [ "$actual23" = "0" ]; then
        pass=$((pass + 1)); printf '  PASS: %s\n' "child-layout-agents-specs-found"
    else
        fail=$((fail + 1)); printf '  FAIL: %s (expected 0, got %s)\n' "child-layout-agents-specs-found" "$actual23" >&2
    fi
    rm -rf "$sandbox2"

    rm -rf "$sandbox"
    printf '\nvalidate-deps-declaration self-test: %d PASS, %d FAIL\n' "$pass" "$fail"
    [ "$fail" -eq 0 ]
}

main() {
    case "${1:-}" in
        --help|-h)
            cat <<'USAGE'
validate-deps-declaration.sh — fleet dep-hygiene helper

Modes:
  validate-deps-declaration.sh "<command-line>"
  validate-deps-declaration.sh -            (stdin)
  validate-deps-declaration.sh --self-test
  validate-deps-declaration.sh --help

Exit codes:
  0  PASS    1  WARN    2  FAIL
USAGE
            return 0
            ;;
        --self-test)
            self_test
            return $?
            ;;
        -)
            local input
            input="$(cat)"
            validate_command_line "$input"
            return $?
            ;;
        "")
            echo "usage: validate-deps-declaration.sh \"<command>\" | - | --self-test | --help" >&2
            return 2
            ;;
        *)
            validate_command_line "$1"
            return $?
            ;;
    esac
}

main "$@"
