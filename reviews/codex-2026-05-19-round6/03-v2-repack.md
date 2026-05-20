Reading additional input from stdin...
OpenAI Codex v0.129.0 (research preview)
--------
workdir: /var/home/hasnobeef/buildepicshit/agentic-ops-framework
model: gpt-5.5
provider: openai
approval: never
sandbox: read-only
reasoning effort: xhigh
reasoning summaries: none
session id: 019e439c-efc3-7f50-9699-666874a27923
--------
user
Cross-family re-review Round 6 (gpt-5.5; final convergence). Target: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md + scripts/validate-manifest.sh + spec-bundle/. R5 left: BLOCKER semantic-containment boundary, BLOCKER §174 stale schema cite, ADVISORY bare templates/* paths. R6 fixes at d6ad848 + 05ad7a5. Verify all 3 R5 findings closed + BLOCKER 3.6 boundary fix correct + surface MAJOR-or-higher remaining issues. Output Quality Gate Result. No mutations.
codex
I’ll re-review this read-only against the R5 findings and the two named commits, then report only unresolved MAJOR-or-higher issues plus the gate result.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git status --short --branch' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
## main...origin/main

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git log --oneline --decorate -8' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
05ad7a5 (HEAD -> main, origin/main) fix(v2 r5 follow-up): spec-bundle/schema bare templates/* paths (advisory in R5; missed in previous commit due to Read-before-Edit requirement)
d6ad848 fix(v2 r5): semantic-containment boundary + cross-repo schema cite + bare paths (codex R5 BLOCKERs)
178cee3 spec(amend): repack §19.0 Amendment Log + historical evidence labelled (self-audit)
61528c8 fix(v2 r4): validator semantic-containment + REQUIRED-field expansion + bare-path migration (codex R4)
e78b8a4 fix(v2 r3): validator inside-directory rule + REQUIRED v2.1 field presence + §6.1 v2.1 example + stale paths (codex Round-3)
380db29 fix(v2 r2): validator v2.1 enforcement + manifest provenance honesty + skill/template path migration (codex Round-2 BLOCKER 3.6, HIGH 3.3, HIGH provenance)
ad36bda spec(amend): v2.0 repack §6.1/§8 manifest schema -> v2.1.0 per codex remediation §7.E + §7.F (findings 3.5, 3.6)
9fef966 fix(v2.0): cross-repo citations + migration completeness + fleet-sync guard (codex findings 3.2, 3.3, 3.4)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"semantic-containment|174|templates/|section 3\\.6|§3\\.6|3\\.6|boundary|containment|schema\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
scripts/validate-manifest.sh:5:#   §6.1 (manifest schema), §8 (formal schema), §9.1 (validation
scripts/validate-manifest.sh:10:# 2. spec_version matches the schema version in this script
scripts/validate-manifest.sh:32:RESOURCE_DIRS=("schema" "templates" "skills" "conformance")
scripts/validate-manifest.sh:69:# - v2.1 additions: schema_uri, source_commit.
scripts/validate-manifest.sh:73:for required_key in bundle_version generated_on generator schema_uri source_commit; do
scripts/validate-manifest.sh:167:# schema (codex Round-2 BLOCKER finding closed: previously the script
scripts/validate-manifest.sh:195:# Media-type → file-extension expectations (v2.1 schema §8.3).
scripts/validate-manifest.sh:222:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:230:        # containment via canonicalised paths is the fix.)
scripts/validate-manifest.sh:232:            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment (lexical prefix check)"
scripts/validate-manifest.sh:235:        # Semantic-containment check: canonicalise both paths and
scripts/validate-manifest.sh:249:            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
scripts/validate-manifest.sh:280:printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:26:the v2.0 directory layout, the manifest schema, the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:39:document are to be interpreted as described in RFC 2119 and RFC 8174
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:62:schema, the per-facet sub-spec contracts grounded in the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:75:  schema (machine-readable; lists spec_version,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:137:│   ├── templates/                     # SPEC templates (was /templates/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:138:│   ├── schema/                        # SPEC.schema.md (was /schema/)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:174:- `file://spec-bundle/schema/SPEC.schema.md` — citation
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:175:  grammar, RFC 2119 scoping, front-matter schema (path
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:176:  corrected from `schema/SPEC.schema.md` per codex R5
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:177:  finding; schema lives under `spec-bundle/schema/` in
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:192:- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:199:  §3 — operating-system-boundary contract.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:232:`OPERATING_MODEL.md`, `README.md`, `schema`, `scripts`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:248:Skills, templates, schema currently live at top-level
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:249:(`/skills/`, `/templates/`, `/schema/`); v2.0 relocates
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:262:# spec-bundle/manifest.yaml — v2.1.0 schema example
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:265:# as stale relative to §8.1 v2.1.0 formal schema)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:266:spec_version: "2.1.0"               # semver; this manifest schema version
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:271:schema_uri: "<URL pin>"             # v2.1 REQUIRED; pin to immutable
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:332:  schema:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:333:    path: "schema/SPEC.schema.md"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:336:    path: "templates/"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:361:1. `spec_version` matches the schema version this SPEC
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:434:- `knobs.schema.json` — JSON Schema (Helm-style per
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:435:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:521:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:522:| `templates/` | `spec-bundle/templates/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:530:| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:539:1. Author `spec-bundle/manifest.yaml` per §6.1 schema
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:571:who fetched v1.1 by file paths under `schema/`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:572:`templates/`, `skills/`, `workflow/`, `workpads/` will need
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:586:### 8.1 Manifest schema (formal — v2.1.0)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:597:| `spec_version` | string (semver) | yes | This manifest schema's version |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:602:| `schema_uri` | string (URL) | yes **(v2.1)** | URL of the schema this manifest conforms to; lets adopters reference a versioned remote schema |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:635:| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:641:finding 3.6)**: when `primary` is a directory path, the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:655:| `schema` | object with `path` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:744:| `schema-version-drift` | `spec_version` does not match this SPEC's §6.1 | Author updates the manifest to match OR authors a follow-on Contract SPEC bumping schema version |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:770:  user-observable schema version; consumers can pin
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:771:  against a specific schema version.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:790:      conforming to §6.1 / §8 schema.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:881:  marks the breaking-layout boundary. <!-- lint-ok: no-citation -->
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:886:  symlinks from old paths (`schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:887:  `spec-bundle/schema/SPEC.schema.md`) to ease
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:898:rounds amended §6.1 / §8 (v2.1 schema bump), validate-
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:899:manifest.sh (v2.1 enforcement + semantic containment),
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:908:| §7.E/F | 2026-05-19 | v2.1 schema bump | `ad36bda` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:911:| R4 fixes | 2026-05-20 | validator semantic-containment + REQUIRED-field expansion + final bare-path migration | `61528c8` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:920:- validate-manifest: PASS at v2.1.0 schema with
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:921:  semantic-containment + 5 top-level REQUIRED + 3
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:942:  `knobs.schema.json`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:951:- `schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:952:  `spec-bundle/schema/SPEC.schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:953:- `templates/*.template.md` (6 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:954:  `spec-bundle/templates/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:962:  `spec-bundle/templates/workpads/*.template.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:982:- `cmd://git mv schema spec-bundle/schema` +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:985:  `workpads spec-bundle/templates/workpads`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:996:  at original verification (PASS — manifest schema
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:997:  2.0.0, conformance core, 8 facets; current schema is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1039:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1040:  `file://templates/...`, `file://skills/...` paths
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1071:  any OSS framework with schema + templates + skills +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1090:  release boundary and document content gaps as
spec-bundle/manifest.yaml:6:# schema_uri pins the schema to a stable form. Populated by release
spec-bundle/manifest.yaml:14:schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
spec-bundle/manifest.yaml:24:# schema bump and has its own (older) manifest content; pointing
spec-bundle/manifest.yaml:25:# at v2.0.0 from a v2.1-schema manifest would mislead. The next
spec-bundle/manifest.yaml:26:# tagged release will be v2.1 with full v2.1 schema population
spec-bundle/manifest.yaml:91:  schema:
spec-bundle/manifest.yaml:92:    path: "schema/SPEC.schema.md"
spec-bundle/manifest.yaml:95:    path: "templates/"
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:18:  conform — e.g., a new hook ships, a schema field gains a
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:66:test -f .agents/templates/AGENT_INBOX.template.md && \
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:67:    grep -q "decision-authority://" .agents/specs/SPEC.schema.md
spec-bundle/skills/agent-feedback/SKILL.md:14:`file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:43:   from `file://spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/skills/agent-feedback/SKILL.md:86:  `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/agents-md-improver/SKILL.md:42:  `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) (or
spec-bundle/skills/fast-path/SKILL.md:16:`file://spec-bundle/templates/SPEC.fastpath.template.md`.
spec-bundle/skills/fast-path/SKILL.md:48:   `file://spec-bundle/templates/SPEC.fastpath.template.md`. Status:
spec-bundle/skills/autonomous-issue-dispatch/SKILL.md:22:  expected schema.
spec-bundle/skills/autonomous-issue-dispatch/SKILL.md:35:  authority for its CLI flags and config schema; this skill
spec-bundle/skills/spec-review/SKILL.md:9:§10, §11.3, §17.3. Shared schema:
spec-bundle/skills/spec-review/SKILL.md:10:`file://spec-bundle/schema/SPEC.schema.md` §5.
spec-bundle/skills/spec-review/SKILL.md:15:(SPEC §7.6, schema §1.3).
spec-bundle/skills/spec-review/SKILL.md:51:Per SPEC §10 and SPEC.schema §5:
spec-bundle/skills/spec-review/SKILL.md:157:    SPEC.schema §2 citation grammar.
spec-bundle/skills/spec-review/SKILL.md:242:1. The Quality Gate Result block (YAML, schema above).
spec-bundle/skills/spec-review/SKILL.md:262:- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
spec-bundle/skills/spec-driven-development/SKILL.md:9:end-to-end lifecycle. Authoring mechanics (templates, schema, type
spec-bundle/skills/spec-driven-development/SKILL.md:61:   discipline applies (see `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific)).
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:102:(repo-relative under `your-policy-repo`; under `.templates/` in
spec-bundle/skills/spec-driven-development/SKILL.md:105:- `task` → `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped,
spec-bundle/skills/spec-driven-development/SKILL.md:107:- `contract` → `spec-bundle/templates/SPEC.contract.template.md` — specifies
spec-bundle/skills/spec-driven-development/SKILL.md:111:- `decision` → `spec-bundle/templates/SPEC.decision.template.md` — chooses
spec-bundle/skills/spec-driven-development/SKILL.md:115:RFC 2119 rules, section-naming) live in the shared schema at
spec-bundle/skills/spec-driven-development/SKILL.md:116:`spec-bundle/schema/SPEC.schema.md`. The IDEA artefact uses
spec-bundle/skills/spec-driven-development/SKILL.md:117:`spec-bundle/templates/IDEA.template.md`.
spec-bundle/skills/spec-driven-development/SKILL.md:130:transcript quotes. See `spec-bundle/schema/SPEC.schema.md` §2 for the full
spec-bundle/skills/spec-driven-development/SKILL.md:168:- Put task-control specs in `.templates/` (or `specs/` in
spec-bundle/skills/spec-driven-development/SKILL.md:227:- Goals and non-goals draw a clean boundary.
spec-bundle/skills/spec-driven-development/SKILL.md:235:  meaningful safety or scope boundary.
spec-bundle/templates/TASK.template.md:26:Front-matter schema:
spec-bundle/templates/TASK.template.md:70:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:10:parallel writers to be isolated by branch + worktree boundary
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:66:boundary. Three hook points are RECOMMENDED:
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:8:Authority: `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:65:- Formalized in the schema state machine at
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:66:  `file://spec-bundle/schema/SPEC.schema.md` §1.3 "Capture-after
spec-bundle/skills/spec-review/references/per-type-gates.md:26:  SPEC.schema §2.
spec-bundle/skills/spec-review/references/per-type-gates.md:43:- Every external fact cites a source per SPEC.schema §2.
spec-bundle/skills/spec-review/references/per-type-gates.md:44:- Every entity in the Domain Model section has a full schema
spec-bundle/skills/spec-review/references/per-type-gates.md:84:  (SPEC.schema §3).
spec-bundle/non-goals/INDEX.md:43:- GraphQL schemas.
spec-bundle/non-goals/INDEX.md:56:  `knobs.schema.json`.
spec-bundle/templates/IDEA.template.md:13:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/IDEA.template.md:17:citation prefix from SPEC.schema.md §2.1 (`file://`, `cmd://`, `url://`,
spec-bundle/templates/IDEA.template.md:29:document are to be interpreted as described in RFC 2119 and RFC 8174
spec-bundle/templates/SPEC.fastpath.template.md:43:document are to be interpreted as described in RFC 2119 and RFC 8174
spec-bundle/templates/SPEC.task.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.task.template.md:34:document are to be interpreted as described in RFC 2119 and RFC 8174
spec-bundle/templates/SPEC.task.template.md:44:prefix per SPEC.schema.md §2. -->
spec-bundle/templates/SPEC.task.template.md:133:<!-- guidance: define entities, states, schemas, invariants, inputs,
spec-bundle/templates/SPEC.task.template.md:135:SHOULD have a full schema (type, nullability, example RECOMMENDED).
spec-bundle/templates/SPEC.task.template.md:178:or scope boundary. For game work, this section usually includes
spec-bundle/templates/SPEC.decision.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.decision.template.md:23:are OPTIONAL in Decision specs per SPEC.schema.md §4.1.)
spec-bundle/templates/SPEC.decision.template.md:31:other section of this template (per SPEC.schema.md §3). Lowercase
spec-bundle/templates/SPEC.decision.template.md:42:document are to be interpreted as described in RFC 2119 and RFC 8174
spec-bundle/skills/spec-authoring/SKILL.md:3:description: "Use when capturing an IDEA (/idea-capture) or authoring a SPEC.md (/author-spec) under the spec-first model. Owns templates, type selection (fastpath / task / contract / decision), shared schema, citation discipline, IDEA-conversation tactics. Hands off to spec-review for the BLOCKING gate. Do not use to review existing specs (spec-review) or implement approved specs (implementation-execution)."
spec-bundle/skills/spec-authoring/SKILL.md:67:- `spec-bundle/templates/IDEA.template.md` — the IDEA artefact.
spec-bundle/skills/spec-authoring/SKILL.md:68:- `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped, verifiable
spec-bundle/skills/spec-authoring/SKILL.md:70:- `spec-bundle/templates/SPEC.contract.template.md` — stateful, multi-component,
spec-bundle/skills/spec-authoring/SKILL.md:72:- `spec-bundle/templates/SPEC.decision.template.md` — binding choice between
spec-bundle/skills/spec-authoring/SKILL.md:75:Cross-template conventions (front-matter schema, citation grammar,
spec-bundle/skills/spec-authoring/SKILL.md:76:RFC 2119 rules, section naming) live in `spec-bundle/schema/SPEC.schema.md`.
spec-bundle/skills/spec-authoring/SKILL.md:77:Templates reference that schema rather than restating it. Read the
spec-bundle/skills/spec-authoring/SKILL.md:78:schema before authoring.
spec-bundle/skills/spec-authoring/SKILL.md:153:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) MAY use a
spec-bundle/skills/spec-authoring/SKILL.md:191:`file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/SKILL.md:203:`file://spec-bundle/schema/SPEC.schema.md` §2.5. Use sparingly; pervasive
spec-bundle/skills/spec-authoring/SKILL.md:210:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and
spec-bundle/skills/spec-authoring/SKILL.md:239:  `spec-bundle/schema/SPEC.schema.md` first.
spec-bundle/deployment/install.md:24:cp -r spec-bundle/schema     "$TARGET/"
spec-bundle/templates/SPEC.contract.template.md:17:Refer to `spec-bundle/schema/SPEC.schema.md` for shared conventions
spec-bundle/templates/SPEC.contract.template.md:39:document are to be interpreted as described in RFC 2119 and RFC 8174
spec-bundle/templates/SPEC.contract.template.md:54:`file://spec-bundle/schema/SPEC.schema.md` §1.3 and the 2026-01-15
spec-bundle/templates/SPEC.contract.template.md:122:<!-- guidance: full schemas. Each field declared here MAY be referenced
spec-bundle/templates/SPEC.contract.template.md:123:in downstream sections without re-citing (per SPEC.schema.md §2.3). -->
spec-bundle/templates/SPEC.contract.template.md:168:<!-- guidance: REQUIRED only when the contract defines schemas
spec-bundle/templates/SPEC.contract.template.md:188:(per SPEC.schema.md §2.3); the algorithm as a whole is authored
spec-bundle/templates/SPEC.contract.template.md:218:<!-- guidance: REQUIRED. Identify the trust boundary, authority chain,
spec-bundle/templates/SPEC.contract.template.md:220:boundary. -->
spec-bundle/templates/SPEC.contract.template.md:253:(`file://spec-bundle/schema/SPEC.schema.md` §1.3) and the validation
spec-bundle/customization/contract.md:5:procedure). Following Helm values-schema patterns
spec-bundle/customization/contract.md:6:(`url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/helm-values-schema.md`
spec-bundle/customization/contract.md:19:  (`file://../templates/`).
spec-bundle/customization/contract.md:20:- The schema's citation grammar (`file://`, `cmd://`,
spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
spec-bundle/customization/contract.md:136:the schema or lifecycle.
spec-bundle/customization/contract.md:154:The mechanical knob enumeration is in `knobs.schema.json`
spec-bundle/customization/contract.md:155:(JSON Schema; to be populated). The schema validates an
spec-bundle/templates/workpads/AGENT_INBOX.template.md:88:  (`file://spec-bundle/schema/SPEC.schema.md` §2).
spec-bundle/customization/knobs.schema.json:2:  "$schema": "https://json-schema.org/draft/2020-12/schema",
spec-bundle/customization/knobs.schema.json:3:  "$id": "https://github.com/buildepicshit/agentic-ops-framework/spec-bundle/customization/knobs.schema.json",
spec-bundle/customization/knobs.schema.json:140:        "schema_or_lifecycle_changes_require": {
spec-bundle/operations/workflow-universal.md:10:   EVIDENCE. See `spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/operations/workflow-universal.md:17:   (`spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/operations/workflow-universal.md:35:   `spec-bundle/schema/SPEC.schema.md`.
spec-bundle/operations/workflow-universal.md:39:   `spec-bundle/templates/workpads/SESSION_JOURNAL.template.md`.
spec-bundle/operations/workflow-universal.md:42:   `spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md`.
spec-bundle/operations/workflow-universal.md:96:  read/write boundary.
spec-bundle/operations/workflow-universal.md:165:  schema) MUST originate in the policy repo. Edits to mirrored
spec-bundle/skills/approved-spec-decomposition/SKILL.md:41:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/skills/approved-spec-decomposition/SKILL.md:60:4. For each slice, copy `file://spec-bundle/templates/TASK.template.md` to
spec-bundle/skills/approved-spec-decomposition/SKILL.md:119:   `file://spec-bundle/schema/SPEC.schema.md` §1.3).
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md:64:  the citation grammar from `spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/architecture/solution-strategy.md:18:   `../schema/SPEC.schema.md` §2.
spec-bundle/quality/12-factor-overlay.md:14:| III | Config | Stored in environment per Factor III headline; the customization grammar (`../customization/`) extends this for application-domain knobs (Factor III only covers operating-system-boundary knobs) |
spec-bundle/skills/spec-authoring/references/reference-architecture.md:26:   `owner://` prefix per `file://spec-bundle/schema/SPEC.schema.md` §2.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:66:   boundary against existing fleet tooling (e.g., the
spec-bundle/skills/spec-authoring/references/reference-architecture.md:67:   autonomous-vs-interactive dispatcher boundary).
spec-bundle/architecture/CONTEXT.md:22:- A typed SPEC schema with citation grammar, RFC 2119
spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
spec-bundle/architecture/CONTEXT.md:28:  enforces the schema per artefact type.
spec-bundle/operations/failures.md:61:**Operator lever**: schema version drift requires a
spec-bundle/quality/requirements.md:105:schema change, hook change).
spec-bundle/quality/requirements.md:118:  boundary contract per
spec-bundle/skills/approved-spec-decomposition/references/cross-validation-lanes.md:36:   `<adopter-policy-repo>/agents/templates/WORKFLOW.body.md` (fleet-baseline reference; bes-fleet-policy-layout-specific) "PR feedback
spec-bundle/schema/SPEC.schema.md:1:# SPEC.schema.md — Shared schema for spec-driven framework
spec-bundle/schema/SPEC.schema.md:8:and the IDEA / TASK templates reference this schema instead of
spec-bundle/schema/SPEC.schema.md:15:document are to be interpreted as described in RFC 2119 and RFC 8174
spec-bundle/schema/SPEC.schema.md:19:but this schema does not prescribe a single universal policy. The
spec-bundle/schema/SPEC.schema.md:23:## 1. Front-matter schema
spec-bundle/schema/SPEC.schema.md:85:  - test -f spec-bundle/templates/SPEC.task.template.md
spec-bundle/schema/SPEC.schema.md:226:SHOULD define one before adopting the schema.
spec-bundle/schema/SPEC.schema.md:365:- Templates: `spec-bundle/templates/SPEC.task.template.md`,
spec-bundle/schema/SPEC.schema.md:366:  `spec-bundle/templates/SPEC.contract.template.md`,
spec-bundle/schema/SPEC.schema.md:367:  `spec-bundle/templates/SPEC.decision.template.md`,
spec-bundle/schema/SPEC.schema.md:368:  `spec-bundle/templates/SPEC.fastpath.template.md`,
spec-bundle/schema/SPEC.schema.md:369:  `spec-bundle/templates/IDEA.template.md`,
spec-bundle/schema/SPEC.schema.md:370:  `spec-bundle/templates/TASK.template.md`.
spec-bundle/behavior/features/lint-citation-grammar.feature:4:  and the schema's citation grammar at
spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.
spec-bundle/behavior/features/lint-citation-grammar.feature:9:    And the schema at spec-bundle/schema/SPEC.schema.md

codex
The branch is clean at `05ad7a5`, with `d6ad848` immediately below it, so I’m checking the live head rather than just the patch notes. Next I’m reading the validator and the changed spec sections around the containment and citation fixes.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba scripts/validate-manifest.sh | sed -n '1,310p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	#!/usr/bin/env bash
     2	# validate-manifest.sh — mechanical gate for spec-bundle/manifest.yaml.
     3	#
     4	# Authority: file://specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
     5	#   §6.1 (manifest schema), §8 (formal schema), §9.1 (validation
     6	#   algorithm pseudocode).
     7	#
     8	# Checks:
     9	# 1. spec-bundle/manifest.yaml exists and parses.
    10	# 2. spec_version matches the schema version in this script
    11	#    (currently 2.0.0).
    12	# 3. conformance_profile is one of {core, extension, real-integration}.
    13	# 4. Every facet listed has its directory and primary file.
    14	# 5. Every directory under spec-bundle/ (except resource dirs) is
    15	#    listed in facets.
    16	# 6. intent.product_name matches the repo identifier.
    17	#
    18	# Exit 0 iff valid; non-zero with diagnostics to stderr.
    19	
    20	set -uo pipefail
    21	
    22	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    23	REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    24	BUNDLE_DIR="$REPO_ROOT/spec-bundle"
    25	MANIFEST="$BUNDLE_DIR/manifest.yaml"
    26	
    27	EXPECTED_SPEC_VERSION="2.1.0"
    28	EXPECTED_PRODUCT_NAME="agentic-ops-framework"
    29	VALID_PROFILES="core extension real-integration"
    30	
    31	# Directories under spec-bundle/ that are resources, not facets.
    32	RESOURCE_DIRS=("schema" "templates" "skills" "conformance")
    33	
    34	errors=()
    35	
    36	err() {
    37	    errors+=("$1")
    38	}
    39	
    40	if [ ! -f "$MANIFEST" ]; then
    41	    printf 'validate-manifest: FAIL — manifest not found at %s\n' "$MANIFEST" >&2
    42	    exit 1
    43	fi
    44	
    45	# Extract scalar fields via grep + sed (no yq dependency).
    46	get_field() {
    47	    local field="$1"
    48	    grep -E "^${field}:" "$MANIFEST" | head -1 | sed -E "s/^${field}:[[:space:]]*//;s/^\"//;s/\"$//"
    49	}
    50	
    51	actual_spec_version="$(get_field 'spec_version')"
    52	actual_conformance="$(get_field 'conformance_profile')"
    53	
    54	# 2. spec_version match.
    55	if [ "$actual_spec_version" != "$EXPECTED_SPEC_VERSION" ]; then
    56	    err "spec_version mismatch: expected $EXPECTED_SPEC_VERSION, got '$actual_spec_version'"
    57	fi
    58	
    59	# 3. conformance_profile valid.
    60	if ! printf '%s\n' $VALID_PROFILES | grep -qFx "$actual_conformance"; then
    61	    err "conformance_profile invalid: got '$actual_conformance'; expected one of {$VALID_PROFILES}"
    62	fi
    63	
    64	# 3b. REQUIRED top-level field presence (codex Round-3 + Round-4).
    65	# Per SPEC §8.1, the following are REQUIRED:
    66	# - v2.0 baseline: spec_version, bundle_version, conformance_profile,
    67	#   generated_on, generator (spec_version + conformance_profile
    68	#   already validated above).
    69	# - v2.1 additions: schema_uri, source_commit.
    70	# Field values MAY be empty string at authoring time per the
    71	# codex Round-2 honest-disclosure pattern; validator checks only
    72	# presence of the key, not non-emptiness. source_tag stays OPTIONAL.
    73	for required_key in bundle_version generated_on generator schema_uri source_commit; do
    74	    if ! grep -qE "^${required_key}:" "$MANIFEST"; then
    75	        err "REQUIRED top-level key missing: $required_key (per SPEC §8.1)"
    76	    fi
    77	done
    78	
    79	# 3c. REQUIRED intent block fields (codex Round-4 finding).
    80	# Per SPEC §8.2, intent MUST have product_name, product_purpose,
    81	# developer_authority, installer_authority. product_name already
    82	# validated above via actual_product_name check; here we verify
    83	# the other three keys are declared inside the intent block.
    84	for required_intent_key in product_purpose developer_authority installer_authority; do
    85	    if ! grep -qE "^[[:space:]]+${required_intent_key}:" "$MANIFEST"; then
    86	        err "REQUIRED intent key missing: $required_intent_key (per SPEC §8.2)"
    87	    fi
    88	done
    89	
    90	# 6. product_name match (search for product_name under intent).
    91	actual_product_name="$(grep -E '^[[:space:]]+product_name:' "$MANIFEST" | head -1 | sed -E 's/^[[:space:]]+product_name:[[:space:]]*//;s/^"//;s/"$//')"
    92	if [ "$actual_product_name" != "$EXPECTED_PRODUCT_NAME" ]; then
    93	    err "intent.product_name mismatch: expected $EXPECTED_PRODUCT_NAME, got '$actual_product_name'"
    94	fi
    95	
    96	# 4 + 5. Parse facets block; extract slugs.
    97	# Match lines indented two spaces under "facets:" that end with ":".
    98	declare -a facet_slugs=()
    99	in_facets=0
   100	in_facets_record=""
   101	while IFS= read -r line; do
   102	    if [[ "$line" =~ ^facets: ]]; then
   103	        in_facets=1
   104	        continue
   105	    fi
   106	    if [ $in_facets -eq 1 ]; then
   107	        # Top-level key (no indent) ends facets block.
   108	        if [[ "$line" =~ ^[a-z_-] ]]; then
   109	            in_facets=0
   110	            continue
   111	        fi
   112	        # Two-space-indented key with no further indent is a facet name.
   113	        if [[ "$line" =~ ^[[:space:]]{2}[a-z_-]+:[[:space:]]*$ ]]; then
   114	            slug="${line//[[:space:]]/}"
   115	            slug="${slug%:}"
   116	            facet_slugs+=("$slug")
   117	        fi
   118	    fi
   119	done < "$MANIFEST"
   120	
   121	if [ ${#facet_slugs[@]} -eq 0 ]; then
   122	    err "facets block empty or unparseable"
   123	fi
   124	
   125	# Build set of fs facet dirs.
   126	declare -a fs_dirs=()
   127	if [ -d "$BUNDLE_DIR" ]; then
   128	    while IFS= read -r dir; do
   129	        base="$(basename "$dir")"
   130	        # Skip resource dirs.
   131	        is_resource=0
   132	        for r in "${RESOURCE_DIRS[@]}"; do
   133	            if [ "$base" = "$r" ]; then
   134	                is_resource=1
   135	                break
   136	            fi
   137	        done
   138	        if [ $is_resource -eq 0 ]; then
   139	            fs_dirs+=("$base")
   140	        fi
   141	    done < <(find "$BUNDLE_DIR" -mindepth 1 -maxdepth 1 -type d | sort)
   142	fi
   143	
   144	# Compare facet slugs vs fs dirs.
   145	for slug in "${facet_slugs[@]}"; do
   146	    found=0
   147	    for d in "${fs_dirs[@]}"; do
   148	        [ "$d" = "$slug" ] && found=1 && break
   149	    done
   150	    if [ $found -eq 0 ]; then
   151	        err "facet '$slug' listed in manifest but no directory at spec-bundle/$slug/"
   152	    fi
   153	done
   154	
   155	for d in "${fs_dirs[@]}"; do
   156	    found=0
   157	    for slug in "${facet_slugs[@]}"; do
   158	        [ "$slug" = "$d" ] && found=1 && break
   159	    done
   160	    if [ $found -eq 0 ]; then
   161	        err "directory spec-bundle/$d/ exists but not listed in manifest facets"
   162	    fi
   163	done
   164	
   165	# Check each facet's primary file exists.
   166	# Parse primary + primary_index + media_type per facet per the v2.1
   167	# schema (codex Round-2 BLOCKER finding closed: previously the script
   168	# accepted directory primaries silently without verifying primary_index
   169	# or media-type-extension conventions; this branch now enforces the
   170	# v2.1 binding).
   171	current_facet=""
   172	declare -A facet_primary
   173	declare -A facet_primary_index
   174	declare -A facet_media_type
   175	while IFS= read -r line; do
   176	    if [[ "$line" =~ ^[[:space:]]{2}([a-z_-]+):[[:space:]]*$ ]]; then
   177	        current_facet="${BASH_REMATCH[1]}"
   178	    elif [[ "$line" =~ ^[[:space:]]{4}primary:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   179	        primary="${BASH_REMATCH[1]}"
   180	        primary="${primary%\"}"
   181	        facet_primary["$current_facet"]="$primary"
   182	    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   183	        pi="${BASH_REMATCH[1]}"
   184	        pi="${pi%\"}"
   185	        facet_primary_index["$current_facet"]="$pi"
   186	    elif [[ "$line" =~ ^[[:space:]]{4}media_type:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
   187	        mt="${BASH_REMATCH[1]}"
   188	        mt="${mt%\"}"
   189	        facet_media_type["$current_facet"]="$mt"
   190	    elif [[ "$line" =~ ^[a-z_-] ]]; then
   191	        current_facet=""
   192	    fi
   193	done < "$MANIFEST"
   194	
   195	# Media-type → file-extension expectations (v2.1 schema §8.3).
   196	media_type_extension() {
   197	    case "$1" in
   198	        text/markdown) printf '.md' ;;
   199	        text/x.gherkin) printf '.feature' ;;
   200	        application/vnd.framework.conformance-suite) printf '' ;;  # any
   201	        *) printf '' ;;
   202	    esac
   203	}
   204	
   205	# Iterate every facet from the manifest, not just those that parsed a
   206	# primary value. This closes the codex Round-3 BLOCKER where facets
   207	# without a parsed primary silently escaped the check branch.
   208	for facet in "${facet_slugs[@]}"; do
   209	    primary="${facet_primary[$facet]:-}"
   210	    if [ -z "$primary" ]; then
   211	        err "facet '$facet' has no primary field in the manifest (per SPEC §8.3 primary is REQUIRED for every facet)"
   212	        continue
   213	    fi
   214	    if [[ "$primary" == */ ]]; then
   215	        # Directory primary — v2.1 requires primary_index.
   216	        if [ ! -d "$BUNDLE_DIR/$primary" ]; then
   217	            err "facet '$facet' primary directory missing: $primary"
   218	            continue
   219	        fi
   220	        pi="${facet_primary_index[$facet]:-}"
   221	        if [ -z "$pi" ]; then
   222	            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
   223	            continue
   224	        fi
   225	        # primary_index MUST be INSIDE the primary directory
   226	        # (codex Round-3 + Round-4: the string-prefix check was
   227	        # fooled by path traversal like "behavior/features/../../
   228	        # architecture/CONTEXT.md" which prefix-matched but
   229	        # resolved outside the primary directory. Semantic
   230	        # containment via canonicalised paths is the fix.)
   231	        if [[ "$pi" != "$primary"* ]]; then
   232	            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment (lexical prefix check)"
   233	            continue
   234	        fi
   235	        # Semantic-containment check: canonicalise both paths and
   236	        # verify the canonicalised primary_index sits inside the
   237	        # canonicalised primary directory. Defeats ../ traversal.
   238	        # Boundary fix (codex R5): use either equality OR "$path/"
   239	        # prefix; bare "$path*" prefix-match would falsely accept
   240	        # sibling dirs like "behavior/features-sibling/" when
   241	        # primary is "behavior/features/".
   242	        canon_primary="$(cd "$BUNDLE_DIR/$primary" 2>/dev/null && pwd)"
   243	        canon_pi_dir="$(cd "$BUNDLE_DIR/$(dirname "$pi")" 2>/dev/null && pwd)"
   244	        if [ -z "$canon_primary" ] || [ -z "$canon_pi_dir" ]; then
   245	            err "facet '$facet' primary or primary_index cannot be canonicalised (primary=$primary, primary_index=$pi)"
   246	            continue
   247	        fi
   248	        if [[ "$canon_pi_dir" != "$canon_primary" && "$canon_pi_dir" != "$canon_primary"/* ]]; then
   249	            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
   250	            continue
   251	        fi
   252	        if [ ! -f "$BUNDLE_DIR/$pi" ]; then
   253	            err "facet '$facet' primary_index file missing: $pi"
   254	        fi
   255	        # Media-type extension conformance (v2.1 §8.3).
   256	        mt="${facet_media_type[$facet]:-}"
   257	        ext="$(media_type_extension "$mt")"
   258	        if [ -n "$ext" ]; then
   259	            n_matching=$(find "$BUNDLE_DIR/$primary" -maxdepth 1 -name "*$ext" -type f 2>/dev/null | wc -l)
   260	            if [ "$n_matching" -eq 0 ]; then
   261	                err "facet '$facet' has media_type '$mt' (expects *$ext) but no matching files in $primary"
   262	            fi
   263	        fi
   264	    else
   265	        # File primary.
   266	        if [ ! -f "$BUNDLE_DIR/$primary" ]; then
   267	            err "facet '$facet' primary file missing: $primary"
   268	        fi
   269	    fi
   270	done
   271	
   272	if [ ${#errors[@]} -gt 0 ]; then
   273	    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
   274	    for e in "${errors[@]}"; do
   275	        printf '  - %s\n' "$e" >&2
   276	    done
   277	    exit 1
   278	fi
   279	
   280	printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
   281	    "$actual_spec_version" "$actual_conformance" "${#facet_slugs[@]}"
   282	exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '150,210p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   150	Top-level keeps the OSS-repo conventional set (LICENSE,
   151	README, CONTRIBUTING, etc.) plus existing scripts/, hooks/,
   152	tests/, specs/, examples/. The new `spec-bundle/`
   153	directory is the actual manifest+catalog artefact — what a
   154	consumer fetches if they want only the methodology
   155	artefact, not the framework's git history.
   156	
   157	## 4. Authority Map
   158	
   159	Active authority for this contract:
   160	
   161	- `decision-authority://owner:2026-05-18` — owner
   162	  directive ("Do what is the rolls royce" + "base this
   163	  all in deep research, not make up bullshit"); binds
   164	  the repack as the methodology's worked-example
   165	  dogfood.
   166	- Parent Decision SPEC
   167	  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
   168	  §7 — names this slice; §9 Locks unlock the repack
   169	  upon Decision approval.
   170	- Sibling Contract SPEC
   171	  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   172	  (status: verified) — the primary-source corpus this
   173	  repack draws methodology primitives from.
   174	- `file://spec-bundle/schema/SPEC.schema.md` — citation
   175	  grammar, RFC 2119 scoping, front-matter schema (path
   176	  corrected from `schema/SPEC.schema.md` per codex R5
   177	  finding; schema lives under `spec-bundle/schema/` in
   178	  the v2.0 layout).
   179	
   180	Active primary-source citations (corpus-grounded):
   181	
   182	- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   183	  §3 — operating-model-as-SPEC; 18-section pattern.
   184	- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
   185	  §3 — manifest+descriptors+layers.
   186	- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   187	  §3 — 12-section architecture-documentation template.
   188	- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
   189	  §3 — four-level architecture hierarchy.
   190	- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
   191	  §3 — Nygard ADR template.
   192	- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
   193	  §3 — customization-affordance prior art.
   194	- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
   195	  §3 — reproducibility primitive.
   196	- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
   197	  §3 — behavioural-acceptance primitive.
   198	- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
   199	  §3 — operating-system-boundary contract.
   200	- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
   201	  §3 — architecture-as-code DSL.
   202	
   203	Stale, superseded, or evidence-only sources:
   204	
   205	- `file://CHANGELOG.md` v1.0 / v1.1 entries — describe
   206	  the current state being repacked, not the target.
   207	
   208	Owner decisions required before implementation:
   209	
   210	- [ ] Confirm `spec-bundle/` is the right top-level

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '620,670p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   620	### 8.3 `facets` block
   621	
   622	A map from facet name to facet record. Recognized facet
   623	names: `architecture`, `deployment`, `behavior`,
   624	`customization`, `decisions`, `quality`, `operations`,
   625	`non-goals`. Each facet record:
   626	
   627	| Field | Type | Required |
   628	|---|---|---|
   629	| `path` | string (relative) | yes |
   630	| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
   631	| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
   632	| `media_type` | string | RECOMMENDED **(v2.1)** | IANA / vendor-prefixed media type for the facet's primary content (e.g. `text/markdown`, `text/x.gherkin`, `application/vnd.framework.conformance-suite`) |
   633	| `digest` | string | RECOMMENDED **(v2.1)** | `algorithm:hex` form per OCI Descriptor convention; lets consumers verify by hash |
   634	| `size` | integer | OPTIONAL **(v2.1)** | Size in bytes |
   635	| `status` | enum | RECOMMENDED **(v2.1)** | `complete` \| `partial` \| `reserved` — lets the manifest advertise scaffold-status explicitly per facet (codex remediation finding 3.5 + 3.6) |
   636	
   637	Additional facets MAY appear; `validate-manifest.sh`
   638	allows extensions but warns.
   639	
   640	**v2.1 facet.primary directory rule (codex remediation
   641	finding 3.6)**: when `primary` is a directory path, the
   642	validator enforces that the directory exists AND that
   643	the file named by `primary_index` exists inside it AND
   644	(if `media_type` is set) at least one file in the
   645	directory matches the media type's file extension
   646	convention (`text/x.gherkin` → `*.feature`,
   647	`text/markdown` → `*.md`, etc.). The pre-v2.1 silent-
   648	allow on directory primaries is replaced with this
   649	explicit branch.
   650	
   651	### 8.4 `resources` block
   652	
   653	| Field | Type |
   654	|---|---|
   655	| `schema` | object with `path` |
   656	| `templates` | object with `path` |
   657	| `skills` | object with `path` |
   658	| `conformance` | object with `path` |
   659	
   660	Resource records MAY also include `media_type`,
   661	`digest`, `size`, `status` fields (same semantics as
   662	§8.3 facet record).
   663	
   664	### 8.5 `signature` block
   665	
   666	At v2.0 launch:
   667	- `status: unsigned` is the default.
   668	- Signed fields (`cosign_signature`, `rekor_inclusion`,
   669	  `signing_identity`) are reserved; populate at v2.x
   670	  when Sigstore tooling is wired in.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/manifest.yaml | sed -n '1,150p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	spec_version: "2.1.0"
     2	bundle_version: "2.0.0"
     3	conformance_profile: "core"
     4	generated_on: "2026-05-19"
     5	generator: "agentic-ops-framework"
     6	# schema_uri pins the schema to a stable form. Populated by release
     7	# tooling with the commit SHA of the SPEC at tag time. Between tags
     8	# (current state) the value points at main as an honest placeholder
     9	# with the explicit "this URL is mutable until release tooling pins"
    10	# convention codified in the v2.0 repack SPEC §6.1 + §8.1.
    11	# Codex Round-2 flagged the unpinned form as untrustworthy; the
    12	# correct remediation is release-tooling integration, not a fake
    13	# pin at authoring time.
    14	schema_uri: "https://github.com/buildepicshit/agentic-ops-framework/blob/main/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md#8-schema-specification"
    15	
    16	# source_commit populated by release tooling at tag time. Empty
    17	# between tags (current state). Release tooling MUST refuse to
    18	# cut a tag with empty source_commit; in-development manifests
    19	# acknowledge this explicitly by leaving the field empty rather
    20	# than fabricating a value.
    21	source_commit: ""
    22	
    23	# source_tag empty between tags. The v2.0.0 tag predates the v2.1
    24	# schema bump and has its own (older) manifest content; pointing
    25	# at v2.0.0 from a v2.1-schema manifest would mislead. The next
    26	# tagged release will be v2.1 with full v2.1 schema population
    27	# including source_commit + source_tag at tag time.
    28	source_tag: ""
    29	
    30	intent:
    31	  product_name: "agentic-ops-framework"
    32	  product_purpose: |
    33	    A framework for operating engineering work with coding
    34	    agents under spec-first discipline: typed IDEA → SPEC
    35	    artefacts with citation grammar, RFC 2119 scoping rules,
    36	    a per-type quality gate, owner-only authority transitions,
    37	    and a hermetic hook test harness. The framework eats its
    38	    own dog food and is offered as honest experience from one
    39	    studio's working internal practice.
    40	  developer_authority:
    41	    - role: "framework maintainer"
    42	      identity: "HasNoBeef <github:HasNoBeef>"
    43	  installer_authority:
    44	    - role: "user-with-agent"
    45	      capabilities_floor: "any-reasonably-capable-coding-agent"
    46	
    47	facets:
    48	  architecture:
    49	    path: "architecture/"
    50	    primary: "architecture/CONTEXT.md"
    51	    media_type: "text/markdown"
    52	    status: "complete"
    53	  deployment:
    54	    path: "deployment/"
    55	    primary: "deployment/install.md"
    56	    media_type: "text/markdown"
    57	    status: "complete"
    58	  behavior:
    59	    path: "behavior/"
    60	    primary: "behavior/features/"
    61	    primary_index: "behavior/features/lint-citation-grammar.feature"
    62	    media_type: "text/x.gherkin"
    63	    status: "partial"            # 2 of N features authored at v2.0
    64	  customization:
    65	    path: "customization/"
    66	    primary: "customization/contract.md"
    67	    media_type: "text/markdown"
    68	    status: "complete"
    69	  decisions:
    70	    path: "decisions/"
    71	    primary: "decisions/INDEX.md"
    72	    media_type: "text/markdown"
    73	    status: "partial"            # INDEX only; per-decision ADRs reserved for v2.x
    74	  quality:
    75	    path: "quality/"
    76	    primary: "quality/requirements.md"
    77	    media_type: "text/markdown"
    78	    status: "complete"
    79	  operations:
    80	    path: "operations/"
    81	    primary: "operations/failures.md"
    82	    media_type: "text/markdown"
    83	    status: "complete"
    84	  non-goals:
    85	    path: "non-goals/"
    86	    primary: "non-goals/INDEX.md"
    87	    media_type: "text/markdown"
    88	    status: "complete"
    89	
    90	resources:
    91	  schema:
    92	    path: "schema/SPEC.schema.md"
    93	    media_type: "text/markdown"
    94	  templates:
    95	    path: "templates/"
    96	    media_type: "text/markdown"
    97	  skills:
    98	    path: "skills/"
    99	    media_type: "text/markdown"
   100	  conformance:
   101	    path: "conformance/"
   102	    media_type: "application/vnd.framework.conformance-suite"
   103	    status: "reserved"           # conformance suite reserved for v2.x
   104	
   105	provenance:
   106	  sbom_format: "cyclonedx"       # per corpus cyclonedx-sbom.md §3
   107	  sbom_ref: ""                   # populated by release tooling
   108	  slsa_level: ""                 # reserved; SLSA attestation lands when toolchain wired
   109	
   110	signature:
   111	  status: "unsigned"
   112	  # When signed: cosign signature + Rekor inclusion proof per
   113	  # https://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/sigstore-cosign.md §3

codex
The containment branch now has both a lexical gate and a canonicalized boundary check using equality-or-slash-prefix, which is the important R5 boundary shape. I’m now running the manifest gate and scanning for remaining path/citation regressions in the target surfaces.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline d6ad848 -- specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
d6ad848 fix(v2 r5): semantic-containment boundary + cross-repo schema cite + bare paths (codex R5 BLOCKERs)
 scripts/validate-manifest.sh                        | 6 +++++-
 specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | 7 +++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash -n scripts/validate-manifest.sh && scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
validate-manifest: PASS — manifest schema 2.1.0, conformance core, 8 facets

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --stat --oneline 05ad7a5 -- specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
05ad7a5 fix(v2 r5 follow-up): spec-bundle/schema bare templates/* paths (advisory in R5; missed in previous commit due to Read-before-Edit requirement)
 spec-bundle/schema/SPEC.schema.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "(''^|[[:space:]('"'"'`])templates/|(''^|[[:space:]('"'"'`])schema/SPEC'"\\.schema\\.md|file://templates/|file://schema/|file://skills/|file://workflow/|file://workpads/\" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/home/linuxbrew/.linuxbrew/bin/bash: command substitution: line 1: syntax error near unexpected token `)'
/home/linuxbrew/.linuxbrew/bin/bash: command substitution: line 1: `])templates/|(^|[[:space:](''
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1039:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1040:  `file://templates/...`, `file://skills/...` paths

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --format=fuller --patch --minimal d6ad848 -- specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
commit d6ad8483cd65dbd2d9919ecb109761a4af9255ee
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 20:36:29 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 20:36:29 2026 -0700

    fix(v2 r5): semantic-containment boundary + cross-repo schema cite + bare paths (codex R5 BLOCKERs)
    
    R5 codex re-review caught:
    
    BLOCKER 1: semantic-containment boundary bug.
    - Previous check `[[ "$canon_pi_dir" != "$canon_primary"* ]]`
      treated "$canon_primary" as a string prefix, so
      "/var/.../behavior/features-sibling" matched "/var/.../
      behavior/features" prefix (features-sibling starts with
      features). False acceptance.
    - Fix: use either equality OR "$canon_primary/" prefix —
      `[[ canon_pi_dir != canon_primary && canon_pi_dir !=
      canon_primary/* ]]`. The trailing slash enforces a
      path-component boundary.
    - Adversarial test: pi="behavior/features/../features-
      sibling/sneaky.feature" lexically passes (starts with
      "behavior/features/") but semantically resolves outside
      primary. With fix: FAILS as expected.
    
    BLOCKER 2: SPEC §174 cited `file://schema/SPEC.schema.md`
    which does not exist post-v2.0 repack; actual location
    is `spec-bundle/schema/SPEC.schema.md`. Cite corrected.
    
    ADVISORY: spec-bundle/schema/SPEC.schema.md L85 + L369
    still referenced bare `templates/SPEC.task.template.md`
    + `templates/IDEA.template.md` + `templates/TASK.template.md`
    paths. Updated to spec-bundle/-rooted.
    
    All five v2 gates green:
    - lint-spec on Slice 2 SPEC -> 0 errors
    - validate-manifest -> PASS 2.1.0 with semantic boundary
      active
    - validate-skill-frontmatter -> clean
    - hook tests -> 33 pass / 0 fail

diff --git a/scripts/validate-manifest.sh b/scripts/validate-manifest.sh
index 3cf3d69..3284b7f 100755
--- a/scripts/validate-manifest.sh
+++ b/scripts/validate-manifest.sh
@@ -235,13 +235,17 @@ for facet in "${facet_slugs[@]}"; do
         # Semantic-containment check: canonicalise both paths and
         # verify the canonicalised primary_index sits inside the
         # canonicalised primary directory. Defeats ../ traversal.
+        # Boundary fix (codex R5): use either equality OR "$path/"
+        # prefix; bare "$path*" prefix-match would falsely accept
+        # sibling dirs like "behavior/features-sibling/" when
+        # primary is "behavior/features/".
         canon_primary="$(cd "$BUNDLE_DIR/$primary" 2>/dev/null && pwd)"
         canon_pi_dir="$(cd "$BUNDLE_DIR/$(dirname "$pi")" 2>/dev/null && pwd)"
         if [ -z "$canon_primary" ] || [ -z "$canon_pi_dir" ]; then
             err "facet '$facet' primary or primary_index cannot be canonicalised (primary=$primary, primary_index=$pi)"
             continue
         fi
-        if [[ "$canon_pi_dir" != "$canon_primary"* ]]; then
+        if [[ "$canon_pi_dir" != "$canon_primary" && "$canon_pi_dir" != "$canon_primary"/* ]]; then
             err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
             continue
         fi
diff --git a/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md b/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
index 0faa0ad..011d440 100644
--- a/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
+++ b/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
@@ -171,8 +171,11 @@ Active authority for this contract:
   `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
   (status: verified) — the primary-source corpus this
   repack draws methodology primitives from.
-- `file://schema/SPEC.schema.md` — citation grammar,
-  RFC 2119 scoping, front-matter schema.
+- `file://spec-bundle/schema/SPEC.schema.md` — citation
+  grammar, RFC 2119 scoping, front-matter schema (path
+  corrected from `schema/SPEC.schema.md` per codex R5
+  finding; schema lives under `spec-bundle/schema/` in
+  the v2.0 layout).
 
 Active primary-source citations (corpus-grounded):
 

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'file://(schema|templates|skills|workflow|workpads)/|"'`(schema/SPEC'"\\.schema\\.md|templates/["'^`]*|skills/[''^`]*|workflow/[''^`]*|workpads/[''^`]*)`|(''^|[[:space:]])templates/[''^[:space:]]+'"' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle scripts/validate-manifest.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:96:- Removing v1.1's `skills/` content (skills are a
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:176:  corrected from `schema/SPEC.schema.md` per codex R5
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:521:| `schema/SPEC.schema.md` | `spec-bundle/schema/SPEC.schema.md` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:522:| `templates/` | `spec-bundle/templates/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:523:| `skills/` | `spec-bundle/skills/` | relocated |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:529:| `workflow/UNIVERSAL.md` | `spec-bundle/operations/workflow-universal.md` | relocated into operations facet |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:530:| `workpads/` | `spec-bundle/templates/workpads/` | relocated under templates |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:572:`templates/`, `skills/`, `workflow/`, `workpads/` will need
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:848:      `skills/`) require any content sanitization
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:886:  symlinks from old paths (`schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:951:- `schema/SPEC.schema.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:953:- `templates/*.template.md` (6 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:955:- `skills/<name>/SKILL.md` (20 skills) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:957:- `skills/<name>/references/*.md` (4 references) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:959:- `workflow/UNIVERSAL.md` →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:961:- `workpads/*.template.md` (3 files) →
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:971:  `spec-bundle/skills/` (was `skills/`)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:975:- `workflow/` (after UNIVERSAL.md moved)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1039:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1040:  `file://templates/...`, `file://skills/...` paths
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:117:  grammar (`schema/SPEC.schema.md` §2).
spec-bundle/skills/spec-driven-development/SKILL.md:101:Specs are typed. Pick the matching template from `templates/`
spec-bundle/skills/spec-driven-development/SKILL.md:178:  the source `skills/<name>/SKILL.md`, the Claude mirror
spec-bundle/skills/spec-authoring/references/reference-architecture.md:57:3. **`skills/<tool>/SKILL.md`** mirroring upstream's
spec-bundle/skills/spec-authoring/references/reference-architecture.md:61:4. **`workpads/<tool>.<ext>.template`** project-level

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git show --format=fuller --patch --minimal 05ad7a5 -- spec-bundle/schema/SPEC.schema.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
commit 05ad7a5e72b9e230cd12115fcff23d4b7991719c
Author:     HasNoBeef <alaindormehl@gmail.com>
AuthorDate: Tue May 19 20:38:14 2026 -0700
Commit:     HasNoBeef <alaindormehl@gmail.com>
CommitDate: Tue May 19 20:38:14 2026 -0700

    fix(v2 r5 follow-up): spec-bundle/schema bare templates/* paths (advisory in R5; missed in previous commit due to Read-before-Edit requirement)

diff --git a/spec-bundle/schema/SPEC.schema.md b/spec-bundle/schema/SPEC.schema.md
index 5cea391..834e120 100644
--- a/spec-bundle/schema/SPEC.schema.md
+++ b/spec-bundle/schema/SPEC.schema.md
@@ -82,7 +82,7 @@ requires_network: false
 requires_secrets: []
 ideated_in: specs/2026-01-15-example-procedure-v1/IDEA.md
 acceptance_commands:
-  - test -f templates/SPEC.task.template.md
+  - test -f spec-bundle/templates/SPEC.task.template.md
   - bash scripts/lint-spec.sh specs/<id>/SPEC.md
 ---
 ```
@@ -366,8 +366,8 @@ The `spec-review` skill MUST NOT set `status: approved`.
   `spec-bundle/templates/SPEC.contract.template.md`,
   `spec-bundle/templates/SPEC.decision.template.md`,
   `spec-bundle/templates/SPEC.fastpath.template.md`,
-  `templates/IDEA.template.md`,
-  `templates/TASK.template.md`.
+  `spec-bundle/templates/IDEA.template.md`,
+  `spec-bundle/templates/TASK.template.md`.
 - Lint script: `scripts/lint-spec.sh`.
 - Skill validator: `scripts/validate-skill-frontmatter.sh`.
 - Procedure-only skills: `spec-bundle/skills/verification/SKILL.md`,

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'find spec-bundle -maxdepth 3 -type f | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/architecture/CONTEXT.md
spec-bundle/architecture/solution-strategy.md
spec-bundle/behavior/features/hook-blocks-ai-attribution.feature
spec-bundle/behavior/features/lint-citation-grammar.feature
spec-bundle/customization/contract.md
spec-bundle/customization/knobs.schema.json
spec-bundle/decisions/INDEX.md
spec-bundle/deployment/install.md
spec-bundle/deployment/requirements.md
spec-bundle/manifest.yaml
spec-bundle/non-goals/INDEX.md
spec-bundle/operations/failures.md
spec-bundle/operations/observability.md
spec-bundle/operations/safety-invariants.md
spec-bundle/operations/workflow-universal.md
spec-bundle/quality/12-factor-overlay.md
spec-bundle/quality/requirements.md
spec-bundle/schema/SPEC.schema.md
spec-bundle/skills/agent-feedback/SKILL.md
spec-bundle/skills/agents-md-improver/SKILL.md
spec-bundle/skills/approved-spec-decomposition/SKILL.md
spec-bundle/skills/autonomous-issue-dispatch/SKILL.md
spec-bundle/skills/caveman/SKILL.md
spec-bundle/skills/code-review/SKILL.md
spec-bundle/skills/cross-repo-informational-channel/SKILL.md
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md
spec-bundle/skills/diagnosis/SKILL.md
spec-bundle/skills/fast-path/SKILL.md
spec-bundle/skills/implementation-execution/SKILL.md
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md
spec-bundle/skills/release-pr/SKILL.md
spec-bundle/skills/repo-orientation/SKILL.md
spec-bundle/skills/spec-authoring/SKILL.md
spec-bundle/skills/spec-driven-development/SKILL.md
spec-bundle/skills/spec-evidence-governance/SKILL.md
spec-bundle/skills/spec-review/SKILL.md
spec-bundle/skills/tdd/SKILL.md
spec-bundle/skills/verification/SKILL.md
spec-bundle/templates/IDEA.template.md
spec-bundle/templates/SPEC.contract.template.md
spec-bundle/templates/SPEC.decision.template.md
spec-bundle/templates/SPEC.fastpath.template.md
spec-bundle/templates/SPEC.task.template.md
spec-bundle/templates/TASK.template.md
spec-bundle/templates/workpads/AGENT_FEEDBACK.template.md
spec-bundle/templates/workpads/AGENT_INBOX.template.md
spec-bundle/templates/workpads/SESSION_JOURNAL.template.md

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-review/SKILL.md | sed -n '1,280p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	---
     2	name: spec-review
     3	description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
     4	---
     5	
     6	# Spec Review
     7	
     8	Authority: `file://examples/reference-procedure-spec`
     9	§10, §11.3, §17.3. Shared schema:
    10	`file://spec-bundle/schema/SPEC.schema.md` §5.
    11	
    12	This skill is **BLOCKING**. A spec MUST NOT advance to
    13	`approved-pending-owner` while any blocking criterion fails. The
    14	skill MUST NOT set `status: approved` — only the owner does that
    15	(SPEC §7.6, schema §1.3).
    16	
    17	Per-type gate criteria live in
    18	[`references/per-type-gates.md`](references/per-type-gates.md). Read
    19	that file as part of running the gate; this SKILL.md governs
    20	selection, mechanics, and output.
    21	
    22	## When to use
    23	
    24	- A primary or sub agent has just authored or revised a `SPEC.md`
    25	  and needs the gate to determine whether the spec is ready for
    26	  owner approval.
    27	- A primary agent has just run `/idea-capture` and needs the IDEA
    28	  gate (§10.1) to determine whether the IDEA can transition from
    29	  `draft` to `ready-for-spec`.
    30	- Any review-time event re-opens a previously-approved spec for
    31	  owner reconsideration (rare; typically owner-driven via
    32	  `status: needs-revision`).
    33	
    34	Companion workflow: `agents/workflows/review-spec.md`
    35	(`/review-spec`).
    36	
    37	## Inputs
    38	
    39	- `spec_path` — repo-relative path to the artefact under review.
    40	  MUST be either `<spec-folder>/SPEC.md` or
    41	  `<spec-folder>/IDEA.md`.
    42	- Front-matter is parsed first. The skill REQUIRES:
    43	  - `type` (`task` | `contract` | `decision`) for SPEC.md, OR
    44	  - `implies_spec_type` (`task` | `contract` | `decision`) for
    45	    IDEA.md.
    46	  If front-matter is missing or malformed, the run aborts with a
    47	  blocking failure of `criterion: front-matter-parse`.
    48	
    49	## Gate selection
    50	
    51	Per SPEC §10 and SPEC.schema §5:
    52	
    53	| Artefact | Gate | Bar | Lint requirement |
    54	|---|---|---|---|
    55	| `IDEA.md` | §10.1 IDEA gate | n/a | RECOMMENDED |
    56	| `SPEC.md` with `type: task` | §10.2 Task gate | `b` (verifiable) | RECOMMENDED |
    57	| `SPEC.md` with `type: contract` | §10.3 Contract gate | `c` (the autonomous-dispatch runner-grade) | **REQUIRED** |
    58	| `SPEC.md` with `type: decision` | §10.4 Decision gate | `b-plus-candidates` | RECOMMENDED |
    59	
    60	Detailed per-type criteria, including fleet-principle additional
    61	checks: see `references/per-type-gates.md`.
    62	
    63	## Lint invocation
    64	
    65	For `type: contract`, the skill MUST run:
    66	
    67	```
    68	bash scripts/lint-spec.sh <spec_path>
    69	```
    70	
    71	Exit-code mapping:
    72	
    73	- `0` — pass; no lint failure recorded.
    74	- `1` — blocking failure; record one entry per stderr diagnostic
    75	  with `severity: blocking`.
    76	- `2` — advisory only; record entries with `severity: advisory`.
    77	  Does not block transition to `approved-pending-owner`.
    78	
    79	For `type: task`, `type: decision`, and IDEA.md, lint is
    80	RECOMMENDED. The skill SHOULD run it and record advisory entries;
    81	it MUST NOT treat lint exit 1 as blocking for these types unless
    82	the gate otherwise requires the underlying check.
    83	
    84	## Contract capture-after defer-shorthand check
    85	
    86	Per the ceremony-weight Decision (`judgment://agent-synthesis`),
    87	Contract SPECs landing at `status: verified` via the
    88	capture-after exception MAY use a one-paragraph defer-shorthand
    89	in §1 Problem Statement and §13 Test and Validation Matrix. The
    90	shorthand pattern: a single paragraph whose only substantive
    91	content is a `file://specs/<id>/IDEA.md` cite pointing at the
    92	producing IDEA's §1 / §13.
    93	
    94	The Contract per-type gate MUST add the following BLOCKING
    95	check when the SPEC under review has `status: verified` AND
    96	either §1 or §13 body appears to be defer-shorthand
    97	(≤ 3 non-blank non-comment lines, all citation-prefixed,
    98	including a `file://specs/<id>/IDEA.md` cite):
    99	
   100	1. Resolve the cited IDEA section by path.
   101	2. Read its body.
   102	3. REQUIRED: the cited IDEA section MUST exist and contain at
   103	   least 5 non-blank non-comment lines of substantive content
   104	   (the defer must resolve to real substance, not to another
   105	   defer).
   106	4. On failure: emit a blocking diagnostic
   107	   `capture-after-defer-shorthand: cited IDEA §<n> does not
   108	   resolve to substantive content`. Status: `needs-revision`.
   109	
   110	For Contracts at any other status (`draft`, `approved`,
   111	`in-execution`), defer-shorthand in §1 or §13 MUST be rejected
   112	with: `capture-after-defer-shorthand: not permitted at status:
   113	<status>; defer-shorthand requires status: verified`. Status:
   114	`needs-revision`.
   115	
   116	This check is BLOCKING per
   117	`judgment://agent-synthesis` §7
   118	"the Contract per-type gate verifying that any capture-after
   119	defer-shorthand resolves to a cited IDEA section".
   120	
   121	## Quality Gate Result
   122	
   123	Output is a structured record per SPEC §6.1.4:
   124	
   125	```yaml
   126	spec_path: specs/<id>/SPEC.md         # or IDEA.md
   127	type: contract                         # task | contract | decision
   128	bar: c                                 # b | c | b-plus-candidates
   129	pass: false
   130	failures:
   131	  - criterion: required-section-missing
   132	    evidence: file://specs/<id>/SPEC.md missing "## 10. Failure Model"
   133	    severity: blocking
   134	  - criterion: lint
   135	    evidence: cmd://bash scripts/lint-spec.sh specs/<id>/SPEC.md (exit 1, "uncited claim at SPEC.md:142")
   136	    severity: blocking
   137	  - criterion: rfc2119-uppercase
   138	    evidence: file://specs/<id>/SPEC.md#L88 "must" lowercase in normative section
   139	    severity: advisory
   140	```
   141	
   142	Schema:
   143	
   144	- `spec_path` (string, REQUIRED).
   145	- `type` (enum, REQUIRED) — `task` | `contract` | `decision`. For
   146	  IDEA.md, use the IDEA's `implies_spec_type`.
   147	- `bar` (enum, REQUIRED) — `b` | `c` | `b-plus-candidates`. For
   148	  IDEA.md, use literal string `idea`.
   149	- `pass` (boolean, REQUIRED) — `true` iff `failures` contains zero
   150	  entries with `severity: blocking`.
   151	- `failures` (list, REQUIRED, MAY be empty):
   152	  - `criterion` (string, REQUIRED) — short slug (e.g.
   153	    `required-section-missing`, `uncited-claim`, `lint`,
   154	    `acceptance-criteria-orphan`,
   155	    `decision-fewer-than-2-candidates`).
   156	  - `evidence` (string, REQUIRED) — file/line citation per
   157	    SPEC.schema §2 citation grammar.
   158	  - `severity` (enum, REQUIRED) — `blocking` | `advisory`.
   159	
   160	Citation discipline applies to the result itself. Every `evidence`
   161	field MUST use a citation prefix (`file://`, `cmd://`, etc.) so
   162	the result is itself contract-grade.
   163	
   164	## Status transitions
   165	
   166	Pre-condition: `<spec_path>` exists with parseable front-matter and
   167	a status appropriate for review (typically `draft` or
   168	`needs-revision`).
   169	
   170	Algorithm (per SPEC §17.3):
   171	
   172	```
   173	let result = run_per_type_gate(spec_path)
   174	if type == "contract":
   175	  let lint_exit = run_lint(spec_path)
   176	  if lint_exit == 1: append failure(criterion="lint", severity="blocking", evidence=...)
   177	  if lint_exit == 2: append failure(criterion="lint", severity="advisory", evidence=...)
   178	let blocking = any(f.severity == "blocking" for f in result.failures)
   179	if blocking:
   180	  set front-matter status: needs-revision
   181	  result.pass = false
   182	else:
   183	  set front-matter status: approved-pending-owner   # only for SPEC.md
   184	  result.pass = true
   185	emit result
   186	```
   187	
   188	Concrete transitions:
   189	
   190	| Artefact | Status before | Blocking failure? | Status after |
   191	|---|---|---|---|
   192	| `SPEC.md` | `draft` | yes | `needs-revision` |
   193	| `SPEC.md` | `draft` | no | `approved-pending-owner` |
   194	| `SPEC.md` | `needs-revision` | yes | `needs-revision` (idempotent re-run) |
   195	| `SPEC.md` | `needs-revision` | no | `approved-pending-owner` |
   196	| `IDEA.md` | `draft` | yes | `draft` (no transition; surface failures) |
   197	| `IDEA.md` | `draft` | no | `ready-for-spec` |
   198	| `IDEA.md` | `owner-blocking` | (any) | `owner-blocking` (no transition; only owner moves out) |
   199	
   200	The skill MUST NOT set `status: approved` on a SPEC.md under any
   201	condition. The owner sets `approved` after reviewing the Quality
   202	Gate Result and the SPEC (SPEC §7.6).
   203	
   204	If front-matter status is already a terminal or post-approval
   205	value (`approved`, `in-execution`, `verified`, `closed`), the skill
   206	MUST refuse to run with a blocking failure of
   207	`criterion: status-not-reviewable` and MUST NOT mutate the
   208	artefact.
   209	
   210	## Hard rules
   211	
   212	- The skill MUST NOT set `status: approved`. Only the owner does.
   213	- The skill MUST NOT silently revise spec content. It MAY only
   214	  mutate front-matter `status` per the table above.
   215	- The skill MUST surface every blocking failure with a file/line
   216	  citation. "Vague" findings without citation are themselves a
   217	  quality failure of the review.
   218	- The skill MUST NOT allow implementation scope to hide inside
   219	  Open Questions. Open Questions that imply substantive design
   220	  choices MUST be flagged with
   221	  `criterion: scope-hidden-in-open-question`, `severity: blocking`.
   222	- The skill MUST NOT review for style before correctness and
   223	  safety. Editorial polish is advisory at most.
   224	- Lint exit 1 on a Contract SPEC is blocking even if the gate
   225	  otherwise passes. Lint exit 2 is advisory.
   226	- **Cross-family review.** When the SPEC was authored primarily by
   227	  a model in one family (the agent runner / Claude), the spec-review pass
   228	  SHOULD be performed by a model from a different family. Same-
   229	  family review is structurally weaker. If the only available
   230	  reviewer is from the same family as the author, record this in
   231	  the Quality Gate Result `evidence` field as
   232	  `same-family-review: <model>` and surface it as an `advisory`
   233	  finding. See `file://your model-routing policy` "Routing Matrix"
   234	  row for Spec review and
   235	  `judgment://agent-synthesis`
   236	  §7.3.
   237	
   238	## Output to caller
   239	
   240	After running the gate the skill MUST emit, in this order:
   241	
   242	1. The Quality Gate Result block (YAML, schema above).
   243	2. A short prose summary leading with blocking findings, ordered
   244	   by severity, each with a file/line citation.
   245	3. A recommendation line, one of:
   246	   - `approve-pending-owner` (status set to
   247	     `approved-pending-owner`; owner now reviews).
   248	   - `block-needs-revision` (status set to `needs-revision`;
   249	     author addresses failures and re-runs review).
   250	   - `idea-ready-for-spec` (IDEA-mode pass; status set to
   251	     `ready-for-spec`).
   252	   - `idea-blocked` (IDEA-mode failure; status unchanged at
   253	     `draft` or `owner-blocking`).
   254	
   255	## Cross-references
   256	
   257	- Authority:
   258	  `file://examples/reference-procedure-spec`
   259	  §10, §11.3, §17.3.
   260	- Per-type criteria:
   261	  `file://spec-bundle/skills/spec-review/references/per-type-gates.md`.
   262	- Shared schema: `file://spec-bundle/schema/SPEC.schema.md` §5
   263	  (handoff), §1.3 (state machine), §2 (citation grammar), §3
   264	  (RFC 2119).
   265	- Companion workflow: `<adopter-policy-repo>/agents/workflows/review-spec.md` (fleet-baseline reference; bes-fleet-policy-layout-specific).
   266	- Lint script: `file://scripts/lint-spec.sh` (if absent at
   267	  the time of invocation, a Contract SPEC review MUST report
   268	  `criterion: lint-unavailable`, `severity: blocking`).
   269	- Authoring side: `file://spec-bundle/skills/spec-authoring/SKILL.md`.
   270	- Lifecycle skill:
   271	  `file://spec-bundle/skills/spec-driven-development/SKILL.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash tests/run-hook-tests.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 127 in 0ms:
bash: tests/run-hook-tests.sh: No such file or directory

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/validate-skill-frontmatter.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
skill frontmatter: clean

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 589ms:
== lint-spec.sh summary ==
target:                specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
artefact / type:       spec / contract
sections (top-level):  20
citation-prefix hits:  66
lowercase 2119 hits:   1 (advisory only)
errors:                0
warnings:              0

codex
The required contract lint and manifest gate both pass; skill frontmatter is also clean. The hook test command named in the commit message is not `tests/run-hook-tests.sh` in this checkout, so I’m locating the actual harness before deciding whether that affects this review.
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg --files tests scripts hooks .github | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
.github/workflows/ci.yml
hooks/block-ai-attribution.sh
hooks/block-edit-on-main.sh
hooks/block-git-add-all.sh
hooks/block-push-to-main.sh
hooks/block-verify-bypass.sh
hooks/session-start-context.sh
hooks/verify-reminder.sh
scripts/audit-entry-docs.sh
scripts/audit-fleet-compliance.sh
scripts/fleet-commands.example.txt
scripts/fleet-files.example.txt
scripts/fleet-hook-fixtures.example.txt
scripts/fleet-hooks.example.txt
scripts/fleet-internal-repos.example.txt
scripts/fleet-known-repos.txt
scripts/fleet-local-only-repos.example.txt
scripts/fleet-oss-gitignore.example.txt
scripts/fleet-oss-repos.example.txt
scripts/fleet-skills.example.txt
scripts/fleet-sync.sh
scripts/lint-spec.sh
scripts/preflight-config.example.json
scripts/preflight.mjs
scripts/send-fleet-message.sh
scripts/validate-manifest.sh
scripts/validate-skill-frontmatter.sh
tests/hooks/fixtures/msg-clean.txt
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/run-tests.sh

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git ls-tree -r --name-only HEAD tests scripts hooks .github | sort' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
.github/workflows/ci.yml
hooks/block-ai-attribution.sh
hooks/block-edit-on-main.sh
hooks/block-git-add-all.sh
hooks/block-push-to-main.sh
hooks/block-verify-bypass.sh
hooks/session-start-context.sh
hooks/verify-reminder.sh
scripts/audit-entry-docs.sh
scripts/audit-fleet-compliance.sh
scripts/fleet-commands.example.txt
scripts/fleet-files.example.txt
scripts/fleet-hook-fixtures.example.txt
scripts/fleet-hooks.example.txt
scripts/fleet-internal-repos.example.txt
scripts/fleet-known-repos.txt
scripts/fleet-local-only-repos.example.txt
scripts/fleet-oss-gitignore.example.txt
scripts/fleet-oss-repos.example.txt
scripts/fleet-skills.example.txt
scripts/fleet-sync.sh
scripts/lint-spec.sh
scripts/preflight-config.example.json
scripts/preflight.mjs
scripts/send-fleet-message.sh
scripts/validate-manifest.sh
scripts/validate-skill-frontmatter.sh
tests/hooks/fixtures/msg-clean.txt
tests/hooks/fixtures/msg-with-coauthor.txt
tests/hooks/run-tests.sh

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "run-hook|hook test|test-hooks|33|hermetic|validate-manifest|lint-spec|validate-skill" tests scripts .github OPERATING_MODEL.md spec-bundle specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:12:  - bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:14:  - bash scripts/validate-manifest.sh
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:81:- Author a `scripts/validate-manifest.sh` mechanical
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:140:├── scripts/                           # lint-spec, validate-manifest, etc.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:142:├── tests/                             # hook tests + future facet tests
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:359:`scripts/validate-manifest.sh`):
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:535:| (new) `scripts/validate-manifest.sh` | as named | new mechanical gate |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:542:2. Author `scripts/validate-manifest.sh` per §6.1
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:557:6. Update `scripts/lint-spec.sh` to recognize the new
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:560:   `validate-manifest` as a CI job.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:565:10. Tag `v2.0.0` once `validate-manifest` + lint +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:637:Additional facets MAY appear; `validate-manifest.sh`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:685:### 9.1 validate-manifest (pseudocode)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:741:| `manifest-parse-fail` | YAML invalid | Author fixes syntax; re-run `validate-manifest.sh` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:750:  manifest is read-only data; `validate-manifest.sh` is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:764:- `validate-manifest.sh` prints diagnostic lines to
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:766:- CI job `validate-manifest` runs on every push +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:777:| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` exits 0 |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:779:| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:781:| AC-5 | `cmd://bash tests/hooks/run-tests.sh` reports 33 pass / 0 fail (no regressions from repack) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:782:| AC-6 | `cmd://bash scripts/lint-spec.sh examples/*/IDEA.md examples/*/SPEC.md` lint clean on every example (no regressions) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:791:- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:792:      `cmd://bash scripts/validate-manifest.sh` exits 0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:806:      `validate-manifest` job; all CI jobs pass on the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:818:- [x] AC-3: validate-manifest exits 0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:820:- [x] AC-5: hook tests 33/33 pass (no regression)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:915:  `lint-spec.sh` invocation; was 50 at original
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:920:- validate-manifest: PASS at v2.1.0 schema with
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:932:- `scripts/validate-manifest.sh` (mechanical completeness
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:950:**Renamed** (33 files via `git mv`; history preserved):
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:965:- `.github/workflows/ci.yml` — adds `validate-manifest`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:970:- `scripts/validate-skill-frontmatter.sh` — scans
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:989:- `cmd://chmod +x scripts/validate-manifest.sh`.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:990:- `cmd://bash scripts/lint-spec.sh
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:995:- `cmd://bash scripts/validate-manifest.sh` — exit 0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:999:- `cmd://bash scripts/validate-skill-frontmatter.sh` —
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1001:- `cmd://bash tests/hooks/run-tests.sh` — 33 pass /
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1004:- Per-example lint: 7 examples × `bash scripts/lint-spec.sh
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1017:pass (lint-spec, validate-skills, test-hooks,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1018:validate-manifest, preflight-self-check).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1068:  all functionality (33/33 hook tests; 7/7 example
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1069:  lint; CI green) while reorganizing 33 existing files
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1094:  All 33 renamed files retained git history (the
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1103:- **`validate-manifest.sh` was the right scaffolding
OPERATING_MODEL.md:25:   (`lint-spec.sh`) and structured review against bar criteria.
spec-bundle/manifest.yaml:37:    and a hermetic hook test harness. The framework eats its
scripts/validate-manifest.sh:2:# validate-manifest.sh — mechanical gate for spec-bundle/manifest.yaml.
scripts/validate-manifest.sh:41:    printf 'validate-manifest: FAIL — manifest not found at %s\n' "$MANIFEST" >&2
scripts/validate-manifest.sh:273:    printf 'validate-manifest: %d issue(s) found:\n' "${#errors[@]}" >&2
scripts/validate-manifest.sh:280:printf 'validate-manifest: PASS — manifest schema %s, conformance %s, %d facets\n' \
.github/workflows/ci.yml:10:  lint-spec:
.github/workflows/ci.yml:17:        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/IDEA.md
.github/workflows/ci.yml:20:        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/SPEC.md
.github/workflows/ci.yml:23:        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/IDEA.md
.github/workflows/ci.yml:26:        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/SPEC.md
.github/workflows/ci.yml:29:        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/IDEA.md
.github/workflows/ci.yml:32:        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/SPEC.md
.github/workflows/ci.yml:35:        run: bash scripts/lint-spec.sh examples/fastpath-fix-readme-typo/SPEC.md
.github/workflows/ci.yml:37:  validate-skills:
.github/workflows/ci.yml:42:      - run: bash scripts/validate-skill-frontmatter.sh
.github/workflows/ci.yml:44:  test-hooks:
.github/workflows/ci.yml:45:    name: hook test harness
.github/workflows/ci.yml:51:      - name: Run hook tests
.github/workflows/ci.yml:54:  validate-manifest:
.github/workflows/ci.yml:60:        run: bash scripts/validate-manifest.sh
spec-bundle/operations/safety-invariants.md:41:  `scripts/lint-spec.sh`.
spec-bundle/operations/safety-invariants.md:42:- **SI-8**: Contract SPECs MUST pass `lint-spec.sh`
spec-bundle/operations/safety-invariants.md:44:  CI's `lint-spec` job.
spec-bundle/operations/observability.md:14:| `scripts/lint-spec.sh <target>` | One-line summary block on stdout (target, type, citation count, errors, warnings) + per-error file:line on stderr |
spec-bundle/operations/observability.md:15:| `scripts/validate-skill-frontmatter.sh` | One-line PASS/FAIL summary on stdout + per-failure detail on stderr |
spec-bundle/operations/observability.md:16:| `scripts/validate-manifest.sh` | One-line PASS summary OR enumerated issue list on stderr |
spec-bundle/operations/failures.md:13:causes `scripts/lint-spec.sh` to exit non-zero.
spec-bundle/operations/failures.md:15:**Detection**: CI's `lint-spec` job; local `bash
spec-bundle/operations/failures.md:16:scripts/lint-spec.sh <target>` invocation.
spec-bundle/operations/failures.md:32:**Detection**: CI's `test-hooks` job; local invocation.
spec-bundle/operations/failures.md:47:**Trigger**: `bash scripts/validate-manifest.sh` exits
spec-bundle/operations/failures.md:50:**Detection**: CI's `validate-manifest` job; local
spec-bundle/operations/failures.md:59:3. Re-run validate-manifest until PASS.
spec-bundle/operations/failures.md:69:**Detection**: lint-spec.sh does not validate file paths
spec-bundle/skills/cross-repo-policy-enforcement/SKILL.md:135:- The compliance check shell block MUST be hermetic. No
spec-bundle/quality/12-factor-overlay.md:20:| IX | Disposability | The hook test harness's hermetic sandbox pattern (`../../tests/hooks/run-tests.sh`) exemplifies disposability for tests; adopters apply the same posture to their own test harnesses |
spec-bundle/customization/contract.md:95:Default: lint-spec + validate-skill-frontmatter +
spec-bundle/customization/contract.md:96:hook-test-harness + validate-manifest (the four jobs in
spec-bundle/customization/contract.md:99:Constraint: lint-spec MUST run on every push; the rest
spec-bundle/skills/approved-spec-decomposition/SKILL.md:107:7. Run `cmd://bash agents/scripts/lint-spec.sh
spec-bundle/quality/requirements.md:26:**Response measure**: `scripts/lint-spec.sh` exits 0 on
spec-bundle/quality/requirements.md:39:**Response**: four CI jobs run automatically (lint-spec,
spec-bundle/quality/requirements.md:40:validate-skill-frontmatter, test-hooks, validate-manifest)
spec-bundle/quality/requirements.md:50:**Scenario**: hook tests run in CI on a fresh
spec-bundle/quality/requirements.md:55:**Response**: every hook test creates an ephemeral git
spec-bundle/quality/requirements.md:59:**Response measure**: 33 pass / 0 fail consistently
spec-bundle/quality/requirements.md:109:**Response**: existing examples + hook tests + lint
spec-bundle/quality/requirements.md:112:**Response measure**: zero example-lint regressions; 33
spec-bundle/quality/requirements.md:113:hook tests still pass.
spec-bundle/customization/knobs.schema.json:89:          "lint-spec",
spec-bundle/customization/knobs.schema.json:90:          "validate-skill-frontmatter",
spec-bundle/customization/knobs.schema.json:91:          "test-hooks",
spec-bundle/customization/knobs.schema.json:92:          "validate-manifest",
spec-bundle/customization/knobs.schema.json:96:      "contains": { "const": "lint-spec" },
spec-bundle/customization/knobs.schema.json:98:        "lint-spec",
spec-bundle/customization/knobs.schema.json:99:        "validate-skill-frontmatter",
spec-bundle/customization/knobs.schema.json:100:        "test-hooks",
spec-bundle/customization/knobs.schema.json:101:        "validate-manifest"
spec-bundle/skills/spec-driven-development/SKILL.md:40:   candidate-comparison for Decision), runs `lint-spec.sh` (REQUIRED
spec-bundle/templates/SPEC.fastpath.template.md:68:works. Subset of the parent repo's gates. lint-spec lint of this
spec-bundle/templates/SPEC.fastpath.template.md:91:- Lint-pass under `scripts/lint-spec.sh` fastpath mode.
spec-bundle/templates/SPEC.contract.template.md:25:Quality gate: bar (c) "protocol-grade", with REQUIRED `lint-spec.sh`
spec-bundle/skills/spec-review/SKILL.md:3:description: "Use as the BLOCKING per-type quality gate after authoring or revising an IDEA.md or SPEC.md. Selects Task/Contract/Decision bar from front-matter, runs lint-spec.sh (REQUIRED for Contract), emits a Quality Gate Result, transitions status to needs-revision or approved-pending-owner. Never sets status: approved (owner-only). Do not use to author specs — use spec-authoring."
spec-bundle/skills/spec-review/SKILL.md:68:bash scripts/lint-spec.sh <spec_path>
spec-bundle/skills/spec-review/SKILL.md:135:    evidence: cmd://bash scripts/lint-spec.sh specs/<id>/SPEC.md (exit 1, "uncited claim at SPEC.md:142")
spec-bundle/skills/spec-review/SKILL.md:266:- Lint script: `file://scripts/lint-spec.sh` (if absent at
spec-bundle/behavior/features/lint-citation-grammar.feature:8:    Given a repo with the framework's scripts/lint-spec.sh
spec-bundle/behavior/features/lint-citation-grammar.feature:14:    When the author runs `bash scripts/lint-spec.sh <path>`
spec-bundle/behavior/features/lint-citation-grammar.feature:20:    When the author runs `bash scripts/lint-spec.sh <path>`
spec-bundle/behavior/features/lint-citation-grammar.feature:26:    When the author runs `bash scripts/lint-spec.sh <path>`
spec-bundle/behavior/features/lint-citation-grammar.feature:31:    When the author runs `bash scripts/lint-spec.sh <path>`
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:49:- The artefacts pass the normal lint and gate (lint-spec.sh exit
spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md:50:  0; skill frontmatter clean; entry-doc audit PASS; hook tests
spec-bundle/deployment/requirements.md:14:| `bash` | 4.0+ | All scripts (lint, hooks, hook tests, validate-manifest) |
spec-bundle/skills/fast-path/SKILL.md:45:   would otherwise have been; lint-spec on any SPEC files, hook
spec-bundle/skills/fast-path/SKILL.md:81:  `file://scripts/lint-spec.sh` fastpath mode.
spec-bundle/deployment/install.md:28:cp scripts/lint-spec.sh      "$TARGET/scripts/"
spec-bundle/deployment/install.md:29:cp scripts/validate-skill-frontmatter.sh "$TARGET/scripts/"
spec-bundle/deployment/install.md:68:bash scripts/lint-spec.sh <path-to-your-first-IDEA-or-SPEC>
spec-bundle/deployment/install.md:69:bash scripts/validate-skill-frontmatter.sh
scripts/fleet-files.example.txt:24:# scripts/lint-spec.sh
scripts/fleet-files.example.txt:25:# scripts/validate-skill-frontmatter.sh
spec-bundle/architecture/solution-strategy.md:44:- **Bash** for lint, hooks, hook tests, validate-manifest
spec-bundle/architecture/solution-strategy.md:67:   (lint, hook test, manifest validation, CI) is a
spec-bundle/architecture/solution-strategy.md:69:3. **Hermetic test surface** — hook tests run from
scripts/fleet-hook-fixtures.example.txt:3:# line. Used by the hook test harness (see scripts/run-tests.sh if you
scripts/fleet-hook-fixtures.example.txt:6:# Default: empty. Framework v0.1 ships no hook test harness; v1.0 will
spec-bundle/architecture/CONTEXT.md:27:- A lint script (`file://../../scripts/lint-spec.sh`) that
spec-bundle/architecture/CONTEXT.md:34:- A hermetic 33-case hook test harness
spec-bundle/architecture/CONTEXT.md:39:  that runs lint + skill-frontmatter + hook tests +
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:3:description: "Use to spin up an isolated parallel worktree for a TASK.md slice or a cross-family review of an in-flight PR, then bind the framework's lifecycle gates (lint-spec, acceptance_commands, spec-evidence) to the worktree's lifecycle. Pattern is git-worktree-native; pluggable wrapper (e.g., the `wt` CLI from worktrunk.dev) is RECOMMENDED but not required. Owner-led parallel mode only — autonomous dispatch uses per-issue workspaces from its own runner."
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:72:  `lint-spec.sh` on any changed SPEC or IDEA artefact.
spec-bundle/skills/owner-led-parallel-worktrees/SKILL.md:106:5. **Pre-commit gates fire on each commit**: lint-spec runs
scripts/validate-skill-frontmatter.sh:2:# validate-skill-frontmatter.sh — sanity-check SKILL.md YAML frontmatter
scripts/lint-spec.sh:2:# lint-spec.sh — v1 lint for IDEA.md and SPEC.md artefacts.
scripts/lint-spec.sh:602:printf '== lint-spec.sh summary ==\n'
scripts/lint-spec.sh:616:#   lint-spec.sh good-task.md           -> exit 0
scripts/lint-spec.sh:617:#   lint-spec.sh bad-uncited.md         -> exit 1
scripts/lint-spec.sh:618:#   lint-spec.sh bad-missing-section.md -> exit 1
spec-bundle/skills/spec-review/references/per-type-gates.md:69:- `scripts/lint-spec.sh` exits 0 on this SPEC (exit 2 is
spec-bundle/skills/autonomous-issue-dispatch/SKILL.md:107:  pre-commit: <path>    # framework's lint-spec gate
spec-bundle/skills/autonomous-issue-dispatch/SKILL.md:133:   lifecycle points. The framework's lint-spec gate MUST fire
spec-bundle/skills/spec-authoring/SKILL.md:220:3. `spec-review` runs `lint-spec.sh` (REQUIRED for Contract,
spec-bundle/schema/SPEC.schema.md:86:  - bash scripts/lint-spec.sh specs/<id>/SPEC.md
spec-bundle/schema/SPEC.schema.md:352:3. Runs `lint-spec.sh` on the artefact (REQUIRED for `contract`,
spec-bundle/schema/SPEC.schema.md:371:- Lint script: `scripts/lint-spec.sh`.
spec-bundle/schema/SPEC.schema.md:372:- Skill validator: `scripts/validate-skill-frontmatter.sh`.
spec-bundle/skills/spec-authoring/references/reference-architecture.md:63:   (lint-spec on staged artefacts, parent-SPEC acceptance on
scripts/fleet-sync.sh:36:#   fleet-hook-fixtures.txt  — hook test fixtures
scripts/fleet-sync.sh:94:mkdir -p "$TARGET/.agents/skills" "$TARGET/.agents/workflows" "$TARGET/.agents/scripts/lint-spec-fixtures" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/good-internal" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/bad-no-agents-md" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/bad-claude-md-no-import" "$TARGET/.agents/scripts/audit-entry-docs-fixtures/edge-leading-whitespace-import" "$TARGET/.agents/specs" "$TARGET/.agents/mcp" "$TARGET/.agents/templates" "$TARGET/.agents/githooks" "$TARGET/.agents/fleet-directives" "$TARGET/.githooks"

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git diff --check' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba .github/workflows/ci.yml | sed -n '1,90p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	name: CI
     2	
     3	on:
     4	  push:
     5	    branches: [main]
     6	  pull_request:
     7	    branches: [main]
     8	
     9	jobs:
    10	  lint-spec:
    11	    name: lint worked examples
    12	    runs-on: ubuntu-latest
    13	    steps:
    14	      - uses: actions/checkout@v4
    15	
    16	      - name: Lint Task example IDEA
    17	        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/IDEA.md
    18	
    19	      - name: Lint Task example SPEC
    20	        run: bash scripts/lint-spec.sh examples/task-add-structured-logging/SPEC.md
    21	
    22	      - name: Lint Contract example IDEA
    23	        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/IDEA.md
    24	
    25	      - name: Lint Contract example SPEC
    26	        run: bash scripts/lint-spec.sh examples/contract-webhook-signing/SPEC.md
    27	
    28	      - name: Lint Decision example IDEA
    29	        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/IDEA.md
    30	
    31	      - name: Lint Decision example SPEC
    32	        run: bash scripts/lint-spec.sh examples/decision-conventional-commits/SPEC.md
    33	
    34	      - name: Lint Fastpath example SPEC
    35	        run: bash scripts/lint-spec.sh examples/fastpath-fix-readme-typo/SPEC.md
    36	
    37	  validate-skills:
    38	    name: validate skill frontmatter
    39	    runs-on: ubuntu-latest
    40	    steps:
    41	      - uses: actions/checkout@v4
    42	      - run: bash scripts/validate-skill-frontmatter.sh
    43	
    44	  test-hooks:
    45	    name: hook test harness
    46	    runs-on: ubuntu-latest
    47	    steps:
    48	      - uses: actions/checkout@v4
    49	      - name: Install jq
    50	        run: sudo apt-get install -y jq
    51	      - name: Run hook tests
    52	        run: bash tests/hooks/run-tests.sh
    53	
    54	  validate-manifest:
    55	    name: validate spec-bundle manifest (v2.0)
    56	    runs-on: ubuntu-latest
    57	    steps:
    58	      - uses: actions/checkout@v4
    59	      - name: Validate manifest schema + facet bijection
    60	        run: bash scripts/validate-manifest.sh
    61	
    62	  preflight-self-check:
    63	    name: preflight runs clean on the framework
    64	    runs-on: ubuntu-latest
    65	    steps:
    66	      - uses: actions/checkout@v4
    67	      - name: Verify preflight.mjs parses + runs
    68	        run: node --check scripts/preflight.mjs

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'node --check scripts/preflight.mjs' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'bash tests/hooks/run-tests.sh' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 exited 1 in 594ms:
FAIL chain: cd && git push origin main                       [block-push-to-main.sh]: expected 2 got 0
PASS main-direct SPEC allows push to main                    [block-push-to-main.sh]
PASS main-direct SPEC allows push -u main                    [block-push-to-main.sh]
PASS real git add . blocked                                  [block-git-add-all.sh]
PASS real git add -A blocked                                 [block-git-add-all.sh]
PASS git add --all blocked                                   [block-git-add-all.sh]
PASS git add filename allowed                                [block-git-add-all.sh]
PASS msg mentions git add . allowed                          [block-git-add-all.sh]
PASS heredoc with git add .                                  [block-git-add-all.sh]
PASS real --no-verify on commit blocked                      [block-verify-bypass.sh]
PASS real --no-gpg-sign on push blocked                      [block-verify-bypass.sh]
PASS git log --no-merges allowed                             [block-verify-bypass.sh]
PASS msg mentions --no-verify                                [block-verify-bypass.sh]
PASS heredoc body with --no-verify                           [block-verify-bypass.sh]
PASS commit -m with Co-Authored-By blocked                   [block-ai-attribution.sh]
PASS commit -m clean allowed                                 [block-ai-attribution.sh]
PASS commit -F file with co-author blocked                   [block-ai-attribution.sh]
PASS commit -F file clean allowed                            [block-ai-attribution.sh]
PASS non-commit (push) allowed                               [block-ai-attribution.sh]
FAIL edit on main blocked (no main-direct)                   [block-edit-on-main.sh]: expected 2 got 0
PASS edit on main allowed (main-direct SPEC)                 [block-edit-on-main.sh]
PASS edit in non-git dir allowed                             [block-edit-on-main.sh]
PASS session-start emits Session-init context header         [session-start-context.sh]
PASS session-start emits Repo: line                          [session-start-context.sh]
PASS session-start emits Recent commits section              [session-start-context.sh]
PASS verify-reminder.sh emits 0 on Stop                      [verify-reminder.sh]

=== 29 pass / 4 fail ===

Failures:
  - real push to main blocked [block-push-to-main.sh]: expected exit 2, got 0; stderr=
  - real push -u origin main blocked [block-push-to-main.sh]: expected exit 2, got 0; stderr=
  - chain: cd && git push origin main [block-push-to-main.sh]: expected exit 2, got 0; stderr=
  - edit on main blocked (no main-direct) [block-edit-on-main.sh]: expected exit 2, got 0; stderr=

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n \"currently 2\\.0\\.0|v2\\.0\\)|v2\\.0\\]|schema 2\\.0\\.0|manifest schema 2\\.0\\.0|2\\.0\\.0\" scripts/validate-manifest.sh spec-bundle/manifest.yaml .github/workflows/ci.yml specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md spec-bundle" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:226:  exist in v2.0). <!-- lint-ok: no-citation -->
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:263:# (updated from v2.0.0 per codex remediation §7.E / §7.F;
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:264:# Round-3 finding flagged the original v2.0.0 example here
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:267:bundle_version: "2.0.0"             # semver; this specific bundle release
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:365:   §7.E + §7.F; was `2.0.0` at v2.0.0 release).
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:565:10. Tag `v2.0.0` once `validate-manifest` + lint +
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:593:2.0.0 to 2.1.0.
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:784:| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:808:- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:823:- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:880:- v2.0 ships under the same repo URL; the v2.0.0 tag
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:896:was filled at original verification 2026-05-19 (v2.0.0
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:907:| Original | 2026-05-19 | v2.0 layout repack + v2.0.0 tag | `1104e3a` + `5f59f7b` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:917:- manifest spec_version: `2.1.0` (was `2.0.0` at
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:918:  original verification; v2.0.0 release tag stays at
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:919:  `2.0.0`)
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:997:  2.0.0, conformance core, 8 facets; current schema is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1014:PASS. All 9 ACs met except AC-8 (v2.0.0 tag) which is
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1059:  is recommended before tagging v2.0.0 final — but
.github/workflows/ci.yml:55:    name: validate spec-bundle manifest (v2.0)
spec-bundle/manifest.yaml:2:bundle_version: "2.0.0"
spec-bundle/manifest.yaml:23:# source_tag empty between tags. The v2.0.0 tag predates the v2.1
spec-bundle/manifest.yaml:25:# at v2.0.0 from a v2.1-schema manifest would mislead. The next
scripts/validate-manifest.sh:11:#    (currently 2.0.0).
spec-bundle/manifest.yaml:2:bundle_version: "2.0.0"
spec-bundle/manifest.yaml:23:# source_tag empty between tags. The v2.0.0 tag predates the v2.1
spec-bundle/manifest.yaml:25:# at v2.0.0 from a v2.1-schema manifest would mislead. The next
spec-bundle/operations/failures.md:71:checker (out of scope for v2.0).
spec-bundle/architecture/solution-strategy.md:81:land (v2.x slice — placeholder at v2.0).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,180p' tests/hooks/run-tests.sh" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
#!/usr/bin/env bash
# Hook test harness. Exits 0 if all pass, 1 on failure.
#
# Each test feeds a synthesized PreToolUse(Bash | Edit) JSON envelope to a
# hook and asserts the exit code (and optionally stderr / stdout content).
#
# All "should block" tests for branch-aware hooks run from a sandbox git
# repo with no main-direct SPEC, so the hook's SPEC walk falls through to
# the block. "Should allow" tests use a sandbox repo that DOES declare
# main-direct, exercising the allow path.

set -u
HOOK_DIR="$(cd "$(dirname "$(readlink -f "$0")")/../../hooks" && pwd)"
FIXTURES="$(cd "$(dirname "$(readlink -f "$0")")/fixtures" && pwd)"
PASS=0; FAIL=0; FAILURES=()

run() {
    local name="$1" hook="$2" expected_exit="$3" json="$4" cwd="${5:-}"
    local actual stderr
    if [ -n "$cwd" ]; then
        stderr=$(cd "$cwd" && printf '%s' "$json" | "$HOOK_DIR/$hook" 2>&1 >/dev/null)
    else
        stderr=$(printf '%s' "$json" | "$HOOK_DIR/$hook" 2>&1 >/dev/null)
    fi
    actual=$?
    if [ "$actual" = "$expected_exit" ]; then
        PASS=$((PASS+1))
        printf 'PASS %-55s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit, got $actual; stderr=$stderr")
        printf 'FAIL %-55s [%s]: expected %s got %s\n' "$name" "$hook" "$expected_exit" "$actual"
    fi
}

run_stdout() {
    local name="$1" hook="$2" expected_exit="$3" expected_substr="$4" json="$5"
    local actual stdout
    stdout=$(printf '%s' "$json" | "$HOOK_DIR/$hook" 2>/dev/null)
    actual=$?
    if [ "$actual" = "$expected_exit" ] && printf '%s' "$stdout" | grep -qF "$expected_substr"; then
        PASS=$((PASS+1))
        printf 'PASS %-55s [%s]\n' "$name" "$hook"
    else
        FAIL=$((FAIL+1))
        FAILURES+=("$name [$hook]: expected exit $expected_exit + stdout containing '$expected_substr'; got exit $actual")
        printf 'FAIL %-55s [%s]\n' "$name" "$hook"
    fi
}

# --- sandbox repos ---

# SANDBOX_NO_SPEC: git repo on main, no SPEC declaring main-direct.
# Used for "should block" tests of branch-aware hooks.
SANDBOX_NO_SPEC="$(mktemp -d)"
( cd "$SANDBOX_NO_SPEC" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && git -c user.email=t@t -c user.name=t commit -q --allow-empty -m init )

# SANDBOX_MAIN_DIRECT: git repo on main WITH a main-direct SPEC.
# Used for "should allow" tests of branch-aware hooks.
SANDBOX_MAIN_DIRECT="$(mktemp -d)"
( cd "$SANDBOX_MAIN_DIRECT" \
    && git init -q \
    && git symbolic-ref HEAD refs/heads/main \
    && mkdir -p specs/fixture \
    && printf -- '---\nid: fixture\ntype: contract\nstatus: closed\nbranch_policy: main-direct\n---\n' > specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t add specs/fixture/SPEC.md \
    && git -c user.email=t@t -c user.name=t commit -q -m init )

# NON_GIT: a non-git tmpdir for hooks that bail out when not in a git repo.
NON_GIT="$(mktemp -d)"

trap 'rm -rf "$SANDBOX_NO_SPEC" "$SANDBOX_MAIN_DIRECT" "$NON_GIT"' EXIT

# --- helpers ---

JB() {
    # PreToolUse(Bash) envelope.
    local cmd="$1"
    printf '{"tool_input":{"command":%s}}' "$(printf '%s' "$cmd" | jq -Rs .)"
}

JE() {
    # PreToolUse(Edit) envelope.
    local file_path="$1"
    printf '{"tool_input":{"file_path":"%s"}}' "$file_path"
}

# --- block-push-to-main.sh ---
run "real push to main blocked"               block-push-to-main.sh   2 "$(JB 'git push origin main')" "$SANDBOX_NO_SPEC"
run "real push to feature branch allowed"     block-push-to-main.sh   0 "$(JB 'git push origin feature/x')"
run "real push -u origin main blocked"        block-push-to-main.sh   2 "$(JB 'git push -u origin main')" "$SANDBOX_NO_SPEC"
run "real push to main-rework allowed"        block-push-to-main.sh   0 "$(JB 'git push origin feature/main-rework')"
run "no push (commit only) allowed"           block-push-to-main.sh   0 "$(JB 'git commit -m "fix bug"')"
run "commit msg mentions git push to main"    block-push-to-main.sh   0 "$(JB 'git commit -m "describe what git push to main does"')"
run "heredoc body mentions git push to main"  block-push-to-main.sh   0 "$(JB $'cat > /tmp/msg <<EOF\nrefuses git push to main\nEOF\ngit commit -F /tmp/msg')"
run "chain: cd && git push origin main"       block-push-to-main.sh   2 "$(JB 'cd /repo && git push origin main')" "$SANDBOX_NO_SPEC"
run "main-direct SPEC allows push to main"    block-push-to-main.sh   0 "$(JB 'git push origin main')" "$SANDBOX_MAIN_DIRECT"
run "main-direct SPEC allows push -u main"    block-push-to-main.sh   0 "$(JB 'git push -u origin main')" "$SANDBOX_MAIN_DIRECT"

# --- block-git-add-all.sh ---
run "real git add . blocked"                  block-git-add-all.sh    2 "$(JB 'git add .')"
run "real git add -A blocked"                 block-git-add-all.sh    2 "$(JB 'git add -A')"
run "git add --all blocked"                   block-git-add-all.sh    2 "$(JB 'git add --all')"
run "git add filename allowed"                block-git-add-all.sh    0 "$(JB 'git add foo.txt')"
run "msg mentions git add . allowed"          block-git-add-all.sh    0 "$(JB 'git commit -m "stop using git add ."')"
run "heredoc with git add ."                  block-git-add-all.sh    0 "$(JB $'cat > /tmp/msg <<EOF\ngit add . is banned\nEOF')"

# --- block-verify-bypass.sh ---
run "real --no-verify on commit blocked"      block-verify-bypass.sh  2 "$(JB 'git commit --no-verify -m "x"')"
run "real --no-gpg-sign on push blocked"      block-verify-bypass.sh  2 "$(JB 'git push --no-gpg-sign')"
run "git log --no-merges allowed"             block-verify-bypass.sh  0 "$(JB 'git log --no-merges')"
run "msg mentions --no-verify"                block-verify-bypass.sh  0 "$(JB 'git commit -m "this hook blocks --no-verify"')"
run "heredoc body with --no-verify"           block-verify-bypass.sh  0 "$(JB $'cat > /tmp/msg <<EOF\nrefuses --no-verify\nEOF\ngit commit -F /tmp/msg')"

# --- block-ai-attribution.sh ---
run "commit -m with Co-Authored-By blocked"   block-ai-attribution.sh 2 "$(JB 'git commit -m "fix\n\nCo-Authored-By: Claude <x>"')"
run "commit -m clean allowed"                 block-ai-attribution.sh 0 "$(JB 'git commit -m "clean message"')"
run "commit -F file with co-author blocked"   block-ai-attribution.sh 2 "$(JB "git commit -F $FIXTURES/msg-with-coauthor.txt")"
run "commit -F file clean allowed"            block-ai-attribution.sh 0 "$(JB "git commit -F $FIXTURES/msg-clean.txt")"
run "non-commit (push) allowed"               block-ai-attribution.sh 0 "$(JB 'git push origin feature/x')"

# --- block-edit-on-main.sh ---
run "edit on main blocked (no main-direct)"   block-edit-on-main.sh   2 "$(JE 'foo.md')" "$SANDBOX_NO_SPEC"
run "edit on main allowed (main-direct SPEC)" block-edit-on-main.sh   0 "$(JE 'foo.md')" "$SANDBOX_MAIN_DIRECT"
run "edit in non-git dir allowed"             block-edit-on-main.sh   0 "$(JE 'foo.md')" "$NON_GIT"

# --- session-start-context.sh (stdout-as-context per Claude Code docs) ---
run_stdout "session-start emits Session-init context header" \
    session-start-context.sh 0 "Session-init context" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits Repo: line" \
    session-start-context.sh 0 "Repo:" \
    '{"hook_event_name":"SessionStart"}'
run_stdout "session-start emits Recent commits section" \
    session-start-context.sh 0 "Recent commits" \
    '{"hook_event_name":"SessionStart"}'

# --- verify-reminder.sh ---
run "verify-reminder.sh emits 0 on Stop"      verify-reminder.sh      0 '{"hook_event_name":"Stop"}'

# --- summary ---
printf '\n=== %d pass / %d fail ===\n' "$PASS" "$FAIL"
if [ "$FAIL" -gt 0 ]; then
    printf '\nFailures:\n'
    for line in "${FAILURES[@]}"; do printf '  - %s\n' "$line"; done
    exit 1
fi
exit 0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'rg -n "primary_index|semantic|canonical|containment|inside primary|directory rule|features-sibling|lexical prefix" specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md scripts/validate-manifest.sh spec-bundle/manifest.yaml tests scripts' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/manifest.yaml:61:    primary_index: "behavior/features/lint-citation-grammar.feature"
scripts/validate-manifest.sh:166:# Parse primary + primary_index + media_type per facet per the v2.1
scripts/validate-manifest.sh:168:# accepted directory primaries silently without verifying primary_index
scripts/validate-manifest.sh:173:declare -A facet_primary_index
scripts/validate-manifest.sh:182:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:185:        facet_primary_index["$current_facet"]="$pi"
scripts/validate-manifest.sh:215:        # Directory primary — v2.1 requires primary_index.
scripts/validate-manifest.sh:220:        pi="${facet_primary_index[$facet]:-}"
scripts/validate-manifest.sh:222:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:225:        # primary_index MUST be INSIDE the primary directory
scripts/validate-manifest.sh:230:        # containment via canonicalised paths is the fix.)
scripts/validate-manifest.sh:232:            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment (lexical prefix check)"
scripts/validate-manifest.sh:235:        # Semantic-containment check: canonicalise both paths and
scripts/validate-manifest.sh:236:        # verify the canonicalised primary_index sits inside the
scripts/validate-manifest.sh:237:        # canonicalised primary directory. Defeats ../ traversal.
scripts/validate-manifest.sh:240:        # sibling dirs like "behavior/features-sibling/" when
scripts/validate-manifest.sh:245:            err "facet '$facet' primary or primary_index cannot be canonicalised (primary=$primary, primary_index=$pi)"
scripts/validate-manifest.sh:249:            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
scripts/validate-manifest.sh:253:            err "facet '$facet' primary_index file missing: $pi"
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:125:├── OPERATING_MODEL.md                 # remains; canonical operating-model
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:224:  but is the canonical entry doc per the methodology
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:302:    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:568:### 7.3 Migration semantics
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:630:| `primary` | string (relative-to-bundle) | yes — the entry file OR directory for the facet (if directory, MUST end in `/` and a `primary_index` field MUST name a file inside) |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:631:| `primary_index` | string (relative-to-bundle) | **conditionally REQUIRED (v2.1)** — required when `primary` is a directory path; names the file inside the directory that serves as the facet's named entry point |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:640:**v2.1 facet.primary directory rule (codex remediation
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:643:the file named by `primary_index` exists inside it AND
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:661:`digest`, `size`, `status` fields (same semantics as
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:899:manifest.sh (v2.1 enforcement + semantic containment),
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:911:| R4 fixes | 2026-05-20 | validator semantic-containment + REQUIRED-field expansion + final bare-path migration | `61528c8` |
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:921:  semantic-containment + 5 top-level REQUIRED + 3
scripts/validate-manifest.sh:166:# Parse primary + primary_index + media_type per facet per the v2.1
scripts/validate-manifest.sh:168:# accepted directory primaries silently without verifying primary_index
scripts/validate-manifest.sh:173:declare -A facet_primary_index
scripts/validate-manifest.sh:182:    elif [[ "$line" =~ ^[[:space:]]{4}primary_index:[[:space:]]*\"?([^\"]*)\"?$ ]] && [ -n "$current_facet" ]; then
scripts/validate-manifest.sh:185:        facet_primary_index["$current_facet"]="$pi"
scripts/validate-manifest.sh:215:        # Directory primary — v2.1 requires primary_index.
scripts/validate-manifest.sh:220:        pi="${facet_primary_index[$facet]:-}"
scripts/validate-manifest.sh:222:            err "facet '$facet' primary is directory ($primary) but primary_index is missing (v2.1 schema §8.3 REQUIRED for directory primaries)"
scripts/validate-manifest.sh:225:        # primary_index MUST be INSIDE the primary directory
scripts/validate-manifest.sh:230:        # containment via canonicalised paths is the fix.)
scripts/validate-manifest.sh:232:            err "facet '$facet' primary_index ($pi) is NOT inside primary directory ($primary); SPEC §8.3 requires containment (lexical prefix check)"
scripts/validate-manifest.sh:235:        # Semantic-containment check: canonicalise both paths and
scripts/validate-manifest.sh:236:        # verify the canonicalised primary_index sits inside the
scripts/validate-manifest.sh:237:        # canonicalised primary directory. Defeats ../ traversal.
scripts/validate-manifest.sh:240:        # sibling dirs like "behavior/features-sibling/" when
scripts/validate-manifest.sh:245:            err "facet '$facet' primary or primary_index cannot be canonicalised (primary=$primary, primary_index=$pi)"
scripts/validate-manifest.sh:249:            err "facet '$facet' primary_index ($pi) resolves OUTSIDE primary directory ($primary) after canonicalisation; SPEC §8.3 requires semantic containment"
scripts/validate-manifest.sh:253:            err "facet '$facet' primary_index file missing: $pi"
scripts/fleet-sync.sh:103:# .agents/ (canonical fleet content list — manifest-driven). Auto-create
scripts/fleet-sync.sh:150:# the per-repo intro ends and the canonical body begins.
scripts/audit-entry-docs.sh:3:# WORKFLOW.md against the canonical fleet pattern declared in
scripts/audit-entry-docs.sh:68:        printf '%s/AGENTS.md:1: BLOCKING — missing AGENTS.md (canonical entry doc per OPERATING_MODEL Source Of Truth)\n' "$repo_name" >&2
scripts/lint-spec.sh:570:    # at column 0 begin a new logical paragraph (markdown list semantics).
scripts/fleet-files.example.txt:11:# canonicalizes. The file is read by `fleet-sync.sh`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for f in examples/*/IDEA.md examples/*/SPEC.md; do [ -f "$f" ] && bash scripts/lint-spec.sh "$f" >/dev/null || exit $?; done; echo "example lint: PASS"' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 2839ms:
example lint: PASS

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-review/references/per-type-gates.md | sed -n '1,130p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	# Per-Type Gate Criteria
     2	
     3	Detailed criteria for each gate type. Authority:
     4	`file://examples/reference-procedure-spec` §10.
     5	When this file and that SPEC diverge, the SPEC wins and this file
     6	MUST be updated to match.
     7	
     8	All criteria are **blocking** unless tagged `advisory`.
     9	
    10	## Contents
    11	
    12	- IDEA gate (§10.1)
    13	- Task SPEC gate, bar (b) "verifiable" (§10.2)
    14	- Contract SPEC gate, bar (c) "the autonomous-dispatch runner-grade" (§10.3)
    15	- Decision SPEC gate, bar (b) + candidate-comparison (§10.4)
    16	- Studio-principle Decision SPECs — additional verbatim-to-normative
    17	  trace check
    18	
    19	## IDEA gate (§10.1)
    20	
    21	- All REQUIRED IDEA sections (§9.1) present and non-empty (or
    22	  explicit `N/A: <reason>`).
    23	- Every factual claim carries a citation prefix from the allowed
    24	  grammar (`file://`, `cmd://`, `url://`, `owner://`,
    25	  `judgment://owner`, `judgment://agent-synthesis`) per
    26	  SPEC.schema §2.
    27	- Every Owner Judgment in §7 is attributed with a verbatim
    28	  transcript quote.
    29	- Every `judgment://agent-synthesis` claim is paired with owner-
    30	  affirmation in transcript.
    31	- Every Open Question is either resolved or explicitly marked
    32	  `owner-blocking` (the latter blocks transition to
    33	  `ready-for-spec`).
    34	- `implies_spec_type` front-matter is set to `task`, `contract`, or
    35	  `decision`.
    36	- RFC 2119 keywords used in the IDEA are uppercase. Lowercase
    37	  variants in normative-feeling sentences are advisory (severity
    38	  `advisory`).
    39	
    40	## Task SPEC gate, bar (b) "verifiable" (§10.2)
    41	
    42	- All REQUIRED Task SPEC sections (§9.2) present and non-empty.
    43	- Every external fact cites a source per SPEC.schema §2.
    44	- Every entity in the Domain Model section has a full schema
    45	  (type, nullability; example RECOMMENDED).
    46	- All Acceptance Criteria are checkbox items; each is paired with
    47	  a Test Plan entry.
    48	- Front-matter `acceptance_commands` is non-empty, OR set to `[]`
    49	  with an explicit reason in the Acceptance Criteria section.
    50	- All Open Questions resolved or marked `owner-blocking` (latter
    51	  blocks approval).
    52	- RFC 2119 keywords uppercase.
    53	
    54	## Contract SPEC gate, bar (c) "the autonomous-dispatch runner-grade" (§10.3)
    55	
    56	- All Task gate (bar b) criteria above, applied where they fit
    57	  Contract sections.
    58	- Normative Language preamble present.
    59	- Test and Validation Matrix is 1:1 with Acceptance Criteria — no
    60	  orphan tests, no unverified criteria.
    61	- Definition of Done checklist mirrors the Test Matrix.
    62	- When behavior is stateful, a state machine is named with states,
    63	  transitions, triggers, and idempotency rules.
    64	- Pseudocode for non-trivial algorithms.
    65	- Failure Model section present with failure classes and recovery
    66	  behavior.
    67	- Observability section present.
    68	- Trust Boundary / Security section present.
    69	- `scripts/lint-spec.sh` exits 0 on this SPEC (exit 2 is
    70	  advisory and does not block; exit 1 is blocking).
    71	
    72	## Decision SPEC gate, bar (b) + candidate-comparison (§10.4)
    73	
    74	- Task gate (bar b) criteria above, applied where they fit Decision
    75	  sections.
    76	- Candidate Options table has ≥ 2 candidates, each with all
    77	  required fields (description, fit-with-substance,
    78	  fit-with-constraints, cost, risk).
    79	- Decision Criteria are sourced (substance citation or
    80	  `judgment://owner`).
    81	- Trade-off Comparison present.
    82	- Decision Statement present, in RFC 2119 normative language. RFC
    83	  2119 keywords MUST NOT appear elsewhere in a Decision SPEC
    84	  (SPEC.schema §3).
    85	- Locks section present (MAY state `no locks` with reason).
    86	- Reversal Plan present (MAY state `irreversible: <reason>`).
    87	
    88	### Fleet-principle Decision SPECs — additional check
    89	
    90	When the SPEC slug matches `principle-*` (per
    91	`file://spec-bundle/skills/spec-authoring/SKILL.md`), apply the
    92	**verbatim-to-normative trace** check in addition to the standard
    93	Decision gate:
    94	
    95	- Every RFC 2119 clause in §7 Decision Statement MUST trace back
    96	  to a specific owner verbatim (`owner://transcript-<date>` quote)
    97	  or to a `judgment://owner` capture in the upstream IDEA.
    98	- Failure mode: a normative clause with no upstream owner anchor
    99	  signals the principle is being authored ahead of owner intent.
   100	  Record as `criterion: principle-not-owner-anchored`,
   101	  `severity: blocking`; route to `needs-revision`.
   102	- Authority:
   103	  `judgment://agent-synthesis`
   104	  §5 ("Trace-from-verbatim-to-normative is the principle SPEC
   105	  quality signature").
   106	
   107	The check is the principle SPEC's quality signature; lint catches
   108	the structural failure (uncited claims) but not the semantic walk
   109	from owner verbatim through IDEA decomposition into the specific §7
   110	clause. The walk is a `spec-review` responsibility for principle
   111	SPECs.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "sed -n '1,40p' specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
---
id: 2026-05-19-v2-manifest-catalog-repack
status: verified
type: contract
owner: HasNoBeef
repo: agentic-ops-framework
branch_policy: main-direct
risk: medium
requires_network: false
requires_secrets: []
acceptance_commands:
  - bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
  - test -f spec-bundle/manifest.yaml
  - bash scripts/validate-manifest.sh
cites_decision: 2026-05-18-agentic-installation-methodology
---

# SPEC: Product A v2.0 — Manifest+Catalog Repack (Slice 2)

Status: Draft v1
Type: Contract
Purpose: govern the v1.1 → v2.0 reorganization of
agentic-ops-framework from a single-tree layout into a
front-door-manifest + per-facet-catalog shape that
exemplifies the methodology Product B publishes. Defines
the v2.0 directory layout, the manifest schema, the
per-facet sub-spec contracts (architecture / deployment /
behavior / customization / decisions / quality /
operations / non-goals), the migration path from v1.1, and
the v2.0 conformance suite. Every methodology primitive
cited here resolves to a primary-source artefact in the
sibling repo's
`research/primary-sources/<slug>.md` corpus.

## Normative Language

The key words `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`,
`SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` in this
document are to be interpreted as described in RFC 2119 and RFC 8174
when, and only when, they appear in all capitals.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "git tag --list 'v2*' --sort=creatordate" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
v2.0.0

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'git branch --show-current && git rev-parse HEAD && git status --porcelain' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
main
05ad7a5e72b9e230cd12115fcff23d4b7991719c

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '250,385p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   250	them under `spec-bundle/` so the manifest can address
   251	them as per-facet sub-spec resources. <!-- lint-ok: no-citation -->
   252	
   253	## 6. Domain Model
   254	
   255	### 6.1 Front-door manifest (spec-bundle/manifest.yaml)
   256	
   257	The manifest is the bundle's single source of truth for
   258	what the bundle contains and what conformance profile it
   259	claims. Schema:
   260	
   261	```yaml
   262	# spec-bundle/manifest.yaml — v2.1.0 schema example
   263	# (updated from v2.0.0 per codex remediation §7.E / §7.F;
   264	# Round-3 finding flagged the original v2.0.0 example here
   265	# as stale relative to §8.1 v2.1.0 formal schema)
   266	spec_version: "2.1.0"               # semver; this manifest schema version
   267	bundle_version: "2.0.0"             # semver; this specific bundle release
   268	conformance_profile: "core"         # core | extension | real-integration
   269	generated_on: "YYYY-MM-DD"          # ISO date the bundle was assembled
   270	generator: "agentic-ops-framework"  # source repo identifier
   271	schema_uri: "<URL pin>"             # v2.1 REQUIRED; pin to immutable
   272	                                    # commit / tag at release time
   273	source_commit: ""                   # v2.1 REQUIRED; populated by
   274	                                    # release tooling at tag time
   275	source_tag: ""                      # v2.1 OPTIONAL; empty between tags
   276	
   277	intent:
   278	  product_name: "agentic-ops-framework"
   279	  product_purpose: |
   280	    <one-paragraph statement of what the product is for>
   281	  developer_authority:
   282	    - role: "framework maintainer"
   283	      identity: "HasNoBeef <github:HasNoBeef>"
   284	  installer_authority:
   285	    - role: "user-with-agent"
   286	      capabilities_floor: "any-reasonably-capable-coding-agent"
   287	
   288	facets:
   289	  architecture:
   290	    path: "architecture/"
   291	    primary: "architecture/CONTEXT.md"
   292	    media_type: "text/markdown"     # v2.1 RECOMMENDED
   293	    status: "complete"              # v2.1 RECOMMENDED: complete | partial | reserved
   294	  deployment:
   295	    path: "deployment/"
   296	    primary: "deployment/install.md"
   297	    media_type: "text/markdown"
   298	    status: "complete"
   299	  behavior:
   300	    path: "behavior/"
   301	    primary: "behavior/features/"
   302	    primary_index: "behavior/features/<entry>.feature"  # v2.1 conditionally REQUIRED when primary is directory
   303	    media_type: "text/x.gherkin"
   304	    status: "complete"
   305	  customization:
   306	    path: "customization/"
   307	    primary: "customization/contract.md"
   308	    media_type: "text/markdown"
   309	    status: "complete"
   310	  decisions:
   311	    path: "decisions/"
   312	    primary: "decisions/INDEX.md"
   313	    media_type: "text/markdown"
   314	    status: "complete"
   315	  quality:
   316	    path: "quality/"
   317	    primary: "quality/requirements.md"
   318	    media_type: "text/markdown"
   319	    status: "complete"
   320	  operations:
   321	    path: "operations/"
   322	    primary: "operations/failures.md"
   323	    media_type: "text/markdown"
   324	    status: "complete"
   325	  non-goals:
   326	    path: "non-goals/"
   327	    primary: "non-goals/INDEX.md"
   328	    media_type: "text/markdown"
   329	    status: "complete"
   330	
   331	resources:
   332	  schema:
   333	    path: "schema/SPEC.schema.md"
   334	    media_type: "text/markdown"
   335	  templates:
   336	    path: "templates/"
   337	    media_type: "text/markdown"
   338	  skills:
   339	    path: "skills/"
   340	    media_type: "text/markdown"
   341	  conformance:
   342	    path: "conformance/"
   343	    media_type: "application/vnd.framework.conformance-suite"
   344	    status: "reserved"              # v2.1: explicit scaffold disclosure
   345	
   346	provenance:                         # v2.1 OPTIONAL — see §8.6
   347	  sbom_format: "cyclonedx"          # cyclonedx | spdx
   348	  sbom_ref: ""                      # populated by release tooling
   349	  slsa_level: ""                    # SLSA attestation level
   350	
   351	signature:
   352	  status: "unsigned"                # signed | unsigned
   353	  # When signed: cosign signature + Rekor inclusion proof
   354	  # populated per
   355	  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
   356	```
   357	
   358	Manifest validation rules (enforced by
   359	`scripts/validate-manifest.sh`):
   360	
   361	1. `spec_version` matches the schema version this SPEC
   362	   §6.1 defines (currently `2.1.0` post the codex
   363	   remediation amendment at
   364	   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
   365	   §7.E + §7.F; was `2.0.0` at v2.0.0 release).
   366	2. `conformance_profile` is one of {`core`, `extension`,
   367	   `real-integration`}
   368	   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
   369	   §3 three-profile model).
   370	3. Every facet listed in `facets:` has a corresponding
   371	   directory under `spec-bundle/<facet>/` containing the
   372	   named `primary` file.
   373	4. Every directory under `spec-bundle/` (except
   374	   `resources/` items) is listed in `facets:`.
   375	5. `intent.product_name` matches the repo name.
   376	
   377	### 6.2 Per-facet sub-spec contracts
   378	
   379	#### 6.2.1 architecture/
   380	
   381	Carries:
   382	- `CONTEXT.md` — system-context narrative (arc42 §3
   383	  Context and Scope per
   384	  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
   385	  §3).

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '685,735p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   685	### 9.1 validate-manifest (pseudocode)
   686	
   687	```
   688	function validate_manifest():
   689	  manifest = parse_yaml("spec-bundle/manifest.yaml")
   690	  errors = []
   691	
   692	  # 1. Schema version match.
   693	  if manifest.spec_version != "2.1.0":
   694	    errors.append("spec_version: expected 2.1.0, got " + manifest.spec_version)
   695	
   696	  # 2. Conformance profile valid.
   697	  if manifest.conformance_profile not in ["core", "extension", "real-integration"]:
   698	    errors.append("conformance_profile invalid")
   699	
   700	  # 3. Required top-level fields.
   701	  for field in ["bundle_version", "generated_on", "generator",
   702	                "intent", "facets"]:
   703	    if field not in manifest:
   704	      errors.append("missing field: " + field)
   705	
   706	  # 4. intent block well-formed.
   707	  for f in ["product_name", "product_purpose",
   708	            "developer_authority", "installer_authority"]:
   709	    if f not in manifest.intent:
   710	      errors.append("intent missing: " + f)
   711	
   712	  # 5. Facets bijection: every listed facet has a directory
   713	  #    with the named primary file; every spec-bundle/
   714	  #    subdir (except resource subdirs) is listed.
   715	  listed_facets = set(manifest.facets.keys())
   716	  fs_subdirs = set(filter(is_dir, ls("spec-bundle/"))) - RESOURCE_DIRS
   717	  if listed_facets != fs_subdirs:
   718	    errors.append("facets mismatch: listed but not on fs " +
   719	                  str(listed_facets - fs_subdirs) +
   720	                  "; on fs but not listed " +
   721	                  str(fs_subdirs - listed_facets))
   722	
   723	  for fname, fdef in manifest.facets.items():
   724	    if not exists("spec-bundle/" + fdef.primary):
   725	      errors.append("facet " + fname + " primary file missing: " + fdef.primary)
   726	
   727	  # 6. Product name matches repo.
   728	  if manifest.intent.product_name != "agentic-ops-framework":
   729	    errors.append("intent.product_name mismatch")
   730	
   731	  if errors:
   732	    print_errors(errors)
   733	    exit 1
   734	  exit 0
   735	```

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '760,830p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   760	  front-matter.
   761	
   762	## 12. Observability
   763	
   764	- `validate-manifest.sh` prints diagnostic lines to
   765	  stderr per failed check; exit 0 iff all checks pass.
   766	- CI job `validate-manifest` runs on every push +
   767	  pull request; CI status is the observability surface
   768	  for bundle health.
   769	- The bundle's `spec_version` field is the
   770	  user-observable schema version; consumers can pin
   771	  against a specific schema version.
   772	
   773	## 13. Test and Validation Matrix
   774	
   775	| AC | Test |
   776	|---|---|
   777	| AC-1 | `cmd://bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md` exits 0 |
   778	| AC-2 | `cmd://test -f spec-bundle/manifest.yaml` exits 0 |
   779	| AC-3 | `cmd://bash scripts/validate-manifest.sh` exits 0 |
   780	| AC-4 | For each facet F in §6.2: `cmd://test -d spec-bundle/<F>` AND `cmd://test -f spec-bundle/<F>/<primary-file>` |
   781	| AC-5 | `cmd://bash tests/hooks/run-tests.sh` reports 33 pass / 0 fail (no regressions from repack) |
   782	| AC-6 | `cmd://bash scripts/lint-spec.sh examples/*/IDEA.md examples/*/SPEC.md` lint clean on every example (no regressions) |
   783	| AC-7 | `cmd://gh -R buildepicshit/agentic-ops-framework run list --limit 1` shows post-repack CI run with conclusion: success |
   784	| AC-8 | `cmd://git tag` includes `v2.0.0` (released after AC-1 through AC-7 all pass) |
   785	| AC-9 | `CHANGELOG.md` contains a `## v2.0` entry documenting the reorganization + breaking-changes index |
   786	
   787	## 14. Implementation Checklist (Definition of Done)
   788	
   789	- [ ] DoD-1: `spec-bundle/manifest.yaml` authored
   790	      conforming to §6.1 / §8 schema.
   791	- [ ] DoD-2: `scripts/validate-manifest.sh` authored;
   792	      `cmd://bash scripts/validate-manifest.sh` exits 0
   793	      against the populated bundle.
   794	- [ ] DoD-3: §7.1 migration index executed; every v1.1
   795	      artefact accounted for (moved, removed, or
   796	      retained-at-top-level).
   797	- [ ] DoD-4: Each of the eight facets per §6.2 has a
   798	      `<facet>/<primary>` file (initially MAY be a
   799	      stub with cross-references; v2.x slices populate
   800	      richer content).
   801	- [ ] DoD-5: `AGENTS.md` authored at top level per §3
   802	      and §6.2's repo-owned-contract pattern.
   803	- [ ] DoD-6: `CHANGELOG.md` v2.0 entry added with
   804	      migration index summary.
   805	- [ ] DoD-7: CI workflow updated to include
   806	      `validate-manifest` job; all CI jobs pass on the
   807	      repacked main.
   808	- [ ] DoD-8: `v2.0.0` git tag + GitHub release cut once
   809	      DoD-1 through DoD-7 are met.
   810	
   811	## 15. Acceptance Criteria
   812	
   813	(See §13 for tests; checkboxes are the post-execution
   814	verification list.)
   815	
   816	- [x] AC-1: SPEC lint clean
   817	- [x] AC-2: manifest exists
   818	- [x] AC-3: validate-manifest exits 0
   819	- [x] AC-4: every facet has primary file
   820	- [x] AC-5: hook tests 33/33 pass (no regression)
   821	- [x] AC-6: example lint clean (no regression)
   822	- [x] AC-7: CI green post-repack
   823	- [ ] AC-8: v2.0.0 tag exists (pending immediately after this commit)
   824	- [x] AC-9: CHANGELOG v2.0 entry present
   825	
   826	## 16. Rollback Plan
   827	
   828	If the repack surfaces a critical regression:
   829	
   830	1. The repack is a single PR (or coordinated commit

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md | sed -n '890,930p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   890	## 19. Completion Report
   891	
   892	### 19.0 Amendment log (post-verification edits)
   893	
   894	Per the pattern established in the parent Decision SPEC
   895	§14.0 and the corpus SPEC §19.0, this Completion Report
   896	was filled at original verification 2026-05-19 (v2.0.0
   897	release tag). Subsequent codex cross-family remediation
   898	rounds amended §6.1 / §8 (v2.1 schema bump), validate-
   899	manifest.sh (v2.1 enforcement + semantic containment),
   900	spec-bundle/manifest.yaml (v2.1 fields populated), and
   901	template/skill cross-references. §19.1 + §19.2 retain
   902	the original-verification state; current-state values
   903	are in this Amendment Log.
   904	
   905	| Round | Date | Notable | Commit |
   906	|---|---|---|---|
   907	| Original | 2026-05-19 | v2.0 layout repack + v2.0.0 tag | `1104e3a` + `5f59f7b` |
   908	| §7.E/F | 2026-05-19 | v2.1 schema bump | `ad36bda` |
   909	| R2 fixes | 2026-05-19 | validator v2.1 + provenance honesty + path migration | `9fef966`, `380db29` |
   910	| R3 fixes | 2026-05-19 | validator inside-directory + v2.1 example + bare-path migration | `e78b8a4` |
   911	| R4 fixes | 2026-05-20 | validator semantic-containment + REQUIRED-field expansion + final bare-path migration | `61528c8` |
   912	
   913	Current-state evidence supersedes §19.2:
   914	- repack-SPEC citation-prefix hits: 66 (per current
   915	  `lint-spec.sh` invocation; was 50 at original
   916	  verification)
   917	- manifest spec_version: `2.1.0` (was `2.0.0` at
   918	  original verification; v2.0.0 release tag stays at
   919	  `2.0.0`)
   920	- validate-manifest: PASS at v2.1.0 schema with
   921	  semantic-containment + 5 top-level REQUIRED + 3
   922	  intent REQUIRED enforcement
   923	
   924	### 19.1 Files changed (historical; original verification)
   925	
   926	60 files changed in commit `1104e3a`
   927	(2016 insertions / 72 deletions):
   928	
   929	**Created** (24 new files):
   930	- `AGENTS.md` (new top-level entry doc)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-driven-development/SKILL.md | sed -n '88,122p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    88	
    89	### Exception: capture-after pattern (and the `fastpath` SPEC type)
    90	
    91	The IDEA → SPEC → review → approve → execute → verify → close
    92	order is the default. One recognized exception (capture-after,
    93	formalized as the `fastpath` SPEC type) applies when ALL its
    94	thresholds hold; see
    95	`file://spec-bundle/skills/spec-driven-development/references/capture-after-and-fastpath.md`
    96	for the procedure, acceptance conditions, and reference
    97	precedents.
    98	
    99	## Spec Types
   100	
   101	Specs are typed. Pick the matching template from `templates/`
   102	(repo-relative under `your-policy-repo`; under `.templates/` in
   103	each child product repo):
   104	
   105	- `task` → `spec-bundle/templates/SPEC.task.template.md` — concrete, scoped,
   106	  verifiable work. Default.
   107	- `contract` → `spec-bundle/templates/SPEC.contract.template.md` — specifies
   108	  behavior that future agents implement against (state machines,
   109	  failure models, observability, reference algorithms). Bar c
   110	  ("the autonomous-dispatch runner-grade") with REQUIRED lint.
   111	- `decision` → `spec-bundle/templates/SPEC.decision.template.md` — chooses
   112	  between named candidates with rationale, locks, and reversal plan.
   113	
   114	Cross-template conventions (front-matter fields, citation grammar,
   115	RFC 2119 rules, section-naming) live in the shared schema at
   116	`spec-bundle/schema/SPEC.schema.md`. The IDEA artefact uses
   117	`spec-bundle/templates/IDEA.template.md`.
   118	
   119	Type selection is an authoring concern; defer to
   120	[`spec-authoring`](../spec-authoring/SKILL.md) §"Type selection".
   121	
   122	## IDEA Artefact Requirement

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/cross-repo-informational-channel/SKILL.md | sed -n '108,122p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   108	## Hard rules
   109	
   110	- Inbox entries are immutable once written. Acknowledgements
   111	  append below the original entry; do not edit the original.
   112	- Owner alone archives entries older than 90 days to
   113	  `AGENT_INBOX.archive.md`.
   114	- Truncate the file to the most recent 50 entries on
   115	  archival pass; do not let it grow unboundedly.
   116	- Entries citing facts MUST use the framework citation
   117	  grammar (`schema/SPEC.schema.md` §2).
   118	- Do NOT include secrets, credentials, or third-party private
   119	  data. Inboxes are git-tracked or working-tree visible to
   120	  any agent landing locally.
   121	- Do NOT write to your own repo's inbox. Use
   122	  `AGENT_FEEDBACK.md` for outgoing-to-fleet content or another

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/skills/spec-authoring/references/reference-architecture.md | sed -n '50,66p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    50	   the upstream repo + docs in §4 Authority Map; trade-off matrix
    51	   in §6 covers the fleet-specific criteria (procedure binding,
    52	   coexistence with existing tooling, citation+authority
    53	   preservation, OSS posture, agent skill surface, maintenance
    54	   cost).
    55	2. **Task SPEC** executing the deliverables. Lists the artefact
    56	   set in §17.1 Files Changed.
    57	3. **`skills/<tool>/SKILL.md`** mirroring upstream's
    58	   SKILL.md if one exists, adding bindings (citation grammar,
    59	   owner-only authority, propagation contract, hard rules against
    60	   bypassing existing fleet surfaces).
    61	4. **`workpads/<tool>.<ext>.template`** project-level
    62	   config bound to procedure via the tool's hook surface
    63	   (lint-spec on staged artefacts, parent-SPEC acceptance on
    64	   merge, evidence reminders, removal guards).
    65	5. **`OPERATING_MODEL.md`** section documenting the tool
    66	   boundary against existing fleet tooling (e.g., the

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/customization/contract.md | sed -n '12,27p' && nl -ba spec-bundle/architecture/CONTEXT.md | sed -n '18,30p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    12	deferred surface.
    13	
    14	## Provided by default (developer-owned)
    15	
    16	The framework SHIPS the following as immutable contract:
    17	
    18	- The IDEA / SPEC / TASK template structure
    19	  (`file://../templates/`).
    20	- The schema's citation grammar (`file://`, `cmd://`,
    21	  `url://`, `owner://`, `decision-authority://<role>:<date>`,
    22	  `judgment://owner`, `judgment://agent-synthesis`) and the
    23	  RFC 2119 scoping rules per artefact type
    24	  (`file://../schema/SPEC.schema.md` §2, §3).
    25	- The 13-phase lifecycle states (Preflight → Orient →
    26	  Predict → Ideate → Author → Review → Approve →
    27	  Decompose → Dispatch → Execute → Cross-validate →
    18	engineering work with coding agents under spec-first
    19	discipline.
    20	
    21	Concretely, the framework ships:
    22	- A typed SPEC schema with citation grammar, RFC 2119
    23	  scoping, and a status state machine
    24	  (`file://../schema/SPEC.schema.md`).
    25	- Six templates (IDEA + 4 SPEC types + TASK) at
    26	  `file://../templates/`.
    27	- A lint script (`file://../../scripts/lint-spec.sh`) that
    28	  enforces the schema per artefact type.
    29	- A skill catalog (`file://../skills/`) covering the
    30	  spec lifecycle plus multi-repo patterns.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/schema/SPEC.schema.md | sed -n '180,250p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
   180	todo ──► in-progress ──► in-review ──► <owner sets done>
   181	   │                          ▲
   182	   ▼                          │
   183	blocked ──── unblock ─────────┘
   184	```
   185	
   186	Idempotency: `done` is monotonic and owner-set. `blocked` is the
   187	only reverse edge from `in-progress`.
   188	
   189	Cross-validation gate: `in-progress → in-review` requires findings
   190	from `cross_validation_lane` to be addressed (or explicit
   191	justified pushback) per `spec-bundle/skills/code-review/SKILL.md` and the
   192	spec-review skill in your harness.
   193	
   194	Integration gate: when ALL TASK.md in a parent SPEC's `tasks/`
   195	directory reach `done`, the parent SPEC MAY flip
   196	`decomposed → in-execution → verified` after running the parent's
   197	full `acceptance_commands`. The parent SPEC's §17 / §19 Completion
   198	Report aggregates per-task evidence.
   199	
   200	## 2. Citation grammar
   201	
   202	Every factual claim in IDEA.md or SPEC.md MUST carry a citation
   203	prefix from the table below. Memory and training are NOT citable
   204	evidence (per OPERATING_MODEL Memory Policy, input-vs-artefact
   205	distinction).
   206	
   207	### 2.1 Allowed prefixes
   208	
   209	| Prefix | Form | Required surrounding context |
   210	|---|---|---|
   211	| `file://` | `file://<repo-relative-or-absolute-path>` | MAY include `#<line>` or `§<section>` suffix; path MUST exist at the cited commit |
   212	| `cmd://` | `cmd://<command>` | surrounding prose MUST include the observed result or output excerpt |
   213	| `url://` | `url://<full-url>` | surrounding prose MUST include fetch-date, OR pair with a `file://` cache reference |
   214	| `decision-authority://<role>:<date>` | `<role>` ∈ {`owner`, `product-lead`, `tech-lead`, `governance-committee`, `<your-role>`} | binding directive; surrounding prose MUST include the verbatim quote or directive record |
   215	| `owner://` | `owner://transcript-<YYYY-MM-DD>` | shorthand for `decision-authority://owner:<date>` in single-owner studios; surrounding prose MUST include verbatim quote |
   216	| `judgment://owner` | literal | binding by ownership not external evidence; MUST be attributable to a decision-authority record |
   217	| `judgment://agent-synthesis` | literal | MUST be paired with decision-authority affirmation captured via `decision-authority://` or `owner://` |
   218	
   219	Repo-relative `file://` paths are RECOMMENDED. Absolute paths are
   220	RECOMMENDED only when the cited file is outside the repo.
   221	
   222	**Precondition.** The citation grammar presumes the studio has a
   223	named decision-authority (single owner, named product lead, or
   224	governance committee) that produces attributable directives.
   225	Multi-stakeholder organizations without a named decision-authority
   226	SHOULD define one before adopting the schema.
   227	
   228	### 2.2 What constitutes a citable claim
   229	
   230	A *citable claim* is any statement of fact, constraint, decision,
   231	behavior, or requirement that an executor or verifier MUST rely on.
   232	Examples: counts, file paths, line numbers, owner directives,
   233	constraints, behavioral requirements, design decisions.
   234	
   235	### 2.3 What does NOT require citation
   236	
   237	The following SHALL NOT be flagged as missing citations:
   238	
   239	- **Section headers and document structure** — `## 1. Problem` is not
   240	  a claim.
   241	- **Editorial framing and transitions** — "The following sections
   242	  specify ...", "We now turn to ...".
   243	- **Restatements within a paragraph of an already-cited claim** —
   244	  one citation at the source statement; subsequent references in the
   245	  same paragraph or list inherit it.
   246	- **Definitions internal to the spec** — when the spec defines a
   247	  term, the definition does not need an external citation.
   248	- **References to other sections of the same document** — "see §7.6"
   249	  is not a claim.
   250	- **Pseudocode and reference algorithms** — line-level pseudocode

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/behavior/features/lint-citation-grammar.feature | sed -n '1,18p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
     1	Feature: Lint enforces citation grammar on SPEC artefacts
     2	  Per Gherkin conventions
     3	  (url://github.com/buildepicshit/agentic-installation-methodology/blob/main/research/primary-sources/cucumber-gherkin.md §3)
     4	  and the schema's citation grammar at
     5	  file://../../schema/SPEC.schema.md §2.
     6	
     7	  Background:
     8	    Given a repo with the framework's scripts/lint-spec.sh
     9	    And the schema at spec-bundle/schema/SPEC.schema.md
    10	
    11	  Scenario: Fact-bearing paragraph without citation prefix is rejected
    12	    Given a SPEC.md whose §1 Problem section makes a factual claim
    13	    And that claim has no citation prefix in scope
    14	    When the author runs `bash scripts/lint-spec.sh <path>`
    15	    Then the lint exits non-zero
    16	    And stderr contains "fact-bearing paragraph lacks citation prefix"
    17	
    18	  Scenario: Cited paragraph passes

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'file://\\.\\./|file://\\.\\./\\.\\./|file://["'^ ]*'"\\.\\.' spec-bundle specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:45:`file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:51:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:53:`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:72:  (`file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:167:  `file://../../../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:171:  `file://../../../agentic-installation-methodology/specs/2026-05-19-primary-source-research-corpus/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:182:- `file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:184:- `file://../../../agentic-installation-methodology/research/primary-sources/oci-artifacts.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:186:- `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:188:- `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:190:- `file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:192:- `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:194:- `file://../../../agentic-installation-methodology/research/primary-sources/nix-flakes.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:196:- `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:198:- `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:200:- `file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:241:(`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:355:  # file://../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md §3
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:364:   `file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:368:   (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:384:  `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:388:  (`file://../../../agentic-installation-methodology/research/primary-sources/structurizr-dsl.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:391:  `file://../../../agentic-installation-methodology/research/primary-sources/c4-model.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:395:  per `file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:405:  `file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:416:  `file://../../../agentic-installation-methodology/research/primary-sources/cucumber-gherkin.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:422:  (`file://../../../agentic-installation-methodology/research/primary-sources/openapi-3-1.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:435:  `file://../../../agentic-installation-methodology/research/primary-sources/helm-values-schema.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:445:`file://../../../agentic-installation-methodology/research/primary-sources/adr-nygard.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:462:Quality (`file://../../../agentic-installation-methodology/research/primary-sources/arc42.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:469:  (`file://../../../agentic-installation-methodology/research/primary-sources/12-factor.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:477:  (`file://../../../agentic-installation-methodology/research/primary-sources/symphony-spec.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:591:`file://../../../agentic-installation-methodology/specs/2026-05-19-codex-remediation-amendments/SPEC.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:754:  (`file://../../../agentic-installation-methodology/research/primary-sources/sigstore-cosign.md`
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1039:  under specs/ that referenced `file://schema/...`,
specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:1040:  `file://templates/...`, `file://skills/...` paths
spec-bundle/skills/cross-repo-informational-channel/SKILL.md:57:**Authority:** <source-repo@<sha> | file://... | decision-authority://role:date>
spec-bundle/decisions/INDEX.md:26:`file://../../specs/`).
spec-bundle/customization/contract.md:19:  (`file://../templates/`).
spec-bundle/customization/contract.md:24:  (`file://../schema/SPEC.schema.md` §2, §3).
spec-bundle/customization/contract.md:111:(`file://../skills/autonomous-issue-dispatch/SKILL.md`),
spec-bundle/customization/knobs.schema.json:5:  "description": "JSON Schema defining the customization knobs the framework defers to the adopter. Authority: file://../../specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md §6.2.4 and file://contract.md.",
spec-bundle/behavior/features/lint-citation-grammar.feature:5:  file://../../schema/SPEC.schema.md §2.
spec-bundle/deployment/install.md:32:#    file://../skills/agents-md-improver/SKILL.md
spec-bundle/deployment/install.md:45:(`file://../skills/cross-repo-policy-enforcement/SKILL.md`,
spec-bundle/deployment/install.md:46:`file://../skills/cross-repo-informational-channel/SKILL.md`)
spec-bundle/deployment/install.md:52:`file://../../scripts/fleet-*.example.txt` show the shape.
spec-bundle/architecture/CONTEXT.md:24:  (`file://../schema/SPEC.schema.md`).
spec-bundle/architecture/CONTEXT.md:26:  `file://../templates/`.
spec-bundle/architecture/CONTEXT.md:27:- A lint script (`file://../../scripts/lint-spec.sh`) that
spec-bundle/architecture/CONTEXT.md:29:- A skill catalog (`file://../skills/`) covering the
spec-bundle/architecture/CONTEXT.md:31:- Seven PreToolUse hooks (`file://../../hooks/`) enforcing
spec-bundle/architecture/CONTEXT.md:35:  (`file://../../tests/hooks/run-tests.sh`).
spec-bundle/architecture/CONTEXT.md:37:  (`file://../../examples/`).
spec-bundle/architecture/CONTEXT.md:38:- A CI workflow (`file://../../.github/workflows/ci.yml`)

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'file://<path>|repo-local|citation prefix|citation grammar' AGENTS.md spec-bundle/schema/SPEC.schema.md scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
scripts/lint-spec.sh:5:#   file://templates/SPEC.schema.md (citation grammar, RFC 2119
scripts/lint-spec.sh:372:# Pre-scan: count citation prefixes per section (for inheritance).
scripts/lint-spec.sh:447:    # Skip if paragraph contains a citation prefix.
scripts/lint-spec.sh:482:    #   (a) section already has >= 2 citation prefixes elsewhere, AND
scripts/lint-spec.sh:528:    emit_err "citation" "$first_line" "fact-bearing paragraph lacks citation prefix"
AGENTS.md:11:artefacts with citation grammar, RFC 2119 scoping rules,
AGENTS.md:90:citation prefix from the grammar:
AGENTS.md:92:- `file://<path>` — repo-local files.
spec-bundle/schema/SPEC.schema.md:147:(`spec-review`) and citation grammar remain REQUIRED; only the
spec-bundle/schema/SPEC.schema.md:222:**Precondition.** The citation grammar presumes the studio has a

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'canon_primary="/repo/spec-bundle/behavior/features"; for d in "/repo/spec-bundle/behavior/features" "/repo/spec-bundle/behavior/features/sub" "/repo/spec-bundle/behavior/features-sibling"; do if [[ "$d" != "$canon_primary" && "$d" != "$canon_primary"/* ]]; then printf '"'%s -> REJECT\\n' \""'$d"; else printf '"'%s -> ACCEPT\\n' \""'$d"; fi; done' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
/repo/spec-bundle/behavior/features -> ACCEPT
/repo/spec-bundle/behavior/features/sub -> ACCEPT
/repo/spec-bundle/behavior/features-sibling -> REJECT

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "test -f spec-bundle/schema/SPEC.schema.md && echo 'new schema path exists'; test "'! -e schema/SPEC.schema.md && echo '"'old schema path absent'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
new schema path exists
old schema path absent

exec
/home/linuxbrew/.linuxbrew/bin/bash -c 'for p in spec-bundle/templates/SPEC.task.template.md spec-bundle/templates/IDEA.template.md spec-bundle/templates/TASK.template.md; do test -f "$p" && printf '"'%s exists\\n' \""'$p"; done' in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
spec-bundle/templates/SPEC.task.template.md exists
spec-bundle/templates/IDEA.template.md exists
spec-bundle/templates/TASK.template.md exists

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "rg -n 'templates/(SPEC\\.task\\.template\\.md|IDEA\\.template\\.md|TASK\\.template\\.md)|test -f templates/SPEC\\.task\\.template\\.md|"'`templates/(IDEA|TASK)'"\\.template\\.md"'`'"' spec-bundle/schema/SPEC.schema.md" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
85:  - test -f spec-bundle/templates/SPEC.task.template.md
365:- Templates: `spec-bundle/templates/SPEC.task.template.md`,
369:  `spec-bundle/templates/IDEA.template.md`,
370:  `spec-bundle/templates/TASK.template.md`.

exec
/home/linuxbrew/.linuxbrew/bin/bash -c "nl -ba spec-bundle/schema/SPEC.schema.md | sed -n '80,90p;362,374p'" in /var/home/hasnobeef/buildepicshit/agentic-ops-framework
 succeeded in 0ms:
    80	risk: medium
    81	requires_network: false
    82	requires_secrets: []
    83	ideated_in: specs/2026-01-15-example-procedure-v1/IDEA.md
    84	acceptance_commands:
    85	  - test -f spec-bundle/templates/SPEC.task.template.md
    86	  - bash scripts/lint-spec.sh specs/<id>/SPEC.md
    87	---
    88	```
    89	
    90	### 1.3 Status state machine
   362	
   363	## 6. Cross-references
   364	
   365	- Templates: `spec-bundle/templates/SPEC.task.template.md`,
   366	  `spec-bundle/templates/SPEC.contract.template.md`,
   367	  `spec-bundle/templates/SPEC.decision.template.md`,
   368	  `spec-bundle/templates/SPEC.fastpath.template.md`,
   369	  `spec-bundle/templates/IDEA.template.md`,
   370	  `spec-bundle/templates/TASK.template.md`.
   371	- Lint script: `scripts/lint-spec.sh`.
   372	- Skill validator: `scripts/validate-skill-frontmatter.sh`.
   373	- Procedure-only skills: `spec-bundle/skills/verification/SKILL.md`,
   374	  `spec-bundle/skills/code-review/SKILL.md`, `spec-bundle/skills/release-pr/SKILL.md`,

codex
**Quality Gate Result**
```yaml
spec_path: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
type: contract
bar: c
pass: true
failures: []
```

No MAJOR-or-higher remaining issues found.

R5 closure check:
- Semantic-containment boundary: closed. [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:248) now uses equality-or-slash-prefix, so `features-sibling` no longer passes as inside `features/`.
- §174 stale schema cite: closed. [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:174) cites `file://spec-bundle/schema/SPEC.schema.md`, and the old `schema/SPEC.schema.md` path is absent.
- Bare `templates/*` paths from R5: closed in [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:85) and [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:365).

Verification run:
- `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`: pass, 0 errors, 0 warnings.
- `bash scripts/validate-manifest.sh`: pass, schema `2.1.0`, conformance `core`, 8 facets.
- `bash scripts/validate-skill-frontmatter.sh`: clean.
- Example SPEC/IDEA lint loop: pass.
- `node --check scripts/preflight.mjs` and `git diff --check`: pass.

I did not count `bash tests/hooks/run-tests.sh` as product evidence in this sandbox because `/tmp` is read-only here, so `mktemp` fails before the harness can create its hermetic repos.
tokens used
105,028
**Quality Gate Result**
```yaml
spec_path: specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md
type: contract
bar: c
pass: true
failures: []
```

No MAJOR-or-higher remaining issues found.

R5 closure check:
- Semantic-containment boundary: closed. [validate-manifest.sh](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/scripts/validate-manifest.sh:248) now uses equality-or-slash-prefix, so `features-sibling` no longer passes as inside `features/`.
- §174 stale schema cite: closed. [SPEC.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md:174) cites `file://spec-bundle/schema/SPEC.schema.md`, and the old `schema/SPEC.schema.md` path is absent.
- Bare `templates/*` paths from R5: closed in [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:85) and [SPEC.schema.md](/var/home/hasnobeef/buildepicshit/agentic-ops-framework/spec-bundle/schema/SPEC.schema.md:365).

Verification run:
- `bash scripts/lint-spec.sh specs/2026-05-19-v2-manifest-catalog-repack/SPEC.md`: pass, 0 errors, 0 warnings.
- `bash scripts/validate-manifest.sh`: pass, schema `2.1.0`, conformance `core`, 8 facets.
- `bash scripts/validate-skill-frontmatter.sh`: clean.
- Example SPEC/IDEA lint loop: pass.
- `node --check scripts/preflight.mjs` and `git diff --check`: pass.

I did not count `bash tests/hooks/run-tests.sh` as product evidence in this sandbox because `/tmp` is read-only here, so `mktemp` fails before the harness can create its hermetic repos.
