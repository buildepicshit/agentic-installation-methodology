# Chapter 04 — Phase 3: The Sanitization Bar

## The sanitization-bar question

Phase 2 closed the parameterization surface: the spec
knows what it parameterizes versus what it hard-codes.
Phase 3 asks the next question against the same artefacts:
of the parts the spec hard-codes, which ones go out the
door, and which ones stay home? The line is the
reference-vs-solution line that
`research/primary-sources/ref-arch-vs-solution-arch.md`
§3 names. Reference architecture is universal — it lives
in the published spec. Solution architecture is the
studio-specific filling — it stays where it was. Phase 3
is the practice of drawing that line carefully enough to
publish.

## Three sanitization moves

The methodology's research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 3 names three moves.

**Move 1: drop studio context from the spec body.** No
studio name, transcripts, internal SPEC IDs in the
published artefact. The principle is the same separation
`research/primary-sources/12-factor.md` §3 makes between
config and code — the studio's identity is config; the
spec is code. Mixing them defeats the spec as a
publishable artefact.

**Move 2: use studio experience as evidence frame.**
First-person "we tried this and X happened" instead of
authoritative "you must do this." The published spec
cites the studio as the experience source without
borrowing the studio's authority. This is the
explanation-mode posture in
`research/primary-sources/diataxis.md` §3 — distinct from
the reference-mode the spec body occupies.

**Move 3: document preconditions for the spec's
assumptions.** Every assumption the spec rests on becomes
an explicit declaration the installer must make — trust-
boundary declarations, environment guarantees, security
postures. The
`research/primary-sources/sigstore-cosign.md` §3
provenance posture — sign what you ship and let
downstream verify — is the same shape: explicit
declarations the installer's environment makes load-
bearing. Sanitization isn't only about what gets dropped;
it's also about what gets named explicitly that used to
be implicit.

## The asymmetry

Product A is the spec bundle — the
`agentic-ops-framework` repo. Workpad §7 records the BES
Phase 3 disposition for Product A directly: "drop ALL
studio context per `owner://transcript-2026-05-17`;
generalize `owner://` → `decision-authority://<role>`."
That is the sanitization contract Product A lives under.

Product B is this longread you are reading. The parent
Decision SPEC at
`../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7 disposition Q4 names BES throughout, with full
transparency, as the worked case study. That is a
different sanitization contract.

This asymmetry is load-bearing. Product A is sanitized
because installers need a spec they can adopt without
inheriting BES context. Product B (the longread) names
BES throughout because the case-study density is the
methodology's check against bullshit — if we cannot say
what we did concretely, we cannot say that the
methodology has been used. The two artefacts ship paired,
not because one is incomplete without the other, but
because they discharge different obligations. Product A
gets full transparency about its sanitization; Product B
gets full transparency about its case study.

## Phase 3 failure note (BES)

**What happened.** Workpad §7 records the BES bar as
"drop ALL studio context per `owner://transcript-
2026-05-17`; generalize `owner://` →
`decision-authority://<role>`."

**What we did.** We adopted the bar and applied it to
Product A's spec body.

**What pattern generalizes.** `judgment://agent-synthesis`:
"drop ALL" is easier to state than to apply. The line
between studio-context-as-evidence (chapter Move 2's
permitted frame) and studio-context-as-leak (Move 1's
prohibition) is judgement, not algorithm. A
sanitization pass that lints out every BES mention will
also lint out the experience-as-evidence framing the
methodology depends on. The bar holds because the
practitioner reading the published spec can tell the
difference; the bar fails when the practitioner cannot.

---

**In the next chapter**: Phase 4 — manifest + catalog
composition. Given a sanitized spec body, how do we
shape it as a front-door manifest plus per-facet sub-
specs that an installer-with-agent can navigate?
