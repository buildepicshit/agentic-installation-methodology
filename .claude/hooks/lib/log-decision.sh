#!/usr/bin/env bash
# log-decision.sh — shared hook decision logger (fleet instrumentation).
#
# CONTRACT
#   Sourced by every gate hook. Records one TSV line per hook invocation
#   to a gitignored, machine-local log so the fleet can answer a question
#   it currently cannot: do these gates ever actually block anything?
#
#   Adopted 2026-07-24 as recommendation 1 of
#   specs/2026-07-24-ceremony-weight-audit/SPEC.md. That audit found 14
#   hooks with 195 green tests and ZERO recorded instances of a hook
#   blocking a real in-flight mistake — which is absence of MEASUREMENT,
#   not proof of absence. This closes the measurement gap.
#
# FAIL-SAFE BY CONSTRUCTION
#   This helper MUST NOT be able to change a gate's decision. Every
#   function returns 0 unconditionally, all writes are guarded, and the
#   installed trap does not call `exit`. If logging breaks, gates still
#   gate.
#
# USAGE (one identical block per hook, right after the shebang/set line)
#   source "${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/lib/log-decision.sh" 2>/dev/null || true
#   bes_log_install_trap "<hook-name>"
#
#   A hook MAY set BES_LOG_RULE="some-rule-id" to record which of its
#   rules fired.
#
# LOG FORMAT (tab-separated, append-only)
#   <iso8601>  <hook>  ALLOW|BLOCK|WARN|ERROR|UNKNOWN  <rule-id>  <detail>
#
# WE DELIBERATELY DO NOT LOG COMMAND TEXT
#   An earlier draft captured a redacted excerpt of the command being
#   judged. Cross-family review (2026-07-24, gpt-5.6-sol) killed it on two
#   counts: no gate ever populated it, so the field was always empty; and
#   redaction by pattern is an unwinnable arms race — the reviewer named
#   `--password <value>`, `Authorization: Basic`, URL-embedded
#   credentials and `X-API-Key:` as immediate misses. A durable on-disk
#   log of every command an agent runs is a large secret-exposure surface
#   to accept for a field nobody had wired up.
#
#   The question this instrument exists to answer — *do these gates ever
#   block anything?* — is fully answered by (timestamp, hook, verdict).
#   `bes_log_redact` is retained as defense-in-depth for the optional
#   BES_LOG_RULE field and for any future opt-in detail, but nothing is
#   captured from the payload by default.
#
# PRIVACY
#   The log never leaves the machine: gitignored via `.claude/hooks/.gitignore`
#   (which propagates), absent from every propagation manifest. Do not
#   commit it and do not add it to a manifest.

BES_LOG_FILE="${BES_LOG_FILE:-${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/decisions.log}"

# bes_log_redact <string> -> stdout
# Blanks secret-shaped tokens. Deliberately over-broad: a false redaction
# costs nothing, a leaked token costs a rotation.
bes_log_redact() {
    printf '%s' "${1-}" 2>/dev/null | sed -E \
        -e 's/(gh[pousr]_)[A-Za-z0-9_]+/\1REDACTED/g' \
        -e 's/(sk-ant-[A-Za-z0-9-]{4})[A-Za-z0-9_-]+/\1REDACTED/g' \
        -e 's/(sk-)[A-Za-z0-9_-]{8,}/\1REDACTED/g' \
        -e 's/(whsec_)[A-Za-z0-9_-]+/\1REDACTED/g' \
        -e 's/([A-Za-z0-9_]*(TOKEN|SECRET|PASSWORD|PASSWD|APIKEY|API_KEY|CREDENTIAL)[A-Za-z0-9_]*=)[^[:space:]]+/\1REDACTED/gI' \
        -e 's/(--(password|passwd|token|api-key|apikey|secret)[= ])[^[:space:]]+/\1REDACTED/gI' \
        -e 's/(Authorization:[[:space:]]*(Bearer|Basic)[[:space:]]+)[^[:space:]]+/\1REDACTED/gI' \
        -e 's/(X-(API|Auth)-Key:[[:space:]]*)[^[:space:]]+/\1REDACTED/gI' \
        -e 's|(://)[^/[:space:]@]+:[^/[:space:]@]+@|\1REDACTED:REDACTED@|g' \
        2>/dev/null || true
}

# bes_log_sanitise <string> <max-chars> -> stdout
# Collapses anything that would break positional TSV parsing (tab, CR, LF)
# and truncates. Applied to every field before the write.
bes_log_sanitise() {
    printf '%s' "${1-}" 2>/dev/null \
        | tr '\n\r\t' '   ' 2>/dev/null \
        | cut -c1-"${2:-120}" 2>/dev/null || true
}

