---
slug: helm-values-schema
source_name: "Helm Charts — values.yaml + values.schema.json"
primary_url: "https://helm.sh/docs/topics/charts/"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "fetched Helm docs/topics/charts/; Chart.yaml + values.yaml + schema validation behaviour confirmed"
methodology_relevance: |
  Helm values schemas are research §4.1's closest-in-
  practice analogue for the methodology's customization-
  affordances facet ("comes closest in practice but describes
  what is configurable, not what compositional patterns
  exist"). This corpus entry anchors the Chart structure,
  the values-vs-schema split, and the validation lifecycle
  so the methodology can cite Helm precisely when comparing
  customization grammars.
---

# Helm Charts — values.yaml + values.schema.json

## 1. Source identity

- Name: Helm Charts documentation.
- Canonical URL: `url://helm.sh/docs/topics/charts/`.
- Maintainer: Helm project (CNCF Graduated).
- Version: as of v3.3.2 onward, Chart.yaml is strict
  about additional fields.

## 2. Fetch trace

- `cmd://WebFetch url://helm.sh/docs/topics/charts/` —
  2026-05-19; returned Chart.yaml fields, values.yaml +
  values.schema.json relationship, validation behaviour.

## 3. Verbatim claims this corpus depends on

- **Chart definition** (`url://helm.sh/docs/topics/charts/`):
  "A chart is a collection of files that describe a
  related set of Kubernetes resources."

- **Chart.yaml** is mandatory; carries metadata:
  `apiVersion` (required), `name` (required), `version`
  (SemVer 2, required), plus optional `description`,
  `type`, `keywords`, `home`, `sources`, `dependencies`,
  `maintainers`, `icon`, `appVersion`, `deprecated`,
  `annotations`. As of v3.3.2: "additional fields are
  not allowed. The recommended approach is to add
  custom metadata in `annotations`."

- **values.yaml** provides default configuration; users
  override via `--set` or custom YAML files at install /
  upgrade time.

- **values.schema.json** implements JSON Schema
  validation against `values.yaml`. The schema is the
  contract describing "the expected structure and
  constraints on configuration parameters."

- **Schema validation lifecycle**: validation occurs
  during `helm install`, `helm upgrade`, `helm lint`,
  `helm template`. "The final `.Values` object is
  checked against _all_ subchart schemas."

- **Bypass mode**: `--skip-schema-validation` exists
  "particularly useful in air-gapped environments with
  remote schema references."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Helm's schema-bound customization is the closest published
prior art for the methodology's customization-affordances
facet. Key shape implications for the methodology's
customization/ sub-spec design:

- A two-file split — defaults (values.yaml) and contract
  (values.schema.json) — is reusable for the methodology's
  customization grammar.
- Validation lifecycle hooks (install/upgrade/lint/
  template equivalents) give the customization contract
  enforcement surface.
- Bypass mode (`--skip-schema-validation`) is a meaningful
  precedent: the methodology MAY want a "permissive mode"
  for cases where the installer knows better than the
  schema.
- The gap research §4.1 identified — "Helm values schemas
  come closest in practice but describe what is
  configurable, not what compositional patterns exist" —
  is now anchored against Helm's actual surface: Helm's
  schema is per-field validation, not per-composition
  validation. The methodology's deferral contract IS
  about composition-level deferrals.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/helm-values-schema.md
§3`):

- methodology-claim: "Helm charts split customization
  surface across values.yaml (defaults) + values.schema.json
  (JSON Schema validation contract)."
- methodology-claim: "Schema validation runs at install,
  upgrade, lint, and template stages — multi-stage
  validation lifecycle."
- methodology-claim: "Helm's customization grammar is
  per-field validation; it does not natively model
  compositional patterns or named reference profiles —
  this is the gap the methodology's customization facet
  closes."
- methodology-claim: "Helm provides a bypass mode for
  air-gapped scenarios — a precedent for permissive-mode
  installation in the methodology's deferral contract."

## 6. Open questions surfaced by the primary read

- JSON Schema (the underlying validation language Helm
  values.schema.json uses) is a separate primary source
  that may merit its own corpus entry if the methodology's
  customization facet specifies a particular JSON Schema
  draft. Currently treated as in-scope of the
  helm-values-schema entry; revisit if methodology pins
  a specific draft (2020-12, etc.).
- Helm's `--skip-schema-validation` flag's behaviour with
  multi-chart deployments — does it skip ONLY the top
  chart's schema or all subcharts? Not verified in this
  pass; flag for follow-on if methodology adopts a
  similar bypass model.
- Helm's relationship to OCI artifact registries (Helm
  charts can be pushed/pulled via OCI as of v3) is
  cross-referenced in the `oci-artifacts` corpus entry.
