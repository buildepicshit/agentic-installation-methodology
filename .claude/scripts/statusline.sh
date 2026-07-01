#!/usr/bin/env bash
# Statusline + SessionStart context. Read-only, sub-second.
# Auto-detects repo name and branch; tallies spec statuses by parsing
# only the front-matter of each SPEC.md (so body mentions of
# "status: approved" do not double-count).

set -u

repo_root="$(git -C "${CLAUDE_PROJECT_DIR:-$PWD}" rev-parse --show-toplevel 2>/dev/null)" || repo_root="$PWD"
cd "$repo_root" 2>/dev/null || true

repo_name="$(basename "$repo_root")"
branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo unknown)"

blocking=0; verified=0; approved=0; in_exec=0
for d in .agents/specs specs; do
    [ -d "$d" ] || continue
    for f in "$d"/*/SPEC.md; do
        [ -f "$f" ] || continue
        st=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit} /^status:/{gsub(/^status:[[:space:]]*/,""); print; exit}' "$f")
        case "$st" in
            owner-blocking|draft-owner-blocking) blocking=$((blocking+1)) ;;
            verified)                            verified=$((verified+1)) ;;
            approved)                            approved=$((approved+1)) ;;
            in-execution)                        in_exec=$((in_exec+1)) ;;
        esac
    done
done

printf '%s | branch:%s | specs verified:%s approved:%s in-exec:%s owner-blocking:%s\n' \
    "$repo_name" "$branch" "$verified" "$approved" "$in_exec" "$blocking"
