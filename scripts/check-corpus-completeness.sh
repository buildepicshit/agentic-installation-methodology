#!/usr/bin/env bash
# check-corpus-completeness.sh — mechanical completeness gate for
# the primary-source research corpus at research/primary-sources/.
#
# Authority:
# file://specs/2026-05-19-primary-source-research-corpus/SPEC.md §7.2,
# §9.1, §13 AC-4.
#
# Verifies:
# 1. INDEX.md exists and parses.
# 2. Every slug in INDEX has a matching <slug>.md file.
# 3. Every <slug>.md file (other than INDEX.md) has a row in INDEX.
# 4. Every status is one of:
#    primary-read-complete | partial | access-blocked | superseded | pending.
# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
# 6. No row at status: pending (the corpus is closed when this script
#    exits 0; pending rows mean incomplete work).
# 7. Every access-blocked row has an alternative-source-found note OR
#    an explicit unreachability disclaimer (heuristic: §6 Open Questions
#    in the artefact mentions "alternative" or "unreachable").
#
# Exit 0 iff the corpus is complete; non-zero with diagnostics to stderr
# otherwise.

set -uo pipefail

# Resolve repo root from script location.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CORPUS_DIR="$REPO_ROOT/research/primary-sources"
INDEX_FILE="$CORPUS_DIR/INDEX.md"
SPEC_FILE="$REPO_ROOT/specs/2026-05-19-primary-source-research-corpus/SPEC.md"

EXPECTED_VERSION="v1.0"

fail() {
    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
    exit 1
}

# 1. INDEX exists.
if [ ! -f "$INDEX_FILE" ]; then
    fail "INDEX.md not found at $INDEX_FILE"
fi

# 2. SOURCE_LIST_VERSION matches.
actual_version="$(grep -E '^Source-list version:' "$INDEX_FILE" | head -1 | sed -E 's/^Source-list version:[[:space:]]+//')"
if [ "$actual_version" != "$EXPECTED_VERSION" ]; then
    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
fi

# 3. Parse INDEX rows.
# Row format: | <slug> | <status> | <date-or-dash> | <summary> |
# Skip header + separator lines (first two | lines).
mapfile -t rows < <(grep -E '^\|' "$INDEX_FILE" | tail -n +3 | sed -E 's/^\|[[:space:]]*//;s/[[:space:]]*\|[[:space:]]*/|/g;s/[[:space:]]*\|$//')

if [ ${#rows[@]} -eq 0 ]; then
    fail "INDEX.md has no data rows"
fi

declare -A index_slugs
declare -A index_status
issues=()

valid_statuses="primary-read-complete partial access-blocked superseded pending"

for row in "${rows[@]}"; do
    IFS='|' read -r slug status fetched_on summary <<<"$row"
    [ -z "$slug" ] && continue
    index_slugs["$slug"]=1
    index_status["$slug"]="$status"

    # 4. Status valid.
    if ! printf '%s\n' $valid_statuses | grep -qFx "$status"; then
        issues+=("invalid status '$status' for slug '$slug'")
    fi

    # 5. No pending.
    if [ "$status" = "pending" ]; then
        issues+=("slug '$slug' is still status: pending")
    fi

    # 6. Matching file exists.
    if [ ! -f "$CORPUS_DIR/$slug.md" ]; then
        issues+=("slug '$slug' in INDEX has no matching file at research/primary-sources/$slug.md")
    fi

    # 7. Access-blocked must record an alternative or unreachability note in §6.
    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
        if ! grep -qiE 'alternative|unreachable|fallback' "$CORPUS_DIR/$slug.md"; then
            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
        fi
    fi
done

# 8. Orphan files (file exists but no INDEX row).
for f in "$CORPUS_DIR"/*.md; do
    [ -f "$f" ] || continue
    base="$(basename "$f" .md)"
    [ "$base" = "INDEX" ] && continue
    if [ -z "${index_slugs[$base]:-}" ]; then
        issues+=("orphan file: $base.md has no row in INDEX.md")
    fi
done

if [ ${#issues[@]} -gt 0 ]; then
    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
    for i in "${issues[@]}"; do
        printf '  - %s\n' "$i" >&2
    done
    exit 1
fi

n_rows=${#index_slugs[@]}
printf 'check-corpus-completeness: PASS — %d sources, all complete\n' "$n_rows"
exit 0
