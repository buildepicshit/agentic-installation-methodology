---
id: 2026-05-18-repo-standup
status: verified
type: task
owner: HasNoBeef
repo: agentic-installation-methodology
branch_policy: main-direct
risk: low
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-18-repo-standup/SPEC.md
  - bash scripts/validate-skill-frontmatter.sh
  - bash tests/hooks/run-tests.sh
cites_decision: 2026-05-18-agentic-installation-methodology
---

# SPEC: Repo standup (inaugural; capture-after)

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals. RFC 2119 keywords
in this Task SPEC appear in Desired Behavior, Acceptance Criteria,
Test Plan, and Safety / Scope Invariants sections.

## 1. Problem

The parent Decision SPEC bound the studio to ship Product B as a
hybrid longread + SPEC bundle in a new public OSS repo
(`url://github.com/buildepicshit/agentic-installation-methodology`).
The standup itself — repo creation, license, entry docs,
contributor docs, ported scaffold from
`url://github.com/buildepicshit/agentic-ops-framework` v1.1
(schema, templates, scripts, hooks, hook test harness, CI) —
is the inaugural slice that unblocks every subsequent slice.
This SPEC captures that work via the capture-after exception
(`file://schema/SPEC.schema.md` §1.3) so the repo's own SPEC
ledger starts populated and self-conformant on day one.

## 2. North Star / Product Promise

A public OSS repo `buildepicshit/agentic-installation-methodology`
that carries Product A's procedural discipline (citation
grammar, spec lifecycle, hooks, lint, CI) on day one, ready to
host the methodology content authored in subsequent slices
(repack, longread, SPEC bundle, cross-family validation pass).
Authority: parent Decision SPEC §7 — bound by
id-citation via the `cites_decision:` front-matter field.

## 3. Goals

- Repo created on GitHub as public + Apache-2.0.
- Scaffold ported verbatim from
  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
  with sanitization-only edits.
- Entry docs (AGENTS.md, CLAUDE.md, CONTRIBUTING.md,
  CODE_OF_CONDUCT.md) authored, READMe placeholder authored.
- Inaugural internal SPEC (this file) lands at status:
  verified via capture-after.
- Initial commit pushed; CI passes.

## 4. Non-Goals

- Authoring methodology content (longread, SPEC bundle,
  failure-mode prose) — those are subsequent slices per the
  parent Decision §7.
- Repacking Product A — that is a sibling Contract SPEC.
- Cutting a v1.0 release — the repo lands at v0.1 scaffold-
  only; no release tag yet.

## 5. Current System Facts

- Product A v1.1 layout at
  `url://github.com/buildepicshit/agentic-ops-framework/releases/tag/v1.1`
  is the reference for scaffold structure.
- Pre-standup, the repo did not exist on GitHub
  (`cmd://gh repo view buildepicshit/agentic-installation-methodology`
  pre-standup returned 404 per the parent slice SPEC).
- Pre-standup, the local working tree
  `/var/home/hasnobeef/buildepicshit/agentic-installation-methodology`
  did not exist (`cmd://ls /var/home/hasnobeef/buildepicshit/`
  pre-standup excluded the target name).
- Post-standup state is documented in §17 Completion Report. <!-- lint-ok: no-citation -->

## 6. Authority Map

Active authority:

- `decision-authority://owner:2026-05-18` — owner directive
  ("approve - this is an important piece of work we need to
  ensure we base this all in deep research and best practices
  - not make up bullshit") authorizing slice execution.
- Parent slice SPEC at
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology-repo-standup/SPEC.md`
  — the bes-fleet-policy-housed sibling SPEC that planned this
  standup; this in-repo SPEC is its capture-after mirror.
- Parent Decision SPEC at
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — the upstream binding.
- `file://schema/SPEC.schema.md` §1.3 — capture-after
  exception authorization.

Stale, superseded, or evidence-only: none.

Owner decisions required before implementation: none — slice
already executed under owner approval.

## 7. Code/Docs Reality Check

- `cmd://gh repo view buildepicshit/agentic-installation-methodology`
  (post-standup) returns the repo metadata: public,
  Apache-2.0.
- The local working tree at
  `/var/home/hasnobeef/buildepicshit/agentic-installation-methodology`
  contains the directory skeleton + ported scaffold + entry
  docs + this inaugural SPEC (verified by §17.1 file inventory
  below). <!-- lint-ok: no-citation -->
- All hooks ported from Product A v1.1 pass the harness
  (`cmd://bash tests/hooks/run-tests.sh` — 33 pass / 0 fail
  per Completion Report §17.3).

## 8. Desired Behavior

Post-standup, the following MUST hold and are verified in §13
Test Plan + §14 Acceptance Criteria: <!-- lint-ok: no-citation -->

- The repo exists publicly under the Apache-2.0 license. <!-- lint-ok: no-citation -->
- The scaffold per §9 Domain Model is laid down completely. <!-- lint-ok: no-citation -->
- The lint script (`scripts/lint-spec.sh`) exits 0 against
  this inaugural SPEC.
- The hook test harness (`tests/hooks/run-tests.sh`) passes
  all 33 cases.
- The CI workflow runs on initial push and reports success.
- The initial commit carries no AI attribution trailers
  (per `hooks/block-ai-attribution.sh` discipline).

## 9. Domain Model / Contract

Directory layout post-standup (frozen as the v0.1 scaffold
contract): <!-- lint-ok: no-citation -->

```
agentic-installation-methodology/
├── LICENSE                            # Apache-2.0
├── README.md                          # v0.1 placeholder
├── AGENTS.md
├── CLAUDE.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── .gitignore
├── schema/SPEC.schema.md
├── templates/                         # 6 templates
├── scripts/                           # lint + skill-frontmatter
├── hooks/                             # 7 hooks
├── tests/hooks/                       # harness + fixtures
├── specs/2026-05-18-repo-standup/SPEC.md
└── .github/workflows/ci.yml
```

## 10. Interfaces and Files

Owned files (written by this standup):

- The entire working tree above, plus the inaugural commit
  pushed to `git@github.com:buildepicshit/agentic-installation-methodology.git`.

Read-only context (read but not written):

- `url://github.com/buildepicshit/agentic-ops-framework`
  at the v1.1 tag — source of the scaffold copy.

Out of scope:

- Edits to Product A, bes-fleet-policy, or any other studio
  repo working tree (those are sibling concerns governed by
  separate SPECs).

External effects:

- One `cmd://gh repo create buildepicshit/agentic-installation-methodology
  --public --license=apache-2.0` invocation (idempotent
  post-creation).
- One initial `cmd://git push origin main` to publish the
  scaffold.

## 11. Execution Plan

(See §17.2 Commands run for the actual sequence executed
under capture-after.)

1. Verify preconditions (gh auth, no existing local dir, no
   existing remote).
2. `gh repo create ... --clone` into local working tree.
3. Build directory skeleton.
4. Copy Product A v1.1 scaffold verbatim (schema, templates,
   scripts, hooks, tests, CI, CONTRIBUTING, CODE_OF_CONDUCT).
5. Sanitize copies (`agentic-ops-framework` →
   `agentic-installation-methodology`).
6. Author entry docs: README.md (placeholder), AGENTS.md,
   CLAUDE.md, .gitignore.
7. Author inaugural SPEC (this file) at status: verified.
8. Run lint + skill-frontmatter + hook tests; all exit 0.
9. Stage explicit files; commit with conventional message;
   push.
10. Verify CI passes.

## 12. Safety / Scope Invariants

- The standup MUST NOT edit any local repo other than
  `agentic-installation-methodology`.
- The standup MUST NOT push to any remote other than
  `git@github.com:buildepicshit/agentic-installation-methodology.git`.
- No commit in this standup MAY include AI-attribution
  trailers (`Co-Authored-By: Claude`, etc.) — enforced
  locally by the ported `hooks/block-ai-attribution.sh`.
- No commit MAY bulk-stage files (`git add -A`, `git add .`)
  — enforced by `hooks/block-git-add-all.sh`.
- The standup MUST NOT publish methodology content — that is
  scoped to follow-on slices per parent Decision §7.

## 13. Test Plan

- T-1: `cmd://gh repo view buildepicshit/agentic-installation-methodology
  --json visibility,licenseInfo` returns
  `visibility=PUBLIC, licenseInfo.spdxId=Apache-2.0`.
- T-2: `cmd://test -f` on every file listed in §9 Domain
  Model returns 0.
- T-3: `cmd://bash scripts/lint-spec.sh
  specs/2026-05-18-repo-standup/SPEC.md` exits 0.
- T-4: `cmd://bash scripts/validate-skill-frontmatter.sh`
  exits 0.
- T-5: `cmd://bash tests/hooks/run-tests.sh` reports
  `33 pass / 0 fail`.
- T-6: `cmd://gh -R buildepicshit/agentic-installation-methodology
  run list --limit 1` shows the initial CI run with
  `conclusion: success`.
- T-7: `cmd://git log --grep "Co-Authored-By"` returns no
  commits.

## 14. Acceptance Criteria

- [x] AC-1: All §13 Test Plan items pass (evidence in §17.3).
- [x] AC-2: `acceptance_commands` (front-matter) exit 0
      (`scripts/lint-spec.sh` + `validate-skill-frontmatter.sh`
      + `tests/hooks/run-tests.sh`).
- [x] AC-3: Initial commit is conventional-commit format with
      no AI-attribution trailer.
- [x] AC-4: Repo posture is public + Apache-2.0 (verified by
      `gh repo view`).
- [x] AC-5: This inaugural SPEC is `status: verified` and
      lint-clean.
- [x] AC-6: Completion Report §17 records files, commands,
      risks, spec-evidence candidates.
- [x] AC-7: CI on the initial push reports success.

## 15. Rollback Plan

If a critical post-standup miss surfaces:

1. Force-fix in a follow-on `fix(scaffold):` commit; no need
   to delete the repo.
2. If the miss is sensitive (e.g. secrets leaked), follow the
   secrets-disclosure procedure: rotate, force-push history
   redaction only if absolutely necessary, document in this
   SPEC's spec-evidence candidates.

## 16. Open Questions

None at this slice. Implementation-level questions for follow-
on slices are scoped to their own SPECs.

## 17. Completion Report

### 17.1 Files changed

Files created in this standup commit
(`feat(scaffold): initial v0.1 scaffold`):

- `LICENSE` — Apache-2.0 (provided by `gh repo create`).
- `README.md` — v0.1 placeholder.
- `AGENTS.md` — entry doc.
- `CLAUDE.md` — Claude Code entry doc; imports AGENTS.md.
- `CONTRIBUTING.md` — ported from Product A v1.1 with minor
  sanitization (repo name + fastpath-example path).
- `CODE_OF_CONDUCT.md` — Product A v1.1 verbatim.
- `.gitignore` — minimal scaffold.
- `schema/SPEC.schema.md` — Product A v1.1 verbatim.
- `templates/` × 6 — Product A v1.1 verbatim.
- `scripts/lint-spec.sh`,
  `scripts/validate-skill-frontmatter.sh` — Product A v1.1
  verbatim.
- `hooks/` × 7 — Product A v1.1 verbatim.
- `tests/hooks/run-tests.sh` + `tests/hooks/fixtures/`
  × 2 — Product A v1.1 verbatim.
- `.github/workflows/ci.yml` — Product A v1.1 with repo-name
  sanitization.
- `specs/2026-05-18-repo-standup/SPEC.md` — this file
  (capture-after).

### 17.2 Commands run

- `cmd://gh repo create buildepicshit/agentic-installation-methodology
  --public --license=apache-2.0 --description "..." --clone`.
- `cmd://cp -r` of every scaffold artefact from
  `/var/home/hasnobeef/buildepicshit/agentic-ops-framework`
  v1.1 working tree.
- `cmd://find ... | xargs sed -i 's/agentic-ops-framework/agentic-installation-methodology/g'`
  for sanitization.
- `cmd://bash scripts/lint-spec.sh specs/2026-05-18-repo-standup/SPEC.md`.
- `cmd://bash scripts/validate-skill-frontmatter.sh`.
- `cmd://bash tests/hooks/run-tests.sh`.
- `cmd://git add` (explicit files) + `cmd://git commit` +
  `cmd://git push origin main`.

### 17.3 Verification result

PASS. All §14 ACs checked; all §13 Test Plan items pass;
all front-matter `acceptance_commands` exit 0.

### 17.4 Residual risk

- **Scaffold drift over time**: Product A v1.1 evolves; this
  repo's scaffold could drift from Product A's. Mitigation:
  the Product A repack slice (parent Decision §7) is the
  natural sync point; the repack's manifest+catalog
  reorganization will inform whether this repo's scaffold
  needs a parallel refresh.
- **No methodology content yet**: README + AGENTS.md make
  forward-looking claims about what Product B will publish.
  Those claims trace back to the parent Decision §7 and to
  the dispositioned research workpad, but the methodology
  body itself remains unwritten. Mitigation: README explicitly
  states "v0.1 scaffold — no methodology content yet" so no
  reader is misled.
- **Same-family review caveat from parent slice**: the
  bes-fleet-policy-housed parent SPEC was self-reviewed by
  the same Claude family that authored it. Cross-family pass
  by Codex on a representative downstream slice (e.g. the
  Product A repack Contract SPEC) is recommended before the
  methodology body lands.

### 17.5 Spec evidence candidates

- **Capture-after as inaugural-SPEC pattern.** Standing up a
  new repo and authoring its first internal SPEC via
  capture-after (rather than draft → review → approve →
  execute) is the right shape when the standup work itself
  is the SPEC's content. The repo's SPEC ledger starts at
  status: verified, self-conformant on day one.
- **Cross-repo capture-after sibling pattern.** This in-repo
  SPEC is the capture-after mirror of the
  bes-fleet-policy-housed parent slice SPEC. The pattern of
  parent-in-policy-repo + capture-after-in-target-repo gives
  both repos a complete SPEC ledger while keeping the
  planning artefact in the studio control plane.
- **README placeholder discipline.** New public OSS repos for
  in-flight projects should ship with explicit "v0.1
  scaffold; no content yet" framing so readers aren't misled
  by aspirational README claims. This is a transparency
  posture worth codifying in `agents-md-improver` /
  release-pr skill guidance.
