#!/usr/bin/env bash
# PreToolUse(Bash): validate cross-agent CLI invocations
# (claude, copilot) before they fire.
#
# Implements the canonical exit-code mapping from
# `specs/2026-05-25-agent-cli-invocation-craft/SPEC.md` §7.5:
#   helper exit 0 → hook exit 0 (allow silent)
#   helper exit 1 → hook exit 0 with stderr WARN (allow + warning)
#   helper exit 2 → hook exit 2 (block per Claude Code PreToolUse contract)
#   helper unexpected exit → hook exit 2 (defense-in-depth fail-closed)
#
# Helper resolution per SPEC §7.5.1: try source-repo layout first,
# fall back to child-repo layout. If neither present, allow with
# diagnostic (helper presence is a fleet propagation precondition,
# not a per-invocation gate).

set -uo pipefail

read_command() {
    local input
    input="$(cat)"
    if command -v jq >/dev/null 2>&1; then
        printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null || true
    else
        printf '%s' "$input" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/^"command"[[:space:]]*:[[:space:]]*"(.*)"$/\1/'
    fi
}

command="$(read_command)"

# Early-out: no `claude` or `copilot` in the proposed command.
# This is just a fast-path check; the helper does its own detection
# more rigorously.
if ! printf '%s' "$command" | grep -qE '(\bclaude\b|\bcopilot\b)'; then
    exit 0
fi

# Resolve helper path. ${CLAUDE_PROJECT_DIR} is provided by Claude
# Code per the hooks contract.
helper=""
for candidate in \
    "${CLAUDE_PROJECT_DIR:-}/agents/scripts/validate-cli-invocation.sh" \
    "${CLAUDE_PROJECT_DIR:-}/.agents/scripts/validate-cli-invocation.sh"
do
    if [ -x "$candidate" ]; then
        helper="$candidate"
        break
    fi
done

if [ -z "$helper" ]; then
    printf 'block-bad-cli-invocation: validate-cli-invocation.sh not found under %s or %s — fleet propagation precondition unmet; allowing call.\n' \
        "${CLAUDE_PROJECT_DIR:-?}/agents/scripts" \
        "${CLAUDE_PROJECT_DIR:-?}/.agents/scripts" >&2
    exit 0
fi

# Invoke helper. Capture stdout (PASS/WARN/FAIL lines), let stderr
# pass through.
helper_out="$(bash "$helper" "$command" 2>&1)"
helper_rc=$?

case "$helper_rc" in
    0)
        # PASS — allow silently.
        exit 0
        ;;
    1)
        # WARN — allow with stderr message.
        printf 'block-bad-cli-invocation: WARN — cross-agent CLI invocation has advisory issues:\n%s\n' "$helper_out" >&2
        exit 0
        ;;
    2)
        # FAIL — block.
        printf 'block-bad-cli-invocation: FAIL — cross-agent CLI invocation BLOCKED:\n%s\n' "$helper_out" >&2
        printf '(see file://specs/2026-05-25-agent-cli-invocation-craft/SPEC.md for details)\n' >&2
        exit 2
        ;;
    *)
        # Unexpected exit — fail closed.
        printf 'block-bad-cli-invocation: FAIL — validate-cli-invocation.sh exited unexpectedly (code %d); blocking defensively:\n%s\n' \
            "$helper_rc" "$helper_out" >&2
        exit 2
        ;;
esac
