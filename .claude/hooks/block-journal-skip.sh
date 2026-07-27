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
take_lock() {
    lock_dir="$1.lock"
    mkdir "$lock_dir" 2>/dev/null || { lock_dir=""; return 1; }
    trap 'rm -rf "$lock_dir" 2>/dev/null' EXIT
    return 0
}

# --- self-test ------------------------------------------------------------
if [ "${1:-}" = "--self-test" ]; then
    P=0; F=0
    ck() { if [ "$2" = "$3" ]; then P=$((P+1)); printf 'PASS %s\n' "$1";
           else F=$((F+1)); printf 'FAIL %s (want %s got %s)\n' "$1" "$2" "$3"; fi; }
    HOOK="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)/$(basename -- "$0")"
    mk() {  # mk -> echoes a fresh repo dir with a journal + one commit
        d=$(mktemp -d); ( cd "$d"
          git init -q; git config user.email a@b; git config user.name a
          printf 'j\n' > SESSION_JOURNAL.md; printf 'x\n' > f.txt
          git add -A >/dev/null 2>&1; git commit -qm init ) ; printf '%s' "$d"; }
    fire() { ( cd "$1" && printf '{"session_id":"%s"}' "${2:-S}" | bash "$HOOK" >/dev/null 2>&1; echo $? ); }
    seed() { ( cd "$1" && printf '{"session_id":"%s"}' "${2:-S}" | SEED_ONLY=1 bash "$HOOK" >/dev/null 2>&1 ); }

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
