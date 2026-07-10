#!/usr/bin/env bash
# PreToolUse(Bash): block real --no-verify / --no-gpg-sign on git ops.
set -uo pipefail

# extract_real_commands: emit one logical command per line, with quoted strings
# and heredoc bodies stripped, so we only see the verb-position tokens.
extract_real_commands() {
    awk '
    BEGIN { in_heredoc = 0; tag = "" }
    {
        line = $0
        if (in_heredoc) {
            if (line ~ ("^" tag "$") || line ~ ("^[[:space:]]*" tag "$")) {
                in_heredoc = 0; tag = ""
            }
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
        n = split(line, parts, /(&&|\|\||;|\||&)/)
        for (i = 1; i <= n; i++) {
            sub(/^[[:space:]]+/, "", parts[i])
            sub(/[[:space:]]+$/, "", parts[i])
            if (parts[i] != "") print parts[i]
        }
    }'
}

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
fired=0; matched=""
while IFS= read -r real_cmd; do
    [ -z "$real_cmd" ] && continue
    # Tolerate git GLOBAL options (incl. value-carrying -C/-c/--git-dir
    # forms) between `git` and the subcommand — same classifier as
    # block-probe-residue.sh (ported per SE3 of
    # specs/2026-06-09-mutation-probe-isolation-discipline).
    if printf '%s' "$real_cmd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+(commit|push|rebase|merge|revert|cherry-pick|am)\b'; then
        if printf '%s' "$real_cmd" | grep -qE -- '(--no-verify|--no-gpg-sign)\b'; then
            fired=1; matched="$real_cmd"; break
        fi
        # core.hooksPath redirect on a guarded op sidesteps the installed
        # hooks entirely (P4 hook-guardrail-hardening, 2026-07-02).
        if printf '%s' "$real_cmd" | grep -qE 'core\.hooksPath'; then
            fired=1; matched="$real_cmd [core.hooksPath redirect]"; break
        fi
        # `-n` is --no-verify for COMMIT only (push -n = dry-run,
        # merge -n = no-stat). Detect a short-option cluster containing n
        # on a commit invocation, incl. combined forms (-nm, -anm).
        # Tokens after a `--` pathspec separator are FILE NAMES, not
        # options — strip them first (r1 cross-family catch).
        pre_dd="$real_cmd"
        case "$pre_dd" in *" -- "*) pre_dd="${pre_dd%% -- *}" ;; esac
        if printf '%s' "$pre_dd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+commit\b' \
           && printf '%s' "$pre_dd" | grep -qE '[[:space:]]-[A-Za-z]*n[A-Za-z]*([[:space:]]|$)'; then
            fired=1; matched="$real_cmd [-n short-form no-verify]"; break
        fi
    fi
done < <(printf '%s' "$command" | extract_real_commands)

if [ "$fired" = "1" ]; then
    printf 'block-verify-bypass: verify gate is non-negotiable. (matched: %s)\n' "$matched" >&2
    exit 2
fi
exit 0
