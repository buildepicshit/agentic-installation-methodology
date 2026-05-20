# STATE — methodology arc, 2026-05-20 close-out

Session closed out for the night. Morning pickup notes below.

## What converged

Six rounds of codex (gpt-5.5, xhigh) cross-family review on the
three Contract SPECs that bind Product B:

| SPEC | Repo | Latest | R6 verdict |
|---|---|---|---|
| Parent Decision | `bes-fleet-policy` | `16f9c8d` | PASS — no MAJOR-or-higher |
| Primary-source corpus | this repo | `4d8c2f7` | PASS — no MAJOR-or-higher |
| v2.0 repack (Product A) | `agentic-ops-framework` | `05ad7a5` | PASS — no MAJOR-or-higher |

Convergence trajectory: 27 → 17 → 10 → 9 → 7 → **0** findings.
~1M tokens of codex review across 18 runs + 6 synthesis docs.
Review evidence at `reviews/codex-2026-05-19{,-round2,-round3,-round4,-round5,-round6}/`.

The methodology arc is **substantively ready for forward motion**.

## Parent Decision §7 slice queue

```
Slice 1   (repo standup)            ─────────────────  verified ✓
Slice 1.5 (primary-source corpus, 22 sources, 3 partial-with-notes)
                                    ─────────────────  verified ✓
Slice 2   (Product A v2.0 repack)   ─────────────────  verified ✓ — v2.0.0 released
                                                          (manifest schema is v2.1.0
                                                           in main; v2.1 release tag
                                                           pending)
Slice 3   (longread structure Contract) ─────────────  in-execution
                                                          (validator authored;
                                                           chapters not yet)
Slice 3.1-3.9 (per-chapter Task SPECs + execution) ──  next
Slice 4   (per-facet SPEC bundle content for Product B) — not yet
Slice 5   (external cross-family validation pass)   ─  not yet
```

## Next move when picking up

The natural next slice is **T-01 chapter 00 introduction**
(Slice 3.1). Per longread Contract §7.1 authoring sequence,
chapter 00 is authored first (lower cognitive load; sets the
frame for everything else).

Author path: `longread/00-introduction.md`. Target 800 words,
max 1100. First-person experiential voice (see longread
Contract §6.3, with the Phase-0 voice exception added in
Round 1 remediation). Citation discipline: every methodology
primitive cites `file://research/primary-sources/<slug>.md
§3`, not agent memory or external URLs.

Authoring procedure per parent v1 procedure:

1. Author a Task SPEC at
   `specs/2026-05-20-longread-chapter-00-introduction/SPEC.md`
   with front-matter `cites_contract: 2026-05-20-longread-structure`.
2. SPEC lint → owner approves → execute (author the chapter
   prose) → re-run `scripts/validate-longread-structure.sh` →
   chapter file present + word count within in-progress bounds
   → spec-review → owner approves → verified.

## Parking-lot follow-ups (acknowledged-and-deferred)

These were surfaced during codex review and accepted as
not in scope of any active slice yet:

- **Corpus-citation lint extension** (codex R1 finding 4.2;
  tracked in remediation Contract §7.G): Task SPEC for
  `scripts/validate-corpus-citations.sh` OR a corpus-mode
  flag on `scripts/lint-spec.sh`. Until this lands, AC-8 of
  the longread Contract + §7.1 of the corpus Contract remain
  manual-reviewer-enforced.
- **v1.2 corpus expansion candidates**: SPDX, Pact, CUE, Dev
  Container Spec, SLSA/in-toto. Documented in corpus SPEC §17
  Q4 (marked resolved at v1.1 with these as v1.2-pending).
- **v2.1 release tag** for `agentic-ops-framework`: manifest
  schema bumped to 2.1.0 on main; v2.0.0 release tag stays
  at v2.0.0 schema (the tag was cut before the schema bump).
  Cut v2.1 release when ready; release tooling should
  populate `source_commit` + `source_tag` at tag time.
- **Editorial polish drift**: every future edit introduces
  new stale-text occurrences in adjacent sections. This is a
  property of edited documents, not a defect to be eliminated.
  Accept it; codex-style cross-family review per major slice
  is the loop that catches it.

## Pattern-level spec evidence from six review rounds

1. **Cross-family review is the gate that distinguishes
   well-formed-and-citable from well-formed-and-bullshit.**
   Same-family Claude review passed all three SPECs on the
   first attempt; codex caught 70 substantive findings over
   6 rounds. The "deep research, not bullshit" directive of
   2026-05-18 was operationalised by this iteration loop.
2. **Cross-family review is iterative, not one-shot.**
   Each round catches what previous rounds missed. Scope
   decreases per round but doesn't reach zero quickly.
3. **Amendments need a per-target stale-text audit before
   verified-flip.** Sections that reference the amended
   sections drift; bulk sed misses sibling occurrences;
   front-matter and body inconsistencies are the dominant
   carry-through class.
4. **Machine gates must verify what their SPECs claim.**
   R1 caught an acceptance command that didn't verify;
   R2-R5 progressively caught a validator that didn't
   enforce → didn't enforce containment → didn't enforce
   boundary. SPEC text + machine gate drift was the
   recurring BLOCKER class.
5. **Honest disclosure beats fake convergence.** Several
   findings (provenance fields, partial source status,
   amendment log) closed not by faking populated values
   but by explicit documentation of the empty / partial /
   amended state.

## Commits durable on origin

All three repos: `git status` clean, branches at HEAD =
origin/main, working trees match remote. Nothing in flight.

## What was deliberately NOT done this session

- **v2.1 release tag** on agentic-ops-framework — held until
  owner directs; the schema bump is durable in main.
- **Slice 3 chapter authoring** — paused at validator;
  per-chapter Task SPECs are the next step.
- **Slice 4 SPEC bundle content** — per-facet sub-spec content
  authoring not yet started.
- **Slice 5 external cross-family validation** — methodology
  Phase 5 against the published Product A bundle; deferred
  until methodology content lands.

Goodnight.
