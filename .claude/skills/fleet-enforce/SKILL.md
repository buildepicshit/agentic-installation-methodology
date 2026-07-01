---
name: fleet-enforce
description: "BLOCKING. Use ONLY from bes-fleet-policy. Issues structured fleet directives to one or more child repos, then applies them via fleet-enforce.sh, commits, and pushes. This is the cross-repo enforcement channel — when fleet rules change in bes-fleet-policy, this skill drives compliance across the 9 fleet locations rather than waiting for manual per-repo sync. Owner alone authorises new directives; the skill executes them."
license: internal-only
compatibility:
  - copilot
  - claude
  - bes-fleet
allowed-tools: []
metadata:
  bes_provenance:
    origin: internal
    source_urls: []
    borrowed_from: []
    upstream_status: not-applicable
    last_audited: 2026-06-05
    audit_cadence: annual
    adoption_status: bes-native
    security_review: not-required
    notes: "BES fleet-native skill."
  bes_tool_surface:
    scripts: none
    network: false
    dependencies: []
    secrets: []
    allowed_tools: []
    risk_notes: "No skill-local executable helper scripts."
---

# Fleet Enforce

The cross-repo enforcement channel. When a fleet rule changes in
`bes-fleet-policy`, this skill packages the change as a durable,
auditable directive and applies it across target repos.

Authority:
`file://specs/2026-05-13-framework-refresh-lightweight-ceremony/SPEC.md`;
`file://agents/fleet-directives/README.md` (directive format);
`file://agents/scripts/fleet-enforce.sh` (mechanical applier);
`file://agents/scripts/audit-fleet-compliance.sh` (audit tool).

## When to use

Invoke ONLY when ALL hold:

- You are operating from `bes-fleet-policy` (not a child repo).
- Owner has approved a fleet rule change (a closed SPEC, an
  explicit `owner://transcript-<date>` directive, or a legacy
  AGENT_FEEDBACK entry triaged as misalignment).
- The change requires action across ≥ 1 child repo beyond what
  `fleet-sync.sh` already handles automatically.
- The action is bounded, scripted, and reversible.

Do NOT use for:

- Per-product work inside a child repo (use that repo's procedure).
- Owner-only state transitions (those remain owner-only regardless
  of directive).
- Pushing speculative changes — directives REQUIRE owner authority.

## Directive format

Each directive is a markdown file at
`agents/fleet-directives/<YYYY-MM-DD>-<slug>.md` with front-matter:

```yaml
---
id: 2026-05-13-recompose-workflow-applicability
issued_by: bes-fleet-policy
target_repos: [ACTOCCATUD, Floom, IKTO, UsefulIdiots, Mimir, Wick, Assets, agentic-installation-methodology]
authority: bes-fleet-policy@<sha>
type: file-recompose | manifest-update | hook-config | spec-status-flip | other
status: pending | applied | expired | superseded
created: 2026-05-13
deadline: 2026-05-20    # optional
---
```

Body sections:

1. **Action** — concrete steps the enforcer takes per target.
2. **Compliance check** — a shell expression that exits 0 when
   the target is in compliance.
3. **Authority chain** — links back to the owner directive / SPEC
   / feedback entry that authorised the directive.

See `file://agents/fleet-directives/README.md` for full format
spec and worked examples.

## Procedure

1. **Author directive.** Create the markdown file under
   `agents/fleet-directives/`. Lint-check via
   `bash agents/scripts/audit-fleet-compliance.sh --validate
   <directive_id>`.
2. **Surface to owner** if the directive is novel or non-trivial.
   Owner approval is the directive's existence (created in
   bes-fleet-policy main); owner alone may flip status to
   `superseded` or `expired`.
3. **Apply.** Run
   `bash agents/scripts/fleet-enforce.sh <directive_id>`. The
   script:
   - reads the directive,
   - iterates `target_repos`,
   - executes the action steps per target,
   - runs the compliance check,
   - stages changes explicitly (no `git add -A`),
   - commits with a message referencing the directive id,
   - pushes (if remote configured),
   - flips directive status to `applied` on success.
4. **Verify.** Run
   `bash agents/scripts/audit-fleet-compliance.sh` to confirm all
   targets pass the compliance check.

## Audit

`audit-fleet-compliance.sh` walks `agents/fleet-directives/*.md`
and for each `applied` or `pending` directive checks each
target repo against the compliance check. Non-compliant targets
surface as drift. The audit runs as part of the standard fleet
checks invoked by the studio-root preflight.

## Hard rules

- ONLY bes-fleet-policy issues directives. Child repos cannot.
- Directives MUST cite owner authority. No agent-initiated
  directives.
- The enforcer MUST stage files explicitly. NO `git add -A` /
  `git add .` (enforced by the existing `block-git-add-all`
  hook, which the enforcer respects).
- The enforcer MUST NOT bypass per-target commit-msg hooks
  (INSTRUCTION_APPROVED handling for UsefulIdiots, Conventional
  Commits enforcement, AI-attribution block).
- The enforcer MUST NOT flip SPEC status to `approved`,
  `decomposed`, `superseded`, or `closed` — those remain owner-only
  per `file://agents/specs/SPEC.schema.md` §1.3.
- Directives that flip artefact state in bulk MUST carry a
  MECHANICAL selector (front-matter predicate, date boundary) plus
  an expected-count assertion; prose boundaries ("evidence-only per
  STATUS.md") are not decidable. Proven on the 26-spec ACTOCCATUD
  backfill
  (`file://specs/2026-06-09-superseded-terminal-status/SPEC_EVIDENCE.md`
  SE2, dispositioned ACCEPT).
- Directives that fail their compliance check after apply MUST
  be flipped back to `pending` with a `failed_targets` field
  listing which repos failed and why.
- Directives are immutable once `applied`. Subsequent changes
  require a new directive that supersedes the prior (link via
  `supersedes:` front-matter field).
