---
id: 2026-05-19-primary-source-research-corpus
status: in-execution
type: contract
owner: HasNoBeef
repo: agentic-installation-methodology
branch_policy: main-direct
risk: medium
requires_network: true
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
  - test -f research/primary-sources/INDEX.md
  - bash scripts/check-corpus-completeness.sh
cites_decision: 2026-05-18-agentic-installation-methodology
---

# SPEC: Primary-Source Research Corpus (Deep-Research Preface)

Status: Draft v1
Type: Contract
Purpose: govern the production of a structured primary-source
research corpus that grounds every methodology claim in
arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
Agent Spec / reference-architecture literature before any
methodology content (longread, SPEC bundle) lands. The corpus
is the citable evidence base downstream slices draw from;
the SPEC defines its shape, completeness gates, and
citation discipline.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

## 1. Problem Statement

The 2026-05-17 research workpad
(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
or upstream
`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
§12 Verification Caveats records that several primary
sources were "access-denied and characterized via WebSearch
summaries cross-checked against multiple sources" — arc42,
C4, ADR, Diátaxis, 12-factor. The methodology Product B
publishes draws heavily on those primitives (research §3,
§4, §5). Owner directive
`decision-authority://owner:2026-05-18` ("base this all in
deep research and best practices - not make up bullshit")
forecloses publishing claims grounded in agent summaries
when the primaries themselves are reachable with proper
tooling (WebFetch, archive.org, primary-PDF retrieval). The
methodology body (longread + SPEC bundle) MUST NOT land
before each in-scope primary has a structured corpus entry
that captures the verbatim claims the methodology depends
on. This SPEC defines the corpus shape, the per-source
artefact template, the completeness gate, and the citation
discipline that binds the longread and SPEC bundle
authoring slices to the corpus rather than to agent memory.

## 2. Goals and Non-Goals

Goals:

- Define an exhaustive in-scope source list with rationale
  per entry.
- Define the per-source artefact template: front-matter,
  fetch metadata, verbatim claim extracts, gap from prior
  agent summary, citation surface.
- Define a completeness gate enforced by a check script
  (`scripts/check-corpus-completeness.sh`) so the corpus's
  state is mechanically verifiable.
- Establish the citation grammar binding: every methodology
  claim in downstream artefacts MUST cite a corpus entry
  via `file://research/primary-sources/<slug>.md§<n>`, not
  agent memory.

Non-goals:

- Authoring the methodology longread or SPEC bundle
  (subsequent slices).
- Repacking Product A v1.1 into manifest+catalog v2.0
  (sibling slice).
- Resolving the seven open research questions enumerated in
  the dispositioned research workpad §2.3 — the corpus
  informs them; it does not pretend to resolve them.
- A literature review essay. The corpus is structured
  source artefacts, not synthesized prose.

## 3. System Overview

The deep-research corpus is a directory at
`research/primary-sources/` inside this repo. Each in-scope
source has one structured artefact at
`research/primary-sources/<slug>.md`. An `INDEX.md` at the
directory root lists every in-scope source, its slug, its
current status (`pending` / `primary-read-complete` /
`access-blocked` / `superseded`), and a one-line summary of
the verbatim claims the methodology depends on from that
source. A check script
(`scripts/check-corpus-completeness.sh`) walks the index and
reports gaps (`pending` entries, `access-blocked` entries
without an alternative-source-found note, slugs in the
index that lack a file under `research/primary-sources/`).

Downstream methodology slices (longread, SPEC bundle) cite
the corpus exclusively for primitives derived from these
sources. Lint at the corpus-citation surface is enforced by
a follow-on extension to `scripts/lint-spec.sh` (out of
scope for this SPEC; deferred to a follow-on Task SPEC).

The corpus is append-only on a per-entry basis; an entry
may be superseded by a follow-on entry (slug-suffixed
`-vN`) but never deleted. Provenance is preserved.

## 4. Authority Map

Active authority:

- `decision-authority://owner:2026-05-18` — owner directive
  ("base this all in deep research and best practices - not
  make up bullshit") binding deep-primary-source discipline
  before any methodology content lands.
- Parent Decision SPEC at
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — binds Product B shape; §9 Locks unlock authoring of
  follow-on slices including this preface.
- Dispositioned research workpad at
  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §12 Verification Caveats — names the specific access-
  denied primaries that this corpus closes the gap on.
- `file://schema/SPEC.schema.md` — citation grammar,
  RFC 2119 scoping rules, front-matter schema.

Stale, superseded, or evidence-only:

- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
  — superseded research workpad; evidence-only.

Owner decisions required before implementation:

- [ ] Confirm the §6 Domain Model source list is exhaustive
      for v1.0; subsequent additions land as follow-on
      Contract SPEC amendments.

## 5. Code/Docs Reality Check

- The `research/primary-sources/` directory does not yet
  exist (`cmd://ls research/` returns "No such file" before
  this slice executes).
- The check script `scripts/check-corpus-completeness.sh`
  does not yet exist (`cmd://test -f
  scripts/check-corpus-completeness.sh` exits non-zero
  pre-execution).
- The `WebFetch` tool is the primary retrieval mechanism;
  fallback is `cmd://curl -fsSL --max-time 30` for
  endpoints WebFetch fails on, with archive.org
  (`url://web.archive.org/web/*/`) as the
  access-blocked fallback.

## 6. Domain Model

### 6.1 In-scope sources (v1.0)

| Slug | Source | Primary URL | Why in scope |
|---|---|---|---|
| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
| symphony-spec | OpenAI Symphony SPEC.md | `url://github.com/openai/symphony/blob/main/SPEC.md` | In-the-wild operating-model-as-SPEC; research §3 transferable building blocks |
| spec-kit | GitHub Spec Kit | `url://github.com/github/spec-kit` | Closest spec-as-authoring tool; research §2.1 |
| kiro | Kiro spec-driven IDE | `url://kiro.dev` | Spec-driven IDE; research §2.1 |
| openspec | OpenSpec project | `url://github.com/Fission-AI/OpenSpec` | New agentic spec project; surfaced by recent field state |
| oracle-agent-spec | Oracle Agent Spec | `url://github.com/oracle/agent-spec` | Spec-as-agent-description; research §2.1 |
| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
| leaddev-agent-compiled | LeadDev "Can you trust the spec" article | `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software` | Closest published statement of the agentic-installation hypothesis (as risk); research §2.2 |
| cucumber-gherkin | Cucumber / Gherkin reference | `url://cucumber.io/docs/gherkin/reference/` | Behavioral acceptance primitive; research §5.1 |
| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
| structurizr-dsl | Structurizr DSL (C4 implementation) | `url://docs.structurizr.com/dsl` | Machine-readable C4; research §5.1 |

`SOURCE_LIST_VERSION: v1.0` — additions land as follow-on
Contract SPEC amendments per §17 Open Questions.

### 6.2 Per-source artefact schema

Each `research/primary-sources/<slug>.md` is a markdown
document with the following front-matter and section
structure:

```yaml
---
slug: <slug>            # matches §6.1 row
source_name: "<Full name>"
primary_url: "<URL>"
fetched_via: "WebFetch" | "curl" | "archive.org" | "manual"
fetched_on: <YYYY-MM-DD>
fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
fetch_evidence: "<one-line digest of fetch result or
                  fallback used>"
supersedes: <slug>      # OPTIONAL; for vN entries
methodology_relevance: |
  <one-paragraph statement of which methodology claims
   draw on this source>
---
```

Required sections (in order):

1. **§1 Source identity** — name, canonical URL,
   maintainer / publisher, license / copyright posture
   (the bar for fair-use excerpts in our corpus).
2. **§2 Fetch trace** — what was attempted, what worked,
   what was blocked. Cites the agent tool calls
   (`cmd://WebFetch <url>`, `cmd://curl -fsSL <url>`)
   with one-line outcome digests.
3. **§3 Verbatim claims this corpus depends on** —
   the primary's own words, quoted. Each quote is
   attributed by §-and-paragraph (or chapter / section
   identifier from the source) and accompanied by a
   methodology-relevance note. Quotes MAY be excerpted
   per fair-use limits per §6.3.
4. **§4 Gap from prior summary characterization** — what
   the 2026-05-17 research workpad (or earlier agent
   summaries) got right, what it got wrong or imprecise,
   and what new primary-anchored claims are now available
   to the methodology body.
5. **§5 Downstream-citation surface** — the set of
   methodology claims this entry now licenses, expressed
   as `methodology-claim: "<claim>"` paired with the
   §1-§3 anchor that supports it.
6. **§6 Open questions surfaced by the primary read** —
   things the primary itself doesn't answer that the
   methodology may have to flag as open. Distinct from
   the seven research-workpad open questions; these
   are primary-anchored unknowns.

### 6.3 Citation and fair-use posture

Verbatim quotes in §3 of each artefact are excerpts for
research and methodology purposes; per US fair-use
doctrine (and equivalents in other jurisdictions), the
corpus is editorial commentary on published sources, not
republication. Each quote is bounded — typically
≤ 50 words, never exceeding the smaller of (a) one
paragraph of source text or (b) 200 words. The artefact
is the methodology's editorial citation surface, not a
mirror. When the source's license is permissive
(Apache-2.0 / MIT / CC-BY for documentation), longer
excerpts MAY be included with attribution.

### 6.4 INDEX.md contract

`research/primary-sources/INDEX.md` is the corpus's
machine-checkable index. Format:

```markdown
# Primary-source corpus index

Source-list version: v1.0
Last updated: <YYYY-MM-DD>

| Slug | Status | Fetched on | Methodology summary |
|---|---|---|---|
| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
| ... | ... | ... | ... |
```

Every row's `Slug` MUST correspond to a `<slug>.md` file in
the directory; every `<slug>.md` file MUST have a row in
INDEX.md. The check script enforces both directions.

## 7. Behavior Specification

### 7.1 Per-source read procedure

For each in-scope source (§6.1):

1. **Identify primary URL.** Use §6.1's primary URL as
   starting point.
2. **Fetch via WebFetch.** Capture the response. If
   WebFetch returns content, set `fetched_via: WebFetch`.
3. **Fallback chain on failure.** If WebFetch fails:
   a. Retry with `curl -fsSL --max-time 30 <url>`.
   b. If primary URL is access-blocked, attempt
      `url://web.archive.org/web/<recent-snapshot>/<url>`
      via WebFetch.
   c. If all fail, set `fetch_outcome: access-blocked`
      and §2 Fetch trace records every attempted call.
      The slug remains in INDEX.md with that status; an
      alternative-source-found note is REQUIRED in §6
      Open Questions of that artefact OR the
      methodology MUST NOT cite primitives from that
      source in downstream slices.
4. **Extract verbatim claims** germane to the
   methodology's §3 / §4 / §5 from the research workpad
   (or the dispositioned-research §11.5 disposition
   table). Each quote is attributed and bounded per §6.3.
5. **Author the artefact** at
   `research/primary-sources/<slug>.md` per §6.2 schema.
6. **Update INDEX.md** to add the row (or update status
   if the slug already had a `pending` placeholder).
7. **Lint the artefact**:
   `bash scripts/lint-spec.sh
   research/primary-sources/<slug>.md` SHOULD exit 0.
   The lint may not be a perfect fit for non-SPEC
   artefacts; lint exit 1 on a corpus artefact is
   advisory unless the failure is uncited-claim, which
   IS blocking — corpus artefacts above all else MUST
   carry citations.

### 7.2 INDEX-driven check script

`scripts/check-corpus-completeness.sh` MUST:

1. Read INDEX.md and parse every row.
2. For each row's slug, verify
   `research/primary-sources/<slug>.md` exists.
3. For each `<slug>.md` file, verify a row exists in
   INDEX.md with matching slug.
4. Verify every row's status is one of
   `primary-read-complete | partial | access-blocked |
   superseded | pending`.
5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
   version frozen in §6.1 of this SPEC.
6. Exit 0 if every slug in INDEX.md is either
   `primary-read-complete` or has a documented
   `access-blocked` (with §6 alternative note); else
   exit non-zero with diagnostic lines per gap.

### 7.3 Corpus citation binding (downstream slices)

Downstream methodology slices (longread, SPEC bundle)
cite primitives from these sources via
`file://research/primary-sources/<slug>.md §<n>` or by
fully-qualified-URL-with-corpus-anchor
`file://research/primary-sources/<slug>.md` when the
whole entry is the relevance. Agent memory and prior
agent summaries are NOT citable for any claim drawn
from a source in §6.1's scope.

The lint extension to enforce this binding is out of
scope; it lands as a follow-on Task SPEC. In the
interim, reviewers (cross-family and same-family)
enforce manually.

## 8. Schema Specification

### 8.1 Per-source artefact front-matter (formal)

```yaml
slug:               # string; matches §6.1 row; required
source_name:        # string; required; full source name
primary_url:        # string; required; canonical URL
fetched_via:        # enum: WebFetch | curl | archive.org | manual
fetched_on:         # date: YYYY-MM-DD; required
fetch_outcome:      # enum: primary-read-complete | partial |
                    #       access-blocked
fetch_evidence:     # string; required; one-line digest
supersedes:         # string; optional; slug of prior entry
methodology_relevance: |  # string; multi-line; required
```

### 8.2 INDEX.md row schema (formal)

A pipe-delimited markdown table with columns:

| Slug | Status | Fetched on | Methodology summary |

Where:

- `Slug` is a kebab-case identifier matching §6.1.
- `Status` is one of: `primary-read-complete`, `partial`,
  `access-blocked`, `superseded`, `pending`.
- `Fetched on` is `YYYY-MM-DD` or `—` when status is
  `pending`.
- `Methodology summary` is a one-sentence summary.

## 9. Reference Algorithms

### 9.1 Completeness check (pseudocode)

```
function check_corpus_completeness():
  index = read_index_md()
  slugs_in_index = set(row.slug for row in index.rows)
  slugs_in_files = set(basename(f, ".md")
                       for f in glob("research/primary-sources/*.md")
                       if basename(f) != "INDEX.md")
  missing_files = slugs_in_index - slugs_in_files
  orphan_files = slugs_in_files - slugs_in_index
  pending = [row for row in index.rows
             if row.status == "pending"]
  blocked_without_note = [row for row in index.rows
                          if row.status == "access-blocked"
                          and not row_has_access_blocked_note(row)]
  if missing_files or orphan_files or pending or blocked_without_note:
    emit_diagnostics()
    exit 1
  if index.source_list_version != SPEC_FROZEN_VERSION:
    emit_diagnostic("source list drift")
    exit 1
  exit 0
```

## 10. Failure Model

### 10.1 Failure classes

| Class | Trigger | Recovery |
|---|---|---|
| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
| `quote-overrun` | Verbatim §3 quote exceeds the §6.3 fair-use bound | Reviewer rejects the artefact at corpus-completion review; author shortens to compliant excerpt |
| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
| `summary-without-primary` | A claim in INDEX.md's `Methodology summary` column is not anchored by a verbatim quote in the corresponding artefact's §3 | Reviewer rejects; author either anchors the claim or removes it from the summary |
| `slug-collision` | Two artefacts share a slug | Force-fix; one or both renamed; INDEX.md updated |
| `supersession-loop` | Artefact A is `supersedes: B` AND B is `supersedes: A` | Force-fix; the supersession DAG is acyclic |

### 10.2 Recovery posture

The corpus is forgiving on form, strict on substance. A
mis-formatted front-matter field is a recoverable bug; a
methodology claim without a primary anchor is a violation
of the owner directive and blocks the methodology body
from landing.

## 11. Trust Boundary / Security

### 11.1 Trust boundary

- The corpus consumes external content fetched from
  third-party URLs. Each fetch is treated as untrusted
  input: the agent (WebFetch / curl) returns content; the
  artefact author extracts text and attributes it; no
  fetched content is executed.
- The fetched URLs themselves are recorded; consumers of
  the corpus can re-fetch and verify.

### 11.2 Adversarial spec consumption (research §2.3.7)

The methodology Product B publishes flags adversarial spec
consumption as an open research question. The corpus
itself, by exposing the verbatim sources, INHERITS that
risk surface for any downstream agent that fetches the
corpus: a malicious primary URL could carry prompt
injection. Mitigation: the corpus's §2 Fetch trace records
the URL and content digest at fetch time; downstream
agents that re-fetch SHOULD verify the digest matches.
The methodology MUST flag this as an open risk for
agents consuming the SPEC bundle.

## 12. Observability

- Each artefact's §2 Fetch trace logs the agent tool
  invocation and outcome.
- INDEX.md is the single index surface; reading it gives
  the corpus's state.
- `check-corpus-completeness.sh` exit code + diagnostics
  is the mechanical observability surface.

## 13. Test and Validation Matrix

| AC | Test |
|---|---|
| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
| AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
| AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |

## 14. Implementation Checklist (Definition of Done)

- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
      authored, executable, lint clean against shellcheck
      defaults.
- [ ] DoD-2: `research/primary-sources/INDEX.md` authored
      with rows for every §6.1 slug; statuses set
      accurately.
- [ ] DoD-3: Per-source artefact authored at
      `research/primary-sources/<slug>.md` for every §6.1
      slug, conforming to §6.2 schema + §8.1 front-matter.
- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
      through AC-9 all pass.
- [ ] DoD-6: This SPEC's §17 Open Questions are all
      resolved or explicitly deferred to follow-on Task
      SPECs.

## 15. Acceptance Criteria

- [ ] AC-1: `cmd://bash scripts/lint-spec.sh
      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
      exits 0.
- [ ] AC-2: `cmd://test -f
      research/primary-sources/INDEX.md` exits 0.
- [ ] AC-3: `cmd://test -x
      scripts/check-corpus-completeness.sh` exits 0.
- [ ] AC-4: `cmd://bash
      scripts/check-corpus-completeness.sh` exits 0 with
      every §6.1 slug at status
      `primary-read-complete` OR `access-blocked` + note.
- [ ] AC-5: Every §6.1 slug has a corresponding
      artefact file under `research/primary-sources/`.
- [ ] AC-6: Every artefact's front-matter passes the §8.1
      schema check.
- [ ] AC-7: No verbatim §3 quote exceeds the §6.3
      fair-use bound (or, if it does, the source's
      license is recorded as permitting it).
- [ ] AC-8: §17 Completion Report records per-source
      fetch outcomes + any access-blocked resolutions.
- [ ] AC-9: Cross-family review (BLOCKING per parent
      Decision §7) signs off OR same-family-proxy is
      recorded with the cross-family-deferral rationale.

## 16. Rollback Plan

The corpus is append-only; rollback is a directed-graph
problem.

Triggers for rollback:

- A fetched primary source is later proven misattributed
  (e.g. the URL we fetched was a spoof; the real source
  contradicts it).
- The source-list version drifts because §6.1 is
  amended (a §6.1 amendment is a Contract SPEC
  amendment under the v1 procedure).

Exit procedure:

1. The affected slug's artefact is superseded by a vN
   entry citing the misattribution evidence.
2. INDEX.md row is updated to point to the new vN slug.
3. Downstream methodology slices that cited the
   superseded artefact MUST be re-reviewed against the
   new vN.

The corpus directory itself never has files deleted;
provenance is preserved.

## 17. Open Questions

- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
      Subsequent additions (a new primary source surfaces
      during longread authoring) require a Contract SPEC
      amendment per §16. Default: defer; not a blocker.
- [ ] Q2: The corpus-citation-binding lint extension is
      out of scope; reviewers enforce manually. Whether
      to add the lint extension as a follow-on Task SPEC
      is deferred; recommend yes once the corpus is
      populated and the citation surface is concrete.
- [ ] Q3: Cross-family review for THIS Contract SPEC.
      The parent Decision §7 makes cross-family review
      BLOCKING per slice. Same-family self-review is the
      default fallback; Codex (or other non-Claude) pass
      is the rigorous path. Owner directive applies
      ("base this all in deep research" suggests rigour).
      Default: same-family proxy with explicit caveat
      recorded; if owner directs external cross-family,
      escalate.
- [ ] Q4: Are there primary sources missing from §6.1
      that should land in v1.0? Specifically: SPDX/SBOM
      (CycloneDX), Pact for contract testing, JSON
      Schema (separately from Helm values), CUE
      (configuration language). Defer to owner; not a
      blocker for v1.0 if absent.

Neither Q1-Q4 is `owner-blocking`; all can land as
follow-on Contract SPEC amendments without re-work of
the corpus already produced.

## 18. Migration / Coexistence

The corpus is greenfield; nothing migrates from prior
state. The 2026-05-17 dispositioned research workpad
(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
remains the upstream record of the field-state survey
that motivated this corpus; it is NOT replaced by the
corpus. The corpus supplements the workpad with
primary-source rigor that the workpad explicitly flagged
as missing (§12 Verification Caveats).

Downstream methodology slices reference both: <!-- lint-ok: no-citation -->

- The workpad as the historical synthesis (the
  hypothesis space). <!-- lint-ok: no-citation -->
- The corpus as the primary-source-anchored evidence
  the methodology actually rests on. <!-- lint-ok: no-citation -->

## 19. Completion Report

### 19.1 Files changed

(to be filled — at Verification phase)

### 19.2 Commands run

(to be filled — at Verification phase)

### 19.3 Verification result

(to be filled — at Verification phase)

### 19.4 Residual risk

(to be filled — at Verification phase)

### 19.5 Spec evidence candidates

(to be filled — durable lessons for the
spec-evidence-governance skill)
