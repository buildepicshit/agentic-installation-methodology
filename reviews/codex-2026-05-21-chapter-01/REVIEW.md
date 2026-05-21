# Codex cross-family review — Chapter 01 prose

Reviewer: codex-cli 0.129.0 (gpt-5.5, xhigh reasoning)
Mode: read-only content-quality review
Date: 2026-05-21
Target: `longread/01-phase-0-maturity-check.md` (830
prose words)

## Verdict

SEVERITY: MAJOR. Not ready for verified+closed as
drafted.

Chapter 01 has the right shape, voice, and Phase 0 signal
set, and the mechanical chapter checks pass. The
remaining problems are citation-truth and failure-note
honesty: the conformance-bar claim is anchored to corpus
entries that do not actually support it, and the BES
failure note turns an unresolved conformance gap into
"the bar."

## BLOCKER

None.

## MAJOR findings

### Finding 1 — conformance-bar citation not supported by corpus
Severity: MAJOR
Citation: `longread/01-phase-0-maturity-check.md:62-69`

Signal 4 says an installer-runnable conformance suite
follows from Spec Kit and OpenSpec. Those corpus entries
do not support that claim. Spec Kit supports
"specifications become executable" in an authoring-time
workflow; OpenSpec supports propose/apply/archive plus a
verify command. Neither says "installer can run a
conformance suite against their install."

Better anchors:
- `research/primary-sources/symphony-spec.md` §3
  (Symphony's three Conformance Profiles — Core,
  Extension, Real Integration).
- `research/primary-sources/cucumber-gherkin.md` §3
  (Gherkin as a language for executable specifications
  with Given/When/Then assertion structure).

Recommendation: cite Symphony for conformance profiles
and Cucumber/Gherkin for executable acceptance, or
narrow the sentence to what Spec Kit/OpenSpec actually
license.

### Finding 2 — failure note blurs real checks, conformance, and unresolved remediation
Severity: MAJOR
Citation: `longread/01-phase-0-maturity-check.md:5-17`,
`...:90-104`

The chapter says there were "no acceptance commands an
installer could run" and later says the v2.0 reserved
conformance disclosure "is the bar." The evidence
supports a narrower failure: Product A v1.0 had internal
acceptance/CI checks, but did not have an installer-
facing conformance suite or reference outputs. Product A
v2.0 still declares conformance `reserved`; disclosure
makes the gap visible, but it is not an empirical
conformance bar.

Recommendation: rewrite the failure note to say BES made
the conformance gap explicit in v2.0, not that it closed
or satisfied the bar. "Disclosure is a stopgap" is
accurate; "disclosure is the bar" is not.

### Finding 3 — Nygard over-attributes load-bearing-vs-accidents distinction
Severity: MAJOR
Citation: `longread/01-phase-0-maturity-check.md:52-60`

Nygard supports recording architecturally significant
decisions, but the corpus entry does not state the
methodology's "load-bearing intent decisions vs
implementation accidents" distinction. That distinction
comes from the Phase 0 research workpad; Nygard is a
supporting lens, not the origin.

Recommendation: change "This distinction is Nygard's"
to "We use Nygard's architecturally significant decision
criterion as one support for this distinction."

## MINOR

None.

## Advisory

Mechanical checks all PASS:
- lint-spec
- validate-longread-structure (in-progress + chapter 01)
- check-chapter-01-phase-0-signals
- check-chapter-01-failure-note

Voice and chapter-00 coherence are good. Forward pointer
correctly targets chapter 02 / Phase 1 facet inventory.

## Truthfulness table

| Chapter claim | Source | Matches? | Notes |
|---|---|---:|---|
| Phase 0 has four positive + three anti-signals | research workpad §6 | Y | Signal set matches. |
| LeadDev archaeology risk | leaddev-agent-compiled §3 | Y | Correctly cited. |
| Nygard owns load-bearing vs accidents distinction | adr-nygard §3 | **PARTIAL** | Nygard supports architecturally-significant decisions, not the full distinction. |
| Spec-Kit / OpenSpec support installer conformance suite | spec-kit, openspec §3 | **NO** | Wrong anchors for conformance. |
| Product A v1 had no conformance bar | Product A v1/v2 evidence | Y | But "no acceptance commands" is too broad. |
| v2.0 disclosure is the conformance bar | manifest/changelog/spec | **NO** | Reserved disclosure is not an empirical bar. |
| Chapter 01 inherits chapter 00 reader contract | chapter 00 | Y | Does not restate heavily. |
| Next chapter is Phase 1 facet inventory | Contract §6.1 / §7.1 | Y | Correct. |

tokens used: 268,031
