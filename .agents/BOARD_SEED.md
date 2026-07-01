# BES Symphony Board Seed

Status: local draft, owner-aligned 2026-04-29.

Purpose: provide the first issue-board shape for Symphony dispatch without
mutating Linear yet. This file is the bridge between the audit specs and the
tracker. Once Linear access and slugs are confirmed in the real tracker, these
items can be created there and then kept in sync through issue URLs.

## Board Conventions

Projects:

| Project | Working slug | Scope |
|---|---|---|
| `BES Control Plane` | `bes-control-plane` | Company-level orchestration, workflow policy, board hygiene |
| `ACTOCCATUD` | `actoccatud` | Private game repo |
| `Floom` | `floom` | Private/pre-public world compiler repo |
| `UsefulIdiots` | `usefulidiots` | Private canonical rebuild repo |
| `IKTO` | `ikto` | Private prototype/design repo |
| `Wick` | `wick` | Public OSS Godot MCP repo |
| `Mimir` | `mimir` | Public OSS memory-governance repo |
| `agentic-installation-methodology` | `agentic-installation-methodology` | Public OSS methodology longread (V1 shipped) |

States:

- `Todo`
- `In Progress`
- `In Review`
- `Done`
- `Canceled`
- `Duplicate`

Labels:

- `repo:<name>`
- `kind:spec`
- `kind:audit`
- `kind:implementation`
- `kind:verification`
- `public-oss`
- `ci-cost`
- `blocked:owner`
- `blocked:secret`
- `blocked:infra`

Issue body template:

```markdown
## Target

- Repo:
- Spec path:
- Source audit:
- Public OSS: yes/no
- Requires network: yes/no
- Requires secrets:
- CI/billing impact:

## Task

## Acceptance Commands

## Completion Report Required

- Files changed
- Commands run and result
- Verification evidence
- Residual risk
- Spec evidence candidates
```

## Seed Issues

### BES Control Plane

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| BES-CP-001 | Create Linear projects, states, labels, and issue template from this seed | `repo:root`, `kind:implementation`, `blocked:secret` | `.agents/BOARD_SEED.md` | Linear contains the projects, states, labels, and issue body template listed above. |
| BES-CP-002 | Decide and document Symphony runner install path | `repo:root`, `kind:spec`, `blocked:owner` | `.agents/specs/2026-04-29-root-control-plane-audit/SPEC.md` | Owner-approved decision: upstream checkout in `Symphony/`, external install, or BES wrapper. |
| BES-CP-003 | Root `.mcp.json` Linux/local config cleanup spec | `repo:root`, `kind:spec`, `blocked:owner` | `.agents/specs/2026-04-29-root-control-plane-audit/SPEC.md` | Spec decides Linux machine config vs example config vs ignored local config. |
| BES-CP-004 | BES Insight TDD disposition | `repo:root`, `kind:audit` | `docs/architecture/bes-insight-tdd.md` from git history | Old plan is archived, superseded, or split into repo specs. |
| BES-CP-005 | BES Integration Architecture TDD disposition | `repo:root`, `kind:audit` | `docs/architecture/bes-integration-architecture.md` from git history | Old plan is archived, superseded, or split into control-plane/repo specs. |
| BES-CP-006 | Posted Godot external-comms record disposition | `repo:root`, `kind:audit` | `external-comms/drafts/2026-04-09-godot-asset-store-discussion.md` from git history | Record is archived or left deleted with owner-approved rationale. |
| BES-CP-007 | Green room product evaluation protocol rollout | `repo:root`, `kind:spec` | `.agents/specs/2026-04-29-green-room-product-evaluations/SPEC.md` | Protocol is linked from root operating docs, remaining handoffs are parallelized, and every active repo has a second-model-verified evaluation packet before roadmap execution. |
| BES-CP-008 | Agent-control file remote cleanup | `repo:root`, `kind:implementation` | owner request 2026-04-30; `.agents/BOARD_SEED.md`; active repo `.gitignore` state | Active repos and root ignore local agent-control state; tracked agent-control files are inventoried with exact safe untrack/delete plan; no product files are changed. |

