#!/usr/bin/env bash
# Hook test harness. Exits 0 if all pass, 1 on failure.
# Each test feeds a synthesized PreToolUse(Bash) JSON to the hook and asserts
# the exit code and stderr.

set -u
HOOK_DIR="$(dirname "$(readlink -f "$0")")/.."

# ---- fixture teardown: declared ONCE, before anything is created ----
# The suite used to replace its EXIT trap six times, and every replacement
# omitted fixtures created earlier, so an early exit leaked them (measured:
# 3 dirs per run). One trap now owns teardown for every fixture.
#
# These are set to the EMPTY STRING deliberately — never `${VAR-}`. That form
# would inherit a same-named exported variable from the caller's environment
# and hand a caller-owned path to `rm -rf` on exit. Cross-family review
# 2026-07-24 caught exactly that. This block therefore also has to sit ABOVE
# every real assignment, so nothing it declares can clobber a live fixture.
BES_LOG_DIR=""
SANDBOX=""
PUSH_MAIN_DIRECT=""
MAIN_NO_SPEC=""
MAIN_WITH_SPEC=""
MAIN_WITH_DECOMPOSED=""
VR_ACTIVE=""
PROBE_CLEAN=""
PROBE_DIRTY=""
PROBE_EXCL=""
PROBE_DOCS=""
PROBE_UNTRACKED=""
PROBE_HOOKFILE=""
STALE_SRC=""
STALE_SRC_CLEAN=""
STALE_SRC_STRAY=""
STALE_CHILD=""
STALE_CHILD_STRAY=""
STALE_OSS=""
RANK_FIX=""
RANK_TIE=""
SUBR_FIX=""
PUSH_MAIN=""
PUSH_FEAT=""
SWEEP_MIXED=""
SWEEP_FLEET=""
SWEEP_PROD=""
SWEEP_MOD=""
SWEEP_CLEAN=""
SWEEP_SPECS=""
SWEEP_SOURCE=""
SWEEP_FLEETHEAD=""
SWEEP_GHOOKS=""
LOGTEST=""
SUBR_ERRF=""
bes_cleanup_fixtures() { rm -rf "$BES_LOG_DIR" "$SANDBOX" "$PUSH_MAIN_DIRECT" "$MAIN_NO_SPEC" "$MAIN_WITH_SPEC" "$MAIN_WITH_DECOMPOSED" "$VR_ACTIVE" "$PROBE_CLEAN" "$PROBE_DIRTY" "$PROBE_EXCL" "$PROBE_DOCS" "$PROBE_UNTRACKED" "$PROBE_HOOKFILE" "$STALE_SRC" "$STALE_SRC_CLEAN" "$STALE_SRC_STRAY" "$STALE_CHILD" "$STALE_CHILD_STRAY" "$STALE_OSS" "$RANK_FIX" "$RANK_TIE" "$SUBR_FIX" "$PUSH_MAIN" "$PUSH_FEAT" "$SWEEP_MIXED" "$SWEEP_FLEET" "$SWEEP_PROD" "$SWEEP_MOD" "$SWEEP_CLEAN" "$SWEEP_SPECS" "$SWEEP_SOURCE" "$SWEEP_FLEETHEAD" "$SWEEP_GHOOKS" "$LOGTEST" "$SUBR_ERRF"; }
trap bes_cleanup_fixtures EXIT

# Keep the suite OUT of the live decision log. Hooks now record every
# invocation (specs/2026-07-24-hook-decision-instrumentation); without this,
# each test run would inflate the very measurement the log exists to provide.
BES_LOG_DIR="$(mktemp -d)"
BES_LOG_FILE="$BES_LOG_DIR/suite-decisions.log"
export BES_LOG_FILE
PASS=0; FAIL=0; FAILURES=()

run() {
    local name="$1" hook="$2" expected_exit="$3" cmd_json="$4" cwd="${5:-}"
    local actual stderr
    local -a hook_cmd
    if [ "$hook" = "block-stale-derived-artifacts.sh" ]; then
        hook_cmd=(bash "$HOOK_DIR/$hook")
    else
        hook_cmd=("$HOOK_DIR/$hook")
    fi
    if [ -n "$cwd" ]; then
        stderr=$(cd "$cwd" && printf '%s' "$cmd_json" | "${hook_cmd[@]}" 2>&1 >/dev/null)
    else
        stderr=$(printf '%s' "$cmd_json" | "${hook_cmd[@]}" 2>&1 >/dev/null)
    fi
    actual=$?
    if [ "$actual" = "$expected_exit" ]; then
        PASS=$((PASS+1))
        printf 'PASS %-50s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit, got $actual; stderr=$stderr")
        printf 'FAIL %-50s [%s]: expected %s got %s\n' "$name" "$hook" "$expected_exit" "$actual"
    fi
}

# Sandbox dir for push-to-main "should block" tests: a non-git directory so
# block-push-to-main.sh's SPEC walk finds no main-direct SPEC and falls
# through to the block. Without this, tests run from inside bes-fleet-policy
# would now exit 0 (main-direct policy honoured) instead of 2.
SANDBOX="$(mktemp -d)"

J() {
    # Wrap a shell command into the JSON envelope Claude Code passes to PreToolUse(Bash).
    local cmd="$1"
    printf '{"tool_input":{"command":%s}}' "$(printf '%s' "$cmd" | jq -Rs .)"
}

# --- block-push-to-main.sh ---
# "Should block" tests run from $SANDBOX (a non-git tmpdir) so the SPEC walk
# finds no main-direct policy and falls through to the block.
run "real push to main blocked"             block-push-to-main.sh   2 "$(J 'git push origin main')" "$SANDBOX"
run "real push to feature branch allowed"   block-push-to-main.sh   0 "$(J 'git push origin feature/x')"
run "real push -u origin main blocked"      block-push-to-main.sh   2 "$(J 'git push -u origin main')" "$SANDBOX"
run "real push to main-rework allowed"      block-push-to-main.sh   0 "$(J 'git push origin feature/main-rework')"
run "no push (commit only) allowed"         block-push-to-main.sh   0 "$(J 'git commit -m "fix bug"')"
run "commit message contains git push txt"  block-push-to-main.sh   0 "$(J 'git commit -m "describe what git push to main does in this hook"')"
run "heredoc body mentioning git push"      block-push-to-main.sh   0 "$(J $'cat > /tmp/msg <<EOF\nrefuses git push to main\nEOF\ngit commit -F /tmp/msg')"
run "chain: cd && git push origin main"     block-push-to-main.sh   2 "$(J 'cd /repo && git push origin main')" "$SANDBOX"
# main-direct policy: when an approved/in-execution/verified/closed SPEC
# declares branch_policy: main-direct, push to main is allowed.
#
# These two cases used to run from "$HOOK_DIR/../.." — i.e. whatever repo the
# harness happens to live in — on the assumption it "declares main-direct on
# its inaugural SPEC". That holds in bes-fleet-policy and NOT in most child
# repos, so the propagated harness failed 2/N in every child without such a
# SPEC (verified against TimeStrats at origin/main, before any 2026-07-24
# change). Now hermetic: a purpose-built fixture, so the suite means the same
# thing in all 12 fleet locations.
PUSH_MAIN_DIRECT="$(mktemp -d)"
( cd "$PUSH_MAIN_DIRECT" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && mkdir -p specs/fixture \
    && printf -- '---\nid: fixture\ntype: contract\nstatus: closed\nbranch_policy: main-direct\n---\n' > specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t add specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t commit -q -m init )

run "main-direct SPEC allows push to main"  block-push-to-main.sh   0 "$(J 'git push origin main')" "$PUSH_MAIN_DIRECT"
run "main-direct SPEC allows push -u main"  block-push-to-main.sh   0 "$(J 'git push -u origin main')" "$PUSH_MAIN_DIRECT"

# --- block-git-add-all.sh ---
run "real git add . blocked"                block-git-add-all.sh    2 "$(J 'git add .')"
run "real git add -A blocked"               block-git-add-all.sh    2 "$(J 'git add -A')"
run "git add --all blocked"                 block-git-add-all.sh    2 "$(J 'git add --all')"
run "git add filename allowed"              block-git-add-all.sh    0 "$(J 'git add foo.txt')"
run "msg mentions git add . allowed"        block-git-add-all.sh    0 "$(J 'git commit -m "stop using git add ."')"
run "heredoc with git add ."                block-git-add-all.sh    0 "$(J $'cat > /tmp/msg <<EOF\ngit add . is banned\nEOF')"

# --- block-verify-bypass.sh ---
run "real --no-verify on commit blocked"    block-verify-bypass.sh  2 "$(J 'git commit --no-verify -m "x"')"
run "real --no-gpg-sign on push blocked"    block-verify-bypass.sh  2 "$(J 'git push --no-gpg-sign')"
run "git log --no-merges allowed"           block-verify-bypass.sh  0 "$(J 'git log --no-merges')"
run "msg mentions --no-verify"              block-verify-bypass.sh  0 "$(J 'git commit -m "this hook blocks --no-verify"')"
run "heredoc body with --no-verify"         block-verify-bypass.sh  0 "$(J $'cat > /tmp/msg <<EOF\nrefuses --no-verify\nEOF\ngit commit -F /tmp/msg')"

