#!/usr/bin/env bash
# validate-longread-structure.sh — mechanical completeness gate for
# the longread directory at longread/.
#
# Authority: file://specs/2026-05-20-longread-structure/SPEC.md
#   §6.1 (chapter taxonomy), §6.2 (per-chapter word budget),
#   §8.2 (script contract), §9.1 / §9.2 (algorithms).
#
# Checks:
# 1. longread/ exists at repo root.
# 2. Each of the nine expected chapter files exists.
# 3. Each file's word count is at or above the per-chapter
#    in-progress floor (50 words) and at or below the §6.2 maximum.
# 4. Total word count is above a permissive total floor and below
#    the per-§6.2 ceiling with margin.
#
# At v1.0-release time the bounds tighten via --release-mode (target
# 8000-12000 total per parent Decision §7); permissive mode is the
# default during authoring.
#
# Word counting strips code fences, YAML blocks, and citation prefix
# tokens (file://, cmd://, url://, owner://, judgment://,
# decision-authority://) so only prose counts.
#
# Exit 0 iff valid; non-zero with diagnostics to stderr.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LONGREAD_DIR="$REPO_ROOT/longread"

RELEASE_MODE=0
CHAPTER_STRICT=""
while [ $# -gt 0 ]; do
    case "$1" in
        --release-mode) RELEASE_MODE=1 ;;
        --chapter)
            shift
            CHAPTER_STRICT="${1:-}"
            if [ -z "$CHAPTER_STRICT" ]; then
                printf 'validate-longread-structure: --chapter requires a chapter prefix (e.g. 00)\n' >&2
                exit 2
            fi
            ;;
        --help|-h)
            cat <<'EOF'
validate-longread-structure.sh — enforce longread Contract §8.2/§9.2

Modes:
  (default)            in-progress: missing chapters are warnings;
                       per-chapter [50, §6.2-max]; total floor 450
  --release-mode       all chapters required; per-chapter
                       [50, §6.2-max]; total in [8000, 12000]
  --chapter NN         chapter-strict: enforces [§6.2-target,
                       §6.2-max] for chapter NN; other chapters
                       not checked
EOF
            exit 0
            ;;
        *)
            printf 'validate-longread-structure: unknown arg %s\n' "$1" >&2
            exit 2
            ;;
    esac
    shift
done

# Per-chapter (target_words max_words) per SPEC §6.2 of the
# longread Contract
# (file://specs/2026-05-20-longread-structure/SPEC.md §6.2).
# Target total: 9 000. Maximum total: 11 800.
declare -A CHAPTER_TARGET=(
    [00-introduction.md]=800
    [01-phase-0-maturity-check.md]=800
    [02-phase-1-facet-inventory.md]=1000
    [03-phase-2-parameterization-surface.md]=1000
    [04-phase-3-sanitization-bar.md]=900
    [05-phase-4-manifest-catalog-compose.md]=1200
    [06-phase-5-cross-family-validation.md]=1000
    [07-phase-6-ship.md]=800
    [08-phase-7-failure-modes-as-first-class-content.md]=1500
)
declare -A CHAPTER_MAX=(
    [00-introduction.md]=1100
    [01-phase-0-maturity-check.md]=1100
    [02-phase-1-facet-inventory.md]=1300
    [03-phase-2-parameterization-surface.md]=1300
    [04-phase-3-sanitization-bar.md]=1200
    [05-phase-4-manifest-catalog-compose.md]=1500
    [06-phase-5-cross-family-validation.md]=1300
    [07-phase-6-ship.md]=1000
    [08-phase-7-failure-modes-as-first-class-content.md]=2000
)

# Expected file list in order.
CHAPTER_FILES=(
    "00-introduction.md"
    "01-phase-0-maturity-check.md"
    "02-phase-1-facet-inventory.md"
    "03-phase-2-parameterization-surface.md"
    "04-phase-3-sanitization-bar.md"
    "05-phase-4-manifest-catalog-compose.md"
    "06-phase-5-cross-family-validation.md"
    "07-phase-6-ship.md"
    "08-phase-7-failure-modes-as-first-class-content.md"
)

# In-progress bounds.
PER_CHAPTER_FLOOR=50
TOTAL_FLOOR=450     # 9 * 50

# Release-mode bounds (per parent Decision §7).
RELEASE_TOTAL_MIN=8000
RELEASE_TOTAL_MAX=12000

errors=()

err() {
    errors+=("$1")
}

