# Chapter 06 — Phase 5: Cross-Family Validation

## The cross-family validation question

Phase 4 produced a sanitized, composed manifest + per-
facet sub-spec catalog. Phase 5 asks the one question
that no amount of structural rigor can answer
internally: does this thing actually install for
somebody who isn't us? The risk that makes this question
non-optional sits in
`research/primary-sources/leaddev-agent-compiled.md`
§3 — when every install compiles a slightly different
agent-built version of the same spec, "did the installer
get what we intended" stops being a yes/no question and
becomes an archaeology problem. Cross-family validation
is the mitigation: take the spec to a different model
family — Codex instead of Claude, Gemini instead of
Codex — point it at the published bundle, and see what
breaks. The parent Decision SPEC at
`../bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
§7 is explicit that same-family proxy "MUST NOT
substitute" for the strict different-family pass. A
different Claude lane is a proxy, not the gate.

## The walkthrough pattern

The research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§6 Phase 5 names the pattern directly: a different-
family agent attempts to deploy the product using only
the published spec; the methodology authors surface
where the spec was under-specified or assumed too much
and document the gap report. The shape closest to what
a walkthrough actually exercises is
`research/primary-sources/cucumber-gherkin.md` §3's
Given/When/Then form — installer encounters a stated
precondition, attempts the action the spec names,
observes whether the expected outcome appears. The
gap report is the diff between expected and observed,
attributed back to spec sections rather than to
installer error. Symphony's conformance-profile shape
at `research/primary-sources/symphony-spec.md` §3 sits
under the same idea at a higher level: the spec
declares conformance points; the walkthrough exercises
them. The workpad's "re-implement in 5 languages"
phrase (workpad §6) is the framing — but the framing
is the workpad's, not the corpus entry's. The corpus
entry supports the conformance-profile pattern; the
re-implement framing is the methodology's reading of
how that pattern applies to operating-model
installation.

## Where BES landed

The research workpad at
`../bes-fleet-policy/specs/2026-05-17-agentic-installation-methodology/RESEARCH.md`
§7 records the BES Phase 5 disposition plainly:
"same-family proxy performed in this session (per SE2);
strict cross-family deferred to owner-triggered
external run." Same-family proxy means another Claude
lane — same model family, different session, no shared
working memory — attempts to read the bundle and
surface gaps. It catches structural problems and
inconsistencies. What it cannot catch is the class of
gap that comes from a different model family's
reading: where Codex stumbles over phrasing Claude
glides through, where Gemini interprets an instruction
Claude takes for granted. The strict cross-family pass
is owed; the same-family proxy is the stopgap while
the strict pass is queued. Per parent Decision §7's
publication-gate binding, that owed pass is the
methodology's outstanding obligation before formal
publication.

## Phase 5 failure note (BES)

**What happened.** Workpad §7 records the BES Phase 5
disposition as "same-family proxy performed in this
session (per SE2); strict cross-family deferred to
owner-triggered external run." The parent Decision §7
publication-gate binding means the strict cross-family
pass is owed; the same-family proxy does not satisfy
the gate.

**What we did.** We performed the same-family proxy
during this session; the strict cross-family pass
remains owed per the parent Decision publication-gate
binding. Chapter 00 records the outstanding gate as
the methodology's honest gap.

**What pattern generalizes.** `judgment://agent-synthesis`;
NOT workpad-proven: same-family proxy is a stopgap,
not the bar. The paired-artefact shape (sanitized spec
bundle + fully-attributed longread) lets installers
know what is and is not yet validated. A methodology
that ships paired with its own disclosure of which
gates it has and has not satisfied is closer to honest
than one that conflates internal validation with
external installation evidence. Chapter 00's prior
disclosure at `longread/00-introduction.md` already
named this; chapter 06 is where it gets the structural
treatment it owes.

---

**In the next chapter**: Phase 6 — ship + cross-link
+ sign. With Phase 5 honestly disclosed as
outstanding, how do we ship the paired artefacts so
installers know what they're getting and can verify
they got what we shipped?