# --- block-ai-attribution.sh ---
run "commit -m with Co-Authored-By blocked" block-ai-attribution.sh 2 "$(J 'git commit -m "fix\n\nCo-Authored-By: Claude <x>"')"
run "commit -m clean allowed"               block-ai-attribution.sh 0 "$(J 'git commit -m "clean message"')"
run "commit -F file with co-author blocked" block-ai-attribution.sh 2 "$(J "git commit -F $HOOK_DIR/tests/fixtures/msg-with-coauthor.txt")"
run "commit -F file clean allowed"          block-ai-attribution.sh 0 "$(J "git commit -F $HOOK_DIR/tests/fixtures/msg-clean.txt")"
run "non-commit (push) allowed"             block-ai-attribution.sh 0 "$(J 'git push origin feature/x')"
run "git -C form commit with co-author blocked" block-ai-attribution.sh 2 "$(J 'git -C /tmp commit -m "fix\n\nCo-Authored-By: Claude <x>"')"
run "git -C with relative -F co-author blocked" block-ai-attribution.sh 2 "$(J "git -C $HOOK_DIR/tests commit -F fixtures/msg-with-coauthor.txt")"
run "git -C with QUOTED relative -F blocked"    block-ai-attribution.sh 2 "$(J "git -C $HOOK_DIR/tests commit -F \"fixtures/msg-with-coauthor.txt\"")"
run "git -c form --no-verify blocked"       block-verify-bypass.sh  2 "$(J 'git -c user.name=t commit --no-verify -m "x"')"

# --- block-edit-on-main.sh ---
# This hook reads cwd's git branch. To exercise the block path we need a real
# git repo on main with no main-direct SPEC; to exercise the allow paths we
# need either a non-git dir (branch == "") or a git repo on main carrying a
# main-direct SPEC. Set up two fixture repos.

MAIN_NO_SPEC="$(mktemp -d)"
# Carry a TRACKED file (tracked.md) and a TRACKED subdir file (sub/nested.md)
# so the path-scope block path has real targets to gate; foo.md / scratch.md
# stay untracked to exercise the allow paths.
( cd "$MAIN_NO_SPEC" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && mkdir -p sub \
    && printf 'x\n' > tracked.md \
    && printf 'y\n' > sub/nested.md \
    && printf 'g\n' > 'weird[1].md' \
    && ln -s /tmp/bes-external-symlink-target tracked-link \
    && git -c user.email=t@t -c user.name=t add -- tracked.md sub/nested.md tracked-link ':(literal)weird[1].md' \
    && git -c user.email=t@t -c user.name=t commit -q -m init \
    && ln tracked.md alias.md \
    && printf 'z\n' > untracked.md )

MAIN_WITH_SPEC="$(mktemp -d)"
( cd "$MAIN_WITH_SPEC" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && mkdir -p specs/fixture \
    && printf -- '---\nid: fixture\ntype: contract\nstatus: closed\nbranch_policy: main-direct\n---\n' > specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t add specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t commit -q -m init )

# Fixture: a repo whose ONLY main-direct SPEC is at `decomposed` (owner-set,
# between approved and in-execution). Proves the branch-policy hooks allow
# main-direct work during the decomposition window (2026-07-10 hygiene sweep).
MAIN_WITH_DECOMPOSED="$(mktemp -d)"
( cd "$MAIN_WITH_DECOMPOSED" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && mkdir -p specs/fixture \
    && printf -- '---\nid: fixture\ntype: task\nstatus: decomposed\nbranch_policy: main-direct\n---\n' > specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t add specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t commit -q -m init )

# Fixture: a repo with an in-execution SPEC, for verify-reminder's active-spec
# branch (verify-reminder scans specs/ for approved|in-execution).
VR_ACTIVE="$(mktemp -d)"
( cd "$VR_ACTIVE" && mkdir -p specs/fixture \
    && printf -- '---\nid: fixture\nstatus: in-execution\n---\n' > specs/fixture/SPEC.md )


JE() {
    # Edit tool envelope. block-edit-on-main.sh reads tool_input.file_path
    # from stdin to path-scope the block to repo-tracked targets.
    printf '{"tool_input":{"file_path":"%s"}}' "$1"
}

# main-direct allow-path (unchanged): a main-direct SPEC allows every edit on
# main regardless of whether the target is tracked.
run "edit on main allowed (main-direct SPEC)"      block-edit-on-main.sh   0 "$(JE 'foo.md')" "$MAIN_WITH_SPEC"
# Was: cwd "$HOOK_DIR/../.." with a TRACKED file, which only asserts anything
# in a repo that both is main-direct and tracks STATUS.md — ambient, and in a
# child it can pass vacuously because the path is simply untracked. Reuses the
# hermetic main-direct fixture and a path that IS tracked there.
run "edit on main allowed, tracked path (main-direct)" block-edit-on-main.sh 0 "$(JE 'specs/fixture/SPEC.md')" "$MAIN_WITH_SPEC"
run "edit in non-git dir allowed (branch empty)"   block-edit-on-main.sh   0 "$(JE 'foo.md')" "$SANDBOX"
# decomposed is an owner-set main-direct-eligible status (schema §1.3).
run "edit on main allowed (decomposed main-direct)" block-edit-on-main.sh  0 "$(JE 'foo.md')" "$MAIN_WITH_DECOMPOSED"
run "push to main allowed (decomposed main-direct)" block-push-to-main.sh  0 "$(J 'git push origin main')" "$MAIN_WITH_DECOMPOSED"
# verify-reminder.sh (Stop hook: always exit 0; exercise both branches).
run "verify-reminder default branch (no active spec)"  verify-reminder.sh  0 '{"hook_event_name":"Stop"}' "$SANDBOX"
run "verify-reminder active-spec branch (in-execution)" verify-reminder.sh 0 '{"hook_event_name":"Stop"}' "$VR_ACTIVE"

# Path-scope (Decision §7 dimension 2): on the protected branch with no
# main-direct SPEC, only repo-TRACKED targets are gated; out-of-repo and
# untracked targets are allowed; an indeterminate target FAILS CLOSED.
run "edit tracked relative path gated"             block-edit-on-main.sh   2 "$(JE 'tracked.md')" "$MAIN_NO_SPEC"
run "edit tracked absolute path gated"             block-edit-on-main.sh   2 "$(JE "$MAIN_NO_SPEC/tracked.md")" "$MAIN_NO_SPEC"
run "edit tracked subdir path gated"               block-edit-on-main.sh   2 "$(JE 'sub/nested.md')" "$MAIN_NO_SPEC"
run "edit out-of-repo /tmp path allowed"           block-edit-on-main.sh   0 "$(JE '/tmp/bes-scratch.md')" "$MAIN_NO_SPEC"
run "edit untracked in-repo path allowed"          block-edit-on-main.sh   0 "$(JE 'untracked.md')" "$MAIN_NO_SPEC"
run "edit new (uncreated) in-repo path allowed"    block-edit-on-main.sh   0 "$(JE 'brand-new.md')" "$MAIN_NO_SPEC"
run "edit missing file_path fails closed"          block-edit-on-main.sh   2 '{"tool_input":{}}' "$MAIN_NO_SPEC"
run "edit malformed payload fails closed"          block-edit-on-main.sh   2 'this is not json' "$MAIN_NO_SPEC"
# Cross-family review catches (2026-06-20): a TRACKED symlink to an
# out-of-repo target must NOT be misclassified as out-of-repo and allowed;
# and a malformed payload that merely CONTAINS a "file_path":"..." substring
# pointing out-of-repo must fail closed, not be trusted by a fragile parse.
run "edit tracked symlink (to out-of-repo) gated"  block-edit-on-main.sh   2 "$(JE 'tracked-link')" "$MAIN_NO_SPEC"
run "edit malformed payload w/ file_path substring fails closed" block-edit-on-main.sh 2 'garbage "file_path":"/tmp/x" garbage' "$MAIN_NO_SPEC"
# Review r2 catch: a VALID json prefix + trailing garbage makes jq emit a value
# AND exit nonzero; gating on jq's exit status must fail closed, not keep it.
run "edit valid-prefix + trailing garbage fails closed" block-edit-on-main.sh 2 '{"tool_input":{"file_path":"/tmp/x"}} trailing' "$MAIN_NO_SPEC"
# Review r3 catches: multiple concatenated JSON texts must fail closed (not yield
# a multi-value pseudo-path hiding a tracked target); and a tracked filename
# with pathspec glob metacharacters must be matched literally, not as a glob.
run "edit multi-JSON-stream payload fails closed"  block-edit-on-main.sh   2 '{"tool_input":{"file_path":"tracked.md"}} {"tool_input":{"file_path":"/tmp/x"}}' "$MAIN_NO_SPEC"
run "edit tracked glob-metachar filename gated"    block-edit-on-main.sh   2 "$(JE 'weird[1].md')" "$MAIN_NO_SPEC"
# Review r4 catch: a path with a control char (e.g. trailing newline) is stripped
# by shell command substitution; reject control chars at the jq source -> closed.
run "edit control-char (newline) in path fails closed" block-edit-on-main.sh 2 '{"tool_input":{"file_path":"tracked\n"}}' "$MAIN_NO_SPEC"
# Review r5 catch: a hardlink (or case-fold / Unicode-normalization) alias to a
# tracked file resolves to the same inode; git ls-files misses it by pathname.
# alias.md is an untracked hardlink to tracked tracked.md -> must be gated.
# (Case-fold/Unicode aliases share this -ef code path; not reproducible on a
# case-sensitive Linux fixture, so the hardlink case exercises the mechanism.)
run "edit hardlink alias of tracked file gated"    block-edit-on-main.sh   2 "$(JE 'alias.md')" "$MAIN_NO_SPEC"

# --- session-start-context.sh — SessionStart hook; emits stdout
#     (per https://code.claude.com/docs/en/hooks SessionStart stdout
#     IS injected into Claude's context, unlike PreCompact and Stop
#     stdout which go to debug log only) ---
run_stdout() {
    # Variant: assert stdout contains a substring AND exit code matches.
    # Optional 6th arg: cwd to run the hook from (fixture repos).
    local name="$1" hook="$2" expected_exit="$3" expected_substr="$4" cmd_json="$5" cwd="${6:-}"
    local actual stdout
    if [ -n "$cwd" ]; then
        stdout=$(cd "$cwd" && printf '%s' "$cmd_json" | "$HOOK_DIR/$hook" 2>/dev/null)
    else
        stdout=$(printf '%s' "$cmd_json" | "$HOOK_DIR/$hook" 2>/dev/null)
    fi
    actual=$?
    if [ "$actual" = "$expected_exit" ] && printf '%s' "$stdout" | grep -qF "$expected_substr"; then
        PASS=$((PASS+1))
        printf 'PASS %-50s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit + stdout containing '$expected_substr'; got exit $actual")
        printf 'FAIL %-50s [%s]\n' "$name" "$hook"
    fi
}

