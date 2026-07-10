# BES Model Routing Guide

Status: canonical shared guidance, 2026-04-29.

Purpose: choose the right agent and model for BES fleet work without relying on
memory or taste. This guide is routing policy, not proof of account entitlement.
Before pinning a model in automation, verify it in the relevant model picker or
with an owner-approved probe.

## Source Checkpoints

Re-check provider docs and account model pickers before any
automation pin or long-running multi-agent dispatch. Live sources:

- Claude models:
  <https://platform.claude.com/docs/en/about-claude/models/overview>
- Opus 4.8 GA: <https://www.anthropic.com/news/claude-opus-4-8>
- Copilot-served models:
  <https://docs.github.com/en/copilot/reference/ai-models/supported-models>
- Canonical scores: AA Intelligence Index v4.0 + Vals SWE-bench
  Verified — URLs in the Capability Matrix snapshot below.

Evidence trail:
`specs/2026-06-10-model-stable-matrix-research/RESEARCH.md`.

## Local Inventory

Live surfaces: Claude Code and Copilot CLI (the GPT surface;
unlimited enterprise seat), zero MCP servers — receipts in
`specs/2026-06-05-copilot-cli-cross-validation-lane/SPEC.md`.

## Owner Calibration

HasNoBeef's operating preference for this fleet:

- `gpt-5.5` is the strongest general-purpose OpenAI GPT model currently
  routed for BES. Copilot is the GPT agent surface; `gpt-5.5` is the model.
  Do not refer to a separate "Copilot 5.5" model.
- Claude Opus 4.8 (`claude-opus-4-8`) is the frontier Claude lane
  (GA 2026-05-28). Opus 4.7 and 4.6 are legacy-but-available (same
  price), used only as deliberate legacy/pinned references. Do not
  hard-code model recency as quality: 4.8's promotion is an
  evidence-cited decision, not an automatic newest-is-best bump.
- Claude Sonnet with adaptive behavior, when available in the active surface,
  is a useful first-pass Claude lane for creative/product/design synthesis,
  lower-risk implementation support, and token-heavy drafts that may need
  escalation. Treat automatic escalation behavior as `needs-probe` unless the
  current CLI/docs prove it for the configured run.
- Hard work should use high-thinking modes deliberately: Copilot/GPT high
  reasoning when the surface exposes it; Claude
  `xhigh`, `max` only by exception, and explicit one-off "ultrathink" prompting
  when a review genuinely needs deeper thought.
- Long-context variants are valuable for large repo/doc synthesis, but they
  are not reflexive defaults. Use `opus[1m]`, `sonnet[1m]`, or equivalent
  only when the task clearly benefits and availability is confirmed.
- Weekly usage limits are real scheduling constraints. Route by capability
  fit (Capability Matrix verbs + canonical score), quota/availability, and
  the need for independent model-family review; cost is NOT a routing
  input (canonical statement: Capability Matrix intro).

## Fast Mode Policy