# bes_log_write <hook> <decision> <rule-id> <detail>
bes_log_write() {
    local hook="${1:-unknown}" decision="${2:-UNKNOWN}" rule="${3:--}" cmd="${4-}"
    local ts line dir
    # Constrain the decision column to the documented enum. A hook sets
    # BES_LOG_DECISION itself, so an unexpected value could otherwise reach
    # this column and — if it contained a tab or newline — corrupt the TSV
    # that every reader parses positionally.
    case "$decision" in
        ALLOW|BLOCK|WARN|ERROR|UNKNOWN) : ;;
        *) decision="UNKNOWN" ;;
    esac
    dir=$(dirname "$BES_LOG_FILE" 2>/dev/null) || return 0
    [ -d "$dir" ] || return 0
    ts=$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null) || ts="-"
    # Sanitise EVERY field, not just the last one. Readers parse this file
    # positionally (`awk -F'\t'`), so a tab or newline anywhere — including in
    # a hook name or a rule id — silently shifts every later column.
    hook=$(bes_log_sanitise "$hook" 64)
    rule=$(bes_log_sanitise "$(bes_log_redact "$rule")" 64)
    cmd=$(bes_log_sanitise "$(bes_log_redact "$cmd")" 120)
    printf '%s\t%s\t%s\t%s\t%s\n' "$ts" "${hook:--}" "$decision" "${rule:--}" "${cmd:--}" \
        >> "$BES_LOG_FILE" 2>/dev/null || true
    return 0
}

# bes_log_add_cleanup <function-name>
# Register an EXIT-time cleanup that runs INSIDE the logging trap.
#
# WHY THIS EXISTS
#   Bash keeps exactly one EXIT trap. A hook that installs its own
#   `trap ... EXIT` after sourcing this lib silently REPLACES the logging
#   trap, and every decision it reaches thereafter goes unrecorded.
#   Measured 2026-07-31 in block-journal-skip.sh, whose lock cleanup did
#   exactly this: four of its five blocking paths, and every post-lock
#   allow, were invisible — including a gate that blocked a real session.
#   Authority: file://specs/2026-07-31-hook-decision-log-integrity/SPEC.md §3.1
#
# NAMES ONLY, NEVER COMMAND STRINGS
#   The argument is a function NAME, validated against a strict pattern and
#   confirmed to be a defined function. It is never `eval`'d as a command.
#   A registry of arbitrary strings would let a cleanup containing `exit`
#   terminate the trap before the write — reintroducing the very defect this
#   closes — and `|| true` cannot contain shell termination. Caught by
#   cross-family review (gpt-5.6-sol, 2026-07-31, gate 1 round 1 BLOCKING-2).
#
# Registration is idempotent: a name already registered is not added twice,
# so each cleanup runs at most once.
bes_log_add_cleanup() {
    local fn="${1-}"
    case "$fn" in
        ''|*[!A-Za-z0-9_]*) return 0 ;;   # reject anything but a bare identifier
        [0-9]*) return 0 ;;               # identifiers cannot lead with a digit
    esac
    declare -F "$fn" >/dev/null 2>&1 || return 0
    case " ${BES_LOG_CLEANUPS-} " in
        *" $fn "*) return 0 ;;
    esac
    BES_LOG_CLEANUPS="${BES_LOG_CLEANUPS-}${BES_LOG_CLEANUPS:+ }$fn"
    return 0
}

# bes_log_run_cleanups
# Runs every registered cleanup, each in its OWN SUBSHELL. The subshell is
# load-bearing, not defensive habit: it contains `exit`, `exec` and any
# non-zero return, so a misbehaving cleanup can neither terminate the trap
# before the record is written nor leak a status into the verdict.
bes_log_run_cleanups() {
    local fn
    for fn in ${BES_LOG_CLEANUPS-}; do
        ( "$fn" ) >/dev/null 2>&1 || true
    done
    return 0
}

# bes_log_install_trap <hook-name>
# Maps the hook's final exit code onto a decision and records it.
#   0 -> ALLOW (or WARN when the hook set BES_LOG_DECISION=WARN)
#   2 -> BLOCK   (Claude Code's deny code)
#   * -> ERROR
# Any other value a hook puts in BES_LOG_DECISION is mapped to UNKNOWN,
# which is part of the enum for exactly this reason.
# The trap never calls `exit`, so it cannot alter the gate's verdict.
# Order inside the trap is fixed: capture $? FIRST, then run cleanups, then
# write. The status the record carries is the one the gate actually exited
# with, whatever the cleanups do.
bes_log_install_trap() {
    BES_LOG_HOOK="${1:-$(basename "${BASH_SOURCE[1]:-unknown}" 2>/dev/null)}"
    trap 'bes_log_rc=$?
          case "$bes_log_rc" in
            0) bes_log_decision="${BES_LOG_DECISION:-ALLOW}" ;;
            2) bes_log_decision="BLOCK" ;;
            *) bes_log_decision="ERROR" ;;
          esac
          bes_log_run_cleanups
          bes_log_write "$BES_LOG_HOOK" "$bes_log_decision" "${BES_LOG_RULE:--}" "${BES_LOG_DETAIL-}"' EXIT
    return 0
}
