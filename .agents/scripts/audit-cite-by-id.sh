#!/usr/bin/env bash
# audit-cite-by-id.sh — enumerate which child SPECs cite which
# studio-level SPECs by id. Closes the reverse-direction discovery
# gap flagged in
# file://specs/2026-05-02-studio-principle-ai/SPEC_EVIDENCE.md §3:
# "Forward direction (per-product SPEC cites principle) is
# enforceable at child review; reverse direction (principle
# discovers all consumers) was manual cross-repo grep."
#
# This script automates the reverse direction.
#
# Usage:
#   bash audit-cite-by-id.sh                  # report all studio principles + their consumers
#   bash audit-cite-by-id.sh <spec-id>        # report consumers of a single spec id
#
# Run from the studio root. Scans .agents/specs/ in each fleet repo
# (and specs/ in bes-fleet-policy itself) for citations of the
# given id (or every studio-principle-* / closed Decision SPEC id
# in bes-fleet-policy).
#
# Authority:
#   file://specs/2026-05-02-studio-principle-ai/SPEC_EVIDENCE.md §3
#   file://specs/2026-05-09-symphony-aligned-execution-layer/SPEC.md §6.2

set -uo pipefail

# Detect the studio root.
STUDIO_ROOT="$(cd "$(dirname "$(readlink -f "$0")")"/../.. && pwd)"
# If we're inside bes-fleet-policy, go up one more.
if [ "$(basename "$STUDIO_ROOT")" = "bes-fleet-policy" ]; then
    STUDIO_ROOT="$(dirname "$STUDIO_ROOT")"
fi

# Fleet repos are read from the canonical roster manifests (single
# source of truth) plus bes-fleet-policy itself, since this script also
# scans the source repo's own specs/ for citations.
_cite_script_dir="$STUDIO_ROOT/bes-fleet-policy/agents/scripts"
FLEET_REPOS=(bes-fleet-policy)
for _mf in fleet-internal-repos.txt fleet-oss-repos.txt fleet-local-only-repos.txt; do
    [ -f "$_cite_script_dir/$_mf" ] || continue
    while IFS= read -r _line; do
        case "$_line" in ''|'#'*) continue ;; esac
        FLEET_REPOS+=("$_line")
    done < "$_cite_script_dir/$_mf"
done

# Helper: collect all SPEC ids from bes-fleet-policy/specs/ that
# look like studio-level binding SPECs (Decision SPECs at status
# closed; or any SPEC with id matching studio-principle-*).
list_studio_spec_ids() {
    local fp_specs="$STUDIO_ROOT/bes-fleet-policy/specs"
    [ -d "$fp_specs" ] || return 0
    for d in "$fp_specs"/*/; do
        local spec="$d/SPEC.md"
        [ -f "$spec" ] || continue
        local id status type
        id=$(awk '/^---/{c++; if(c==2)exit} /^id:/{gsub(/^id:[[:space:]]*/,""); print; exit}' "$spec")
        status=$(awk '/^---/{c++; if(c==2)exit} /^status:/{gsub(/^status:[[:space:]]*/,""); print; exit}' "$spec")
        type=$(awk '/^---/{c++; if(c==2)exit} /^type:/{gsub(/^type:[[:space:]]*/,""); print; exit}' "$spec")
        # Studio-level: Decision SPEC at closed, OR any SPEC whose
        # id contains "studio-principle".
        if [ "$type" = "decision" ] && [ "$status" = "closed" ]; then
            printf '%s\n' "$id"
        elif printf '%s' "$id" | grep -q 'studio-principle'; then
            printf '%s\n' "$id"
        fi
    done
}

# Helper: search a single repo's spec dirs for citations of an id.
# Returns "repo:path" lines.
find_consumers() {
    local target_id="$1" repo="$2"
    local repo_dir="$STUDIO_ROOT/$repo"
    [ -d "$repo_dir" ] || return 0
    # Search both .agents/specs/ (children) and specs/ (bes-fleet-policy).
    local search_dirs=()
    [ -d "$repo_dir/.agents/specs" ] && search_dirs+=("$repo_dir/.agents/specs")
    [ -d "$repo_dir/specs" ] && search_dirs+=("$repo_dir/specs")
    [ ${#search_dirs[@]} -eq 0 ] && return 0
    # The target spec itself shouldn't count as a consumer of itself;
    # match by surrounding context (cite-by-id appears in `parent_spec:`
    # or in a citation like `specs/<target_id>/SPEC.md`).
    grep -rl --include='*.md' -F "$target_id" "${search_dirs[@]}" 2>/dev/null | while IFS= read -r f; do
        # Skip the spec itself (its own folder contains its own id).
        case "$f" in
            *"/specs/$target_id/"*|*"/.agents/specs/$target_id/"*) continue ;;
        esac
        printf '%s:%s\n' "$repo" "${f#$repo_dir/}"
    done
}

# Mode dispatch.
if [ $# -eq 1 ]; then
    target="$1"
    printf 'Consumers of %s:\n' "$target"
    found=0
    for repo in "${FLEET_REPOS[@]}"; do
        while IFS= read -r line; do
            [ -n "$line" ] && { printf '  %s\n' "$line"; found=$((found+1)); }
        done < <(find_consumers "$target" "$repo")
    done
    printf '\n%d consumer(s).\n' "$found"
    exit 0
fi

# Default mode: enumerate all studio-level SPECs and their consumers.
printf 'audit-cite-by-id.sh — fleet-wide cite-by-id consumer audit\n'
printf 'studio root: %s\n' "$STUDIO_ROOT"
printf '%s\n' '----'

studio_ids=$(list_studio_spec_ids)
if [ -z "$studio_ids" ]; then
    printf 'No studio-level SPECs found in bes-fleet-policy/specs/.\n'
    exit 0
fi

total_principles=0
total_consumers=0
while IFS= read -r target; do
    [ -z "$target" ] && continue
    total_principles=$((total_principles+1))
    printf '%s\n' "$target"
    n=0
    for repo in "${FLEET_REPOS[@]}"; do
        # Skip bes-fleet-policy when listing consumers of a bes-fleet-policy spec
        # (its own folder is excluded inside find_consumers; cross-references in
        # other specs/folders count). Show all hits per repo.
        while IFS= read -r line; do
            if [ -n "$line" ]; then
                printf '  %s\n' "$line"
                n=$((n+1))
            fi
        done < <(find_consumers "$target" "$repo")
    done
    if [ "$n" -eq 0 ]; then
        printf '  (no consumers)\n'
    else
        total_consumers=$((total_consumers + n))
    fi
    printf '\n'
done <<< "$studio_ids"

printf '%s\n' '----'
printf 'audit-cite-by-id.sh: %d studio-level SPEC(s) examined; %d total consumer reference(s).\n' "$total_principles" "$total_consumers"
