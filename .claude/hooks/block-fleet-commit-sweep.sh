#!/usr/bin/env bash
# PreToolUse(Bash): block commit SWEEPS of fleet-managed paths in CHILD
# repos. fleet-sync lays its file set into child working trees UNSTAGED
# (2026-07-02 stage-posture SPEC); this guard ensures fleet content only
# lands in DELIBERATE `fleet:`-typed commits, never swept into product
# commits via the index, `-a/--all`, `-i/--include`, or bare pathspecs.
# Fail-open in the SOURCE repo (bes-fleet-policy commits touch these
# paths constantly), outside git repos, and in repos with no fleet
# content. Per specs/2026-07-02-fleet-sync-stage-posture/SPEC.md.
set -uo pipefail

FLEET_RE='^(\.agents(/|$)|\.claude(/|$)|WORKFLOW\.md$|\.githooks(/|$))'
# CHILD-LOCAL content under fleet directories is PRODUCT, not baseline:
# .agents/specs/** is each repo's own SPEC/TASK ledger — never in the
# sync manifests (fleet-sync.sh header: it "does not propagate ...
# WILL be swept"). r3, ACTOCCATUD launch-day follow-up (owner-directed).
FLEET_EXEMPT_RE='^\.agents/specs(/|$)'
is_fleet_path() {
    printf '%s' "$1" | grep -qE "$FLEET_EXEMPT_RE" && return 1
    printf '%s' "$1" | grep -qE "$FLEET_RE"
}

# extract_real_commands: emit one logical command per line, with quoted
# strings and heredoc bodies stripped, so we only see verb-position
# tokens. (Shared classifier lineage: block-verify-bypass.sh.)
extract_real_commands() {
    awk '
    BEGIN { in_heredoc = 0; tag = "" }
    {
        line = $0
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
        gsub(/'\''[^'\'']*'\''/, "\x01Q\x01", line)
        gsub(/"[^"]*"/, "\x01Q\x01", line)
        n = split(line, parts, /(&&|\|\||;|\||&)/)
        for (i = 1; i <= n; i++) {
            sub(/^[[:space:]]+/, "", parts[i])
            sub(/[[:space:]]+$/, "", parts[i])
            if (parts[i] != "") print parts[i]
        }
    }'
}

read_command() {
    local input
    input="$(cat)"
    if command -v jq >/dev/null 2>&1; then
        printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null || true
    else
        printf '%s' "$input" | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed -E 's/^"command"[[:space:]]*:[[:space:]]*"(.*)"$/\1/'
    fi
}

command="$(read_command)"

# Cheap pre-filter: nothing commit-shaped in the input.
printf '%s' "$command" | grep -q 'commit' || exit 0

# Repo context: the INVOCATION-cwd root is only the FALLBACK — each
# logical command may retarget via `-C` (r3: the reproduced misfire was
# `git -C <source-repo> commit` classified against the child cwd's
# index). Per-command root resolution + fail-opens live inside the loop.
cwd_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"

COMMIT_RE='^git([[:space:]]+(-C[[:space:]]+[^[:space:]]+|-c[[:space:]]+[^[:space:]]+|--(git-dir|work-tree|namespace)([[:space:]]+[^[:space:]]+|=[^[:space:]]*)|--[A-Za-z-]+(=[^[:space:]]*)?|-[A-Za-z]))*[[:space:]]+commit\b'

