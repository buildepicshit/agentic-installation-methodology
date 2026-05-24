# Codex R1 — T-09 chapter 08 Phase 7 failure modes Task SPEC

NEEDS-REVISION — 0 BLOCKER, 2 MAJOR.

## F1 — §6.5 three-element structure not enforced for cross-phase modes

Contract §6.5 requires the three-element failure-note
structure (`**What happened.**` / `**What we did.**` /
`**What pattern generalizes.**`) for failure-mode
disclosures. The T-09 SPEC §8/§9/§13/§14 catalogue the
4 BES cross-phase failure modes by name only; the
anchors helper greps loose anchor terms (fastpath,
decomposition, workpad bootstrap, ceremony refactor)
without enforcing the §6.5 structure. Per codex:
"chapter 08 can pass T-9/T-14/AC-14 while listing the
four modes without 'what happened / what we did / what
pattern generalizes.'"

Required fix: make §8/§9/§13/§14 require §6.5 three-
element disclosure for the four+ cross-phase modes, and
add either a mechanical or explicit manual gate for
that structure.

## F2 — closing helper too loose + IDEA conflict

Closing helper checks last 15 lines for three separate
substrings but doesn't require `follow.` period, exact
ordering, or that no prose follows. IDEA at line ~83
has a conflicting "NOT 'In the next chapter'"
statement that contradicts Contract §8.1's literal
text.

Required fix: normalize whitespace and compare the
final nonblank footer to the exact Contract text:
`**In the next chapter**: This is the last chapter.
The seven open research questions follow.` Align the
IDEA with that same text.

## Verification

`lint-spec` PASS for both IDEA and SPEC. Helper `bash
-n` PASS for both helpers.

## Convergence trajectory

| Round | BLOCKER | MAJOR | MINOR |
|---|---|---|---|
| R1 | 0 | 2 | 0 |

tokens used: ~78,000
