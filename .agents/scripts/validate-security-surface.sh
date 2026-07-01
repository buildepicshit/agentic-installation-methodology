#!/usr/bin/env bash
# validate-security-surface.sh — fleet security-surface helper.
# Per specs/2026-05-25-fleet-security-surface-discipline/SPEC.md §7.
#
# Two modes:
#   1. SPEC validation: given a SPEC.md path, verify security_surface
#      + security_tier front-matter fields are present and consistent.
#   2. Pattern probe: given a Bash/Edit/Write command-line, scan for
#      known sensitive patterns (secret regex, auth keywords, etc.)
#      and emit WARN if the active SPEC's security_surface is `none`.

set -uo pipefail

SECRET_PATTERNS=(
    'AKIA[0-9A-Z]{16}'                 # AWS access key
    'ASIA[0-9A-Z]{16}'                 # AWS session key
    'AIza[0-9A-Za-z_-]{35}'            # Google API key
    'ghp_[0-9A-Za-z]{36}'              # GitHub personal token
    'github_pat_[0-9A-Za-z_]{82}'      # GitHub fine-grained PAT
    'sk-[0-9A-Za-z]{40,}'              # OpenAI / Anthropic style
    'xox[bpsoa]-[0-9]+-[0-9]+'         # Slack tokens
    'eyJ[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+' # JWT
    'BEGIN[[:space:]]+(RSA|EC|OPENSSH|PGP)[[:space:]]+PRIVATE[[:space:]]+KEY'
)

AUTH_KEYWORDS='\b(api[_-]?key|secret|password|token|credential|bearer|x-api-key|authorization)\b'
PII_KEYWORDS='\b(ssn|social[_-]?security|credit[_-]?card|date[_-]?of[_-]?birth|passport)\b'

resolve_active_spec() {
    local current="${ACTIVE_SPEC_DIR:-${CLAUDE_PROJECT_DIR:-$(pwd)}}"
    if [ -n "${ACTIVE_SPEC_DIR:-}" ] && [ -d "$ACTIVE_SPEC_DIR" ]; then
        find "$ACTIVE_SPEC_DIR" -maxdepth 3 -name 'SPEC.md' 2>/dev/null | head -n1
        return
    fi
    while [ "$current" != "/" ]; do
        if [ -d "$current/specs" ]; then
            local candidate
            candidate="$(find "$current/specs" -maxdepth 3 -name 'SPEC.md' -print0 2>/dev/null \
                | xargs -0 grep -l -E '^status:[[:space:]]+(approved|in-execution)' 2>/dev/null \
                | head -n1)"
            if [ -n "$candidate" ]; then
                echo "$candidate"
                return
            fi
        fi
        current="$(dirname "$current")"
    done
    echo ""
}

read_front_matter() {
    local file="$1" key="$2"
    awk -v key="$key" '
        BEGIN { depth = 0; in_fm = 0 }
        /^---[[:space:]]*$/ {
            depth++
            if (depth == 1) { in_fm = 1; next }
            if (depth == 2) { exit }
        }
        in_fm {
            if (match($0, "^" key ":[[:space:]]*(.*)$", m)) {
                print m[1]; exit
            }
        }
    ' "$file"
}

detect_sensitive_patterns() {
    local input="$1"
    local hits=()
    for p in "${SECRET_PATTERNS[@]}"; do
        if printf '%s' "$input" | grep -qE "$p"; then
            hits+=("possible-secret:$p")
        fi
    done
    if printf '%s' "$input" | grep -qiE "$AUTH_KEYWORDS"; then
        hits+=("auth-keyword")
    fi
    if printf '%s' "$input" | grep -qiE "$PII_KEYWORDS"; then
        hits+=("pii-keyword")
    fi
    if [ ${#hits[@]} -eq 0 ]; then
        echo ""
    else
        printf '%s\n' "${hits[@]}"
    fi
}

validate_spec_metadata() {
    local spec="$1"
    local surface tier
    surface="$(read_front_matter "$spec" 'security_surface')"
    tier="$(read_front_matter "$spec" 'security_tier')"
    # security_surface is OPTIONAL; default `none`.
    if [ -z "$surface" ]; then
        surface="none"
    fi
    # Enum validation
    case "$surface" in
        none|auth|pii|secrets|network-boundary|sandbox-escape|prompt-injection-surface)
            ;;
        *)
            # Could be a list like [auth, pii]; tolerate.
            if ! printf '%s' "$surface" | grep -qE '^\['; then
                echo "FAIL: security_surface '$surface' not in enum (auth|pii|secrets|network-boundary|sandbox-escape|prompt-injection-surface|none)"
                return 2
            fi
            ;;
    esac
    # security_tier OPTIONAL; default `standard` (internal) or
    # `high` (public-OSS — caller decides).
    if [ -z "$tier" ]; then
        tier="standard"
    fi
    case "$tier" in
        standard|high) ;;
        *)
            echo "FAIL: security_tier '$tier' not in enum (standard|high)"
            return 2
            ;;
    esac
    echo "PASS: spec metadata OK (security_surface=$surface security_tier=$tier)"
    return 0
}

