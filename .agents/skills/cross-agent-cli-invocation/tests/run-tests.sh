#!/usr/bin/env bash
# tests/run-tests.sh — skill-local test harness for
# cross-agent-cli-invocation. Defers to the helper's --self-test
# and adds skill-level integration cases.
#
# Run from anywhere — resolves paths relative to this file.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
# Try to locate the helper via the same fleet-aware resolution the
# helper itself uses.
HELPER=""
for candidate in \
    "${CLAUDE_PROJECT_DIR:-}/agents/scripts/validate-cli-invocation.sh" \
    "${CLAUDE_PROJECT_DIR:-}/.agents/scripts/validate-cli-invocation.sh" \
    "$SKILL_DIR/../../scripts/validate-cli-invocation.sh"
do
    if [ -x "$candidate" ]; then
        HELPER="$candidate"
        break
    fi
done

if [ -z "$HELPER" ]; then
    echo "FAIL: validate-cli-invocation.sh not found" >&2
    exit 1
fi

pass=0
fail=0

# 1. Defer to helper's embedded self-test.
echo "=== helper --self-test ==="
if bash "$HELPER" --self-test; then
    pass=$((pass + 1))
    echo "PASS: helper --self-test"
else
    fail=$((fail + 1))
    echo "FAIL: helper --self-test"
fi

# 2. Skill-level: known-good lists exist and parse.
echo "=== known-good lists present ==="
for kg in claude.txt copilot.txt; do
    if [ -f "$SKILL_DIR/known-good/$kg" ]; then
        pass=$((pass + 1))
        echo "PASS: known-good/$kg exists"
    else
        fail=$((fail + 1))
        echo "FAIL: known-good/$kg missing"
    fi
done

# 3. Skill-level: known-good headers present.
echo "=== known-good headers ==="
for kg in claude.txt copilot.txt; do
    if grep -q '^# refreshed:' "$SKILL_DIR/known-good/$kg" && \
       grep -q '^# cli-version:' "$SKILL_DIR/known-good/$kg" && \
       grep -q '^# help-source:' "$SKILL_DIR/known-good/$kg"; then
        pass=$((pass + 1))
        echo "PASS: known-good/$kg has refresh/cli-version/help-source headers"
    else
        fail=$((fail + 1))
        echo "FAIL: known-good/$kg missing required headers"
    fi
done

# 4. Skill-level: claude/copilot known-good lists have admin-subcommands blocks.
echo "=== admin-subcommands blocks ==="
if grep -q '^# BEGIN admin-subcommands' "$SKILL_DIR/known-good/claude.txt" && \
   grep -q '^# END admin-subcommands' "$SKILL_DIR/known-good/claude.txt" && \
   grep -q '^# BEGIN admin-subcommands' "$SKILL_DIR/known-good/copilot.txt" && \
   grep -q '^# END admin-subcommands' "$SKILL_DIR/known-good/copilot.txt"; then
    pass=$((pass + 1))
    echo "PASS: claude.txt/copilot.txt admin-subcommands blocks present"
else
    fail=$((fail + 1))
    echo "FAIL: claude.txt/copilot.txt admin-subcommands block missing"
fi

# 5. Skill-level: SKILL.md cross-references the helper and mentions Agent().
echo "=== SKILL.md references ==="
if grep -qF "validate-cli-invocation.sh" "$SKILL_DIR/SKILL.md" && \
   grep -qF "Agent()" "$SKILL_DIR/SKILL.md"; then
    pass=$((pass + 1))
    echo "PASS: SKILL.md cross-references helper + Agent() naming clarity"
else
    fail=$((fail + 1))
    echo "FAIL: SKILL.md missing required cross-references"
fi

printf '\nrun-tests summary: %d PASS, %d FAIL\n' "$pass" "$fail"
[ "$fail" -eq 0 ]
