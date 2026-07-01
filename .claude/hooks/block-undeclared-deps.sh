#!/usr/bin/env bash
# PreToolUse: block manifest-touching Bash / Edit / Write tool
# calls that lack a declaration in the active SPEC. Per
# specs/2026-05-25-fleet-dependency-hygiene/SPEC.md §7.2.

set -uo pipefail

read_command() {
    local input
    input="$(cat)"
    if command -v jq >/dev/null 2>&1; then
        local tool
        tool="$(printf '%s' "$input" | jq -r '.tool_name // empty' 2>/dev/null)"
        case "$tool" in
            Bash)
                printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null
                ;;
            Edit|Write|MultiEdit)
                printf '%s' "$input" | jq -r '.tool_input.file_path // empty' 2>/dev/null
                ;;
            *)
                printf '%s' "$input" | jq -r '.tool_input.command // .tool_input.file_path // empty' 2>/dev/null
                ;;
        esac
    else
        printf '%s' "$input" | grep -oE '"(command|file_path)"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/^"(command|file_path)"[[:space:]]*:[[:space:]]*"(.*)"$/\2/'
    fi
}

input="$(read_command)"

# Early-out: nothing manifest-shaped in the input.
if ! printf '%s' "$input" | grep -qE '(package(-lock)?\.json|pnpm-lock\.yaml|pyproject\.toml|requirements[^[:space:]]*\.txt|uv\.lock|Pipfile|go\.(mod|sum)|Cargo\.(toml|lock)|npm[[:space:]]+(install|i|add)|pnpm[[:space:]]+(install|add)|yarn[[:space:]]+add|pip3?[[:space:]]+install|uv[[:space:]]+add|poetry[[:space:]]+add|go[[:space:]]+get|cargo[[:space:]]+add)'; then
    exit 0
fi

# Resolve helper.
helper=""
for candidate in \
    "${CLAUDE_PROJECT_DIR:-}/agents/scripts/validate-deps-declaration.sh" \
    "${CLAUDE_PROJECT_DIR:-}/.agents/scripts/validate-deps-declaration.sh"
do
    if [ -x "$candidate" ]; then
        helper="$candidate"
        break
    fi
done

if [ -z "$helper" ]; then
    printf 'block-undeclared-deps: validate-deps-declaration.sh not found; allowing call.\n' >&2
    exit 0
fi

helper_out="$(bash "$helper" "$input" 2>&1)"
helper_rc=$?

case "$helper_rc" in
    0) exit 0 ;;
    1)
        printf 'block-undeclared-deps: WARN — %s\n' "$helper_out" >&2
        exit 0
        ;;
    2)
        printf 'block-undeclared-deps: FAIL — manifest edit not declared in active SPEC:\n%s\n' "$helper_out" >&2
        printf '(see file://specs/2026-05-25-fleet-dependency-hygiene/SPEC.md)\n' >&2
        exit 2
        ;;
    *)
        printf 'block-undeclared-deps: FAIL — helper exited unexpectedly (%d):\n%s\n' "$helper_rc" "$helper_out" >&2
        exit 2
        ;;
esac
