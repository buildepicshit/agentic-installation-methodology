#!/usr/bin/env bash
# fleet-enforce.sh — apply a structured fleet directive across one or more
# target repos.
#
# Usage:
#   bash agents/scripts/fleet-enforce.sh <directive_id>
#   bash agents/scripts/fleet-enforce.sh --validate <directive_id>   # format-check only, no apply
#   bash agents/scripts/fleet-enforce.sh --list                       # list known directives
#
# Authority:
#   file://agents/skills/fleet-enforce/SKILL.md
#   file://agents/workflows/fleet-enforce.md
#   file://agents/fleet-directives/README.md

set -uo pipefail

SOURCE_DIR="$(cd "$(dirname "$(readlink -f "$0")")/../.." && pwd)"
DIRECTIVES_DIR="$SOURCE_DIR/agents/fleet-directives"
STUDIO_ROOT="$(dirname "$SOURCE_DIR")"

# Fleet repo classification is read from the canonical roster manifests
# (single source of truth) per file://agents/OPERATING_MODEL.md Active Repos.
SCRIPT_DIR="$SOURCE_DIR/agents/scripts"
read_manifest() {
    # Strict: a missing or empty roster manifest is a hard error, so a
    # vanished manifest can never silently turn enforcement into a no-op.
    local file="$1"
    local -n _roster="$2"
    _roster=()
    if [ ! -f "$file" ]; then
        echo "fleet-enforce: roster manifest missing: $file" >&2
        exit 3
    fi
    while IFS= read -r line; do
        case "$line" in ''|'#'*) continue ;; esac
        _roster+=("$line")
    done < "$file"
    if [ "${#_roster[@]}" -eq 0 ]; then
        echo "fleet-enforce: roster manifest empty: $file" >&2
        exit 3
    fi
}
read_manifest "$SCRIPT_DIR/fleet-internal-repos.txt" INTERNAL_REPOS
read_manifest "$SCRIPT_DIR/fleet-oss-repos.txt" PUBLIC_OSS_REPOS
read_manifest "$SCRIPT_DIR/fleet-local-only-repos.txt" LOCAL_ONLY_REPOS
ALL_REPOS=("${INTERNAL_REPOS[@]}" "${PUBLIC_OSS_REPOS[@]}" "${LOCAL_ONLY_REPOS[@]}")

usage() {
    cat <<EOF
fleet-enforce.sh — apply a fleet directive across target repos

Usage:
  $0 <directive_id>           apply directive
  $0 --validate <directive_id> validate directive format (no apply)
  $0 --list                   list known directives

Directives live at: $DIRECTIVES_DIR/<directive_id>.md
EOF
}

# Read a front-matter field from a directive file. Args: field, file.
get_field() {
    local field="$1" file="$2"
    awk -v field="$field" '
        BEGIN { in_fm = 0 }
        /^---$/ { in_fm = !in_fm; next }
        in_fm && $1 == field":" { sub("^" field ":[[:space:]]*", ""); print; exit }
    ' "$file"
}

# Resolve target_repos field (list, or special tokens) to an array.
resolve_targets() {
    local field_val="$1"
    field_val=$(printf '%s' "$field_val" | tr -d '[]')
    case "$field_val" in
        all)
            printf '%s\n' "${ALL_REPOS[@]}"
            ;;
        all-internal)
            printf '%s\n' "${INTERNAL_REPOS[@]}"
            ;;
        all-oss)
            printf '%s\n' "${PUBLIC_OSS_REPOS[@]}"
            ;;
        all-local)
            printf '%s\n' "${LOCAL_ONLY_REPOS[@]}"
            ;;
        *)
            # Explicit target list: validate EVERY name against the roster
            # union before emitting any. An unknown / typo'd / non-destination
            # name (e.g. agentic-ops-framework, which is a curated-SPEC target,
            # NOT a fleet-sync destination) would otherwise fall through to the
            # posture loop's `posture=internal` default and be applied as an
            # internal baseline target. Refuse instead.
            local -a _names _bad
            mapfile -t _names < <(printf '%s\n' "$field_val" | tr ',' '\n' | awk 'NF{$1=$1; print}')
            _bad=()
            local _n _r _known
            for _n in "${_names[@]}"; do
                _known=0
                for _r in "${ALL_REPOS[@]}"; do [ "$_r" = "$_n" ] && { _known=1; break; }; done
                [ "$_known" -eq 0 ] && _bad+=("$_n")
            done
            if [ "${#_bad[@]}" -gt 0 ]; then
                echo "fleet-enforce: unknown target repo(s) not in any roster manifest: ${_bad[*]} — refusing (would default to internal posture)" >&2
                return 1
            fi
            printf '%s\n' "${_names[@]}"
            ;;
    esac
}

