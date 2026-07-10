# Skill Authoring Craft

Reference for authoring and editing BES fleet skills (the `SKILL.md`
files under `agents/skills/`). This is not itself a skill — it is the
craft reference the skill-authoring process draws on. Companion to
`SKILL_REGISTRY.md`.

**Provenance.** The principles below are adapted from `mattpocock/skills`
`skills/productivity/writing-great-skills` @ `d574778` (v1.1.0), per
`file://specs/2026-07-08-pocock-v1.1-alignment-rebaseline/SPEC.md` §11 T4.
The **Negation** failure mode is adapted from that shipped skill. The
**Negative Space** failure mode is a **BES-original** contribution
(authored here 2026-07-08, inspired by the v1.1 CHANGELOG PR #463 prose):
it was advertised upstream but NOT shipped in any upstream file at
`d574778` — do not "reconcile" it to a phantom upstream entry.

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

## Completion criterion — checkable + exhaustive

Make a skill's done-condition **checkable** — can the agent tell done from
not-done? — and, where it matters, **exhaustive**. A vague criterion
invites **premature completion**: the agent stops early because nothing
told it what "done" demands.

## Structure

- **Progressive disclosure.** Three rungs: in-skill step → in-skill
  reference → external reference behind a **context pointer**. Inline what
  every branch needs; push behind a pointer what only some branches reach.
  A pointer's *wording*, not its target, decides how reliably the agent
  follows it.
- **Co-location.** Keep a concept's definition, rules, and caveats under
  one heading, not scattered.
- **Single source of truth.** State a rule once; cite it elsewhere.
- **Relevance.** For every line ask: does it still bear on what the skill
  does? If not, cut it.

## Fleet caveat

These are craft guidance for *authoring* skills, not a new lifecycle gate.
Fleet skill changes still originate in `bes-fleet-policy` and land through
the v1 SPEC procedure (`AGENTS.md` "Fleet Rule Origination"); the 15-skill
corpus is held constant (this reference is a doc, not a new skill).
