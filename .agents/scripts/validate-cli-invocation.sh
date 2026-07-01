#!/usr/bin/env bash
# validate-cli-invocation.sh — fleet-canonical helper for the
# cross-agent CLI invocation contract at
# specs/2026-05-25-agent-cli-invocation-craft/SPEC.md.
#
# Validates a proposed Bash command-line for malformed `claude`
# and `copilot` invocations. Emits PASS/WARN/FAIL findings.
#
# Exit codes (per SPEC §7.5 canonical mapping):
#   0  — PASS (all detected invocations OK)
#   1  — WARN-only (advisory; hook should allow with warning)
#   2  — FAIL (block; hook should exit 2 to block PreToolUse)
#
# Modes:
#   validate-cli-invocation.sh "<command-line>"   argv mode
#   validate-cli-invocation.sh -                  stdin mode (raw text)
#   validate-cli-invocation.sh --self-test        run embedded test suite
#   validate-cli-invocation.sh --refresh-known-good <target>
#     where <target> is "claude" or "copilot"
#   validate-cli-invocation.sh --help

set -uo pipefail

# ------------------------------------------------------------------
# Data-root resolution (per SPEC §7.1 fleet-aware resolution).
# Try source-repo layout, then child-repo layout, then helper-
# script-relative fallback.
# ------------------------------------------------------------------
resolve_data_root() {
    local script_dir
    script_dir="$(cd "$(dirname "$0")" && pwd)"
    local candidates=(
        "${CLAUDE_PROJECT_DIR:-}/agents/skills/cross-agent-cli-invocation/known-good"
        "${CLAUDE_PROJECT_DIR:-}/.agents/skills/cross-agent-cli-invocation/known-good"
        "$script_dir/../skills/cross-agent-cli-invocation/known-good"
    )
    for c in "${candidates[@]}"; do
        if [ -d "$c" ]; then
            echo "$c"
            return 0
        fi
    done
    return 1
}

