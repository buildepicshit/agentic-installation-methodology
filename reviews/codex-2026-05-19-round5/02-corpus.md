Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e4346-df24-77f3-83eb-e33575017d05
--------
user
Cross-family re-review Round 5 (gpt-5.5; final convergence). Target: specs/2026-05-19-primary-source-research-corpus/SPEC.md + research/primary-sources/ + scripts/check-corpus-completeness.sh. Round 4 flagged: MEDIUM AC-4 wording stale, MEDIUM Completion Report residual-risk partial truth (3 of 3 needed), LOW §17 Q4 stale. R5 fixes at afc2ba0 + self-audit §19.0 Amendment Log at c9adcc6. Verify + surface remaining. Output Quality Gate Result. No mutations.
codex
I’ll keep this read-only and start by confirming the exact head/commit context, then inspect the amended SPEC language, the corpus inventory, and the completeness checker before running any verification commands.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
## main...origin/main
?? reviews/codex-2026-05-19-round5/

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git rev-parse --short HEAD && git log --oneline -5' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
c9adcc6
c9adcc6 fix(corpus): §19.0 Amendment Log + historical evidence labelled (self-audit recurring category)
afc2ba0 fix(corpus r4): AC-4 wording + Completion Report partial truth + §17 Q4 close (codex R4)
bdc42e5 review: codex Round 4 cross-family re-review
b9ec450 fix(corpus r3): nix front-matter/§4 + cyclonedx §5 overreach + SPEC §7.2 partial rule (codex Round-3)
b99413d review: codex Round 3 cross-family re-review (post Round-3 remediation)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"AC-4|Completion Report|residual|Residual|Q4|19\\.0|Amendment Log|Round 5|afc2ba0|c9adcc6\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
197:mandatory (deferred to corpus §17 Q4 v1.2 expansion):
500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
505:| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
534:- [x] AC-4: `cmd://bash
545:- [x] AC-8: §17 Completion Report records per-source
597:- [x] Q4: Are there primary sources missing from §6.1?
608:Neither Q1-Q4 is `owner-blocking`; all can land as
630:## 19. Completion Report
671:### 19.0 Amendment log (post-verification edits)
674:§14.0, this Completion Report was filled at original
708:  original verification; 55 current per §19.0 Amendment
751:- AC-4: check-corpus-completeness.sh exits 0; 22
765:- AC-8: this Completion Report records the per-source
781:### 19.4 Residual risk
794:  finding 2.2 closed this gap; original residual-risk

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,240p' scripts/check-corpus-completeness.sh" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
#!/usr/bin/env bash
# check-corpus-completeness.sh — mechanical completeness gate for
# the primary-source research corpus at research/primary-sources/.
#
# Authority:
# file://specs/2026-05-19-primary-source-research-corpus/SPEC.md §7.2,
# §9.1, §13 AC-4.
#
# Verifies:
# 1. INDEX.md exists and parses.
# 2. Every slug in INDEX has a matching <slug>.md file.
# 3. Every <slug>.md file (other than INDEX.md) has a row in INDEX.
# 4. Every status is one of:
#    primary-read-complete | partial | access-blocked | superseded | pending.
# 5. SOURCE_LIST_VERSION matches the value frozen in the SPEC.
# 6. No row at status: pending (the corpus is closed when this script
#    exits 0; pending rows mean incomplete work).
# 7. Every access-blocked row has an alternative-source-found note OR
#    an explicit unreachability disclaimer (heuristic: §6 Open Questions
#    in the artefact mentions "alternative" or "unreachable").
#
# Exit 0 iff the corpus is complete; non-zero with diagnostics to stderr
# otherwise.

set -uo pipefail

# Resolve repo root from script location.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CORPUS_DIR="$REPO_ROOT/research/primary-sources"
INDEX_FILE="$CORPUS_DIR/INDEX.md"
SPEC_FILE="$REPO_ROOT/specs/2026-05-19-primary-source-research-corpus/SPEC.md"

EXPECTED_VERSION="v1.1"

fail() {
    printf 'check-corpus-completeness: FAIL — %s\n' "$1" >&2
    exit 1
}

# 1. INDEX exists.
if [ ! -f "$INDEX_FILE" ]; then
    fail "INDEX.md not found at $INDEX_FILE"
fi

# 2. SOURCE_LIST_VERSION matches.
actual_version="$(grep -E '^Source-list version:' "$INDEX_FILE" | head -1 | sed -E 's/^Source-list version:[[:space:]]+//')"
if [ "$actual_version" != "$EXPECTED_VERSION" ]; then
    fail "INDEX SOURCE_LIST_VERSION mismatch: expected '$EXPECTED_VERSION', got '$actual_version'"
fi

# 3. Parse INDEX rows.
# Row format: | <slug> | <status> | <date-or-dash> | <summary> |
# Skip header + separator lines (first two | lines).
mapfile -t rows < <(grep -E '^\|' "$INDEX_FILE" | tail -n +3 | sed -E 's/^\|[[:space:]]*//;s/[[:space:]]*\|[[:space:]]*/|/g;s/[[:space:]]*\|$//')

if [ ${#rows[@]} -eq 0 ]; then
    fail "INDEX.md has no data rows"
fi

declare -A index_slugs
declare -A index_status
issues=()

valid_statuses="primary-read-complete partial access-blocked superseded pending"

for row in "${rows[@]}"; do
    IFS='|' read -r slug status fetched_on summary <<<"$row"
    [ -z "$slug" ] && continue
    index_slugs["$slug"]=1
    index_status["$slug"]="$status"

    # 4. Status valid.
    if ! printf '%s\n' $valid_statuses | grep -qFx "$status"; then
        issues+=("invalid status '$status' for slug '$slug'")
    fi

    # 5. No pending.
    if [ "$status" = "pending" ]; then
        issues+=("slug '$slug' is still status: pending")
    fi

    # 6. Matching file exists.
    if [ ! -f "$CORPUS_DIR/$slug.md" ]; then
        issues+=("slug '$slug' in INDEX has no matching file at research/primary-sources/$slug.md")
    fi

    # 6b. Partial-status artefact MUST document what was NOT deep-read.
    # Per SPEC §7.2, partial is acceptable iff the artefact §6 records
    # the deferred-reads note (codex Round-2 finding: previously the
    # script silently accepted partial and printed "all complete").
    if [ "$status" = "partial" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
        if ! grep -qiE 'not deep-read|deep-read.*deferred|deferred to|sub-page.* NOT|reserved for v1\.|reserved for follow-on' "$CORPUS_DIR/$slug.md"; then
            issues+=("slug '$slug' is partial but artefact has no deferred-reads note in §6 (per SPEC §7.2 partial requires explicit disclosure of what was not deep-read)")
        fi
    fi

    # 7. Access-blocked must record an alternative or unreachability note in §6.
    if [ "$status" = "access-blocked" ] && [ -f "$CORPUS_DIR/$slug.md" ]; then
        if ! grep -qiE 'alternative|unreachable|fallback' "$CORPUS_DIR/$slug.md"; then
            issues+=("slug '$slug' is access-blocked but artefact has no alternative-source-found or unreachability note")
        fi
    fi
done

# 8. Orphan files (file exists but no INDEX row).
for f in "$CORPUS_DIR"/*.md; do
    [ -f "$f" ] || continue
    base="$(basename "$f" .md)"
    [ "$base" = "INDEX" ] && continue
    if [ -z "${index_slugs[$base]:-}" ]; then
        issues+=("orphan file: $base.md has no row in INDEX.md")
    fi
done

if [ ${#issues[@]} -gt 0 ]; then
    printf 'check-corpus-completeness: %d issue(s) found:\n' "${#issues[@]}" >&2
    for i in "${issues[@]}"; do
        printf '  - %s\n' "$i" >&2
    done
    exit 1
fi

n_rows=${#index_slugs[@]}
# Count partials for honest PASS reporting (codex Round-2 finding).
n_partial=0
for slug in "${!index_status[@]}"; do
    if [ "${index_status[$slug]}" = "partial" ]; then
        n_partial=$((n_partial + 1))
    fi
done
if [ $n_partial -gt 0 ]; then
    printf 'check-corpus-completeness: PASS — %d sources (%d partial with deferred-reads notes)\n' "$n_rows" "$n_partial"
else
    printf 'check-corpus-completeness: PASS — %d sources, all primary-read-complete\n' "$n_rows"
fi
exit 0

codex
Head is `c9adcc6`, with `afc2ba0` immediately beneath it, and the only visible worktree change is an untracked `reviews/codex-2026-05-19-round5/` directory. I’m treating that as out of scope and continuing with the tracked target files only.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '460,820p' specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:

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
| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
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

- [x] AC-1: `cmd://bash scripts/lint-spec.sh
      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
      exits 0.
- [x] AC-2: `cmd://test -f
      research/primary-sources/INDEX.md` exits 0.
- [x] AC-3: `cmd://test -x
      scripts/check-corpus-completeness.sh` exits 0.
- [x] AC-4: `cmd://bash
      scripts/check-corpus-completeness.sh` exits 0 with
      every §6.1 slug at status
      `primary-read-complete` OR `access-blocked` + note.
- [x] AC-5: Every §6.1 slug has a corresponding
      artefact file under `research/primary-sources/`.
- [x] AC-6: Every artefact's front-matter passes the §8.1
      schema check.
- [x] AC-7: No verbatim §3 quote exceeds the §6.3
      fair-use bound (or, if it does, the source's
      license is recorded as permitting it).
- [x] AC-8: §17 Completion Report records per-source
      fetch outcomes + any access-blocked resolutions.
- [x] AC-9: Cross-family review (BLOCKING per parent
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
- [x] Q4: Are there primary sources missing from §6.1?
      RESOLVED 2026-05-19 (codex remediation §7.D
      brought JSON Schema + CycloneDX SBOM into v1.1
      source list; `SOURCE_LIST_VERSION` bumped to
      v1.1). REMAINING v1.2 candidates: SPDX (alternate
      SBOM format), Pact (contract testing), CUE
      (configuration language), Dev Container Spec,
      SLSA/in-toto (supply-chain attestation). Defer
      to follow-on Contract SPEC amendment; not a
      blocker for v1.1 corpus closure.

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

- `scripts/check-corpus-completeness.sh` — mechanical
  corpus-completeness gate (new).
- `research/primary-sources/INDEX.md` — v1.1 corpus
  index (bumped from v1.0 per codex remediation §7.D);
  22 rows total: 19 at status: primary-read-complete, 3
  at status: partial with deferred-reads notes per
  SPEC §7.2 (adr-tools-state, structurizr-dsl,
  json-schema).
- `research/primary-sources/*.md` — 22 per-source
  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
  cyclonedx-sbom), all conforming to §6.2 schema +
  §8.1 front-matter:
  - arc42 (architecture documentation)
  - c4-model (architecture model)
  - adr-nygard (foundational ADR)
  - adr-tools-state (state-of-practice ADR)
  - diataxis (documentation taxonomy)
  - 12-factor (cloud-native SaaS methodology)
  - helm-values-schema (customization-affordance)
  - nix-flakes (reproducibility)
  - oci-artifacts (distribution packaging)
  - sigstore-cosign (signing)
  - symphony-spec (operating-model-as-SPEC)
  - spec-kit (spec-as-authoring tool)
  - kiro (agentic IDE)
  - openspec (spec-driven dev tool)
  - oracle-agent-spec (framework-agnostic agent
    description)
  - ref-arch-vs-solution-arch (ownership-split
    precursor)
  - leaddev-agent-compiled (published risk critique)
  - cucumber-gherkin (executable behavior spec)
  - openapi-3-1 (HTTP API contract)
  - structurizr-dsl (architecture-as-code)
- This SPEC's §15 Acceptance Criteria checkboxes
  flipped to checked.

### 19.0 Amendment log (post-verification edits)

