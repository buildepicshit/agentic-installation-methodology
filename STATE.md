# STATE — methodology arc, 2026-05-22 close-out

Session closed out for the night. Morning pickup notes
below.

## What converged today

- **T-02 chapter 01 Phase 0 maturity check**: closed.
- **T-03 chapter 02 Phase 1 facet inventory**: closed
  (SPEC R1→R4 4 rounds; prose R1→R2 2 rounds; 573 words
  first sub-target chapter under soft-floors).
- **T-04 chapter 03 Phase 2 parameterization surface**:
  verified (owner-approved close pending). SPEC 2
  rounds; prose 2 rounds. 595 words.

Total session work: 8 commits on origin/main; 2/4
chapters added since morning pickup.

## Convergence trajectory comparison

| Slice | SPEC rounds | Prose rounds | Total | Chapter words |
|---|---:|---:|---:|---:|
| T-01 ch 00 | 5 (7→4→4→1→0) | 2 (2→0) | 7 | 946 |
| T-02 ch 01 | 2 (4→0) | 2 (3→0+gov→0) | 4 | 822 |
| T-03 ch 02 | 4 (2→1→1→0) | 2 (1→0) | 6 | 573 |
| T-04 ch 03 | 2 (2→0) | 2 (2→0) | 4 | 595 |

T-04 was faster than T-03 because R1-R3 lessons on
prohibition wording + helper paired-anchor + soft-
floors all landed clean upfront. Prose codex still
catches the over-attribution class every time.

## Parent Decision §7 slice queue

```
Slice 1   (repo standup)            ─────────────────  verified ✓
Slice 1.5 (primary-source corpus, 22 sources)          verified ✓
Slice 2   (Product A v2.0 repack)   ─────────────────  verified ✓
Slice 3   (longread structure Contract)                in-execution
                                                          (3 amendments
                                                           landed; soft-
                                                           floors regime
                                                           active)
Slice 3.1 (T-01 chapter 00 introduction)               closed ✓ (946 w)
Slice 3.2 (T-02 chapter 01 Phase 0)                    closed ✓ (822 w)
Slice 3.3 (T-03 chapter 02 Phase 1)                    closed ✓ (573 w)
Slice 3.4 (T-04 chapter 03 Phase 2)                    verified (close pending)
Slice 3.5-3.9 (chapters 04-08)                         next
Slice 4   (per-facet SPEC bundle content for Product B)  not yet
Slice 5   (external cross-family validation pass)       not yet
```

## Where the longread sits

- 4/9 chapters published.
- Total prose: **2 936 words** (~25% of 12k ceiling
  under soft-floors).
- 5 chapters remain: 04 Phase 3 (sanitization bar) +
  05 Phase 4 (manifest + catalog) + 06 Phase 5 (cross-
  family validation) + 07 Phase 6 (ship) + 08 Phase 7
  (failure modes as content).

## Next move when picking up

**T-05 chapter 04 — Phase 3 sanitization bar** (Slice
3.5). Per longread Contract §6.1 chapter title:
"Dropping studio context without dropping rigor."
Per §6.2: target 900 words (advisory under soft-
floors), max 1 200 (enforced).

Phase 3 substance per research workpad §6:
- Drop studio context from spec body (no studio name,
  transcripts, internal SPEC IDs in published spec)
- Use studio experience as evidence frame (first-person
  "we tried this and X happened")
- Document preconditions for the spec's assumptions
  (e.g., trust-boundary declarations the installer
  must make)

BES Phase 3 disposition per workpad §7:
"drop ALL studio context per `owner://transcript-
2026-05-17`; generalize `owner://` →
`decision-authority://<role>`."

Corpus anchors that may support Phase 3 primitives:
- `research/primary-sources/12-factor.md` §3 (config-
  vs-code separation; backing-services-as-attached-
  resources principle).
