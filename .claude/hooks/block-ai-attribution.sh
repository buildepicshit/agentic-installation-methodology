#!/usr/bin/env bash
# PreToolUse(Bash): block git commits whose message contains the AI co-author trailer.
# Reads message text from -m, --message=, -F file, or heredoc piped to git commit.
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

# Pass 1: real `git commit` invocation present?
real_commit=0
while IFS= read -r real_cmd; do
    [ -z "$real_cmd" ] && continue
    # Tolerate git GLOBAL options (incl. value-carrying -C/-c/--git-dir
    # forms) between `git` and the subcommand — same classifier as
    # block-probe-residue.sh (cross-family diff-review r1 catch, ported per
    # SE3 of specs/2026-06-09-mutation-probe-isolation-discipline).
    if printf '%s' "$real_cmd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+commit\b'; then
        real_commit=1; break
    fi
done < <(printf '%s' "$command" | extract_real_commands)

[ "$real_commit" = "0" ] && exit 0

# Pass 2: extract message text.
msg=""

m_arg=$(printf '%s' "$command" | grep -oE -- '(-m|--message=)[[:space:]]*("[^"]*"|'"'"'[^'"'"']*'"'"'|[^[:space:]"'"'"']+)' | head -1)
if [ -n "${m_arg:-}" ]; then
    val=$(printf '%s' "$m_arg" | sed -E 's/^(-m|--message=)[[:space:]]*//; s/^"//; s/"$//; s/^'"'"'//; s/'"'"'$//')
    msg="${msg}${val}
"
fi

f_arg=$(printf '%s' "$command" | grep -oE -- '-F[[:space:]]+("[^"]*"|'"'"'[^'"'"']*'"'"'|[^[:space:]]+)' | head -1 | sed -E 's/^-F[[:space:]]+//; s/^"(.*)"$/\1/; s/^'"'"'(.*)'"'"'$/\1/')
if [ -n "${f_arg:-}" ] && [ "$f_arg" != "-" ]; then
    # `git -C <path> commit -F <relative>` reads <relative> from the
    # -C target, not our cwd — resolve accordingly (cross-family closeout
    # diff-review catch; raw quote-aware extraction, unexpandable
    # $vars skipped).
    c_path=$(printf '%s' "$command" | grep -oE -- '-C[[:space:]]+("[^"]*"|'"'"'[^'"'"']*'"'"'|[^[:space:]]+)' | head -1 | sed -E 's/^-C[[:space:]]+//; s/^"(.*)"$/\1/; s/^'"'"'(.*)'"'"'$/\1/')
    case "${c_path:-}" in *'$'*) c_path="" ;; esac
    case "$f_arg" in
        /*) : ;;
        *) if [ -n "${c_path:-}" ] && [ -f "$c_path/$f_arg" ]; then f_arg="$c_path/$f_arg"; fi ;;
    esac
    if [ -f "$f_arg" ]; then
        msg="${msg}$(cat "$f_arg")
"
    fi
fi

if printf '%s' "$command" | grep -qE 'git[[:space:]]+commit[^|]*-F[[:space:]]+-' \
   || printf '%s' "$command" | grep -qE '\|[[:space:]]*git[[:space:]]+commit\b'; then
    body=$(printf '%s' "$command" | awk '
        BEGIN { in_heredoc = 0; tag = "" }
        {
            if (in_heredoc) {
                if ($0 ~ ("^" tag "$") || $0 ~ ("^[[:space:]]*" tag "$")) { in_heredoc = 0; tag = "" }
                else { print }
                next
            }
            if (match($0, /<<-?[[:space:]]*['"'"'"]?[A-Za-z_][A-Za-z0-9_]*['"'"'"]?/)) {
                t = substr($0, RSTART, RLENGTH)
                sub(/^<<-?[[:space:]]*/, "", t)
                gsub(/['"'"'"]/, "", t)
                in_heredoc = 1; tag = t
            }
        }')
    msg="${msg}${body}
"
fi

[ -z "${msg// }" ] && exit 0

if printf '%s' "$msg" | grep -qiE 'co[-_ ]?authored[-_ ]?by'; then
    printf 'block-ai-attribution: studio rule no AI attribution in commits.\n' >&2
    exit 2
fi
exit 0