Per the pattern established in the parent Decision SPEC
§14.0, this Completion Report was filled at original
verification 2026-05-19 (v1.0 source list, 20 sources).
Subsequent codex cross-family remediation rounds amended
§6.1 (v1.1 source-list expansion adding json-schema +
cyclonedx-sbom), §7.2 (partial-with-note rule),
research/primary-sources/* (overreach + status-truth
fixes), and the check script (partial enforcement).
Historical evidence values in §19.2 reflect original-
verification state, NOT current state.

| Round | Date | Notable | Current evidence |
|---|---|---|---|
| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |

Current-state evidence values supersede §19.2:
- corpus-SPEC citation-prefix hits: 55 (per current
  `lint-spec.sh` invocation)
- corpus row count: 22 (19 primary-read-complete +
  3 partial)
- script check: PASS — 22 sources (3 partial with
  deferred-reads notes)

### 19.2 Commands run (historical; original verification)

- 25 `cmd://WebFetch` invocations across the 22 sources
  (some sources required supplementary fetches; one
  redirect was followed from nixos.org to nix.dev; 2
  v1.1 fetches added: json-schema + cyclonedx-sbom per
  codex remediation §7.D).
- `cmd://bash scripts/lint-spec.sh
  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
  — exit 0 (0 errors, 0 warnings, 47 citation hits at
  original verification; 55 current per §19.0 Amendment
  Log).
- `cmd://bash scripts/check-corpus-completeness.sh` —
  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
- Per-artefact `cmd://bash scripts/lint-spec.sh
  research/primary-sources/<slug>.md` — exit 1 on each.
  Two issue classes:
  1. Front-matter shape: corpus artefacts use `slug:`
     not `type:`, so lint reports "missing
     type/implies_spec_type field" + "missing required
     section: ##". These are misapplied checks — the
     lint script is designed for SPEC artefacts.
  2. Uncited-claim: 18 of 22 artefacts have
     `fact-bearing paragraph lacks citation prefix`
     errors in §4 / §5 / §6 — meta-commentary bullets
     that reference §3 by section but lack an inline
     prefix the script's paragraph scanner recognises.
  **Cross-family review (codex finding 2.1) correctly
  identified this as a hack**: SPEC §7.1 says
  uncited-claim is BLOCKING on corpus artefacts, but
  these failures were waved off as front-matter noise.
  The honest reading is that the current lint is not
  fit-for-purpose on corpus artefacts and the in-place
  enforcement gap is a follow-on Task SPEC for a
  corpus-mode lint extension (or a separate
  `scripts/validate-corpus-citations.sh` script that
  applies only the uncited-claim subset of the
  citation grammar to corpus artefacts). Until that
  Task SPEC executes, `check-corpus-completeness.sh`
  is the authoritative mechanical gate and per-artefact
  citation density is reviewer-enforced. The corpus
  artefacts authored under this SPEC ARE densely cited
  (17+ citation prefixes per artefact), but the
  mechanical claim that uncited-claim is blocking
  cannot currently be verified by the script.

### 19.3 Verification result

PASS. All §15 ACs met:

- AC-1: SPEC.md lint clean (exit 0).
- AC-2: INDEX.md present.
- AC-3: check-corpus-completeness.sh present + executable.
- AC-4: check-corpus-completeness.sh exits 0; 22
  slugs total (19 primary-read-complete + 3 partial
  with deferred-reads notes per the §7.2 partial
  rule; codex remediation §7.D added json-schema +
  cyclonedx-sbom; codex Round-2 added the partial
  status-truth check to the script).
- AC-5: every §6.1 slug has corresponding `<slug>.md`
  artefact.
- AC-6: every artefact's front-matter conforms to
  §8.1 schema (manual review).
- AC-7: no verbatim §3 quote exceeds the 200-word
  fair-use bound (manual review; longest excerpts are
  the 18-section Symphony list and 12-factor's 12
  named factors, both well under bound).
- AC-8: this Completion Report records the per-source
  fetch outcomes (19 primary-read-complete + 3 partial
  with deferred-reads notes — adr-tools-state,
  structurizr-dsl, json-schema; zero access-blocked)
  and the source-list discoveries (Kiro Bedrock binding
  NOT confirmed by primary read; was an inferred
  binding in the prior research workpad).
- AC-9: cross-family review deferred. Same-family
  self-review performed; advisory recorded. Owner
  directive 2026-05-18 ("base this all in deep
  research, not make up bullshit") was the rigour bar;
  the corpus's verbatim-quote anchoring is the
  primary discharge of that obligation, with
  cross-family review as a secondary check that can
  land before downstream slices.

### 19.4 Residual risk

- **Per-artefact lint mismatch**: the lint script
  treats corpus artefacts as malformed SPECs (missing
  `type:` field; missing standard SPEC sections). Per
  §7.1, this is advisory; the corpus-completeness
  check is the authoritative gate. If future lint
  evolution adds corpus-mode, the per-artefact lint
  warnings disappear; meanwhile they are documented
  noise.
- **Three artefacts at `partial` status, with INDEX
  rows now correctly showing `partial` per the v1.1 +
  v1.2-pending status-truth alignment** (codex Round-2
  finding 2.2 closed this gap; original residual-risk
  text below labelled them "recorded primary-read-
  complete" which was false — the INDEX now matches the
  artefact front-matter):
  - `structurizr-dsl` — root page returned definition
    + C4-implementation framing; deep syntax (workspace
    / model / views keywords) was navigation-only on
    the fetched page. Fetch outcome `partial` in both
    artefact front-matter AND INDEX row. The load-
    bearing methodology claims (DSL purpose,
    architecture-as-code posture, C4 implementation)
    were anchored; deep syntax remains a deferred read.
  - `adr-tools-state` — root page returned community
    framing + template-family references but deep
    template specifics + CLI conventions live on
    sub-pages not fetched. Outcome `partial` in both
    front-matter AND INDEX row (INDEX flipped from
    `primary-read-complete` to `partial` per codex
    remediation 2.2). Sub-pages queued as open
    questions for follow-on supplementary fetches.
  - `json-schema` — added at v1.1 source-list
    expansion (codex remediation §7.D). Spec index
    page deep-read; per-vocabulary drafts (Core +
    Validation) NOT deep-read. Outcome `partial` in
    both front-matter AND INDEX row.
- **Kiro Bedrock binding correction**: prior summary
  in the research workpad characterised Kiro as

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,220p' research/primary-sources/INDEX.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
# Primary-source corpus index

Source-list version: v1.1
Last updated: 2026-05-19

Per
`file://../../specs/2026-05-19-primary-source-research-corpus/SPEC.md`
§6.1, §6.4. Every slug listed below has a corresponding
artefact file at `research/primary-sources/<slug>.md`. The
check script `scripts/check-corpus-completeness.sh` enforces
the bijection and the completeness state.

| Slug | Status | Fetched on | Methodology summary |
|---|---|---|---|
| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |

## Status legend

- `pending` — source not yet fetched; corpus incomplete.
- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline afc2ba0 && git show --stat --oneline c9adcc6' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
afc2ba0 fix(corpus r4): AC-4 wording + Completion Report partial truth + §17 Q4 close (codex R4)
 .../SPEC.md                                        | 55 +++++++++++++---------
 1 file changed, 34 insertions(+), 21 deletions(-)
c9adcc6 fix(corpus): §19.0 Amendment Log + historical evidence labelled (self-audit recurring category)
 .../SPEC.md                                        | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/check-corpus-completeness.sh' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
check-corpus-completeness: PASS — 22 sources (3 partial with deferred-reads notes)

codex
The mechanical corpus gate passes: `22 sources (3 partial with deferred-reads notes)`. One inconsistency is already visible, though: §13 AC-4 was updated, but §15’s checked AC-4 still only allows `primary-read-complete` or `access-blocked + note`, which conflicts with the current 3 partial rows.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '480,810p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   480	agents that re-fetch SHOULD verify the digest matches.
   481	The methodology MUST flag this as an open risk for
   482	agents consuming the SPEC bundle.
   483	
   484	## 12. Observability
   485	
   486	- Each artefact's §2 Fetch trace logs the agent tool
   487	  invocation and outcome.
   488	- INDEX.md is the single index surface; reading it gives
   489	  the corpus's state.
   490	- `check-corpus-completeness.sh` exit code + diagnostics
   491	  is the mechanical observability surface.
   492	
   493	## 13. Test and Validation Matrix
   494	
   495	| AC | Test |
   496	|---|---|
   497	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` exits 0 |
   498	| AC-2 | `cmd://test -f research/primary-sources/INDEX.md` exits 0 |
   499	| AC-3 | `cmd://test -f scripts/check-corpus-completeness.sh && test -x scripts/check-corpus-completeness.sh` exits 0 |
   500	| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
   501	| AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
   502	| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
   503	| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
   504	| AC-8 | Every verbatim §3 quote in every artefact is ≤ 200 words OR the source's license permits longer excerpts (recorded in §1) |
   505	| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
   506	
   507	## 14. Implementation Checklist (Definition of Done)
   508	
   509	- [ ] DoD-1: `scripts/check-corpus-completeness.sh`
   510	      authored, executable, lint clean against shellcheck
   511	      defaults.
   512	- [ ] DoD-2: `research/primary-sources/INDEX.md` authored
   513	      with rows for every §6.1 slug; statuses set
   514	      accurately.
   515	- [ ] DoD-3: Per-source artefact authored at
   516	      `research/primary-sources/<slug>.md` for every §6.1
   517	      slug, conforming to §6.2 schema + §8.1 front-matter.
   518	- [ ] DoD-4: `check-corpus-completeness.sh` exits 0.
   519	- [ ] DoD-5: §13 Test and Validation Matrix items AC-1
   520	      through AC-9 all pass.
   521	- [ ] DoD-6: This SPEC's §17 Open Questions are all
   522	      resolved or explicitly deferred to follow-on Task
   523	      SPECs.
   524	
   525	## 15. Acceptance Criteria
   526	
   527	- [x] AC-1: `cmd://bash scripts/lint-spec.sh
   528	      specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   529	      exits 0.
   530	- [x] AC-2: `cmd://test -f
   531	      research/primary-sources/INDEX.md` exits 0.
   532	- [x] AC-3: `cmd://test -x
   533	      scripts/check-corpus-completeness.sh` exits 0.
   534	- [x] AC-4: `cmd://bash
   535	      scripts/check-corpus-completeness.sh` exits 0 with
   536	      every §6.1 slug at status
   537	      `primary-read-complete` OR `access-blocked` + note.
   538	- [x] AC-5: Every §6.1 slug has a corresponding
   539	      artefact file under `research/primary-sources/`.
   540	- [x] AC-6: Every artefact's front-matter passes the §8.1
   541	      schema check.
   542	- [x] AC-7: No verbatim §3 quote exceeds the §6.3
   543	      fair-use bound (or, if it does, the source's
   544	      license is recorded as permitting it).
   545	- [x] AC-8: §17 Completion Report records per-source
   546	      fetch outcomes + any access-blocked resolutions.
   547	- [x] AC-9: Cross-family review (BLOCKING per parent
   548	      Decision §7) signs off OR same-family-proxy is
   549	      recorded with the cross-family-deferral rationale.
   550	
   551	## 16. Rollback Plan
   552	
   553	The corpus is append-only; rollback is a directed-graph
   554	problem.
   555	
   556	Triggers for rollback:
   557	
   558	- A fetched primary source is later proven misattributed
   559	  (e.g. the URL we fetched was a spoof; the real source
   560	  contradicts it).
   561	- The source-list version drifts because §6.1 is
   562	  amended (a §6.1 amendment is a Contract SPEC
   563	  amendment under the v1 procedure).
   564	
   565	Exit procedure:
   566	
   567	1. The affected slug's artefact is superseded by a vN
   568	   entry citing the misattribution evidence.
   569	2. INDEX.md row is updated to point to the new vN slug.
   570	3. Downstream methodology slices that cited the
   571	   superseded artefact MUST be re-reviewed against the
   572	   new vN.
   573	
   574	The corpus directory itself never has files deleted;
   575	provenance is preserved.
   576	
   577	## 17. Open Questions
   578	
   579	- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
   580	      Subsequent additions (a new primary source surfaces
   581	      during longread authoring) require a Contract SPEC
   582	      amendment per §16. Default: defer; not a blocker.
   583	- [ ] Q2: The corpus-citation-binding lint extension is
   584	      out of scope; reviewers enforce manually. Whether
   585	      to add the lint extension as a follow-on Task SPEC
   586	      is deferred; recommend yes once the corpus is
   587	      populated and the citation surface is concrete.
   588	- [ ] Q3: Cross-family review for THIS Contract SPEC.
   589	      The parent Decision §7 makes cross-family review
   590	      BLOCKING per slice. Same-family self-review is the
   591	      default fallback; Codex (or other non-Claude) pass
   592	      is the rigorous path. Owner directive applies
   593	      ("base this all in deep research" suggests rigour).
   594	      Default: same-family proxy with explicit caveat
   595	      recorded; if owner directs external cross-family,
   596	      escalate.
   597	- [x] Q4: Are there primary sources missing from §6.1?
   598	      RESOLVED 2026-05-19 (codex remediation §7.D
   599	      brought JSON Schema + CycloneDX SBOM into v1.1
   600	      source list; `SOURCE_LIST_VERSION` bumped to
   601	      v1.1). REMAINING v1.2 candidates: SPDX (alternate
   602	      SBOM format), Pact (contract testing), CUE
   603	      (configuration language), Dev Container Spec,
   604	      SLSA/in-toto (supply-chain attestation). Defer
   605	      to follow-on Contract SPEC amendment; not a
   606	      blocker for v1.1 corpus closure.
   607	
   608	Neither Q1-Q4 is `owner-blocking`; all can land as
   609	follow-on Contract SPEC amendments without re-work of
   610	the corpus already produced.
   611	
   612	## 18. Migration / Coexistence
   613	
   614	The corpus is greenfield; nothing migrates from prior
   615	state. The 2026-05-17 dispositioned research workpad
   616	(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
   617	remains the upstream record of the field-state survey
   618	that motivated this corpus; it is NOT replaced by the
   619	corpus. The corpus supplements the workpad with
   620	primary-source rigor that the workpad explicitly flagged
   621	as missing (§12 Verification Caveats).
   622	
   623	Downstream methodology slices reference both: <!-- lint-ok: no-citation -->
   624	
   625	- The workpad as the historical synthesis (the
   626	  hypothesis space). <!-- lint-ok: no-citation -->
   627	- The corpus as the primary-source-anchored evidence
   628	  the methodology actually rests on. <!-- lint-ok: no-citation -->
   629	
   630	## 19. Completion Report
   631	
   632	### 19.1 Files changed
   633	
   634	- `scripts/check-corpus-completeness.sh` — mechanical
   635	  corpus-completeness gate (new).
   636	- `research/primary-sources/INDEX.md` — v1.1 corpus
   637	  index (bumped from v1.0 per codex remediation §7.D);
   638	  22 rows total: 19 at status: primary-read-complete, 3
   639	  at status: partial with deferred-reads notes per
   640	  SPEC §7.2 (adr-tools-state, structurizr-dsl,
   641	  json-schema).
   642	- `research/primary-sources/*.md` — 22 per-source
   643	  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   644	  cyclonedx-sbom), all conforming to §6.2 schema +
   645	  §8.1 front-matter:
   646	  - arc42 (architecture documentation)
   647	  - c4-model (architecture model)
   648	  - adr-nygard (foundational ADR)
   649	  - adr-tools-state (state-of-practice ADR)
   650	  - diataxis (documentation taxonomy)
   651	  - 12-factor (cloud-native SaaS methodology)
   652	  - helm-values-schema (customization-affordance)
   653	  - nix-flakes (reproducibility)
   654	  - oci-artifacts (distribution packaging)
   655	  - sigstore-cosign (signing)
   656	  - symphony-spec (operating-model-as-SPEC)
   657	  - spec-kit (spec-as-authoring tool)
   658	  - kiro (agentic IDE)
   659	  - openspec (spec-driven dev tool)
   660	  - oracle-agent-spec (framework-agnostic agent
   661	    description)
   662	  - ref-arch-vs-solution-arch (ownership-split
   663	    precursor)
   664	  - leaddev-agent-compiled (published risk critique)
   665	  - cucumber-gherkin (executable behavior spec)
   666	  - openapi-3-1 (HTTP API contract)
   667	  - structurizr-dsl (architecture-as-code)
   668	- This SPEC's §15 Acceptance Criteria checkboxes
   669	  flipped to checked.
   670	
   671	### 19.0 Amendment log (post-verification edits)
   672	
   673	Per the pattern established in the parent Decision SPEC
   674	§14.0, this Completion Report was filled at original
   675	verification 2026-05-19 (v1.0 source list, 20 sources).
   676	Subsequent codex cross-family remediation rounds amended
   677	§6.1 (v1.1 source-list expansion adding json-schema +
   678	cyclonedx-sbom), §7.2 (partial-with-note rule),
   679	research/primary-sources/* (overreach + status-truth
   680	fixes), and the check script (partial enforcement).
   681	Historical evidence values in §19.2 reflect original-
   682	verification state, NOT current state.
   683	
   684	| Round | Date | Notable | Current evidence |
   685	|---|---|---|---|
   686	| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
   687	| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
   688	| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
   689	
   690	Current-state evidence values supersede §19.2:
   691	- corpus-SPEC citation-prefix hits: 55 (per current
   692	  `lint-spec.sh` invocation)
   693	- corpus row count: 22 (19 primary-read-complete +
   694	  3 partial)
   695	- script check: PASS — 22 sources (3 partial with
   696	  deferred-reads notes)
   697	
   698	### 19.2 Commands run (historical; original verification)
   699	
   700	- 25 `cmd://WebFetch` invocations across the 22 sources
   701	  (some sources required supplementary fetches; one
   702	  redirect was followed from nixos.org to nix.dev; 2
   703	  v1.1 fetches added: json-schema + cyclonedx-sbom per
   704	  codex remediation §7.D).
   705	- `cmd://bash scripts/lint-spec.sh
   706	  specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   707	  — exit 0 (0 errors, 0 warnings, 47 citation hits at
   708	  original verification; 55 current per §19.0 Amendment
   709	  Log).
   710	- `cmd://bash scripts/check-corpus-completeness.sh` —
   711	  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
   712	- Per-artefact `cmd://bash scripts/lint-spec.sh
   713	  research/primary-sources/<slug>.md` — exit 1 on each.
   714	  Two issue classes:
   715	  1. Front-matter shape: corpus artefacts use `slug:`
   716	     not `type:`, so lint reports "missing
   717	     type/implies_spec_type field" + "missing required
   718	     section: ##". These are misapplied checks — the
   719	     lint script is designed for SPEC artefacts.
   720	  2. Uncited-claim: 18 of 22 artefacts have
   721	     `fact-bearing paragraph lacks citation prefix`
   722	     errors in §4 / §5 / §6 — meta-commentary bullets
   723	     that reference §3 by section but lack an inline
   724	     prefix the script's paragraph scanner recognises.
   725	  **Cross-family review (codex finding 2.1) correctly
   726	  identified this as a hack**: SPEC §7.1 says
   727	  uncited-claim is BLOCKING on corpus artefacts, but
   728	  these failures were waved off as front-matter noise.
   729	  The honest reading is that the current lint is not
   730	  fit-for-purpose on corpus artefacts and the in-place
   731	  enforcement gap is a follow-on Task SPEC for a
   732	  corpus-mode lint extension (or a separate
   733	  `scripts/validate-corpus-citations.sh` script that
   734	  applies only the uncited-claim subset of the
   735	  citation grammar to corpus artefacts). Until that
   736	  Task SPEC executes, `check-corpus-completeness.sh`
   737	  is the authoritative mechanical gate and per-artefact
   738	  citation density is reviewer-enforced. The corpus
   739	  artefacts authored under this SPEC ARE densely cited
   740	  (17+ citation prefixes per artefact), but the
   741	  mechanical claim that uncited-claim is blocking
   742	  cannot currently be verified by the script.
   743	
   744	### 19.3 Verification result
   745	
   746	PASS. All §15 ACs met:
   747	
   748	- AC-1: SPEC.md lint clean (exit 0).
   749	- AC-2: INDEX.md present.
   750	- AC-3: check-corpus-completeness.sh present + executable.
   751	- AC-4: check-corpus-completeness.sh exits 0; 22
   752	  slugs total (19 primary-read-complete + 3 partial
   753	  with deferred-reads notes per the §7.2 partial
   754	  rule; codex remediation §7.D added json-schema +
   755	  cyclonedx-sbom; codex Round-2 added the partial
   756	  status-truth check to the script).
   757	- AC-5: every §6.1 slug has corresponding `<slug>.md`
   758	  artefact.
   759	- AC-6: every artefact's front-matter conforms to
   760	  §8.1 schema (manual review).
   761	- AC-7: no verbatim §3 quote exceeds the 200-word
   762	  fair-use bound (manual review; longest excerpts are
   763	  the 18-section Symphony list and 12-factor's 12
   764	  named factors, both well under bound).
   765	- AC-8: this Completion Report records the per-source
   766	  fetch outcomes (19 primary-read-complete + 3 partial
   767	  with deferred-reads notes — adr-tools-state,
   768	  structurizr-dsl, json-schema; zero access-blocked)
   769	  and the source-list discoveries (Kiro Bedrock binding
   770	  NOT confirmed by primary read; was an inferred
   771	  binding in the prior research workpad).
   772	- AC-9: cross-family review deferred. Same-family
   773	  self-review performed; advisory recorded. Owner
   774	  directive 2026-05-18 ("base this all in deep
   775	  research, not make up bullshit") was the rigour bar;
   776	  the corpus's verbatim-quote anchoring is the
   777	  primary discharge of that obligation, with
   778	  cross-family review as a secondary check that can
   779	  land before downstream slices.
   780	
   781	### 19.4 Residual risk
   782	
   783	- **Per-artefact lint mismatch**: the lint script
   784	  treats corpus artefacts as malformed SPECs (missing
   785	  `type:` field; missing standard SPEC sections). Per
   786	  §7.1, this is advisory; the corpus-completeness
   787	  check is the authoritative gate. If future lint
   788	  evolution adds corpus-mode, the per-artefact lint
   789	  warnings disappear; meanwhile they are documented
   790	  noise.
   791	- **Three artefacts at `partial` status, with INDEX
   792	  rows now correctly showing `partial` per the v1.1 +
   793	  v1.2-pending status-truth alignment** (codex Round-2
   794	  finding 2.2 closed this gap; original residual-risk
   795	  text below labelled them "recorded primary-read-
   796	  complete" which was false — the INDEX now matches the
   797	  artefact front-matter):
   798	  - `structurizr-dsl` — root page returned definition
   799	    + C4-implementation framing; deep syntax (workspace
   800	    / model / views keywords) was navigation-only on
   801	    the fetched page. Fetch outcome `partial` in both
   802	    artefact front-matter AND INDEX row. The load-
   803	    bearing methodology claims (DSL purpose,
   804	    architecture-as-code posture, C4 implementation)
   805	    were anchored; deep syntax remains a deferred read.
   806	  - `adr-tools-state` — root page returned community
   807	    framing + template-family references but deep
   808	    template specifics + CLI conventions live on
   809	    sub-pages not fetched. Outcome `partial` in both
   810	    front-matter AND INDEX row (INDEX flipped from

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "fetch_outcome:|''^# |''^## 6'"\\.|not deep-read|NOT deep-read|deferred|alternative|unreachable|fallback\" research/primary-sources/*.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/json-schema.md:7:fetch_outcome: "partial"
research/primary-sources/json-schema.md:18:# JSON Schema (Draft 2020-12)
research/primary-sources/json-schema.md:106:## 6. Open questions surfaced by the primary read
research/primary-sources/json-schema.md:116:  earlier drafts (Draft 7, Draft 6) is not deep-read;
research/primary-sources/helm-values-schema.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/helm-values-schema.md:20:# Helm Charts — values.yaml + values.schema.json
research/primary-sources/helm-values-schema.md:119:## 6. Open questions surfaced by the primary read
research/primary-sources/symphony-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/symphony-spec.md:25:# OpenAI Symphony SPEC.md
research/primary-sources/symphony-spec.md:32:- License: project license (OpenAI; not deep-read for
research/primary-sources/symphony-spec.md:151:## 6. Open questions surfaced by the primary read
research/primary-sources/structurizr-dsl.md:7:fetch_outcome: "partial"
research/primary-sources/structurizr-dsl.md:8:fetch_evidence: "fetched docs.structurizr.com/dsl root; DSL definition + C4 implementation confirmed; deep syntax sections not deep-read in this pass"
research/primary-sources/structurizr-dsl.md:17:# Structurizr DSL
research/primary-sources/structurizr-dsl.md:93:## 6. Open questions surfaced by the primary read
research/primary-sources/structurizr-dsl.md:96:  keywords) was not deep-read in this pass — only the
research/primary-sources/diataxis.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/diataxis.md:21:# Diátaxis
research/primary-sources/diataxis.md:31:  openly; specific license terms not deep-read on this
research/primary-sources/diataxis.md:130:## 6. Open questions surfaced by the primary read
research/primary-sources/spec-kit.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/spec-kit.md:19:# GitHub Spec Kit
research/primary-sources/spec-kit.md:134:## 6. Open questions surfaced by the primary read
research/primary-sources/sigstore-cosign.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/sigstore-cosign.md:19:# Sigstore + cosign
research/primary-sources/sigstore-cosign.md:126:## 6. Open questions surfaced by the primary read
research/primary-sources/ref-arch-vs-solution-arch.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/ref-arch-vs-solution-arch.md:19:# Reference Architecture vs Reference Implementation
research/primary-sources/ref-arch-vs-solution-arch.md:141:## 6. Open questions surfaced by the primary read
research/primary-sources/cyclonedx-sbom.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cyclonedx-sbom.md:21:# CycloneDX SBOM Specification
research/primary-sources/cyclonedx-sbom.md:141:## 6. Open questions surfaced by the primary read
research/primary-sources/cyclonedx-sbom.md:145:  acknowledge it as an alternative and document why
research/primary-sources/oracle-agent-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oracle-agent-spec.md:19:# Oracle Open Agent Spec
research/primary-sources/oracle-agent-spec.md:101:## 6. Open questions surfaced by the primary read
research/primary-sources/oracle-agent-spec.md:110:  were not deep-read on this pass. If the
research/primary-sources/cucumber-gherkin.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cucumber-gherkin.md:19:# Cucumber / Gherkin
research/primary-sources/cucumber-gherkin.md:121:## 6. Open questions surfaced by the primary read
research/primary-sources/c4-model.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/c4-model.md:20:# C4 Model
research/primary-sources/c4-model.md:133:## 6. Open questions surfaced by the primary read
research/primary-sources/arc42.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/arc42.md:20:# arc42
research/primary-sources/arc42.md:34:  link at `url://arc42.org/license` (not deep-read).
research/primary-sources/arc42.md:126:## 6. Open questions surfaced by the primary read
research/primary-sources/adr-tools-state.md:7:fetch_outcome: "partial"
research/primary-sources/adr-tools-state.md:8:fetch_evidence: "fetched adr.github.io root; ADR community definition + template-family catalogue + cross-references to sub-pages; deep template + tooling details not deep-read"
research/primary-sources/adr-tools-state.md:18:# adr.github.io — State of ADR Practice
research/primary-sources/adr-tools-state.md:27:- Linked sub-pages (not deep-read on this pass):
research/primary-sources/adr-tools-state.md:109:## 6. Open questions surfaced by the primary read
research/primary-sources/adr-tools-state.md:118:  on `/adr-tooling/`; not deep-read in this pass. If
research/primary-sources/openapi-3-1.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openapi-3-1.md:20:# OpenAPI Specification 3.1.0
research/primary-sources/openapi-3-1.md:133:## 6. Open questions surfaced by the primary read
research/primary-sources/openapi-3-1.md:137:  methodology MAY support; not deep-read in this pass.
research/primary-sources/openspec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openspec.md:17:# OpenSpec
research/primary-sources/openspec.md:112:## 6. Open questions surfaced by the primary read
research/primary-sources/oci-artifacts.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oci-artifacts.md:20:# OCI Image Specification + Artifacts Guidance
research/primary-sources/oci-artifacts.md:131:## 6. Open questions surfaced by the primary read
research/primary-sources/adr-nygard.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/adr-nygard.md:21:# Architecture Decision Records (Nygard)
research/primary-sources/adr-nygard.md:125:## 6. Open questions surfaced by the primary read
research/primary-sources/nix-flakes.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/nix-flakes.md:25:# Nix Flakes
research/primary-sources/nix-flakes.md:147:## 6. Open questions surfaced by the primary read
research/primary-sources/INDEX.md:1:# Primary-source corpus index
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/INDEX.md:43:- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
research/primary-sources/leaddev-agent-compiled.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/leaddev-agent-compiled.md:21:# LeadDev — Can You Trust the Spec?
research/primary-sources/leaddev-agent-compiled.md:124:## 6. Open questions surfaced by the primary read
research/primary-sources/kiro.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/kiro.md:17:# Kiro
research/primary-sources/kiro.md:107:## 6. Open questions surfaced by the primary read
research/primary-sources/kiro.md:120:  workspaces; not deep-read in this pass.
research/primary-sources/12-factor.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/12-factor.md:20:# The Twelve-Factor App
research/primary-sources/12-factor.md:138:## 6. Open questions surfaced by the primary read

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "status:|fetch_outcome:|primary-read-complete|partial|access-blocked" research/primary-sources/*.md research/primary-sources/INDEX.md specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
research/primary-sources/12-factor.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/leaddev-agent-compiled.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/kiro.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/json-schema.md:7:fetch_outcome: "partial"
research/primary-sources/json-schema.md:38:- Status `partial`: deep reads of the Core draft and
research/primary-sources/json-schema.md:112:  expansion (status: pending for the Core / Validation
research/primary-sources/json-schema.md:114:  `partial`).
research/primary-sources/helm-values-schema.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/symphony-spec.md:7:fetch_outcome: "primary-read-complete"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:3:status: verified
specs/2026-05-19-primary-source-research-corpus/SPEC.md:100:current status (`pending` / `primary-read-complete` /
specs/2026-05-19-primary-source-research-corpus/SPEC.md:101:`access-blocked` / `superseded`), and a one-line summary of
specs/2026-05-19-primary-source-research-corpus/SPEC.md:105:reports gaps (`pending` entries, `access-blocked` entries
specs/2026-05-19-primary-source-research-corpus/SPEC.md:162:  access-blocked fallback.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:216:fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:283:| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:284:| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:304:   b. If primary URL is access-blocked, attempt
specs/2026-05-19-primary-source-research-corpus/SPEC.md:307:   c. If all fail, set `fetch_outcome: access-blocked`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:341:   `primary-read-complete | partial | access-blocked |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:346:   (a) `primary-read-complete`, OR
specs/2026-05-19-primary-source-research-corpus/SPEC.md:347:   (b) `partial` with a documented deferred-reads note
specs/2026-05-19-primary-source-research-corpus/SPEC.md:348:       in the artefact §6 (the partial status is
specs/2026-05-19-primary-source-research-corpus/SPEC.md:352:   (c) `access-blocked` with a documented alternative-
specs/2026-05-19-primary-source-research-corpus/SPEC.md:357:   list expansion which introduced legitimate `partial`
specs/2026-05-19-primary-source-research-corpus/SPEC.md:360:   or access-blocked which contradicted the v1.1
specs/2026-05-19-primary-source-research-corpus/SPEC.md:389:fetch_outcome:      # enum: primary-read-complete | partial |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:390:                    #       access-blocked
specs/2026-05-19-primary-source-research-corpus/SPEC.md:405:- `Status` is one of: `primary-read-complete`, `partial`,
specs/2026-05-19-primary-source-research-corpus/SPEC.md:406:  `access-blocked`, `superseded`, `pending`.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:427:                          if row.status == "access-blocked"
specs/2026-05-19-primary-source-research-corpus/SPEC.md:444:| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:502:| AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:503:| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:505:| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:537:      `primary-read-complete` OR `access-blocked` + note.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:546:      fetch outcomes + any access-blocked resolutions.
specs/2026-05-19-primary-source-research-corpus/SPEC.md:638:  22 rows total: 19 at status: primary-read-complete, 3
specs/2026-05-19-primary-source-research-corpus/SPEC.md:639:  at status: partial with deferred-reads notes per
specs/2026-05-19-primary-source-research-corpus/SPEC.md:678:cyclonedx-sbom), §7.2 (partial-with-note rule),
specs/2026-05-19-primary-source-research-corpus/SPEC.md:680:fixes), and the check script (partial enforcement).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:688:| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
specs/2026-05-19-primary-source-research-corpus/SPEC.md:693:- corpus row count: 22 (19 primary-read-complete +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:694:  3 partial)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:695:- script check: PASS — 22 sources (3 partial with
specs/2026-05-19-primary-source-research-corpus/SPEC.md:711:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
specs/2026-05-19-primary-source-research-corpus/SPEC.md:752:  slugs total (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:753:  with deferred-reads notes per the §7.2 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:755:  cyclonedx-sbom; codex Round-2 added the partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:766:  fetch outcomes (19 primary-read-complete + 3 partial
specs/2026-05-19-primary-source-research-corpus/SPEC.md:768:  structurizr-dsl, json-schema; zero access-blocked)
specs/2026-05-19-primary-source-research-corpus/SPEC.md:791:- **Three artefacts at `partial` status, with INDEX
specs/2026-05-19-primary-source-research-corpus/SPEC.md:792:  rows now correctly showing `partial` per the v1.1 +
specs/2026-05-19-primary-source-research-corpus/SPEC.md:801:    the fetched page. Fetch outcome `partial` in both
specs/2026-05-19-primary-source-research-corpus/SPEC.md:809:    sub-pages not fetched. Outcome `partial` in both
specs/2026-05-19-primary-source-research-corpus/SPEC.md:811:    `primary-read-complete` to `partial` per codex
specs/2026-05-19-primary-source-research-corpus/SPEC.md:817:    Validation) NOT deep-read. Outcome `partial` in
research/primary-sources/INDEX.md:15:| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
research/primary-sources/INDEX.md:16:| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
research/primary-sources/INDEX.md:17:| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:19:| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
research/primary-sources/INDEX.md:20:| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
research/primary-sources/INDEX.md:21:| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
research/primary-sources/INDEX.md:23:| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
research/primary-sources/INDEX.md:24:| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
research/primary-sources/INDEX.md:25:| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
research/primary-sources/INDEX.md:26:| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
research/primary-sources/INDEX.md:27:| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
research/primary-sources/INDEX.md:28:| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
research/primary-sources/INDEX.md:29:| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
research/primary-sources/INDEX.md:30:| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
research/primary-sources/INDEX.md:31:| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
research/primary-sources/INDEX.md:32:| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
research/primary-sources/INDEX.md:33:| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/INDEX.md:36:| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |
research/primary-sources/INDEX.md:41:- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
research/primary-sources/INDEX.md:43:- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
research/primary-sources/structurizr-dsl.md:7:fetch_outcome: "partial"
research/primary-sources/spec-kit.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/sigstore-cosign.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/diataxis.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cyclonedx-sbom.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/ref-arch-vs-solution-arch.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/cucumber-gherkin.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oracle-agent-spec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/c4-model.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/openspec.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/arc42.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/adr-tools-state.md:7:fetch_outcome: "partial"
research/primary-sources/openapi-3-1.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/oci-artifacts.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/nix-flakes.md:7:fetch_outcome: "primary-read-complete"
research/primary-sources/INDEX.md:15:| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
research/primary-sources/INDEX.md:16:| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
research/primary-sources/INDEX.md:17:| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
research/primary-sources/INDEX.md:18:| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
research/primary-sources/INDEX.md:19:| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
research/primary-sources/INDEX.md:20:| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
research/primary-sources/INDEX.md:21:| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
research/primary-sources/INDEX.md:22:| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
research/primary-sources/INDEX.md:23:| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
research/primary-sources/INDEX.md:24:| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
research/primary-sources/INDEX.md:25:| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
research/primary-sources/INDEX.md:26:| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
research/primary-sources/INDEX.md:27:| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
research/primary-sources/INDEX.md:28:| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
research/primary-sources/INDEX.md:29:| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
research/primary-sources/INDEX.md:30:| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
research/primary-sources/INDEX.md:31:| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
research/primary-sources/INDEX.md:32:| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
research/primary-sources/INDEX.md:33:| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
research/primary-sources/INDEX.md:34:| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
research/primary-sources/INDEX.md:35:| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
research/primary-sources/INDEX.md:36:| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |
research/primary-sources/INDEX.md:41:- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
research/primary-sources/INDEX.md:42:- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
research/primary-sources/INDEX.md:43:- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
research/primary-sources/adr-nygard.md:7:fetch_outcome: "primary-read-complete"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 836ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-primary-source-research-corpus/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  55
lowercase 2119 hits:   7 (advisory only)
errors:                0
warnings:              0

codex
SPEC lint is clean and the Round 5 amendment log now correctly separates historical from current evidence. I’m checking for remaining internal contract drift now, especially older enumerations that may still omit `partial` after v1.1.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '1,470p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	---
     2	id: 2026-05-19-primary-source-research-corpus
     3	status: verified
     4	type: contract
     5	owner: HasNoBeef
     6	repo: agentic-installation-methodology
     7	branch_policy: main-direct
     8	risk: medium
     9	requires_network: true
    10	requires_secrets: []
    11	acceptance_commands:
    12	  - bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md
    13	  - test -f research/primary-sources/INDEX.md
    14	  - bash scripts/check-corpus-completeness.sh
    15	cites_decision: 2026-05-18-agentic-installation-methodology
    16	---
    17	
    18	# SPEC: Primary-Source Research Corpus (Deep-Research Preface)
    19	
    20	Status: Draft v1
    21	Type: Contract
    22	Purpose: govern the production of a structured primary-source
    23	research corpus that grounds every methodology claim in
    24	arc42 / C4 / ADRs / Diátaxis / 12-factor / Helm / Nix / OCI /
    25	Sigstore / Symphony / Spec Kit / Kiro / OpenSpec / Oracle
    26	Agent Spec / reference-architecture literature before any
    27	methodology content (longread, SPEC bundle) lands. The corpus
    28	is the citable evidence base downstream slices draw from;
    29	the SPEC defines its shape, completeness gates, and
    30	citation discipline.
    31	
    32	## Normative Language
    33	
    34	The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
    35	`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
    36	document are to be interpreted as described in RFC 2119 and RFC 8174
    37	when, and only when, they appear in all capitals.
    38	
    39	## 1. Problem Statement
    40	
    41	The 2026-05-17 research workpad
    42	(`file://../../research-archive/2026-05-17-agentic-installation-methodology-workpad.md`
    43	or upstream
    44	`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
    45	§12 Verification Caveats records that several primary
    46	sources were "access-denied and characterized via WebSearch
    47	summaries cross-checked against multiple sources" — arc42,
    48	C4, ADR, Diátaxis, 12-factor. The methodology Product B
    49	publishes draws heavily on those primitives (research §3,
    50	§4, §5). Owner directive
    51	`decision-authority://owner:2026-05-18` ("base this all in
    52	deep research and best practices - not make up bullshit")
    53	forecloses publishing claims grounded in agent summaries
    54	when the primaries themselves are reachable with proper
    55	tooling (WebFetch, archive.org, primary-PDF retrieval). The
    56	methodology body (longread + SPEC bundle) MUST NOT land
    57	before each in-scope primary has a structured corpus entry
    58	that captures the verbatim claims the methodology depends
    59	on. This SPEC defines the corpus shape, the per-source
    60	artefact template, the completeness gate, and the citation
    61	discipline that binds the longread and SPEC bundle
    62	authoring slices to the corpus rather than to agent memory.
    63	
    64	## 2. Goals and Non-Goals
    65	
    66	Goals:
    67	
    68	- Define an exhaustive in-scope source list with rationale
    69	  per entry.
    70	- Define the per-source artefact template: front-matter,
    71	  fetch metadata, verbatim claim extracts, gap from prior
    72	  agent summary, citation surface.
    73	- Define a completeness gate enforced by a check script
    74	  (`scripts/check-corpus-completeness.sh`) so the corpus's
    75	  state is mechanically verifiable.
    76	- Establish the citation grammar binding: every methodology
    77	  claim in downstream artefacts MUST cite a corpus entry
    78	  via `file://research/primary-sources/<slug>.md§<n>`, not
    79	  agent memory.
    80	
    81	Non-goals:
    82	
    83	- Authoring the methodology longread or SPEC bundle
    84	  (subsequent slices).
    85	- Repacking Product A v1.1 into manifest+catalog v2.0
    86	  (sibling slice).
    87	- Resolving the seven open research questions enumerated in
    88	  the dispositioned research workpad §2.3 — the corpus
    89	  informs them; it does not pretend to resolve them.
    90	- A literature review essay. The corpus is structured
    91	  source artefacts, not synthesized prose.
    92	
    93	## 3. System Overview
    94	
    95	The deep-research corpus is a directory at
    96	`research/primary-sources/` inside this repo. Each in-scope
    97	source has one structured artefact at
    98	`research/primary-sources/<slug>.md`. An `INDEX.md` at the
    99	directory root lists every in-scope source, its slug, its
   100	current status (`pending` / `primary-read-complete` /
   101	`access-blocked` / `superseded`), and a one-line summary of
   102	the verbatim claims the methodology depends on from that
   103	source. A check script
   104	(`scripts/check-corpus-completeness.sh`) walks the index and
   105	reports gaps (`pending` entries, `access-blocked` entries
   106	without an alternative-source-found note, slugs in the
   107	index that lack a file under `research/primary-sources/`).
   108	
   109	Downstream methodology slices (longread, SPEC bundle) cite
   110	the corpus exclusively for primitives derived from these
   111	sources. Lint at the corpus-citation surface is enforced by
   112	a follow-on extension to `scripts/lint-spec.sh` (out of
   113	scope for this SPEC; deferred to a follow-on Task SPEC).
   114	
   115	The corpus is append-only on a per-entry basis; an entry
   116	may be superseded by a follow-on entry (slug-suffixed
   117	`-vN`) but never deleted. Provenance is preserved.
   118	
   119	## 4. Authority Map
   120	
   121	Active authority:
   122	
   123	- `decision-authority://owner:2026-05-18` — owner directive
   124	  ("base this all in deep research and best practices - not
   125	  make up bullshit") binding deep-primary-source discipline
   126	  before any methodology content lands.
   127	- Parent Decision SPEC at
   128	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   129	  §7 — binds Product B shape; §9 Locks unlock authoring of
   130	  follow-on slices including this preface.
   131	- Dispositioned research workpad at
   132	  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
   133	  §12 Verification Caveats — names the specific access-
   134	  denied primaries that this corpus closes the gap on.
   135	- `file://schema/SPEC.schema.md` — citation grammar,
   136	  RFC 2119 scoping rules, front-matter schema.
   137	
   138	Stale, superseded, or evidence-only:
   139	
   140	- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
   141	  — superseded research workpad; evidence-only.
   142	
   143	Owner decisions required before implementation:
   144	
   145	- [ ] Confirm the §6 Domain Model source list is exhaustive
   146	      for v1.0; subsequent additions land as follow-on
   147	      Contract SPEC amendments.
   148	
   149	## 5. Code/Docs Reality Check
   150	
   151	- The `research/primary-sources/` directory does not yet
   152	  exist (`cmd://ls research/` returns "No such file" before
   153	  this slice executes).
   154	- The check script `scripts/check-corpus-completeness.sh`
   155	  does not yet exist (`cmd://test -f
   156	  scripts/check-corpus-completeness.sh` exits non-zero
   157	  pre-execution).
   158	- The `WebFetch` tool is the primary retrieval mechanism;
   159	  fallback is `cmd://curl -fsSL --max-time 30` for
   160	  endpoints WebFetch fails on, with archive.org
   161	  (`url://web.archive.org/web/*/`) as the
   162	  access-blocked fallback.
   163	
   164	## 6. Domain Model
   165	
   166	### 6.1 In-scope sources (v1.0)
   167	
   168	| Slug | Source | Primary URL | Why in scope |
   169	|---|---|---|---|
   170	| arc42 | arc42 architecture documentation template | `url://docs.arc42.org/section-1/` (and chapters 1-12) | Decomposition methodology §3 building block; research §4.1 cites arc42's §8 Crosscutting Concepts as comparison point |
   171	| c4-model | C4 model for software architecture | `url://c4model.com/` | Decomposition reference architecture; research §5 packaging mentions C4 Container-level |
   172	| adr-nygard | Nygard's original 2011 ADR post | `url://cognitect.com/blog/2011/11/15/documenting-architecture-decisions` | Decision documentation primitive; research §5.1 names ADRs (Nygard format) as the decisions facet |
   173	| adr-tools-state | State-of-practice ADR tools (MADR, adr-tools, Y-statements) | `url://adr.github.io/` | Cross-check Nygard against current practice |
   174	| diataxis | Diátaxis documentation framework | `url://diataxis.fr/` | Documentation taxonomy comparison; research §4 references Diátaxis as decomposition methodology |
   175	| 12-factor | 12-factor app manifesto | `url://12factor.net/` | Cited in research §4.1 ("12-factor's Config says env vars exist, not which knobs the installer is expected to turn"); the conformance overlay reference in research §5.1 |
   176	| helm-values-schema | Helm values schema specification | `url://helm.sh/docs/topics/charts/#schema-files` + `url://json-schema.org/` | Customization-affordance grammar reference; research §4.1 names Helm as "comes closest in practice" |
   177	| nix-flakes | Nix flake schema / RFC 49 | `url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html` + `url://github.com/NixOS/rfcs/blob/master/rfcs/0049-flakes.md` | Reproducible-from-spec primitive; research §5.1 names Nix flake |
   178	| oci-artifacts | OCI Image Spec + Artifact spec | `url://github.com/opencontainers/image-spec/blob/main/spec.md` + `url://github.com/opencontainers/artifacts/blob/main/spec.md` | Spec-as-distribution-artifact primitive; research §5.1 signed bundle |
   179	| sigstore-cosign | Sigstore architecture + cosign | `url://docs.sigstore.dev/` + `url://github.com/sigstore/cosign` | Signing model for spec-as-distribution; research §4.4 spec-as-distribution versioning |
   180	| symphony-spec | OpenAI Symphony SPEC.md | `url://github.com/openai/symphony/blob/main/SPEC.md` | In-the-wild operating-model-as-SPEC; research §3 transferable building blocks |
   181	| spec-kit | GitHub Spec Kit | `url://github.com/github/spec-kit` | Closest spec-as-authoring tool; research §2.1 |
   182	| kiro | Kiro spec-driven IDE | `url://kiro.dev` | Spec-driven IDE; research §2.1 |
   183	| openspec | OpenSpec project | `url://github.com/Fission-AI/OpenSpec` | New agentic spec project; surfaced by recent field state |
   184	| oracle-agent-spec | Oracle Agent Spec | `url://github.com/oracle/agent-spec` | Spec-as-agent-description; research §2.1 |
   185	| ref-arch-vs-solution-arch | Reference architecture vs solution architecture distinction | `url://www.liminalarc.co/2019/05/reference-architecture-vs-reference-implementation/` (one primary; supplement with academic if reachable) | Cross-org ownership-split antecedent; research §2.1, §4.3 |
   186	| leaddev-agent-compiled | LeadDev "Can you trust the spec" article | `url://leaddev.com/ai/can-you-trust-the-spec-the-risky-future-of-agent-compiled-software` | Closest published statement of the agentic-installation hypothesis (as risk); research §2.2 |
   187	| cucumber-gherkin | Cucumber / Gherkin reference | `url://cucumber.io/docs/gherkin/reference/` | Behavioral acceptance primitive; research §5.1 |
   188	| openapi-3-1 | OpenAPI 3.1 specification | `url://spec.openapis.org/oas/v3.1.0` | API contract primitive; research §5.1 |
   189	| structurizr-dsl | Structurizr DSL (C4 implementation) | `url://docs.structurizr.com/dsl` | Machine-readable C4; research §5.1 |
   190	| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
   191	| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
   192	
   193	`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
   194	`file://../2026-05-19-codex-remediation-amendments/SPEC.md`
   195	§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
   196	baseline. Two further candidates flagged but NOT v1.1
   197	mandatory (deferred to corpus §17 Q4 v1.2 expansion):
   198	`dev-container-spec`, `slsa-in-toto`.
   199	
   200	Additions land as follow-on Contract SPEC amendments per
   201	§17 Open Questions.
   202	
   203	### 6.2 Per-source artefact schema
   204	
   205	Each `research/primary-sources/<slug>.md` is a markdown
   206	document with the following front-matter and section
   207	structure:
   208	
   209	```yaml
   210	---
   211	slug: <slug>            # matches §6.1 row
   212	source_name: "<Full name>"
   213	primary_url: "<URL>"
   214	fetched_via: "WebFetch" | "curl" | "archive.org" | "manual"
   215	fetched_on: <YYYY-MM-DD>
   216	fetch_outcome: "primary-read-complete" | "partial" | "access-blocked"
   217	fetch_evidence: "<one-line digest of fetch result or
   218	                  fallback used>"
   219	supersedes: <slug>      # OPTIONAL; for vN entries
   220	methodology_relevance: |
   221	  <one-paragraph statement of which methodology claims
   222	   draw on this source>
   223	---
   224	```
   225	
   226	Required sections (in order):
   227	
   228	1. **§1 Source identity** — name, canonical URL,
   229	   maintainer / publisher, license / copyright posture
   230	   (the bar for fair-use excerpts in our corpus).
   231	2. **§2 Fetch trace** — what was attempted, what worked,
   232	   what was blocked. Cites the agent tool calls
   233	   (`cmd://WebFetch <url>`, `cmd://curl -fsSL <url>`)
   234	   with one-line outcome digests.
   235	3. **§3 Verbatim claims this corpus depends on** —
   236	   the primary's own words, quoted. Each quote is
   237	   attributed by §-and-paragraph (or chapter / section
   238	   identifier from the source) and accompanied by a
   239	   methodology-relevance note. Quotes MAY be excerpted
   240	   per fair-use limits per §6.3.
   241	4. **§4 Gap from prior summary characterization** — what
   242	   the 2026-05-17 research workpad (or earlier agent
   243	   summaries) got right, what it got wrong or imprecise,
   244	   and what new primary-anchored claims are now available
   245	   to the methodology body.
   246	5. **§5 Downstream-citation surface** — the set of
   247	   methodology claims this entry now licenses, expressed
   248	   as `methodology-claim: "<claim>"` paired with the
   249	   §1-§3 anchor that supports it.
   250	6. **§6 Open questions surfaced by the primary read** —
   251	   things the primary itself doesn't answer that the
   252	   methodology may have to flag as open. Distinct from
   253	   the seven research-workpad open questions; these
   254	   are primary-anchored unknowns.
   255	
   256	### 6.3 Citation and fair-use posture
   257	
   258	Verbatim quotes in §3 of each artefact are excerpts for
   259	research and methodology purposes; per US fair-use
   260	doctrine (and equivalents in other jurisdictions), the
   261	corpus is editorial commentary on published sources, not
   262	republication. Each quote is bounded — typically
   263	≤ 50 words, never exceeding the smaller of (a) one
   264	paragraph of source text or (b) 200 words. The artefact
   265	is the methodology's editorial citation surface, not a
   266	mirror. When the source's license is permissive
   267	(Apache-2.0 / MIT / CC-BY for documentation), longer
   268	excerpts MAY be included with attribution.
   269	
   270	### 6.4 INDEX.md contract
   271	
   272	`research/primary-sources/INDEX.md` is the corpus's
   273	machine-checkable index. Format:
   274	
   275	```markdown
   276	# Primary-source corpus index
   277	
   278	Source-list version: v1.0
   279	Last updated: <YYYY-MM-DD>
   280	
   281	| Slug | Status | Fetched on | Methodology summary |
   282	|---|---|---|---|
   283	| arc42 | primary-read-complete | 2026-05-19 | <one-line> |
   284	| c4-model | primary-read-complete | 2026-05-19 | <one-line> |
   285	| ... | ... | ... | ... |
   286	```
   287	
   288	Every row's `Slug` MUST correspond to a `<slug>.md` file in
   289	the directory; every `<slug>.md` file MUST have a row in
   290	INDEX.md. The check script enforces both directions.
   291	
   292	## 7. Behavior Specification
   293	
   294	### 7.1 Per-source read procedure
   295	
   296	For each in-scope source (§6.1):
   297	
   298	1. **Identify primary URL.** Use §6.1's primary URL as
   299	   starting point.
   300	2. **Fetch via WebFetch.** Capture the response. If
   301	   WebFetch returns content, set `fetched_via: WebFetch`.
   302	3. **Fallback chain on failure.** If WebFetch fails:
   303	   a. Retry with `curl -fsSL --max-time 30 <url>`.
   304	   b. If primary URL is access-blocked, attempt
   305	      `url://web.archive.org/web/<recent-snapshot>/<url>`
   306	      via WebFetch.
   307	   c. If all fail, set `fetch_outcome: access-blocked`
   308	      and §2 Fetch trace records every attempted call.
   309	      The slug remains in INDEX.md with that status; an
   310	      alternative-source-found note is REQUIRED in §6
   311	      Open Questions of that artefact OR the
   312	      methodology MUST NOT cite primitives from that
   313	      source in downstream slices.
   314	4. **Extract verbatim claims** germane to the
   315	   methodology's §3 / §4 / §5 from the research workpad
   316	   (or the dispositioned-research §11.5 disposition
   317	   table). Each quote is attributed and bounded per §6.3.
   318	5. **Author the artefact** at
   319	   `research/primary-sources/<slug>.md` per §6.2 schema.
   320	6. **Update INDEX.md** to add the row (or update status
   321	   if the slug already had a `pending` placeholder).
   322	7. **Lint the artefact**:
   323	   `bash scripts/lint-spec.sh
   324	   research/primary-sources/<slug>.md` SHOULD exit 0.
   325	   The lint may not be a perfect fit for non-SPEC
   326	   artefacts; lint exit 1 on a corpus artefact is
   327	   advisory unless the failure is uncited-claim, which
   328	   IS blocking — corpus artefacts above all else MUST
   329	   carry citations.
   330	
   331	### 7.2 INDEX-driven check script
   332	
   333	`scripts/check-corpus-completeness.sh` MUST:
   334	
   335	1. Read INDEX.md and parse every row.
   336	2. For each row's slug, verify
   337	   `research/primary-sources/<slug>.md` exists.
   338	3. For each `<slug>.md` file, verify a row exists in
   339	   INDEX.md with matching slug.
   340	4. Verify every row's status is one of
   341	   `primary-read-complete | partial | access-blocked |
   342	   superseded | pending`.
   343	5. Verify `SOURCE_LIST_VERSION` in INDEX.md matches the
   344	   version frozen in §6.1 of this SPEC.
   345	6. Exit 0 if every slug in INDEX.md is one of:
   346	   (a) `primary-read-complete`, OR
   347	   (b) `partial` with a documented deferred-reads note
   348	       in the artefact §6 (the partial status is
   349	       acceptable iff the artefact discloses what was
   350	       NOT deep-read; per codex remediation Round 3 the
   351	       check script enforces this), OR
   352	   (c) `access-blocked` with a documented alternative-
   353	       source-found note (or explicit unreachability
   354	       disclaimer);
   355	   else exit non-zero with diagnostic lines per gap.
   356	   (Updated 2026-05-19 to align with the v1.1 source-
   357	   list expansion which introduced legitimate `partial`
   358	   sources requiring follow-on deep-reads on
   359	   sub-pages; previous §7.2 rule allowed only complete
   360	   or access-blocked which contradicted the v1.1
   361	   reality.)
   362	
   363	### 7.3 Corpus citation binding (downstream slices)
   364	
   365	Downstream methodology slices (longread, SPEC bundle)
   366	cite primitives from these sources via
   367	`file://research/primary-sources/<slug>.md §<n>` or by
   368	fully-qualified-URL-with-corpus-anchor
   369	`file://research/primary-sources/<slug>.md` when the
   370	whole entry is the relevance. Agent memory and prior
   371	agent summaries are NOT citable for any claim drawn
   372	from a source in §6.1's scope.
   373	
   374	The lint extension to enforce this binding is out of
   375	scope; it lands as a follow-on Task SPEC. In the
   376	interim, reviewers (cross-family and same-family)
   377	enforce manually.
   378	
   379	## 8. Schema Specification
   380	
   381	### 8.1 Per-source artefact front-matter (formal)
   382	
   383	```yaml
   384	slug:               # string; matches §6.1 row; required
   385	source_name:        # string; required; full source name
   386	primary_url:        # string; required; canonical URL
   387	fetched_via:        # enum: WebFetch | curl | archive.org | manual
   388	fetched_on:         # date: YYYY-MM-DD; required
   389	fetch_outcome:      # enum: primary-read-complete | partial |
   390	                    #       access-blocked
   391	fetch_evidence:     # string; required; one-line digest
   392	supersedes:         # string; optional; slug of prior entry
   393	methodology_relevance: |  # string; multi-line; required
   394	```
   395	
   396	### 8.2 INDEX.md row schema (formal)
   397	
   398	A pipe-delimited markdown table with columns:
   399	
   400	| Slug | Status | Fetched on | Methodology summary |
   401	
   402	Where:
   403	
   404	- `Slug` is a kebab-case identifier matching §6.1.
   405	- `Status` is one of: `primary-read-complete`, `partial`,
   406	  `access-blocked`, `superseded`, `pending`.
   407	- `Fetched on` is `YYYY-MM-DD` or `—` when status is
   408	  `pending`.
   409	- `Methodology summary` is a one-sentence summary.
   410	
   411	## 9. Reference Algorithms
   412	
   413	### 9.1 Completeness check (pseudocode)
   414	
   415	```
   416	function check_corpus_completeness():
   417	  index = read_index_md()
   418	  slugs_in_index = set(row.slug for row in index.rows)
   419	  slugs_in_files = set(basename(f, ".md")
   420	                       for f in glob("research/primary-sources/*.md")
   421	                       if basename(f) != "INDEX.md")
   422	  missing_files = slugs_in_index - slugs_in_files
   423	  orphan_files = slugs_in_files - slugs_in_index
   424	  pending = [row for row in index.rows
   425	             if row.status == "pending"]
   426	  blocked_without_note = [row for row in index.rows
   427	                          if row.status == "access-blocked"
   428	                          and not row_has_access_blocked_note(row)]
   429	  if missing_files or orphan_files or pending or blocked_without_note:
   430	    emit_diagnostics()
   431	    exit 1
   432	  if index.source_list_version != SPEC_FROZEN_VERSION:
   433	    emit_diagnostic("source list drift")
   434	    exit 1
   435	  exit 0
   436	```
   437	
   438	## 10. Failure Model
   439	
   440	### 10.1 Failure classes
   441	
   442	| Class | Trigger | Recovery |
   443	|---|---|---|
   444	| `fetch-failed` | WebFetch / curl / archive.org all fail for a primary URL | Mark status `access-blocked`; §6 of artefact records every attempt; methodology MUST NOT cite primitives from this source in downstream slices |
   445	| `quote-overrun` | Verbatim §3 quote exceeds the §6.3 fair-use bound | Reviewer rejects the artefact at corpus-completion review; author shortens to compliant excerpt |
   446	| `index-drift` | INDEX.md row count diverges from file count, or `SOURCE_LIST_VERSION` doesn't match SPEC §6.1 | `check-corpus-completeness.sh` exits non-zero; author reconciles |
   447	| `summary-without-primary` | A claim in INDEX.md's `Methodology summary` column is not anchored by a verbatim quote in the corresponding artefact's §3 | Reviewer rejects; author either anchors the claim or removes it from the summary |
   448	| `slug-collision` | Two artefacts share a slug | Force-fix; one or both renamed; INDEX.md updated |
   449	| `supersession-loop` | Artefact A is `supersedes: B` AND B is `supersedes: A` | Force-fix; the supersession DAG is acyclic |
   450	
   451	### 10.2 Recovery posture
   452	
   453	The corpus is forgiving on form, strict on substance. A
   454	mis-formatted front-matter field is a recoverable bug; a
   455	methodology claim without a primary anchor is a violation
   456	of the owner directive and blocks the methodology body
   457	from landing.
   458	
   459	## 11. Trust Boundary / Security
   460	
   461	### 11.1 Trust boundary
   462	
   463	- The corpus consumes external content fetched from
   464	  third-party URLs. Each fetch is treated as untrusted
   465	  input: the agent (WebFetch / curl) returns content; the
   466	  artefact author extracts text and attributes it; no
   467	  fetched content is executed.
   468	- The fetched URLs themselves are recorded; consumers of
   469	  the corpus can re-fetch and verify.
   470	

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "find research/primary-sources -maxdepth 1 -type f -name '*.md' | sort | sed 's#"'^#/#'"' | wc -l && find research/primary-sources -maxdepth 1 -type f -name '*.md' -printf '%f
' | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
23
12-factor.md
INDEX.md
adr-nygard.md
adr-tools-state.md
arc42.md
c4-model.md
cucumber-gherkin.md
cyclonedx-sbom.md
diataxis.md
helm-values-schema.md
json-schema.md
kiro.md
leaddev-agent-compiled.md
nix-flakes.md
oci-artifacts.md
openapi-3-1.md
openspec.md
oracle-agent-spec.md
ref-arch-vs-solution-arch.md
sigstore-cosign.md
spec-kit.md
structurizr-dsl.md
symphony-spec.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "test -f research/primary-sources/INDEX.md && test -x scripts/check-corpus-completeness.sh && printf 'presence/executable: PASS\\n'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
presence/executable: PASS

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "if command -v shellcheck >/dev/null 2>&1; then shellcheck scripts/check-corpus-completeness.sh; else echo 'shellcheck: not installed'; fi" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
shellcheck: not installed

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "ls -la reviews && find reviews -maxdepth 2 -type f -printf '%p\\n' | sort | tail -50" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
total 0
drwxr-xr-x. 1 hasnobeef hasnobeef 216 May 19 19:32 .
drwxr-xr-x. 1 hasnobeef hasnobeef 296 May 18 20:37 ..
drwxr-xr-x. 1 hasnobeef hasnobeef 154 May 18 21:00 codex-2026-05-19
drwxr-xr-x. 1 hasnobeef hasnobeef 126 May 19 14:49 codex-2026-05-19-round2
drwxr-xr-x. 1 hasnobeef hasnobeef  96 May 19 16:54 codex-2026-05-19-round3
drwxr-xr-x. 1 hasnobeef hasnobeef  96 May 19 18:51 codex-2026-05-19-round4
drwxr-xr-x. 1 hasnobeef hasnobeef  66 May 19 19:46 codex-2026-05-19-round5
reviews/codex-2026-05-19-round2/00-SYNTHESIS.md
reviews/codex-2026-05-19-round2/01-parent-decision.md
reviews/codex-2026-05-19-round2/02-corpus.md
reviews/codex-2026-05-19-round2/03-v2-repack.md
reviews/codex-2026-05-19-round3/01-parent-decision.md
reviews/codex-2026-05-19-round3/02-corpus.md
reviews/codex-2026-05-19-round3/03-v2-repack.md
reviews/codex-2026-05-19-round4/01-parent-decision.md
reviews/codex-2026-05-19-round4/02-corpus.md
reviews/codex-2026-05-19-round4/03-v2-repack.md
reviews/codex-2026-05-19-round5/01-parent-decision.md
reviews/codex-2026-05-19-round5/02-corpus.md
reviews/codex-2026-05-19/00-SYNTHESIS.md
reviews/codex-2026-05-19/01-parent-decision.md
reviews/codex-2026-05-19/02-corpus.md
reviews/codex-2026-05-19/03-v2-repack.md
reviews/codex-2026-05-19/04-longread.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --unified=80 --format=fuller afc2ba0 -- specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
commit afc2ba0e1a9d7ba7f8e9dcff5aabaf6a8b10d7d6
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 19:06:12 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 19:06:12 2026 -0700

    fix(corpus r4): AC-4 wording + Completion Report partial truth + §17 Q4 close (codex R4)
    
    Round-4 codex re-review closed remaining corpus gaps:
    
    MEDIUM AC-4 stale wording -> RESOLVED:
    - AC-4 + AC-7 wording now enumerates the three valid status
      terminals (primary-read-complete OR partial-with-note OR
      access-blocked-with-note) consistent with §7.2 + script.
    
    MEDIUM Completion Report residual-risk partial truth -> RESOLVED:
    - §19.4 partial-artefact bullet rewritten: lists all 3 partial
      artefacts (structurizr-dsl, adr-tools-state, json-schema)
      instead of the previous 2; clarifies that INDEX rows now
      correctly show `partial` (not the falsely-claimed
      `primary-read-complete`) per codex remediation 2.2.
    
    LOW §17 Q4 stale governance -> RESOLVED:
    - Q4 marked resolved (cyclonedx + json-schema landed at v1.1
      per §7.D). REMAINING v1.2 candidates documented: SPDX, Pact,
      CUE, Dev Container Spec, SLSA/in-toto. Not a blocker for
      v1.1 corpus closure.
    
    Lint clean + check-corpus-completeness PASS 22 (3 partial).

