# Chapter 01 — Phase 0: Maturity Check

## We published before we should have

The first time we tried to publish Product A as a
deployment-grade SPEC, we shipped a v1 of the
`agentic-ops-framework` repo without an installer-facing
conformance bar. The repo had a structural contract, a
skill catalog, a hook suite, a lint script, and internal
acceptance commands and CI that we trusted. What it did
not have was a way for an installer to know —
mechanically, without us answering an email — whether
their install of the framework was behaving correctly.
There were no installer-facing acceptance commands; no
reference outputs to diff against; no conformance profile
the installer could run. There was, in retrospect, no
Phase 0 at all in our process; we went straight from "we
built a useful thing" to "we will publish it." That was
the failure that made the rest of this methodology
necessary.

## The maturity question

The question we should have asked first is the one that
names this phase: when is a product mature enough to be
published as a deployment-grade SPEC? The risk if you
publish too early is exactly the one LeadDev's critique at
`research/primary-sources/leaddev-agent-compiled.md` §3
warned about — incident response becomes an archaeology
problem when every install is a slightly different
agent-compiled version of a shared, under-specified spec.
We walked into that risk by skipping the question.

## The four signals we learned to require

After re-entering Phase 0, we worked back from the failure
and arrived at four positive maturity signals, sourced
from the methodology's research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 (Phase 0 definition).

**Signal 1 — deployed enough times that the customization
surface is understood.** A product whose installers have
not yet stressed its configuration surface does not yet
know what it parameterizes vs hard-codes. Without that
knowledge, the spec cannot draw the deferral contract
Phase 2 will require.

**Signal 2 — failure modes characterized.** The team can
name the ways the product breaks under non-trivial use.
This is the precondition for the per-chapter failure
disclosure the longread Contract §6.5 requires; we cannot
publish failure modes we have not yet observed.

**Signal 3 — the developer can name 3-5 load-bearing
intent decisions, distinct from implementation accidents.**
We use Nygard's architecturally-significant-decision
criterion at `research/primary-sources/adr-nygard.md` §3
as one support for this distinction; the load-bearing-
vs-implementation-accidents framing itself comes from the
Phase 0 research workpad. Without the ability to separate
the load-bearing from the accidental, Phase 1's facet
inventory has no way to classify what to specify vs what
to leave to the installer.

**Signal 4 — an empirical conformance bar exists.** At
minimum, acceptance commands the developer trusts;
ideally, a conformance suite the installer can run
against their install. The shape closest to what we mean
is Symphony's three Conformance Profiles at
`research/primary-sources/symphony-spec.md` §3 (Core,
Extension, Real Integration), with executable acceptance
expressed in something like the Given/When/Then form at
`research/primary-sources/cucumber-gherkin.md` §3. Signal
4 is the one we missed.

## Three anti-signals

The corresponding anti-signals — each visible, in
retrospect, in our pre-v2.0 state:

**Anti-signal A — every install is bespoke.** If no two
installers can run the same install with the same outcome,
the product is not yet a thing one publishes; it is a
service one provides.

**Anti-signal B — the developer cannot articulate what's
wrong in a non-compliant install.** If you cannot say
"this install is broken because X is missing," you have
not yet characterized the conformance shape.

**Anti-signal C — the customization surface is to edit the source directly.** The deferral contract that Phase 2 produces is the opposite of source edits; if installers are expected to fork and edit, you have not yet reached the maturity bar this phase guards. We had not reached it; we shipped a structural contract that, for any non-trivial customization, still required reading the source and patching by hand.

## Phase 0 failure note (BES)

**What happened.** We published Product A v1 without an
installer-facing conformance bar — Signal 4 missing. We
had internal acceptance commands and CI checks the
developers trusted, but no conformance suite an installer
could run against their install, and no reference outputs
to diff against. Per
`research/primary-sources/leaddev-agent-compiled.md` §3,
that is exactly the shape that turns installs into
archaeology.

**What we did.** We re-entered Phase 0 after the v2.0
manifest+catalog repack made the conformance gap visible.
The v2.0 bundle declares the `conformance` facet
`reserved` — an honest disclosure that the bar exists in
the schema but the suite is not yet authored. The
disclosure is a stopgap, not the bar itself; the bar
remains unbuilt at v2.0 and is owed to a later release.

**What pattern generalizes.** The conformance bar belongs
in Phase 0, not in Phase 4. If you reach Phase 4
(manifest + catalog composition) and find you cannot name
the conformance shape, you have not yet finished Phase 0,
regardless of how complete the other artefacts feel. The
order-of-operations matters because Phase 4 cannot
recover what Phase 0 did not establish — manifest schema
fields like `conformance.status: reserved` can disclose
the gap, but they do not close it. The lesson we took
from this is to fail Phase 0 explicitly rather than fail
quietly into the later phases.

---

**In the next chapter**: Phase 1 — facet inventory. Once
the maturity bar is satisfied, how do you classify every
artefact in the product by its intent role?