# ------------------------------------------------------------------
# Pass 0: heredoc-aware continuation join. Joins backslash-newline
# continuations into one logical line — but NOT inside heredoc
# bodies, where a trailing backslash is body text and joining would
# swallow the terminator line (fail-open: everything after the
# heredoc would be skipped). Per
# specs/2026-06-05-cli-validator-multiline-fix/SPEC.md §8.
# ------------------------------------------------------------------
join_continuations() {
    awk '
        BEGIN { in_heredoc = 0; tag = ""; carry = ""; have_carry = 0 }
        {
            line = $0
            if (in_heredoc) {
                if (line ~ ("^[[:space:]]*" tag "$")) {
                    in_heredoc = 0; tag = ""
                }
                print line
                next
            }
            if (have_carry) {
                line = carry " " line
                carry = ""; have_carry = 0
            }
            # Trailing single backslash = continuation; trailing
            # double backslash = escaped backslash, not continuation.
            if (line ~ /\\$/ && line !~ /\\\\$/) {
                carry = substr(line, 1, length(line) - 1)
                have_carry = 1
                next
            }
            if (match(line, /<<-?[[:space:]]*['\''"]?[A-Za-z_][A-Za-z0-9_]*['\''"]?/)) {
                t = substr(line, RSTART, RLENGTH)
                sub(/^<<-?[[:space:]]*/, "", t)
                gsub(/['\''"]/, "", t)
                in_heredoc = 1; tag = t
            }
            print line
        }
        END { if (have_carry) print carry }
    '
}

# ------------------------------------------------------------------
# Pass 1: detection-safe extraction. Strip heredoc bodies and quoted
# strings, split on bash logical operators. Returns one detection
# span per line on stdout, prefixed with byte offset against the
# original command-line.
# ------------------------------------------------------------------
extract_detection_spans() {
    awk '
        BEGIN { in_heredoc = 0; tag = ""; offset = 0 }
        {
            line = $0
            line_start = offset
            offset += length(line) + 1
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
            # Blank quoted strings to equal-length runs of spaces
            # (instead of deleting them) so every offset computed on
            # the stripped copy indexes the ORIGINAL line exactly
            # (specs/2026-06-05-cli-validator-multiline-fix/SPEC.md §8).
            stripped = line
            while (match(stripped, /'\''[^'\'']*'\''/)) {
                pad = sprintf("%*s", RLENGTH, "")
                stripped = substr(stripped, 1, RSTART - 1) pad substr(stripped, RSTART + RLENGTH)
            }
            while (match(stripped, /"[^"]*"/)) {
                pad = sprintf("%*s", RLENGTH, "")
                stripped = substr(stripped, 1, RSTART - 1) pad substr(stripped, RSTART + RLENGTH)
            }
            # Blank fd-duplication redirections (2>&1, 0<&3) the same
            # way — their `&` is part of a redirect, not a command
            # separator, and must not split the span.
            while (match(stripped, /[0-9]*[<>]&[0-9]+/)) {
                pad = sprintf("%*s", RLENGTH, "")
                stripped = substr(stripped, 1, RSTART - 1) pad substr(stripped, RSTART + RLENGTH)
            }
            # `&>`/`&>>` redirect shorthand: blank the `&` only.
            while (match(stripped, /&>/)) {
                stripped = substr(stripped, 1, RSTART - 1) " >" substr(stripped, RSTART + 2)
            }
            # 4-arg split (gawk) captures the actual separators so
            # 1-char (`;`, `|`, `&`) and 2-char (`&&`, `||`)
            # separators advance the offset by their true width.
            n = split(stripped, parts, /(&&|\|\||;|\||&)/, seps)
            part_start = 0
            for (i = 1; i <= n; i++) {
                seg = parts[i]
                lead = 0
                # leading whitespace trim
                while (substr(seg, 1, 1) == " " || substr(seg, 1, 1) == "\t") {
                    seg = substr(seg, 2)
                    lead++
                }
                # trailing whitespace trim
                while (length(seg) > 0 && substr(seg, length(seg), 1) ~ /[[:space:]]/) {
                    seg = substr(seg, 1, length(seg) - 1)
                }
                if (length(seg) > 0) {
                    printf "%d\t%s\n", line_start + part_start + lead, seg
                }
                part_start += length(parts[i]) + length(seps[i])
            }
        }
    '
}

# ------------------------------------------------------------------
# Detect CLI kind from a detection span. Echoes "claude",
# "copilot", or "" (no match).
# ------------------------------------------------------------------
detect_cli() {
    local span="$1"
    # Common shell prefixes (env assignments, env/time/command) must
    # not hide the CLI from detection (parity with copilot handling).
    local prefix='((env|time|command)[[:space:]]+|[A-Za-z_][A-Za-z0-9_]*=[^[:space:]]*[[:space:]]+)*'
    if echo "$span" | grep -qE "^${prefix}claude(\b|[[:space:]]|\$)"; then
        echo "claude"
        return
    fi
    if echo "$span" | grep -qE '^((env|time|command)[[:space:]]+|[A-Za-z_][A-Za-z0-9_]*=[^[:space:]]*[[:space:]]+)*(gh[[:space:]]+)?copilot(\b|[[:space:]]|$)'; then
        echo "copilot"
        return
    fi
    echo ""
}

# ------------------------------------------------------------------
# Validate a copilot invocation (bare `copilot` or `gh copilot --`
# wrapper). Args:
#   $1 — validation span
# Returns 0/1/2 per the canonical exit-code mapping. Rules per
# specs/2026-06-05-copilot-cli-cross-validation-lane/SPEC.md §8;
# stdin redirect is WARN-level (probe 2026-06-05: no hang observed
# without redirect).
# ------------------------------------------------------------------
validate_copilot() {
    local span="$1"
    local fails=0
    local warns=0

    # Normalize: strip env-assignment / env / time / command
    # prefixes, the `gh ` wrapper (any spacing), and the `--` flag
    # separator so rule greps see one canonical form.
    local s="$span"
    s="$(echo "$s" | sed -E 's/^((env|time|command)[[:space:]]+|[A-Za-z_][A-Za-z0-9_]*=[^[:space:]]*[[:space:]]+)*//')"
    s="$(echo "$s" | sed -E 's/^gh[[:space:]]+copilot/copilot/')"
    s="$(echo "$s" | sed -E 's/^copilot[[:space:]]+--([[:space:]]|$)/copilot \1/')"

    # Admin allowlist: administrative subcommands and flags are
    # exempt (per `gh copilot -- --help` Commands section).
    if echo "$s" | grep -qE '^copilot[[:space:]]+(login|version|update|help|mcp|plugin|completion|init)(\b|$)'; then
        echo "PASS: copilot span is administrative (subcommand)"
        return 0
    fi
    if echo "$s" | grep -qE '^copilot[[:space:]]+(--version|-v|--help|-h|--remove)([[:space:]]|$)'; then
        echo "PASS: copilot span is administrative (flag-triggered)"
        return 0
    fi

    # FAIL: scripted span without -p/--prompt — interactive session
    # in a non-TTY context (hang class).
    if ! echo "$s" | grep -qE -- '(^|[[:space:]])(-p|--prompt)([[:space:]]|=|$)'; then
        echo "FAIL: copilot span lacks -p/--prompt (interactive session would wedge a scripted context)"
        fails=$((fails + 1))
    else
        # FAIL: -p present but no prompt text follows (next token is
        # a flag, end-of-span, or an empty =-form value).
        if echo "$s" | grep -qE -- '(^|[[:space:]])(-p|--prompt)[[:space:]]+(-|$)' || echo "$s" | grep -qE -- '(^|[[:space:]])(-p|--prompt)[[:space:]]*$' || echo "$s" | grep -qE -- '(^|[[:space:]])(-p|--prompt)=(""|'"'"''"'"'|)([[:space:]]|$)'; then
            echo "FAIL: copilot span -p/--prompt has no prompt text argument"
            fails=$((fails + 1))
        fi
    fi

    # FAIL: lane family rule — --model MUST pin an explicit
    # GPT-family model. `auto` (any quoting) and non-GPT models are
    # blocked (serving a non-GPT model through Copilot silently
    # voids cross-family validity).
    local model_val
    model_val="$(echo "$s" | grep -oE -- '--model([[:space:]]+|=)("[^"]*"|'"'"'[^'"'"']*'"'"'|[^[:space:]]+)' | head -1 | sed -E 's/^--model([[:space:]]+|=)//; s/^["'"'"']//; s/["'"'"']$//')"
    if [ -n "$model_val" ]; then
        if [ "$model_val" = "auto" ]; then
            echo "FAIL: copilot span pins --model auto (explicit GPT-family pin REQUIRED in lane use)"
            fails=$((fails + 1))
        elif ! echo "$model_val" | grep -qE '^gpt-'; then
            echo "FAIL: copilot span pins non-GPT model '$model_val' (GPT-family pin REQUIRED in lane use — family rule per SPEC.schema §1.4)"
            fails=$((fails + 1))
        fi
    else
        # WARN: missing explicit --model pin.
        echo "WARN: copilot span missing explicit --model pin"
        warns=$((warns + 1))
    fi

    # WARN: blanket permission grant without scoping.
    if echo "$s" | grep -qE -- '--allow-all(-tools|-paths|-urls)?(\b|$)' && ! echo "$s" | grep -qE -- '(--deny-tool|--available-tools|--excluded-tools)'; then
        echo "WARN: copilot span grants --allow-all* without deny/availability scoping"
        warns=$((warns + 1))
    fi

    # WARN: hygiene flags for fleet lane use.
    if ! echo "$s" | grep -qE -- '--no-custom-instructions'; then
        echo "WARN: copilot span missing --no-custom-instructions"
        warns=$((warns + 1))
    fi
    if ! echo "$s" | grep -qE -- '--disable-builtin-mcps'; then
        echo "WARN: copilot span missing --disable-builtin-mcps (fleet zero-MCP default)"
        warns=$((warns + 1))
    fi

    # WARN: stdin redirect recommended (no hang observed in the
    # 2026-06-05 probe).
    if ! echo "$s" | grep -qE '<[[:space:]]*/dev/null\b'; then
        echo "WARN: copilot span missing < /dev/null stdin redirect (recommended for scripted use)"
        warns=$((warns + 1))
    fi

    if [ "$fails" -gt 0 ]; then
        return 2
    elif [ "$warns" -gt 0 ]; then
        return 1
    fi
    echo "PASS: copilot span ok"
    return 0
}

# ------------------------------------------------------------------
# Recover the validation span (un-stripped slice) from the original
# command-line given the detection-span offset.
# ------------------------------------------------------------------
recover_validation_span() {
    local cmdline="$1"
    local offset="$2"
    # Slice from offset to next bash logical operator or EOF.
    local tail="${cmdline:$offset}"
    # Stop at the first un-quoted logical operator. For pragmatic
    # use we approximate by stopping at the first unquoted `;`,
    # `&&`, `||`, or unescaped `|`. Within quoted strings these are
    # safe to ignore so we don't try to be exact.
    echo "$tail" | awk '
        BEGIN { in_squote = 0; in_dquote = 0 }
        {
            out = ""
            prev = ""
            i = 1
            while (i <= length($0)) {
                c = substr($0, i, 1)
                next2 = substr($0, i, 2)
                if (in_squote) {
                    if (c == "\x27") in_squote = 0
                    out = out c; prev = c
                    i++
                    continue
                }
                if (in_dquote) {
                    if (c == "\"") in_dquote = 0
                    out = out c; prev = c
                    i++
                    continue
                }
                if (c == "\x27") { in_squote = 1; out = out c; prev = c; i++; continue }
                if (c == "\"") { in_dquote = 1; out = out c; prev = c; i++; continue }
                if (next2 == "&&" || next2 == "||") { print out; exit }
                if (c == ";" || c == "|") { print out; exit }
                if (c == "&") {
                    # fd-duplication (2>&1) or &>-redirect: the `&`
                    # belongs to a redirect, not a separator.
                    if (prev == ">" || prev == "<" || substr($0, i + 1, 1) == ">") {
                        out = out c; prev = c
                        i++
                        continue
                    }
                    print out; exit
                }
                out = out c; prev = c
                i++
            }
            print out
        }
    '
}

# ------------------------------------------------------------------
# Parse known-good list into associative-array-like output.
# Outputs lines:
#   FLAG <name>
#   ALIAS <alias-flag> -> <canonical>
#   REQUIRES <flag> -> <required-flag>
#   MUTEX <flag-a> -> <flag-b>
#   ADMIN <subcommand>
# ------------------------------------------------------------------
parse_known_good() {
    local file="$1"
    awk '
        BEGIN { in_combo = 0; in_admin = 0 }
        /^#[[:space:]]*BEGIN[[:space:]]+combination-rules/ { in_combo = 1; next }
        /^#[[:space:]]*END[[:space:]]+combination-rules/ { in_combo = 0; next }
        /^#[[:space:]]*BEGIN[[:space:]]+admin-subcommands/ { in_admin = 1; next }
        /^#[[:space:]]*END[[:space:]]+admin-subcommands/ { in_admin = 0; next }
        /^#/ || /^[[:space:]]*$/ { next }
        in_combo {
            if (match($0, /^requires:[[:space:]]*(--[A-Za-z0-9-]+)[[:space:]]+requires[[:space:]]+(--[A-Za-z0-9-]+)/, m)) {
                print "REQUIRES " m[1] " -> " m[2]
            } else if (match($0, /^mutex:[[:space:]]*(--[A-Za-z0-9-]+)[[:space:]]+mutex[[:space:]]+(--[A-Za-z0-9-]+)/, m)) {
                print "MUTEX " m[1] " -> " m[2]
            }
            next
        }
        in_admin {
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", $0)
            if ($0 != "") print "ADMIN " $0
            next
        }
        # Flag line: --long | -alias | --alt
        {
            # split on "|"
            n = split($0, parts, /[[:space:]]*\|[[:space:]]*/)
            canonical = parts[1]
            gsub(/^[[:space:]]+|[[:space:]]+$/, "", canonical)
            if (canonical != "") {
                print "FLAG " canonical
                for (i = 2; i <= n; i++) {
                    alias = parts[i]
                    gsub(/^[[:space:]]+|[[:space:]]+$/, "", alias)
                    if (alias != "") print "ALIAS " alias " -> " canonical
                }
            }
        }
    ' "$file"
}

# ------------------------------------------------------------------
# Validate a claude invocation. Args:
#   $1 — validation span
#   $2 — path to known-good claude.txt (or empty string if missing)
# Returns 0/1/2.
# ------------------------------------------------------------------
validate_claude() {
    local span="$1"
    local known_good="$2"
    local fails=0
    local warns=0

    # Determine first non-flag argument (admin-subcommand check).
    # Normalize away env/time/command prefixes, then strip leading
    # "claude" and look at the next token.
    span="$(echo "$span" | sed -E 's/^((env|time|command)[[:space:]]+|[A-Za-z_][A-Za-z0-9_]*=[^[:space:]]*[[:space:]]+)*//')"
    local rest="${span#claude}"
    rest="${rest# }"  # one space trim
    local first_arg=""
    # Skip flags and their values to find the first positional.
    # Simple heuristic: first token that doesn't start with `-`.
    local tokens
    read -r -a tokens <<< "$rest"
    local i=0
    while [ "$i" -lt "${#tokens[@]}" ]; do
        local t="${tokens[$i]}"
        case "$t" in
            -*)
                # Flag — skip. Some flags take a value; without
                # known-good context we conservatively skip.
                i=$((i + 1))
                continue
                ;;
            *)
                first_arg="$t"
                break
                ;;
        esac
    done

    # Admin allowlist: flag-triggered.
    if echo "$span" | grep -qE -- '(^|[[:space:]])(--help|-h|--version|-v)([[:space:]]|$)'; then
        echo "PASS: claude span is administrative (flag-triggered)"
        return 0
    fi

    # Admin allowlist: subcommand-triggered (from known-good).
    if [ -n "$known_good" ] && [ -f "$known_good" ] && [ -n "$first_arg" ]; then
        if parse_known_good "$known_good" | grep -qE "^ADMIN ${first_arg}$"; then
            echo "PASS: claude span is administrative (subcommand: $first_arg)"
            return 0
        fi
    fi

    # Validate known flags + combinations.
    if [ -z "$known_good" ] || [ ! -f "$known_good" ]; then
        echo "WARN: claude known-good list missing; flag validation skipped"
        return 1
    fi

    # Build flag/alias set from known-good.
    local kg
    kg="$(parse_known_good "$known_good")"

    # Extract flags used in span.
    local span_flags
    span_flags="$(echo "$span" | grep -oE -- '--[A-Za-z0-9-]+|-[A-Za-z]' || true)"

    # Resolve aliases to canonical for combination-rules check.
    local seen_canonical=""

    while IFS= read -r flag; do
        [ -z "$flag" ] && continue
        # Is it a canonical flag?
        if echo "$kg" | grep -qF "FLAG $flag"; then
            seen_canonical="$seen_canonical $flag"
            continue
        fi
        # Is it an alias?
        local resolved
        resolved="$(echo "$kg" | awk -v a="$flag" '$1=="ALIAS" && $2==a {print $4; exit}')"
        if [ -n "$resolved" ]; then
            seen_canonical="$seen_canonical $resolved"
            continue
        fi
        # Unknown flag.
        echo "FAIL: claude span uses unrecognized flag: $flag"
        fails=$((fails + 1))
    done <<< "$span_flags"

    # Combination rules: requires.
    while IFS= read -r line; do
        [ -z "$line" ] && continue
        if [[ "$line" =~ ^REQUIRES\ (.+)\ -\>\ (.+)$ ]]; then
            local subj="${BASH_REMATCH[1]}"
            local needs="${BASH_REMATCH[2]}"
            if echo "$seen_canonical" | grep -qE "(^|[[:space:]])$subj([[:space:]]|$)"; then
                if ! echo "$seen_canonical" | grep -qE "(^|[[:space:]])$needs([[:space:]]|$)"; then
                    echo "FAIL: claude span flag $subj requires $needs (per known-good combination rules)"
                    fails=$((fails + 1))
                fi
            fi
        fi
    done <<< "$(echo "$kg" | grep '^REQUIRES')"

    # WARN: non-TTY without --print.
    if ! [ -t 0 ] && ! echo "$seen_canonical" | grep -qE "(^|[[:space:]])--print([[:space:]]|$)"; then
        echo "WARN: claude span invoked in non-TTY context without --print; may hang"
        warns=$((warns + 1))
    fi

    # FAIL: missing prompt argument.
    if [ -z "$first_arg" ]; then
        echo "FAIL: claude span appears to lack a prompt argument"
        fails=$((fails + 1))
    fi

    if [ "$fails" -gt 0 ]; then
        return 2
    elif [ "$warns" -gt 0 ]; then
        return 1
    fi
    echo "PASS: claude span ok"
    return 0
}