Fast mode (`/fast`, Claude Code CLI) is not a different model — it is Opus with
a speed-prioritised API configuration, ~2.5x faster at identical quality
(<https://code.claude.com/docs/en/fast-mode>). Fleet policy:

- PERMITTED for interactive Opus 4.8 work where latency matters.
- MUST NOT be used in automation, CI, or dispatched/batch lanes
  (determinism; dispatched workers run standard effort tiers).
- If fast mode is used at all, prefer 4.8 fast.

## Access Status

Use these terms in specs and handoffs:

| Status | Meaning |
| --- | --- |
| `configured` | Present in local CLI/config. This proves intent, not entitlement. |
| `documented` | Official provider docs describe the model or alias. |
| `needs-probe` | Confirm with `/model`, model picker, or a deliberate test before relying on it. |
| `approved-for-fleet` | Owner has accepted the model for a role in this guide or a task spec. |

## Capability Matrix

This is the fleet's fit-selection surface: a matrix of choices, not
a linear primary/secondary pick. When routing any work — especially
subagent dispatch — choose by **capability fit**: strength verbs,
canonical score, family independence (cross-validation), and
context-window fit, with availability/quota as an operational
scheduling reality. **Cost is NOT a selection input.** The only
success metric is excellence and quality of deliverables; "not
every task needs a frontier model" means a bounded scan routed to a
fast lane produces an equally excellent deliverable — never that it
saves money. (Per `specs/2026-06-10-model-capability-matrix/SPEC.md`
§7.3, owner-binding.)

Snapshot: 2026-06-10 scores; status/entitlement refreshed 2026-07-10 (Fable-5
needs-probe resolved) — canonical scores per
**AA-Intelligence-Index-v4.0** (Artificial Analysis, vendor-neutral,
10 independently-run evals, ~50% agentic+coding weight:
<https://artificialanalysis.ai/evaluations/artificial-analysis-intelligence-index>);
tiebreaker per **Vals AI SWE-bench Verified** independent re-run,
2026-06-09 (<https://www.vals.ai/benchmarks/swebench>), used to
break canonical ties within ~3 points. Evidence trail:
`specs/2026-06-10-model-stable-matrix-research/RESEARCH.md` §3-§4.

| Model | Family | Surfaces | Tier | Verbs | Canonical (AA v4.0) | Tiebreaker (Vals SWE-V) | Status |
|---|---|---|---|---|---|---|---|
| `claude-fable-5` | claude | claude-code, api | frontier | ORCHESTRATE, IMPLEMENT, OPERATE, SYNTHESIZE, PIONEER | 64.9 | 95.00 | documented; entitlement resolved 2026-07-10 (active session model) |
| `claude-opus-4-8` | claude | claude-code, copilot-cli, api | frontier | IMPLEMENT, ORCHESTRATE, OPERATE, REASON, BACKSTOP | 61 | 88.60 | configured, approved-for-fleet (FRONTIER) |
| `claude-sonnet-4-6` | claude | claude-code, copilot-cli, api | capable | IMPLEMENT, CONVERSE, ABSTRACT | 52 (adaptive/max effort) | — | documented, needs-probe |
| `claude-haiku-4-5-20251001` | claude | claude-code, copilot-cli, api | fast | SCAN, RESPOND, IMPLEMENT (bounded) | needs-probe | — | documented, needs-probe |
| `gpt-5.5` | gpt | copilot-cli, api | frontier | OPERATE, IMPLEMENT, SYNTHESIZE, RETRIEVE | 60 (xhigh) | 82.60 | configured, approved-for-fleet |
| `gpt-5.4` | gpt | copilot-cli, api | capable | IMPLEMENT, SYNTHESIZE | 57 (xhigh) | — | documented, needs-probe |
| `gpt-5.4-mini` | gpt | copilot-cli, api | fast | FAN-OUT, IMPLEMENT (bounded) | needs-probe | — | documented, needs-probe |

Verb evidence: every verb cites a public capability source —
`specs/2026-06-10-model-stable-matrix-research/RESEARCH.md` §4;
cost-framed observations are excluded by contract.

Surfaces caveat: for the Claude rows, `copilot-cli` in the Surfaces column
records where the model is *technically served*, NOT a permitted lane.
Serving a Claude model through Copilot CLI is FORBIDDEN in lane use — it
silently voids cross-family validity (see the Copilot Model Catalog below).
The Claude fleet lane is `claude-code` (or `api`); Copilot CLI is the
GPT-family lane only.

Row-inclusion rule: a model gets a row iff the fleet can dispatch
it as a lane today through a configured surface AND it is a live
fit-selection candidate. Excluded: Opus 4.7/4.6 (legacy pinned
references — see Claude Model Catalog; never new fit-selection
picks), Mythos 5 / Mythos Preview (no BES entitlement),
`gpt-5.5-pro` (no fleet surface, unprobed), the OpenAI `codex`-line
models (`gpt-5.3-codex`, `gpt-5.3-codex-spark`, `gpt-5.2-codex`) and
`gpt-5.2` and older (deprecated / retired with the elapsed codex
subscription), retiring Claude models, non-GPT non-Claude
Copilot models (FORBIDDEN in lane use — see Copilot Model Catalog),
BYOK endpoints.

Known gaps (explicit, per RESEARCH.md §7 — do not paper over):
AA index values for `gpt-5.4-mini` and `claude-haiku-4-5` are
needs-probe (tracked by AA, exact values not yet verified);
Fable 5 is absent from Terminal-Bench/LMArena Text boards
(launched 2026-06-09 — submission lag).

Status refresh 2026-07-10 (refresh trigger (c), needs-probe resolution):
Fable-5's entitlement needs-probe is RESOLVED — it is the active model for
this fleet session, so its row status is updated from `needs-probe`. CAVEAT:
current access is promotional (through 2026-07-12 per the audit) — treat the
resolution as time-limited, not permanent availability, and re-probe before
pinning Fable-5 in any automation or long-running lane. The
local Claude Code harness additionally references `claude-sonnet-5` /
`claude-sonnet-5[1m]` model ids while the capable-tier Claude row here is
`claude-sonnet-4-6` — a probe-candidate for refresh trigger (b); entitlement
is NOT asserted pending an owner-approved probe. The owner reported a possible
new flagship GPT model on 2026-07-10; an entitlement probe per Access Status
was run and REJECTED (`--model gpt-5.6` → "not available" on Copilot CLI
1.0.70), so it stays needs-probe (follow-up tracked in STATUS.md Owner-pending).

Refresh discipline: re-baseline this matrix on (a) an AA index
version bump (a v4 → v5 bump is a deliberate re-baselining event
with owner-visible diff, never a silent number swap), (b) a new
stable-model GA, or (c) a needs-probe resolution. A refresh that
meets every fastpath threshold (one-file, ≤50-line, reversible) MAY
land via `SPEC.fastpath.template.md`; otherwise it is a Task SPEC.
Update the Snapshot line on every refresh.

## GPT Model Catalog (via Copilot)

Verified sources: GitHub Copilot model availability and official OpenAI GPT
model docs. These entries describe GPT models reached through Copilot CLI/API
surfaces; the model name is separate from the serving surface.

| Model | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `gpt-5.5` | configured, documented, approved-for-fleet | Default GPT-family lane for root fleet management, non-trivial specs, complex implementation, integration, risky verification, final synthesis, and strongest OpenAI all-scenario calls. | Bounded fanout scans where depth is not needed — a fast lane delivers the same quality (fit, not savings). |
| `gpt-5.4` | documented, needs-probe | Fallback when `gpt-5.5` is unavailable or a workflow is pinned to GPT-5.4. | Replacing `gpt-5.5` for high-risk work when `gpt-5.5` is available. |
| `gpt-5.4-mini` | documented, needs-probe | Fast read-heavy exploration, parallel document scans, lightweight subagents, low-risk summarization. | Final integration decisions, ambiguous architecture, high-risk edits. |

## Claude Model Catalog

Verified sources: local Claude config and official Claude Code model docs.

| Model or alias | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Bounded fanout and routine edits — fast lanes fit those equally well. |
| `claude-opus-4-8` | configured, documented, approved-for-fleet (FRONTIER) | Frontier Claude lane: cross-validation/review, high-risk implementation review, architecture/spec critique, public-OSS release review, independent second-pass code review. | Bounded fanout and routine edits — fast lanes fit those equally well. |
| `claude-fable-5` | configured, documented; entitlement resolved 2026-07-10 | Top-scored Claude row in the Capability Matrix (AA v4.0 64.9): orchestration, synthesis, high-risk implementation/review, deep multi-step work. Active model for this session. | Cost-driven avoidance (cost is not a routing input); assumes a permanent role before the owner designates one. |
| `claude-opus-4-7` | documented, approved-for-fleet (LEGACY lane-role) | Legacy-but-available frontier predecessor (same $5/$25). Use only as a deliberate pinned/legacy reference; 4.8 is the frontier lane. | New frontier-lane assignments (use 4.8). |
| `claude-opus-4-6` | documented, approved-for-fleet (LEGACY lane-role) | Legacy-but-available (same price). Deliberate legacy/pinned use only. | New frontier-lane assignments (use 4.8). |
| `sonnet` | documented, needs-probe | Creative/product/design synthesis, adaptive first-pass Claude work when configured, daily Claude coding, implementation support, doc synthesis, repo-local work after approved spec. | Highest-risk coding or architecture calls when Opus 4.8 or Copilot-served `gpt-5.5` is available and quota allows. |
| `haiku` | documented, needs-probe | Simple scans, short summaries, low-risk formatting, fast bounded support work. | Complex code edits, final review, ambiguous specs. |
| `opusplan` | documented, needs-probe | Claude-led work where planning should use Opus and execution should use Sonnet. | Work that must stay strictly on one pinned model. |
| `opus[1m]` / `sonnet[1m]` | documented, needs-probe | Long sessions and large-codebase/document synthesis when account support is confirmed. | Default use; verify availability first. |

Official Claude Code guidance says aliases can move over time. Use aliases for
interactive work. Use full model names when reproducibility matters.

## Copilot Model Catalog

GitHub Copilot CLI is a co-equal GPT-family SURFACE; the lane's family
keys on the MODEL served, not the CLI brand.

| Model | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `gpt-5.5` (via Copilot CLI) | approved-for-fleet | Cross-validation/review of Claude-authored work; primary GPT-lane dispatch; second independent GPT opinion when the primary author is not GPT-family. | Cross-validating GPT-authored work — same family. |
| other GPT models on Copilot | needs-probe | Probe with a pinned `--model` before catalog promotion. | Automation pins before a probe. |
| non-GPT models on Copilot | FORBIDDEN in lane use | — | Any lane assignment: serving a Claude model through Copilot silently voids cross-family validity. |
| `--model auto` | FORBIDDEN in lane use | — | Any lane invocation (mechanically blocked by `validate-cli-invocation.sh`). |

Copilot lane rules:

- Pin `--model` explicitly in every lane invocation; `auto` is blocked.
- Copilot-on-GPT MUST NOT be the `cross_validation_lane` for work whose
  `model_route` is GPT-family (SPEC.schema §1.4 different-family rule).
- GPT-surface choice: Copilot CLI is the GPT-family fleet surface for
  implementation, review/cross-validation of Claude work, and GPT-lane
  dispatch. Seat quotas are not a constraint.
- Scripted invocations follow the `cross-agent-cli-invocation` skill
  pattern and are gated by the same PreToolUse hook as claude.

## Routing Matrix

These rows are task-class **starting points**, not assignments. The
fit decision — which model actually carries the work — defers to
the Capability Matrix above (verbs + canonical score + family
independence + context fit). Treat a row as the default opening
position that the matrix can override in either direction.

| Task class | Primary route | Secondary route | Notes |
| --- | --- | --- | --- |
| Root fleet management | Copilot CLI `gpt-5.5` | Claude Opus 4.8 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
| Repo orientation | Copilot CLI `gpt-5.5` or `gpt-5.4-mini` | Claude `sonnet` | Use faster models only for bounded read-only inventory. |
| New non-trivial SPEC | Copilot CLI `gpt-5.5` | Claude Opus 4.8 critique | Claude should review ambiguity before high-risk execution. |
| Spec review | Claude Opus 4.8 or Copilot CLI `gpt-5.5` | Both families for high-risk specs | Use independent cross-family review for public OSS, architecture, security, release, or cross-repo work. |
| Implementation from approved spec | Copilot CLI `gpt-5.5` or Claude Opus 4.8 | Claude `sonnet` for creative/supporting work | Write-capable agents need branch/worktree isolation and file ownership. |
| Fast fanout / document scan | Copilot CLI `gpt-5.4-mini` | Claude `haiku` | Return distilled facts to the root agent; do not let scan agents edit. |
| Multi-agent coding | One lead writer on Copilot CLI `gpt-5.5` or Claude Opus 4.8 | Additional writers only on disjoint files/worktrees | Root fleet manager must define ownership and integration order before edits. |
| Creative/product/design synthesis | Claude `sonnet`, preferably adaptive when configured and available | Claude Opus 4.8 or Copilot CLI `gpt-5.5` for final technical validation | Useful for tone, concepts, narrative, and design exploration; specs still control execution. |
| Code review | Copilot CLI `gpt-5.5` with `code-review` | Claude Opus 4.8 | Findings first, severity ordered, with file/line citations. |
| Public OSS release work | Copilot CLI `gpt-5.5` | Claude Opus 4.8 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
| Green room product evaluation | Copilot CLI `gpt-5.5` or Claude Opus 4.8 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
| Long-context synthesis | Claude Opus 4.8 `[1m]` or Sonnet `[1m]` after probe | Copilot CLI `gpt-5.5` with scoped docs | Use 1M context only when account support is confirmed and the task clearly benefits. |
| Trivial local command | Current root agent | None | Do not spawn agents for simple terminal answers. |

## Approved SPEC Decomposition

The decomposition procedure, TASK.md output contract, cross-family
refusal, AFK/HITL criteria, owner-only status flips, and the
integration gate are canonical in
`file://agents/skills/approved-spec-decomposition/SKILL.md` and
`file://agents/specs/SPEC.schema.md` §1.4.

Model-lane assignment per task class draws from the Routing Matrix
above:

- `task_class: implementation` → primary Copilot CLI `gpt-5.5`,
  cross-validation Claude Opus 4.8 (different family).
- `task_class: code-review` → cross-family from the implementer.
- `task_class: verification` (behavioral) → different family
  from the implementer; mechanical verification (lint, test) MAY
  share family.
- `task_class: research` / `docs` → fast read lanes acceptable
  for the primary; cross-family reviewer for high-stakes claims.

## Capacity and Availability

Weekly model limits and surface outages shift WHEN and WHERE work
runs, never the quality bar — capacity management, not cost
optimization:

| Pressure | Routing adjustment |
| --- | --- |
| Copilot `gpt-5.5` quota healthy | Use Copilot as root lead and primary GPT implementer. |
| Copilot `gpt-5.5` quota constrained | Move independent review/spec critique to Claude Opus 4.8; reserve Copilot for GPT-family integration and verification if possible. |
| Copilot CLI down or unreachable | Pause GPT-lane dispatch or use API only when a SPEC explicitly approves that surface. |
| Claude frontier quota healthy | Use the frontier Claude lane for spec review, second-pass code review, and high-risk repo work where a different model family adds value. |
| Claude frontier quota constrained | Reserve the frontier lane for the riskiest reviews; legacy Opus 4.7/4.6 remain available as deliberate pinned fallbacks if frontier quota is exhausted. |
| Both frontier quotas constrained | Stop parallel frontier fanout. Use fast/read-only models for inventory, then queue owner decisions until frontier capacity returns. |
| Creative work with low code risk | Prefer Claude Sonnet/adaptive when available, then validate implementation-impacting decisions with Copilot CLI `gpt-5.5` or the frontier Claude lane. |

Be frugal on wasteful PROCESS overhead, never on research
(`file://agents/skills/execution-discipline-cluster/SKILL.md`
practice 4). Use frontier models for ambiguity, architecture, code
changes, integration, research, and final calls.

## Dispatch Rules

1. Pick the role before picking the model.
2. Keep the current root agent as the accountable integrator unless a SPEC or
   owner instruction assigns that role elsewhere.
3. Use Claude when an independent opinion is valuable, not just because another
   model exists.
4. Before substantial research, code review, verification, or implementation,
   agents MUST evaluate whether independent work can run in parallel.
5. Agents may initiate Claude or Copilot subagents under approved scope when
   delegation is the correct execution shape. State the worker role, model
   route, allowed files or read-only boundary, expected output, and whether
   edits are allowed.
6. Prefer fanout for independent research, code review, documentation
   inventory, static analysis, independent verification, and bounded read-only
   scans when wall-clock savings exceed coordination cost.
7. Keep local and serial execution for trivial command answers, tightly coupled
   single-file edits, urgent blocking steps, and owner-interactive planning
   unless the owner explicitly requests fanout.
8. Check with the owner when the parallelism decision is unclear,
   quota pressure on a frontier lane is material, or write ownership
   cannot be made disjoint.
9. Read-only agents may share a checkout. Write-capable agents need a separate
   branch or worktree and a bounded approved `SPEC.md`. Mutation-probe agents
   are write-capable by definition and MUST take the worktree path
   (`agents/skills/code-review/references/multi-agent-review.md`).
10. Multiple spec authors/reviewers are encouraged for important work because
   they create better questions and catch weak assumptions.
11. Multiple write-capable agents in one repo require root fleet-manager control:
   disjoint file ownership, separate branches/worktrees when needed, an explicit
   integration order, and a single verifier.
12. For decomposed approved specs, review worker output first for SPEC
    compliance and only then for code quality.
13. For public OSS repos, prefer review/spec work first and avoid public CI churn
   until the owner approves a low-noise PR plan.
14. Use small/fast models for fanout only when the expected answer is bounded and
   easy for the root agent to verify.
15. Final integration, verification interpretation, and release decisions stay
    with a frontier model unless the owner accepts the risk.
16. Green room product evaluations are a required post-handoff phase for active
    repos. Do not convert a roadmap into implementation specs until a different
    model family has verified the evaluation packet.
17. Before dispatch, predict known failure modes in the prompt: environment
    gates, stale authority docs, owner decisions, public-OSS constraints,
    model quota, and whether verifier output is allowed to edit files.
18. Claude CLI `-p` runs can be silent for several minutes on long read-heavy
    reviews. Set an expected wait budget in the root status update and do not
    interrupt solely because no text has streamed. Interrupt only when the
    process exits badly, violates scope, exceeds the planned wall-clock budget,
    or the owner asks to stop.
19. Do not use Claude `--permission-mode dontAsk` for tasks that must write
    approved files. In non-interactive runs it can deny `Write` and `Bash`.
    Use a writer-capable mode with strict allowed files, or make the Claude run
    return full markdown and have the root fleet manager write it.
20. Rule 20: Cross-family review is REQUIRED — not merely recommended — on any
    **fleet-propagating guardrail SPEC**: a SPEC whose touch points include
    paths carried by the propagation manifests
    (`agents/scripts/fleet-files.txt`, `fleet-hooks.txt`, `fleet-skills.txt`,
    `fleet-commands.txt`). REQUIRED at two gates: before the artefact
    transitions to `approved-pending-owner` (spec review) and before the
    parent SPEC flips to `verified` (execution diff review). The
    `same-family-review` escape hatch applies only to non-guardrail work.
    Adopted 2026-06-10 after four consecutive guardrail SPECs where
    cross-family review caught defects same-family work missed
    (`specs/2026-06-09-mutation-probe-isolation-discipline/SPEC_EVIDENCE.md`
    SE1; owner-directed). This is the SINGLE CANONICAL statement of the
    cross-family rule (WS-GATES,
    `file://specs/2026-06-30-operating-model-lean-down/SPEC.md` §7); the
    spec-review, code-review, and verification skills cite it rather than
    restating it. Classification check (2026-07-02): classify by grepping
    the diff's touch points against the propagation manifests — the class
    is touch-point-defined, and intent framing ("machinery", "just docs")
    is not an exemption; three same-day misclassifications each hid real
    review-caught defects
    (`file://specs/2026-07-01-propagation-machinery-fixes/SPEC_EVIDENCE.md`
    SE-5). There is deliberately NO waiver mechanism (owner-affirmed
    2026-07-02 against a recorded-waiver alternative: every waived or
    misclassified review that week hid real defects, while the rule's one
    hard stop proved correct). If the cross-family lane is unavailable,
    the work HOLDS; a per-case owner override remains possible only as an
    explicit in-transcript directive — an owner action, not a rule
    feature.

## Standard Prompts

Claude independent spec review:

```bash
claude -p \
  --model opus \
  --permission-mode plan \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}' \
  "Read AGENTS.md, CLAUDE.md, WORKFLOW.md, and the target SPEC.md. Review only. Return blockers, ambiguity, unsafe assumptions, missing verification, and owner decisions. Do not edit files."
```

Claude bounded repo worker after approved spec (frontier lane):

```bash
claude \
  --model claude-opus-4-8 \
  --effort xhigh \
  --permission-mode default \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}'
```

Claude deep technical review (frontier lane):

```bash
claude -p \
  --model claude-opus-4-8 \
  --effort xhigh \
  --permission-mode plan \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}' \
  "Read the named source docs and current diffs. Review only. Return deep technical risks, correctness concerns, missing tests, and decision points. Do not edit files."
```

Claude creative/product synthesis:

```bash
claude -p \
  --model sonnet \
  --permission-mode plan \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}' \
  "Read the named source docs. Produce creative/product synthesis only. Use adaptive behavior if this Claude surface supports it. Do not create implementation instructions unless explicitly requested."
```

Copilot read-only review (co-equal GPT lane; scripted):

```bash
gh copilot -- -p "$(cat specs/<id>/reviews/PROMPT.md)" \
  --model gpt-5.5 \
  -s \
  --no-custom-instructions \
  --disable-builtin-mcps \
  --deny-tool write --deny-tool 'shell' --deny-tool 'url' \
  < /dev/null
```

Deny write/shell/url for read-only review/scan posture; never add
`--allow-all-tools`. Pin `--model` explicitly (`auto` is blocked by
the validator). The `< /dev/null` stdin redirect is RECOMMENDED for
non-interactive scripted invocations.

Copilot GPT repo worker:

```bash
gh copilot -- -p "$(cat prompts/WORKER.md)" \
  --model gpt-5.5 \
  --no-custom-instructions \
  --disable-builtin-mcps \
  < /dev/null
```

Copilot GPT fast read-only scan:

```bash
gh copilot -- -p "<prompt>" \
  --model gpt-5.4-mini \
  --no-custom-instructions \
  --disable-builtin-mcps \
  --deny-tool write --deny-tool 'shell' --deny-tool 'url' \
  < /dev/null
```

Treat these as templates. Every actual dispatch prompt must name the repo,
spec path, allowed files, verification gate, and whether edits are allowed.

## MCP Note

Model routing does not approve MCP usage; the zero-active-MCP
default is canonical in `.agents/mcp/README.md`. Keep
`--strict-mcp-config --mcp-config '{"mcpServers":{}}'` for Claude
dispatch unless a task spec explicitly approves MCP use.

## Verification Commands

Use these when refreshing the catalog:

```bash
gh copilot --help
claude --version
claude mcp list
rg -n "model|advisorModel" /var/home/hasnobeef/.claude/settings.json /var/home/hasnobeef/.claude.json
node agents/scripts/preflight.mjs
node .agents/scripts/preflight.mjs
```

Use model probes only when the owner approves the spend/noise:

```bash
gh copilot -- -p "Reply with the active model name if available." --model gpt-5.4-mini --no-custom-instructions --disable-builtin-mcps < /dev/null
claude -p --model opus --permission-mode plan --strict-mcp-config --mcp-config '{"mcpServers":{}}' "Reply with the active model name if available."
```
