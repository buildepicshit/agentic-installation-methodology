#!/usr/bin/env bash
# block-journal-skip.sh — Stop hook. Blocks session exit when the working tree
# changed during the session and SESSION_JOURNAL.md did not grow.
#
# CONTRACT
#   Authority: file://specs/2026-07-26-journal-exit-gate/SPEC.md §8.
#   The journal is the fleet's only cross-session continuity record and its
#   enforcement was a norm with no teeth. Measured in ACTOCCATUD: zero entries
#   for 2026-07-24/25/26 against 12 commits on 07-26 alone.
#
# FAIL-OPEN BY CONSTRUCTION
#   This gate MAY produce a false ALLOW. It MUST NOT produce a false BLOCK that
#   traps a session with no way out. Every ambiguity takes the exit-0 branch.
#
# EXIT: 0 allow (or degraded) | 2 block
set -uo pipefail
source "${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/lib/log-decision.sh" 2>/dev/null || true
type bes_log_install_trap >/dev/null 2>&1 && bes_log_install_trap "block-journal-skip.sh"

JOURNAL="SESSION_JOURNAL.md"

allow() { [ -n "${1:-}" ] && printf 'block-journal-skip: %s\n' "$1" >&2; exit 0; }

marker_path() {  # marker_path <session_id> -> path, or empty
    local gd; gd=$(git rev-parse --absolute-git-dir 2>/dev/null) || return 1
    printf '%s/bes-session-%s' "$gd" "$1"
}

# Must hash CONTENT, not just the porcelain name list. `git status --porcelain`
# prints " M f.txt" no matter how many times f.txt changes, so a second edit to
# an already-dirty file looked identical to the first and the checkpoint never
# re-armed. Caught by the checkpoint self-test.
tree_state() {
    printf '%s|%s|%s' \
        "$(git rev-parse HEAD 2>/dev/null)" \
        "$(git status --porcelain 2>/dev/null | sha256sum | cut -d' ' -f1)" \
        "$(git diff HEAD 2>/dev/null | sha256sum | cut -d' ' -f1)"
}

journal_len() { [ -f "$JOURNAL" ] && wc -c < "$JOURNAL" | tr -d ' ' || printf '0'; }
journal_sha() {  # journal_sha <n-bytes>
    [ -f "$JOURNAL" ] || { printf ''; return; }
    head -c "$1" "$JOURNAL" 2>/dev/null | sha256sum | cut -d' ' -f1
}

# Atomic, and NEVER fatal. A checkpoint that cannot be written must not make
# the gate exit non-zero: with an unwritable $GIT_DIR that would block every
# Stop forever with no escape. Write to a temp file and rename; swallow all
# failures. (R2 BLOCKING-2.)
write_marker() {  # write_marker <path>
    local tmp="$1.tmp.$$"
    { printf '%s\n%s\n%s\n' "$(tree_state)" "$(journal_len)" "$(journal_sha "$(journal_len)")" > "$tmp" \
        && mv -f "$tmp" "$1"; } 2>/dev/null || { rm -f "$tmp" 2>/dev/null; return 0; }
    return 0
}

# Serialise read/check/checkpoint per session so two racing Stops cannot both
# consume the same append. mkdir is atomic. Lock failure FAILS OPEN — a lock we
# cannot take must never become a block. (R2 HIGH-1.)
lock_dir=""
release_lock() { [ -n "$lock_dir" ] && rm -rf "$lock_dir" 2>/dev/null; return 0; }

# The cleanup is REGISTERED with the logger, not installed as our own EXIT
# trap. Bash keeps one EXIT trap, so a second one replaces the logging trap
# and erases this gate's own decisions: measured 2026-07-31, four of five
# blocking paths and every post-lock allow went unrecorded, including a gate
# that blocked a real session.
# Authority: file://specs/2026-07-31-hook-decision-log-integrity/SPEC.md §3.1
take_lock() {
    lock_dir="$1.lock"
    mkdir "$lock_dir" 2>/dev/null || { lock_dir=""; return 1; }
    if type bes_log_add_cleanup >/dev/null 2>&1; then
        bes_log_add_cleanup release_lock
    else
        trap 'release_lock' EXIT  # bes-log-cleanup-fallback: lib unsourced, no log trap to preserve
    fi
    return 0
}