validate_command_line() {
    local input="$1"
    local hits
    hits="$(detect_sensitive_patterns "$input")"
    if [ -z "$hits" ]; then
        return 0
    fi

    local spec
    spec="$(resolve_active_spec)"
    if [ -z "$spec" ]; then
        # No active SPEC; treat as WARN.
        echo "WARN: sensitive pattern detected without active SPEC context:"
        printf '  - %s\n' $hits
        return 1
    fi

    local surface
    surface="$(read_front_matter "$spec" 'security_surface')"
    [ -z "$surface" ] && surface="none"

    if [ "$surface" = "none" ]; then
        # Sensitive pattern + active SPEC declares no security
        # surface → WARN (not FAIL — false-positive risk on
        # keyword detection is real; reviewer can override).
        echo "WARN: sensitive pattern detected; active SPEC ($spec) declares security_surface=none"
        printf '  - %s\n' $hits >&2
        return 1
    fi

    # Sensitive pattern + declared surface → PASS (the SPEC
    # acknowledged the surface).
    echo "PASS: sensitive pattern detected; active SPEC declares security_surface=$surface"
    return 0
}

self_test() {
    local pass=0 fail=0
    local sandbox
    sandbox="$(mktemp -d)"
    mkdir -p "$sandbox/specs/active"

    write_spec() {
        cat > "$sandbox/specs/active/SPEC.md" <<EOF
---
id: test-active
status: in-execution
type: contract
owner: test
$1
---
# fixture
EOF
    }

    run_case() {
        local name="$1" frontmatter="$2" input="$3" expected="$4"
        write_spec "$frontmatter"
        ACTIVE_SPEC_DIR="$sandbox/specs/active" validate_command_line "$input" >/dev/null 2>&1
        local actual=$?
        if [ "$actual" = "$expected" ]; then
            pass=$((pass + 1)); echo "  PASS: $name"
        else
            fail=$((fail + 1)); echo "  FAIL: $name (expected $expected, got $actual)" >&2
        fi
    }

    # Clean command, no SPEC surface declared → PASS silently
    run_case "no-sensitive-pattern" "" "ls -la" 0

    # Sensitive pattern, SPEC declares none → WARN
    run_case "sensitive-pattern-undeclared" "" 'export AWS_KEY=AKIA1234567890ABCDEF' 1

    # Sensitive pattern, SPEC declares secrets → PASS
    run_case "sensitive-pattern-declared" \
        "security_surface: secrets" \
        'export AWS_KEY=AKIA1234567890ABCDEF' 0

    # Auth keyword, SPEC declares none → WARN
    run_case "auth-keyword-undeclared" "" "configure api_key for service" 1

    # Auth keyword, SPEC declares auth → PASS
    run_case "auth-keyword-declared" \
        "security_surface: auth" \
        "configure api_key for service" 0

    # PII keyword, undeclared → WARN
    run_case "pii-keyword-undeclared" "" "store user ssn" 1

    # SPEC metadata validation
    write_spec "security_surface: invalid-value"
    local out
    out=$(validate_spec_metadata "$sandbox/specs/active/SPEC.md" 2>&1)
    local rc=$?
    if [ "$rc" = "2" ]; then
        pass=$((pass + 1)); echo "  PASS: invalid-surface-enum-rejected"
    else
        fail=$((fail + 1)); echo "  FAIL: invalid-surface-enum-rejected (got $rc)" >&2
    fi

    write_spec "security_surface: auth
security_tier: high"
    out=$(validate_spec_metadata "$sandbox/specs/active/SPEC.md" 2>&1)
    rc=$?
    if [ "$rc" = "0" ]; then
        pass=$((pass + 1)); echo "  PASS: valid-spec-metadata-passes"
    else
        fail=$((fail + 1)); echo "  FAIL: valid-spec-metadata-passes (got $rc)" >&2
    fi

    rm -rf "$sandbox"
    printf '\nvalidate-security-surface self-test: %d PASS, %d FAIL\n' "$pass" "$fail"
    [ "$fail" -eq 0 ]
}

case "${1:-}" in
    --help|-h)
        echo "validate-security-surface.sh — security-surface helper"
        echo "Modes: <command-line> | - (stdin) | --validate-spec <path> | --self-test | --help"
        echo "Exit codes: 0 PASS, 1 WARN, 2 FAIL"
        ;;
    --self-test)
        self_test; exit $?
        ;;
    --validate-spec)
        shift; validate_spec_metadata "$1"; exit $?
        ;;
    -)
        cmd="$(cat)"; validate_command_line "$cmd"; exit $?
        ;;
    "")
        echo "usage: see --help" >&2; exit 2
        ;;
    *)
        validate_command_line "$1"; exit $?
        ;;
esac
