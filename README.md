# agentic-installation-methodology

**Status: v0.1 scaffold — no methodology content yet.**

This repo will, in time, publish a methodology for taking any
working product and decomposing it into an exhaustive but
non-prescriptive deployment-grade SPEC bundle that
user-dispatched coding agents can install, customize, and
operate locally — without a developer-in-the-loop support
loop.

The methodology is **agentic installation**: developers
publish an exhaustive intent SPEC instead of a binary, image,
or repo; user-with-agent installs from that SPEC on their own
terms; the ownership split between developer and user-with-
agent is explicit and contractual.

## What ships here, eventually

A paired release:

1. **Engineering longread** — first-person experiential
   methodology narrative; case-study density; failure modes
   as first-class content.
2. **Authoritative SPEC bundle** — front-door manifest plus
   per-facet sub-specs (architecture, deployment, behavior,
   customization, decisions, quality, operations, non-goals)
   that demonstrate the manifest+catalog packaging the
   methodology advocates.

The worked case study is **agentic-ops-framework** — the BES
operating framework — repacked into manifest+catalog as the
example "before" / "after" pair.

## What is here right now (v0.1 scaffold)

Nothing yet except procedural discipline ported verbatim from
the sibling repo
[`agentic-ops-framework`](https://github.com/buildepicshit/agentic-ops-framework)
v1.1:

- `schema/SPEC.schema.md` — front-matter, citation grammar,
  RFC 2119 conventions, status state machine.
- `templates/` — IDEA, four SPEC types (task / contract /
  decision / fastpath), TASK templates.
- `scripts/lint-spec.sh` — per-type quality-gate lint.
- `scripts/validate-skill-frontmatter.sh` — skill frontmatter
  validator (no skills yet, vacuous PASS).
- `hooks/` — seven hooks enforcing studio discipline.
- `tests/hooks/run-tests.sh` — 33-case hermetic hook test
  harness.
- `.github/workflows/ci.yml` — CI runs lint + frontmatter +
  hook tests on every push.
- `specs/2026-05-18-repo-standup/SPEC.md` — the inaugural
  internal SPEC capturing this scaffold standup work.
- `CONTRIBUTING.md` + `CODE_OF_CONDUCT.md` — how to
  contribute under the IDEA → SPEC → review → approve →
  execute → verify lifecycle.
- `LICENSE` — Apache-2.0.

## Authority

The repo is bound by the parent Decision SPEC at
`bes-fleet-policy/specs/2026-05-18-agentic-installation-methodology/SPEC.md`
(status: verified), which enumerates the slices that author
this repo's content (repack, longread, SPEC bundle,
cross-family validation pass) and the rolls-royce dispositions
the published artefacts must honour.

## Posture

The methodology is offered as honest experience, not as
prescription. The seven open research questions from the
research workpad are flagged as unresolved; the methodology
helps address them, it does not pretend to solve them.

Failure modes encountered while extracting the methodology
from the studio's internal practice are published as
first-class case data, not buried.

## Licence

Apache-2.0 — see `LICENSE`.
