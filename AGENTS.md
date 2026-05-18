# AGENTS.md — agentic-installation-methodology

> Entry doc for AGENTS-aware tools (Codex, Cursor, Aider,
> Jules, Copilot, and other AGENTS-spec consumers per
> `https://agents.md`). Claude Code enters via `CLAUDE.md`
> which imports this file.

## What this repo is

The home for **Product B** — a published methodology for
**agentic installation**: developers publish exhaustive intent
SPECs instead of binaries; user-with-agent installs from the
SPEC locally, without a developer-in-the-loop support loop.

Status: **v0.1 scaffold**. No methodology content has been
authored yet. The scaffold ports Product A's spec procedure
discipline verbatim so any subsequent authoring inherits the
same lifecycle, citation grammar, lint, hooks, and CI.

The sibling repo
[`agentic-ops-framework`](https://github.com/buildepicshit/agentic-ops-framework)
(Product A, v1.1) is the worked case study; the methodology
authored here uses Product A's extraction-and-publication
journey as its primary example.

## Authority chain

1. **Parent Decision SPEC** at
   `bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   (status: verified) binds the shape, scope, and posture of
   this repo's eventual content. Its §7 Decision Statement
   enumerates the five slices that build this repo's content.
2. **`schema/SPEC.schema.md`** — citation grammar, RFC 2119
   scoping, front-matter conventions, status state machine.
3. **`AGENTS.md`** (this file) — repo entry doc.
4. **Active SPECs** under `specs/<id>/` — execution
   contracts for in-flight slices.
5. **Workpad notes / chat history / tool memory** — NEVER
   authoritative. Inputs to your reasoning, not citable
   evidence in artefacts.

When sources conflict, stop and surface the conflict. Do not
silently pick the convenient rule.

## Spec lifecycle (per Product A v1.1)

The 13-phase lifecycle is documented at
`https://github.com/buildepicshit/agentic-ops-framework`
`OPERATING_MODEL.md` and is honoured verbatim here. Short
version:

1. Preflight — read this AGENTS.md + the schema.
2. Orient — read the active SPEC if one exists.
3. Predict — identify scope-drift risks before authoring.
4. Ideate — `IDEA.md` at `specs/<YYYY-MM-DD>-<slug>/`.
5. Author — typed `SPEC.md` (task / contract / decision /
   fastpath); IDEA must be `ready-for-spec` first.
6. Review (BLOCKING) — per-type quality gate; never sets
   `approved`.
7. Owner approves — owner alone flips
   `approved-pending-owner → approved`.
8. Decompose (for Contract / Task with ≥ 2 slices) —
   durable TASK.md slices under `specs/<id>/tasks/`.
9. Dispatch — each TASK.md becomes a trackable unit of work.
10. Execute — `implementation-execution` against the SPEC.
11. Cross-validate (BLOCKING per task) — different-model-
    family reviewer.
12. Verify — acceptance commands pass; Completion Report
    filled.
13. Report + close — owner flips `verified → closed` after
    spec-evidence governance pass.

## Engineering standards

- Conventional Commits 1.0.0.
- Stage files explicitly by name. Do **not** use `git add -A`
  or `git add .` (enforced by `block-git-add-all.sh`).
- Do not commit machine-local files, secrets, or generated
  output.
- Do not add AI attribution to commits, PRs, or generated
  output (enforced by `block-ai-attribution.sh`).
- Do not bypass verify gates (enforced by
  `block-verify-bypass.sh`).
- Do not push to the protected branch unless an active SPEC
  declares `branch_policy: main-direct` (enforced by
  `block-edit-on-main.sh` + `block-push-to-main.sh`).

## Citation discipline

Every factual claim in every artefact MUST carry a citation
prefix from the grammar (`file://`, `cmd://`, `url://`,
`owner://`, `decision-authority://<role>:<date>`,
`judgment://owner`, `judgment://agent-synthesis`). Memory and
training data are inputs to your reasoning, not citable
evidence in the artefact. The lint script enforces this.

When a sentence is in fact editorial framing or an internal
cross-reference, append `<!-- lint-ok: no-citation -->` per
`schema/SPEC.schema.md` §2.5. Use sparingly.

## Posture

The methodology is offered as honest experience, not as
prescription. Contributions and authoring should match that
posture: name what you tried, name what you found, name what
didn't work. Don't pretend certainty you don't have.

The seven open research questions from the parent Decision
SPEC's upstream research workpad are flagged as unresolved;
the methodology helps address them, it does not pretend to
solve them.

## Branch and remote

- Default branch: `main`.
- Remote: `git@github.com:buildepicshit/agentic-installation-methodology.git`
  (public, BES org).
- The inaugural SPEC at `specs/2026-05-18-repo-standup/SPEC.md`
  declares `branch_policy: main-direct`. Edits on main are
  permitted while that SPEC is in `approved` /
  `in-execution` / `verified` / `closed`.

## See also

- `CONTRIBUTING.md` — how to contribute under the lifecycle.
- `CODE_OF_CONDUCT.md` — interaction norms.
- `schema/SPEC.schema.md` — the schema this repo's SPECs
  conform to.
- `templates/` — the SPEC templates.
- Parent Decision authority:
  `bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`.
- Sibling repo (worked case study):
  `https://github.com/buildepicshit/agentic-ops-framework`.
