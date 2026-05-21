# STATE — methodology arc, 2026-05-21 close-out

Session closed out for the night. Morning pickup notes below.

## What converged today

- **T-01 chapter 00 introduction**: closed. R5 SPEC + R2
  prose CONVERGENCE-PASS. 946 prose words. Status: closed.
- **T-02 chapter 01 Phase 0 maturity check**: verified.
  R2 SPEC + R2 prose CONVERGENCE-PASS. Two amendments in
  §17 Amendment Log: R1 prose remediation (3 MAJOR
  findings closed) + Amendment 2 (padding-for-budget
  trim under explicit owner directive). 822 prose words.
  Status: verified (owner-only flip to closed pending).
- **Soft-floors amendment** (parent Decision §7 + longread
  Contract §6.2/§8.2/§9.2 + validator): 12 000 upper
  bound stays ENFORCED (anti-bloat); 8 000 lower bound
  demoted to ADVISORY only. Per-chapter targets also
  advisory. Per-chapter maxima still enforced.

## Convergence trajectory comparison

| Slice | SPEC rounds | Prose rounds | Total |
|---|---:|---:|---:|
| T-01 | 5 (7→4→4→1→0) | 2 (2→0) | 7 |
| T-02 | 2 (4→0) | 2 (3→0+gov→0) | 4 |

T-02 converged ~2× faster than T-01. Lessons compound.

## Parent Decision §7 slice queue

```
Slice 1   (repo standup)            ─────────────────  verified ✓
Slice 1.5 (primary-source corpus, 22 sources)         verified ✓
Slice 2   (Product A v2.0 repack)   ─────────────────  verified ✓
Slice 3   (longread structure Contract)               in-execution
                                                          (3 amendments
                                                           landed during
                                                           T-01 + T-02 +
                                                           soft-floors)
Slice 3.1 (T-01 chapter 00 introduction)              closed ✓
Slice 3.2 (T-02 chapter 01 Phase 0)                   verified (close pending)
Slice 3.3-3.9 (chapters 02-08)                        next
Slice 4   (per-facet SPEC bundle content for Product B) — not yet
Slice 5   (external cross-family validation pass)       not yet
```

## Where the longread sits

- 2/9 chapters published.
- Total prose: 1 768 words (946 + 822).
- Per-chapter target sum so far: 1 600 (800 + 800).
  Above target.
- Under soft-floors regime, the 8 000 lower bound on the
  whole longread is advisory, so target tracking is
  reference only.

## Next move when picking up

The natural next slice is **T-03 chapter 02 — Phase 1
facet inventory** (Slice 3.3). Per longread Contract §6.1
the chapter title is "Classifying every artefact by
facet"; per §6.2 target 1 000 words / max 1 300; per
§6.3 first-person voice; per §6.4 corpus-citation; per
§6.5 three-element failure note.

Corpus anchors that may support Phase 1 primitives:
- `research/primary-sources/arc42.md` §3 (architecture
  documentation by viewpoints).
- `research/primary-sources/c4-model.md` §3 (per-level
  decomposition).
- `research/primary-sources/diataxis.md` §3 (four-type
  documentation classification).
- `research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 (reference vs solution split).
- Research workpad §6 Phase 1 definition (seven facets:
  architecture, deployment, behavior, customization,
  decisions, operations, non-goals).

Authoring procedure per the v1 procedure + T-01/T-02
patterns:

1. Author IDEA at
   `specs/2026-05-{N}-longread-chapter-02-phase-1-facet-inventory/IDEA.md`.
2. Author Task SPEC; apply T-01 R1-R5 + T-02 R1 lessons
   upfront (path-base normalization, ideated_in,
   requires_network, mechanically-runnable T-evidence,
   AC ↔ T parity, corpus-citation strictness, §6.5
   three-element rule, §6.6 attribution posture,
   chapter-strict mode in acceptance_commands).
3. Codex SPEC pass; iterate to PASS.
4. Execute (author chapter prose) WITHOUT padding-for-
   budget pressure (soft-floors regime).
5. Codex prose pass; iterate to PASS.
6. Verify; fill Completion Report.
7. Owner closes.

## Parking-lot follow-ups (acknowledged-and-deferred)

- **Corpus-citation lint extension** (codex R1 T-02
  surfaced again as a manual reviewer concern). A
  follow-on Task SPEC for
  `scripts/validate-corpus-citations.sh` would
  mechanically enforce what is currently manual
  reviewer judgment.
- **v1.2 corpus expansion candidates**: SPDX, Pact,
  CUE, Dev Container Spec, SLSA/in-toto. Documented in
  corpus SPEC §17 Q4.
- **v2.1 release tag** for `agentic-ops-framework`:
  manifest schema bumped to 2.1.0 on main; v2.0.0
  release tag stays at v2.0.0 schema. Cut v2.1 release
  when ready.
- **Editorial polish drift**: every future edit
  introduces new stale-text occurrences in adjacent
  sections. Property of edited documents; codex cross-
  family review per major slice catches it.

## Pattern-level spec evidence accumulated today

1. **Padding-for-budget violates the honest-experience
   contract.** Word-count floors enforced mechanically
   on experiential prose create the failure mode the
   methodology was trying to prevent. Same-day fix:
   soft-floors amendment + chapter trim. Asymmetric
   enforcement is the right design — ceilings ENFORCED
   (bloat is dishonest), floors ADVISORY (length-for-
   its-own-sake is also dishonest).
2. **Cross-family review surfaces what same-family
   review misses on prose-truth.** SPEC-level codex
   caught structural issues. Prose-level codex caught
   the over-claim (chapter 00 "tested in production
   with real users") and the wrong-anchor citations
   (chapter 01 spec-kit/openspec → symphony/gherkin).
   Both classes are content-truth, not structure.
3. **Lessons compound.** T-02 converged ~2× faster than
   T-01 because R1-R5 + prose R1-R2 lessons were
   applied upfront. Per-chapter helper scripts pay
   back: authoring a small chapter-strict helper costs
   minutes but mechanically catches content-shape
   failures.
4. **Amendments need Amendment Log subsections.**
   Codex R2 on T-02 chapter 01 caught the §17
   Completion Report had stale evidence (830 words,
   spec-kit citations) post-fix. Same pattern from T-01
   arc: §X.0 Amendment Log + historical evidence call-
   out keeps the review trail honest under post-verify
   amendments.
5. **Owner directives operationalise into machine
   gates within hours.** "Just do whats right here"
   (2026-05-21 morning) → T-02 SPEC + chapter
   converged. Tonight's "an honest mistake is an
   opportunity to learn" + grant of explicit permission
   → soft-floors amendment + chapter 01 trim within
   the same close-out session. The arc shows the loop
   is tight enough that owner posture becomes durable
   gate behavior fast.

## Commits durable on origin

All three repos: clean working tree, branches at HEAD =
origin/main.

- `bes-fleet-policy` — soft-floors amendment to parent
  Decision §7 + §14.0 Amendment Log entry.
- `agentic-ops-framework` — no changes today.
- `agentic-installation-methodology` — T-01 closure, T-02
  authoring + verification + closure-pending, soft-floors
  amendment to longread Contract + validator, chapter 01
  trim, this STATE.md.

## What was deliberately NOT done this session

- **T-02 owner-close flip** (verified → closed) — owner-
  only.
- **T-03 chapter 02 authoring** — tomorrow.
- **Slice 4 SPEC bundle content** — not yet.
- **Slice 5 external cross-family validation** — Phase 5
  obligation, owed to a later release.
- **v2.1 release tag** for Product A — held.
- **Corpus-citation lint extension** — parking-lot.

Goodnight.