# --- block-undeclared-deps.sh ---
# These tests need a transient SPEC fixture with the expected
# front-matter. Build one in $SANDBOX/specs/active/SPEC.md and
# point the helper at it via ACTIVE_SPEC_DIR.
mkdir -p "$SANDBOX/specs/active"
cat > "$SANDBOX/specs/active/SPEC.md" <<'EOF_DEPSPEC'
---
id: test-active
status: in-execution
type: contract
owner: test
deps_added: [allowed-pkg]
---
# fixture
EOF_DEPSPEC

# Hook invocation needs CLAUDE_PROJECT_DIR + helper to point at
# the source repo. Run with ACTIVE_SPEC_DIR override so the
# helper uses the fixture.
export CLAUDE_PROJECT_DIR="$HOOK_DIR/../.."
export ACTIVE_SPEC_DIR="$SANDBOX/specs/active"
run "undeclared npm install blocked"        block-undeclared-deps.sh 2 "$(J 'npm install not-declared')"
run "declared npm install allowed"          block-undeclared-deps.sh 0 "$(J 'npm install allowed-pkg')"
run "non-manifest bash allowed"             block-undeclared-deps.sh 0 "$(J 'git status')"
run "undeclared pip install blocked"        block-undeclared-deps.sh 2 "$(J 'pip install ghost-pkg')"
run "cargo build manifest-path allowed"     block-undeclared-deps.sh 0 "$(J 'cargo build --manifest-path spike/Cargo.toml')"
# S5 regression: READ commands naming a manifest are not edits. A grep over
# package.json in a throwaway clone was hard-blocked 2026-08-05.
run "grep over a manifest allowed"          block-undeclared-deps.sh 0 "$(J 'grep version package.json')"
run "cat of a manifest allowed"             block-undeclared-deps.sh 0 "$(J 'cat package.json')"
run "git show of a manifest allowed"        block-undeclared-deps.sh 0 "$(J 'git show HEAD:package.json')"
run "read then install still blocked"       block-undeclared-deps.sh 2 "$(J 'grep x package.json && npm install ghost')"
# ...but a REDIRECTION into one is still the edit it looks like. Detection is
# what the READ_CMD_REGEX change could have broken, and detection only shows as
# a block when NO active SPEC authorises manifest work — so point the resolver
# at an empty dir for these two, then restore the fixture.
mkdir -p "$SANDBOX/specs/none"
export ACTIVE_SPEC_DIR="$SANDBOX/specs/none"
run "redirect into a manifest blocked"      block-undeclared-deps.sh 2 "$(J 'cat > package.json')"
run "jq redirect into a manifest blocked"   block-undeclared-deps.sh 2 "$(J 'jq . x.json > package.json')"
run "pure read still allowed, no SPEC"      block-undeclared-deps.sh 0 "$(J 'grep version package.json')"
# Cross-family reviewer finding 1: a read span must not swallow a command
# substitution carrying a real edit.
run "read span cannot hide \$() edit"        block-undeclared-deps.sh 2 "$(J 'cat package.json $(sed -i s/foo/bar/ package.json)')"
run "read span cannot hide backtick edit"    block-undeclared-deps.sh 2 "$(J 'cat package.json `sed -i s/a/b/ package.json`')"
export ACTIVE_SPEC_DIR="$SANDBOX/specs/active"
unset CLAUDE_PROJECT_DIR
unset ACTIVE_SPEC_DIR

# --- block-bad-cli-invocation.sh ---
# Helper resolution requires CLAUDE_PROJECT_DIR to point at the
# fleet-policy root so the helper + known-good are found.
export CLAUDE_PROJECT_DIR="$HOOK_DIR/../.."
run "claude --print prompt allowed"                 block-bad-cli-invocation.sh 0 "$(J 'claude --print "p"')"
# S5 regression: copilot admin subcommands and --help anywhere in the span are
# metadata queries, not sessions. `copilot skill --help` was blocked 2026-08-05.
run "copilot skill --help allowed"                  block-bad-cli-invocation.sh 0 "$(J 'copilot skill --help')"
run "copilot skill list allowed"                    block-bad-cli-invocation.sh 0 "$(J 'copilot skill list')"
run "copilot prompt-less session still blocked"     block-bad-cli-invocation.sh 2 "$(J 'copilot --model gpt-5.6-sol')"
# Cross-family reviewer finding 2: --help must be read from argv, never from
# quoted PROMPT TEXT. Matching the raw span let a non-GPT model skip the
# family check entirely.
run "quoted --help does not exempt a session"      block-bad-cli-invocation.sh 2 "$(J 'gh copilot -- --model claude-opus-5 -p \"review --help please\" --allow-all')"
run "claude --bogus blocked"                        block-bad-cli-invocation.sh 2 "$(J 'claude --bogus "p"')"
run "claude --output-format without --print blocked" block-bad-cli-invocation.sh 2 "$(J 'claude --output-format json "p"')"
run "claude --version is admin-allowed"             block-bad-cli-invocation.sh 0 "$(J 'claude --version')"
run "claude mcp list is admin-allowed"              block-bad-cli-invocation.sh 0 "$(J 'claude mcp list')"
run "claude doctor is admin-allowed"                block-bad-cli-invocation.sh 0 "$(J 'claude doctor')"
# copilot lane cases per specs/2026-06-05-copilot-cli-cross-validation-lane
run "copilot well-formed review span allowed"       block-bad-cli-invocation.sh 0 "$(J 'copilot -p "review the diff" --model gpt-5.6-sol -s --no-custom-instructions --disable-builtin-mcps --deny-tool write --deny-tool shell < /dev/null')"
run "gh copilot well-formed review span allowed"    block-bad-cli-invocation.sh 0 "$(J 'gh copilot -- -p "review the diff" --model gpt-5.6-sol -s --no-custom-instructions --disable-builtin-mcps --deny-tool write --deny-tool shell --deny-tool url < /dev/null')"
run "copilot --model auto blocked"                  block-bad-cli-invocation.sh 2 "$(J 'gh copilot -- -p "p" --model auto')"

run_settings_present() {
    local name="$1" matcher="$2"
    local settings="$HOOK_DIR/../settings.json"
    local expected_cmd='${CLAUDE_PROJECT_DIR}/.claude/hooks/block-bad-cli-invocation.sh'
    local count
    count="$(jq -r --arg matcher "$matcher" --arg cmd "$expected_cmd" '[.hooks.PreToolUse[]?.hooks[]? | select(.if == $matcher and .command == $cmd)] | length' "$settings")"
    if [ "$count" -ge 1 ]; then
        PASS=$((PASS+1))
        printf 'PASS %-50s [settings.json]\n' "$name"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [settings.json]: expected matcher $matcher to route to block-bad-cli-invocation.sh")
        printf 'FAIL %-50s [settings.json]\n' "$name"
    fi
}

run_settings_absent() {
    local name="$1" matcher="$2"
    local settings="$HOOK_DIR/../settings.json"
    local count
    count="$(jq -r --arg matcher "$matcher" '[.hooks.PreToolUse[]?.hooks[]? | select(.if == $matcher)] | length' "$settings")"
    if [ "$count" -eq 0 ]; then
        PASS=$((PASS+1))
        printf 'PASS %-50s [settings.json]\n' "$name"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [settings.json]: expected matcher $matcher to be absent")
        printf 'FAIL %-50s [settings.json]\n' "$name"
    fi
}

# block-bad-cli-invocation.sh is wired UN-GATED on the Bash matcher (no `if`):
# it self-classifies (greps for claude/copilot, fail-opens otherwise) and must
# see wrapped invocations (timeout/env/VAR=val prefixes) a name-prefixed matcher
# would miss (prefilter breadth >= classifier breadth; 2026-07-10 hygiene sweep).
# block-undeclared-deps.sh stays GATED on package-manager prefixes — un-gating it
# false-positived on manifest strings in quoted Bash args (reverted after review).
assert_ungated_bash() {
    local name="$1" hook_suffix="$2"
    local settings="$HOOK_DIR/../settings.json"
    local count
    count="$(jq -r --arg suf "$hook_suffix" '[.hooks.PreToolUse[]? | select(.matcher=="Bash") | .hooks[]? | select((.command | endswith($suf)) and (has("if") | not))] | length' "$settings")"
    if [ "$count" -ge 1 ]; then
        PASS=$((PASS+1)); printf 'PASS %-50s [settings.json]\n' "$name"
    else
        FAIL=$((FAIL+1)); FAILURES+=("$name [settings.json]: expected $hook_suffix wired un-gated (no if) on Bash matcher"); printf 'FAIL %-50s [settings.json]\n' "$name"
    fi
}
assert_gated_bash() {
    local name="$1" hook_suffix="$2" matcher="$3"
    local settings="$HOOK_DIR/../settings.json"
    local count
    count="$(jq -r --arg suf "$hook_suffix" --arg m "$matcher" '[.hooks.PreToolUse[]? | select(.matcher=="Bash") | .hooks[]? | select((.command | endswith($suf)) and (.if == $m))] | length' "$settings")"
    if [ "$count" -ge 1 ]; then
        PASS=$((PASS+1)); printf 'PASS %-50s [settings.json]\n' "$name"
    else
        FAIL=$((FAIL+1)); FAILURES+=("$name [settings.json]: expected $hook_suffix gated by $matcher"); printf 'FAIL %-50s [settings.json]\n' "$name"
    fi
}
assert_ungated_bash "bad-cli-invocation wired un-gated on Bash" "block-bad-cli-invocation.sh"
# undeclared-deps stays GATED on package-manager prefixes (un-gating it
# false-positived on manifest strings in quoted args — 2026-07-10 review).
assert_gated_bash "undeclared-deps gated on Bash(npm *)" "block-undeclared-deps.sh" "Bash(npm *)"
retired_matcher="$(printf 'Bash(co%s *)' 'dex')"
run_settings_absent "settings removed retired CLI matcher" "$retired_matcher"
unset CLAUDE_PROJECT_DIR