# ------------------------------------------------------------------
# Main validation entry point. Args:
#   $1 — proposed command-line
# Returns 0/1/2 per canonical mapping.
# ------------------------------------------------------------------
validate_command_line() {
    local cmdline="$1"
    # Join backslash-newline continuations into one logical line so
    # detection and validation see what bash actually executes.
    # Heredoc-aware: body lines are never joined (see Pass 0).
    cmdline="$(printf '%s' "$cmdline" | join_continuations)"
    local data_root
    data_root="$(resolve_data_root || echo '')"

    local detection
    detection="$(echo "$cmdline" | extract_detection_spans)"
    if [ -z "$detection" ]; then
        # No CLI of interest detected.
        return 0
    fi

    local worst=0
    while IFS=$'\t' read -r offset segment; do
        [ -z "$segment" ] && continue
        local cli
        cli="$(detect_cli "$segment")"
        [ -z "$cli" ] && continue

        local val_span
        val_span="$(recover_validation_span "$cmdline" "$offset")"

        local rc
        case "$cli" in
            claude)
                local kg_path=""
                [ -n "$data_root" ] && kg_path="$data_root/claude.txt"
                validate_claude "$val_span" "$kg_path"
                rc=$?
                ;;
            copilot)
                validate_copilot "$val_span"
                rc=$?
                ;;
            *)
                rc=0
                ;;
        esac
        if [ "$rc" -gt "$worst" ]; then
            worst="$rc"
        fi
    done <<< "$detection"

    return "$worst"
}

