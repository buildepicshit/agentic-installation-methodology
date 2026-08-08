---
id: 2026-08-07-fixture-good-fastpath-declined-gate
status: closed
type: fastpath
owner: HasNoBeef
repo: bes-fleet-policy
branch_policy: main-direct
risk: low
requires_network: false
requires_secrets: []
acceptance_commands: []
ideated_in: null
---

# SPEC: Lint Fixture — fastpath that MENTIONS a gate it did not change

## 1. Problem

Three entry documents disagree about which branch policy is in force
(`file://STATUS.md`). Correcting the prose changes no behaviour.

## 2. Files changed

- `STATUS.md` — correct the branch-policy sentence.
- `SESSION_JOURNAL.md` — append the correction entry.
- `docs/entry-notes.md` — same sentence, second copy.

No guard, hook, lint or CI gate is in this list. That list IS the change set.

## 3. Owner directive

`owner://transcript-2026-08-07`:

> fix the wording, leave the hooks alone

## 4. Acceptance commands

- `cmd://bash agents/scripts/audit-entry-docs.sh`

## 5. Completion Report

### 5.1 Verification result

| Check | Result |
|---|---|
| `cmd://bash agents/scripts/audit-entry-docs.sh` | PASS |

### 5.2 Residual risk

The wording in `.claude/hooks/block-edit-on-main.sh` disagrees with the
corrected prose, and `agents/scripts/audit-entry-docs.sh` does not read that
hook's header. Changing the hook was CONSIDERED and DECLINED: it alters what a
gate blocks, which is the Rule 20 bar, so it belongs in a task SPEC and not
here. No credential, API key or branch-protection setting is touched by this
work either.

This is the regression case. Until 2026-08-07 the paragraph above BLOCKED this
SPEC twice over — once on the hook path, once on the word `credential` — while
§2, the section the rule is actually asking about, named three documents and no
guard. Expected: exit 0.