run_stdout "session-start emits Session-init context header" \
    session-start-context.sh 0 "Session-init context" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits repo + branch line" \
    session-start-context.sh 0 "Repo:" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits Recent commits section" \
    session-start-context.sh 0 "Recent commits" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits grounding-norm reminder" \
    session-start-context.sh 0 "research it from primary sources" \
    '{"hook_event_name":"SessionStart"}'

# --- block-probe-residue.sh ---
# Tree-state gate: blocks `git commit` while the working tree carries
# the mutation-probe marker in swept code surfaces. Fixture repos per
# specs/2026-06-09-mutation-probe-isolation-discipline/SPEC.md §11.
MARKER='MUTATION PROBE'
PROBE_CLEAN="$(mktemp -d)"
( cd "$PROBE_CLEAN" && git init -q && mkdir src && printf 'fn ok() {}\n' > src/code.rs \
    && git -c user.email=t@t -c user.name=t add src/code.rs \
    && git -c user.email=t@t -c user.name=t commit -q -m init )
PROBE_DIRTY="$(mktemp -d)"
# Incident shape: file is tracked CLEAN at HEAD, then mutated in the
# working tree without commit (the dying-probe scenario).
( cd "$PROBE_DIRTY" && git init -q && mkdir src sub \
    && printf 'fn clean() {}\n' > src/code.rs \
    && git -c user.email=t@t -c user.name=t add src/code.rs \
    && git -c user.email=t@t -c user.name=t commit -q -m init \
    && printf '// %s: def scope\nfn mutant() {}\n' "$MARKER" > src/code.rs )
PROBE_EXCL="$(mktemp -d)"
# Pins the two §9.1 hook-path exclusions exactly: harness/fixture dir
# and the residue hook itself may carry the literal.
( cd "$PROBE_EXCL" && git init -q && mkdir -p .claude/hooks/tests \
    && printf 'fixture quoting %s\n' "$MARKER" > .claude/hooks/tests/fixture.txt \
    && printf '# sweeps for %s\n' "$MARKER" > .claude/hooks/block-probe-residue.sh \
    && git -c user.email=t@t -c user.name=t add .claude/hooks/tests/fixture.txt .claude/hooks/block-probe-residue.sh \
    && git -c user.email=t@t -c user.name=t commit -q -m init )
PROBE_DOCS="$(mktemp -d)"
( cd "$PROBE_DOCS" && git init -q && mkdir -p specs/x/reviews \
    && printf 'quotes %s convention\n' "$MARKER" > notes.md \
    && printf 'transcript quoting %s\n' "$MARKER" > specs/x/reviews/r.txt \
    && git -c user.email=t@t -c user.name=t add notes.md specs/x/reviews/r.txt \
    && git -c user.email=t@t -c user.name=t commit -q -m init )
PROBE_UNTRACKED="$(mktemp -d)"
( cd "$PROBE_UNTRACKED" && git init -q \
    && printf '// %s\n' "$MARKER" > stray.rs )
PROBE_HOOKFILE="$(mktemp -d)"
( cd "$PROBE_HOOKFILE" && git init -q && mkdir -p .claude/hooks \
    && printf '# %s residue\n' "$MARKER" > .claude/hooks/foo.sh \
    && git -c user.email=t@t -c user.name=t add .claude/hooks/foo.sh \
    && git -c user.email=t@t -c user.name=t commit -q -m init )
run "probe-residue: clean tree commit allowed"      block-probe-residue.sh 0 "$(J 'git commit -m "x"')" "$PROBE_CLEAN"
run "probe-residue: tracked code residue blocked"   block-probe-residue.sh 2 "$(J 'git commit -m "x"')" "$PROBE_DIRTY"
run "probe-residue: md + spec-corpus residue allowed" block-probe-residue.sh 0 "$(J 'git commit -m "x"')" "$PROBE_DOCS"
run "probe-residue: marker in commit msg allowed"   block-probe-residue.sh 0 "$(J 'git commit -m "adopt MUTATION PROBE convention"')" "$PROBE_CLEAN"
run "probe-residue: non-commit cmd allowed (dirty)" block-probe-residue.sh 0 "$(J 'git status')" "$PROBE_DIRTY"
run "probe-residue: untracked code residue blocked" block-probe-residue.sh 2 "$(J 'git commit -m "x"')" "$PROBE_UNTRACKED"
run "probe-residue: subdir commit swept from root"  block-probe-residue.sh 2 "$(J 'git commit -m "x"')" "$PROBE_DIRTY/sub"
run "probe-residue: non-test hook residue blocked"  block-probe-residue.sh 2 "$(J 'git commit -m "x"')" "$PROBE_HOOKFILE"
run "probe-residue: non-git dir fails open"         block-probe-residue.sh 0 "$(J 'git commit -m "x"')" "$SANDBOX"
run "probe-residue: git -c form commit blocked"     block-probe-residue.sh 2 "$(J 'git -c user.name=t commit -m "x"')" "$PROBE_DIRTY"
run "probe-residue: git -C form sweeps target repo" block-probe-residue.sh 2 "$(J "git -C $PROBE_DIRTY commit -m \"x\"")" "$SANDBOX"
run "probe-residue: quoted -C literal target blocked" block-probe-residue.sh 2 "$(J "git -C \"$PROBE_DIRTY\" commit -m \"x\"")" "$SANDBOX"
run "probe-residue: variable -C falls back to cwd"  block-probe-residue.sh 2 "$(J 'git -C "$somewhere" commit -m "x"')" "$PROBE_DIRTY"
run "probe-residue: --git-dir separated form blocked" block-probe-residue.sh 2 "$(J 'git --git-dir .git commit -m "x"')" "$PROBE_DIRTY"
run "probe-residue: git commit --help not a commit" block-probe-residue.sh 0 "$(J 'git commit --help')" "$PROBE_DIRTY"
run "probe-residue: later -C cannot shadow target"  block-probe-residue.sh 2 "$(J "git -C $PROBE_DIRTY commit -m \"x\" && echo -C /tmp/other")" "$SANDBOX"
run "probe-residue: --help after -- is pathspec"    block-probe-residue.sh 2 "$(J 'git commit -m "x" -- --help')" "$PROBE_DIRTY"
run "probe-residue: hook-path exclusions allowed"   block-probe-residue.sh 0 "$(J 'git commit -m "x"')" "$PROBE_EXCL"

# --- block-stale-derived-artifacts.sh ---
# Source-only commit guard: fake source layouts carry the exact IS_SOURCE marker
# and a stub selfcheck so the hook contract is exercised without mutating the
# real repo's derived artefacts.
mk_stale_guard_repo() { # mk_stale_guard_repo <dir> <selfcheck_rc> <layout>
    local dir="$1" rc="$2" layout="${3:-source}"
    ( cd "$dir" && git init -q )
    if [ "$layout" != "oss" ]; then
        mkdir -p "$dir/agents/scripts"
        printf 'fixture-skill\n' > "$dir/agents/scripts/fleet-skills.txt"
        printf '#!/usr/bin/env bash\nif [ "${1:-}" = "--check" ]; then echo "stale mirror: changed .claude/skills/fixture-skill/SKILL.md" >&2; exit %s; fi\nexit 0\n' "$rc" > "$dir/agents/scripts/fleet-selfcheck.sh"
        chmod +x "$dir/agents/scripts/fleet-selfcheck.sh"
    fi
    case "$layout" in
        source-stray-agents)
            mkdir -p "$dir/.agents"
            ;;
        child|child-stray-agents)
            mkdir -p "$dir/.agents/scripts"
            printf 'fixture-skill\n' > "$dir/.agents/scripts/fleet-skills.txt"
            ;;
    esac
}

STALE_SRC="$(mktemp -d)"
STALE_SRC_CLEAN="$(mktemp -d)"
STALE_SRC_STRAY="$(mktemp -d)"
STALE_CHILD="$(mktemp -d)"
STALE_CHILD_STRAY="$(mktemp -d)"
STALE_OSS="$(mktemp -d)"
mk_stale_guard_repo "$STALE_SRC" 1 source
mk_stale_guard_repo "$STALE_SRC_CLEAN" 0 source
mk_stale_guard_repo "$STALE_SRC_STRAY" 1 source-stray-agents
mk_stale_guard_repo "$STALE_CHILD" 1 child
mk_stale_guard_repo "$STALE_CHILD_STRAY" 1 child-stray-agents
mk_stale_guard_repo "$STALE_OSS" 1 oss

