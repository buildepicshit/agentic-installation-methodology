---
name: cross-agent-cli-invocation
description: "Use when you (an agent) intend to invoke another agent's CLI from Bash — claude calling copilot, copilot calling claude, or any equivalent cross-agent pattern. Read at session start whenever you might fire `claude` or `copilot` from a Bash tool call. The skill documents the gotchas, points at the validator helper, and explains where the mechanical block fires."
license: internal-only
compatibility:
  - claude
  - copilot
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls: []
    borrowed_from: []
    upstream_status: not-applicable
    last_audited: 2026-06-22
    audit_cadence: annual
    adoption_status: bes-native
    security_review: not-required
    notes: "BES fleet-native skill."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Cross-Agent CLI Invocation

Use this skill whenever you intend to invoke another agent's CLI
from Bash. Failure to read it has cost real session time:
documented wrong-flag-combination on `claude` calls from scripted
contexts (ACTOCCATUD 2026-05-25 observation), and Copilot lane
invocations must pin an explicit GPT-family model to preserve
cross-family validity.

The fleet-canonical contract for this skill is at
`specs/2026-05-25-agent-cli-invocation-craft/SPEC.md`.

## When to Use

- Before firing any `claude ...` Bash command (agent-invocation
  patterns, not administrative subcommands like `claude --version`).
- Before firing any `copilot ...` or `gh copilot ...` Bash command for
  a review / validation lane.
- When authoring or reviewing a SPEC that includes cross-agent CLI
  invocations in its acceptance commands or execution plan.

Do NOT use this skill for:
- In-process Claude `Agent()` / Task tool invocations — those are
  NOT CLI calls; see "Not in scope" below.
- Claude or Copilot administrative subcommands — those are exempt per
  the admin-subcommand allowlists in `known-good/claude.txt` and
  `known-good/copilot.txt`.

## Minimum-Viable Invocations

### Copilot -> claude (the wrong-flag gotcha)

```bash
claude --print "your prompt"
```

Required:
- `--print` (or alias `-p`) for non-TTY / scripted invocations.
  Without it, claude opens an interactive session and hangs.
- A prompt argument.

Documented "only works with --print" flags (per `claude --help`):
- `--output-format`
- `--input-format`
- `--fallback-model`
- `--max-budget-usd`
- `--no-session-persistence`

Using any of these without `--print` is BLOCKED by the validator.

### Claude -> copilot (the co-equal GPT lane)

Adopted per `specs/2026-06-05-copilot-cli-cross-validation-lane/SPEC.md`
(bes-fleet-policy). The executable resolves as bare `copilot` when on
PATH, else the `gh copilot --` wrapper (the common case on BES boxes).

```bash
gh copilot -- -p "$(cat reviews/PROMPT.md)" \
  --model gpt-5.5 \
  -s \
  --no-custom-instructions \
  --disable-builtin-mcps \
  --deny-tool write --deny-tool 'shell' --deny-tool 'url' \
  < /dev/null
```

Required:
- `-p/--prompt` with prompt text — without it, copilot opens an
  interactive session and wedges a scripted context (validator FAIL).
- An explicit GPT-family `--model` pin. `--model auto` is FORBIDDEN
  in lane use and mechanically blocked (validator FAIL): Copilot can
  serve non-GPT models, which silently voids cross-family validity.

Recommended (validator WARNs when missing):
- `--no-custom-instructions` and `--disable-builtin-mcps` — fleet
  zero-MCP default; don't let target-repo instructions steer a lane
  reviewer.
- Permission scoping: built-in read/search tools need no grant
  (probed 2026-06-05); `--deny-tool write --deny-tool shell
  --deny-tool url` alone yields a read-only review posture. Deny
  rules beat any allow rule (per `copilot help permissions`). A
  bare `--allow-all*` grant without deny/availability scoping draws
  a WARN.
- `< /dev/null` stdin redirect — WARN-level hygiene for scripted use.

Family rule: Copilot-on-GPT MUST NOT be the `cross_validation_lane`
for GPT-authored Copilot work — same family. Route per
`.agents/MODEL_ROUTING.md` "Copilot Model Catalog".

Admin subcommands (`login`, `version`, `update`, `help`, `mcp`,
`plugin`, `completion`, `init`, `--version`, `--help`, `--remove`)
are exempt from the scripted-span rules.

## The Validator

The fleet ships a validator at
`agents/scripts/validate-cli-invocation.sh` (or
`.agents/scripts/validate-cli-invocation.sh` in propagated child
repos). You can dry-run a proposed invocation yourself:

