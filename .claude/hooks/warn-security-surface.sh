#!/usr/bin/env bash
# PreToolUse: warn on Bash / Edit / Write that touches a security
# surface (auth / pii / secrets / network / etc.) when the active
# SPEC declares security_surface=none.
# Per specs/2026-05-25-fleet-security-surface-discipline/SPEC.md §7.

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
                printf '\n%s' "$input" | jq -r '.tool_input.new_string // .tool_input.content // empty' 2>/dev/null
                ;;
            *)
                printf '%s' "$input" | jq -r '.tool_input.command // .tool_input.file_path // empty' 2>/dev/null
                ;;
        esac
    else
        printf '%s' "$input" | grep -oE '"(command|file_path|content)"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/^"[^"]+"[[:space:]]*:[[:space:]]*"(.*)"$/\1/'
    fi
}

input="$(read_command)"

# Helper resolution.
helper=""
for c in \
    "${CLAUDE_PROJECT_DIR:-}/agents/scripts/validate-security-surface.sh" \
    "${CLAUDE_PROJECT_DIR:-}/.agents/scripts/validate-security-surface.sh"
do
    [ -x "$c" ] && { helper="$c"; break; }
done

if [ -z "$helper" ]; then
    exit 0
fi

out="$(bash "$helper" "$input" 2>&1)"
rc=$?

case "$rc" in
    0) exit 0 ;;
    1)
        printf 'warn-security-surface: %s\n' "$out" >&2
        exit 0
        ;;
    2)
        printf 'warn-security-surface: FAIL — %s\n' "$out" >&2
        exit 2
        ;;
    *)
        printf 'warn-security-surface: helper exit %s; allowing call.\n' "$rc" >&2
        exit 0
        ;;
esac
