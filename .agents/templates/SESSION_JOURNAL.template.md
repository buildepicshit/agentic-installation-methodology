# SESSION_JOURNAL.md — [Repo Name]

Per-repo session continuity journal. Append-only. Every agent
context (Claude Code interactive, Copilot CLI, owner-led `wt` worktree)
writes its handoff here.

**Purpose:** give every session a durable continuity record across
agents. This journal is read in Step 0 orientation by ALL agents and
appended on session end.

## How to use

**On session start (every agent):** read the last 3 entries. They
tell you what the previous agent did, what was left dirty, what the
next agent should pick up.

**On session end (every agent):** append a new entry at the BOTTOM
of the Entries section using the template below.

If the dirty-tree state changed during your session, you MUST log.
If your session was read-only (no edits), logging is OPTIONAL but
recommended.

## Entry template

```markdown
## YYYY-MM-DD HH:MM — <agent-id> (<model>)

### What I did
[One paragraph. Concrete outcomes; not "I tried to ...".]

### What I touched
- `path/to/file.ext` — [why; brief]
- `path/to/file2.ext` — [why]

### What I left dirty
- `path/to/wip.ext` — WIP, blocked on owner decision about X
- `path/to/safe.ext` — safe to discard if next agent doesn't continue

### Next agent should
[One sentence directive: continue X, discard Y, owner-blocking
question Z.]

### Notes
[Optional — surprises, confusions, decisions worth flagging.]
```

## Hard rules

- Append-only. Never edit prior entries (immutable record).
- Owner alone may archive entries older than 90 days to
  `SESSION_JOURNAL.archive.md`.
- Truncate this file to the most recent 30 entries on archival
  pass; do not let it grow unboundedly.
- Entries citing facts (lint output, commit hash, etc.) MUST use
  the citation grammar from `agents/specs/SPEC.schema.md` §2.
- Do NOT include secrets, credentials, or owner private content.
  This file may be read by any agent entering this repo.

## Entries

<!-- Append newest entries at the BOTTOM (chronological order). -->
