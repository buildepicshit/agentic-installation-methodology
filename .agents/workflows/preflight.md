# Preflight

Use this workflow before root planning, autonomous dispatch, or spec execution.

1. In the promoted `bes-fleet-policy` repo, run
   `node agents/scripts/preflight.mjs`.
2. In propagated fleet layouts where policy lives under `.agents/`,
   run `node .agents/scripts/preflight.mjs` from the repo or BES root.
3. Fix failures before editing, dispatching, or claiming the environment is ready.
4. Treat warnings as routing notes; workspace classification and
   `.mcp.json` hygiene rules live in root `AGENTS.md` Workspace Rules.

This workflow verifies agent entrypoints, skill frontmatter, MCP config hygiene,
and root workspace layout.
