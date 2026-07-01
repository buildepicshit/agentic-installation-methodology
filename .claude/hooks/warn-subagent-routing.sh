#!/usr/bin/env bash
# PreToolUse(Task|Agent): advisory nudge to pin a fit-appropriate model
# on subagent dispatch when no explicit model choice is present.
# Advisory only — always exits 0, never blocks, fails open silently.
# Contract: specs/2026-06-10-model-capability-matrix/SPEC.md §7.2/§7.2a/§9.1.

set -o pipefail

# §7.2a static silent list: subagent types with known harness
# auto-routing. Exact full-string match. Every entry MUST have a
# matching false-positive test in .claude/hooks/tests/run-tests.sh.
readonly KNOWN_AUTOROUTED_AGENT_TYPES=("Explore")

advise() {
    printf 'warn-subagent-routing: no model pinned on this subagent dispatch. Consult the Capability Matrix (agents/MODEL_ROUTING.md or .agents/MODEL_ROUTING.md) and pin a fit-appropriate model — capability fit, not reflexive frontier.\n' >&2
}

main() {
    local input tool model subagent_type
    input="$(cat)" || return 0
    command -v jq >/dev/null 2>&1 || return 0

    # Condition 1: dispatch tools only.
    tool="$(printf '%s' "$input" | jq -r '.tool_name // empty' 2>/dev/null)" || return 0
    case "$tool" in
        Task|Agent) ;;
        *) return 0 ;;
    esac

    # Condition 2: fleet-level env pin (highest precedence in the
    # documented subagent model resolution order). A set value other
    # than the literal `inherit` is an explicit pin.
    local env_pin="${CLAUDE_CODE_SUBAGENT_MODEL:-}"
    if [ -n "$env_pin" ] && [ "$env_pin" != "inherit" ]; then
        return 0
    fi

    # Condition 3: per-invocation model parameter. Whitespace-only
    # values are NOT a pin.
    model="$(printf '%s' "$input" | jq -r '.tool_input.model // empty' 2>/dev/null | tr -d '[:space:]')" || return 0
    if [ -n "$model" ]; then
        return 0
    fi

    # Condition 4: subagent_type — static silent list, then
    # best-effort definition-frontmatter lookup. Unlocatable or
    # unreadable definitions count as unpinned (advisory fires; a
    # false positive costs one stderr line).
    subagent_type="$(printf '%s' "$input" | jq -r '.tool_input.subagent_type // empty' 2>/dev/null)" || return 0
    if [ -n "$subagent_type" ]; then
        local t dir def pinned
        for t in "${KNOWN_AUTOROUTED_AGENT_TYPES[@]}"; do
            if [ "$subagent_type" = "$t" ]; then
                return 0
            fi
        done
        # Definition lookup only for safe simple names: no path
        # separators, no dots (blocks ../ traversal out of the agents
        # dirs). Unsafe names count as unpinned — advisory fires (safe
        # default per the option-ARGUMENT bypass-class discipline).
        if [[ "$subagent_type" =~ ^[A-Za-z0-9][A-Za-z0-9_:-]*$ ]]; then
            for dir in "${CLAUDE_PROJECT_DIR:-.}/.claude/agents" "${HOME:-/nonexistent}/.claude/agents"; do
                def="$dir/$subagent_type.md"
                if [ -r "$def" ]; then
                    # Frontmatter model: value — strip trailing
                    # comment, surrounding quotes, and edge whitespace
                    # before the inherit comparison.
                    pinned="$(awk '/^---[[:space:]]*$/{c++; next} c==1 && /^model:[[:space:]]*/ { v=$0; sub(/^model:[[:space:]]*/,"",v); sub(/[[:space:]]*#.*$/,"",v); gsub(/^[[:space:]]+|[[:space:]]+$/,"",v); gsub(/^[\"'"'"']+|[\"'"'"']+$/,"",v); gsub(/^[[:space:]]+|[[:space:]]+$/,"",v); print v; exit }' "$def" 2>/dev/null)"
                    if [ -n "$pinned" ] && [ "$pinned" != "inherit" ]; then
                        return 0
                    fi
                    break
                fi
            done
        fi
    fi

    advise
    return 0
}

main
exit 0