# ------------------------------------------------------------------
# Self-test suite.
# ------------------------------------------------------------------
self_test() {
    local pass=0
    local fail=0
    local data_root_test

    # Stub a minimal known-good claude.txt in a tmp data root for
    # the test suite so flag validation is exercised.
    data_root_test="$(mktemp -d)"
    cat > "$data_root_test/claude.txt" <<'EOF'
# refreshed: 2026-05-25
# cli-version: claude 2.1.150 (test fixture)
# help-source: claude --help
--print | -p
--model
--continue | -c
--resume | -r
--output-format
--input-format
--fallback-model
--max-budget-usd
--help | -h
--version | -v

# BEGIN combination-rules
requires: --output-format requires --print
requires: --input-format requires --print
requires: --fallback-model requires --print
requires: --max-budget-usd requires --print
# END combination-rules

# BEGIN admin-subcommands
agents
auth
auto-mode
config
doctor
install
mcp
migrate-installer
plugin
plugins
project
setup-token
ultrareview
update
upgrade
# END admin-subcommands
EOF
    # Force the helper to find this data root by exporting an
    # adapted CLAUDE_PROJECT_DIR.
    local prev_cpd="${CLAUDE_PROJECT_DIR:-}"
    # Create a parallel structure: $tmp/agents/skills/.../known-good
    local fakeroot
    fakeroot="$(mktemp -d)"
    mkdir -p "$fakeroot/agents/skills/cross-agent-cli-invocation"
    mv "$data_root_test" "$fakeroot/agents/skills/cross-agent-cli-invocation/known-good"
    export CLAUDE_PROJECT_DIR="$fakeroot"

    run_case() {
        local name="$1"
        local cmd="$2"
        local expected="$3"
        local actual
        validate_command_line "$cmd" >/dev/null 2>&1
        actual=$?
        if [ "$actual" = "$expected" ]; then
            printf '  PASS: %s\n' "$name"
            pass=$((pass + 1))
        else
            printf '  FAIL: %s (expected %s, got %s; cmd: %s)\n' "$name" "$expected" "$actual" "$cmd" >&2
            fail=$((fail + 1))
        fi
    }

    # T10: claude --print = WARN-allow? No, --print + prompt = PASS (0).
    # Self-test is non-TTY; --print is present so no WARN.
    run_case "T10-claude-print-good" \
        'claude --print "prompt"' 0

    # T11: claude --bogus = FAIL (2) per unknown flag
    run_case "T11-claude-unrecognized-flag" \
        'claude --bogus "prompt"' 2

    # T17: claude --output-format json "prompt" — FAIL (combination)
    run_case "T17-claude-output-format-without-print" \
        'claude --output-format json "prompt"' 2

    # T25-T27: admin allowlist
    run_case "T25-admin-version" 'claude --version' 0
    run_case "T26-admin-mcp-list" 'claude mcp list' 0
    run_case "T27-admin-doctor" 'claude doctor' 0
    run_case "T31-admin-auth" 'claude auth' 0
    run_case "T32-admin-plugin-list" 'claude plugin list' 0
    run_case "T33-admin-install-stable" 'claude install stable' 0

    # T60-T66: copilot lane cases per
    # specs/2026-06-05-copilot-cli-cross-validation-lane/SPEC.md §8.
    run_case "T60-copilot-well-formed" \
        'copilot -p "review the diff and report issues" --model gpt-5.5 -s --no-custom-instructions --disable-builtin-mcps --deny-tool write --deny-tool shell < /dev/null' 0
    run_case "T61-gh-copilot-wrapper-well-formed" \
        'gh copilot -- -p "review the diff and report issues" --model gpt-5.5 -s --no-custom-instructions --disable-builtin-mcps --deny-tool write --deny-tool shell < /dev/null' 0
    run_case "T62-copilot-model-auto-blocked" \
        'copilot -p "p" --model auto' 2
    run_case "T63-gh-copilot-model-auto-blocked" \
        'gh copilot -- -p "p" --model auto' 2
    run_case "T64-copilot-interactive-scripted-blocked" \
        'copilot --model gpt-5.5' 2
    run_case "T65-copilot-admin-version" \
        'gh copilot --version' 0
    run_case "T66-copilot-missing-model-warns" \
        'copilot -p "p" -s --no-custom-instructions --disable-builtin-mcps --deny-tool write < /dev/null' 1
    run_case "T67-copilot-p-without-prompt-text" \
        'copilot -p --model gpt-5.5 --no-custom-instructions --disable-builtin-mcps < /dev/null' 2

    # T75: prefix-form detection parity.
    run_case "T75-claude-env-prefix-bogus-flag" \
        'env claude --bogus "p"' 2

    # T68-T72: copilot diff-review hardening.
    run_case "T68-copilot-quoted-auto-blocked" \
        'copilot -p "p" --model "auto"' 2
    run_case "T69-copilot-non-gpt-model-blocked" \
        'copilot -p "p" --model claude-opus-4-8 -s --no-custom-instructions --disable-builtin-mcps < /dev/null' 2
    run_case "T70-copilot-env-prefix-detected" \
        'FOO=bar time copilot -p "p" --model auto' 2
    run_case "T71-gh-copilot-dash-v-admin" \
        'gh copilot -- -v' 0
    run_case "T72-copilot-empty-equals-prompt" \
        'copilot --prompt= --model gpt-5.5 --no-custom-instructions --disable-builtin-mcps < /dev/null' 2

    # T29: claude --resume "prompt" — exit ≤ 1 (NOT 2). Self-test
    # is non-TTY so --resume without --print emits WARN → exit 1.
    local actual_t29
    validate_command_line 'claude --resume "prompt"' >/dev/null 2>&1
    actual_t29=$?
    if [ "$actual_t29" -le 1 ]; then
        printf '  PASS: T29-claude-resume-not-blocked (actual=%s)\n' "$actual_t29"
        pass=$((pass + 1))
    else
        printf '  FAIL: T29-claude-resume-not-blocked (expected ≤1, got %s)\n' "$actual_t29" >&2
        fail=$((fail + 1))
    fi

    # Cleanup.
    export CLAUDE_PROJECT_DIR="$prev_cpd"
    rm -rf "$fakeroot"

    printf '\nself-test summary: %d PASS, %d FAIL\n' "$pass" "$fail"
    [ "$fail" -eq 0 ]
}

