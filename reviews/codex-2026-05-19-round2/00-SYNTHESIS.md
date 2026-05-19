# Codex cross-family re-review (Round 2) — synthesis (2026-05-19)

Reviewer: same `gpt-5.5` / `xhigh` as Round 1.
Gate: DoD-8 of the Round 5 remediation Contract at
`file://../../specs/2026-05-19-codex-remediation-amendments/SPEC.md`
§14 — "re-run codex cross-family review on the amended state
BEFORE any further forward motion."

Three SPECs re-reviewed (the longread Contract was lightly
amended in Round 4 §6.5 only; re-review deferred until per-
chapter Task SPECs land).

## Aggregate verdict

**Three for three FAIL** at the gate. The remediation did
move every original finding forward — but it (a) left several
partially resolved with stale carry-through text and (b)
introduced its own new findings.

| SPEC | Original-finding outcome | New findings |
|---|---|---|
| Parent Decision | 2 RESOLVED, 2 PARTIAL | 3 (2 MAJOR + 1 ADVISORY) |
| Corpus | 3 PASS, 4 PARTIAL, 1 FAIL | 3 (1 HIGH + 2 MEDIUM) |
| v2.0 Repack | 2 RESOLVED, 2 PARTIAL, 2 OPEN | 3 (1 BLOCKER + 2 HIGH) |

Total Round-2 findings to address: **9 new findings** + **8
incomplete remediations** (PARTIAL / OPEN / FAIL) = **17
follow-ups**.

This is the expected shape of iterative cross-family review:
each pass catches what the previous pass missed. The findings
are smaller in scope than Round 1 but still substantive.

## Per-SPEC Round-2 findings

### 1. Parent Decision

Detailed review:
[`01-parent-decision.md`](./01-parent-decision.md).

**Remediation verdicts**:

| # | Verdict | Note |
|---|---|---|
| 1.1 | RESOLVED | §5.5 paper-style as REJECTED with rationale |
| 1.2 | PARTIAL | §7 + §9 name conformance + signing first-class, but §4 Decision Criteria doesn't list/weight the new criterion; §7 also allows unsigned at v1.0 which conflicts with "first-class at v1.0" wording |
| 1.3 | RESOLVED | Matrix rename substantive, not cosmetic |
| 1.4 | PARTIAL | §9 umbrella says "shape-without-SPEC-bundle" but includes SPEC-bundle-only; §5.5 paper-style could compose with SPEC bundle (academic-primary + bundle path ambiguously unclosed) |

**New findings**:

- **MAJOR** parent SPEC §370: §7 still says "additional sub-spec
  facets beyond the eight catalogued in §6 above," but §6 is
  the trade-off matrix, not a facet catalog. Amendment didn't
  update this reference; promotion of conformance/signing
  past the original eight creates stale authority inside the
  normative section.
- **MAJOR** parent SPEC §478: §11 Validation Plan + §12 AC
  still describe the pre-amendment shape ("Candidates 5.1-5.4",
  "this SPEC compares 4", "6 × 4 cells") despite the amended
  §5/§6 now having six candidates and seven criteria.
- **ADVISORY** remediation Contract §126: references parent
  Decision §16 Reversal Plan, but the actual section is §10.

### 2. Corpus

Detailed review: [`02-corpus.md`](./02-corpus.md).

**Remediation verdicts**:

| # | Verdict | Note |
|---|---|---|
| 2.1 | PARTIAL | Completion Report now admits the lint gap honestly; no mechanical corpus citation gate exists yet (queued §7.G) |
| 2.2 | PASS | INDEX status truth fixed for adr-tools-state + structurizr-dsl + json-schema |
| 2.3 | PASS | json-schema + cyclonedx-sbom added correctly; SOURCE_LIST_VERSION v1.1 |
| 2.4 | PARTIAL | oci-artifacts §3 now has Artifacts Guidance evidence, but stale "not deep-read" text in §2 + §6 contradicts §3 |
| 2.5 | PASS | C4 Docker disambiguation correctly downgraded |
| 2.6 | PARTIAL | §5 scoped to "identified by this project's research", but front-matter still says "only in-the-wild example" globally |
| 2.7 | PASS | Willison endorsement strength corrected |
| 2.8 | PARTIAL | §3 labels paraphrase, but §5 still quotes "blindly deploying methodologies verbatim fails" as if exact |
| 2.9 | FAIL | Caveat added, but unlicensed "strongest current implementation" claim still present in nix-flakes §5 and INDEX summary |