- `research/primary-sources/diataxis.md` §3 (four-type
  documentation classification; helps think about
  what's "studio-specific" vs generalizable).
- `research/primary-sources/ref-arch-vs-solution-arch.md`
  §3 (the reference-vs-solution split — the spec body
  is reference, the studio context is solution).
- `research/primary-sources/sigstore-cosign.md` §3
  (provenance + signing; relevant for the "trust
  boundary" question Phase 3 names).
- Research workpad §6 (Phase 3 definition) + §7 (BES
  Phase 3 case-study).

Authoring procedure per the established pattern:

1. Author IDEA at
   `specs/2026-05-{N}-longread-chapter-04-phase-3-sanitization-bar/IDEA.md`.
2. Author Task SPEC with all T-01/T-02/T-03/T-04
   lessons applied upfront. Helpers BEFORE prose. Strict
   fact-vs-synthesis separation in failure note.
   Paragraph-co-occurrence anchors. Explicit bold
   markers for §6.5 three-element structure.
3. Codex SPEC pass (target: ≤ 2 rounds given lessons).
4. Owner approve.
5. Execute (author chapter prose) under soft-floors;
   no padding; no over-attribution beyond cited
   authority.
6. Codex prose pass (target: ≤ 2 rounds).
7. Verify; fill §17.
8. Owner close.

## Parking-lot follow-ups (acknowledged-and-deferred)

- **Corpus-citation lint extension**: mechanically
  enforce what manual reviewer T-5 currently checks.
- **v1.2 corpus expansion candidates**: SPDX, Pact,
  CUE, Dev Container Spec, SLSA/in-toto.
- **v2.1 release tag** for `agentic-ops-framework`.
- **Codex stdin-hang gotcha**: future codex dispatches
  append `</dev/null` (lesson captured in T-03 §17.5).

## Pattern-level spec evidence accumulated today

1. **Corpus-vs-workpad attribution asymmetry** (T-04
   chapter 03 prose R1 finding 1 + chapter 01 Nygard
   finding): methodology primitives MUST cite corpus,
   but the research workpad's phase definitions often
   summarize prior-art shapes in ways the corpus
   entries don't literally articulate. Cite the workpad
   for the workpad-characterization; cite the corpus
   for what the corpus literally says.
2. **Strict fact-vs-synthesis separation in §6.5
   three-element failure notes** (T-04 R1 + chapter 02
   prose R1): E1 + E2 workpad-grounded only; E3
   explicitly `judgment://agent-synthesis` tagged.
   Authoring contract enforced by helper script
   requiring the literal `judgment://agent-synthesis`
   string in the failure-note section.
3. **Paragraph-co-occurrence anchor design** (T-04 R1
   finding 2): helper scripts must check anchor pairs
   in the SAME paragraph, not scattered globally.
   Otherwise a chapter listing keywords without
   substantive coverage passes the mechanical gate.
4. **Soft-floors regime is durable**. Chapters 02 + 03
   both landed sub-target (573 + 595 words against
   1000 + 1000 advisory targets). No padding pressure
   surfaced; chapters say what they need to say.
5. **Convergence acceleration plateaus**. T-01 took 7
   codex rounds (SPEC + prose). T-02 took 4. T-03 took
   6. T-04 took 4. The convergence floor is ~4 rounds
   per chapter (2 SPEC + 2 prose) because prose-codex
   catches a new class each time (over-attribution to
   cited authority, motive imported into E1, etc.).
   This is the natural rate; the loop is working.

## Commits durable on origin

All three repos clean + synced.

- `bes-fleet-policy` @ `175866c` (soft-floors amendment
  yesterday; no changes today).
- `agentic-ops-framework` @ `05ad7a5` (no changes since
  v2.0 work).
- `agentic-installation-methodology` @ `ddc0a51` (T-04
  verified; all 8 of today's commits durable).

## What was deliberately NOT done this session

- **T-04 owner-close flip** — owner has just approved
  in transcript, will flip in this commit batch.
- **T-05 chapter 04 authoring** — tomorrow.
- **Parking-lot items** — all deferred.
- **External Slice 5 validation pass** — Phase 5
  obligation, owed to a later release.

Goodnight.
