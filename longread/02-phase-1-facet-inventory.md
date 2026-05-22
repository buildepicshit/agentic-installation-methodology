# Chapter 02 — Phase 1: Facet Inventory

## What classification is for

Once Phase 0 says a product is mature enough to publish,
Phase 1 asks a different question: what does the product
actually consist of, and what role does each piece play?
The deliverable of this phase is a per-artefact
classification table. That table is the precondition for
Phase 2's deferral contract — the decision about what the
spec parameterizes versus what it hard-codes can only be
drawn against a list of artefacts whose intent roles are
already named. Facet-driven documentation is well-trodden
ground: arc42's viewpoint shape at
`research/primary-sources/arc42.md` §3 is the prior-art
template, and the C4 model's per-level decomposition at
`research/primary-sources/c4-model.md` §3 carries the
same idea in a different register. We did not invent the
pattern; we used it.

## The seven facets

The methodology's facet inventory uses seven categories,
each with a one-sentence intent role.

**Architecture** covers the product's domain model —
what entities exist, what relations bind them, what
invariants hold. **Deployment** covers the substrate the
product runs on or installs into. **Behavior** covers the
behavior contract — what the product does, observable to
its users, in terms specific enough for a conformance
suite to test. **Customization** covers the affordances
the product exposes to its installers — what they tune,
what stays fixed. **Decisions** covers the decisions and
their rationale — the load-bearing intent choices Phase 0
already enumerated, now recorded as artefacts the spec
ships. **Operations** covers the operational story —
observability, failure handling, safety boundaries.
**Non-goals** covers the non-goals — what the product
explicitly does not do, per facet, so installers know
where they are on their own.

The seven facets are the methodology's classification
vocabulary. They are not a hierarchy and not a workflow;
they are an axis along which every artefact gets named.

## What we found when we classified Product A

When we ran the inventory against Product A, we worked
in three buckets per the research workpad §7
disposition: **generalizable** (things any adopting team
carries forward unchanged), **studio-specific** (things
that named or assumed BES in ways another studio could
not pick up), and **mixed** (the long tail in between).
The bucket split was useful as a coarse sorting axis.

What it did not give us was a clean one-facet-per-
artefact mapping. The workpad calls this out plainly:
"output: a per-artefact classification table, often
hybrid (one artefact serves multiple facets)." We
confirmed it. Artefacts did not fit cleanly into one
facet — many served multiple facets at once.

## Phase 1 failure note (BES)

**What happened.** Classifying every artefact by facet
produced hybrid output per the workpad's anticipated
shape. The clean one-facet-per-artefact table we
expected to hand to Phase 2 did not exist; what existed
was a table where many artefacts landed in more than
one facet row.

**What we did.** We accepted hybrid as the output
shape, not as a defect to be cleaned up. The honest
table is the table.

**What pattern generalizes.** `judgment://agent-synthesis`:
forcing one facet per artefact is the anti-pattern.
Categorize honestly even when honesty means an artefact
lands in two or three facet rows. The downstream phases
can consume a hybrid table; what they cannot consume is
a clean table that misrepresents what the product
actually is.

---

**In the next chapter**: Phase 2 — the parameterization
surface. Given a per-artefact facet inventory, how do
you draw the line between what the spec parameterizes
and what it hard-codes?