run "stale-derived: source stale commit blocked"     block-stale-derived-artifacts.sh 2 "$(J 'git commit -m "x"')" "$STALE_SRC"
run "stale-derived: git -C source stale blocked"     block-stale-derived-artifacts.sh 2 "$(J "git -C $STALE_SRC commit -m \"x\"")" "$SANDBOX"
run "stale-derived: git -c source stale blocked"     block-stale-derived-artifacts.sh 2 "$(J 'git -c user.name=t commit -m "x"')" "$STALE_SRC"
run "stale-derived: --git-dir source stale blocked"  block-stale-derived-artifacts.sh 2 "$(J "git --git-dir $STALE_SRC/.git commit -m \"x\"")" "$SANDBOX"
run "stale-derived: --work-tree source stale blocked" block-stale-derived-artifacts.sh 2 "$(J "git --git-dir $STALE_SRC/.git --work-tree $STALE_SRC commit -m \"x\"")" "$SANDBOX"
run "stale-derived: commit help allowed"             block-stale-derived-artifacts.sh 0 "$(J 'git commit --help')" "$STALE_SRC"
run "stale-derived: commit pathspec help allowed"    block-stale-derived-artifacts.sh 0 "$(J 'git commit -- --help')" "$STALE_SRC"
run "stale-derived: in-step source commit allowed"   block-stale-derived-artifacts.sh 0 "$(J 'git commit -m "x"')" "$STALE_SRC_CLEAN"
run "stale-derived: child layout commit allowed"     block-stale-derived-artifacts.sh 0 "$(J 'git commit -m "x"')" "$STALE_CHILD"
run "stale-derived: git status allowed"              block-stale-derived-artifacts.sh 0 "$(J 'git status')" "$STALE_SRC"
run "stale-derived: ls allowed"                      block-stale-derived-artifacts.sh 0 "$(J 'ls')" "$STALE_SRC"
run "stale-derived: IS_SOURCE source -> source"      block-stale-derived-artifacts.sh 2 "$(J 'git commit -m "x"')" "$STALE_SRC"
run "stale-derived: IS_SOURCE stray .agents -> source" block-stale-derived-artifacts.sh 2 "$(J 'git commit -m "x"')" "$STALE_SRC_STRAY"
run "stale-derived: IS_SOURCE child marker -> noop"  block-stale-derived-artifacts.sh 0 "$(J 'git commit -m "x"')" "$STALE_CHILD"
run "stale-derived: IS_SOURCE child+agents -> noop"  block-stale-derived-artifacts.sh 0 "$(J 'git commit -m "x"')" "$STALE_CHILD_STRAY"
run "stale-derived: IS_SOURCE OSS -> noop"           block-stale-derived-artifacts.sh 0 "$(J 'git commit -m "x"')" "$STALE_OSS"

# Active-SPEC ranking: in-execution > decomposed > approved, newest
# wins ties — a live contract must beat stale approved specs (e.g.
# pre-reset specs retained as evidence). Regression coverage for the
# ACTOCCATUD 2026-06-09 AGENT_FEEDBACK report (oldest-approved bug).
RANK_FIX="$(mktemp -d)"
( cd "$RANK_FIX" && git init -q )
mk_spec() { # mk_spec <dir> <id> <status>
    mkdir -p "$1/specs/$2"
    printf -- '---\nid: %s\nstatus: %s\n---\n' "$2" "$3" > "$1/specs/$2/SPEC.md"
}
mk_spec "$RANK_FIX" 2026-01-01-old-approved      approved
mk_spec "$RANK_FIX" 2026-02-02-newer-approved    approved
mk_spec "$RANK_FIX" 2026-03-03-live-contract     decomposed
mk_spec "$RANK_FIX" 2026-04-04-already-verified  verified
run_stdout "session-start ranks decomposed over older approved" \
    session-start-context.sh 0 "2026-03-03-live-contract" \
    '{"hook_event_name":"SessionStart"}' "$RANK_FIX"
mk_spec "$RANK_FIX" 2026-05-05-in-exec in-execution
run_stdout "session-start ranks in-execution over decomposed" \
    session-start-context.sh 0 "2026-05-05-in-exec" \
    '{"hook_event_name":"SessionStart"}' "$RANK_FIX"
RANK_TIE="$(mktemp -d)"
( cd "$RANK_TIE" && git init -q )
mk_spec "$RANK_TIE" 2026-01-01-old-approved   approved
mk_spec "$RANK_TIE" 2026-02-02-newest-approved approved
run_stdout "session-start newest approved wins rank tie" \
    session-start-context.sh 0 "2026-02-02-newest-approved" \
    '{"hook_event_name":"SessionStart"}' "$RANK_TIE"
# superseded is terminal (rank 0): a newer superseded spec must never
# beat an older approved one (per agents/specs/SPEC.schema.md §1.3).
mk_spec "$RANK_TIE" 2026-03-03-retired-newest superseded
run_stdout "session-start superseded never active" \
    session-start-context.sh 0 "2026-02-02-newest-approved" \
    '{"hook_event_name":"SessionStart"}' "$RANK_TIE"
