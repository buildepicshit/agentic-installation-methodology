# Chapter 00 — Introduction

> "Patching is no longer 'Deploy version 2.1.4' but 'Update
> the spec and hope every downstream compilation behaves
> consistently.'"
> — Lukaas Kruger, quoted in
> `research/primary-sources/leaddev-agent-compiled.md` §3.

## The hypothesis we are publishing as procedure

We shipped Product A as a public operating-framework
release, then repacked it into a manifest + catalog v2.0
bundle as the worked case study for Product B. That much is
done: the packaging is real and the studio discipline that
produced it is real. What remains gated is independent
user-with-agent installation from the bundle alone — a
cross-family validation pass by an installer who is not
us, with an agent that is not ours. That gate is the
methodology's outstanding obligation, named in the parent
Decision SPEC §7 of `../bes-fleet-policy/` and tracked as
Slice 5 of the Product B execution arc. We are honest
about it here because honesty about what is not yet proven
is part of the reader contract this longread commits to. The hypothesis
underneath all of this: a developer ships an exhaustive
intent specification; a user with a coding agent installs
from that specification locally; there is no
developer-in-the-loop support call. We do not consider this
hypothesis novel in invention. The closest published
prior-art statement comes from the LeadDev critique at
`research/primary-sources/leaddev-agent-compiled.md` §3,
which framed exactly this shape as risk — incident response
becomes an archaeology problem when every deployment
compiles a slightly different agent-built version from a
shared spec. We took the same shape and treated it as a
procedure to be done well, not a risk to be argued about.

## What this longread is

This is a published methodology document built around a
worked case study. We — BuildEpicShit, a small studio
shipping a portfolio of products — authored an agent
operating framework called Product A, published it under a
structural contract our agents and their installers can
read, and now publish this longread as Product B alongside
it. The longread is organised in eight phase chapters that
mirror the methodology's procedure, plus this introduction.
The phases run in order from the maturity check, through
facet inventory, parameterization surface, sanitization bar,
manifest + catalog composition, cross-family validation, and
ship, to publishing failure modes as content. We use BES as
the worked case study throughout — fully named, fully
attributed — because the case-study density is what lets a
careful reader check the methodology against what actually
happened rather than against what we wish had happened.
Naming the studio is the rolls-royce posture in
`owner://transcript-2026-05-18`.

## What this longread is not

This longread is not a prescription. It does not tell other
teams what they MUST do; it tells you what we did and what
broke when we did it. It does not resolve any of the seven
open research questions catalogued in our research workpad
at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§2.3 — those questions about exhaustiveness without
prescription, ambiguity arbitration, patching semantics,
intent verification, equivalence classes, capability floors,
and adversarial spec consumption are flagged open here
because they were open when we shipped and remain open as we
publish. This is also not a paper aimed at academic
channels. The register is engineering experiential: what we
tried, what worked, what failed, what we are still unsure
about.

## The reader contract

Three commitments shape every chapter that follows.

The first is **honest experience, not prescription**. We
report what BES did and what BES learned. When something
worked we say so; when something failed we name the failure
mode. We do not retrofit a coherent narrative onto a messy
process.

The second is **failure modes are first-class content**, not
errata. Every phase chapter surfaces the failure modes that
phase produced for us, and Chapter 08 synthesises them.
LeadDev's risk framing at
`research/primary-sources/leaddev-agent-compiled.md` §3 lives
inside this commitment: the risks they describe are real,
and naming them as procedure-content is how we publish them
as method rather than as warning.

The third is **corpus-citation discipline**. Every
methodology primitive in this longread cites a primary-
source corpus entry in
`research/primary-sources/<slug>.md §3` — never agent
memory, never a bare external URL, never a half-remembered
training claim. When a claim is BES-experiential we cite the
owner transcript or the SPEC that captured the decision;
when a claim is methodology-shape we cite a primary source.

## Reader roadmap

The eight phase chapters that follow each take one phase
of the methodology. Chapter 01 (Phase 0) is the maturity
check. Chapter 02 (Phase 1) is facet inventory. Chapter 03
(Phase 2) is the parameterization surface. Chapter 04
(Phase 3) is the sanitization bar. Chapter 05 (Phase 4) is
manifest + catalog composition. Chapter 06 (Phase 5) is
cross-family validation. Chapter 07 (Phase 6) is ship.
Chapter 08 (Phase 7) is failure modes as content. Each
phase chapter carries its own corpus citations for the
methodology primitives it introduces; chapter 00 names the
phases by title only and defers the primary-source corpus
anchors to the chapter that handles each phase.

A note on what is and is not in scope of this longread.
The SPEC bundle that ships alongside it — the Product A
manifest + catalog at v2.0 of the
`agentic-ops-framework` repo — carries the structural
contract installers consume. Its conformance facet is
declared `reserved` at v2.0 by deliberate disclosure; a
later release closes that gap. This longread carries the
prose that explains why the bundle is shaped that way and
what it cost to get there. They ship paired and they
cross-link; neither is sufficient alone.

---

**In the next chapter**: the maturity check. When is a
product ready to be published as a deployment-grade SPEC,
and what are the anti-signals that say it isn't?
