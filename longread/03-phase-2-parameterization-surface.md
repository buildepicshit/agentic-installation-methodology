# Chapter 03 — Phase 2: Parameterization Surface

## The deferral-contract question

Phase 1 hands Phase 2 a per-artefact facet inventory. The
question Phase 2 asks against that inventory is the
deferral-contract question: for each artefact and each
facet it serves, what does the spec parameterize — leave
to the installer to choose — and what does the spec
hard-code as intent? The split matters because it is the
boundary between reference architecture and solution
architecture: the reference part is universal; the
solution part is whatever the installer fills in. The
reference-vs-solution framing at
`research/primary-sources/ref-arch-vs-solution-arch.md`
§3 names this distinction in older terms; Phase 2 applies
the same line to the artefacts Phase 1 just classified.

## Two prior-art shapes

The research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 names two prior-art shapes for the parameterization
surface, and we worked from both.

The **single-file** shape is what the workpad §6 names
as Symphony's: a repo-owned configuration file the
upstream spec can read deterministically. Symphony's own
SPEC at `research/primary-sources/symphony-spec.md` §3
records a "§5 Workflow Specification (Repository
Contract)" as one of the 18 SPEC sections, so the
workflow-contract surface is there in the corpus; the
single-file framing specifically is the workpad's
characterisation. The strength of single-file is that
one file is easy to validate and easy to ship — a runner
knows where to look. The weakness is that the file has to
be a complete superset of every adopter's configuration
surface, and large surfaces strain the single-file
abstraction.

The **multi-file** shape is what package managers settled
on. `research/primary-sources/helm-values-schema.md` §3
shows Helm's `values.yaml` with a JSON-schema-validated
override surface: one schema, many overlays, validation at
install time. `research/primary-sources/nix-flakes.md` §3
shows Nix's `flake.nix` doing the same job hermetically —
inputs pinned, outputs reproducible, every flake a
canonical configuration unit. Both spread the
configuration surface across several files by design, so
that any one file stays small and the overall surface can
grow.

`research/primary-sources/12-factor.md` §3 sits beneath
both: its insistence on declarative config separate from
code is the principle either shape implements. Single-file
and multi-file are different topologies of the same idea.

## Where BES landed

We worked through the facet inventory from chapter 02 and
arrived at a distributed surface. The research workpad
§7 records the disposition directly: "Phase 2
parameterization surface: distributed (multiple
`fleet-manifest`-style configs are needed, not a single
one)." That sentence is the case study; the chapter
does not add to it. The distributed shape is closer to the
multi-file pattern than to single-file, but the workpad
does not name a specific prior-art template that BES
copied. What it names is the disposition.

## Phase 2 failure note (BES)

**What happened.** Workpad §6 names two shapes — single-
file and multi-file — and workpad §7 records BES landing
on a distributed multi-file surface.

**What we did.** We accepted the distributed shape per the
workpad §7 disposition. The chapter does not claim more
about what BES tried, only what BES adopted.

**What pattern generalizes.** `judgment://agent-synthesis`:
the parameterization shape is plausibly downstream of the
facet inventory rather than a free design choice — if
Phase 1 produces a hybrid table where artefacts span
multiple facets, the single-file shape struggles to carry
that, and a distributed surface fits more naturally.
This is synthesis, not a workpad-proven case-study claim;
later chapters or follow-on amendments may add citable
evidence to promote it.

---

**In the next chapter**: Phase 3 — the sanitization bar.
Given a per-artefact facet inventory and a
parameterization surface, what do we drop from the
published spec to avoid leaking studio context, and where
is the line between sanitization and rigor loss?
