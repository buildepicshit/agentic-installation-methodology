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
    msg="$(git log -1 --format=%B "$rev" 2>/dev/null)" || { echo "ERROR: cannot read $rev" >&2; AUDIT_GIT_ERR=1; return 0; }
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
# Git errors are signalled via AUDIT_GIT_ERR (a distinct channel), NOT via a
# 64 return value — otherwise a commit with exactly 64 overclaimed paths would
# be misread as a git/usage error, and in --range mode a git error would be
# silently summed into the warning total instead of aborting.
AUDIT_GIT_ERR=0
if [ "${1:-}" = "--range" ]; then
    [ -n "${2:-}" ] || { echo "usage: audit-tracked-paths.sh --range <a>..<b>" >&2; exit 64; }
    # Capture rev-list output AND status up front — process substitution hides
    # the exit status, so an invalid range would otherwise iterate zero times
    # and falsely report clean.
    revs="$(git rev-list "$2" 2>/dev/null)" || { echo "ERROR: git rev-list failed for range: $2" >&2; exit 64; }
    while IFS= read -r rev; do
        [ -n "$rev" ] || continue
        audit_rev "$rev"; total=$((total + $?))
        [ "$AUDIT_GIT_ERR" = "1" ] && { echo "ERROR: git error during range audit; aborting" >&2; exit 64; }
    done <<< "$revs"
else
    audit_rev "${1:-HEAD}"; total=$?
    [ "$AUDIT_GIT_ERR" = "1" ] && exit 64
fi
echo "audit-tracked-paths: $total warning(s)"
[ "$total" -eq 0 ]