# --- warn-subagent-routing.sh (advisory: asserts exit code + stderr) ---
# Contract: specs/2026-06-10-model-capability-matrix/SPEC.md §7.2/§7.2a.
run_stderr() {
    # Assert exit code AND stderr contains substring ('' = stderr must
    # be empty). Optional 6th arg: space-separated env assignments.
    # CLAUDE_CODE_SUBAGENT_MODEL is cleared unless the env arg sets it.
    local name="$1" hook="$2" expected_exit="$3" expected_substr="$4" cmd_json="$5" env_kv="${6:-}"
    local actual stderr stdout ok=1
    # shellcheck disable=SC2086
    stdout=$(printf '%s' "$cmd_json" | env -u CLAUDE_CODE_SUBAGENT_MODEL $env_kv "$HOOK_DIR/$hook" 2>"$SUBR_ERRF")
    actual=$?
    stderr=$(cat "$SUBR_ERRF")
    [ "$actual" = "$expected_exit" ] || ok=0
    # Advisory hooks never use stdout (§12.1) — assert it on every case.
    [ -z "$stdout" ] || ok=0
    if [ -n "$expected_substr" ]; then
        printf '%s' "$stderr" | grep -qF "$expected_substr" || ok=0
    else
        [ -z "$stderr" ] || ok=0
    fi
    if [ "$ok" = 1 ]; then
        PASS=$((PASS+1))
        printf 'PASS %-50s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit + stderr '${expected_substr:-<empty>}' + empty stdout; got exit $actual stdout=$stdout stderr=$stderr")
        printf 'FAIL %-50s [%s]\n' "$name" "$hook"
    fi
}
JT() {
    # JSON envelope for a Task/Agent PreToolUse event.
    printf '{"tool_name":"%s","tool_input":%s}' "$1" "$2"
}
SUBR_FIX="$(mktemp -d)"
SUBR_ERRF="$(mktemp)"
mkdir -p "$SUBR_FIX/.claude/agents" "$SUBR_FIX/.claude/plugins"
printf -- '---\nname: bes-test-pinned-agent\nmodel: haiku\n---\nbody\n' > "$SUBR_FIX/.claude/agents/bes-test-pinned-agent.md"
printf -- '---\nname: bes-test-unpinned-agent\nmodel: inherit\n---\nbody\n' > "$SUBR_FIX/.claude/agents/bes-test-unpinned-agent.md"
printf -- '---\nname: bes-test-quoted-inherit\nmodel: "inherit"\n---\nbody\n' > "$SUBR_FIX/.claude/agents/bes-test-quoted-inherit.md"
printf -- '---\nname: bes-test-quoted-inherit-ws\nmodel: "inherit"   \n---\nbody\n' > "$SUBR_FIX/.claude/agents/bes-test-quoted-inherit-ws.md"
printf -- '---\nname: bes-test-comment-inherit\nmodel: inherit # team default\n---\nbody\n' > "$SUBR_FIX/.claude/agents/bes-test-comment-inherit.md"
printf -- '---\nname: bes-test-quoted-pin\nmodel: "haiku"\n---\nbody\n' > "$SUBR_FIX/.claude/agents/bes-test-quoted-pin.md"
# Decoy OUTSIDE the agents dir: traversal must NOT reach it.
printf -- '---\nname: evil\nmodel: haiku\n---\nbody\n' > "$SUBR_FIX/.claude/plugins/evil.md"
ADVICE="warn-subagent-routing"
run_stderr "task dispatch w/o model advises"          warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"do x"}')"
run_stderr "agent tool w/o model advises"             warn-subagent-routing.sh 0 "$ADVICE" "$(JT Agent '{"prompt":"do x"}')"
run_stderr "model param pinned stays silent"          warn-subagent-routing.sh 0 "" "$(JT Task '{"prompt":"x","model":"haiku"}')"
run_stderr "env-var pin stays silent"                 warn-subagent-routing.sh 0 "" "$(JT Task '{"prompt":"x"}')" "CLAUDE_CODE_SUBAGENT_MODEL=claude-haiku-4-5-20251001"
run_stderr "env-var literal inherit still advises"    warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x"}')" "CLAUDE_CODE_SUBAGENT_MODEL=inherit"
run_stderr "Explore silent-list entry stays silent"   warn-subagent-routing.sh 0 "" "$(JT Task '{"prompt":"x","subagent_type":"Explore"}')"
run_stderr "frontmatter-pinned subagent stays silent" warn-subagent-routing.sh 0 "" "$(JT Task '{"prompt":"x","subagent_type":"bes-test-pinned-agent"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "frontmatter inherit subagent advises"     warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","subagent_type":"bes-test-unpinned-agent"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "non-dispatch tool stays silent"           warn-subagent-routing.sh 0 "" "$(JT Bash '{"command":"ls"}')"
run_stderr "malformed input fail-open silent"         warn-subagent-routing.sh 0 "" 'this is not json'
run_stderr "whitespace-only model still advises"      warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","model":"   "}')"
run_stderr "quoted-inherit frontmatter advises"       warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","subagent_type":"bes-test-quoted-inherit"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "quoted-inherit + trailing ws advises"     warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","subagent_type":"bes-test-quoted-inherit-ws"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "commented-inherit frontmatter advises"    warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","subagent_type":"bes-test-comment-inherit"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "quoted-pin frontmatter stays silent"      warn-subagent-routing.sh 0 "" "$(JT Task '{"prompt":"x","subagent_type":"bes-test-quoted-pin"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "traversal subagent_type cannot suppress"  warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","subagent_type":"../plugins/evil"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"
run_stderr "dotted subagent_type cannot suppress"     warn-subagent-routing.sh 0 "$ADVICE" "$(JT Task '{"prompt":"x","subagent_type":"..%2Fplugins%2Fevil"}')" "CLAUDE_PROJECT_DIR=$SUBR_FIX"

# --- P4 hook-guardrail-hardening (specs/2026-07-01-hook-guardrail-hardening) ---
# T-02 classifier hardening (real-trigger + false-positive per fix) +
# T-01 Edit/Write wiring behaviour of the two self-filtering hooks.

# block-git-add-all.sh: global-option prefix forms must not bypass.
run "P4 git -C . add . blocked"             block-git-add-all.sh    2 "$(J 'git -C . add .')"
run "P4 git -c x=y add . blocked"           block-git-add-all.sh    2 "$(J 'git -c x=y add .')"
run "P4 git -C repo add -A blocked"         block-git-add-all.sh    2 "$(J 'git -C /repo add -A')"
run "P4 git -C . add file allowed"          block-git-add-all.sh    0 "$(J 'git -C . add foo.txt')"
run "P4 quoted -C add . mention allowed"    block-git-add-all.sh    0 "$(J 'git commit -m "never git -C . add ."')"

# block-push-to-main.sh: global-option prefix + bare-push HEAD resolution.
PUSH_MAIN="$(mktemp -d)"; git -C "$PUSH_MAIN" init -q -b main
PUSH_FEAT="$(mktemp -d)"; git -C "$PUSH_FEAT" init -q -b feature/x
run "P4 git -c x=y push origin main blocked" block-push-to-main.sh  2 "$(J 'git -c x=y push origin main')" "$SANDBOX"
run "P4 git -c x=y push feature allowed"    block-push-to-main.sh   0 "$(J 'git -c x=y push origin feature/x')"
run "P4 bare git push on main blocked"      block-push-to-main.sh   2 "$(J 'git push')" "$PUSH_MAIN"
run "P4 git push origin on main blocked"    block-push-to-main.sh   2 "$(J 'git push origin')" "$PUSH_MAIN"
run "P4 bare push -u origin on main blocked" block-push-to-main.sh  2 "$(J 'git push -u origin')" "$PUSH_MAIN"
run "P4 bare git push on feature allowed"   block-push-to-main.sh   0 "$(J 'git push')" "$PUSH_FEAT"
run "P4 git push origin on feature allowed" block-push-to-main.sh   0 "$(J 'git push origin')" "$PUSH_FEAT"
run "P4 bare git push outside repo allowed" block-push-to-main.sh   0 "$(J 'git push')" "$SANDBOX"
# r2 cross-family catch: DELETE refspecs targeting main.
run "P4 push :main delete blocked"          block-push-to-main.sh   2 "$(J 'git push origin :main')" "$SANDBOX"
run "P4 push :refs/heads/main delete blocked" block-push-to-main.sh 2 "$(J 'git push origin :refs/heads/main')" "$SANDBOX"
run "P4 push +:main delete blocked"         block-push-to-main.sh   2 "$(J 'git push origin +:main')" "$SANDBOX"
run "P4 push :dead-feature delete allowed"  block-push-to-main.sh   0 "$(J 'git push origin :dead-feature')"
# r1 cross-family catch: value-carrying push options must not count as refs.
run "P4 push -o val origin on main blocked" block-push-to-main.sh   2 "$(J 'git push -o ci.skip origin')" "$PUSH_MAIN"
run "P4 push --push-option val on main blocked" block-push-to-main.sh 2 "$(J 'git push --push-option ci.skip origin')" "$PUSH_MAIN"
run "P4 push -o val origin feature allowed" block-push-to-main.sh   0 "$(J 'git push -o ci.skip origin')" "$PUSH_FEAT"

# block-verify-bypass.sh: -n / -nm short forms (commit-scoped) +
# core.hooksPath hook-redirect.
run "P4 git commit -n blocked"              block-verify-bypass.sh  2 "$(J 'git commit -n')"
run "P4 git commit -nm x blocked"           block-verify-bypass.sh  2 "$(J 'git commit -nm "x"')"
run "P4 git commit -anm x blocked"          block-verify-bypass.sh  2 "$(J 'git commit -anm "x"')"
run "P4 git commit -am allowed"             block-verify-bypass.sh  0 "$(J 'git commit -am "x"')"
run "P4 git push -n dry-run allowed"        block-verify-bypass.sh  0 "$(J 'git push -n origin feature/x')"
run "P4 -n in quoted msg allowed"           block-verify-bypass.sh  0 "$(J 'git commit -m "use -n to skip hooks"')"
run "P4 core.hooksPath commit blocked"      block-verify-bypass.sh  2 "$(J 'git -c core.hooksPath=/dev/null commit -m "x"')"
run "P4 core.hooksPath quoted-value blocked" block-verify-bypass.sh 2 "$(J 'git -c core.hooksPath="/tmp/h" commit -m "x"')"
run "P4 core.hooksPath mention in msg allowed" block-verify-bypass.sh 0 "$(J 'git commit -m "core.hooksPath=x is bad"')"
run "P4 core.hooksPath on status allowed"   block-verify-bypass.sh  0 "$(J 'git -c core.hooksPath=/x status')"
# r1 cross-family catch: after a `--` pathspec separator, -n is a file name.
run "P4 commit -- -n pathspec allowed"      block-verify-bypass.sh  0 "$(J 'git commit -m "x" -- -n')"
run "P4 commit -n before -- still blocked"  block-verify-bypass.sh  2 "$(J 'git commit -n -- file.txt')"

# block-ai-attribution.sh: ALL -m occurrences + --message space-form.
run "P4 second -m co-author blocked"        block-ai-attribution.sh 2 "$(J 'git commit -m "t" -m "Co-authored-by: X <x@y>"')"
run "P4 --message space co-author blocked"  block-ai-attribution.sh 2 "$(J 'git commit --message "Co-authored-by: X <x@y>"')"
run "P4 --message= co-author blocked"       block-ai-attribution.sh 2 "$(J 'git commit --message="Co-authored-by: X <x@y>"')"
run "P4 two clean -m allowed"               block-ai-attribution.sh 0 "$(J 'git commit -m "first" -m "second"')"
run "P4 --message space clean allowed"      block-ai-attribution.sh 0 "$(J 'git commit --message "clean msg"')"

# T-01: Edit/Write payloads are handled by the two self-filtering hooks
# (wired under the Edit|Write matcher in settings.json).
mkdir -p "$SANDBOX/specs/nodeps"
cat > "$SANDBOX/specs/nodeps/SPEC.md" <<'EOF_NODEPS'
---
id: test-nodeps
status: in-execution
type: task
owner: test
---
# fixture
EOF_NODEPS
export CLAUDE_PROJECT_DIR="$HOOK_DIR/../.."
export ACTIVE_SPEC_DIR="$SANDBOX/specs/nodeps"
run "P4 Edit package.json undeclared blocked" block-undeclared-deps.sh 2 '{"tool_name":"Edit","tool_input":{"file_path":"package.json","old_string":"a","new_string":"b"}}'
run "P4 Edit README.md allowed (deps)"      block-undeclared-deps.sh 0 '{"tool_name":"Edit","tool_input":{"file_path":"README.md","old_string":"a","new_string":"b"}}'
unset ACTIVE_SPEC_DIR
unset CLAUDE_PROJECT_DIR
run_stderr "P4 Write secret content warns"  warn-security-surface.sh 0 "warn-security-surface" '{"tool_name":"Write","tool_input":{"file_path":"config.py","content":"AWS_KEY=AKIA1234567890ABCDEF"}}' "ACTIVE_SPEC_DIR=$SANDBOX/specs/nodeps CLAUDE_PROJECT_DIR=$HOOK_DIR/../.."
run_stderr "P4 Write clean content silent"  warn-security-surface.sh 0 "" '{"tool_name":"Write","tool_input":{"file_path":"notes.md","content":"hello world"}}' "CLAUDE_PROJECT_DIR=$HOOK_DIR/../.."

# --- block-fleet-commit-sweep.sh (specs/2026-07-02-fleet-sync-stage-posture) ---
# Child-repo fixtures, one per git state. Each tracks .agents/f.md (fleet)
# and src/app.txt (product) so the repo passes the has-fleet-content gate.
mk_sweep_fixture() {
    local d; d="$(mktemp -d)"
    git -C "$d" init -q -b main
    git -C "$d" config user.email t@t; git -C "$d" config user.name t
    mkdir -p "$d/.agents" "$d/src"
    echo fleet > "$d/.agents/f.md"; echo app > "$d/src/app.txt"
    git -C "$d" add .agents/f.md src/app.txt
    git -C "$d" commit -qm "init"
    printf '%s' "$d"
}
SWEEP_MIXED="$(mk_sweep_fixture)"   # fleet + product both staged
echo f2 >> "$SWEEP_MIXED/.agents/f.md"; echo a2 >> "$SWEEP_MIXED/src/app.txt"
git -C "$SWEEP_MIXED" add .agents/f.md src/app.txt
SWEEP_FLEET="$(mk_sweep_fixture)"   # fleet only staged
echo f2 >> "$SWEEP_FLEET/.agents/f.md"; git -C "$SWEEP_FLEET" add .agents/f.md
SWEEP_PROD="$(mk_sweep_fixture)"    # product only staged
echo a2 >> "$SWEEP_PROD/src/app.txt"; git -C "$SWEEP_PROD" add src/app.txt
SWEEP_MOD="$(mk_sweep_fixture)"     # fleet + product MODIFIED, unstaged
echo f2 >> "$SWEEP_MOD/.agents/f.md"; echo a2 >> "$SWEEP_MOD/src/app.txt"
SWEEP_CLEAN="$(mk_sweep_fixture)"   # clean tree

run "sweep: mixed staged commit blocked"    block-fleet-commit-sweep.sh 2 "$(J 'git commit -m "feat: x"')" "$SWEEP_MIXED"
run "sweep: pure fleet + fleet: msg allowed" block-fleet-commit-sweep.sh 0 "$(J 'git commit -m "fleet: sync baseline"')" "$SWEEP_FLEET"
run "sweep: pure fleet + feat: msg blocked" block-fleet-commit-sweep.sh 2 "$(J 'git commit -m "feat: x"')" "$SWEEP_FLEET"
run "sweep: product-only staged allowed"    block-fleet-commit-sweep.sh 0 "$(J 'git commit -m "feat: x"')" "$SWEEP_PROD"
run "sweep: -am over modified mix blocked"  block-fleet-commit-sweep.sh 2 "$(J 'git commit -am "feat: x"')" "$SWEEP_MOD"
run "sweep: -i mixed include blocked"       block-fleet-commit-sweep.sh 2 "$(J 'git commit -i .agents/f.md src/app.txt -m "feat: x"')" "$SWEEP_CLEAN"
run "sweep: bare mixed pathspec blocked"    block-fleet-commit-sweep.sh 2 "$(J 'git commit .agents/f.md src/app.txt -m "feat: x"')" "$SWEEP_CLEAN"
run "sweep: bare fleet pathspec + fleet: msg allowed (index ignored)" block-fleet-commit-sweep.sh 0 "$(J 'git commit .agents/f.md -m "fleet: baseline"')" "$SWEEP_MIXED"

# r3 (ACTOCCATUD launch-day follow-up, owner-directed fix 2026-07-02):
# .agents/specs/** is CHILD-LOCAL spec-ledger content (fleet-sync.sh
# header: it "does not propagate ... WILL be swept") — classified as
# PRODUCT, so spec:-typed lifecycle commits pass while mixing it with
# real fleet baseline still blocks.
SWEEP_SPECS="$(mk_sweep_fixture)"
mkdir -p "$SWEEP_SPECS/.agents/specs/t"
echo task > "$SWEEP_SPECS/.agents/specs/t/TASK.md"
git -C "$SWEEP_SPECS" add .agents/specs/t/TASK.md
run "sweep: staged .agents/specs + spec: msg allowed (child-local ledger)" block-fleet-commit-sweep.sh 0 "$(J 'git commit -m "spec: T-01 -> done"')" "$SWEEP_SPECS"
run "sweep: bare .agents/specs pathspec + spec: msg allowed"               block-fleet-commit-sweep.sh 0 "$(J 'git commit .agents/specs/t/TASK.md -m "spec: flip"')" "$SWEEP_CLEAN"
echo f3 >> "$SWEEP_SPECS/.agents/f.md"; git -C "$SWEEP_SPECS" add .agents/f.md
run "sweep: specs + fleet baseline mixed still blocked"                    block-fleet-commit-sweep.sh 2 "$(J 'git commit -m "spec: x"')" "$SWEEP_SPECS"

# r3: repo context honors -C — a commit TARGETING another repo is
# classified against THAT repo (incl. the source-repo fail-open), never
# the invocation cwd's index (the reproduced ACTOCCATUD misfire).
SWEEP_SOURCE="$(mktemp -d)"
git -C "$SWEEP_SOURCE" init -q -b main
git -C "$SWEEP_SOURCE" config user.email t@t; git -C "$SWEEP_SOURCE" config user.name t
mkdir -p "$SWEEP_SOURCE/agents/scripts"
echo x > "$SWEEP_SOURCE/agents/scripts/fleet-skills.txt"
git -C "$SWEEP_SOURCE" add agents/scripts/fleet-skills.txt
git -C "$SWEEP_SOURCE" commit -qm "init"
# The fail-open case below must pass ONLY because of the source marker. With no
# fleet-managed content the hook takes a DIFFERENT fail-open ("no fleet content
# exists"), which made the assertion vacuous (cross-family review, finding 3).
# So: give it .agents/ content AND a staged fleet change — but never
# .agents/scripts/fleet-skills.txt, whose ABSENCE is half the marker predicate.
mkdir -p "$SWEEP_SOURCE/.agents"
echo policy > "$SWEEP_SOURCE/.agents/OPERATING_MODEL.md"
git -C "$SWEEP_SOURCE" add .agents/OPERATING_MODEL.md
run "sweep: -C source-repo commit fail-opens despite dirty cwd index" block-fleet-commit-sweep.sh 0 "$(J "git -C $SWEEP_SOURCE commit -m \"docs: x\"")" "$SWEEP_MIXED"
run "sweep: -C child target evaluated from clean cwd (mixed blocked)" block-fleet-commit-sweep.sh 2 "$(J "git -C $SWEEP_MIXED commit -m \"feat: x\"")" "$SWEEP_CLEAN"
run "sweep: quoted msg does not eat pathspec" block-fleet-commit-sweep.sh 2 "$(J 'git commit -m "feat: x" .agents/f.md')" "$SWEEP_CLEAN"
run "sweep: unquoted msg value not a pathspec" block-fleet-commit-sweep.sh 0 "$(J 'git commit -m fix src/app.txt')" "$SWEEP_CLEAN"
run "sweep: fleet path in quoted msg allowed" block-fleet-commit-sweep.sh 0 "$(J 'git commit -m "sweep .agents/ docs"')" "$SWEEP_PROD"
# Was: no cwd argument at all, so it inherited the harness's ambient repo. That
# only holds where the ambient repo IS the fleet source; at the studio-root
# mirror it fails (correctly — the hook sees freshly synced fleet paths in a
# non-`fleet:` commit). $SWEEP_SOURCE is the purpose-built source-repo fixture.
run "sweep: source repo fail-open"          block-fleet-commit-sweep.sh 0 "$(J 'git commit -m "feat: x"')" "$SWEEP_SOURCE"
run "sweep: non-git cwd fail-open"          block-fleet-commit-sweep.sh 0 "$(J 'git commit -m "feat: x"')" "$SANDBOX"
# gate-2 r1 catches: --pathspec-from-file, --amend --no-edit, .githooks-only repos.
printf '.agents/f.md\nsrc/app.txt\n' > "$SWEEP_CLEAN/list.txt"
printf '.agents/f.md\n' > "$SWEEP_CLEAN/fleetlist.txt"
printf 'src/app.txt\n' > "$SWEEP_CLEAN/prodlist.txt"
run "sweep: pathspec-from-file mixed blocked" block-fleet-commit-sweep.sh 2 "$(J 'git commit --pathspec-from-file=list.txt -m "feat: x"')" "$SWEEP_CLEAN"
run "sweep: pathspec-from-file pure fleet + fleet: msg allowed" block-fleet-commit-sweep.sh 0 "$(J 'git commit --pathspec-from-file=fleetlist.txt -m "fleet: baseline"')" "$SWEEP_CLEAN"
run "sweep: pathspec-from-file stdin blocked" block-fleet-commit-sweep.sh 2 "$(J 'git commit --pathspec-from-file=- -m "feat: x"')" "$SWEEP_CLEAN"
# gate-2 r2 catches: NUL-delimited pathspec files; per-command psf scoping.
run "sweep: pathspec-file-nul blocked as unevaluable" block-fleet-commit-sweep.sh 2 "$(J 'git commit --pathspec-from-file=list.txt --pathspec-file-nul -m "feat: x"')" "$SWEEP_CLEAN"
run "sweep: chained psf uses ITS OWN file (fleet list on 2nd cmd) blocked" block-fleet-commit-sweep.sh 2 "$(J 'git commit --pathspec-from-file=prodlist.txt -m "feat: a" && git commit --pathspec-from-file=list.txt -m "feat: b"')" "$SWEEP_CLEAN"
run "sweep: amend --no-edit fleet onto product HEAD blocked" block-fleet-commit-sweep.sh 2 "$(J 'git commit --amend --no-edit')" "$SWEEP_FLEET"
SWEEP_FLEETHEAD="$(mk_sweep_fixture)"  # HEAD is a fleet: commit; more fleet staged
( cd "$SWEEP_FLEETHEAD" && echo f2 >> .agents/f.md && git add .agents/f.md && git commit -qm "fleet: baseline" && echo f3 >> .agents/f.md && git add .agents/f.md )
run "sweep: amend --no-edit fleet onto fleet: HEAD allowed" block-fleet-commit-sweep.sh 0 "$(J 'git commit --amend --no-edit')" "$SWEEP_FLEETHEAD"
SWEEP_GHOOKS="$(mktemp -d)"  # .githooks-only repo (no .agents/.claude/WORKFLOW.md)
git -C "$SWEEP_GHOOKS" init -q -b main; git -C "$SWEEP_GHOOKS" config user.email t@t; git -C "$SWEEP_GHOOKS" config user.name t
mkdir -p "$SWEEP_GHOOKS/.githooks" "$SWEEP_GHOOKS/src"
echo h > "$SWEEP_GHOOKS/.githooks/pre-push"; echo a > "$SWEEP_GHOOKS/src/app.txt"
git -C "$SWEEP_GHOOKS" add .githooks/pre-push src/app.txt; git -C "$SWEEP_GHOOKS" commit -qm init
echo h2 >> "$SWEEP_GHOOKS/.githooks/pre-push"; echo a2 >> "$SWEEP_GHOOKS/src/app.txt"
git -C "$SWEEP_GHOOKS" add .githooks/pre-push src/app.txt
run "sweep: githooks-only repo mixed blocked" block-fleet-commit-sweep.sh 2 "$(J 'git commit -m "feat: x"')" "$SWEEP_GHOOKS"



