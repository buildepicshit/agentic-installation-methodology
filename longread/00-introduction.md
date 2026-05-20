# Chapter 00 — Introduction

> "Patching is no longer 'Deploy version 2.1.4' but 'Update
> the spec and hope every downstream compilation behaves
> consistently.'"
> — Lukaas Kruger, quoted in
> `research/primary-sources/leaddev-agent-compiled.md` §3.

## The hypothesis we tested in production

We shipped a real product to real users by writing a spec a
coding agent could install from, and then we did it again,
and then we wrote down what we learned. The hypothesis
underneath: a developer ships an exhaustive intent
specification; a user with a coding agent installs from that
specification locally; there is no developer-in-the-loop
support call. We do not consider this hypothesis novel in
invention. The closest published prior-art statement comes
from the LeadDev critique at
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

Chapter 01 (Phase 0) asks when a product is ready to be
published as a deployment-grade SPEC. Chapter 02 (Phase 1)
walks through the facet inventory that classifies every
artefact in the product by its intent role. Chapter 03
(Phase 2) covers the parameterization surface and the
deferral contract. Chapter 04 (Phase 3) is the sanitization
bar — dropping studio context without dropping rigor.
Chapter 05 (Phase 4) composes the manifest plus catalog
shape Product A ships in. Chapter 06 (Phase 5) is the
cross-family validation pass; Chapter 07 (Phase 6) covers
ship, cross-link, and signing; Chapter 08 (Phase 7) puts the
failure modes and the seven open research questions in front
of the reader as content, not errata.

A note on what is and is not in scope of this longread.
The SPEC bundle that ships alongside it — the Product A
manifest + catalog at v2.0 of the
`agentic-ops-framework` repo — carries the executable
contract for installers. This longread carries the prose
that explains why the bundle is shaped that way and what
it cost to get there. They ship paired and they cross-
link; neither is sufficient alone.

---

**In the next chapter**: the maturity check. When is a
product ready to be published as a deployment-grade SPEC,
and what are the anti-signals that say it isn't?