validate_directive() {
    local directive_id="$1"
    local file="$DIRECTIVES_DIR/$directive_id.md"
    [ -f "$file" ] || { echo "ERROR: directive not found: $file" >&2; return 1; }

    local errors=0
    for field in id issued_by target_repos authority type status created; do
        if [ -z "$(get_field "$field" "$file")" ]; then
            echo "ERROR: missing required front-matter field: $field" >&2
            errors=$((errors+1))
        fi
    done

    local issued_by; issued_by=$(get_field issued_by "$file")
    [ "$issued_by" = "bes-fleet-policy" ] || {
        echo "ERROR: issued_by MUST be 'bes-fleet-policy' (got: $issued_by)" >&2
        errors=$((errors+1))
    }

    local authority; authority=$(get_field authority "$file")
    case "$authority" in
        bes-fleet-policy@*|file://*|owner://transcript-*|AGENT_FEEDBACK://*) ;;
        *) echo "ERROR: authority MUST be bes-fleet-policy@<sha>, file://, owner://transcript-<date>, or AGENT_FEEDBACK:// (got: $authority)" >&2
           errors=$((errors+1));;
    esac

    if ! grep -q '^## 2. Action' "$file"; then
        echo "ERROR: missing required body section: '## 2. Action'" >&2; errors=$((errors+1))
    fi
    if ! grep -q '^## 3. Compliance check' "$file"; then
        echo "ERROR: missing required body section: '## 3. Compliance check'" >&2; errors=$((errors+1))
    fi
    if ! grep -q '^## 4. Authority chain' "$file"; then
        echo "ERROR: missing required body section: '## 4. Authority chain'" >&2; errors=$((errors+1))
    fi

    if [ "$errors" -eq 0 ]; then
        echo "validate: $directive_id OK"
        return 0
    fi
    echo "validate: $directive_id FAIL ($errors error(s))" >&2
    return 1
}