# Count prose words in a file: strip code fences, YAML blocks, and
# citation-prefix tokens; then count whitespace-separated tokens.
count_prose_words() {
    local file="$1"
    awk '
        BEGIN { in_code = 0; in_yaml = 0; yaml_seen = 0 }
        # YAML front-matter: lines bounded by --- at file start.
        /^---$/ {
            if (NR == 1) { in_yaml = 1; yaml_seen = 1; next }
            if (in_yaml) { in_yaml = 0; next }
        }
        in_yaml { next }
        # Code fences (``` or ~~~).
        /^```/ || /^~~~/ {
            in_code = !in_code
            next
        }
        in_code { next }
        { print }
    ' "$file" | \
    # Strip citation-prefix tokens.
    sed -E 's|file://[^[:space:])\]]*||g;
            s|cmd://[^[:space:])\]]*||g;
            s|url://[^[:space:])\]]*||g;
            s|owner://[^[:space:])\]]*||g;
            s|judgment://[^[:space:])\]]*||g;
            s|decision-authority://[^[:space:])\]]*||g' | \
    # Count whitespace-separated tokens.
    wc -w | tr -d ' '
}

# 1. longread/ exists.
if [ ! -d "$LONGREAD_DIR" ]; then
    printf 'validate-longread-structure: FAIL — longread/ directory not found at %s\n' "$LONGREAD_DIR" >&2
    exit 1
fi

# Chapter-strict mode: enforce [target, max] for one chapter,
# ignore the rest.
if [ -n "$CHAPTER_STRICT" ]; then
    # Resolve NN to the chapter file (matches "NN-*.md").
    strict_file=""
    for file in "${CHAPTER_FILES[@]}"; do
        case "$file" in
            "$CHAPTER_STRICT"-*) strict_file="$file"; break ;;
        esac
    done
    if [ -z "$strict_file" ]; then
        printf 'validate-longread-structure: --chapter %s does not match any §6.1 chapter prefix\n' "$CHAPTER_STRICT" >&2
        exit 2
    fi
    path="$LONGREAD_DIR/$strict_file"
    if [ ! -f "$path" ]; then
        printf 'validate-longread-structure: FAIL — chapter-strict %s requires longread/%s to exist\n' "$CHAPTER_STRICT" "$strict_file" >&2
        exit 1
    fi
    count="$(count_prose_words "$path")"
    target="${CHAPTER_TARGET[$strict_file]}"
    max="${CHAPTER_MAX[$strict_file]}"
    if [ "$count" -lt "$target" ]; then
        err "chapter-strict: longread/$strict_file $count prose words below §6.2 target ($target)"
    fi
    if [ "$count" -gt "$max" ]; then
        err "chapter-strict: longread/$strict_file $count prose words exceeds §6.2 maximum ($max)"
    fi
    if [ ${#errors[@]} -gt 0 ]; then
        printf 'validate-longread-structure: %d issue(s) found in chapter-strict mode:\n' "${#errors[@]}" >&2
        for e in "${errors[@]}"; do
            printf '  - %s\n' "$e" >&2
        done
        exit 1
    fi
    printf 'validate-longread-structure: PASS — chapter-strict; longread/%s at %d prose words (target %d, max %d)\n' \
        "$strict_file" "$count" "$target" "$max"
    exit 0
fi

# 2-3. Per-chapter file presence + word count.
# In-progress mode: missing chapters are warnings (printed to
# stderr; do not increment err count). Release mode: missing
# chapters are errors. Per chapter file present, the floor +
# §6.2 maximum apply in both modes.
total_words=0
existing_files=0
missing_warnings=()

for file in "${CHAPTER_FILES[@]}"; do
    path="$LONGREAD_DIR/$file"
    if [ ! -f "$path" ]; then
        if [ $RELEASE_MODE -eq 1 ]; then
            err "missing chapter file: longread/$file"
        else
            missing_warnings+=("longread/$file (deferred to a later slice)")
        fi
        continue
    fi

    existing_files=$((existing_files + 1))
    count="$(count_prose_words "$path")"
    total_words=$((total_words + count))

    if [ "$count" -lt "$PER_CHAPTER_FLOOR" ]; then
        err "longread/$file: $count prose words below in-progress floor ($PER_CHAPTER_FLOOR)"
    fi

    max="${CHAPTER_MAX[$file]}"
    if [ "$count" -gt "$max" ]; then
        err "longread/$file: $count prose words exceeds §6.2 maximum ($max)"
    fi
done

# 4. Total word count bounds.
if [ $RELEASE_MODE -eq 1 ]; then
    if [ "$total_words" -lt "$RELEASE_TOTAL_MIN" ]; then
        err "release-mode: total $total_words below release minimum $RELEASE_TOTAL_MIN"
    fi
    if [ "$total_words" -gt "$RELEASE_TOTAL_MAX" ]; then
        err "release-mode: total $total_words exceeds release maximum $RELEASE_TOTAL_MAX"
    fi
else
    # In-progress mode: only enforce the lower per-chapter floor + a
    # permissive total floor so the validator can run during authoring.
    if [ "$total_words" -lt "$TOTAL_FLOOR" ]; then
        err "in-progress: total $total_words below permissive floor $TOTAL_FLOOR"
    fi
fi

if [ ${#errors[@]} -gt 0 ]; then
    printf 'validate-longread-structure: %d issue(s) found:\n' "${#errors[@]}" >&2
    for e in "${errors[@]}"; do
        printf '  - %s\n' "$e" >&2
    done
    exit 1
fi

mode="in-progress"
[ $RELEASE_MODE -eq 1 ] && mode="release"
printf 'validate-longread-structure: PASS — mode=%s; %d/9 chapters present; total=%d prose words\n' \
    "$mode" "$existing_files" "$total_words"
if [ ${#missing_warnings[@]} -gt 0 ]; then
    printf '  in-progress warnings (deferred chapters, not errors):\n'
    for w in "${missing_warnings[@]}"; do
        printf '    - %s\n' "$w"
    done
fi
exit 0
