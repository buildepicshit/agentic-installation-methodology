#!/usr/bin/env bash
# PreToolUse(Bash): block real `git push` invocations targeting the protected
# branch UNLESS any SPEC (approved/decomposed/in-execution/verified/closed) declares
# branch_policy: main-direct. A closed SPEC represents settled policy that
# persists until superseded. Mirrors block-edit-on-main.sh policy.
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
    # forms) between `git` and `push` — same classifier as
    # block-probe-residue.sh (P4 hook-guardrail-hardening, 2026-07-02).
    if printf '%s' "$real_cmd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+push\b'; then
        # Source part of the refspec is OPTIONAL-and-possibly-EMPTY:
        # `:main` / `+:main` / `:refs/heads/main` are DELETE pushes to
        # main (r2 cross-family catch).
        if printf '%s' "$real_cmd" | grep -qE '(^|[[:space:]])\+?([A-Za-z0-9_./-]*:)?(refs/heads/)?main([[:space:]]|$)'; then
            fired=1; matched="$real_cmd"; break
        fi
        # Bare push (no explicit refspec) resolves to the CURRENT branch:
        # `git push` / `git push origin` / `git push -u origin` on main are
        # pushes to main. Count non-option tokens after `push`; <= 1 means
        # no explicit ref was named. Outside a git repo the branch cannot
        # resolve and the push would fail anyway — allow (fail-open).
        # Value-carrying push options (space form) would miscount their
        # VALUE as a ref token — skip it (r1 cross-family catch).
        bare_targets=$(printf '%s' "$real_cmd" | awk '{
            seen = 0; n = 0
            for (i = 1; i <= NF; i++) {
                if (!seen) { if ($i == "push") seen = 1; continue }
                if ($i == "-o" || $i == "--push-option" || $i == "--receive-pack" || $i == "--exec" || $i == "--repo") { i++; continue }
                if ($i !~ /^-/) n++
            }
            print n
        }')
        if [ "${bare_targets:-2}" -le 1 ]; then
            cur=$(git symbolic-ref --short -q HEAD 2>/dev/null || true)
            if [ "$cur" = "main" ]; then
                fired=1; matched="$real_cmd [bare push; current branch is main]"; break
            fi
        fi
    fi
done < <(printf '%s' "$command" | extract_real_commands)

[ "$fired" = "1" ] || exit 0

# Push-to-main detected. Honour `branch_policy: main-direct` if any SPEC at
# approved/decomposed/in-execution/verified/closed declares it.
repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [ -n "$repo_root" ]; then
    allow_main_direct=0
    for d in "$repo_root/.agents/specs" "$repo_root/specs"; do
        [ -d "$d" ] || continue
        for f in "$d"/*/SPEC.md; do
            [ -f "$f" ] || continue
            st=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit} /^status:/{gsub(/^status:[[:space:]]*/,""); print; exit}' "$f")
            case "$st" in
                approved|decomposed|in-execution|verified|closed)
                    bp=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit} /^branch_policy:/{gsub(/^branch_policy:[[:space:]]*/,""); print; exit}' "$f")
                    if [ "$bp" = "main-direct" ]; then
                        allow_main_direct=1; break 2
                    fi
                    ;;
            esac
        done
    done
    [ "$allow_main_direct" = "1" ] && exit 0
fi

printf 'block-push-to-main: protected branch is non-pushable. Open a PR. (matched: %s)\n' "$matched" >&2
exit 2