diff --git a/specs/2026-05-19-primary-source-research-corpus/SPEC.md b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
index 651c2d3..fe94906 100644
--- a/specs/2026-05-19-primary-source-research-corpus/SPEC.md
+++ b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
@@ -420,418 +420,431 @@ function check_corpus_completeness():
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
-| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 |
+| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
 | AC-5 | For each slug in §6.1: `cmd://test -f research/primary-sources/<slug>.md` exits 0 |
 | AC-6 | Every artefact has `fetch_outcome` ∈ {`primary-read-complete`, `partial`, `access-blocked`} |
-| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer |
+| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
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
 
 - [x] AC-1: `cmd://bash scripts/lint-spec.sh
       specs/2026-05-19-primary-source-research-corpus/SPEC.md`
       exits 0.
 - [x] AC-2: `cmd://test -f
       research/primary-sources/INDEX.md` exits 0.
 - [x] AC-3: `cmd://test -x
       scripts/check-corpus-completeness.sh` exits 0.
 - [x] AC-4: `cmd://bash
       scripts/check-corpus-completeness.sh` exits 0 with
       every §6.1 slug at status
       `primary-read-complete` OR `access-blocked` + note.
 - [x] AC-5: Every §6.1 slug has a corresponding
       artefact file under `research/primary-sources/`.
 - [x] AC-6: Every artefact's front-matter passes the §8.1
       schema check.
 - [x] AC-7: No verbatim §3 quote exceeds the §6.3
       fair-use bound (or, if it does, the source's
       license is recorded as permitting it).
 - [x] AC-8: §17 Completion Report records per-source
       fetch outcomes + any access-blocked resolutions.
 - [x] AC-9: Cross-family review (BLOCKING per parent
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
-- [ ] Q4: Are there primary sources missing from §6.1
-      that should land in v1.0? Specifically: SPDX/SBOM
-      (CycloneDX), Pact for contract testing, JSON
-      Schema (separately from Helm values), CUE
-      (configuration language). Defer to owner; not a
-      blocker for v1.0 if absent.
+- [x] Q4: Are there primary sources missing from §6.1?
+      RESOLVED 2026-05-19 (codex remediation §7.D
+      brought JSON Schema + CycloneDX SBOM into v1.1
+      source list; `SOURCE_LIST_VERSION` bumped to
+      v1.1). REMAINING v1.2 candidates: SPDX (alternate
+      SBOM format), Pact (contract testing), CUE
+      (configuration language), Dev Container Spec,
+      SLSA/in-toto (supply-chain attestation). Defer
+      to follow-on Contract SPEC amendment; not a
+      blocker for v1.1 corpus closure.
 
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
 
 - `scripts/check-corpus-completeness.sh` — mechanical
   corpus-completeness gate (new).
 - `research/primary-sources/INDEX.md` — v1.1 corpus
   index (bumped from v1.0 per codex remediation §7.D);
   22 rows total: 19 at status: primary-read-complete, 3
   at status: partial with deferred-reads notes per
   SPEC §7.2 (adr-tools-state, structurizr-dsl,
   json-schema).
 - `research/primary-sources/*.md` — 22 per-source
   artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   cyclonedx-sbom), all conforming to §6.2 schema +
   §8.1 front-matter:
   - arc42 (architecture documentation)
   - c4-model (architecture model)
   - adr-nygard (foundational ADR)
   - adr-tools-state (state-of-practice ADR)
   - diataxis (documentation taxonomy)
   - 12-factor (cloud-native SaaS methodology)
   - helm-values-schema (customization-affordance)
   - nix-flakes (reproducibility)
   - oci-artifacts (distribution packaging)
   - sigstore-cosign (signing)
   - symphony-spec (operating-model-as-SPEC)
   - spec-kit (spec-as-authoring tool)
   - kiro (agentic IDE)
   - openspec (spec-driven dev tool)
   - oracle-agent-spec (framework-agnostic agent
     description)
   - ref-arch-vs-solution-arch (ownership-split
     precursor)
   - leaddev-agent-compiled (published risk critique)
   - cucumber-gherkin (executable behavior spec)
   - openapi-3-1 (HTTP API contract)
   - structurizr-dsl (architecture-as-code)
 - This SPEC's §15 Acceptance Criteria checkboxes
   flipped to checked.
 
 ### 19.2 Commands run
 
 - 25 `cmd://WebFetch` invocations across the 22 sources
   (some sources required supplementary fetches; one
   redirect was followed from nixos.org to nix.dev; 2
   v1.1 fetches added: json-schema + cyclonedx-sbom per
   codex remediation §7.D).
 - `cmd://bash scripts/lint-spec.sh
   specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   — exit 0 (0 errors, 0 warnings, 47 citation hits).
 - `cmd://bash scripts/check-corpus-completeness.sh` —
   exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
 - Per-artefact `cmd://bash scripts/lint-spec.sh
   research/primary-sources/<slug>.md` — exit 1 on each.
   Two issue classes:
   1. Front-matter shape: corpus artefacts use `slug:`
      not `type:`, so lint reports "missing
      type/implies_spec_type field" + "missing required
      section: ##". These are misapplied checks — the
      lint script is designed for SPEC artefacts.
   2. Uncited-claim: 18 of 22 artefacts have
      `fact-bearing paragraph lacks citation prefix`
      errors in §4 / §5 / §6 — meta-commentary bullets
      that reference §3 by section but lack an inline
      prefix the script's paragraph scanner recognises.
   **Cross-family review (codex finding 2.1) correctly
   identified this as a hack**: SPEC §7.1 says
   uncited-claim is BLOCKING on corpus artefacts, but
   these failures were waved off as front-matter noise.
   The honest reading is that the current lint is not
   fit-for-purpose on corpus artefacts and the in-place
   enforcement gap is a follow-on Task SPEC for a
   corpus-mode lint extension (or a separate
   `scripts/validate-corpus-citations.sh` script that
   applies only the uncited-claim subset of the
   citation grammar to corpus artefacts). Until that
   Task SPEC executes, `check-corpus-completeness.sh`
   is the authoritative mechanical gate and per-artefact
   citation density is reviewer-enforced. The corpus
   artefacts authored under this SPEC ARE densely cited
   (17+ citation prefixes per artefact), but the
   mechanical claim that uncited-claim is blocking
   cannot currently be verified by the script.
 
 ### 19.3 Verification result
 
 PASS. All §15 ACs met:
 
 - AC-1: SPEC.md lint clean (exit 0).
 - AC-2: INDEX.md present.
 - AC-3: check-corpus-completeness.sh present + executable.
 - AC-4: check-corpus-completeness.sh exits 0; 22
   slugs total (19 primary-read-complete + 3 partial
   with deferred-reads notes per the §7.2 partial
   rule; codex remediation §7.D added json-schema +
   cyclonedx-sbom; codex Round-2 added the partial
   status-truth check to the script).
 - AC-5: every §6.1 slug has corresponding `<slug>.md`
   artefact.
 - AC-6: every artefact's front-matter conforms to
   §8.1 schema (manual review).
 - AC-7: no verbatim §3 quote exceeds the 200-word
   fair-use bound (manual review; longest excerpts are
   the 18-section Symphony list and 12-factor's 12
   named factors, both well under bound).
 - AC-8: this Completion Report records the per-source
   fetch outcomes (19 primary-read-complete + 3 partial
   with deferred-reads notes — adr-tools-state,
   structurizr-dsl, json-schema; zero access-blocked)
   and the source-list discoveries (Kiro Bedrock binding
   NOT confirmed by primary read; was an inferred
   binding in the prior research workpad).
 - AC-9: cross-family review deferred. Same-family
   self-review performed; advisory recorded. Owner
   directive 2026-05-18 ("base this all in deep
   research, not make up bullshit") was the rigour bar;
   the corpus's verbatim-quote anchoring is the
   primary discharge of that obligation, with
   cross-family review as a secondary check that can
   land before downstream slices.
 
 ### 19.4 Residual risk
 
 - **Per-artefact lint mismatch**: the lint script
   treats corpus artefacts as malformed SPECs (missing
   `type:` field; missing standard SPEC sections). Per
   §7.1, this is advisory; the corpus-completeness
   check is the authoritative gate. If future lint
   evolution adds corpus-mode, the per-artefact lint
   warnings disappear; meanwhile they are documented
   noise.
-- **Three artefacts fetched as `partial` material but
-  recorded `primary-read-complete` because the
-  primary URL returned substantive content**:
+- **Three artefacts at `partial` status, with INDEX
+  rows now correctly showing `partial` per the v1.1 +
+  v1.2-pending status-truth alignment** (codex Round-2
+  finding 2.2 closed this gap; original residual-risk
+  text below labelled them "recorded primary-read-
+  complete" which was false — the INDEX now matches the
+  artefact front-matter):
   - `structurizr-dsl` — root page returned definition
     + C4-implementation framing; deep syntax (workspace
     / model / views keywords) was navigation-only on
-    the fetched page. Fetch outcome marked `partial`
-    in the artefact's front-matter; INDEX row still
-    primary-read-complete because the load-bearing
-    methodology claims (DSL purpose, architecture-as-
-    code posture, C4 implementation) were anchored.
+    the fetched page. Fetch outcome `partial` in both
+    artefact front-matter AND INDEX row. The load-
+    bearing methodology claims (DSL purpose,
+    architecture-as-code posture, C4 implementation)
+    were anchored; deep syntax remains a deferred read.
   - `adr-tools-state` — root page returned community
     framing + template-family references but deep
     template specifics + CLI conventions live on
-    sub-pages not fetched. Outcome `partial` in
-    front-matter, `primary-read-complete` in INDEX —
-    sub-pages are queued as open questions for
-    follow-on supplementary fetches if the methodology
-    mandates specific ADR templates.
+    sub-pages not fetched. Outcome `partial` in both
+    front-matter AND INDEX row (INDEX flipped from
+    `primary-read-complete` to `partial` per codex
+    remediation 2.2). Sub-pages queued as open
+    questions for follow-on supplementary fetches.
+  - `json-schema` — added at v1.1 source-list
+    expansion (codex remediation §7.D). Spec index
+    page deep-read; per-vocabulary drafts (Core +
+    Validation) NOT deep-read. Outcome `partial` in
+    both front-matter AND INDEX row.
 - **Kiro Bedrock binding correction**: prior summary
   in the research workpad characterised Kiro as
   "Bedrock-tethered"; the homepage primary read did
   NOT confirm this. The artefact records the
   correction in §4 Fact-link to methodology. The
   methodology's published characterisation of Kiro
   MUST cite the primary read, not the prior summary.
 - **The seven open research questions remain
   unresolved**. This corpus closes the
   primary-source-grounding gap (the methodology can
   now cite arc42, C4, ADRs, etc. accurately) but does
   not resolve the seven open questions from the
   research workpad §2.3 (exhaustiveness vs.
   prescription boundary; ambiguity handling; patching
   semantics; install-matches-intent verification;
   equivalence classes; capability floor; adversarial
   consumption). Those remain published-as-flagged-open
   per parent Decision §7.
 
 ### 19.5 Spec evidence candidates
 
 - **Primary-read corpus pattern**: structured per-source
   artefacts with verbatim claims, fetch trace, gap from
   prior summary, downstream-citation surface, open
   questions are a robust corpus shape for any
   methodology that must ground claims in external
   sources. Capture as a reusable pattern under the
   `spec-evidence-governance` skill: "when the
   methodology depends on external sources, a
   primary-source corpus is the citable foundation —
   agent summaries are not sufficient."
 - **Lint-vs-corpus impedance**: the SPEC's lint script
   is designed for IDEA/SPEC artefacts; corpus
   artefacts (with `slug:` front-matter and §
   structure tuned to source characterisation) trigger
   spurious lint errors. Two paths: (a) extend
   lint-spec.sh with a corpus-mode (out of scope here);
   (b) accept lint as advisory for corpus per the
   SPEC's own §7.1 affordance. We took (b). Capture as
   spec-evidence for future linter design: lints should
   treat front-matter discriminator as the
   artefact-type signal and apply mode-appropriate
   checks rather than assuming SPEC shape.
 - **Verbatim-quote bounded excerpts are practical**:
   the 200-word fair-use bound (§6.3) proved easy to
   honour; the longest excerpts in the corpus
   (Symphony's 18-section list, 12-factor's 12 factor
   names) are well under bound and the artefact's
   Methodology-relevance + Fact-link sections do the
   characterisation work that would otherwise need
   longer excerpts.
 - **Prior-summary corrections happen and matter**:
   the Kiro "Bedrock-tethered" inferred binding was
   contradicted by primary read; the diataxis four-mode
   definitions were anchored verbatim rather than
   paraphrased; arc42's 12-section list was confirmed
   precisely. The corpus's §4 Gap-from-prior-summary
   section captures these corrections explicitly,
   giving the methodology's longread author the data
   to write honestly about what the research workpad
   got right and what needed correction.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --unified=80 --format=fuller c9adcc6 -- specs/2026-05-19-primary-source-research-corpus/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
commit c9adcc6f22168f949b66bc69a77b1e80a6fbbd7b
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 19:30:29 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 19:30:29 2026 -0700

    fix(corpus): §19.0 Amendment Log + historical evidence labelled (self-audit recurring category)
    
    Pattern: original-verification Completion Reports inherit
    historical evidence values (47 citation hits, 20 sources,
    4-candidate matrix shape) but subsequent amendments shift
    those values. Without an Amendment Log, the historical
    evidence reads as current-state and drifts every round.
    
    Adopts the parent Decision SPEC §14.0 Amendment Log pattern:
    - §19.0 new subsection enumerates the post-verification
      amendment rounds (§7.D v1.1 expansion + R3-R5 fixes) with
      current-state values (55 citation hits, 22 sources with
      3 partial-with-notes).
    - §19.2 commands-run section qualifies the "47 citation
      hits" claim with "at original verification; 55 current
      per §19.0".
    
    Self-audit found this pattern in corpus + repack SPECs but
    not new in this commit; parent already had it. Repack fix
    lands in companion commit at agentic-ops-framework.
    
    Lint clean.

diff --git a/specs/2026-05-19-primary-source-research-corpus/SPEC.md b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
index fe94906..5610dc5 100644
--- a/specs/2026-05-19-primary-source-research-corpus/SPEC.md
+++ b/specs/2026-05-19-primary-source-research-corpus/SPEC.md
@@ -591,170 +591,199 @@ provenance is preserved.
       default fallback; Codex (or other non-Claude) pass
       is the rigorous path. Owner directive applies
       ("base this all in deep research" suggests rigour).
       Default: same-family proxy with explicit caveat
       recorded; if owner directs external cross-family,
       escalate.
 - [x] Q4: Are there primary sources missing from §6.1?
       RESOLVED 2026-05-19 (codex remediation §7.D
       brought JSON Schema + CycloneDX SBOM into v1.1
       source list; `SOURCE_LIST_VERSION` bumped to
       v1.1). REMAINING v1.2 candidates: SPDX (alternate
       SBOM format), Pact (contract testing), CUE
       (configuration language), Dev Container Spec,
       SLSA/in-toto (supply-chain attestation). Defer
       to follow-on Contract SPEC amendment; not a
       blocker for v1.1 corpus closure.
 
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
 
 - `scripts/check-corpus-completeness.sh` — mechanical
   corpus-completeness gate (new).
 - `research/primary-sources/INDEX.md` — v1.1 corpus
   index (bumped from v1.0 per codex remediation §7.D);
   22 rows total: 19 at status: primary-read-complete, 3
   at status: partial with deferred-reads notes per
   SPEC §7.2 (adr-tools-state, structurizr-dsl,
   json-schema).
 - `research/primary-sources/*.md` — 22 per-source
   artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
   cyclonedx-sbom), all conforming to §6.2 schema +
   §8.1 front-matter:
   - arc42 (architecture documentation)
   - c4-model (architecture model)
   - adr-nygard (foundational ADR)
   - adr-tools-state (state-of-practice ADR)
   - diataxis (documentation taxonomy)
   - 12-factor (cloud-native SaaS methodology)
   - helm-values-schema (customization-affordance)
   - nix-flakes (reproducibility)
   - oci-artifacts (distribution packaging)
   - sigstore-cosign (signing)
   - symphony-spec (operating-model-as-SPEC)
   - spec-kit (spec-as-authoring tool)
   - kiro (agentic IDE)
   - openspec (spec-driven dev tool)
   - oracle-agent-spec (framework-agnostic agent
     description)
   - ref-arch-vs-solution-arch (ownership-split
     precursor)
   - leaddev-agent-compiled (published risk critique)
   - cucumber-gherkin (executable behavior spec)
   - openapi-3-1 (HTTP API contract)
   - structurizr-dsl (architecture-as-code)
 - This SPEC's §15 Acceptance Criteria checkboxes
   flipped to checked.
 
