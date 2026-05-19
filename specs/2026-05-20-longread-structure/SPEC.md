---
id: 2026-05-20-longread-structure
status: approved-pending-owner
type: contract
owner: HasNoBeef
repo: agentic-installation-methodology
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md
  - test -d longread
  - bash scripts/validate-longread-structure.sh
cites_decision: 2026-05-18-agentic-installation-methodology
---

# SPEC: Longread Structure + Content Contract (Slice 3)

Status: Draft v1
Type: Contract
Purpose: govern the engineering longread that, paired
with the SPEC bundle (slice 4), constitutes Product B
v1.0. Defines the eight-chapter structure (Phase 0 +
Phases 1–7 per the parent Decision §7), per-chapter word
budget, first-person experiential voice contract,
citation-from-corpus rules, failure-mode disclosure
expectations, and BES attribution posture. The longread
content itself is authored under follow-on Task SPECs
(one per chapter) that cite this Contract by id.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

## 1. Problem Statement

The parent Decision SPEC at
`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7 binds Product B to ship a paired (longread + SPEC
bundle) release. The SPEC bundle's structural contract
landed at v2.0 of the sibling Product A repo. The
longread — the narrative + case-study artefact aimed at
human readers — has not yet been authored.

Without a Contract SPEC for the longread's structure,
chapter authoring would proceed without a per-chapter
word budget, voice contract, or citation-from-corpus
rule — producing prose that drifts from the rolls-royce
posture
(`owner://transcript-2026-05-18`) and the
deep-research-not-bullshit constraint
(`decision-authority://owner:2026-05-18`). This SPEC
fixes the contract so per-chapter Task SPECs author
against a stable shape.

## 2. Goals and Non-Goals

Goals:

- Define the longread's eight-chapter structure mapping
  to the methodology's Phase 0 + Phases 1–7
  (`file://../2026-05-19-primary-source-research-corpus/SPEC.md`
  §3.7 phase enumeration; original phase definitions in
  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6).
- Set per-chapter word budget (target + maximum) so
  total longread length lands in the 8 000–12 000 word
  range per parent Decision §7.
- Set the first-person experiential voice contract
  (per parent Decision §7 and research §8 Posture).
- Set the citation-from-corpus rule: every methodology
  primitive cited in the longread MUST resolve to a
  primary-source corpus entry at
  `file://../../research/primary-sources/<slug>.md §3`,
  not to agent memory or prior summaries.
- Set the failure-mode disclosure expectation: every
  chapter that touches a known failure mode (research §7)
  MUST surface it explicitly, not bury it.
- Set the BES attribution posture: BES is named directly
  throughout (per parent Decision §7 disposition Q4
  "fully named — full transparency"). <!-- lint-ok: no-citation -->
- Author `scripts/validate-longread-structure.sh` as a
  mechanical gate verifying the longread directory has
  the expected chapter files + word counts within budget.

Non-goals:

- Authoring the longread CONTENT (per-chapter Task SPECs
  do that).
- Defining the SPEC bundle's content layout (slice 4
  covers that; this SPEC governs longread only).
