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

# --- content identity ------------------------------------------------------
# The prefix hash above tests a BYTE OFFSET, which is only a proxy for "the
# previous entries are still there". A date-ordered insertion — forced by any
# rebase that interleaves two sessions' entries — changes bytes inside the
# baseline prefix while genuinely ADDING content, and the proxy cannot tell
# that from a rewrite. Worse, block() never re-baselines, so once the bytes
# moved the prefix could never match again and the gate blocked every
# remaining Stop with no action available to satisfy it: the "false BLOCK that
# traps a session with no way out" this file's own header forbids.
# These helpers test the property directly instead.
# Authority: file://specs/2026-08-06-journal-gate-insertion-trap/SPEC.md §4.
entry_lines() { [ -f "$JOURNAL" ] && grep '^## ' "$JOURNAL" 2>/dev/null || true; }
# wc -l, not grep -c: under `set -o pipefail` a zero-match grep returns 1 and
# would make this helper report failure while printing a perfectly good "0".
entry_count() { entry_lines | wc -l | tr -d ' '; }

# Every baseline entry heading still present in the current journal? Presence,
# not multiplicity — duplicate headings are legal and irrelevant here.
entries_preserved() {  # entries_preserved <marker-path>
    local base cur missing
    # A scratch file we cannot create is an AMBIGUITY, not evidence of a
    # rewrite. Returning non-zero here would turn a transient /tmp failure into
    # a block, which is the exact class of false BLOCK the header forbids.
    base=$(mktemp) || return 0
    cur=$(mktemp) || { rm -f "$base"; return 0; }
    # LC_ALL=C throughout: `sort` and `comm` MUST agree on collation or comm
    # silently mis-reports set difference on locale-dependent orderings, which
    # would read as "an entry went missing" and block a clean session.
    tail -n +7 "$1" 2>/dev/null | LC_ALL=C sort -u > "$base"
    entry_lines | LC_ALL=C sort -u > "$cur"
    # Present in baseline but absent from current == an entry was removed.
    missing=$(LC_ALL=C comm -23 "$base" "$cur" 2>/dev/null | head -1)
    rm -f "$base" "$cur"
    [ -z "$missing" ]
}

# The state that produced a block, hashed. Two consecutive blocks with the
# same key mean the session did NOT move — the signature of a pinned baseline.
strike_key() { printf '%s|%s|%s' "$1" "$2" "$3" | sha256sum | cut -d' ' -f1; }

# Atomic, and NEVER fatal. A checkpoint that cannot be written must not make
# the gate exit non-zero: with an unwritable $GIT_DIR that would block every
# Stop forever with no escape. Write to a temp file and rename; swallow all
# failures. (R2 BLOCKING-2.)
#
# MARKER FORMAT v2. Lines 1-3 are byte-identical to v1, so a v2 reader parses
# a v1 marker with no special casing and a rollback needs no cleanup. An empty
# line 4 is the SOLE v1/v2 discriminator and routes to the fail-open branch.
#   1 tree_state   2 journal_len   3 journal_sha
#   4 entry_count  5 strikes       6 strike_key
#   7+ baseline '^## ' lines, verbatim
write_marker() {  # write_marker <path> [strikes] [strike_key]
    local tmp="$1.tmp.$$" len
    len=$(journal_len)
    { { printf '%s\n%s\n%s\n%s\n%s\n%s\n' \
            "$(tree_state)" "$len" "$(journal_sha "$len")" \
            "$(entry_count)" "${2:-0}" "${3:-}"
        entry_lines; } > "$tmp" \
        && mv -f "$tmp" "$1"; } 2>/dev/null || { rm -f "$tmp" 2>/dev/null; return 0; }
    return 0
}

