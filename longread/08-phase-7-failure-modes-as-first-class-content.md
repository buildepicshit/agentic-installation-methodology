# Chapter 08 — Phase 7: failure modes as first-class content

## The Phase 7 question

The earlier seven chapters each carried their own
phase-local failure note. Phase 7 asks a different
question: once the methodology has shipped, what do
we owe a reader who wants to know what we got wrong
along the way? The LeadDev critique at
`research/primary-sources/leaddev-agent-compiled.md`
§3 frames the underlying risk: when every install
compiles a slightly different version from a shared
spec, incident response becomes archaeology. Phase 7
treats that risk seriously by publishing the failure
modes we encountered as content the reader can use,
not as errata buried in a changelog. The workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 names Phase 7 the methodology's novel addition;
this chapter is what novel addition means in practice.

## Per-chapter failure synthesis

The seven phase chapters each end with a failure note
in the three-element structure mandated by the
methodology Contract. Read together they form an
honest map of what BES, as the worked case study,
tried and where it landed.

Chapter 01 at `longread/01-phase-0-maturity-check.md`
records the conformance bar gap: we shipped Product A
v1 without an installer-facing conformance suite and
had to re-enter Phase 0 after the v2.0 repack made
the gap visible. The bar still belongs in Phase 0,
not Phase 4; the disclosure is the stopgap.

Chapter 02 at `longread/02-phase-1-facet-inventory.md`
records that the clean one-facet-per-artefact table
we expected did not exist. We accepted hybrid as the
output shape rather than cleaning it up; the honest
table is the table.

Chapter 03 at
`longread/03-phase-2-parameterization-surface.md`
records that BES landed on a distributed multi-file
parameterization surface, and that the parameter-
ization shape is plausibly downstream of the facet
inventory rather than a free design choice.

Chapter 04 at `longread/04-phase-3-sanitization-bar.md`
records the BES bar — drop ALL studio context;
generalize `owner://` → `decision-authority://<role>`
— and the lived difficulty of applying it: the line
between studio-context-as-evidence and studio-
context-as-leak is judgement, not algorithm.

Chapter 05 at
`longread/05-phase-4-manifest-catalog-compose.md`
records that we composed the manifest plus per-facet
sub-spec catalog with a reserved-conformance facet
declared in the manifest — disclosure rather than
omission or false completeness.

Chapter 06 at
`longread/06-phase-5-cross-family-validation.md`
records the same-family proxy performed in this
session and the strict cross-family pass still owed
per the parent Decision publication-gate binding at
`../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7.

Chapter 07 at `longread/07-phase-6-ship.md` records
the paired release shape — sanitized framework spec,
methodology longread, reserved conformance suite —
cross-linked and signed, with chapter 00's prior
disclosure of the outstanding cross-family gate held
intact.

## Cross-phase failure modes (BES catalogue)

Beneath the per-phase notes, four cross-phase
failure modes surfaced during the BES extraction.
Each is published here per the workpad §7 catalogue
at `../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§7 so an installer who attempts the methodology can
recognize them before hitting them.

### Fastpath zero-adoption

**What happened.** A BES internal audit reported in
the workpad §7 catalogue found that a sanctioned
fastpath through the spec lifecycle, designed to let
small fixes skip the full ceremony, saw zero adoption
across the spec corpus despite landing as policy.

**What we did.** The fact got published into the
workpad §7 catalogue rather than retracted; the
methodology Contract §6.5 binding turns that fact
into chapter content rather than internal-only
errata.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: a sanctioned shortcut that no
practitioner takes is a signal, not noise. Either the
shortcut solves a problem nobody actually has, or the
ceremony it bypasses already carries enough value
that the shortcut is structurally unattractive.
Either reading is information; what the methodology
publishes is the empirical zero-adoption fact, not a
preferred interpretation.

### Decomposition paper-only across 23 SPECs

**What happened.** A BES cross-family audit reported
in the workpad §7 catalogue found that the
decomposition phase was paper-only across 23 SPECs:
7 of 10 sampled SPECs missed durable per-slice task
emission entirely.

**What we did.** The audit finding became its own
workpad row rather than getting absorbed into
unrelated remediation; the methodology Contract §6.5
binding then carries it into this published
disclosure.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: a phase that exists in the
written methodology but does not run in practice is a
phase the methodology has not yet earned. Either the
phase needs a stronger gate that forces the work to
materialize, or the methodology is overclaiming a
phase it should mark optional. Publishing the gap is
the precondition for choosing.