- Resolving the seven open research questions
  (`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §2.3). The longread DISCLOSES them as open; it does
  not resolve them.
- Choosing publication channel(s) for the longread
  (blog, paper, OCI artifact). The longread artefact
  lives in this repo at `longread/`; downstream
  publishing channels are a separate Task SPEC.

## 3. System Overview

The longread is a directory `longread/` at the repo
root containing nine markdown files:

```
longread/
├── 00-introduction.md       # frame + intent + posture
├── 01-phase-0-maturity-check.md
├── 02-phase-1-facet-inventory.md
├── 03-phase-2-parameterization-surface.md
├── 04-phase-3-sanitization-bar.md
├── 05-phase-4-manifest-catalog-compose.md
├── 06-phase-5-cross-family-validation.md
├── 07-phase-6-ship.md
└── 08-phase-7-failure-modes-as-first-class-content.md
```

The introduction (00) carries the narrative frame; the
eight phase chapters (01–08) carry one phase each. The
total target is 8 000–12 000 words across all nine
files. A mechanical check script
(`scripts/validate-longread-structure.sh`) verifies
file presence + per-file word counts within budget.

## 4. Authority Map

Active authority:

- `decision-authority://owner:2026-05-18` — owner
  directive ("Do what is the rolls royce" + "base this
  all in deep research, not make up bullshit"); binds
  the longread's posture and depth.
- Parent Decision SPEC at
  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
  §7 — binds longread shape (8–12K words; first-person;
  BES case-study density; failure modes first-class)
  and phase structure (Phase 0 + Phases 1–7).
- Verified primary-source corpus at
  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`
  (status: verified) + the 20 artefacts at
  `file://../../research/primary-sources/<slug>.md` —
  the citable evidence base every chapter draws from.
- Dispositioned research workpad at
  `file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
  §6 (phase definitions) + §7 (BES case-study data) +
  §8 (posture) + §2.3 (seven open research questions).
- `file://../../schema/SPEC.schema.md` — citation
  grammar, RFC 2119 scoping, front-matter conventions.

Stale, superseded, or evidence-only sources:

- `file://../../../bes-fleet-policy/specs/2026-05-17-decomposition-methodology-publication/RESEARCH.md`
  — superseded research workpad; evidence only.

Owner decisions required before implementation:

- [ ] Confirm `longread/` is the right top-level
      directory name (alternatives: `paper/`, `narrative/`,
      `book/`). Default: `longread/`.
- [ ] Confirm per-chapter word budget (§6.2 table)
      lands within the 8 000–12 000 total band. Default:
      yes; adjust per chapter as authoring surfaces real
      length needs.

## 5. Code/Docs Reality Check

- The `longread/` directory does not yet exist at the
  time this SPEC is authored (`cmd://ls
  /var/home/hasnobeef/buildepicshit/agentic-installation-methodology/`
  returns AGENTS.md, CLAUDE.md, CONTRIBUTING.md, CODE_OF_CONDUCT.md,
  LICENSE, README.md, research, schema, scripts, specs,
  templates, tests, hooks, .github, .gitignore — no
  longread directory).
- The script `scripts/validate-longread-structure.sh`
  does not yet exist; it is authored under this Contract.
- The primary-source corpus at `research/primary-sources/`
  is verified (slice 1.5,
  `file://../2026-05-19-primary-source-research-corpus/SPEC.md`
  §17 Acceptance Criteria all checked). The longread
  cites the corpus exclusively for methodology primitives.

## 6. Domain Model

### 6.1 Chapter taxonomy

Eight chapters mapping to the methodology's phase
structure per parent Decision §7 (Phase 0 + 1–7) +
one introduction:

| File | Phase | Title |
|---|---|---|
| `00-introduction.md` | n/a | Why agentic installation; what this longread is + is not; reader contract |
| `01-phase-0-maturity-check.md` | Phase 0 | When a product is ready to be published as a deployment-grade SPEC |
| `02-phase-1-facet-inventory.md` | Phase 1 | Classifying every artefact by facet |
| `03-phase-2-parameterization-surface.md` | Phase 2 | What the spec parameterizes vs hard-codes (the deferral contract) |
| `04-phase-3-sanitization-bar.md` | Phase 3 | Dropping studio context without dropping rigor |
| `05-phase-4-manifest-catalog-compose.md` | Phase 4 | Composing the front-door manifest + per-facet sub-specs |
| `06-phase-5-cross-family-validation.md` | Phase 5 | Validating by a different-family agent walkthrough |
| `07-phase-6-ship.md` | Phase 6 | Shipping the SPEC bundle separately; cross-linking; signing |
| `08-phase-7-failure-modes-as-first-class-content.md` | Phase 7 | Failure modes; open research questions; the honest posture |

### 6.2 Per-chapter word budget

| Chapter | Target words | Maximum words |
|---|---|---|
| 00-introduction | 800 | 1 200 |
| 01-phase-0 | 800 | 1 100 |
| 02-phase-1 | 1 000 | 1 400 |
| 03-phase-2 | 1 000 | 1 400 |
| 04-phase-3 | 900 | 1 200 |
| 05-phase-4 | 1 200 | 1 600 |
| 06-phase-5 | 1 000 | 1 400 |
| 07-phase-6 | 800 | 1 100 |
| 08-phase-7 | 1 500 | 2 000 |
| **Total** | **9 000** | **12 400** |

The total target lands in the parent Decision's
8 000–12 000-word band. The maximum row gives ~4%
margin for chapters that prove longer than estimated
without breaching the band's upper bound.

### 6.3 Voice contract

Every chapter MUST follow the first-person experiential
posture per parent Decision §7:

- Use "we" / "we found" / "we tried" / "we abandoned"
  for studio-experience narration.
- Use direct quotation of owner transcripts
  (`owner://transcript-<date>`) where load-bearing
  rolls-royce / honesty directives anchor methodology
  choices.
- Use direct quotation of corpus entries
  (`file://research/primary-sources/<slug>.md §3`) where
  a primary-source claim is cited.
- Avoid passive voice for studio actions (NOT "the
  framework was extracted from"; YES "we extracted the
  framework from").
- Avoid third-person methodology-vendor voice (NOT "the
  methodology recommends"; YES "we recommend" or "the
  methodology Product B publishes recommends").
- Acknowledge failure first-person: "we did not solve
  this; we name it as an open question."

### 6.4 Citation-from-corpus rule

Every methodology primitive (arc42, C4, ADRs, Helm,
Nix, OCI, Sigstore, Symphony, Cucumber, OpenAPI,
Structurizr, Diátaxis, 12-factor, Spec Kit, Kiro,
OpenSpec, Oracle Agent Spec, Cottmeyer's
reference-architecture distinction, LeadDev critique)
MUST cite the corresponding corpus entry at
`file://research/primary-sources/<slug>.md §3`, NOT
agent memory, NOT prior summaries, NOT direct external
URLs as the primary anchor.

Direct external URLs MAY appear as secondary citations
("for the full spec, see
`url://example.com/foo`") but the canonical anchor for
the longread's claim is the corpus entry.

Owner-affirmed claims use `owner://transcript-<date>`
inline.

Agent-synthesized observations use
`judgment://agent-synthesis` — the longread MAY
include these but MUST be sparing; the deep-research
directive favours corpus citations.

### 6.5 Failure-mode disclosure rule

The four+ failure modes catalogued in the research
workpad
(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§7) are first-class content in chapter 08:

- Fastpath zero-adoption (research §7 sub-bullet a).
- Decomposition-phase paper-only across 23 SPECs
  (research §7 sub-bullet b).
- Workpad bootstrap gap (research §7 sub-bullet c).
- Four owner-blocking ceremony refactor questions
  (research §7 sub-bullet d).
- Plus any newly-surfaced failure modes from authoring
  the longread itself (chapter 08 author MAY add).

Each disclosed failure mode follows a three-element
structure:

1. What happened (verbatim or near-verbatim from the
   research workpad).
2. What we did about it (sanitized; specific BES
   transcript identifiers removed; the pattern
   preserved).
3. What pattern generalizes from the failure
   (`judgment://agent-synthesis` is acceptable here).

### 6.6 BES attribution posture

BES is named directly throughout the longread per parent
Decision §7 disposition Q4 ("fully named — full
transparency"). Specifically:

- "BES" / "the BES studio" used unselfconsciously when
  the studio is the subject.
- Owner identifier (`HasNoBeef`) used in citations of
  owner transcripts.
- Internal SPEC IDs (e.g.
  `2026-05-17-contract-corpus-retrospective-audit`)
  cited where they support a specific failure-mode
  disclosure; the SPEC identifier itself is
  sanitization-safe (it's a slug, not content).
- Internal transcript identifiers
  (`owner://transcript-2026-05-18`) cited where the
  owner-verbatim grounds a methodology choice.

The studio's product names (other BES product repos —
ACTOCCATUD, Floom, IKTO, etc.) are NOT named in the
longread; they are irrelevant to the methodology
discussion. The studio's identity IS named; specific
unrelated product repos are not.

## 7. Pipeline Specification

### 7.1 Authoring sequence

Per-chapter Task SPECs land in this order (each cites
this Contract by id):

1. T-01 chapter 00 introduction (frame + reader
   contract).
2. T-02 chapter 01 Phase 0 (maturity check).
3. T-03 chapter 02 Phase 1 (facet inventory).
4. T-04 chapter 03 Phase 2 (parameterization surface).
5. T-05 chapter 04 Phase 3 (sanitization bar).
6. T-06 chapter 05 Phase 4 (manifest+catalog compose).
7. T-07 chapter 06 Phase 5 (cross-family validation).
8. T-08 chapter 07 Phase 6 (ship).
9. T-09 chapter 08 Phase 7 (failure modes as
   first-class content).

Chapters 01–08 author against the Phase definitions in
the research workpad
(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6); chapter 00 frames + chapter 08 closes.

Per parent Decision §7 ordering guidance: "earlier-
phase slices SHOULD be authored against Product A's
existing v1.1/v2.0 artefacts so the repack work is
informed by the Phase 1-2 facet inventory rather than
the other way around." The facet inventory is already
done (Product A v2.0 §6.2 facets at the sibling repo);
chapters 02–05 can cite that work as the worked
example.

### 7.2 Per-chapter Task SPEC contract

Each per-chapter Task SPEC MUST:

- Cite this Contract by id (`cites_contract:
  2026-05-20-longread-structure` in front-matter).
- Name the chapter file it authors.
- State the chapter's intended word count
  (target + maximum per §6.2).
- List the primary-source corpus entries the chapter
  cites + the verbatim quotes the chapter incorporates.
- List the failure modes the chapter discloses (if any).
- Pass the `scripts/validate-longread-structure.sh`
  check after the chapter is written.

The Task SPEC for chapter 00 is the first one
authored; subsequent per-chapter Task SPECs follow
sequentially.

### 7.3 Cross-chapter coherence

The longread is read sequentially; each chapter assumes
the previous chapters are read. Cross-chapter
references use `§N "Chapter Title"` form:

> As we covered in §03 "Phase 1: Facet Inventory" …

Forward references are avoided where possible; if
necessary, mark explicitly ("Chapter 08 returns to this
question").

The introduction (chapter 00) gives the reader a
roadmap of all eight phase chapters; the conclusion
(end of chapter 08) gives a synthesis + the seven open
research questions.

## 8. Schema Specification

### 8.1 Per-chapter file structure

Each `longread/NN-...md` file has the structure:

```markdown
# Chapter NN — <Title>

<one-paragraph epigraph or framing quote — owner
transcript or corpus verbatim>

## Section heading

Body prose with citations inline.

## Section heading

…

---

**In the next chapter**: <one-sentence forward
pointer to chapter NN+1, OR — for chapter 08 —
"This is the last chapter. The seven open research
questions follow.">
```

No front-matter (chapter files are not lint-spec
targets; they are prose artefacts). The
`validate-longread-structure.sh` script enforces file
presence + word counts.

### 8.2 validate-longread-structure.sh contract

The script:

1. Verifies `longread/` exists at repo root.
2. Verifies each of the nine expected files exists at
   `longread/<expected-name>.md`.
3. For each file, counts words (excluding code fences,
   YAML blocks, and citation prefix tokens) and
   verifies word count is between 50 (lower placeholder
   bound) and the chapter's §6.2 maximum.
4. Computes total word count; verifies total is
   between 5 000 (lower bound; allows for chapters in
   placeholder state) and 13 000 (~5% over the §6.2
   maximum to allow margin).
5. Exits 0 on full pass; exit 1 with diagnostics
   otherwise.

The script is permissive on lower bound (50 words per
chapter) so it can run as the longread is being
populated chapter-by-chapter; final validation
re-runs with tightened bounds before the v1.0 release
tag.

## 9. Reference Algorithms

### 9.1 Word counting (pseudocode)

```
function count_words(file_path):
  content = read(file_path)
  # Strip code fences (```…```) and YAML blocks (---…---).
  stripped = strip_code_fences_and_yaml(content)
  # Strip citation prefix tokens (file://, cmd://, url://, etc.).
  stripped = remove_citation_prefixes(stripped)
  # Tokenize on whitespace.
  words = stripped.split()
  return len(words)
```

The exclusion of citation prefix tokens keeps the
word count focused on prose (not URL slugs).

### 9.2 Per-file budget check (pseudocode)

```
function check_budgets():
  errors = []
  for file, (target, max_words) in CHAPTER_BUDGETS.items():
    if not exists(f"longread/{file}"):
      errors.append(f"missing chapter file: {file}")
      continue
    count = count_words(f"longread/{file}")
    if count < 50:
      errors.append(f"{file}: {count} words below placeholder bound 50")
    if count > max_words:
      errors.append(f"{file}: {count} words exceeds maximum {max_words}")
  total = sum(count_words(f"longread/{f}") for f in EXISTING_FILES)
  if total < 5000:
    errors.append(f"total {total} below release bound 5000")
  if total > 13000:
    errors.append(f"total {total} exceeds maximum 13000")
  if errors:
    emit_diagnostics()
    exit 1
  exit 0
```

## 10. Failure Model

| Class | Trigger | Recovery |
|---|---|---|
| `chapter-file-missing` | A required `longread/NN-...md` is absent | Author the chapter via the per-chapter Task SPEC; re-run validator |
| `word-budget-exceeded` | A chapter exceeds its §6.2 maximum | Author tightens prose OR the §6.2 table is amended via a follow-on Contract SPEC amendment |
| `citation-not-from-corpus` | The chapter cites an external URL or agent memory for a methodology primitive that has a corpus entry | Reviewer rejects; author rewrites the citation to point at `file://research/primary-sources/<slug>.md §3` |
| `voice-third-person-drift` | A chapter section slips into third-person methodology-vendor voice | Reviewer flags during per-chapter spec-review; author rewrites to first-person experiential |
| `failure-mode-buried` | Chapter 08 (or any chapter touching a known failure mode) discusses it without applying the §6.5 three-element disclosure structure | Reviewer rejects; author re-discloses with what-happened / what-we-did / what-pattern-generalizes structure |
| `bes-redaction-drift` | The longread sanitizes or anonymizes BES against §6.6 ("fully named") | Reviewer rejects; author restores direct BES naming |

## 11. Trust Boundary / Security

- No secrets, credentials, or third-party private data
  in the longread. Owner-transcript citations are
  truncated to load-bearing-quote-only, not full
  conversation logs.
- The longread does NOT reveal internal BES studio
  product details beyond what's already public (the
  studio name; the framework + methodology repos that
  ARE the public artefacts). Other BES product repos
  are NOT named (§6.6).
- The longread does NOT expose specific user data,
  customer information, or commercial details. The
  studio is a single-owner studio; there are no third-
  party data concerns.

## 12. Observability

- `scripts/validate-longread-structure.sh` exit code is
  the mechanical observability surface.
- Per-chapter spec-review Quality Gate Result is the
  per-chapter quality observability.
- The longread's total word count + per-chapter word
  count is reportable via the validator with a
  `--report` flag (RECOMMENDED extension; not v1.0
  required).

## 13. Test and Validation Matrix

| AC | Test |
|---|---|
| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-20-longread-structure/SPEC.md` exits 0 |
| AC-2 | `cmd://test -d longread` exits 0 |
| AC-3 | `cmd://test -x scripts/validate-longread-structure.sh` exits 0 |
| AC-4 | For each chapter file in §6.1: `cmd://test -f longread/<filename>` exits 0 |
| AC-5 | `cmd://bash scripts/validate-longread-structure.sh` exits 0 |
| AC-6 | Total word count is between 8 000 and 12 000 (release-time tightening of validator's permissive bounds) |
| AC-7 | Every per-chapter Task SPEC cites this Contract by id |
| AC-8 | Every methodology primitive in the longread resolves to a corpus entry citation (manual reviewer check during spec-review) |
| AC-9 | Chapter 08 includes the four+ research §7 failure modes with the §6.5 three-element disclosure structure |

## 14. Implementation Checklist (Definition of Done)

- [ ] DoD-1: `scripts/validate-longread-structure.sh`
      authored + executable.
- [ ] DoD-2: `longread/` directory exists at repo root.
- [ ] DoD-3: All nine chapter files exist at the
      expected paths per §6.1.
- [ ] DoD-4: Each chapter's word count is within its
      §6.2 budget at release time.
- [ ] DoD-5: Total word count lands within 8 000–
      12 000 at release time.
- [ ] DoD-6: Every chapter authored under a per-
      chapter Task SPEC that cites this Contract by id.
- [ ] DoD-7: Every methodology-primitive citation
      resolves to a corpus entry.
- [ ] DoD-8: Chapter 08 carries the failure-mode
      disclosures per §6.5.
- [ ] DoD-9: Voice + BES attribution conform to §6.3
      + §6.6 (reviewer-enforced).

## 15. Acceptance Criteria

(See §13 for tests; checkboxes are the post-execution
verification list.)

- [ ] AC-1: SPEC lint clean
- [ ] AC-2: longread directory exists
- [ ] AC-3: validate-longread-structure.sh executable
- [ ] AC-4: all 9 chapter files exist
- [ ] AC-5: validator exits 0
- [ ] AC-6: total word count within 8 000–12 000
- [ ] AC-7: every per-chapter Task SPEC cites this
      Contract
- [ ] AC-8: methodology primitives cite corpus
- [ ] AC-9: chapter 08 carries failure-mode
      disclosures per §6.5

## 16. Rollback Plan

If the longread structure proves wrong mid-authoring:

1. Pause in-flight per-chapter Task SPECs at their
   current status.
2. Author a follow-on Contract SPEC amendment that
   adjusts §6.1 (chapter taxonomy) or §6.2 (word
   budgets).
3. Resume Task SPECs against the amended Contract.

If the entire longread is abandoned (unlikely; would
mean reversing the parent Decision §7 hybrid shape):

1. The `longread/` directory is preserved as evidence;
   any authored chapters remain as drafts.
2. A follow-on Decision SPEC supersedes the parent
   Decision; this Contract becomes evidence-only.

## 17. Open Questions

- [ ] Q1: Word-budget table (§6.2) is initial estimate;
      authoring may surface real lengths that need
      adjustment. Default: amend via follow-on Contract
      SPEC amendment; not a blocker.
- [ ] Q2: Whether the introduction chapter (00) or the
      Phase 7 chapter (08) is the harder authoring
      task. `judgment://agent-synthesis`: chapter 08
      (failure modes + open questions) is harder
      because the BES-specific case data requires
      careful sanitization to "drop ALL studio context"
      while preserving pattern. Plan: author 00 first
      (lower cognitive load); leave 08 for the final
      authoring pass once the methodology's narrative
      has solidified across chapters 01–07.
- [ ] Q3: Cross-family review for THIS Contract SPEC
      and for the per-chapter Task SPECs. Per parent
      Decision §7, cross-family review is BLOCKING per
      slice. Same-family proxy is the default fallback;
      external Codex pass is the rigorous path. Default:
      same-family proxy with explicit caveat; escalate
      to external review before the v1.0 release tag.
- [ ] Q4: Should the longread include diagrams (e.g.
      a phase-flow diagram, a manifest+catalog shape
      diagram)? Default: no diagrams in v1.0; the
      SPEC bundle (slice 4) carries diagrammatic
      artefacts. The longread is prose-only.

None of Q1–Q4 is `owner-blocking`; all can land as
follow-on Contract SPEC amendments without rework of
chapters already authored.

## 18. Migration / Coexistence

This is a greenfield artefact; nothing migrates. The
research workpad
(`file://../../../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`)
is the upstream synthesis (the hypothesis space); the
longread is the published synthesis (the methodology
as procedure). The workpad is evidence-only;
downstream readers consume the longread, not the
workpad.

The longread cites the workpad ONLY where the
workpad's §7 case-study data is the source — e.g.
chapter 08's failure-mode disclosures cite the
workpad's §7 directly with sanitization for specific <!-- lint-ok: no-citation -->
internal SPEC identifiers.

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