-### 19.2 Commands run
+### 19.0 Amendment log (post-verification edits)
+
+Per the pattern established in the parent Decision SPEC
+§14.0, this Completion Report was filled at original
+verification 2026-05-19 (v1.0 source list, 20 sources).
+Subsequent codex cross-family remediation rounds amended
+§6.1 (v1.1 source-list expansion adding json-schema +
+cyclonedx-sbom), §7.2 (partial-with-note rule),
+research/primary-sources/* (overreach + status-truth
+fixes), and the check script (partial enforcement).
+Historical evidence values in §19.2 reflect original-
+verification state, NOT current state.
+
+| Round | Date | Notable | Current evidence |
+|---|---|---|---|
+| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
+| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
+| R3-R5 | 2026-05-19 | Overreach + status-truth + AC alignment | 22 sources (3 partial-with-notes), 55 corpus-SPEC citation hits |
+
+Current-state evidence values supersede §19.2:
+- corpus-SPEC citation-prefix hits: 55 (per current
+  `lint-spec.sh` invocation)
+- corpus row count: 22 (19 primary-read-complete +
+  3 partial)
+- script check: PASS — 22 sources (3 partial with
+  deferred-reads notes)
+
+### 19.2 Commands run (historical; original verification)
 
 - 25 `cmd://WebFetch` invocations across the 22 sources
   (some sources required supplementary fetches; one
   redirect was followed from nixos.org to nix.dev; 2
   v1.1 fetches added: json-schema + cyclonedx-sbom per
   codex remediation §7.D).
 - `cmd://bash scripts/lint-spec.sh
   specs/2026-05-19-primary-source-research-corpus/SPEC.md`
-  — exit 0 (0 errors, 0 warnings, 47 citation hits).
+  — exit 0 (0 errors, 0 warnings, 47 citation hits at
+  original verification; 55 current per §19.0 Amendment
+  Log).
 - `cmd://bash scripts/check-corpus-completeness.sh` —
   exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
 - Per-artefact `cmd://bash scripts/lint-spec.sh
   research/primary-sources/<slug>.md` — exit 1 on each.
   Two issue classes:
   1. Front-matter shape: corpus artefacts use `slug:`
      not `type:`, so lint reports "missing
      type/implies_spec_type field" + "missing required
      section: ##". These are misapplied checks — the
      lint script is designed for SPEC artefacts.
   2. Uncited-claim: 18 of 22 artefacts have
      `fact-bearing paragraph lacks citation prefix`
      errors in §4 / §5 / §6 — meta-commentary bullets
      that reference §3 by section but lack an inline
      prefix the script's paragraph scanner recognises.
   **Cross-family review (codex finding 2.1) correctly
   identified this as a hack**: SPEC §7.1 says
   uncited-claim is BLOCKING on corpus artefacts, but
   these failures were waved off as front-matter noise.
   The honest reading is that the current lint is not
   fit-for-purpose on corpus artefacts and the in-place
   enforcement gap is a follow-on Task SPEC for a
   corpus-mode lint extension (or a separate
   `scripts/validate-corpus-citations.sh` script that
   applies only the uncited-claim subset of the
   citation grammar to corpus artefacts). Until that
   Task SPEC executes, `check-corpus-completeness.sh`
   is the authoritative mechanical gate and per-artefact
   citation density is reviewer-enforced. The corpus
   artefacts authored under this SPEC ARE densely cited
   (17+ citation prefixes per artefact), but the
   mechanical claim that uncited-claim is blocking
   cannot currently be verified by the script.
 
 ### 19.3 Verification result
 
 PASS. All §15 ACs met:
 
 - AC-1: SPEC.md lint clean (exit 0).
 - AC-2: INDEX.md present.
 - AC-3: check-corpus-completeness.sh present + executable.
 - AC-4: check-corpus-completeness.sh exits 0; 22
   slugs total (19 primary-read-complete + 3 partial
   with deferred-reads notes per the §7.2 partial
   rule; codex remediation §7.D added json-schema +
   cyclonedx-sbom; codex Round-2 added the partial
   status-truth check to the script).
 - AC-5: every §6.1 slug has corresponding `<slug>.md`
   artefact.
 - AC-6: every artefact's front-matter conforms to
   §8.1 schema (manual review).
 - AC-7: no verbatim §3 quote exceeds the 200-word
   fair-use bound (manual review; longest excerpts are
   the 18-section Symphony list and 12-factor's 12
   named factors, both well under bound).
 - AC-8: this Completion Report records the per-source
   fetch outcomes (19 primary-read-complete + 3 partial
   with deferred-reads notes — adr-tools-state,
   structurizr-dsl, json-schema; zero access-blocked)
   and the source-list discoveries (Kiro Bedrock binding
   NOT confirmed by primary read; was an inferred
   binding in the prior research workpad).
 - AC-9: cross-family review deferred. Same-family
   self-review performed; advisory recorded. Owner
   directive 2026-05-18 ("base this all in deep
   research, not make up bullshit") was the rigour bar;
   the corpus's verbatim-quote anchoring is the
   primary discharge of that obligation, with
   cross-family review as a secondary check that can
   land before downstream slices.
 
 ### 19.4 Residual risk
 
 - **Per-artefact lint mismatch**: the lint script
   treats corpus artefacts as malformed SPECs (missing
   `type:` field; missing standard SPEC sections). Per
   §7.1, this is advisory; the corpus-completeness
   check is the authoritative gate. If future lint
   evolution adds corpus-mode, the per-artefact lint
   warnings disappear; meanwhile they are documented

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "awk 'BEGIN{in_table=0} /"'^'"\\| Slug \\| Source \\|/{in_table=1; next} in_table && /"'^'"\\|---/{next} in_table && /"'^'"\\|/ {gsub(/"'^'"\\|[[:space:]]*/, \"\"); split("'$0,a,"|"); gsub(/[[:space:]]+$/, "", a[1]); print a[1]; next} in_table && !/''^'"\\|/ {exit}' specs/2026-05-19-primary-source-research-corpus/SPEC.md | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor
adr-nygard
adr-tools-state
arc42
c4-model
cucumber-gherkin
cyclonedx-sbom
diataxis
helm-values-schema
json-schema
kiro
leaddev-agent-compiled
nix-flakes
oci-artifacts
openapi-3-1
openspec
oracle-agent-spec
ref-arch-vs-solution-arch
sigstore-cosign
spec-kit
structurizr-dsl
symphony-spec

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "awk 'BEGIN{in_table=0} /"'^'"\\| Slug \\| Status \\|/{in_table=1; next} in_table && /"'^'"\\|---/{next} in_table && /"'^'"\\|/ {gsub(/"'^'"\\|[[:space:]]*/, \"\"); split("'$0,a,"|"); gsub(/[[:space:]]+$/, "", a[1]); print a[1]; next} in_table && !/''^'"\\|/ {exit}' research/primary-sources/INDEX.md | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor
adr-nygard
adr-tools-state
arc42
c4-model
cucumber-gherkin
cyclonedx-sbom
diataxis
helm-values-schema
json-schema
kiro
leaddev-agent-compiled
nix-flakes
oci-artifacts
openapi-3-1
openspec
oracle-agent-spec
ref-arch-vs-solution-arch
sigstore-cosign
spec-kit
structurizr-dsl
symphony-spec

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "awk 'BEGIN{in_table=0} /"'^'"\\| Slug \\| Status \\|/{in_table=1; next} in_table && /"'^'"\\|---/{next} in_table && /"'^'"\\|/ {gsub(/"'^'"\\|[[:space:]]*/, \"\"); split("'$0,a,"|"); gsub(/[[:space:]]+$/, "", a[1]); gsub(/''^[[:space:]]+|[[:space:]]+$/, "", a[2]); print a[1]"|"a[2]; next} in_table && !/''^'"\\|/ {exit}' research/primary-sources/INDEX.md | sort" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor|primary-read-complete
adr-nygard|primary-read-complete
adr-tools-state|partial
arc42|primary-read-complete
c4-model|primary-read-complete
cucumber-gherkin|primary-read-complete
cyclonedx-sbom|primary-read-complete
diataxis|primary-read-complete
helm-values-schema|primary-read-complete
json-schema|partial
kiro|primary-read-complete
leaddev-agent-compiled|primary-read-complete
nix-flakes|primary-read-complete
oci-artifacts|primary-read-complete
openapi-3-1|primary-read-complete
openspec|primary-read-complete
oracle-agent-spec|primary-read-complete
ref-arch-vs-solution-arch|primary-read-complete
sigstore-cosign|primary-read-complete
spec-kit|primary-read-complete
structurizr-dsl|partial
symphony-spec|primary-read-complete

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in research/primary-sources/*.md; do b=$(basename "$f" .md); [ "$b" = INDEX ] && continue; status=$(sed -n '"'s/"'^fetch_outcome: "'"\\(.*\\)\"/\\1/p' \""'$f"); printf '"'%s|%s\\n' \""'$b" "$status"; done | sort' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
12-factor|primary-read-complete
adr-nygard|primary-read-complete
adr-tools-state|partial
arc42|primary-read-complete
c4-model|primary-read-complete
cucumber-gherkin|primary-read-complete
cyclonedx-sbom|primary-read-complete
diataxis|primary-read-complete
helm-values-schema|primary-read-complete
json-schema|partial
kiro|primary-read-complete
leaddev-agent-compiled|primary-read-complete
nix-flakes|primary-read-complete
oci-artifacts|primary-read-complete
openapi-3-1|primary-read-complete
openspec|primary-read-complete
oracle-agent-spec|primary-read-complete
ref-arch-vs-solution-arch|primary-read-complete
sigstore-cosign|primary-read-complete
spec-kit|primary-read-complete
structurizr-dsl|partial
symphony-spec|primary-read-complete

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-primary-source-research-corpus/SPEC.md | sed -n '806,870p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
   806	  - `adr-tools-state` — root page returned community
   807	    framing + template-family references but deep
   808	    template specifics + CLI conventions live on
   809	    sub-pages not fetched. Outcome `partial` in both
   810	    front-matter AND INDEX row (INDEX flipped from
   811	    `primary-read-complete` to `partial` per codex
   812	    remediation 2.2). Sub-pages queued as open
   813	    questions for follow-on supplementary fetches.
   814	  - `json-schema` — added at v1.1 source-list
   815	    expansion (codex remediation §7.D). Spec index
   816	    page deep-read; per-vocabulary drafts (Core +
   817	    Validation) NOT deep-read. Outcome `partial` in
   818	    both front-matter AND INDEX row.
   819	- **Kiro Bedrock binding correction**: prior summary
   820	  in the research workpad characterised Kiro as
   821	  "Bedrock-tethered"; the homepage primary read did
   822	  NOT confirm this. The artefact records the
   823	  correction in §4 Fact-link to methodology. The
   824	  methodology's published characterisation of Kiro
   825	  MUST cite the primary read, not the prior summary.
   826	- **The seven open research questions remain
   827	  unresolved**. This corpus closes the
   828	  primary-source-grounding gap (the methodology can
   829	  now cite arc42, C4, ADRs, etc. accurately) but does
   830	  not resolve the seven open questions from the
   831	  research workpad §2.3 (exhaustiveness vs.
   832	  prescription boundary; ambiguity handling; patching
   833	  semantics; install-matches-intent verification;
   834	  equivalence classes; capability floor; adversarial
   835	  consumption). Those remain published-as-flagged-open
   836	  per parent Decision §7.
   837	
   838	### 19.5 Spec evidence candidates
   839	
   840	- **Primary-read corpus pattern**: structured per-source
   841	  artefacts with verbatim claims, fetch trace, gap from
   842	  prior summary, downstream-citation surface, open
   843	  questions are a robust corpus shape for any
   844	  methodology that must ground claims in external
   845	  sources. Capture as a reusable pattern under the
   846	  `spec-evidence-governance` skill: "when the
   847	  methodology depends on external sources, a
   848	  primary-source corpus is the citable foundation —
   849	  agent summaries are not sufficient."
   850	- **Lint-vs-corpus impedance**: the SPEC's lint script
   851	  is designed for IDEA/SPEC artefacts; corpus
   852	  artefacts (with `slug:` front-matter and §
   853	  structure tuned to source characterisation) trigger
   854	  spurious lint errors. Two paths: (a) extend
   855	  lint-spec.sh with a corpus-mode (out of scope here);
   856	  (b) accept lint as advisory for corpus per the
   857	  SPEC's own §7.1 affordance. We took (b). Capture as
   858	  spec-evidence for future linter design: lints should
   859	  treat front-matter discriminator as the
   860	  artefact-type signal and apply mode-appropriate
   861	  checks rather than assuming SPEC shape.
   862	- **Verbatim-quote bounded excerpts are practical**:
   863	  the 200-word fair-use bound (§6.3) proved easy to
   864	  honour; the longest excerpts in the corpus
   865	  (Symphony's 18-section list, 12-factor's 12 factor
   866	  names) are well under bound and the artefact's
   867	  Methodology-relevance + Fact-link sections do the
   868	  characterisation work that would otherwise need
   869	  longer excerpts.
   870	- **Prior-summary corrections happen and matter**:

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba research/primary-sources/INDEX.md | sed -n '1,55p'" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
     1	# Primary-source corpus index
     2	
     3	Source-list version: v1.1
     4	Last updated: 2026-05-19
     5	
     6	Per
     7	`file://../../specs/2026-05-19-primary-source-research-corpus/SPEC.md`
     8	§6.1, §6.4. Every slug listed below has a corresponding
     9	artefact file at `research/primary-sources/<slug>.md`. The
    10	check script `scripts/check-corpus-completeness.sh` enforces
    11	the bijection and the completeness state.
    12	
    13	| Slug | Status | Fetched on | Methodology summary |
    14	|---|---|---|---|
    15	| arc42 | primary-read-complete | 2026-05-19 | Architecture documentation template; 12-section structure (Introduction/Goals → Glossary); §9 Architecture Decisions is first-class |
    16	| c4-model | primary-read-complete | 2026-05-19 | Four-level hierarchical model: Software Systems → Containers → Components → Code; notation- and tooling-independent |
    17	| adr-nygard | primary-read-complete | 2026-05-19 | 2011 foundational ADR post; five-section template (Title/Context/Decision/Consequences/Status); lightweight thesis |
    18	| adr-tools-state | partial | 2026-05-19 | adr.github.io community + ADR template catalogue (Nygard, MADR, Y-statements). Root page read; sub-pages /adr-templates/, /ad-practices/, /adr-tooling/ NOT deep-read — methodology MUST NOT cite deep template specifics or CLI conventions from this entry until those sub-pages land |
    19	| diataxis | primary-read-complete | 2026-05-19 | Four-mode documentation taxonomy on two axes (action-vs-cognition × study-vs-work): tutorials / how-to / reference / explanation |
    20	| 12-factor | primary-read-complete | 2026-05-19 | 12-factor SaaS methodology; 12 named factors; Factor III "Store config in the environment" |
    21	| helm-values-schema | primary-read-complete | 2026-05-19 | Chart.yaml + values.yaml + values.schema.json (JSON Schema); validation at install/upgrade/lint/template |
    22	| nix-flakes | primary-read-complete | 2026-05-19 | flake.nix (inputs/outputs) + flake.lock (transitive content-hash pin); one concrete reproducibility primitive (comparative "strongest" framing removed per codex Round-2 finding 2.9) |
    23	| oci-artifacts | primary-read-complete | 2026-05-19 | manifest + descriptor + layers; Artifacts Guidance extends spec to non-image payloads (SBOMs, signatures, SPEC bundles) |
    24	| sigstore-cosign | primary-read-complete | 2026-05-19 | Fulcio (CA) + Rekor (transparency log) + cosign (client); keyless OIDC-rooted signing |
    25	| symphony-spec | primary-read-complete | 2026-05-19 | 18-section operating-model-as-SPEC; three-profile conformance harness; tiered DoD |
    26	| spec-kit | primary-read-complete | 2026-05-19 | GitHub Spec Kit; six-command lifecycle (constitution → specify → clarify → plan → tasks → implement); spec-as-authoring |
    27	| kiro | primary-read-complete | 2026-05-19 | Agentic AI IDE/CLI/web; three-phase workflow (requirements → design → implementation) with EARS notation |
    28	| openspec | primary-read-complete | 2026-05-19 | Fission-AI OpenSpec; three-command workflow (propose/apply/archive); tool-agnostic; brownfield posture |
    29	| oracle-agent-spec | primary-read-complete | 2026-05-19 | Oracle Open Agent Spec; framework-agnostic declarative language for agentic systems; multi-SDK conformance |
    30	| ref-arch-vs-solution-arch | primary-read-complete | 2026-05-19 | Cottmeyer (2019) — reference architecture (universal) vs reference implementation (negotiable); ownership-split precursor |
    31	| leaddev-agent-compiled | primary-read-complete | 2026-05-19 | LeadDev "Can you trust the spec"; risk hypothesis + Kruger patching quote + Willison hybrid mitigation |
    32	| cucumber-gherkin | primary-read-complete | 2026-05-19 | Gherkin executable specifications; Given-When-Then; Feature/Scenario/Background |
    33	| openapi-3-1 | primary-read-complete | 2026-05-19 | OpenAPI 3.1.0; HTTP-API interface description; supersets JSON Schema 2020-12 |
    34	| structurizr-dsl | partial | 2026-05-19 | Text-based DSL for defining C4-model architectures; architecture-as-code. Root page read; deep syntax (workspace/model/views keywords) at docs.structurizr.com/dsl/language NOT deep-read — methodology MUST NOT quote DSL syntax verbatim from this entry until that sub-page lands |
    35	| json-schema | partial | 2026-05-19 | JSON Schema Draft 2020-12; two-part Core + Validation; eight vocabularies. Spec index page read; per-vocabulary drafts NOT deep-read (queued as v1.2 expansion) — methodology MUST NOT quote keyword semantics from this entry until those reads land |
    36	| cyclonedx-sbom | primary-read-complete | 2026-05-19 | OWASP + Ecma jointly-maintained SBOM (ECMA-424); components/services/dependencies/vulnerabilities/metadata; JSON/XML/Protobuf encodings; current version 1.7 |
    37	
    38	## Status legend
    39	
    40	- `pending` — source not yet fetched; corpus incomplete.
    41	- `primary-read-complete` — primary URL fetched, artefact authored, verbatim claims extracted.
    42	- `partial` — primary URL fetched but only partial content available (e.g., paywall fragment, sample chapter).
    43	- `access-blocked` — every retrieval attempt failed; artefact §6 records the alternative-source-found note or unreachability disclaimer.
    44	- `superseded` — replaced by a follow-on entry (slug-suffixed `-vN`).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"v1\\.0|v1\\.1|§17 Completion Report|Completion Report|Status: Draft\" specs/2026-05-19-primary-source-research-corpus/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
20:Status: Draft v1
85:- Repacking Product A v1.1 into manifest+catalog v2.0
146:      for v1.0; subsequent additions land as follow-on
166:### 6.1 In-scope sources (v1.0)
190:| json-schema | JSON Schema specification (Draft 2020-12) | `url://json-schema.org/specification.html` | Added v1.1 per codex remediation finding 2.3 (`file://../2026-05-19-codex-remediation-amendments/SPEC.md` §7.D). Methodology relevance: Helm values-schema + OpenAPI 3.1 both depend on JSON Schema; the methodology's customization sub-spec validates against JSON Schema; citing those transitively without anchoring the underlying primitive is a citation gap |
191:| cyclonedx-sbom | CycloneDX Software Bill of Materials specification | `url://cyclonedx.org/specification/overview/` | Added v1.1 per codex remediation finding 2.3. Methodology relevance: the audit / provenance story (research §4.4 + LeadDev §3 regulated-environments framing) needs a primary SBOM source so the spec-as-distribution manifest can carry verifiable component inventories |
193:`SOURCE_LIST_VERSION: v1.1` (bumped 2026-05-19 by
195:§7.D) — adds `json-schema` + `cyclonedx-sbom` to v1.0
196:baseline. Two further candidates flagged but NOT v1.1
278:Source-list version: v1.0
356:   (Updated 2026-05-19 to align with the v1.1 source-
360:   or access-blocked which contradicted the v1.1
500:| AC-4 | `cmd://bash scripts/check-corpus-completeness.sh` exits 0 with every slug at one of: (a) `primary-read-complete`, (b) `partial` with documented deferred-reads note in artefact §6 (the partial-with-note rule per §7.2 — v1.1 alignment), or (c) `access-blocked` with alternative-source-found or unreachability note. |
503:| AC-7 | Every `access-blocked` artefact's §6 records an alternative-source-found note OR an explicit "this source is unreachable; methodology will not draw on it" disclaimer. Every `partial` artefact's §6 records a deferred-reads note per §7.2 (the partial-with-note rule added 2026-05-19 to align contract with the script's actual semantics post v1.1 source-list expansion). |
505:| AC-9 | §17 Completion Report records the per-source fetch outcomes, total artefacts authored, and any sources where access-blocked + alternative-found resolution happened |
545:- [x] AC-8: §17 Completion Report records per-source
579:- [ ] Q1: The §6.1 source list is the v1.0 frozen set.
599:      brought JSON Schema + CycloneDX SBOM into v1.1
601:      v1.1). REMAINING v1.2 candidates: SPDX (alternate
606:      blocker for v1.1 corpus closure.
630:## 19. Completion Report
636:- `research/primary-sources/INDEX.md` — v1.1 corpus
637:  index (bumped from v1.0 per codex remediation §7.D);
643:  artefacts (20 at v1.0 + 2 added at v1.1: json-schema,
674:§14.0, this Completion Report was filled at original
675:verification 2026-05-19 (v1.0 source list, 20 sources).
677:§6.1 (v1.1 source-list expansion adding json-schema +
686:| Original | 2026-05-19 | v1.0 source list | 20 sources, 47 corpus-SPEC citation hits |
687:| §7.D | 2026-05-19 | v1.1 expansion | 22 sources, +2 added (json-schema, cyclonedx-sbom) |
703:  v1.1 fetches added: json-schema + cyclonedx-sbom per
711:  exit 0; PASS — 22 sources (3 partial with deferred-reads notes; bumped from v1.0 20-source baseline per codex remediation §7.D).
765:- AC-8: this Completion Report records the per-source
792:  rows now correctly showing `partial` per the v1.1 +
814:  - `json-schema` — added at v1.1 source-list

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check' in /var/home/hasnobeef/buildepicshit/agentic-installation-methodology
 succeeded in 0ms:
codex
**Quality Gate Result: FAIL**

Findings:

- **MEDIUM**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534) §15 AC-4 is still stale. It only permits `primary-read-complete` or `access-blocked + note`, but the current corpus has three valid `partial` rows: [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:35). §13 AC-4 and §19.3 are aligned, but literal §15 still makes “All §15 ACs met” untrue.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:99) System Overview omits `partial` from the status enum. Related stale v1.0 wording remains in the §6.1 heading and Q1.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.

Verification run:

- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` passed: 0 errors, 0 warnings, 55 citation hits.
- `bash scripts/check-corpus-completeness.sh` passed: 22 sources, 3 partial with deferred-reads notes.
- Presence/executable checks passed.
- `git diff --check` passed.
- `shellcheck` was not available in this environment.
- No mutations made. Current HEAD observed at `c9adcc6`; `afc2ba0` is present immediately below it.
tokens used
93,368
**Quality Gate Result: FAIL**

Findings:

- **MEDIUM**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:534) §15 AC-4 is still stale. It only permits `primary-read-complete` or `access-blocked + note`, but the current corpus has three valid `partial` rows: [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:18), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:34), [INDEX.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/research/primary-sources/INDEX.md:35). §13 AC-4 and §19.3 are aligned, but literal §15 still makes “All §15 ACs met” untrue.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:99) System Overview omits `partial` from the status enum. Related stale v1.0 wording remains in the §6.1 heading and Q1.

- **LOW**: [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md:642) §19.1 says there are 22 artefacts and notes the +2 v1.1 additions, but the explicit artefact list still enumerates only 20 and omits `json-schema` and `cyclonedx-sbom`.

Verification run:

- `bash scripts/lint-spec.sh specs/2026-05-19-primary-source-research-corpus/SPEC.md` passed: 0 errors, 0 warnings, 55 citation hits.
- `bash scripts/check-corpus-completeness.sh` passed: 22 sources, 3 partial with deferred-reads notes.
- Presence/executable checks passed.
- `git diff --check` passed.
- `shellcheck` was not available in this environment.
- No mutations made. Current HEAD observed at `c9adcc6`; `afc2ba0` is present immediately below it.
