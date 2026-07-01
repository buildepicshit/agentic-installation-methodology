#!/usr/bin/env bash
# PreToolUse(Bash): block real `git commit` while the working tree carries
# mutation-probe residue (the literal marker "MUTATION PROBE" in swept code
# surfaces). Mechanical backstop for the post-workflow tree-hygiene gate per
# agents/skills/code-review/references/multi-agent-review.md and
# specs/2026-06-09-mutation-probe-isolation-discipline/SPEC.md (bes-fleet-policy).
#
# Layer separation: this hook is the CODE-surface gate. Markdown and spec
# corpora are excluded because they legitimately QUOTE the marker convention
# (feedback entries, journals, captured review transcripts); doc-surface
# residue is covered by the orchestrator diff gate, not this hook.
#
# Exit map: 2 = block (residue listed on stderr); 0 = pass / fail open
# (non-git dir, non-commit command, git-grep error).
# Defense-in-depth: works correctly whether or not the settings.json `if`
# field pre-filtered (per https://code.claude.com/docs/en/hooks).
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
is_commit=0
uses_C=0
# Classify a real `git ... commit` in verb position, tolerating git
# GLOBAL options that carry arguments (`-C <path>`, `-c <k>=<v>`,
# separated-value `--git-dir`/`--work-tree`/`--namespace`,
# `--long[=val]`, single-letter flags) between `git` and the
# subcommand — `git -C /repo commit` is a real commit
# (cross-family diff review r1/r2 catches). Help/version forms are
# print-and-exit, never commits.
while IFS= read -r real_cmd; do
    [ -z "$real_cmd" ] && continue
    # Help detection only counts BEFORE a `--` pathspec separator
    # (`git commit -- --help` is a pathspec, not help mode).
    pre_dd="$(printf '%s' "$real_cmd" | sed 's/[[:space:]]--[[:space:]].*$//')"
    if printf '%s' "$pre_dd" | grep -qE '(^|[[:space:]])--help([[:space:]]|$)'; then
        continue
    fi
    if printf '%s' "$real_cmd" | grep -qE '^git[[:space:]]+--version([[:space:]]|$)'; then
        continue
    fi
    if printf '%s' "$real_cmd" | grep -qE '^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+commit([[:space:]]|$)'; then
        is_commit=1
        break
    fi
done < <(printf '%s' "$command" | extract_real_commands)

[ "$is_commit" = "1" ] || exit 0

# Sweep-target resolution. Quote-stripping loses quoted -C values and
# a later `-C` elsewhere in the payload (chained command, message)
# could shadow the real target (cross-family diff review r2 + r3 catches).
# So: sweep the UNION of (a) the cwd repo and (b) the repo of EVERY
# resolvable raw `-C` candidate. Over-sweeping is safe for a residue
# gate (it only ever blocks when real residue exists in a referenced
# repo); fail-open ordering games are not.
sweep_roots=""
add_root() {
    local r="$1"
    [ -n "$r" ] || return 0
    case "$sweep_roots" in *"|$r|"*) return 0 ;; esac
    sweep_roots="${sweep_roots}|$r|"
}
add_root "$(git rev-parse --show-toplevel 2>/dev/null)"
while IFS= read -r cand; do
    cand="$(printf '%s' "$cand" | sed -E 's/^-C[[:space:]]+//; s/^"(.*)"$/\1/; s/^'\''(.*)'\''$/\1/')"
    case "$cand" in ''|*'$'*) continue ;; esac
    add_root "$(git -C "$cand" rev-parse --show-toplevel 2>/dev/null)"
done < <(printf '%s' "$command" | grep -oE -- '-C[[:space:]]+("[^"]*"|'\''[^'\'']*'\''|[^[:space:]]+)')
[ -n "$sweep_roots" ] || exit 0

# Sweep each candidate working tree (tracked + untracked, binaries
# skipped) from its repo root. Options MUST precede the pattern;
# pathspec exclusions keep convention-quoting surfaces out (rationale
# in the references file).
all_residue=""
old_ifs="$IFS"; IFS='|'
for repo_root in $sweep_roots; do
    IFS="$old_ifs"
    [ -n "$repo_root" ] || { IFS='|'; continue; }
    residue="$(git -C "$repo_root" grep --untracked -I -l -e "MUTATION PROBE" \
        -- ':!*.md' ':!specs' ':!.agents/specs' ':!.claude/hooks/tests' \
           ':!.claude/hooks/block-probe-residue.sh' 2>/dev/null)"
    rc=$?
    # rc=1 → no matches (clean); rc>=2 → git grep error: fail open
    # for THIS root.
    if [ "$rc" -eq 0 ] && [ -n "$residue" ]; then
        all_residue="${all_residue}$(printf '%s\n' "$residue" | sed "s|^|  - $repo_root/|")
"
    fi
    IFS='|'
done
IFS="$old_ifs"

if [ -n "$all_residue" ]; then
    {
        printf 'block-probe-residue: working tree carries mutation-probe residue; restore before committing.\n'
        printf 'Mechanics: agents/skills/code-review/references/multi-agent-review.md (or .agents/... in child repos).\n'
        printf 'Residue in:\n'
        printf '%s' "$all_residue"
    } >&2
    exit 2
fi

exit 0
