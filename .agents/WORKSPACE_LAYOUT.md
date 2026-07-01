# BES Root Workspace Layout

Status: canonical machine-local placement guidance, 2026-04-29.

The root checkout is the BES control plane. It is not a product monorepo and it
is not a general downloads folder. Agents use this file to decide whether a
path is active product work, orchestration policy, local tooling, asset storage,
or scratch/runtime state.

## Control Plane

| Path | Role | Git posture |
|---|---|---|
| `AGENTS.md` | Cross-agent root entrypoint | tracked |
| `CLAUDE.md` | Claude root entrypoint importing root policy | tracked |
| `WORKFLOW.md` | Company-level engagement contract | tracked |
| `.agents/` | Specs, skills, workflows, preflight, layout policy | tracked |
| `.claude/commands/` | Claude command wrappers for shared workflows | tracked |
| `.claude/skills/` | Claude-native mirrors of shared skills | tracked |
| `.claude/settings.json` | Portable Claude project settings | tracked |
| `.claude/settings.local.json` | Per-user Claude permissions/secrets | ignored |
| `.copilot` | Copilot local scratch/state | ignored |

## Active Product Repos

These directories are independent repos. Root agents may read them for
orientation, but product edits happen inside the target repo and its own
`AGENTS.md`/`WORKFLOW.md` contract.

- `ACTOCCATUD/`
- `agentic-installation-methodology/`
- `bes-fleet-runtime/`
- `Floom/`
- `IKTO/`
- `Mimir/`
- `UsefulIdiots/`
- `Wick/`

## Business Administration Workspace

| Path | Role | Rule |
|---|---|---|
| `BESAdmin/` | Owner business administration workspace for BES operations | tracked by root workspace policy; not a product repo; no engineering SPEC ceremony by default |

## Repo-Local Product Roots

When this policy is propagated into a product repo, preflight classifies that
repo's top-level entries from two layers:

1. common product-repo entries such as agent entry docs, `.agents/`, `.claude/`,
   `.copilot`, `.git`, `.mcp.example.json`, `.mcp.json`, `docs/`, `tools/`,
   `IDEATION.md`, and `STATUS.md`;
2. explicit repo-local product roots declared in this source policy and mirrored
   in `agents/scripts/preflight.mjs`.

Repo-local product roots are not global approvals. Add a product-specific root
here only when it is intentionally part of that repo's source or product
surface, then update `agents/scripts/preflight.mjs` and propagate from
`bes-fleet-policy`.

Tools distinguishing the policy source repo from propagated child layouts MUST
use the positive marker `.agents/scripts/fleet-skills.txt`: child repos have it,
and a source repo is identified by its absence. Do not rely on the bare
`.agents/` directory; `bes-fleet-policy` can carry a stray empty one
(`file://specs/2026-06-22-fleet-sync-self-reconcile/SPEC_EVIDENCE.md` SE-3).

| Repo | Root | Role | Git posture |
|---|---|---|---|
| `IKTO` | `unity/` | Unity prototype/product root | tracked in IKTO |

## Local Tooling And External Software

| Path | Role | Rule |
|---|---|---|
| `tools/` | Local tool checkouts, MCP servers, SDK experiments | ignored by default; promote only small wrappers/docs intentionally |

Do not assume tools under `tools/` are production source. Treat them as local
runtime dependencies unless a spec explicitly promotes a wrapper or document.

## Assets, Downloads, And Sandboxes

| Path | Role | Rule |
|---|---|---|
| `Assets/` | Local art/audio/model/download holding area | ignored |
| `Assets/Downloads/` | Download intake inside asset storage | ignored |
| `ModelSandbox/` | Local model/asset experiments | ignored |
| `NewIdeas/` | Local idea intake | ignored; promote into specs/docs before product work |
| `content_store.db.backup` | Local database backup | ignored |

Agents must not move, delete, normalize, or publish these paths without a
specific approved migration spec. Inventory first, then propose moves.

## MCP Config Policy

- `.mcp.json` is active machine-local config and must stay ignored/untracked.
- `.mcp.example.json` files are checked-in examples and must not contain real
  secrets. Current examples intentionally define no default servers.
- `.agents/mcp/approved-defaults.json` is the default MCP allowlist. It is
  empty until an approved spec changes it.
- Secrets such as API keys belong in local shell environment or ignored local
  config only.
- Absolute workstation paths may exist in ignored `.mcp.json`, not in tracked
  examples unless they are clearly placeholders.
- Mimir remains a product repo, not the BES operating-layer memory authority,
  until a future spec-authority integration is approved.

## Promotion Rule

When something in assets, downloads, tools, or idea intake becomes durable work:

1. Create or update an executable `SPEC.md` under `.agents/specs/` or the target
   repo's `.agents/specs/`.
2. Cite the source path and current facts.
3. Move only the approved artifacts into the repo-native docs/source location.
4. Leave unrelated downloads, software, caches, and scratch files untouched.
