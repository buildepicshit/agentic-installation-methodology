# Writing For Agents — Authoring Craft

Reference for authoring and editing **any document an agent consumes**: a
`SKILL.md` under `agents/skills/`, an `AGENTS.md` or `CLAUDE.md`, a
`WORKFLOW.md`, a `STATUS.md`, or any doc reached by a pointer from one of
them. The packaging differs; the writing does not — the same levers make
each one predictable. This is not itself a skill; it is the craft reference
the authoring process draws on. Companion to `SKILL_REGISTRY.md`.

Where a lever is skill-specific (frontmatter, the invocation choice, router
skills) it is marked as such. Everything else applies to every document
here.

**Provenance.** Adapted from `mattpocock/skills`
`skills/productivity/writing-great-skills` @ `d574778` (v1.1.0), per
`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md` §11 T4.
The **Negation** failure mode is adapted from that shipped skill. The
**Negative Space** failure mode is a **BES-original** contribution
(authored here 2026-07-08, inspired by the v1.1 CHANGELOG PR #463 prose):
it was advertised upstream but NOT shipped in any upstream file at
`d574778` — do not "reconcile" it to a phantom upstream entry.

Extended 2026-08-05 from the same reference, renamed upstream to
`skills/productivity/writing-for-agents` @ `8b36d4f` (v1.2.2), per
`file://specs/2026-08-05-pocock-v1-2-and-harness-parity/SPEC.md` S2:
**cache**, **sediment**, **sprawl**, and the **demand** half of the
completion criterion, plus the scope widening above — upstream stopped
scoping this to skills, and the fleet's always-loaded entry docs are
exactly where cache and sediment bite hardest.

## Root virtue: predictability

A skill exists to wrangle determinism out of a stochastic system.
**Predictability** — the agent taking the same *process* every run, not
producing the same *output* — is the root virtue; every lever below serves
it.

## Steering failure modes

### Negation — the elephant

Steering by prohibition backfires: *don't think of an elephant* names the
elephant and makes it more available, not less. A negation is a weak
modifier the strongly-activated concept overruns, so the ban half-reads as
an instruction to do the thing. **Cure:** prompt the **positive** — state
the target behaviour so the banned one is never spoken ("write one-line
comments", not "never write verbose comments"). Keep a prohibition only as
a hard guardrail you cannot phrase positively, and even then pair it with
the positive target so attention lands on what to do.

### Negative Space — the void *(BES-original)*

Blindness to the steering done by what you leave *out*. Every decision a
skill declines to make is not left neutral — it is delegated to the
agent's priors. An omitted rule is still a choice; you have simply handed
that choice to the model. **Cure:** read a draft for its *silences* — the
decisions it does not make — and decide each omission deliberately: either
fill it, or leave it open as a real, named **branch** the agent is meant
to resolve. Distinct from Negation: Negation is a wrong *presence*;
Negative Space is an unexamined *absence*.

## Leading words — recruit pretrained concepts

A **leading word** is a compact concept already living in the model's
pretraining (*grill*, *prototype*, *destination*, *frontier*). Repeated
through a skill it accumulates a distributed definition and anchors a whole
region of behaviour in the fewest tokens. It serves predictability twice —
anchoring *execution* in the body and *invocation* in the description. A
made-up word recruits no priors: you pay in definition tokens what a
pretrained word gives free. Reach for an existing word first.

## The no-op test — prune sentence by sentence

A **no-op** is a line the model already obeys by default; it spends context
without changing behaviour. Hunt no-ops sentence by sentence, not just line
by line. When a sentence fails the test, delete the whole sentence rather
than trim words from it — be aggressive. A weak leading word is itself a
no-op; the fix is a stronger word (*relentless*), not a different
technique.

## Invocation model — model-invoked vs user-invoked

- A **model-invoked** skill keeps a `description`, so the agent can fire it
  autonomously — but it contributes to **context load** every session.
- A **user-invoked** skill strips the description: zero context load, but
  it spends **cognitive load** — *you* are the index that must remember it
  exists.

Pick model-invocation only when the agent (or another skill) must reach the
skill on its own. If it only ever fires by hand, make it user-invoked and
pay no context load. A **router** skill cures piled-up cognitive load.

## Completion criterion — clarity and demand

Every step ends on a **completion criterion**: the condition that tells the
agent the work is done. Two properties make it a lever, and they are
independent.

**Clarity** — can the agent tell done from not-done? A vague bound
("understanding reached") invites **premature completion**: ending the step
before it is genuinely done, attention slipping to *being done*. The
visible steps still ahead supply the pull; the criterion's clarity is the
resistance.

Defend in that order: **sharpen the bound first**, because it is local and
cheap. Only if it is irreducibly fuzzy *and* you actually observe the rush,
hide the later steps by splitting the sequence — and hiding works **only
across a real context boundary** (a hand-off or a sub-agent dispatch). An
inline call leaves the later steps sitting in context and clears nothing,
so splitting for this reason without a boundary buys you nothing.

**Demand** — how much the criterion requires. "Every modified model
accounted for" forces thorough work where "produce a change list" does not.
Demand drives **legwork**: the digging the agent does *within* the work,
latent in the wording rather than written as its own step. It is not
step-bound — "every rule applied" binds a body of flat reference just as
"every step done" binds a sequence, which is how an all-reference document
still carries an exhaustiveness bar.

The strongest criteria are both checkable and exhaustive.

## Structure

- **Progressive disclosure.** Three rungs: in-skill step → in-skill
  reference → external reference behind a **context pointer**. Inline what
  every branch needs; push behind a pointer what only some branches reach.
  A pointer's *wording*, not its target, decides how reliably the agent
  follows it.
- **Co-location.** Keep a concept's definition, rules, and caveats under
  one heading, not scattered. (Distinct from duplication: duplication
  repeats one meaning in two places; scattering fragments one meaning
  across many.)
- **Sprawl.** The failure mode here is a document simply too long, even
  when every line is live and unique. Attention thins across the excess,
  and every extra line is one more to keep true. The cure is the ladder:
  disclose reference behind pointers, and split by branch or sequence so
  each path carries only what it needs.
- **Single source of truth.** State a rule once; cite it elsewhere. A rule
  restated in a second artefact is a rule that will be narrowed in one
  place and left standing in the other — the fleet has measured this
  repeatedly
  (`file://agents/governance/pocock-watch/triage-2026-08-05.md` §6).
- **Cache.** The **environment** is a source of truth too — `package.json`
  scripts, config files, the directory layout, `--help` output, the
  manifests. A document that restates it is a **cache**: a copy of a
  lookup, earning its load only when the lookup is expensive. Cache what
  the agent cannot find by looking — the unwritten convention, the reason
  behind a choice, the gotcha no config confesses — and leave the
  one-file, one-command lookups to the environment, where they cannot go
  stale.
- **Relevance.** For every line ask: does it still bear on what this
  document does? A line loses relevance by never bearing on the task, or
  by going stale as the world it describes changes. Shorter documents are
  easier to keep true.
- **Sediment.** Without a pruning discipline this is the default fate:
  stale layers that settle because adding feels safe and removing feels
  risky, until you must core down through them to find what is still live.
  Naming it is the point — sediment accumulates by a thousand individually
  reasonable additions, so it is never any one edit's fault.

## Fleet caveat

These are craft guidance for *authoring* skills, not a new lifecycle gate.
Fleet skill changes still originate in `bes-fleet-policy` and land through
the v1 SPEC procedure (`AGENTS.md` "Fleet Rule Origination"); the 15-skill
corpus is held constant (this reference is a doc, not a new skill).
