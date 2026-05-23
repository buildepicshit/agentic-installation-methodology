# STATE — methodology arc, 2026-05-23 close-out

Session closed out for the night. Morning pickup notes
below.

## What converged today

- **T-05 chapter 04 Phase 3 sanitization bar**: closed.
- **T-06 chapter 05 Phase 4 manifest+catalog**: closed
  (SPEC R1→R6 6 rounds; prose R1→R2 2 rounds; 789 words).
- **T-07 chapter 06 Phase 5 cross-family validation**:
  verified (owner-approved close pending). SPEC R1→R4
  4 rounds; prose R1→R3 3 rounds. 669 words.

Today's session: 6 chapters total made it through verify
or close (00 closed, 01 closed, 02 closed, 03 closed,
04 closed, 05 closed, 06 verified-pending-close).

## Convergence trajectory across slices

| Slice | SPEC rounds | Prose rounds | Chapter words |
|---|---:|---:|---:|
| T-01 ch 00 | 5 | 2 | 946 |
| T-02 ch 01 | 2 | 2 | 822 |
| T-03 ch 02 | 4 | 2 | 573 |
| T-04 ch 03 | 2 | 2 | 595 |
| T-05 ch 04 | 2 | 2 | 617 |
| T-06 ch 05 | 6 | 2 | 789 |
| T-07 ch 06 | 4 | 3 | 669 |

T-06 was slowest (authority-fence wording class). T-07
applied the T-06 R6 explicit-authority-source-list
block from the start — but section renumbering created
its own new stale-text class (4 rounds vs 2). Lesson
for T-08: do NOT renumber existing sections when
adding new ones.

## Parent Decision §7 slice queue

```
Slice 1   verified ✓
Slice 1.5 (corpus, 22 sources) verified ✓
Slice 2   (Product A v2.0)     verified ✓
Slice 3   (longread Contract)  in-execution
Slice 3.1 (T-01 ch 00 intro)            closed ✓ (946 w)
Slice 3.2 (T-02 ch 01 Phase 0)          closed ✓ (822 w)
Slice 3.3 (T-03 ch 02 Phase 1)          closed ✓ (573 w)
Slice 3.4 (T-04 ch 03 Phase 2)          closed ✓ (595 w)
Slice 3.5 (T-05 ch 04 Phase 3)          closed ✓ (617 w)
Slice 3.6 (T-06 ch 05 Phase 4)          closed ✓ (789 w)
Slice 3.7 (T-07 ch 06 Phase 5)          verified (close pending)
Slice 3.8 (T-08 ch 07 Phase 6)          next
Slice 3.9 (T-09 ch 08 Phase 7)          last chapter
Slice 4   (per-facet SPEC bundle content)  not yet
Slice 5   (external cross-family pass)     not yet
```

## Where the longread sits

- 7/9 chapters published.
- Total prose: **5 011 words** (~42% of 12k ceiling).
- 2 chapters remain: 07 Phase 6 ship + 08 Phase 7
  failure modes.

## Next move when picking up

**T-08 chapter 07 — Phase 6 ship + cross-link + sign**
(Slice 3.8). Per longread Contract §6.1: "Shipping the
SPEC bundle separately; cross-linking; signing." Per
§6.2: target 800 words (advisory under soft-floors),
max 1 000 (enforced) — the second-smallest budget.

Phase 6 substance per research workpad §6:
- Framework spec ships standalone (Product A)
- Methodology paper ships standalone (Product B)
- Conformance suite ships as a versioned bundle
- Each cites the other; article(s) cite both

BES Phase 6 per workpad §7: "paired release of Product
A and Product B."

Corpus anchors:
- sigstore-cosign §3 (signing)
- oci-artifacts §3 (versioned bundle shape)
- cyclonedx-sbom §3 (SBOM as provenance)
- spec-kit §3 (spec-as-deployment-grade)

Authoring procedure (applying T-06/T-07 lessons):
1. Author IDEA + Task SPEC + 2 helpers
2. KEEP §6 = Authority Map standard slot — do NOT
   renumber sections (T-07 lesson)
3. Authority-source-list block in §6 from the start
4. Helper requires corpus FILE PATHS in same
   paragraph (paragraph-co-occurrence pattern)
5. Failure note: strict fact-vs-synthesis; explicit
   bold markers; judgment://agent-synthesis tag
6. Execute under soft-floors (no padding pressure)
7. Codex SPEC pass; codex prose pass; verify; close

## Pattern-level spec evidence accumulated today

1. **Authority-fence wording is high-iteration class.**
   T-06 took 6 rounds chasing it. T-07 applied T-06 R6
   block upfront but introduced a new class (section
   renumbering creates stale-text). Lesson: ship
   Authority Map as standard §6; never renumber.
2. **Recurring E2-drifts-into-synthesis pattern**.
   Across chapters 02 / 03 / 04 / 05 / 06 prose-codex
   passes, every chapter had at least one MAJOR
   finding where E2 imported synthesis content into
   the workpad-grounded fact section. Authoring
   contract enforced by helper bold-marker check;
   still requires manual reviewer judgement of where
   each sentence belongs.
3. **Soft-floors regime durable through 5 consecutive
   sub-target chapters** (chapters 02 + 03 + 04 + 05
   + 06: 573 / 595 / 617 / 789 / 669). No padding
   pressure surfaced.
4. **Phase 5 chapter is the methodology's load-
   bearing honesty chapter**. Chapter 00 disclosed
   the gate; chapter 06 operationalised it. The
   paired-artefact + chapter 00 + chapter 06 trio is
   how the methodology owns its outstanding gap.

## Parking-lot follow-ups

- Corpus-citation lint extension
- v1.2 corpus expansion (SPDX, Pact, CUE, Dev
  Container, SLSA/in-toto)
- v2.1 release tag for agentic-ops-framework
- External Slice 5 cross-family validation pass

## Commits durable on origin

All three repos clean + synced.

- bes-fleet-policy @ `175866c` (no changes today)
- agentic-ops-framework @ `05ad7a5` (no changes today)
- agentic-installation-methodology @ `14ea64f` (T-07
  verified; T-08 close-out commit landing now)

## What was deliberately NOT done

- T-07 owner-close (just landing now)
- T-08 chapter 07 Phase 6 — tomorrow
- T-09 chapter 08 Phase 7 — after T-08
- Slice 4 SPEC bundle content — later
- Slice 5 external validation — Phase 5 obligation

Goodnight 🌙
