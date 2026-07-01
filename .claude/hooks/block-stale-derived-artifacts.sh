#!/usr/bin/env bash
# PreToolUse(Bash): block real `git commit` in the policy source repo when
# derived fleet artefacts are stale. Exit map: 2 = block; 0 = pass / fail open.
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

is_real_commit_command() {
    local real_cmd="$1"
    local pre_dd
    pre_dd="$(printf '%s' "$real_cmd" | sed 's/[[:space:]]--[[:space:]].*$//')"
    if printf '%s' "$pre_dd" | grep -qE '(^|[[:space:]])--help([[:space:]]|$)'; then
        return 1
    fi
    if printf '%s' "$real_cmd" | grep -qE '^git[[:space:]]+--version([[:space:]]|$)'; then
        return 1
    fi
    if ! printf '%s' "$real_cmd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+commit([[:space:]]|$)'; then
        return 1
    fi
    # This guard treats any `--help` attached to `git commit` as non-mutating,
    # including the explicit contract case `git commit -- --help`.
    if printf '%s' "$real_cmd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+commit([[:space:]]|$).*([[:space:]]|^)--help([[:space:]]|$)'; then
        return 1
    fi
    return 0
}

resolve_repo_root() {
    local real_cmd="$1"
    local -a git_args=()
    local -a tokens=()
    local token next opt
    local git_dir="" work_tree="" base_dir
    # shellcheck disable=SC2206
    tokens=($real_cmd)
    [ "${tokens[0]:-}" = "git" ] || return 1
    base_dir="$(pwd -P 2>/dev/null)" || return 1

    local i=1
    while [ "$i" -lt "${#tokens[@]}" ]; do
        token="${tokens[$i]}"
        case "$token" in
            commit)
                break
                ;;
            -C)
                i=$((i+1))
                [ "$i" -lt "${#tokens[@]}" ] || return 1
                next="${tokens[$i]}"
                case "$next" in ''|*'$'*) return 1 ;; esac
                case "$next" in
                    /*) base_dir="$(CDPATH= cd -- "$next" 2>/dev/null && pwd -P)" || return 1 ;;
                    *) base_dir="$(CDPATH= cd -- "$base_dir/$next" 2>/dev/null && pwd -P)" || return 1 ;;
                esac
                git_args+=("-C" "$next")
                ;;
            -c)
                i=$((i+1))
                [ "$i" -lt "${#tokens[@]}" ] || return 1
                ;;
            --git-dir|--work-tree)
                opt="$token"
                i=$((i+1))
                [ "$i" -lt "${#tokens[@]}" ] || return 1
                next="${tokens[$i]}"
                case "$next" in ''|*'$'*) return 1 ;; esac
                git_args+=("$opt" "$next")
                if [ "$opt" = "--git-dir" ]; then
                    git_dir="$next"
                else
                    work_tree="$next"
                fi
                ;;
            --git-dir=*|--work-tree=*)
                case "$token" in *'$'*) return 1 ;; esac
                git_args+=("$token")
                case "$token" in
                    --git-dir=*) git_dir="${token#--git-dir=}" ;;
                    --work-tree=*) work_tree="${token#--work-tree=}" ;;
                esac
                ;;
            --namespace)
                i=$((i+1))
                [ "$i" -lt "${#tokens[@]}" ] || return 1
                ;;
            --namespace=*)
                ;;
            --*)
                ;;
            -?*)
                ;;
            *)
                return 1
                ;;
        esac
        i=$((i+1))
    done

    if [ -n "$work_tree" ]; then
        case "$work_tree" in
            /*) CDPATH= cd -- "$work_tree" 2>/dev/null && pwd -P && return 0 ;;
            *) CDPATH= cd -- "$base_dir/$work_tree" 2>/dev/null && pwd -P && return 0 ;;
        esac
    fi

    if [ -n "$git_dir" ]; then
        local abs_git_dir
        case "$git_dir" in
            /*) abs_git_dir="$git_dir" ;;
            *) abs_git_dir="$base_dir/$git_dir" ;;
        esac
        abs_git_dir="$(CDPATH= cd -- "$abs_git_dir" 2>/dev/null && pwd -P)" || return 1
        if [ "$(basename -- "$abs_git_dir")" = ".git" ]; then
            dirname -- "$abs_git_dir"
            return 0
        fi
    fi

    git "${git_args[@]}" rev-parse --show-toplevel 2>/dev/null && return 0

    return 1
}

is_source_repo() {
    local root="$1"
    [ -f "$root/agents/scripts/fleet-skills.txt" ] && [ ! -f "$root/.agents/scripts/fleet-skills.txt" ]
}

command="$(read_command)"
target_root=""
while IFS= read -r real_cmd; do
    [ -n "$real_cmd" ] || continue
    is_real_commit_command "$real_cmd" || continue
    target_root="$(resolve_repo_root "$real_cmd" 2>/dev/null || true)"
    break
done < <(printf '%s' "$command" | extract_real_commands)

[ -n "$target_root" ] || exit 0
is_source_repo "$target_root" || exit 0

selfcheck="$target_root/agents/scripts/fleet-selfcheck.sh"
[ -r "$selfcheck" ] || exit 0

check_output="$(bash "$selfcheck" --check 2>&1)"
check_rc=$?
if [ "$check_rc" -ne 0 ]; then
    {
        printf 'block-stale-derived-artifacts: stale derived artefacts detected in the policy source repo; commit blocked.\n'
        printf 'Remediation: bash agents/scripts/fleet-selfcheck.sh --fix\n'
        [ -n "$check_output" ] && printf '%s\n' "$check_output"
    } >&2
    exit 2
fi

exit 0
