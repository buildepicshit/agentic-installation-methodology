# Multi-Agent Review Workflows — mutation probes, isolation, tree hygiene

Extracted to `references/` per the progressive-disclosure
convention. This file is the SINGLE canonical home of the
mutation-probe mechanics; every other fleet surface carries a
one-line pointer here and MUST NOT restate them.

Authority:
`file://specs/2026-06-09-mutation-probe-isolation-discipline/SPEC.md`.

## When to read this

- You are orchestrating a multi-agent review workflow (review
  lenses → adversarial verification → optional mutation probes).
- You are about to dispatch ANY agent that will deliberately edit
  source files as a test of suite strength.
- You just ran such a workflow and are about to commit or run a
  golden/replay operation.

## Definition

A **mutation probe** (file-mutating probe) is an agent step that
deliberately edits source files to test suite strength — ablation
or mutation testing: zero a constant, flip a sign, re-scope a
filter — as distinct from ordinary implementation edits, generated
test fixtures, or scratch writes outside the repo.

Not to be confused with two unrelated fleet senses of "probe":
model-availability probes (`file://agents/MODEL_ROUTING.md`) and
the dual-reader ambiguity probe
(`file://agents/skills/evidence-cluster/SKILL.md`), neither of
which touches files.

## Rule 1 — Mechanical isolation (MUST)

- A mutation probe MUST run under mechanical isolation: the
  Agent/Workflow `isolation: "worktree"` option, or an explicit
  `git worktree add` the probe itself creates as its FIRST action.
- A mutation probe MUST NOT write to the orchestrating session's
  working tree. Prompt-level isolation instructions are NOT
  enforcement — prompt-level isolation has already failed in
  production (see the authority SPEC).
- The isolation invariant MUST hold even if the probe dies
  mid-flight: restore steps cannot be trusted to run, so the
  PRIMARY tree must never need restoring.
- Mutation-probe agents are write-capable BY DEFINITION — never
  dispatch one as a "read-only reviewer" sharing the checkout.

## Rule 2 — Probe protocol inside the worktree (MUST)

Per mutant: save the original → mutate → run the suite → restore →
verify zero git delta (`git diff --exit-code`). Digest-verified
restore (sha256 of saved original vs restored file) is RECOMMENDED.

Marker convention: every injected mutation MUST carry the literal
`MUTATION PROBE` (uppercase, exact) in a comment on or adjacent to
the mutated line. The marker is what makes residue sweeps
mechanical.

Cleanup: on normal completion the probe removes its own worktree.
After abnormal death, the ORCHESTRATOR prunes orphan probe
worktrees (`git worktree list`, `git worktree prune`) as part of
the hygiene gate below — orphan probe worktrees are agent
artifacts, so removing them never collides with the no-delete
Safety Invariant.

## Rule 3 — Post-workflow tree-hygiene gate (MUST)

After ANY workflow that dispatched file-mutating agents, and
BEFORE any commit or golden/replay operation, the orchestrator
MUST verify the primary tree:

1. Diff against the pre-workflow state (`git status` /
   `git diff` vs the recorded baseline), AND/OR
2. Marker sweep from the repo root:

```bash
repo_root=$(git rev-parse --show-toplevel)
git -C "$repo_root" grep --untracked -I -l -e "MUTATION PROBE" \
  -- ':!*.md' ':!specs' ':!.agents/specs' ':!.claude/hooks/tests' \
     ':!.claude/hooks/block-probe-residue.sh'
```

No output (exit 1) = clean. Any listed file is probe residue:
restore it before proceeding.

Mechanical backstop: the `block-probe-residue.sh` PreToolUse hook
runs this sweep on every `git commit` and blocks (exit 2) while
residue is present. Layer separation: the hook is the mechanical
CODE-surface gate; markdown and spec-corpus surfaces are excluded
because they legitimately quote the marker convention (feedback
entries, journals, captured review transcripts), so doc-surface
residue is covered by step 1's diff and by cross-family diff
review, not by the hook.

## Reviewer carve-out

The code-review Hard Rule "Cross-validation reviewers MUST NOT
edit files during review" stands. Mutation probes are the sole
sanctioned exception, and only because they never count as edits
to the reviewed tree: they run exclusively in disposable isolated
worktrees under Rules 1-2. A probe that would touch the shared
tree is not a sanctioned probe; it is a contract violation.
