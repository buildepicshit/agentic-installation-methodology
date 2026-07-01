# Preflight

Use this workflow before root planning, autonomous dispatch, or spec execution.

1. In the promoted `bes-fleet-policy` repo, run
   `node agents/scripts/preflight.mjs`.
2. In propagated fleet layouts where policy lives under `.agents/`,
   run `node .agents/scripts/preflight.mjs` from the repo or BES root.
3. Fix failures before editing, dispatching, or claiming the environment is ready.
4. Treat warnings as routing notes: classify new top-level paths in
   `.agents/WORKSPACE_LAYOUT.md` or create a migration spec before moving files.
5. Keep `.mcp.json` local and ignored; update `.mcp.example.json` only for
   portable examples.

This workflow verifies agent entrypoints, skill frontmatter, MCP config hygiene,
and root workspace layout.