list_directives() {
    [ -d "$DIRECTIVES_DIR" ] || { echo "no directives dir"; return 0; }
    for f in "$DIRECTIVES_DIR"/*.md; do
        [ -f "$f" ] || continue
        [ "$(basename "$f")" = README.md ] && continue
        local id status created
        id=$(get_field id "$f")
        status=$(get_field status "$f")
        created=$(get_field created "$f")
        printf '%-12s  %-12s  %s\n' "$status" "$created" "$id"
    done
}

# Apply mode: extract Action shell from the directive body and run it per target.
# The directive's Action section MUST be a single fenced bash code block.
extract_action_block() {
    local file="$1"
    awk '
        BEGIN { in_action = 0; in_block = 0 }
        /^## 2\. Action/ { in_action = 1; next }
        /^## [0-9]+\./ && in_action { exit }
        in_action && /^```bash$/ { in_block = 1; next }
        in_action && /^```$/ && in_block { exit }
        in_action && in_block { print }
    ' "$file"
}

extract_compliance_check() {
    local file="$1"
    awk '
        BEGIN { in_check = 0; in_block = 0 }
        /^## 3\. Compliance check/ { in_check = 1; next }
        /^## [0-9]+\./ && in_check { exit }
        in_check && /^```bash$/ { in_block = 1; next }
        in_check && /^```$/ && in_block { exit }
        in_check && in_block { print }
    ' "$file"
}

apply_directive() {
    local directive_id="$1"
    local file="$DIRECTIVES_DIR/$directive_id.md"
    [ -f "$file" ] || { echo "ERROR: directive not found: $file" >&2; return 1; }

    validate_directive "$directive_id" >/dev/null || {
        echo "ERROR: directive failed validation; cannot apply" >&2
        return 1
    }

    local status; status=$(get_field status "$file")
    if [ "$status" != "pending" ]; then
        echo "WARN: directive status is '$status' (expected 'pending'); proceeding anyway" >&2
    fi

    local targets_raw; targets_raw=$(get_field target_repos "$file")
    local targets; mapfile -t targets < <(resolve_targets "$targets_raw")
    [ ${#targets[@]} -gt 0 ] || { echo "ERROR: no target repos resolved from: $targets_raw" >&2; return 1; }

    local action_block; action_block=$(extract_action_block "$file")
    [ -n "$action_block" ] || { echo "ERROR: no '## 2. Action' bash block found in directive" >&2; return 1; }

    local compliance_check; compliance_check=$(extract_compliance_check "$file")
    [ -n "$compliance_check" ] || { echo "ERROR: no '## 3. Compliance check' bash block found" >&2; return 1; }

    echo "=== applying $directive_id to ${#targets[@]} target(s) ==="
    local failed=()
    for repo in "${targets[@]}"; do
        local target_path="$STUDIO_ROOT/$repo"
        [ -d "$target_path" ] || { echo "  SKIP $repo (directory absent)"; continue; }

        echo "  --- $repo ---"
        local posture=internal
        for r in "${PUBLIC_OSS_REPOS[@]}"; do
            [ "$r" = "$repo" ] && posture=oss
        done
        for r in "${LOCAL_ONLY_REPOS[@]}"; do
            [ "$r" = "$repo" ] && posture=local
        done

        # Execute Action with TARGET + POSTURE env, plus a dispatch-shell substitution
        # so the directive author can write <target> and <posture> as placeholders.
        local rendered_action
        rendered_action=$(printf '%s' "$action_block" | sed -e "s|<target>|$target_path|g" -e "s|<posture>|$posture|g")
        TARGET="$target_path" POSTURE="$posture" bash -c "$rendered_action" || {
            echo "    APPLY FAIL on $repo" >&2
            failed+=("$repo:apply")
            continue
        }

        local rendered_check
        rendered_check=$(printf '%s' "$compliance_check" | sed -e "s|\$TARGET|$target_path|g" -e "s|<target>|$target_path|g")
        if ! TARGET="$target_path" POSTURE="$posture" bash -c "$rendered_check" >/dev/null 2>&1; then
            echo "    COMPLIANCE FAIL on $repo" >&2
            failed+=("$repo:compliance")
            continue
        fi
        echo "    OK $repo"
    done

    if [ ${#failed[@]} -gt 0 ]; then
        echo ""
        echo "FAILED targets:" >&2
        for f in "${failed[@]}"; do echo "  - $f" >&2; done
        echo "" >&2
        echo "Directive status remains 'pending'. Update front-matter 'failed_targets:' in $file before re-running." >&2
        return 1
    fi

    echo ""
    echo "All targets compliant. Flip directive status pending -> applied in $file and commit:"
    echo "  sed -i 's/^status: pending\$/status: applied/' $file"
    echo "  git -C $SOURCE_DIR add agents/fleet-directives/$directive_id.md"
    echo "  git -C $SOURCE_DIR commit -m 'fleet-directive: $directive_id applied'"
    echo "  git -C $SOURCE_DIR push"
}

case "${1:-}" in
    --list)
        list_directives
        ;;
    --validate)
        [ -n "${2:-}" ] || { usage; exit 64; }
        validate_directive "$2"
        ;;
    -h|--help|"")
        usage
        ;;
    *)
        apply_directive "$1"
        ;;
esac
