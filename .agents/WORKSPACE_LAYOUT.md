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

The active product directories are independent repos; the canonical
roster is the OPERATING_MODEL `Active Repos` posture table. Root agents
may read them for orientation, but product edits happen inside the
target repo and its own `AGENTS.md`/`WORKFLOW.md` contract.

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
and a source repo is identified by its absence — never the bare `.agents/`
directory (`file://specs/2026-06-22-fleet-sync-self-reconcile/SPEC_EVIDENCE.md` SE-3).

| Repo | Root | Role | Git posture |
|---|---|---|---|
| `IKTO` | `unity/` | Unity prototype/product root | tracked in IKTO |

## Local Tooling And External Software

| Path | Role | Rule |
|---|---|---|
| `tools/` | Local tool checkouts, MCP servers, SDK experiments | ignored by default; promote only small wrappers/docs intentionally |
| `bes-blender-mcp/` | Local Blender MCP server checkout at the root (predates the `tools/` convention) | ignored; not fleet baseline; allowlisted in `preflight-config.json` |

Do not assume tools under `tools/` are production source. Treat them as local
runtime dependencies unless a spec explicitly promotes a wrapper or document.

## Assets, Downloads, And Sandboxes

| Path | Role | Rule |
|---|---|---|
| `Alaricky/` | Private personal product repo (own git; declared 2026-07-02) | non-fleet; agents keep out absent explicit owner instruction |
| `Assets/` | Local art/audio/model/download holding area | ignored |
| `Assets/Downloads/` | Download intake inside asset storage | ignored |
| `content_store.db.backup` | Local database backup | ignored |

Agents must not move, delete, normalize, or publish these paths without a
specific approved migration spec. Inventory first, then propose moves.

## MCP Config Policy

- `.mcp.json` is active machine-local config and must stay ignored/untracked.
- `.mcp.example.json` files are checked-in examples and must not contain real
  secrets or non-placeholder absolute workstation paths.
- Allowlist, provisioning gate, and use policy: `.agents/mcp/README.md`.

## Promotion Rule

When something in assets, downloads, tools, or idea intake becomes durable work:

1. Create or update an executable `SPEC.md` under `.agents/specs/` or the target
   repo's `.agents/specs/`.
2. Cite the source path and current facts.
3. Move only the approved artifacts into the repo-native docs/source location.
4. Leave unrelated downloads, software, caches, and scratch files untouched.
