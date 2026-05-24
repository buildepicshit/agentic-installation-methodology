# STATE — methodology arc, 2026-05-23 close-out (V1 complete)

V1 of the methodology longread is complete: nine
chapters authored under the v1 BES spec-first
procedure with cross-family codex review on each
chapter SPEC and each chapter prose. V2 ideation
seeded.

## What converged this session

- **T-08 chapter 07 Phase 6 ship**: closed
  (verified → closed owner-approved; SPEC R1→R2 2
  rounds; prose R1→R2 2 rounds; 702 words).
- **T-09 chapter 08 Phase 7 failure modes as
  first-class content**: verified, pending owner
  close. SPEC R1→R4 4 rounds; prose R1→R2 2 rounds;
  1441 prose words.
- **V2 IDEA seeded**: cellular automata named as V2
  primitive; IDEA at
  `bes-fleet-policy/specs/2026-05-23-methodology-v2-cellular-automata/IDEA.md`;
  status `owner-blocking` on slice / shape / sources
  / timing.

## V1 longread shape (9 chapters complete)

| Slice | Chapter | SPEC rounds | Prose rounds | Words |
|---|---|---:|---:|---:|
| T-01 | 00 introduction | 5 | 2 | 946 |
| T-02 | 01 Phase 0 maturity | 2 | 2 | 822 |
| T-03 | 02 Phase 1 facets | 4 | 2 | 573 |
| T-04 | 03 Phase 2 params | 2 | 2 | 595 |
| T-05 | 04 Phase 3 sanitize | 2 | 2 | 617 |
| T-06 | 05 Phase 4 manifest | 6 | 2 | 789 |
| T-07 | 06 Phase 5 cross-fam | 4 | 3 | 669 |
| T-08 | 07 Phase 6 ship | 2 | 2 | 702 |
| T-09 | 08 Phase 7 failures | 4 | 2 | 1441 |

Longread total: 7154 prose words across 9 chapters.

## T-09 helper-tightening trajectory

T-09 SPEC review converged the hardest because the F2
row's structural binding required four iterations
before it could not be defeated by re-arrangement:

| Round | Defect class closed |
|---|---|
| R1 | §6.5 three-element enforcement absent on cross-phase modes |
| R2 | F2 marker counts decoupled from per-mode disclosure |
| R3 | Combined `### Cross-phase modes` subsection satisfied all four anchors |
| R4 | CONVERGENCE-PASS (anchor-in-heading-line + body-triplet + distinct-heading-per-anchor) |

Durable lesson: when a SPEC promises "mechanical
per-X enforcement," the helper MUST bind to a
structural primitive that cannot be re-arranged
around. Loose-grep + counts always leaves a
re-arrangement loophole.

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
Slice 3.7 (T-07 ch 06 Phase 5)          closed ✓ (669 w)
Slice 3.8 (T-08 ch 07 Phase 6)          closed ✓ (702 w)
Slice 3.9 (T-09 ch 08 Phase 7)          verified, pending owner close (1441 w)
Slice 4   (per-facet SPEC bundle content) parking-lot
Slice 5   (external cross-family validation) parking-lot
```

## Outstanding obligations preserved across chapters

- The strict cross-family validation pass (real
  external user-with-agent install) remains owed per
  parent Decision §7 publication-gate binding;
  disclosure preserved across chapters 00, 06, 07,
  and 08.
- The conformance facet remains `reserved` per
  chapter 01's disclosure; status unchanged.

## V2 (next research arc, separate)

Owner directive: V1 ships solid on its own; V2 is a
separate SPEC arc. Seed primitive `cellular automata`
named verbatim, further detail withheld. IDEA at
`bes-fleet-policy/specs/2026-05-23-methodology-v2-cellular-automata/IDEA.md`
status `owner-blocking` on Q1 (slice), Q2 (shape),
Q3 (sources), Q4 (timing). Prior-art research
completed in-session and folded into IDEA §2.

## Pickup notes

Open work for owner:
- Flip T-09 SPEC `verified → closed` after
  spec-evidence-governance pass.
- Direct V2 IDEA shape via §6 Open Questions Q1-Q4.
