#!/usr/bin/env bash
set -uo pipefail
# PreToolUse(Edit|Write): on the protected branch, block edits to repo-TRACKED
# paths UNLESS any SPEC (approved/in-execution/verified/closed) declares
# branch_policy: main-direct. A closed SPEC represents settled policy that
# persists until superseded.
#
# Path-scope (Decision §7 dimension 2, "environment is improvable"): the
# protected-branch gate must not block out-of-repo scratch writes or
# untracked-file creation. On the protected branch with NO main-direct SPEC:
#   - target OUTSIDE the repo            -> ALLOW
#   - target INSIDE the repo, UNTRACKED  -> ALLOW
#   - target INSIDE the repo, TRACKED    -> BLOCK (exit 2)
#   - target path indeterminate          -> FAIL CLOSED (block, exit 2)
# Fail-closed is load-bearing and security-sensitive: a tracked-path edit MUST
# NOT slip through. Anything we cannot prove safe on a protected branch blocks.

# --- Extract the target path from the PreToolUse payload. -------------------
read_file_path() {
    local input
    input="$(cat)"
    # jq is REQUIRED for a trustworthy parse: a grep fallback cannot reject
    # malformed JSON (a fail-open risk where stray "file_path":"..." text in a
    # non-JSON payload would be trusted), so emit empty when jq is absent and
    # fail closed below on the protected-decision path.
    command -v jq >/dev/null 2>&1 || return 0
    # The payload MUST be exactly ONE well-formed JSON value. Slurp (-s) into an
    # array and accept only length 1. This fails closed on: trailing garbage
    # after a valid prefix (jq parse error -> nonzero -> the || below), multiple
    # concatenated JSON texts (length > 1 -> empty), and a single value missing
    # .tool_input.file_path (empty). We gate on jq's EXIT STATUS, never on
    # partial stdout.
    # Require exactly one JSON value AND a path with no control characters,
    # rejecting newline/CR/etc. AT THE jq SOURCE — before shell command
    # substitution can strip trailing bytes and test a mangled path. Any reject
    # -> empty -> the protected-decision path fails closed.
    local out
    out="$(printf '%s' "$input" | jq -s -r 'if length != 1 then empty else (.[0].tool_input.file_path // "") as $p | if ($p == "" or ($p | test("[[:cntrl:]]"))) then empty else $p end end' 2>/dev/null)" || return 0
    printf '%s' "$out"
}
file_path="$(read_file_path)"

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || true)"

# Not on the protected branch (includes non-git dirs where branch is empty):
# nothing to enforce.
[ "$branch" = "main" ] || exit 0

# --- main-direct allow-path (preserved exactly). ---------------------------
allow_main_direct=0
for d in "$repo_root/.agents/specs" "$repo_root/specs"; do
    [ -d "$d" ] || continue
    for f in "$d"/*/SPEC.md; do
        [ -f "$f" ] || continue
        st=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit} /^status:/{gsub(/^status:[[:space:]]*/,""); print; exit}' "$f")
        case "$st" in
            approved|in-execution|verified|closed)
                bp=$(awk 'BEGIN{c=0} /^---/{c++; if(c==2)exit} /^branch_policy:/{gsub(/^branch_policy:[[:space:]]*/,""); print; exit}' "$f")
                if [ "$bp" = "main-direct" ]; then
                    allow_main_direct=1; break 2
                fi
                ;;
        esac
    done
done

[ "$allow_main_direct" = "1" ] && exit 0

# --- Protected branch, no main-direct SPEC: path-scope the block. ----------
# From here on we MUST be able to prove the target is out-of-repo or untracked
# to allow it; otherwise fail closed.

fail_closed() {
    printf 'block-edit-on-main: %s Could not prove the target is out-of-repo or untracked; blocking. Create a feature branch first.\n' "$1" >&2
    exit 2
}

# We need the repo root, jq (trustworthy parse), and a canonicalizer.
[ -n "$repo_root" ] || fail_closed "could not determine repository root."
command -v jq >/dev/null 2>&1 || fail_closed "jq unavailable to parse the payload safely."
command -v realpath >/dev/null 2>&1 || fail_closed "realpath unavailable to canonicalize the target path."
[ -n "$file_path" ] || fail_closed "no tool_input.file_path in the payload (or payload not well-formed JSON)."

# Tracked-ness is the authority: block edits to any repo-TRACKED file. We
# canonicalize TWO ways and block if EITHER resolution is tracked, so neither
# symlink vector bypasses the gate:
#   -ms (no symlink follow): preserves a tracked SYMLINK's own path.
#   -m  (follow symlinks):   resolves a tracked file reached via a symlinked
#                            parent. Both use -m's allow-missing for new files.
abs_literal="$(realpath -ms -- "$file_path" 2>/dev/null || true)"
abs_resolved="$(realpath -m  -- "$file_path" 2>/dev/null || true)"
{ [ -n "$abs_literal" ] && [ -n "$abs_resolved" ]; } || fail_closed "could not canonicalize the target path."

for p in "$abs_literal" "$abs_resolved"; do
    # ':(literal)' disables git pathspec glob magic, so a tracked filename
    # containing *, ?, or [ ] is matched literally and cannot be misclassified
    # as untracked.
    if git ls-files --error-unmatch -- ":(literal)$p" >/dev/null 2>&1; then
        printf 'block-edit-on-main: on protected branch and no active SPEC declares branch_policy: main-direct. %s is repo-tracked. Create a feature branch first.\n' "$file_path" >&2
        exit 2
    fi
done

# Filesystem-alias check (closes hardlink + case-fold + Unicode-normalization
# aliasing, per cross-family review 2026-06-20 round 5): a tracked file
# can be reached under an untracked or byte-different pathname that the
# filesystem resolves to the SAME inode — a hardlink, or a case-insensitive /
# normalization-insensitive worktree (macOS, some Windows). git ls-files is
# pathname-based and misses these. If the target EXISTS and shares a
# device+inode with any tracked file, block. `-ef` is a portable same-inode
# test (bash builtin); a new/nonexistent target cannot alias an existing
# tracked inode, so this only runs for existing non-byte-tracked targets.
if [ -e "$abs_resolved" ]; then
    while IFS= read -r -d '' tf; do
        if [ "$repo_root/$tf" -ef "$abs_resolved" ]; then
            printf 'block-edit-on-main: %s is a filesystem alias (hardlink/case/normalization) of a repo-tracked file. Create a feature branch first.\n' "$file_path" >&2
            exit 2
        fi
    done < <(git -C "$repo_root" ls-files -z 2>/dev/null)
fi

# Not a tracked repo file (out-of-repo scratch, or new/untracked in-repo file)
# -> allow. The gate protects tracked files only (Decision §7 dimension 2).
exit 0
