---
id: 2026-05-19-codex-remediation-amendments
status: approved-pending-owner
type: contract
owner: HasNoBeef
repo: agentic-installation-methodology
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-19-codex-remediation-amendments/SPEC.md
cites_decision: 2026-05-18-agentic-installation-methodology
amends:
  - ../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md
  - ../2026-05-19-primary-source-research-corpus/SPEC.md
  - ../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
---

# SPEC: Codex Remediation Amendments — Round 4-5 Batch

Status: Draft v1
Type: Contract (amendments package)
Purpose: consolidate the remaining seven findings from the
codex cross-family review at
`file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md` as
a single coordinated amendment batch. Each numbered §7
sub-amendment patches a specific section of a verified
parent SPEC; this Contract is the binding wrapper so the
owner can approve the batch in one pass rather than
authoring four separate amendment SPECs.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

## 1. Problem Statement

The codex cross-family review at
`file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
returned 27 findings across the methodology arc. Rounds 1-4
of remediation addressed 20 findings via direct edits
(SPEC-text drift corrections, status truth, citation
overreach, broken cross-repo paths, fleet-sync guard, voice
rule, BES leakage, word budget, per-chapter failure notes).
Seven findings remain; each requires an amendment to a
verified parent SPEC's contract surface (not drift
correction):

- Parent Decision SPEC at
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`:
  findings 1.1, 1.2, 1.3, 1.4 (candidate-space, facet
  classification, trade-off matrix, locks scope).
- Corpus Contract SPEC at
  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`:
  finding 2.3 (source-list expansion).
- v2.0 Repack Contract SPEC at
  `file://../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`:
  findings 3.5, 3.6 (manifest schema expansion + behavior.primary
  field-vs-directory drift).
- Plus one new-tooling Task SPEC obligation (finding 4.2, <!-- lint-ok: no-citation -->
  corpus-citation lint extension) which this Contract names
  as a follow-on without authoring the Task SPEC inline.

The seven amendments are consolidated here because (a)
they share a single provenance (the codex review); (b)
they're all derived from the same review evidence; (c)
batching them avoids seven separate owner-approval cycles;
(d) the amendments don't share execution dependencies that
would force separate sequencing.

## 2. Goals and Non-Goals

Goals:

- Enumerate the seven amendment patches per §7
  sub-amendments below, each with target SPEC + target
  section + before/after text.
- Document the codex finding each patch derives from for
  audit traceability.
- Bind the amendments to a single approval batch so the
  owner can flip approved-pending-owner → approved in one
  pass.

Non-goals:

