---
slug: nix-flakes
source_name: "Nix Flakes — flake.nix + flake.lock"
primary_url: "https://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake"
fetched_via: "WebFetch"
fetched_on: 2026-05-19
fetch_outcome: "primary-read-complete"
fetch_evidence: "primary URL at nixos.org redirected to nix.dev/manual/...; fetched canonical content with flake.nix structure + flake.lock semantics verbatim"
methodology_relevance: |
  Nix flakes are research §5.1's "strongest reproducible-
  from-spec primitive." This corpus entry anchors the
  flake.nix file structure, the flake.lock content-hash
  model, and Nix's reproducibility guarantees so the
  methodology can cite the flake model precisely when
  prescribing the deployment/ sub-spec's reproducibility
  contract.
---

# Nix Flakes

## 1. Source identity

- Name: Nix flakes — the unit for packaging Nix code
  reproducibly.
- Canonical URL: `url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
  (note: the older `url://nixos.org/manual/...` redirects
  to nix.dev as of fetch date).
- Specification authority: NixOS RFCs (RFC 49 for flakes
  proposal); current implementation in `nix` CLI.

## 2. Fetch trace

- `cmd://WebFetch url://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake`
  — 2026-05-19; returned 302 redirect to nix.dev.
- `cmd://WebFetch url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`
  — 2026-05-19; primary read; returned flake definition,
  flake.nix structure, flake.lock semantics, repro
  guarantees.

## 3. Verbatim claims this corpus depends on

- **Flake definition**: a flake is "a filesystem tree
  (typically fetched from a Git repository or a tarball)
  that contains a file named `flake.nix` in the root
  directory." (`url://nix.dev/manual/nix/stable/command-ref/new-cli/nix3-flake`)

- **flake.nix attributes**:
  - `inputs` — an attrset specifying dependencies,
    mapping input names to flake references. "Each input
    is fetched, evaluated and passed to the `outputs`
    function as a set of attributes with the same name
    as the corresponding input."
  - `outputs` — a function receiving an attribute set of
    input flake outputs, returning Nix values the flake
    provides.
  - `description` — one-line summary.

- **Per-input metadata** passed to `outputs`:
  - `outPath` — store path of the source tree.
  - `rev` — commit hash if applicable.
  - `lastModified` — commit time, seconds since epoch.
  - `narHash` — SHA-256 hash in SRI format.

- **flake.lock** is "a UTF-8 JSON file" containing "a
  graph structure isomorphic to the graph of
  dependencies of the root flake." Per-node fields:
  - `inputs` — dependency mappings.
  - `original` — unlocked specification from flake.nix.
  - `locked` — resolved specification with exact
    revision and `narHash`.
  - `flake` — boolean (flake vs non-flake dep).

- **Reproducibility guarantee**: Nix automatically
  generates and maintains flake.lock. Locked
  specifications contain exact revisions and content
  hashes. "When we build this flake, the input
  `nixpkgs` is mapped to revision [specific hash]."
  Furthermore: "lock files transitively lock direct as
  well as indirect dependencies."

## 4. Fact-link to methodology

<!-- lint-ok: no-citation -->

Nix flakes operationalize "reproducible-from-spec" at the
strongest current level: content-addressed inputs +
transitive lock + reproducible outputs. Key shape
implications for the methodology's deployment/ sub-spec:

- The deployment/ sub-spec MAY adopt a flake-style
  inputs/outputs structure as the contract shape: inputs
  are the declared dependencies (the spec's deferral
  contract); outputs are the materialized deployment
  artefacts.
- The flake.lock content-hash model is a strong
  primitive for "two installs produce the same build
  outputs"; the methodology's equivalence-classes open
  question (research §2.3.5) can cite Nix as one
  concrete example of equivalence-by-construction. (The
  claim that Nix is "the strongest" reproducibility
  primitive in the field is a comparative
  `judgment://agent-synthesis`, not licensed by Nix's
  own documentation; methodology prose should frame Nix
  as "an example" rather than "the strongest" without
  separate comparative evidence.)
- The transitive-lock property — every direct and
  indirect dependency pinned — is the methodology's
  posture for the SPEC bundle's manifest: every cited
  sub-spec is pinned by content hash, not version range.

## 5. Downstream-citation surface

<!-- lint-ok: no-citation -->

Methodology claims licensed by this entry (cite as
`file://research/primary-sources/nix-flakes.md §3`):

- methodology-claim: "Nix flakes ship a two-file model:
  flake.nix (declarative inputs + outputs) and flake.lock
  (resolved + content-hashed dependency graph)."
- methodology-claim: "flake.lock provides transitive
  pin-by-content-hash; rebuild reproducibility holds
  across direct and indirect dependencies."
- methodology-claim: "Nix's reproducibility model is one
  concrete implementation of build-from-spec; the
  methodology cites it as an example of equivalence-
  class-by-construction. (Earlier 'strongest current
  implementation' framing removed per codex Round-2
  finding 2.9 FAIL — comparative ranking is
  judgment://agent-synthesis not licensed by Nix
  documentation; the §4 caveat is now reflected here
  for consistency.)"
- methodology-claim: "The methodology's deployment/
  sub-spec MAY mirror flake's inputs/outputs shape,
  treating inputs as the deferral contract and outputs
  as the deployment artefact set."

## 6. Open questions surfaced by the primary read

- Nix flakes are still officially "experimental" in
  stable Nix releases; the methodology should
  acknowledge this when prescribing flake-style inputs/
  outputs as a deployment-spec shape.
- Whether Nix's content-hash reproducibility generalises
  to non-Nix language ecosystems (Helm? OCI? container
  images built outside Nix?) is an open methodology
  question. The methodology MAY recommend Nix-like
  reproducibility WITHOUT mandating Nix as the
  underlying substrate.
- The relationship between flake.lock and OCI image
  content-addressing is a useful methodology comparison
  point — Nix has filesystem-tree hashes; OCI has
  layer-digest hashes. Different content addressing
  models with similar reproducibility guarantees.