# Record a strike WITHOUT re-baselining. Lines 1-4 and the entry block are the
# baseline and MUST survive: rewriting them here would checkpoint the very
# state that was just rejected, laundering a rewrite into the new baseline.
bump_strike() {  # bump_strike <path> <strikes> <key>
    local tmp="$1.tmp.$$"
    { { sed -n '1,4p' "$1"; printf '%s\n%s\n' "$2" "$3"; tail -n +7 "$1"; } > "$tmp" \
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

    # Writable but NOT readable: journal_len() collapses to 0, so every Stop hit
    # the no-growth branch, which by design accrues no strikes — so the
    # trap-breaker could not release it either. Measured 4/4 unclearable blocks
    # before the fix. Found by cross-family review (Rule 20), 2026-08-06.
    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt && chmod 0222 SESSION_JOURNAL.md )
    ck "unreadable journal fails open" 0 "$(fire "$d")"
    ( cd "$d" && chmod 0644 SESSION_JOURNAL.md ); rm -rf "$d"

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

    # --- content identity (SPEC 2026-08-06-journal-gate-insertion-trap) -------
    # mk()'s one-line journal has NO '## ' headings, so presence and count would
    # both be vacuous there. These cases need a journal shaped like a real one.
    mkj() {  # mkj -> repo whose journal carries three dated entries
        d=$(mktemp -d); ( cd "$d"
          git init -q; git config user.email a@b; git config user.name a
          printf '# Journal\n\n## 2026-08-01 one\nbody\n\n## 2026-08-02 two\nbody\n\n## 2026-08-04 four\nbody\n' \
              > SESSION_JOURNAL.md
          printf 'x\n' > f.txt
          git add -A >/dev/null 2>&1; git commit -qm init ) ; printf '%s' "$d"; }
    # A rebase resolution putting entries back in date order: the new heading
    # lands INSIDE the baseline prefix, which is the whole defect.
    insert_dated() {
        awk '/^## 2026-08-04 four/{print "## 2026-08-03 three"; print "body"; print ""} {print}' \
            "$1/SESSION_JOURNAL.md" > "$1/t" && mv "$1/t" "$1/SESSION_JOURNAL.md"; }
    # Growth WITHOUT preservation: drop an old heading, add two new entries.
    drop_and_grow() {
        grep -v '^## 2026-08-01 one' "$1/SESSION_JOURNAL.md" > "$1/t" \
            && mv "$1/t" "$1/SESSION_JOURNAL.md"
        printf '\n## 2026-08-06 six\nbody\n\n## 2026-08-07 seven\nbody\n' >> "$1/SESSION_JOURNAL.md"; }

    # AC-1: the reported defect. Bytes under the baseline move while entries are
    # genuinely added; the byte-prefix test called that "the journal did not grow".
    d=$(mkj); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt )
    insert_dated "$d"; printf '\n## 2026-08-06 six\nbody\n' >> "$d/SESSION_JOURNAL.md"
    ck "insertion in date order allows" 0 "$(fire "$d")"; rm -rf "$d"

    # AC-6: growth alone is not enough — count is a proxy, presence is the property.
    d=$(mkj); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt ); drop_and_grow "$d"
    ck "entry removed while growing BLOCKS" 2 "$(fire "$d")"; rm -rf "$d"

    # AC-7: a v1 marker carries no entry record, so a moved prefix is unresolvable.
    # Truncating to 3 lines reproduces a marker written before this change.
    d=$(mkj); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt ); insert_dated "$d"
    ( cd "$d" && sed -n '1,3p' .git/bes-session-S > t && mv t .git/bes-session-S )
    ck "legacy marker fails open" 0 "$(fire "$d")"; rm -rf "$d"

    # AC-8: the trap-breaker. Three identical content-fallback blocks release
    # rather than pin the session forever.
    d=$(mkj); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt ); drop_and_grow "$d"
    r1=$(fire "$d"); r2=$(fire "$d"); r3=$(fire "$d")
    ck "trap-breaker: first strike blocks"     2 "$r1"
    ck "trap-breaker: second strike blocks"    2 "$r2"
    ck "trap-breaker releases on third strike" 0 "$r3"; rm -rf "$d"

    # AC-9: the no-growth branch must NEVER trap-break. If it did, an agent could
    # escape the gate by Stopping three times having written nothing at all.
    d=$(mk); seed "$d"; ( cd "$d" && printf 'y\n' >> f.txt )
    ck "no-growth never trap-breaks" "2 2 2 2" \
       "$(fire "$d") $(fire "$d") $(fire "$d") $(fire "$d")"; rm -rf "$d"

    # A blocked Stop MUST NOT checkpoint. Re-baselining on the rejected state
    # would launder the rewrite it just refused into the new baseline.
    d=$(mkj); seed "$d"
    before=$( cd "$d" && sed -n '1,4p' .git/bes-session-S | sha256sum )
    ( cd "$d" && printf 'y\n' >> f.txt ); drop_and_grow "$d"
    fire "$d" >/dev/null
    after=$( cd "$d" && sed -n '1,4p' .git/bes-session-S | sha256sum )
    ck "strike does not re-baseline" "$before" "$after"; rm -rf "$d"

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
base_count=$(sed -n 4p "$m"); base_strikes=$(sed -n 5p "$m"); base_key=$(sed -n 6p "$m")
[ -n "$base_tree" ] || allow ""