- Authoring the corpus-citation lint extension itself
  (finding 4.2 — that's a separate Task SPEC).
- Re-running cross-family review on the amended state
  (that's a separate post-remediation slice).
- Retroactively re-tagging v2.0.0 of agentic-ops-framework
  (the v2.0.0 release stands; the manifest-schema
  expansion in §7.E lands as v2.1 when authored).

## 3. System Overview

This Contract is **a package of amendment patches**.
Execution is per-§7-sub-amendment direct edit of the named
target SPEC's named section. Each patch is small (≤ ~20
lines of SPEC-text change typically). Verification is per-
patch lint pass on the amended target SPEC.

The Contract itself does NOT change the framework's
operating model. The parent SPECs being amended retain
their `verified` status; their amendments are recorded
both in this SPEC's §7 and in the targets' own commit
history.

## 4. Authority Map

Active authority:

- `decision-authority://owner:2026-05-19` — owner directive
  "okay we should addreess all of these" authorising
  remediation across all 27 codex findings.
- Codex cross-family review evidence at
  `file://../../reviews/codex-2026-05-19/00-SYNTHESIS.md`
  + per-target review at
  `file://../../reviews/codex-2026-05-19/01-parent-decision.md`,
  `file://../../reviews/codex-2026-05-19/02-corpus.md`,
  `file://../../reviews/codex-2026-05-19/03-v2-repack.md`,
  `file://../../reviews/codex-2026-05-19/04-longread.md`.
- Parent Decision SPEC §16 Reversal Plan triggers <!-- lint-ok: no-citation -->
  ("External cross-family validation pass surfaces a
  structural flaw") authorising amendment of the parent
  Decision via this follow-on Contract.

Stale, superseded, or evidence-only sources: none specific
to this Contract.

Owner decisions required before implementation:

- [ ] Approve the seven sub-amendments as a batch
      (`approved-pending-owner` → `approved` on this
      Contract).

## 5. Code/Docs Reality Check

- All target SPECs currently exist at the paths cited in <!-- lint-ok: no-citation -->
  §1 and are at status: verified.
- Rounds 1-4 remediation commits are durably landed on <!-- lint-ok: no-citation -->
  origin/main of all three repos.
- The codex review evidence is committed at
  `file://../../reviews/codex-2026-05-19/` (5 files
  including SYNTHESIS).

## 6. Domain Model

The amendments span three categories:

1. **Candidate-space + locks** (parent Decision §5, §6,
   §9): findings 1.1, 1.2, 1.4.
2. **Trade-off matrix** (parent Decision §6): finding
   1.3.
3. **Source-list expansion** (corpus §6.1): finding 2.3.
4. **Schema expansion + drift fix** (v2.0 repack §6.1,
   §8): findings 3.5, 3.6.
5. **New tooling Task SPEC** (queued as follow-on, not
   inline): finding 4.2.

## 7. Pipeline Specification (the seven sub-amendments)

### §7.A — Parent Decision §5: add paper-style + bundle-only candidates (finding 1.1, 1.4)

Target:
`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§5 Candidate Options.

Patch: insert two new candidates §5.5 and §5.6 with the
required fields (Description / Fit-with-substance /
Fit-with-constraints / Cost / Risk), labelled REJECTED
with rationale:

- §5.5 Paper-style (arxiv / workshop) — rejected because
  it doubles down on the spec-as-distribution claim by
  publishing through an academic channel, but the
  academic channel adds review latency + format
  constraints that conflict with the methodology's
  honest-experiential posture; the longread channel
  delivers the same content with less ceremony.
- §5.6 SPEC-bundle-only (no longread) — rejected because
  it sacrifices the case-study density per parent §8
  Posture; identical reasoning to candidate 5.2 but
  named explicitly as a rejected shape.

§9 Locks UPDATE: add SPEC-bundle-only and paper-style to
the "Forecloses" list. Move the existing blog-only +
series-only entries into a single "Forecloses
shape-without-SPEC-bundle" entry consolidating both
underspecified-publication-channel options.

### §7.B — Parent Decision §6 + §7: conformance + signing as first-class facets (finding 1.2)

Target: parent Decision SPEC §6 Trade-off Comparison + §7
Decision Statement.

Patch:

- §6 trade-off criteria UPDATE: add a new criterion
  "executable conformance + signed-distribution
  surface" with high weight, sourced from research §5.1.
- §7 Decision Statement INSERT: a clause stating
  conformance suite + signed distribution are
  **first-class** facets of the SPEC bundle, not
  "additional facets requiring amendment". The §9 Locks
  list moves these from "amend to add" status to
  "REQUIRED at v1.0".

### §7.C — Parent Decision §6 + §8: disambiguate honest-disclosure matrix row (finding 1.3)

Target: parent Decision SPEC §6 trade-off matrix +
§8 Decision Rationale row 3 reference.

Patch:

- §6 RENAME the "honest disclosure" criterion to
  "failure-mode + open-question publication surface".
  Re-score the candidates so this criterion measures only
  the publication surface (whether the format LANDS
  failure modes + open questions as first-class
  content), not whether they're "disclosed" generically
  (which the longread + SPEC bundle + blog + series all
  technically can).
- §8 UPDATE rationale citing this criterion's new
  precise name.

### §7.D — Corpus Contract §6.1: source-list expansion (finding 2.3)

Target:
`file://../2026-05-19-primary-source-research-corpus/SPEC.md`
§6.1 In-scope sources (v1.0).

Patch: add two REQUIRED v1.0 entries to the §6.1 table
(and bump `SOURCE_LIST_VERSION` to v1.1; updates the
check script's expectation):

- `json-schema` — JSON Schema spec (Draft 2020-12);
  primary URL `url://json-schema.org/specification.html`.
  Methodology relevance: Helm values-schema + OpenAPI
  3.1 both rely on JSON Schema; the methodology's
  customization sub-spec validates against JSON Schema;
  citing Helm + OpenAPI without citing the underlying
  primitive is a transitive citation gap.
- `cyclonedx-sbom` — CycloneDX SBOM specification;
  primary URL `url://cyclonedx.org/specification/overview/`.
  Methodology relevance: the methodology's audit /
  provenance story (research §4.4 + LeadDev §3
  regulated-environments framing) needs a primary SBOM
  source.

Two additional candidates flagged but NOT v1.0
mandatory (deferred to v1.1 corpus expansion):
`dev-container-spec`, `slsa-in-toto`. These remain in
§17 Open Questions as v1.1 candidates.

### §7.E — v2.0 Repack Contract §6.1 + §8: expand manifest schema (finding 3.5)

Target:
`file://../../../agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`
§6.1 + §8.

Patch: amend the front-door manifest schema to add the
following fields at the top level:

- `schema_uri` (string, REQUIRED) — URL of the schema
  this manifest conforms to (currently inline at §6.1;
  externalising lets adopters reference a versioned
  remote schema).
- `source_commit` (string, REQUIRED) — git commit SHA the
  bundle was generated from (binds the bundle to its
  source-of-truth state).
- `source_tag` (string, OPTIONAL) — git tag if the bundle
  corresponds to a tagged release.
- Per-facet record fields: `media_type` (string,
  RECOMMENDED), `digest` (string, RECOMMENDED;
  `algorithm:hex` form per OCI Descriptor convention),
  `size` (integer, OPTIONAL), `status` (enum:
  `complete` | `partial` | `reserved`; RECOMMENDED; allows
  the manifest to advertise scaffold-status explicitly).
- Per-resource record: same `media_type` + `digest` +
  `size` fields.
- `provenance` (object, OPTIONAL) — SBOM ref + SLSA
  attestation refs once those primary corpus entries
  land.

Bumps manifest `spec_version` to `2.1.0`. Lands as v2.1
of agentic-ops-framework when authored; the v2.0.0
release stays at the current schema.

### §7.F — v2.0 Repack Contract §8.3 + validate-manifest: behavior.primary file-vs-directory drift (finding 3.6)

Target: repack SPEC §8.3 facet record schema + the
validator script.

Patch:

- §8.3 amendment: `primary` MAY be either a file path OR
  a directory path with a `primary_index` field naming
  the entry-point file inside the directory. The
  behavior facet uses the directory form because its
  primary content is a set of `.feature` files.
- `validate-manifest.sh` amendment: when `primary` ends
  in `/`, the validator requires the directory to exist
  AND contain at least one `.feature` file (or
  equivalent extension per the facet). The current
  silent-allow on directory primaries is replaced with
  this explicit branch.

Bumps manifest `spec_version` to `2.1.0` (same release as
§7.E).

### §7.G — Follow-on Task SPEC: corpus-citation lint extension (finding 4.2)

This sub-amendment does NOT execute the lint extension;
it BINDS the obligation that the lint extension be
authored as a follow-on Task SPEC within the next
Product B release cycle. The Task SPEC will:

- Author `scripts/validate-corpus-citations.sh` OR
  extend `scripts/lint-spec.sh` with a corpus-mode flag.
- Enforce that every methodology-primitive citation in
  the longread chapters + SPEC bundle facet files
  resolves to a `file://research/primary-sources/<slug>.md
  §3` reference.
- Be added to CI as a fifth Product B job.
- Update the corpus Contract SPEC §7.1 and the longread
  Contract SPEC §13 AC-8 to reference the new enforcement
  surface and remove the "manual reviewer" deferral.

Authoring this Task SPEC is queued but not blocking on
this Contract's verification. The Task SPEC's
authorisation is `decision-authority://owner:2026-05-19`
+ this Contract's §7.G binding.

## 8. Schema Specification

This Contract has no novel schema. Each sub-amendment in
§7 references the target SPEC's existing schema and
applies a localised patch.

## 9. Reference Algorithms

Execution algorithm per sub-amendment:

```
for each sub_amendment in §7.A through §7.G:
  if sub_amendment is §7.G (Task SPEC obligation):
    record obligation; do not execute inline.
    continue.
  resolve target_spec_path from sub_amendment.target.
  apply patch as direct edit to target sections.
  run target_spec_path's lint via scripts/lint-spec.sh.
  if lint exit != 0: rollback patch; record blocker;
    surface to owner.
  commit edit with conventional-commit message citing
    this Contract id + the codex finding id.
```

## 10. Failure Model

| Class | Trigger | Recovery |
|---|---|---|
| `amendment-lint-fail` | Applied patch causes target SPEC's lint to fail | Rollback patch; revise; re-apply |
| `amendment-meaning-drift` | Reviewer (cross-family) determines the amendment misinterprets the codex finding | Discard patch; author replacement amendment; re-batch |
| `manifest-schema-bump-regression` | §7.E + §7.F manifest schema bump breaks v2.0 consumers that pinned v2.0.0 | Acceptable: the schema bump lands as v2.1; v2.0.0 stays at v2.0.0 schema |
| `corpus-source-list-version-drift` | §7.D bumps SOURCE_LIST_VERSION; existing check-corpus-completeness.sh hardcodes the previous version | Update check script's expected version; CI catches if missed |

## 11. Trust Boundary / Security

No new attack surface. The amendments adjust SPEC text +
schema fields; no executable behaviour changes beyond
manifest schema and validator. The new schema fields
(digest, source_commit) are advisory until adopters
populate them.

## 12. Observability

- Lint exit codes on each amended target SPEC are the
  observability surface.
- This Contract's Completion Report §19.2 records per-
  amendment commit SHAs once execution lands.

## 13. Test and Validation Matrix

| AC | Test |
|---|---|
| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-codex-remediation-amendments/SPEC.md` exits 0 |
| AC-2 | Each amended target SPEC's lint exits 0 post-amendment (six target SPECs × lint check, plus the longread SPEC's lint already verified at Round 4) |
| AC-3 | The corpus check script (`check-corpus-completeness.sh`) exits 0 post-§7.D |
| AC-4 | The validate-manifest.sh script exits 0 post-§7.E + §7.F (against amended v2.1 schema) |
| AC-5 | The follow-on corpus-citation Task SPEC obligation (§7.G) is recorded in the Completion Report and queued in the next Product B planning slice |
| AC-6 | All amendment commit messages cite this Contract id + the codex finding id they derive from |

## 14. Implementation Checklist (Definition of Done)

- [ ] DoD-1: §7.A applied + parent Decision lint clean.
- [ ] DoD-2: §7.B applied + parent Decision lint clean.
- [ ] DoD-3: §7.C applied + parent Decision lint clean.
- [ ] DoD-4: §7.D applied + corpus SPEC lint clean +
      check script updated for v1.1 SOURCE_LIST_VERSION.
- [ ] DoD-5: §7.E + §7.F applied + repack SPEC lint clean
      + validate-manifest.sh updated for v2.1 schema.
- [ ] DoD-6: §7.G follow-on Task SPEC queued in
      Completion Report.
- [ ] DoD-7: This Contract's §19 Completion Report filled
      with per-amendment commit SHAs.
- [ ] DoD-8: Re-run codex cross-family review on the
      amended state (post-remediation gate) BEFORE any
      further forward motion (chapter authoring, v2.1
      tag, Product B v1.0 release).

## 15. Acceptance Criteria

(See §13 for tests.)

- [ ] AC-1: SPEC lint clean
- [ ] AC-2: amended target SPECs lint clean
- [ ] AC-3: corpus check script clean post-§7.D
- [ ] AC-4: validate-manifest clean post-§7.E+§7.F
- [ ] AC-5: §7.G Task SPEC obligation queued in
      Completion Report
- [ ] AC-6: all amendment commits cite Contract id +
      codex finding id

## 16. Rollback Plan

Each sub-amendment is a separate commit; rollback is per-
commit `git revert`. If a single sub-amendment is rolled
back, the others stand. If the entire batch is rolled
back (e.g. the post-remediation codex review surfaces a
structural flaw in the amendment approach), all seven
sub-amendment commits revert and this Contract supersedes
to needs-revision.

## 17. Open Questions

- [ ] Q1: §7.G corpus-citation lint extension authoring
      timeline — within this remediation cycle, or
      deferred to a separate Product B v1.x cycle?
      Default: defer to its own cycle; do not block this
      Contract.
- [ ] Q2: Re-running cross-family review after this batch
      lands (DoD-8) — same Codex (gpt-5.5) or different
      reviewer for triangulation? `judgment://agent-
      synthesis`: same Codex is sufficient since the
      amendments derive from its findings; using a third
      family (Gemini? local OSS) for verification of the
      verification is rolls-royce-on-rolls-royce. Default:
      same Codex; mark Gemini cross-check as opt-in.
- [ ] Q3: Manifest schema v2.1 (§7.E + §7.F) requires
      consumers to update their tooling. The transition
      plan — symlink shim? grace period? — was flagged
      in Slice 2's residual risk. Default: no shims;
      v2.0.0 stays at v2.0.0; v2.1 is opt-in.

None of Q1-Q3 is `owner-blocking`; all can be deferred.

## 18. Migration / Coexistence

The amendments don't break v2.0.0 of agentic-ops-framework. <!-- lint-ok: no-citation -->
The manifest schema bump (v2.1.0) is opt-in; v2.0.0
consumers continue to work against the v2.0.0 schema. The
corpus source-list bump (v1.1) requires
check-corpus-completeness.sh to recognise the new version
— a one-line script edit.

The parent Decision amendments are SPEC-text only; no <!-- lint-ok: no-citation -->
artefact migration is needed.

## 19. Completion Report

### 19.1 Files changed

(to be filled — at Verification phase; expected: 4
target SPECs amended + check script + validator script;
~6-8 files touched)

### 19.2 Commands run

(to be filled)

### 19.3 Verification result

(to be filled)

### 19.4 Residual risk

(to be filled)

### 19.5 Spec evidence candidates

(to be filled)
