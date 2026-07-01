#!/usr/bin/env bash
# Hook test harness. Exits 0 if all pass, 1 on failure.
# Each test feeds a synthesized PreToolUse(Bash) JSON to the hook and asserts
# the exit code and stderr.

set -u
HOOK_DIR="$(dirname "$(readlink -f "$0")")/.."
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
trap 'rm -rf "$SANDBOX"' EXIT

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
# declares branch_policy: main-direct, push to main is allowed. Tested by
# running from inside bes-fleet-policy (which declares main-direct on its
# inaugural SPEC and others).
run "main-direct SPEC allows push to main"  block-push-to-main.sh   0 "$(J 'git push origin main')" "$HOOK_DIR/../.."
run "main-direct SPEC allows push -u main"  block-push-to-main.sh   0 "$(J 'git push -u origin main')" "$HOOK_DIR/../.."

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

trap 'rm -rf "$SANDBOX" "$MAIN_NO_SPEC" "$MAIN_WITH_SPEC"' EXIT

JE() {
    # Edit tool envelope. block-edit-on-main.sh reads tool_input.file_path
    # from stdin to path-scope the block to repo-tracked targets.
    printf '{"tool_input":{"file_path":"%s"}}' "$1"
}

# main-direct allow-path (unchanged): a main-direct SPEC allows every edit on
# main regardless of whether the target is tracked.
run "edit on main allowed (main-direct SPEC)"      block-edit-on-main.sh   0 "$(JE 'foo.md')" "$MAIN_WITH_SPEC"
run "edit in bes-fleet-policy allowed (main-direct)" block-edit-on-main.sh 0 "$(JE 'STATUS.md')" "$HOOK_DIR/../.."
run "edit in non-git dir allowed (branch empty)"   block-edit-on-main.sh   0 "$(JE 'foo.md')" "$SANDBOX"

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
unset CLAUDE_PROJECT_DIR
unset ACTIVE_SPEC_DIR

# --- block-bad-cli-invocation.sh ---
# Helper resolution requires CLAUDE_PROJECT_DIR to point at the
# fleet-policy root so the helper + known-good are found.
export CLAUDE_PROJECT_DIR="$HOOK_DIR/../.."
run "claude --print prompt allowed"                 block-bad-cli-invocation.sh 0 "$(J 'claude --print "p"')"
run "claude --bogus blocked"                        block-bad-cli-invocation.sh 2 "$(J 'claude --bogus "p"')"
run "claude --output-format without --print blocked" block-bad-cli-invocation.sh 2 "$(J 'claude --output-format json "p"')"
run "claude --version is admin-allowed"             block-bad-cli-invocation.sh 0 "$(J 'claude --version')"
run "claude mcp list is admin-allowed"              block-bad-cli-invocation.sh 0 "$(J 'claude mcp list')"
run "claude doctor is admin-allowed"                block-bad-cli-invocation.sh 0 "$(J 'claude doctor')"
# copilot lane cases per specs/2026-06-05-copilot-cli-cross-validation-lane
run "copilot well-formed review span allowed"       block-bad-cli-invocation.sh 0 "$(J 'copilot -p "review the diff" --model gpt-5.5 -s --no-custom-instructions --disable-builtin-mcps --deny-tool write --deny-tool shell < /dev/null')"
run "gh copilot well-formed review span allowed"    block-bad-cli-invocation.sh 0 "$(J 'gh copilot -- -p "review the diff" --model gpt-5.5 -s --no-custom-instructions --disable-builtin-mcps --deny-tool write --deny-tool shell --deny-tool url < /dev/null')"
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

run_settings_present "settings routes Bash(copilot *)" "Bash(copilot *)"
run_settings_present "settings routes Bash(gh copilot *)" "Bash(gh copilot *)"
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
trap 'rm -rf "$SANDBOX" "$MAIN_NO_SPEC" "$MAIN_WITH_SPEC" "$PROBE_CLEAN" "$PROBE_DIRTY" "$PROBE_DOCS" "$PROBE_UNTRACKED" "$PROBE_HOOKFILE" "$PROBE_EXCL"' EXIT

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
trap 'rm -rf "$SANDBOX" "$MAIN_NO_SPEC" "$MAIN_WITH_SPEC" "$PROBE_CLEAN" "$PROBE_DIRTY" "$PROBE_DOCS" "$PROBE_UNTRACKED" "$PROBE_HOOKFILE" "$PROBE_EXCL" "$STALE_SRC" "$STALE_SRC_CLEAN" "$STALE_SRC_STRAY" "$STALE_CHILD" "$STALE_CHILD_STRAY" "$STALE_OSS"' EXIT

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

trap 'rm -rf "$SANDBOX" "$MAIN_NO_SPEC" "$MAIN_WITH_SPEC" "$RANK_FIX" "$RANK_TIE" "$PROBE_CLEAN" "$PROBE_DIRTY" "$PROBE_DOCS" "$PROBE_UNTRACKED" "$PROBE_HOOKFILE" "$PROBE_EXCL" "$SUBR_FIX" "$SUBR_ERRF"' EXIT

printf '\n=== %d pass / %d fail ===\n' "$PASS" "$FAIL"
if [ "$FAIL" -gt 0 ]; then
    printf '\nFailures:\n'
    for line in "${FAILURES[@]}"; do printf '  - %s\n' "$line"; done
    exit 1
fi
exit 0