# --- self-test ------------------------------------------------------------
if [ "${1:-}" = "--self-test" ]; then
    P=0; F=0
    ck() { if [ "$2" = "$3" ]; then P=$((P+1)); printf 'PASS %s\n' "$1";
           else F=$((F+1)); printf 'FAIL %s (want %s got %s)\n' "$1" "$2" "$3"; fi; }
    HOOK="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")"

    # ISOLATE THE LOG BEFORE ANY FIXTURE FIRES. Exported, so the child hook
    # invocations below inherit it. Without this the suite wrote its 22
    # synthetic decisions straight into the configured project's production
    # log, indistinguishable from real gate traffic — measured 2026-07-31.
    # A test suite MUST NOT be able to contaminate the instrument it tests.
    # Authority: file://specs/2026-07-31-hook-decision-log-integrity/SPEC.md §3.2
    # The teardown goes through the SAME registry the gate uses — this suite
    # must not model the anti-pattern it exists to catch. It also gives the
    # behaviour we want for free: the registry runs cleanups BEFORE the write,
    # so removing this directory makes the self-test's own trailing record a
    # no-op (bes_log_write returns early when its directory is gone). A test
    # run therefore leaves no decision record anywhere.
    SELFTEST_DIR=$(mktemp -d)
    selftest_teardown() { [ -n "${SELFTEST_DIR:-}" ] && rm -rf "$SELFTEST_DIR" 2>/dev/null; return 0; }
    if type bes_log_add_cleanup >/dev/null 2>&1; then
        bes_log_add_cleanup selftest_teardown
    else
        trap 'selftest_teardown' EXIT  # bes-log-cleanup-fallback: lib unsourced, no log trap to preserve
    fi
    export BES_LOG_FILE="$SELFTEST_DIR/decisions.log"
    : > "$BES_LOG_FILE"
    # verdicts logged by the most recent fire, then reset for the next case
    logged() { cut -f3 "$BES_LOG_FILE" 2>/dev/null | tr '\n' ' ' | sed 's/ *$//'; }
    reset_log() { : > "$BES_LOG_FILE"; }
    mk() {  # mk -> echoes a fresh repo dir with a journal + one commit
        d=$(mktemp -d); ( cd "$d"
          git init -q; git config user.email a@b; git config user.name a
          printf 'j\n' > SESSION_JOURNAL.md; printf 'x\n' > f.txt
          git add -A >/dev/null 2>&1; git commit -qm init ) ; printf '%s' "$d"; }
    # Fixtures run in throwaway repos that have no .claude/ of their own, so the
    # child hook can only find the logger via CLAUDE_PROJECT_DIR. Default it to
    # the tree this hook actually lives in — otherwise the lib never sources and
    # every log-integrity assertion below passes vacuously.
    # PASS IT THROUGH when already set: the AC-6 decoy case depends on the child
    # resolving the caller's CLAUDE_PROJECT_DIR and being redirected by the
    # exported BES_LOG_FILE, which is the mechanism under test.
    PROJDIR="$(dirname "$(dirname "$(dirname "$HOOK")")")"
    fire() { ( cd "$1" && printf '{"session_id":"%s"}' "${2:-S}" \
        | CLAUDE_PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PROJDIR}" bash "$HOOK" >/dev/null 2>&1; echo $? ); }
    seed() { ( cd "$1" && printf '{"session_id":"%s"}' "${2:-S}" \
        | CLAUDE_PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$PROJDIR}" SEED_ONLY=1 bash "$HOOK" >/dev/null 2>&1 ); }

    d=$(mk); seed "$d"; ck "read-only session allows" 0 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt )
    ck "tree changed, journal untouched BLOCKS" 2 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt && printf 'entry\n' >> SESSION_JOURNAL.md )
    ck "journal appended allows" 0 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt && rm SESSION_JOURNAL.md )
    ck "journal deleted BLOCKS" 2 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt && : > SESSION_JOURNAL.md )
    ck "journal truncated BLOCKS" 2 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt && printf 'REWRITTEN longer than before\n' > SESSION_JOURNAL.md )
    ck "journal rewritten BLOCKS" 2 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt && chmod a-w SESSION_JOURNAL.md )
    ck "unwritable journal fails open" 0 "$(fire "$d")"; ( cd "$d" && chmod u+w SESSION_JOURNAL.md ); rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt )
    mrk="$d/.git/bes-session-S"; mkdir -p "$mrk.lock"
    ck "held lock fails open" 0 "$(fire "$d")"; rmdir "$mrk.lock" 2>/dev/null; rm -rf "$d"

    d=$(mk); ck "no marker fails open" 0 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt )
    ck "unknown session id fails open" 0 "$(fire "$d" OTHER)"; rm -rf "$d"

    d=$(mk); seed "$d"
    ( cd "$d" && printf 'y\n' >> f.txt && git checkout -q --detach 2>/dev/null )
    ck "detached HEAD fails open" 0 "$(fire "$d")"; rm -rf "$d"

    d=$(mktemp -d); ck "outside a git repo fails open" 0 "$(fire "$d")"; rm -rf "$d"

    d=$(mk); seed "$d"; ck "no session_id in payload fails open" 0 \
        "$( cd "$d" && printf '{}' | bash "$HOOK" >/dev/null 2>&1; echo $? )"; rm -rf "$d"

    # checkpoint: one append satisfies exactly ONE stop
    d=$(mk); seed "$d"
    ( cd "$d" && printf 'y\n' >> f.txt && printf 'e\n' >> SESSION_JOURNAL.md )
    r1=$(fire "$d"); ( cd "$d" && printf 'z\n' >> f.txt ); r2=$(fire "$d")
    ck "checkpoint: first stop allows"        0 "$r1"
    ck "checkpoint: later change blocks again" 2 "$r2"; rm -rf "$d"

    # --- decision-log integrity (SPEC 2026-07-31-hook-decision-log-integrity) ---
    # These are the assertions whose absence let the trap-clobber live: the gate
    # returned the right verdict the whole time, so every exit-code case above
    # passed while four of five blocking paths recorded nothing.

    # AC-1: a BLOCK reached AFTER take_lock() is recorded, exactly once.
    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt ); reset_log
    r=$(fire "$d")
    ck "post-lock BLOCK: verdict"      2         "$r"
    ck "post-lock BLOCK: logged once"  "BLOCK"   "$(logged)"; rm -rf "$d"

    # AC-1: and so is an ALLOW reached after the lock.
    d=$(mk); seed "$d"
    ( cd "$d" && printf 'y\n' >> f.txt && printf 'entry\n' >> SESSION_JOURNAL.md ); reset_log
    r=$(fire "$d")
    ck "post-lock ALLOW: verdict"      0         "$r"
    ck "post-lock ALLOW: logged once"  "ALLOW"   "$(logged)"; rm -rf "$d"

    # AC-3: the lock is released on the BLOCKING path, not just the allowing one.
    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt ); reset_log
    fire "$d" >/dev/null
    ck "block path leaves no stale lock" "absent" \
       "$( [ -d "$d/.git/bes-session-S.lock" ] && echo present || echo absent )"; rm -rf "$d"

    # AC-4: with the logger unsourced the gate still gates and still unlocks.
    # CLAUDE_PROJECT_DIR points at a tree with no lib/, so the source fails.
    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt )
    nolib=$(mktemp -d)
    r=$( cd "$d" && printf '{"session_id":"S"}' \
         | CLAUDE_PROJECT_DIR="$nolib" bash "$HOOK" >/dev/null 2>&1; echo $? )
    ck "lib unsourced: still blocks"        2        "$r"
    ck "lib unsourced: still unlocks" "absent" \
       "$( [ -d "$d/.git/bes-session-S.lock" ] && echo present || echo absent )"
    rm -rf "$d" "$nolib"

    # AC-6: running THIS SUITE must not write into the configured project's log.
    # Re-runs the whole suite as a subprocess shaped exactly like a normal
    # Claude Code session — CLAUDE_PROJECT_DIR set to a decoy project tree that
    # carries a real lib, BES_LOG_FILE unset — and asserts nothing lands there.
    # Before the fix this injected 22 synthetic records into the production log.
    # BJS_SELFTEST_INNER stops the inner run from recursing on this same case.
    if [ "${2:-}" = "--inner" ]; then
        # Recursion stop, passed as an ARGUMENT rather than an environment
        # variable: an inherited env var would silently disable this case in
        # any session that happened to export it, and a check that can be
        # switched off from outside is not a check.
        :
    elif [ -f "$(dirname "$HOOK")/lib/log-decision.sh" ]; then
        decoy=$(mktemp -d); mkdir -p "$decoy/.claude/hooks/lib"
        cp "$(dirname "$HOOK")/lib/log-decision.sh" "$decoy/.claude/hooks/lib/"
        env -u BES_LOG_FILE CLAUDE_PROJECT_DIR="$decoy" \
            bash "$HOOK" --self-test --inner >/dev/null 2>&1
        inner_rc=$?
        # Assert the inner suite actually RAN and passed. Without this, an inner
        # crash leaves no decoy log and the emptiness assertion below passes for
        # entirely the wrong reason.
        ck "decoy inner suite passes" 0 "$inner_rc"
        ck "self-test leaves project log empty" "0" \
           "$( [ -f "$decoy/.claude/hooks/decisions.log" ] \
                && wc -l < "$decoy/.claude/hooks/decisions.log" | tr -d ' ' || echo 0 )"
        rm -rf "$decoy"
    else
        # ANNOUNCE the skip. A case that vanishes silently when run from an
        # unexpected location is the rot this suite exists to prevent: the
        # pass count drops by one and nothing says why.
        printf 'SKIP self-test leaves project log empty (no logger at %s)\n' \
            "$(dirname "$HOOK")/lib/log-decision.sh"
    fi

    printf '\n=== block-journal-skip self-test: %d pass / %d fail ===\n' "$P" "$F"
    [ "$F" -eq 0 ]; exit $?