### ACTOCCATUD

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| ACT-001 | Convert V1 Truth into Symphony epics/issues | `repo:actoccatud`, `kind:spec` | `ACTOCCATUD/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Board-ready issue list has phases, dependencies, rigid/flexible tags, and verify commands. |
| ACT-002 | SYS-PROCEDURAL-ANIMATION production slice 1 spec | `repo:actoccatud`, `kind:spec` | `ACTOCCATUD/docs/plans/2026-04-27-v1-truth.md` | Spec references spike evidence and includes perf/GC acceptance. |
| ACT-003 | HUD remaining sub-areas spec split | `repo:actoccatud`, `kind:spec` | `ACTOCCATUD/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Remaining HUD work is split into dispatchable sub-area specs. |
| ACT-004 | Netcode Phase 3 readiness spec | `repo:actoccatud`, `kind:spec` | `ACTOCCATUD/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Predicted input, peer aggregation, rollback serialization, Steam Sockets, and reconnect work are scoped. |
| ACT-005 | Parallel handoff closeout | `repo:actoccatud`, `kind:spec` | `ACTOCCATUD/.agents/specs/2026-04-29-realignment-handoff/SPEC.md` | In-flight branch is closed or owner-paused, verification gates are named, and green room evaluation is unblocked. |
| ACT-006 | Green room product evaluation | `repo:actoccatud`, `kind:audit` | `.agents/GREEN_ROOM_EVALUATION.md` | `EVALUATION.md`, `ROADMAP.md`, and second-model `VERIFICATION.md` exist locally with final status `verified` or `verified-with-changes`. |

### Floom

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| FLOOM-001 | Wrecklight Drift asset-sheet and showroom spec | `repo:floom`, `kind:spec` | `Floom/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Asset roles, showroom export, package evidence, and ContentStore metadata contract are approved. |
| FLOOM-002 | Generated shallow-3D arena spec | `repo:floom`, `kind:spec` | `Floom/docs/superpowers/plans/2026-04-28-wrecklight-drift-demo-vision.md` | Grammar/profile recipe and deterministic Godot export acceptance are approved. |
| FLOOM-003 | Playability confidence simulation report spec | `repo:floom`, `kind:spec` | `Floom/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Honest minimum metric/report fields are approved. |
| FLOOM-004 | Demo evidence walkthrough spec | `repo:floom`, `kind:spec` | `Floom/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Source, seed, assets, IRs, simulation, package evidence, and Godot scene are tied together. |
| FLOOM-005 | Parallel handoff closeout | `repo:floom`, `kind:spec` | `Floom/.agents/specs/2026-04-29-realignment-handoff/SPEC.md` | In-flight work is closed or owner-paused, verification gates are named, and green room evaluation is unblocked. |
| FLOOM-006 | Green room product evaluation | `repo:floom`, `kind:audit` | `.agents/GREEN_ROOM_EVALUATION.md` | `EVALUATION.md`, `ROADMAP.md`, and second-model `VERIFICATION.md` exist locally with final status `verified` or `verified-with-changes`. |

### UsefulIdiots

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| UI-001 | Systems phase board and order | `repo:usefulidiots`, `kind:spec` | `UsefulIdiots/.agents/specs/2026-04-29-repo-audit/SPEC.md` | All 27 systems are ordered with dependencies and first acceptance commands. |
| UI-002 | SYS-COMMON detailed spec | `repo:usefulidiots`, `kind:spec` | `UsefulIdiots/docs/specs/README.md` | Detailed spec is owner-approved before implementation. |
| UI-003 | SYS-ENTITIES detailed spec | `repo:usefulidiots`, `kind:spec` | `UsefulIdiots/docs/specs/README.md` | Detailed spec is owner-approved and depends on SYS-COMMON explicitly. |
| UI-004 | Archive reference policy | `repo:usefulidiots`, `kind:spec` | `UsefulIdiots/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Agents can cite archive/reference material without importing old drift. |
| UI-005 | Parallel handoff closeout | `repo:usefulidiots`, `kind:spec` | `UsefulIdiots/.agents/specs/2026-04-29-realignment-handoff/SPEC.md` | Skeleton specs and first systems board decisions are closed or owner-paused before green room evaluation. |
| UI-006 | Green room product evaluation | `repo:usefulidiots`, `kind:audit` | `.agents/GREEN_ROOM_EVALUATION.md` | `EVALUATION.md`, `ROADMAP.md`, and second-model `VERIFICATION.md` exist locally with final status `verified` or `verified-with-changes`. |

### IKTO

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| IKTO-001 | Session 3 gameplay-loop concretizing spec | `repo:ikto`, `kind:spec` | `IKTO/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Bootstrap, run length, failures, containment, timers, and boids profiles are decided. |
| IKTO-002 | Clean post-pivot canonical spec | `repo:ikto`, `kind:spec` | `IKTO/docs/plans/2026-04-26-design-pivot-open-questions.md` | Old docs are stamped historical/superseded and docs index points to the clean spec. |
| IKTO-003 | Path 2 flea-swarm spike spec | `repo:ikto`, `kind:spec` | `IKTO/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Flea count, frame budget, and evidence target are approved. |
| IKTO-004 | Avian2D dependency swap | `repo:ikto`, `kind:implementation` | `IKTO/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Cargo check/clippy/fmt/deny pass locally; no CI until owner-approved. |
| IKTO-005 | Parallel handoff closeout | `repo:ikto`, `kind:spec` | `IKTO/.agents/specs/2026-04-29-realignment-handoff/SPEC.md` | Post-pivot status and open Session 3 questions are closed or owner-paused before green room evaluation. |
| IKTO-006 | Green room product evaluation | `repo:ikto`, `kind:audit` | `.agents/GREEN_ROOM_EVALUATION.md` | `EVALUATION.md`, `ROADMAP.md`, and second-model `VERIFICATION.md` exist locally with final status `verified` or `verified-with-changes`. |