# ------------------------------------------------------------------
# --refresh-known-good <target>: parse <target> --help and write
# known-good file under the resolved data-root.
# ------------------------------------------------------------------
refresh_known_good() {
    local target="$1"
    local data_root
    data_root="$(resolve_data_root)" || {
        echo "FAIL: cannot resolve data root for refresh" >&2
        return 2
    }
    local help_cmd cli_version
    case "$target" in
        claude)
            command -v claude >/dev/null || { echo "FAIL: claude not on PATH" >&2; return 2; }
            help_cmd="claude --help"
            cli_version="$(claude --version 2>&1 | head -n1)"
            ;;
        copilot)
            # Resolve the executable: bare `copilot` when on PATH,
            # else the `gh copilot --` wrapper (per
            # specs/2026-06-05-copilot-cli-cross-validation-lane §8).
            if command -v copilot >/dev/null; then
                help_cmd="copilot --help"
                cli_version="$(copilot --version 2>&1 | head -n1)"
            elif command -v gh >/dev/null && gh copilot --version >/dev/null 2>&1; then
                help_cmd="gh copilot -- --help"
                cli_version="$(gh copilot --version 2>&1 | head -n1)"
            else
                echo "FAIL: neither copilot nor gh copilot is available" >&2
                return 2
            fi
            ;;
        *)
            echo "FAIL: unknown refresh target: $target (use 'claude' or 'copilot')" >&2
            return 2
            ;;
    esac

    local help_out
    help_out="$(eval "$help_cmd" 2>&1)"

    local outfile="$data_root/$target.txt"
    local refreshed_at
    refreshed_at="$(date -u +%Y-%m-%d)"

    {
        echo "# refreshed: $refreshed_at"
        echo "# cli-version: $cli_version"
        echo "# help-source: $help_cmd"
        # Extract long-form flags. Pattern: --long-flag, optionally
        # followed by "[, -short]" or "[, --alt]".
        echo "$help_out" | grep -oE -- '--[A-Za-z][A-Za-z0-9-]*' | sort -u | while read -r flag; do
            echo "$flag"
        done

        # For claude and copilot targets also emit admin-subcommands block.
        if [ "$target" = "claude" ] || [ "$target" = "copilot" ]; then
            echo ""
            echo "# BEGIN admin-subcommands"
            # Parse Commands: section. Each line: "  <name>[|<alias>] <description>".
            echo "$help_out" | awk '
                /^Commands:/ { in_cmd = 1; next }
                in_cmd && /^[A-Z]/ { in_cmd = 0; next }
                in_cmd && /^[[:space:]]+[A-Za-z]/ {
                    sub(/^[[:space:]]+/, "")
                    split($1, parts, "|")
                    for (i in parts) print parts[i]
                }
            ' | sort -u
            echo "# END admin-subcommands"
        fi
    } > "$outfile"

    echo "PASS: refreshed $outfile from \`$help_cmd\`"
}