fired=0; matched=""; reason=""
while IFS= read -r real_cmd; do
    [ -z "$real_cmd" ] && continue
    printf '%s' "$real_cmd" | grep -qE "$COMMIT_RE" || continue

    # --- Resolve THIS command's repo root (r3: honor -C) ---
    # Quote-stripped values became placeholders; an unresolvable -C
    # falls back to the cwd root (safe default per the option-ARGUMENT
    # class rules), never fails open.
    cmd_root="$cwd_root"
    cval=$(printf '%s' "$real_cmd" | grep -oE -- '(^|[[:space:]])-C[[:space:]]+[^[:space:]]+' | head -1 | sed -E 's/^[[:space:]]*-C[[:space:]]+//')
    if [ -n "$cval" ] && [ "$cval" != "$(printf '\x01')Q$(printf '\x01')" ]; then
        r="$(git -C "$cval" rev-parse --show-toplevel 2>/dev/null || true)"
        [ -n "$r" ] && cmd_root="$r"
    fi
    # Fail open (this command) outside any git repo.
    [ -n "$cmd_root" ] || continue
    # Fail open in the SOURCE repo (IS_SOURCE marker predicate, same as
    # fleet-selfcheck.sh: canonical manifest present, propagated absent).
    if [ -f "$cmd_root/agents/scripts/fleet-skills.txt" ] && [ ! -f "$cmd_root/.agents/scripts/fleet-skills.txt" ]; then
        continue
    fi
    # Fail open where no fleet-managed content exists (all four classes
    # of FLEET_RE — r1 catch: .githooks was missing).
    if [ ! -d "$cmd_root/.agents" ] && [ ! -d "$cmd_root/.claude" ] \
       && [ ! -f "$cmd_root/WORKFLOW.md" ] && [ ! -d "$cmd_root/.githooks" ]; then
        continue
    fi

    # --- Assemble the EFFECTIVE commit set (git-faithful model) ---
    # Tokens after `commit`: options, option VALUES (skip-listed), and
    # pathspecs. Quoted values were replaced by \x01Q\x01 placeholders
    # so skip-next consumes them without eating a real pathspec.
    has_all=0; has_include=0; has_amend=0
    psf_value=""; psf_present=0
    fleet_named=0; product_named=0
    # --pathspec-from-file (r1 catch): capture the VALUE so the file can
    # be evaluated; = and space forms both. Extracted from THIS logical
    # command (r2 catch: whole-command extraction misclassified chained
    # commits); quoted values became placeholders in the strip pass and
    # therefore fall through to the conservative unevaluable-block.
    # --pathspec-file-nul (r2 catch): NUL-delimited files cannot be
    # line-parsed here — treat as unevaluable.
    if printf '%s' "$real_cmd" | grep -qE -- '--pathspec-from-file'; then
        psf_present=1
        if ! printf '%s' "$real_cmd" | grep -qE -- '--pathspec-file-nul'; then
            psf_value=$(printf '%s' "$real_cmd" | grep -oE -- '--pathspec-from-file(=|[[:space:]]+)[^[:space:]]+' | head -1 | sed -E 's/^--pathspec-from-file(=|[[:space:]]+)//')
            case "$psf_value" in *"$(printf '\x01')"*) psf_value="" ;; esac
        fi
    fi
    eval_tokens=$(printf '%s' "$real_cmd" | awk '
        {
            seen = 0
            for (i = 1; i <= NF; i++) {
                if (!seen) { if ($i == "commit") seen = 1; continue }
                print $i
            }
        }')
    skip_next=0
    while IFS= read -r tok; do
        [ -z "$tok" ] && continue
        if [ "$skip_next" = "1" ]; then skip_next=0; continue; fi
        case "$tok" in
            -m|--message|-F|--file|-t|--template|-c|-C|--fixup|--squash|--author|--date|--cleanup|--pathspec-from-file|--trailer)
                skip_next=1; continue ;;
            --all) has_all=1; continue ;;
            --include) has_include=1; continue ;;
            --amend) has_amend=1; continue ;;
            --*) continue ;;
            -*)
                # short cluster: -a / -i may hide in combined forms (-am, -ai)
                case "$tok" in *a*) has_all=1 ;; esac
                case "$tok" in *i*) has_include=1 ;; esac
                continue ;;
            "$(printf '\x01')Q$(printf '\x01')") continue ;;
            --) continue ;;
            *)
                if is_fleet_path "$tok"; then
                    fleet_named=$((fleet_named+1))
                else
                    product_named=$((product_named+1))
                fi
                ;;
        esac
    done <<EOF_TOKENS
