#!/usr/bin/env bash
# audit-tracked-paths.sh — ADVISORY lint: flag file paths claimed in a
# commit message that are neither in that commit's change list nor
# tracked at that commit (commit-message overclaim detection).
#
# Origin: ACTOCCATUD 2026-06-02 — a .gitignore rule silently swallowed
# a source file while the commit message claimed it for two days.
# Practice codified in agents/skills/verification/SKILL.md
# "Tracked-Path Claims"; this is the mechanical sweep.
#
# usage: audit-tracked-paths.sh [<rev>]        (default HEAD)
#        audit-tracked-paths.sh --range <a>..<b>
# Exit: 0 clean, 1 warnings found (advisory — do not wire as a
# blocking hook without a contract SPEC), 64 usage/git error.
set -uo pipefail

audit_rev() {
    local rev="$1" warns=0
    local msg changed tracked
    msg="$(git log -1 --format=%B "$rev" 2>/dev/null)" || { echo "ERROR: cannot read $rev" >&2; return 64; }
    changed="$(git show --name-only --format= "$rev" 2>/dev/null)"
    tracked="$(git ls-tree -r --name-only "$rev" 2>/dev/null)"
    # Path-looking tokens: contain a slash AND end in a short extension.
    local t
    while IFS= read -r t; do
        [ -z "$t" ] && continue
        case "$t" in http*|*://*) continue ;; esac
        printf '%s\n' "$changed" | grep -qF "$t" && continue
        printf '%s\n' "$tracked" | grep -qF "$t" && continue
        printf 'WARN: %s claims path "%s" — not in the commit change list and not tracked at that rev\n' "$rev" "$t"
        warns=$((warns + 1))
    done < <(printf '%s\n' "$msg" | grep -oE '[A-Za-z0-9_.-]+(/[A-Za-z0-9_.-]+)+\.[A-Za-z0-9]{1,6}' | sort -u)
    return "$warns"
}

total=0
if [ "${1:-}" = "--range" ]; then
    [ -n "${2:-}" ] || { echo "usage: audit-tracked-paths.sh --range <a>..<b>" >&2; exit 64; }
    while IFS= read -r rev; do
        audit_rev "$rev"; total=$((total + $?))
    done < <(git rev-list "$2")
else
    audit_rev "${1:-HEAD}"; total=$?
    [ "$total" = "64" ] && exit 64
fi
echo "audit-tracked-paths: $total warning(s)"
[ "$total" -eq 0 ]