now=$(tree_state)
[ -n "$now" ] || allow ""
[ "$now" = "$base_tree" ] && exit 0        # read-only session

BES_LOG_RULE="journal-not-written"
# The remediation printed MUST be one the agent can actually perform. The
# original single message told every blocked agent to "append an entry" — which
# was provably useless in the entries-lost case, where appending cannot clear
# the block. An instruction that cannot succeed is worse than none.
block() {  # block [no-growth|entries-lost]
    case "${1:-no-growth}" in
        entries-lost)
            printf 'block-journal-skip: %s changed without preserving the previous entries.\n' "$JOURNAL" >&2
            printf 'Entries present at session start are missing from the file now, or no new entry\n' >&2
            printf 'was added. Restore the missing entries and append yours; do not rewrite the\n' >&2
            printf 'record. If a rebase reordered the file, keep every heading that was there.\n' >&2
            ;;
        *)
            printf 'block-journal-skip: the working tree changed this session but %s did not grow.\n' "$JOURNAL" >&2
            printf 'Append an entry (newest per the file'"'"'s own convention) describing what you did, what you\n' >&2
            printf 'touched, what you left dirty, and what the next agent should pick up. Template:\n' >&2
            printf '  .agents/templates/SESSION_JOURNAL.template.md\n' >&2
            ;;
    esac
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

# The same class, one permission bit over. Found by cross-family review
# 2026-08-06 and reproduced at 4/4 blocks: a journal that is WRITABLE but not
# READABLE makes journal_len() collapse to 0, so every Stop takes the no-growth
# branch — and that branch deliberately accrues no strikes, so the trap-breaker
# never releases it either. Appending cannot help, because the length can never
# be read back. Unreadable must fail open for exactly the reason unwritable does.
[ -r "$JOURNAL" ] || allow "$JOURNAL is not readable — gate skipped"

take_lock "$m" || allow ""                 # racing Stop holds it — fail open

cur_len=$(journal_len)

# 1. No growth at all. UNAMBIGUOUS and always satisfiable: appending increases
#    length, and an unwritable journal already failed open above. No strike
#    accrues here — a trap-breaker on this branch would let an agent escape the
#    gate by Stopping three times having written nothing.
[ "$cur_len" -gt "$base_len" ] 2>/dev/null || block no-growth

cur_prefix=$(journal_sha "$base_len")

# 2. Append-only fast path: every byte under the baseline is untouched.
if [ "$cur_prefix" = "$base_sha" ]; then
    write_marker "$m"                      # checkpoint: this append covers ONE stop
    exit 0
fi

# 3. A v1 marker carries no entry record to test against, so the prefix move
#    is unresolvable. Every ambiguity takes the exit-0 branch (header contract).
[ -n "$base_count" ] || allow "marker predates the entry record — prefix moved, gate skipped"

# 4. The prefix moved. Ask what the prefix hash was only ever proxying for:
#    are the previous entries still present, and did the record grow?
if [ "$(entry_count)" -gt "$base_count" ] 2>/dev/null && entries_preserved "$m"; then
    write_marker "$m"
    exit 0
fi

# 5. Content-fallback block. This is the ONLY branch that can pin a baseline no
#    append can satisfy, so it is the only one that accrues strikes. Three
#    identical blocks means the session cannot move the gate: release loudly and
#    re-baseline rather than trap it. Fail-open by construction, made structural.
key=$(strike_key "$now" "$cur_len" "$cur_prefix")
if [ "$key" = "$base_key" ]; then strikes=$(( ${base_strikes:-0} + 1 )); else strikes=1; fi

if [ "$strikes" -ge 3 ]; then
    write_marker "$m"
    allow "RELEASED after ${strikes} identical blocks — no append could satisfy this baseline, which is a gate defect rather than a missing entry. Marker re-baselined; please report this."
fi

bump_strike "$m" "$strikes" "$key"
block entries-lost