### Workpad bootstrap gap

**What happened.** The source repository that
produced this methodology hit a workpad bootstrap gap
of its own: the workpad that organises Product B's
extraction was not present when the earliest related
SPECs were authored, and had to be retrofitted before
the methodology could be written down.

**What we did.** We retrofitted the workpad and
disclosed the bootstrap gap in the workpad §7
catalogue rather than treating it as project
hygiene. The methodology Contract §6.5 binding
carries the disclosure into chapter content.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: a methodology that requires a
workpad to author should plausibly include a workpad
bootstrap step inside Phase 0, not assume the workpad
exists. Discovering the gap inside the methodology
that names workpad as central is the kind of failure
worth publishing because future practitioners will
hit the same shape.

### Ceremony refactor questions

**What happened.** Four owner-blocking ceremony
refactor questions surfaced during the BES extraction
per the workpad §7 catalogue, each blocking forward
motion on the methodology shape until resolved.

**What we did.** Each was resolved in turn, with the
resolution recorded as an Open Question disposition
in the underlying SPECs rather than as an unwritten
agreement.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: a methodology with four
owner-blocking ceremony questions inside its own
authoring run is a methodology whose ceremony is
under-specified for unsupervised use. Publishing the
fact — four questions, each blocking — gives future
installers permission to expect their own equivalents
and to resolve them in their own context rather than
to assume the published methodology already settled
them.

## The seven open research questions

The four failure modes above are gaps we can name
because we hit them. The seven research questions
below are gaps the methodology cannot itself resolve;
each is flagged-open per the workpad §2.3 catalogue
at `../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§2.3. The methodology offers posture and procedure
that make these problems addressable; it does not
pretend they are solved.

1. **Exhaustiveness without prescription.** What
stops an exhaustive spec from over-constraining the
installer? What stops a non-prescriptive spec from
being under-specified? Per the corpus entry at
`research/primary-sources/ref-arch-vs-solution-arch.md`
§3, reference-architecture literature warns the
boundary is rhetorical, not technical; the
methodology inherits that warning.

2. **Ambiguity when agents cannot ask the developer.**
The workpad flags this as an open-question label:
without developer-in-the-loop, the methodology does
not yet answer who arbitrates when an agent
encounters a gap that statistically plausible
completions could fill multiple ways.

3. **Versioning and patching semantics.** What is the
meaning of a security patching event when every
install is a unique agent compilation? The shape of
patching changes when the artefact installers consume
is a spec, not a binary.

4. **Install-matches-intent verification.** How does
the user know the install matches the developer's
intent? Acceptance commands? Reference output?
Cryptographic spec signing? Chapter 07's signing
discussion gestures at the last; the methodology does
not yet pick.

5. **Equivalence classes of valid implementations.**
When are two agent-compiled outputs "the same
product"? Per the corpus entry at
`research/primary-sources/oracle-agent-spec.md` §3,
the Oracle Agent Spec hints at this within a narrow
domain; the methodology has no general answer.

6. **Empirical agent capability floor.** "Any
reasonably capable coding agent" is load-bearing in
the framing. The actual capability floor today is
demonstrable for greenfield within opinionated
stacks; the methodology does not demonstrate it for
arbitrary products.

7. **Adversarial spec consumption.** A published spec
is an attack surface — supply chain through
customization affordances; prompt injection inside
spec content; agent jailbreak during compilation.
The methodology flags the surface; it does not yet
characterize the defences.

## Phase 7 failure note (BES)

**What happened.** Per the workpad §6 Phase 7
framing, failure-modes-as-content is the
methodology's novel addition relative to the prior
art the parent Decision §7 cites.

**What we did.** This chapter published the four BES
cross-phase failure modes and the seven open research
questions as content rather than as appendix, per the
parent Decision §7 publication binding.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: failure-modes-as-content has its
own failure mode — what does not get caught in the
synthesis itself. A reader who finds a gap in this
catalogue that the catalogue does not flag is
finding the methodology's blind spot, which is the
behaviour Phase 7 is supposed to invite.

---

**In the next chapter**: This is the last chapter. The seven open research questions follow.