### Wick

Public OSS: hold remote changes until a low-noise public wording and CI plan is
approved.

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| WICK-001 | Docs drift closeout batched with meaningful OSS work | `repo:wick`, `kind:spec`, `public-oss`, `ci-cost` | `Wick/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Roadmap/audit/status drift is reconciled without surprise public churn. |
| WICK-002 | Second public-test pass | `repo:wick`, `kind:implementation`, `public-oss`, `ci-cost` | `Wick/docs/planning/2026-04-11-roadmap-to-public-launch.md` | New report records real Godot C# usage and follow-up findings. |
| WICK-003 | GDScript-side bridge auth spec | `repo:wick`, `kind:spec`, `public-oss` | `Wick/STATUS.md` | Editor/runtime bridge auth posture is specified before implementation. |
| WICK-004 | MCP registry handoff closeout | `repo:wick`, `kind:spec`, `public-oss`, `ci-cost` | `Wick/.agents/specs/2026-04-29-wick-mcp-registry-closeout/SPEC.md` | MCP registry branch is locally verified and public actions remain blocked until owner approval. |
| WICK-005 | Green room product evaluation | `repo:wick`, `kind:audit`, `public-oss`, `ci-cost` | `.agents/GREEN_ROOM_EVALUATION.md` | `EVALUATION.md`, `ROADMAP.md`, and second-model `VERIFICATION.md` exist locally with final status `verified` or `verified-with-changes`; no public churn. |

### Mimir

Public OSS: hold remote changes until a low-noise public wording and CI plan is
approved.

| ID | Title | Labels | Source | Acceptance |
|---|---|---|---|---|
| MIMIR-001 | Choose launch cleanup vs spec-authority research | `repo:mimir`, `kind:spec`, `public-oss`, `blocked:owner` | `Mimir/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Owner chooses the next public track before dispatch. |
| MIMIR-002 | Spec authority research design | `repo:mimir`, `kind:spec`, `public-oss` | `Mimir/.agents/specs/2026-04-29-repo-audit/SPEC.md` | Design explains how Mimir could govern specs/delivery evidence without raw memory authority. |
| MIMIR-003 | Pre-1.0 launch cleanup batch | `repo:mimir`, `kind:verification`, `public-oss`, `ci-cost` | `Mimir/docs/launch-readiness.md` | Launch-readiness local gates pass and owner approves any tag/push. |
| MIMIR-004 | Parallel handoff closeout | `repo:mimir`, `kind:spec`, `public-oss`, `ci-cost` | `Mimir/.agents/specs/2026-04-29-realignment-handoff/SPEC.md` | Launch cleanup versus spec-authority direction is closed or owner-paused before green room evaluation. |
| MIMIR-005 | Green room product evaluation | `repo:mimir`, `kind:audit`, `public-oss`, `ci-cost` | `.agents/GREEN_ROOM_EVALUATION.md` | `EVALUATION.md`, `ROADMAP.md`, and second-model `VERIFICATION.md` exist locally with final status `verified` or `verified-with-changes`; no public churn. |

## Dispatch Notes

- Start with private repos unless the owner explicitly selects a public OSS
  task.
- Symphony runner work is blocked until `LINEAR_API_KEY` and real Linear slugs
  are available.
- Public OSS items should avoid doc-only remote churn unless batched with
  meaningful project work.
- Every non-trivial implementation task should point at an approved
  repo-local `SPEC.md` before execution.