# --- instrumentation: decision logging (specs/2026-07-24-hook-decision-instrumentation) ---
# A BLOCK must write exactly one record, and secrets must be redacted before
# the line is written. Uses an isolated BES_LOG_FILE so the real log is
# untouched by the suite.
LOGTEST="$(mktemp -d)"
assert_log() {
    local name="$1" want_recs="$2" want_decision="$3"
    local recs got
    recs=$(wc -l < "$LOGTEST/decisions.log" 2>/dev/null | tr -d ' ') || recs=0
    got=$(awk -F'\t' -v d="$want_decision" '$3==d' "$LOGTEST/decisions.log" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$recs" = "$want_recs" ] && [ "$got" = "1" ]; then
        PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "$name" "log-decision.sh"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [log-decision.sh]: wanted $want_recs record(s) incl one $want_decision, got recs=$recs ${want_decision}=$got")
        printf 'FAIL %-50s [%s]\n' "$name" "log-decision.sh"
    fi
}

: > "$LOGTEST/decisions.log"
printf '%s' "$(J 'git add .')" | BES_LOG_FILE="$LOGTEST/decisions.log" "$HOOK_DIR/block-git-add-all.sh" >/dev/null 2>&1
assert_log "instrumentation: BLOCK writes exactly one record" 1 BLOCK

: > "$LOGTEST/decisions.log"
printf '%s' "$(J 'git status')" | BES_LOG_FILE="$LOGTEST/decisions.log" "$HOOK_DIR/block-git-add-all.sh" >/dev/null 2>&1
assert_log "instrumentation: ALLOW writes exactly one record" 1 ALLOW

# WARN must be distinguishable from a clean ALLOW
: > "$LOGTEST/decisions.log"
printf '%s' '{"tool_name":"Task","tool_input":{"subagent_type":"general-purpose","prompt":"x"}}' \
  | BES_LOG_FILE="$LOGTEST/decisions.log" "$HOOK_DIR/warn-subagent-routing.sh" >/dev/null 2>&1
assert_log "instrumentation: advisory records WARN not ALLOW" 1 WARN

# --- instrumentation: cleanup registry (specs/2026-07-31-hook-decision-log-integrity) ---
# The defect this guards against: a hook that installs its own `trap ... EXIT`
# replaces the logging trap, and every decision it reaches thereafter goes
# unrecorded. block-journal-skip.sh did exactly that from 2026-07-27 until
# 2026-07-31 — four of its five blocking paths, and every post-lock allow, were
# invisible, including a gate that blocked a real session. Nothing caught it
# because every test asserted exit codes, and the verdicts were always correct.
# These cases assert that the DECISION REACHES THE LOG, which is the property
# that was silently false.
: > "$LOGTEST/decisions.log"; rm -f "$LOGTEST/cleanup-ran"
( source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
  BES_LOG_FILE="$LOGTEST/decisions.log"
  bes_log_install_trap "probe-cleanup.sh"
  probe_cleanup() { : > "$LOGTEST/cleanup-ran"; exit 9; }
  bes_log_add_cleanup probe_cleanup
  exit 2 ) >/dev/null 2>&1
assert_log "instrumentation: cleanup cannot suppress record" 1 BLOCK

if [ -f "$LOGTEST/cleanup-ran" ]; then
    PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "instrumentation: registered cleanup runs" "log-decision.sh"
else
    FAIL=$((FAIL+1))
    FAILURES+=("instrumentation: registered cleanup runs [log-decision.sh]: cleanup did not execute")
    printf 'FAIL %-50s [%s]\n' "instrumentation: registered cleanup runs" "log-decision.sh"
fi

# A cleanup that simply RETURNS non-zero must also leave the verdict and the
# record intact — the common case, distinct from the `exit` case above.
: > "$LOGTEST/decisions.log"
( source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
  BES_LOG_FILE="$LOGTEST/decisions.log"
  bes_log_install_trap "probe-cleanup.sh"
  probe_ret1() { return 1; }
  bes_log_add_cleanup probe_ret1
  exit 0 ) >/dev/null 2>&1
assert_log "instrumentation: cleanup returning 1 is harmless" 1 ALLOW

# And a hook that registers nothing behaves exactly as before.
: > "$LOGTEST/decisions.log"
( source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
  BES_LOG_FILE="$LOGTEST/decisions.log"
  bes_log_install_trap "probe-cleanup.sh"
  exit 2 ) >/dev/null 2>&1
assert_log "instrumentation: no cleanup registered" 1 BLOCK

# The registry is process-local: an INHERITED BES_LOG_CLEANUPS must not seed
# it. Exporting the runner's own name recursed inside the trap and hung the
# gate — exit 124, no verdict, no record. (Cross-family review, gate 2 HIGH-1.)
: > "$LOGTEST/decisions.log"
cat > "$LOGTEST/inherit.sh" <<INHERIT
source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
bes_log_install_trap "probe-cleanup.sh"
exit 2
INHERIT
BES_LOG_CLEANUPS=bes_log_run_cleanups BES_LOG_FILE="$LOGTEST/decisions.log" \
    timeout 10 bash "$LOGTEST/inherit.sh" >/dev/null 2>&1
inherit_rc=$?
if [ "$inherit_rc" = "2" ]; then
    PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "instrumentation: inherited registry ignored" "log-decision.sh"
else
    FAIL=$((FAIL+1))
    FAILURES+=("instrumentation: inherited registry ignored [log-decision.sh]: gate exited $inherit_rc (124 = hung)")
    printf 'FAIL %-50s [%s]\n' "instrumentation: inherited registry ignored" "log-decision.sh"
fi
assert_log "instrumentation: inherited registry still records" 1 BLOCK

# A BLOCKING cleanup must not hang the gate. Validation cannot prevent this —
# a legitimately registered cleanup can block just as easily as an injected one
# — so the runner bounds each cleanup instead. Measured before the bound: a
# registered `sleep 30` held the trap and no verdict was ever delivered.
: > "$LOGTEST/decisions.log"
cat > "$LOGTEST/hang.sh" <<HANG
source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
bes_log_install_trap "probe-cleanup.sh"
probe_slow() { sleep 30; }
bes_log_add_cleanup probe_slow
exit 2
HANG
BES_LOG_CLEANUP_TIMEOUT=2 BES_LOG_FILE="$LOGTEST/decisions.log" \
    timeout 15 bash "$LOGTEST/hang.sh" >/dev/null 2>&1
hang_rc=$?
if [ "$hang_rc" = "2" ]; then
    PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "instrumentation: blocking cleanup is bounded" "log-decision.sh"
else
    FAIL=$((FAIL+1))
    FAILURES+=("instrumentation: blocking cleanup is bounded [log-decision.sh]: gate exited $hang_rc (124 = hung)")
    printf 'FAIL %-50s [%s]\n' "instrumentation: blocking cleanup is bounded" "log-decision.sh"
fi
assert_log "instrumentation: bounded cleanup still records" 1 BLOCK

# A cleanup registered as a command STRING must be rejected, not eval'd: a
# string containing `exit` would terminate the trap before the write and
# reintroduce the defect. Names only. (Cross-family review, gate 1 BLOCKING-2.)
: > "$LOGTEST/decisions.log"
( source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
  BES_LOG_FILE="$LOGTEST/decisions.log"
  bes_log_install_trap "probe-cleanup.sh"
  bes_log_add_cleanup 'rm -f /nonexistent; exit 9'
  exit 2 ) >/dev/null 2>&1
assert_log "instrumentation: command string not eval'd" 1 BLOCK

# Structural guard: no hook may install a competing single-line EXIT trap
# without the fallback marker. Scoped to what the scanner recognises —
# multiline traps are out of reach of a line-oriented grep.
trapscan=$(grep -nE '^[[:space:]]*trap .*(EXIT|[[:space:]]0)([[:space:]]|$)' "$HOOK_DIR"/*.sh 2>/dev/null \
             | grep -v 'bes-log-cleanup-fallback' || true)
if [ -z "$trapscan" ]; then
    PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "instrumentation: no unmarked competing EXIT trap" "hook corpus"
else
    FAIL=$((FAIL+1))
    FAILURES+=("instrumentation: no unmarked competing EXIT trap [hook corpus]: $trapscan")
    printf 'FAIL %-50s [%s]\n' "instrumentation: no unmarked competing EXIT trap" "hook corpus"
fi

# TSV integrity: a tab or newline in ANY field must not shift columns.
# INJ must be built as a VARIABLE: `$(printf '\n')` strips the trailing
# newline via command substitution, and `$'\t\n'` does not expand inside
# double quotes. Both mistakes were made here and caught by cross-family
# review r4/r5 — the test claimed an injection it was not performing.
INJ=$'\t\n'
: > "$LOGTEST/decisions.log"
( source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
  BES_LOG_FILE="$LOGTEST/decisions.log" \
    bes_log_write "h${INJ}X" "BOGUS${INJ}Y" "r${INJ}Z" "d${INJ}W" ) >/dev/null 2>&1
tsv_lines=$(wc -l < "$LOGTEST/decisions.log" 2>/dev/null | tr -d ' ')
tsv_fields=$(awk -F'\t' 'NR==1{print NF}' "$LOGTEST/decisions.log" 2>/dev/null)
tsv_dec=$(awk -F'\t' 'NR==1{print $3}' "$LOGTEST/decisions.log" 2>/dev/null)
if [ "$tsv_lines" = "1" ] && [ "$tsv_fields" = "5" ] && [ "$tsv_dec" = "UNKNOWN" ]; then
    PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "instrumentation: TSV integrity under injection" "log-decision.sh"
else
    FAIL=$((FAIL+1))
    FAILURES+=("instrumentation: TSV integrity [log-decision.sh]: lines=$tsv_lines fields=$tsv_fields decision=$tsv_dec (want 1/5/UNKNOWN)")
    printf 'FAIL %-50s [%s]\n' "instrumentation: TSV integrity under injection" "log-decision.sh"
fi

# redaction: a token-shaped string must never reach the log verbatim
: > "$LOGTEST/decisions.log"
( source "$HOOK_DIR/lib/log-decision.sh" 2>/dev/null
  BES_LOG_FILE="$LOGTEST/decisions.log" bes_log_write t BLOCK r 'export GITHUB_TOKEN=ghp_AAAAAAAAAAAAAAAAAAAA' ) >/dev/null 2>&1
if grep -q 'ghp_AAAAAAAAAAAAAAAAAAAA' "$LOGTEST/decisions.log" 2>/dev/null; then
    FAIL=$((FAIL+1)); FAILURES+=("instrumentation: secret redaction [log-decision.sh]: token leaked verbatim")
    printf 'FAIL %-50s [%s]\n' "instrumentation: secret redaction" "log-decision.sh"
else
    PASS=$((PASS+1)); printf 'PASS %-50s [%s]\n' "instrumentation: secret redaction" "log-decision.sh"
fi
rm -rf "$LOGTEST"

printf '\n=== %d pass / %d fail ===\n' "$PASS" "$FAIL"
if [ "$FAIL" -gt 0 ]; then
    printf '\nFailures:\n'
    for line in "${FAILURES[@]}"; do printf '  - %s\n' "$line"; done
    exit 1
fi
exit 0