**New findings**:

- **HIGH** scripts/check-corpus-completeness.sh §78: accepts
  `partial` rows and still prints "all complete", contradicting
  SPEC §7.2 which says exit 0 only when every slug is
  `primary-read-complete` or documented `access-blocked`.
- **MEDIUM** corpus SPEC §619 + §521: Completion Report and
  AC-4 still say "20 rows" / "all 20 rows at status:
  primary-read-complete" despite v1.1 expansion to 22 sources
  with 3 at `partial`.
- **MEDIUM** cyclonedx-sbom §84 + §121: overreaches with
  "canonical" and "directly addresses" while §6 admits SPDX
  needs separate primary comparison.

### 3. v2.0 Repack

Detailed review: [`03-v2-repack.md`](./03-v2-repack.md).

**Remediation verdicts**:

| # | Verdict | Note |
|---|---|---|
| 3.1 | RESOLVED | Acceptance commands now all pass |
| 3.2 | PARTIAL | Facet primaries use url://; target SPEC still has many cross-repo file:// |
| 3.3 | OPEN | CONTRIBUTING.md mostly corrected; TASK.template.md + multiple skills still reference old paths |
| 3.4 | RESOLVED | fleet-sync guard refuses cleanly with exit 65 |
| 3.5 | PARTIAL | §8 defines new v2.1 fields and manifest.yaml has schema_uri / source_tag / media_type / status / provenance; source_commit is empty, source_tag stale, digest/size unpopulated, validator ignores new fields |
| 3.6 | OPEN | Manifest has behavior.primary_index; validator does not enforce required primary_index for directory primaries |

**New findings**:

- **BLOCKER** validate-manifest.sh §139: does not enforce v2.1
  `primary_index` for directory primaries. SPEC §592/§602
  binds the validator to enforce it, but the script only
  checks whether primary is dir-vs-file. Never parses
  primary_index, media_type, digest, size, provenance,
  schema_uri, or source fields. Same fingerprint as Round-1
  finding 3.1 (acceptance command claims behavior the
  tooling doesn't actually have).
- **HIGH** manifest.yaml §6-8: provenance fields not
  trustworthy: `source_commit` empty; `source_tag: v2.0.0`
  points to tag commit `f0c75fc…` while current HEAD is
  `ad36bda…`; tag's manifest still has `spec_version: 2.0.0`.
  `schema_uri` points at `main`, not immutable tag/commit.
- **HIGH** TASK.template.md §50 + skills: v1.1 → v2.0
  migration still incomplete in executable guidance — old
  `templates/`, `skills/`, `workflow/`, `agents/` paths
  remain. Same fingerprint as Round-1 finding 3.3 (PARTIAL
  rather than fully fixed).

## Highest-impact themes (Round 2)

1. **Validator gap mirrors the Round-1 BLOCKER pattern**.
   Round 1 caught an acceptance command that didn't verify what
   the SPEC claimed; Round 2 caught a validator that doesn't
   enforce what the v2.1 schema claims. The fingerprint is
   identical: SPEC text + machine gate drifted.
2. **Stale text after amendment is the dominant new-finding
   class**. Amendments updated some sections but left related
   sections (§4 Decision Criteria, §11 Validation Plan, §12 AC,
   Completion Report row counts, front-matter summaries) at
   pre-amendment state. Pattern: amendments need a per-target
   "stale-text audit" before flipping verified.
3. **Provenance fields populated but not trustworthy**. v2.1
   manifest schema added source_commit + source_tag +
   schema_uri but the actual values don't match current HEAD
   or point at immutable refs. Pattern: schema design and
   release-tooling integration are separate; the manifest
   currently lies about provenance.
4. **Carry-through gaps from migrations**. The v2.0 path
   migration that should have completed in Round 3 is still
   incomplete in templates + skills. Bulk sed missed the
   contextual paths inside template-content (which look like
   adopter-relative paths but were left pointing at v1.x
   layout).

## Remediation plan (Round 3)

### Priority 1 — Validator gap (BLOCKER 3.x v2.1 primary_index enforcement)

- Extend `validate-manifest.sh` to:
  - Parse `primary_index` field when `primary` ends in `/`.
  - Verify `primary_index` file exists inside the primary
    directory.
  - Verify the file's extension matches `media_type`
    conventions (text/markdown → .md, text/x.gherkin →
    .feature).
- Update SPEC §9.1 pseudocode to match.

### Priority 2 — Provenance trust-worthiness (HIGH 3.x manifest)

- Populate `source_commit` with current HEAD SHA OR
  document that release tooling at tag time is the populating
  step + add a CI / pre-commit hook that errors if a tagged
  release lands with empty source_commit.
- Fix `source_tag: v2.0.0` → either empty (we're between
  tags) or point at a future v2.1 tag once cut.
- Pin `schema_uri` to a commit or tag rather than mutable
  `main` branch.

### Priority 3 — Stale text + carry-through (MAJOR + HIGH parent + corpus + repack)

- **Parent Decision**: update §4 Decision Criteria to include
  the new "Executable conformance + signed-distribution
  surface" criterion with source + weight. Update §7 facet-
  catalog reference to point at §6.1 (or wherever the new
  authoritative facet list is). Update §11 Validation Plan
  ("Candidates 5.1-5.4" → "5.1-5.6") and §12 AC ("compares 4"
  → "compares 6", "6 × 4 cells" → "7 × 6 cells"). Fix
  remediation Contract §126 (§16 → §10).
- **Corpus**: update SPEC Completion Report ("20 rows" → "22
  rows including 3 partial"). Update AC-4 to acknowledge
  partial status. Fix nix-flakes "strongest" claim in §5 +
  INDEX. Fix symphony-spec front-matter "only in-the-wild
  example" wording. Fix oci-artifacts §2 + §6 stale "not deep-
  read" text. Fix ref-arch-vs-solution-arch §5 to label the
  remaining quoted phrase as paraphrase. Soften cyclonedx-sbom
  "canonical" + "directly addresses" to "a primary SBOM
  option".
- **Corpus check script**: tighten so `partial` rows are
  acceptable iff the artefact §6 documents what was not deep-
  read AND a v1.x roadmap row exists; current behaviour
  treats partial as complete which contradicts SPEC §7.2.
- **Repack**: complete v2.0 path migration in TASK.template.md
  + spec-authoring SKILL.md + approved-spec-decomposition
  SKILL.md.

### Priority 4 — Resolve §1.4 academic-primary + bundle ambiguity (PARTIAL)

- Parent Decision §9 needs an explicit foreclose entry for
  "academic-primary publication channel even with SPEC
  bundle attached" OR a permitted-with-conditions clause.

### Acknowledged-and-deferred

- §7.G corpus-citation lint extension (Round-1 finding 4.2)
  remains queued; not addressed in Round 2 either.
- §2.1 lint impedance is partial-by-design; corpus-mode
  lint is the deferred-tooling fix.

## Sequence

Same structure as Round 1: one consolidated remediation
amendment Contract for the 17 follow-ups, owner-approved as
a batch, then Round 3 codex re-review on the amended state.

The pattern is converging (Round 1: 27 findings; Round 2: 9
new + 8 PARTIAL = 17 follow-ups; expect Round 3 to surface
fewer). Diminishing returns kick in eventually — at some
point owner judgement decides the remaining findings are
acceptable trade-offs, not blockers.

## What this confirms (Round 2)

- Cross-family review is iteratively useful: Round 1 caught
  the structural issues; Round 2 caught the implementation-
  vs-SPEC drift the structural fixes introduced.
- Amendments need a "stale-text audit" step before flipping
  verified — sections that reference the amended sections
  also need updating.
- Machine gates (lint, validate-manifest, check-corpus-
  completeness) need to actually verify what the SPEC claims
  they verify. The v2.1 validator-gap mirrors Round-1's
  acceptance-command-gap fingerprint.

Capture as spec-evidence: cross-family review is not a
one-shot gate; it's an iterative gate that converges over
multiple rounds. Budget for it accordingly.
