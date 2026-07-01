# BES Green Room Product Evaluation Protocol

Status: canonical shared guidance, 2026-04-29.

Purpose: define the post-handoff evaluation pass that gets each active product
repo back onto a verified, spec-first roadmap. This protocol is for full
engineering quality, code quality, product status, roadmap, and next-build
evaluation after immediate in-flight handoffs are cleanly closed or paused.

## Core Rule

Every active repo gets an isolated primary evaluation by one agent/model and an
independent second-model verification before its roadmap is treated as
actionable.

The evaluation is a green room run:

- Start from checked-in repo instructions, approved specs, status docs, current
  code, command output, and owner instruction.
- Do not use raw chat history, memory stores, or prior agent summaries as
  authority.
- Do not implement product changes.
- Do not edit public docs unless a separate approved spec allows it.
- Do not push, publish, tag, or open PRs during the evaluation.

## Required Pairing

Use different model families for the primary and verifier when capacity allows.

| Primary evaluator | Required verifier |
|---|---|
| Copilot `gpt-5.5` | Claude Opus 4.8 |
| Claude Opus 4.8 | Copilot `gpt-5.5` |
| Claude Sonnet/adaptive | Copilot `gpt-5.5` or Claude Opus 4.8 |
| Smaller read-only model | Frontier model verifier required |

For public OSS repos (`Wick`, `Mimir`), prefer Copilot `gpt-5.5` primary with
Claude Opus 4.8 verification, or the reverse, and keep all outputs local
until the owner approves public wording and CI cost.

## Parallel Handoff Rule

Remaining repo handoffs should run in parallel where the write scopes are
disjoint. Each handoff worker may write only inside its assigned repo's
`.agents/specs/` path unless the root fleet manager explicitly expands scope.

Green room evaluation for a repo may start only after that repo's handoff lane
is closed or the owner explicitly marks the in-flight work paused.

## Pre-Dispatch Prediction

Before launching a green room primary or verifier, the root fleet manager must
predict the likely sources of wasted time and put them in the prompt:

- known environment gates, such as missing host packages or required containers;
- known public/private constraints and CI-cost limits;
- known stale or superseded authority docs to inspect carefully;
- owner decisions that a worker must not guess;
- subjective acceptance criteria that must be resolved in a future executable
  spec instead of guessed by the evaluator;
- whether the run is allowed to write files or must only return markdown;
- expected CLI behavior, including long silent Claude `-p` runs.

Workers must classify failures as one of:

- `expected`: predicted environment or policy issue, recorded as evidence;
- `new`: unpredicted failure requiring triage;
- `owner-blocking`: a product or release choice the owner must answer.

Do not spend time rerunning a predicted failure unless the rerun tests a
specific fix or approved environment change.

Green room roadmaps may propose candidate metrics or options, but they must not
turn evaluator opinions into execution authority. If a future spec needs a
quality bar, gameplay threshold, public-release standard, or design acceptance
criteria, the roadmap must route that to an owner-approved executable spec or
planning/design spec.

## Output Location

Each repo evaluation writes a local agent-control packet:

```text
<repo>/.agents/specs/YYYY-MM-DD-green-room-product-evaluation/
  EVALUATION.md
  VERIFICATION.md
  ROADMAP.md
```

These files are task-control artifacts. Durable product docs may be promoted to
repo-native docs only after owner approval and a separate implementation spec.

## Evaluation Sections

`EVALUATION.md` must include:

- Repo, branch, commit, dirty state, and public/private classification.
- Primary agent, model, reasoning mode, date, and whether network was used.
- Sources read, with file paths and command outputs.
- Current product thesis and target user.
- Current status versus last known roadmap/status docs.
- Engineering quality: architecture, build/test health, CI, dependency risk,
  observability, security, release posture, and operational risk.
- Code quality: maintainability, test coverage, complexity hot spots, stale
  code, duplication, unsafe assumptions, and correctness risks.
- Product quality: feature completeness, UX/gameplay/demo readiness, asset and
  content readiness, and user-facing gaps.
- Roadmap assessment: what is done, what is blocked, what is stale, what is the
  critical path, and what can be cut.
- Next-build plan: the smallest sequence of specs needed to move the product
  measurably toward green.
- Proposed issue list with dependencies, risk, verification gates, and model
  routing recommendation.
- Owner decisions needed before implementation.
- Residual risk and evidence gaps.

`ROADMAP.md` must be the clean operator view:

- One-page current state.
- Milestones in execution order.
- Critical path items.
- Parallelizable work.
- Work that should not start yet.
- Proposed first three executable specs.

`VERIFICATION.md` must include:

- Verifier agent, model, reasoning mode, date, and scope.
- A clear statement that the file is verifier output, not owner approval.
- Whether the verifier agrees with each major finding.
- Findings the primary missed.
- Findings that are unsupported or overstated.
- Roadmap changes required before dispatch.
- Final status: `verified`, `verified-with-changes`,
  `blocked-pending-owner-input`, or `rejected`.
- If status is `blocked-pending-owner-input`, list the exact owner decisions
  required before the packet can become executable roadmap authority.

## Required Commands

Each repo evaluation must run the repo-local orientation and verification
commands that are safe for an audit. At minimum:

```bash
git status --short --branch
git log --oneline --decorate -n 12
git diff --name-status
```

Run build/test/lint gates when they are documented and safe. If a gate is not
run, record why.

The root fleet manager runs:

```bash
node .agents/scripts/preflight.mjs
```

## Safety Invariants

- Handoffs first. Do not start green room evaluation for a repo with unresolved
  in-flight work unless the owner explicitly marks that work paused or closed.
- One primary evaluator per repo packet.
- One independent verifier per repo packet, using a different model family.
- No implementation, cleanup, staging, or product-doc publishing in evaluation
  runs.
- No two write-capable agents in the same repo/worktree.
- Public OSS outputs remain local until owner approval.
- The final roadmap is not actionable until `VERIFICATION.md` is `verified` or
  `verified-with-changes`. `blocked-pending-owner-input` is useful evidence,
  but it is not executable roadmap authority.
- A verified roadmap still requires owner-approved executable specs before
  implementation.

## Dispatch Prompt Template

Primary evaluator:

```text
You are running a BES green room product evaluation for <repo>.
Read root AGENTS.md, .agents/OPERATING_MODEL.md,
.agents/GREEN_ROOM_EVALUATION.md, .agents/MODEL_ROUTING.md, and the target
repo AGENTS.md, CLAUDE.md, WORKFLOW.md, STATUS.md, handoff specs, and linked
docs. Do not use memory or chat history as authority. Do not implement.
Create <repo>/.agents/specs/<date>-green-room-product-evaluation/EVALUATION.md
and ROADMAP.md. Include sources, commands, quality findings, critical path,
next specs, and owner decisions.
```

Second-model verifier:

```text
You are independently verifying the BES green room product evaluation for
<repo>. Use a different model family from the primary evaluator. Read the root
protocol, repo instructions, EVALUATION.md, ROADMAP.md, current repo docs, and
safe command output. Do not implement. Write VERIFICATION.md with blockers,
unsupported claims, missing risks, roadmap corrections, and final status.
```