# ------------------------------------------------------------------
# Argument dispatch.
# ------------------------------------------------------------------
main() {
    if [ "$#" -eq 0 ]; then
        echo "usage: validate-cli-invocation.sh \"<command-line>\" | - | --self-test | --refresh-known-good <target> | --help" >&2
        return 2
    fi

    case "$1" in
        --help|-h)
            cat <<'USAGE'
validate-cli-invocation.sh — cross-agent CLI invocation validator

Modes:
  validate-cli-invocation.sh "<command-line>"
      Validate the given command-line. argv mode.
  validate-cli-invocation.sh -
      Read command-line from stdin.
  validate-cli-invocation.sh --self-test
      Run the embedded test suite.
  validate-cli-invocation.sh --refresh-known-good <target>
      Regenerate the known-good list for <target> (one of
      "claude" or "copilot") by parsing <target> --help.

Exit codes:
  0  PASS
  1  WARN-only (advisory)
  2  FAIL (block)
USAGE
            return 0
            ;;
        --self-test)
            self_test
            return $?
            ;;
        --refresh-known-good)
            shift
            [ "$#" -eq 1 ] || { echo "usage: --refresh-known-good <target>" >&2; return 2; }
            refresh_known_good "$1"
            return $?
            ;;
        -)
            local cmd
            cmd="$(cat)"
            validate_command_line "$cmd"
            return $?
            ;;
        --stdin)
            # Hook JSON contract: stdin is JSON with a command field.
            local payload cmd_stdin
            payload="$(cat)"
            if command -v jq >/dev/null 2>&1; then
                cmd_stdin="$(printf '%s' "$payload" | jq -r '.tool_input.command // .command // empty' 2>/dev/null)"
            else
                cmd_stdin="$(printf '%s' "$payload" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/^"command"[[:space:]]*:[[:space:]]*"(.*)"$/\1/')"
            fi
            if [ -z "$cmd_stdin" ]; then
                # Not a recognised JSON payload — exit 0 silently.
                return 0
            fi
            validate_command_line "$cmd_stdin"
            return $?
            ;;
        *)
            validate_command_line "$1"
            return $?
            ;;
    esac
}

main "$@"
