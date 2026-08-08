---
id: [YYYY-MM-DD-kebab-case-topic]
status: closed
type: fastpath
owner: [owner-identifier]
repo: [repo-name]
branch_policy: worktree-preferred
risk: low
requires_network: false
requires_secrets: []
acceptance_commands: []
ideated_in: null
---

<!--
Fast-path SPEC template. Use ONLY when ALL fast-path thresholds are
met: <= 5 files changed, <= 300 insert/delete lines, one component, no
public-contract impact, no persisted-state impact, reversible in one
commit, no cross-session compounding risk, and **NO Rule 20
consequence** (below). If your work exceeds any threshold, escalate to a
full task / contract / decision SPEC via the standard `/idea-capture` ->
`/author-spec` flow.

The consequence threshold is LOAD-BEARING, not hygiene. Fastpath lands
at `status: closed` and so passes through NEITHER Rule 20 gate
(`approved-pending-owner` and `verified`), which makes it the one lane
where a guardrail change would reach production unreviewed. So fastpath
is BARRED for any change that:

- **alters what a gate blocks or allows** — a hook, a lint, a CI gate,
  a validator, a permission rule; or
- **touches secrets or a security surface**; or
- **changes branch or push protection**.

That is the Rule 20 test verbatim (`file://agents/MODEL_ROUTING.md`
Rule 20), and it is the right one because fastpath's exposure is
precisely the review Rule 20 exists to require.

**This threshold was a manifest-PATH test until 2026-08-06** — "any hit
against `fleet-{files,hooks,skills}.txt` means this is the wrong
template". Path is a proxy for risk, and after Rule 20 narrowed to
consequence on 2026-07-31 (*"Path is not risk"*) that proxy failed in
BOTH directions. It barred a typo fix in a propagating doc, which can
change no verdict. Worse, it ADMITTED the changes that matter most:
`.github/workflows/ci.yml`, a repo-local `.claude/hooks/<guard>.sh` and
`.github/hooks/*.json` are in no propagation manifest, so removing a CI
gate was fastpath-eligible. Swapping path for consequence is therefore
net-TIGHTENING (`file://specs/2026-08-06-guardrail-proxies-to-consequence/SPEC.md` S1).

A manifest hit remains a useful ADVISORY signal — propagating work is
often consequential — but it no longer decides the question on its own.
Original bypass trace:
`file://specs/2026-07-24-lifecycle-lean-execution/SPEC.md` §8.

**MENTION IS NOT CHANGE (2026-08-07).** The lint reads §2 "Files
changed" for the consequence test, and the body MINUS §5 "Completion
Report" for the secrets test. Naming a gate elsewhere — in §1 to say
what surfaced the problem, or in §5.2 to say you considered it and
DECLINED to touch it — does not trip either test. Write that sentence.
Until 2026-08-07 both tests scanned the whole document, so an honest
residual-risk paragraph was punished and an omitted one was not
(`file://specs/2026-08-07-lint-spec-mention-immunity/SPEC.md`). §2 is
the declaration the rule is asking about; keep it accurate and the
rest of the SPEC can say anything true.

Fast-path SPECs use the **capture-after** pattern by default
(`file://agents/skills/spec-driven-development/SKILL.md`
"Exception: capture-after"): the work is performed first under
owner directive, then this SPEC is filed as the citable authority
record. The artefact lands at `status: closed` in the same commit
as the work itself, never later.

NO ceremony: no IDEA artefact, no blocking review gate, no
decomposition, no cross-validation lane (covered by the work
itself being small enough to be reviewed inline, AND by guardrail
paths being excluded outright). Owner approval is the inline commit
message.

Fast-path SPECs MUST cite their authorising owner directive in §3.
-->

# SPEC (fast-path): [Title]

## 1. Problem

[One paragraph. What was broken or missing. Cite the file/issue/
owner message that surfaced it.]

## 2. Files changed

[List the files touched. Single component, ≤ 5 files, ≤ 300 lines,
total. If this list exceeds the threshold, this SPEC is wrong-typed
— rewrite as task/contract.]

## 3. Owner directive

[Verbatim quote of the owner directive that authorised the
fast-path. Cite `owner://transcript-<YYYY-MM-DD>` or
`judgment://owner` paired with transcript backing.]

> [verbatim owner quote]

## 4. Acceptance commands

[Inline list of commands that exit 0 to demonstrate the change
works. Subset of the parent repo's gates. lint-spec lint of this
file is implicit and not listed.]

- `cmd://...`

## 5. Completion Report

### 5.1 Verification result

| Check | Result |
|---|---|
| [acceptance command 1] | PASS |
| [acceptance command 2] | PASS |

### 5.2 Residual risk

[One paragraph at most. If residual risk is "real" or "non-trivial",
this work should have been a full SPEC. Honest framing here keeps
the fast-path honest.]

## Hard rules (template-enforced)

Fast-path SPEC files MUST:
- Lint-pass under `agents/scripts/lint-spec.sh` fastpath mode.
- Be ≤ 100 lines total (this template is the upper bound).
- Cite owner directive in §3.
- Land at `status: closed` in the same commit as the work.
- Skip IDEA, review, decomposition, cross-validation phases.

If any rule above is hard to satisfy, the work isn't fast-path
material — escalate to a full SPEC type.