```bash
bash agents/scripts/validate-cli-invocation.sh \
  'gh copilot -- -p "p" --model gpt-5.5 --no-custom-instructions --disable-builtin-mcps < /dev/null'
```

Exit codes:
- `0` — PASS (all detected invocations OK).
- `1` — WARN-only (advisory; safe to proceed).
- `2` — FAIL (the call would be blocked; fix the invocation).

The validator runs automatically on Claude Code Bash tool calls
via the `block-bad-cli-invocation.sh` PreToolUse hook
registered in `.claude/settings.json`. If your Bash call matches
`claude *`, `copilot *`, or `gh copilot *`, the hook fires; FAIL
blocks the call.

## Scope boundary

V1 of this contract mechanically blocks ONLY Claude Code Bash
calls — the `.claude/hooks/` PreToolUse channel is Claude-only.

If you are a Copilot agent intending to invoke `claude` from Bash:
1. Read this skill.
2. Run the validator yourself BEFORE firing the call:
   `bash .agents/scripts/validate-cli-invocation.sh "<your-cmd>"`.
3. If exit != 0, do not fire the call unless the nonzero result is an
   accepted WARN-only case.

## Refresh

CLI flag inventories drift across releases. To regenerate the
known-good list for a CLI:

```bash
bash agents/scripts/validate-cli-invocation.sh \
  --refresh-known-good claude       # parses `claude --help`
bash agents/scripts/validate-cli-invocation.sh \
  --refresh-known-good copilot      # parses `copilot --help` or `gh copilot -- --help`
```

## Not in scope: `Agent()` in-process invocation

The Claude `Agent()` tool and Task tool dispatch are in-process —
they invoke subagents inside Claude Code without spawning a
shell. They are NOT CLI invocations and the gotchas in this skill
do NOT apply to them.

For subagent dispatch patterns see
`file://agents/MODEL_ROUTING.md` (model and agent selection) and
`file://agents/skills/approved-spec-decomposition/SKILL.md`
(TASK.md dispatch shape).

## Hard Rules

- Do not invoke `claude ...` in a scripted / non-TTY context
  without `--print` (or `-p`).
- Do not invoke `claude` with a "only works with --print" flag
  (per the combination-rules block) without also passing
  `--print`.
- Do not invoke Copilot lane review without an explicit GPT-family
  `--model` pin.
- Do not bypass the validator by quoting forbidden patterns into
  unrelated commands (the validator's span-scoping defeats
  obvious bypass attempts).
- Do not edit `known-good/claude.txt` or `known-good/copilot.txt`
  manually — use `--refresh-known-good` so the `# refreshed`
  timestamp + `# cli-version` + `# help-source` lines are
  regenerated correctly.

## Command-classifier hooks: the option-ARGUMENT bypass class (2026-06-10)

When authoring or reviewing a PreToolUse hook that classifies shell
commands by verb position, the recurring bypass class is option
ARGUMENTS (not options) between the binary and the subcommand:
`git -C <path> commit`, `git -c <k>=<v> commit`, and separated-value
`--git-dir <path>` all carry dash-less tokens that break naive
`(-[^ ]+)*` matchers, and quote-stripping preprocessors destroy
quoted values needed later. Mitigations (proven in
`file://.claude/hooks/block-probe-residue.sh` and ported to the
sibling commit hooks): classify with explicit value-carrying-option
alternations; re-extract values quote-aware from the RAW payload;
when a target is unresolvable, fall back to a safe default rather
than failing open. Evidence:
`file://specs/2026-06-09-mutation-probe-isolation-discipline/SPEC_EVIDENCE.md`
SE3 (dispositioned ACCEPT).

Second confirmed instance of the class (2026-06-10): name-based
FILE LOOKUPS from untrusted tool-input tokens. A hook that resolves
`<dir>/<token>.md` from a tool parameter (e.g. `subagent_type` ->
agent-definition file) is suppressible via a crafted traversal
token (`../plugins/evil`) unless the lookup is gated on a safe-name
pattern (no path separators, no dot segments — e.g.
`^[A-Za-z0-9][A-Za-z0-9_:-]*$`) with unsafe names taking the
fail-safe branch. Pair the gate with decoy-file tests proving
suppression is impossible. Evidence:
`file://specs/2026-06-10-model-capability-matrix/SPEC_EVIDENCE.md`
SE-B (dispositioned ACCEPT; exploit reproduced by the cross-family
reviewer against `warn-subagent-routing.sh` and fixed same-day).

## Helper output as evidence

The validator's PASS/WARN/FAIL output is structured. When a
completion-phase skill (`verification`,
`spec-evidence-governance`) cites helper output as evidence, paste
the helper's exact stdout/stderr rather than paraphrasing — that
makes the receipt auditable.