$eval_tokens
EOF_TOKENS

    fleet_n=0; product_n=0
    count_paths() {
        # stdin: newline-separated paths; adds to fleet_n / product_n
        while IFS= read -r p; do
            [ -z "$p" ] && continue
            if is_fleet_path "$p"; then
                fleet_n=$((fleet_n+1))
            else
                product_n=$((product_n+1))
            fi
        done
    }

    if [ "$psf_present" = "1" ]; then
        # --pathspec-from-file (r1 catch): behaves like bare pathspecs —
        # the FILE names the commit set. Evaluate it when readable;
        # stdin (-) / unresolvable files cannot be evaluated → block
        # (use explicit pathspecs instead). Relative paths resolve
        # against the invocation cwd.
        if [ "$psf_value" != "-" ] && [ -n "$psf_value" ] && [ -f "$psf_value" ]; then
            count_paths < "$psf_value"
        else
            fired=1; matched="$real_cmd"
            reason="--pathspec-from-file could not be evaluated (stdin or unresolvable path) in a repo carrying fleet-managed content — use explicit pathspecs so the sweep guard can classify the commit set."
            break
        fi
    elif [ $((fleet_named + product_named)) -gt 0 ] && [ "$has_all" = "0" ] && [ "$has_include" = "0" ]; then
        # Bare pathspec commit: the index is IGNORED — only named paths.
        fleet_n=$fleet_named; product_n=$product_named
    else
        count_paths < <(git -C "$cmd_root" diff --cached --name-only 2>/dev/null)
        if [ "$has_all" = "1" ]; then
            count_paths < <(git -C "$cmd_root" diff --name-only 2>/dev/null)
        fi
        if [ "$has_include" = "1" ]; then
            fleet_n=$((fleet_n + fleet_named)); product_n=$((product_n + product_named))
        fi
    fi

    # --amend (r1 catch): the amended commit's EXISTING paths join the
    # effective set, and its subject is the reused message when no -m
    # is given — fleet content must not amend into a product commit.
    if [ "$has_amend" = "1" ]; then
        count_paths < <(git -C "$cmd_root" show --name-only --format= HEAD 2>/dev/null)
    fi

    [ "$fleet_n" -gt 0 ] || continue

    if [ "$product_n" -gt 0 ]; then
        fired=1; matched="$real_cmd"
        reason="effective commit set MIXES $fleet_n fleet-managed path(s) with $product_n product path(s) — this is the commit-sweep class. Commit product and fleet content SEPARATELY (fleet set: a 'fleet:'-typed commit)."
        break
    fi

    # Pure-fleet set: require a fleet:-typed message when determinable.
    # Quote-aware extraction from the RAW command (first -m/--message);
    # for --amend without -m the reused HEAD subject IS the message
    # (r1 catch: --no-edit made it determinable all along).
    msg=$(printf '%s' "$command" | grep -oE -- '(-m|--message=?)[[:space:]]*("[^"]*"|'"'"'[^'"'"']*'"'"'|[^[:space:]"'"'"']+)' | head -1 | sed -E 's/^(-m|--message=?)[[:space:]]*//; s/^"//; s/"$//; s/^'"'"'//; s/'"'"'$//')
    if [ -z "${msg:-}" ] && [ "$has_amend" = "1" ]; then
        msg=$(git -C "$cmd_root" log -1 --format=%s 2>/dev/null || true)
    fi
    if [ -n "${msg:-}" ] && ! printf '%s' "$msg" | grep -qE '^fleet(\(|:|!)'; then
        fired=1; matched="$real_cmd"
        reason="pure fleet-managed commit set but the message is not 'fleet:'-typed — use a 'fleet:' Conventional Commit so fleet baseline commits stay auditable."
        break
    fi
    # Message undeterminable (editor / -F / heredoc): cooperative fail-open.
done < <(printf '%s' "$command" | extract_real_commands)

if [ "$fired" = "1" ]; then
    printf 'block-fleet-commit-sweep: %s\n(matched: %s)\n(see specs/2026-07-02-fleet-sync-stage-posture — fleet-sync lays files UNSTAGED; commit them deliberately)\n' "$reason" "$matched" >&2
    exit 2
fi
exit 0