fi

# --- gate -----------------------------------------------------------------
payload=$(cat 2>/dev/null || true)
sid=$(printf '%s' "$payload" | sed -n 's/.*"session_id"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)
[ -n "$sid" ] || allow ""

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || allow ""
m=$(marker_path "$sid") || allow ""
[ -n "$m" ] || allow ""

# SEED_ONLY is the SessionStart path: write the marker if absent, never gate.
if [ "${SEED_ONLY:-0}" = "1" ]; then
    [ -f "$m" ] || write_marker "$m"
    exit 0
fi

[ -r "$m" ] || allow ""
git symbolic-ref -q HEAD >/dev/null 2>&1 || allow "detached HEAD — journal gate skipped"

base_tree=$(sed -n 1p "$m"); base_len=$(sed -n 2p "$m"); base_sha=$(sed -n 3p "$m")
[ -n "$base_tree" ] || allow ""

now=$(tree_state)
[ -n "$now" ] || allow ""
[ "$now" = "$base_tree" ] && exit 0        # read-only session

BES_LOG_RULE="journal-not-written"
block() {
    printf 'block-journal-skip: the working tree changed this session but %s did not grow.\n' "$JOURNAL" >&2
    printf 'Append an entry (newest per the file'"'"'s own convention) describing what you did, what you\n' >&2
    printf 'touched, what you left dirty, and what the next agent should pick up. Template:\n' >&2
    printf '  .agents/templates/SESSION_JOURNAL.template.md\n' >&2
    printf 'This is the fleet'"'"'s only cross-session continuity record. Do not skip it.\n' >&2
    exit 2
}

if [ ! -f "$JOURNAL" ]; then
    [ "$base_len" = "0" ] && allow "no journal in this repo — gate skipped"
    block
fi

# A journal that exists but cannot be appended to would block every retry
# forever: the agent has no way to satisfy the gate. Fail open. (R2 BLOCKING-1.)
[ -w "$JOURNAL" ] || allow "$JOURNAL is not writable — gate skipped"

take_lock "$m" || allow ""                 # racing Stop holds it — fail open

cur_len=$(journal_len)
[ "$cur_len" -gt "$base_len" ] 2>/dev/null || block
[ "$(journal_sha "$base_len")" = "$base_sha" ] || block

write_marker "$m"                          # checkpoint: this append covers ONE stop
exit 0
