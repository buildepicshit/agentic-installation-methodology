# BES MCP Policy

Status: canonical root MCP policy, 2026-04-29.
Updated 2026-06-20: disentangle source USE from PROVISIONING
(`specs/2026-06-20-agent-canon-bounded-autonomy-voice/SPEC.md` §7 dim. 5).

The default BES agent environment starts with no active MCP servers. This keeps
Copilot and Claude agents uniform, fast to start, and free from
machine-specific secrets or optional tool failures.

## Use versus provisioning

These are two distinct cases; do not conflate them.

- USE is the default. Where a high-quality source is already
  connected or available — web search and URL fetch, the GitHub
  connector, Google, Slack, or any live MCP connector — using it is
  the default for any load-bearing external gap, not an exception.
  Reach for an already-connected source rather than guessing from
  memory.
- PROVISIONING stays governed. Enabling a NEW MCP server or
  installing a NEW tool is not a default; it requires ask-plus-approve
  (owner or an approved spec). This gate is unchanged by the use-default
  clause.

Source use observes the lethal-trifecta security bound (private data +
untrusted content + exfiltration ability): do not send secrets,
credentials, or private or proprietary data to an untrusted sink or
external service, and act only within current SPEC, owner, and
tool-permission grants. High-risk use — untrusted content combined with
private-data access or external-write reach — is sandboxed or escalated
to the owner.

## Rules

- `.mcp.json` is local, ignored, and untracked.
- `.mcp.example.json` is checked in and currently contains an empty
  `mcpServers` object.
- `.agents/mcp/approved-defaults.json` is the checked-in allowlist for MCP
  servers that may be active by default. It is empty until an owner-approved
  spec changes it.
- Agents must ask before installing or enabling task-specific MCP servers.
- MCPs that depend on local apps, API keys, sockets, game engines, or external
  services are task-scoped, not default fleet dependencies.
- Mimir remains a product repo and is not the BES operating-layer memory
  authority until a future spec-authority integration is approved.

## Current Recommendation

Recommended default provisioned MCP servers: none.

Use built-in filesystem, shell, GitHub connector, and repo docs/specs for the
baseline agent workflow — and use any already-connected high-quality source
(web search/fetch, GitHub, Google, Slack, live MCP connectors) freely for
load-bearing external gaps, within the lethal-trifecta bound above. Provision
or enable a NEW MCP server only when a specific approved task needs it.
