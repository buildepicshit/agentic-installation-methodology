# BES Model Routing Guide

Status: canonical shared guidance, 2026-04-29.

Purpose: choose the right agent and model for BES fleet work without relying on
memory or taste. This guide is routing policy, not proof of account entitlement.
Before pinning a model in automation, verify it in the relevant model picker or
with an owner-approved probe.

## Source Checkpoints

Re-check provider docs and account model pickers before any
automation pin or long-running multi-agent dispatch. Live sources:

- Claude models (current vs legacy vs deprecated):
  <https://platform.claude.com/docs/en/about-claude/models/overview>
- Opus 5 GA: <https://www.anthropic.com/news/claude-opus-5>
- Opus 4.8 GA: <https://www.anthropic.com/news/claude-opus-4-8>
- Claude Code fast mode: <https://code.claude.com/docs/en/fast-mode>
- Copilot-served models:
  <https://docs.github.com/en/copilot/reference/ai-models/supported-models>
- Canonical scores: AA Intelligence Index v4.1 + Vals SWE-bench
  Verified — URLs in the Capability Matrix snapshot below.

Fetch gotchas for the next refresher (verified 2026-07-24):

- The AA index landing page EXCEEDS the fetch size limit. Use
  per-model pages (`artificialanalysis.ai/models/<slug>`) instead.
- AA slugs are not uniform. Haiku is `/models/claude-4-5-haiku`; the
  `/models/claude-haiku-4-5` form returns HTTP 404.
- Effort tiers are separate pages (`.../claude-opus-5-xhigh`, `-high`,
  `-medium`). Fetch the page for the tier you intend to record; never
  take an effort-qualified value from a search summary.
- The Vals board page TRUNCATES on fetch. Re-fetch in full before
  treating any model's absence as a confirmed absence.

Evidence trail:
`specs/2026-06-10-model-stable-matrix-research/RESEARCH.md`.

## Local Inventory

Live surfaces: Claude Code and Copilot CLI (the GPT surface;
unlimited enterprise seat), zero MCP servers — receipts in
`specs/2026-06-05-copilot-cli-cross-validation-lane/SPEC.md`.

## Owner Calibration

HasNoBeef's operating preference for this fleet:

- `gpt-5.6-sol` is the **Routing Matrix default GPT lane** as of
  2026-07-24 (owner-directed). It leads on BOTH canonical surfaces —
  AA v4.1 59 vs `gpt-5.5`'s 55, and Vals SWE-V 96.20 vs 82.60 — and is
  probe-validated on this seat. `gpt-5.5` remains documented,
  approved-for-fleet and available as the deliberate fallback; AA labels
  it deprecated but no vendor deprecation notice exists and Copilot still
  serves it GA, so it is a fallback, not a retirement. Copilot is the GPT
  agent surface; do not refer to a separate "Copilot" model.
- Claude Opus 5 (`claude-opus-5`) is the **frontier Claude lane** as of
  2026-07-24 (owner-directed, FULL promotion). It leads both canonical
  surfaces (AA v4.1 61; Vals SWE-V 97.00) and is probe-validated on this
  seat. Opus 4.8 remains documented and approved-for-fleet as the
  deliberate fallback; 4.7 and 4.6 stay legacy-pinned references only.
  The recency rule is unchanged and still binding — this flip rests on
  two independent vendor-neutral surfaces plus an entitlement probe, not
  on Opus 5 being newer.
- **Accepted trade-off on the Opus 5 promotion.** Opus 5 ships enhanced
  cyber-safeguards and may refuse security-adjacent requests. The owner
  chose FULL promotion over a partial one that would have kept Opus 4.8
  for security-surface review (`owner://transcript-2026-07-24`). So the
  refusal risk is ACCEPTED, not designed around: when a
  `warn-security-surface` review is refused, fall back to
  `claude-opus-4-8` or a GPT lane for that request and note it — do not
  treat the refusal as a capability verdict or retry it unchanged.
- Claude Sonnet with adaptive behavior, when available in the active surface,
  is a useful first-pass Claude lane for creative/product/design synthesis,
  lower-risk implementation support, and token-heavy drafts that may need
  escalation. Treat automatic escalation behavior as `needs-probe` unless the
  current CLI/docs prove it for the configured run.
- Hard work should use high-thinking modes deliberately: Copilot/GPT high
  reasoning when the surface exposes it; Claude
  `xhigh`, `max` only by exception, and explicit one-off "ultrathink" prompting
  when a review genuinely needs deeper thought.
- Long-context variants are valuable for large repo/doc synthesis, but they
  are not reflexive defaults. Use `opus[1m]`, `sonnet[1m]`, or equivalent
  only when the task clearly benefits and availability is confirmed.
- Weekly usage limits are real scheduling constraints. Route by capability
  fit (Capability Matrix verbs + canonical score), quota/availability, and
  the need for independent model-family review; cost is NOT a routing
  input (canonical statement: Capability Matrix intro).

## Fast Mode Policy

Fast mode (`/fast`, Claude Code CLI) is not a different model — it is
Opus with a speed-prioritised API configuration. The docs say "up to
2.5x" faster output tokens per second at "identical quality and
capabilities", **at premium per-token pricing**, and label it a
**research preview** (<https://code.claude.com/docs/en/fast-mode>).
Record it accurately: "up to", not "~2.5x flat"; the premium is a
stated fact about the configuration, not a routing input (cost is
never a routing input — Capability Matrix intro).

Supported on **Opus 5 and Opus 4.8 only** — not Sonnet, not Haiku.
Opus 4.7 fast mode was REMOVED (2026-07-24): those requests now hard
FAIL rather than degrading to standard speed. Opus 5 is the fast-mode
default from Claude Code v2.1.219. Fleet policy:

- PERMITTED for interactive frontier-Opus work where latency matters.
- If fast mode is used at all, prefer **Opus 5 fast** (the current
  default); Opus 4.8 fast remains supported.
- MUST NOT be used in automation, CI, or dispatched/batch lanes
  (determinism; dispatched workers run standard effort tiers). This
  explicitly includes the headless settings path — fast mode CAN
  enter a non-interactive `-p` run that way, so the prohibition names
  the invocation rather than trusting "interactive" to be obvious.
- Do NOT enable fast mode against a pinned Opus 4.7 legacy reference;
  the request now hard-fails.

## Access Status

Use these terms in specs and handoffs:

| Status | Meaning |
| --- | --- |
| `configured` | Present in local CLI/config. This proves intent, not entitlement. |
| `documented` | Official provider docs describe the model or alias. |
| `needs-probe` | Confirm with `/model`, model picker, or a deliberate test before relying on it. |
| `approved-for-fleet` | Owner has accepted the model for a role in this guide or a task spec. |

## Capability Matrix

This is the fleet's fit-selection surface: a matrix of choices, not
a linear primary/secondary pick. When routing any work — especially
subagent dispatch — choose by **capability fit**: strength verbs,
canonical score, family independence (cross-validation), and
context-window fit, with availability/quota as an operational
scheduling reality. **Cost is NOT a selection input.** The only
success metric is excellence and quality of deliverables; "not
every task needs a frontier model" means a bounded scan routed to a
fast lane produces an equally excellent deliverable — never that it
saves money. (Per `specs/2026-06-10-model-capability-matrix/SPEC.md`
§7.3, owner-binding.)

Snapshot: 2026-07-24 — canonical scores remain on the
**AA-Intelligence-Index-v4.1** basis (Artificial Analysis,
vendor-neutral, 9 independently-run evals:
<https://artificialanalysis.ai/evaluations/artificial-analysis-intelligence-index>;
v4.1 announced 2026-06-15). This is a SAME-VERSION data refresh, not
a re-baselining event: the index version was verified unchanged at
v4.1 on 2026-07-24 — no v4.2/v5 exists, so trigger (a) did NOT fire.
Triggers (b) new stable-model GA — **Claude Opus 5, GA 2026-07-24** —
and (c) needs-probe resolution — the GPT-5.6 Vals tiebreaker, plus
Claude-surface entitlement probes for Opus 5, Sonnet 5, Opus 4.8 and
Haiku 4.5 — both fired. Tiebreaker per **Vals AI SWE-bench Verified**
independent re-run, board updated **2026-07-22**
(<https://www.vals.ai/benchmarks/swebench>), used to break canonical
ties within ~3 points. Evidence trail:
`specs/2026-06-10-model-stable-matrix-research/RESEARCH.md` §3-§4;
`specs/2026-07-16-gpt-5-6-matrix-refresh/SPEC.md` (v4.1 values +
probe); `specs/2026-07-24-opus-5-matrix-refresh/SPEC.md` (this
refresh + the Version-Forward Proviso; probe receipts in
`receipts/`).

| Model | Family | Surfaces | Tier | Verbs | Canonical (AA v4.1) | Tiebreaker (Vals SWE-V) | Status |
|---|---|---|---|---|---|---|---|
| `claude-opus-5` | claude | claude-code, copilot-cli, api | frontier | ORCHESTRATE, IMPLEMENT, OPERATE, REASON, SYNTHESIZE | 61 (adaptive/max; 60 xhigh) | 97.00 | documented (GA 2026-07-24); probe-validated 2026-07-24; **approved-for-fleet (FRONTIER)** — owner-flipped 2026-07-24, full promotion including security-surface review |
| `claude-fable-5` | claude | claude-code, api | frontier | ORCHESTRATE, IMPLEMENT, OPERATE, SYNTHESIZE, PIONEER | 60 (adaptive/max) | 95.00 | documented; **probe-validated 2026-07-24** — entitlement confirmed past the stated promo window, so the re-probe-before-automation caveat is DISCHARGED. No longer top-scored (Opus 5: 61 / 97.00), but Anthropic still names Fable 5 for "highest available capability" — a deliberate pick, not a demotion |
| `claude-opus-4-8` | claude | claude-code, copilot-cli, api | frontier | IMPLEMENT, ORCHESTRATE, OPERATE, REASON, BACKSTOP | 56 (adaptive/max) | 88.60 | configured, approved-for-fleet; probe-validated 2026-07-24. Vendor-filed "Legacy models". No longer the default frontier lane (Opus 5 took it 2026-07-24) — retained as the deliberate FALLBACK, and the practical stand-in when an Opus 5 cyber-safeguard refusal blocks a security-surface request |
| `claude-sonnet-5` | claude | claude-code, copilot-cli, api | capable | IMPLEMENT, CONVERSE, ABSTRACT | 53 (adaptive/max) | needs-probe | documented; **probe-validated 2026-07-24 on claude-code** — this closes the STATUS.md Sonnet-5 probe-candidate item. Verbs INHERITED from the retired Sonnet 4.6 row pending a Sonnet-5-specific capability source |
| `claude-haiku-4-5-20251001` | claude | claude-code, copilot-cli, api | fast | SCAN, RESPOND, IMPLEMENT (bounded) | 24 (non-reasoning; no reasoning-variant index score published) | needs-probe | documented; probe-validated 2026-07-24 on claude-code |
| `gpt-5.6-sol` | gpt | copilot-cli, api | frontier | REASON, OPERATE, IMPLEMENT, SYNTHESIZE | 59 (max; 58 xhigh) | 96.20 | documented (GA 2026-07-09), probe-validated 2026-07-16 and re-probed 2026-07-24, approved-for-fleet (owner-directed 2026-07-16) |
| `gpt-5.6-terra` | gpt | copilot-cli, api | capable | IMPLEMENT, OPERATE, CONVERSE | 55 (max) | needs-probe (not in the 2026-07-22 board excerpt read; that fetch was truncated) | documented (GA 2026-07-09), probe-validated 2026-07-16, approved-for-fleet (owner-directed 2026-07-16) |
| `gpt-5.6-luna` | gpt | copilot-cli, api | fast | SCAN, RESPOND, IMPLEMENT (bounded) | 51 (max) | 93.00 | documented (GA 2026-07-09), probe-validated 2026-07-16 |
| `gpt-5.5` | gpt | copilot-cli, api | frontier | OPERATE, IMPLEMENT, SYNTHESIZE, RETRIEVE | 55 (xhigh) | 82.60 | configured, approved-for-fleet |
| `gpt-5.4` | gpt | copilot-cli, api | capable | IMPLEMENT, SYNTHESIZE | 51 (xhigh) | — | documented, needs-probe |
| `gpt-5.4-mini` | gpt | copilot-cli, api | fast | FAN-OUT, IMPLEMENT (bounded) | needs-probe | — | documented, needs-probe |

Verb evidence: every verb cites a public capability source —
`specs/2026-06-10-model-stable-matrix-research/RESEARCH.md` §4;
cost-framed observations are excluded by contract. GPT-5.6 verbs per
the GitHub changelog 2026-07-09 (Sol: "complex reasoning over large
codebases and demanding, long-running agentic work"; Terra: "everyday
interactive and agentic coding"; Luna: "smaller, faster tasks") and
the AA Coding Agent Index (Sol 80 / Terra 77 / Luna 75, in-Codex
harness) — `specs/2026-07-16-gpt-5-6-matrix-refresh/SPEC.md` §5.
Opus 5 verbs per the Anthropic launch post and GitHub changelog
2026-07-24 ("complex, long-running coding tasks that require careful
reasoning, effective tool use, and reliable execution across multiple
steps"; autonomous code change, regression verification, multi-tool
coordination, agentic self-verification, deep debugging and
root-cause analysis). Those are FIRST-PARTY vendor claims: per the
verb-evidence contract their cost clauses are stripped and vendor
benchmarks stay OUT of the score columns, which remain on the
vendor-neutral AA/Vals basis. `claude-sonnet-5` verbs are INHERITED
unchanged from the retired Sonnet 4.6 row — flagged as inherited
rather than restated as fresh evidence.

Per-model score provenance. Fetched 2026-07-24 **unless the row says
otherwise**; effort tiers are separate AA pages and each cell cites the
page its value came from:

| Cell | Source page |
|---|---|
| `claude-opus-5` 61 (max) | `artificialanalysis.ai/models/claude-opus-5` |
| `claude-opus-5` 60 (xhigh) | `artificialanalysis.ai/models/claude-opus-5-xhigh` |
| `claude-fable-5` 60 | `artificialanalysis.ai/models/claude-fable-5` |
| `claude-opus-4-8` 56 | `artificialanalysis.ai/models/claude-opus-4-8` |
| `claude-sonnet-5` 53 | `artificialanalysis.ai/models/claude-sonnet-5` |
| `claude-haiku-4-5` 24 | `artificialanalysis.ai/models/claude-4-5-haiku` (note the slug) |
| `gpt-5.6-sol` 59 (max) and 58 (xhigh) | `artificialanalysis.ai/models/gpt-5-6-sol` (both tiers carried on that page; 58 xhigh unchanged from the 2026-07-16 snapshot) |
| `gpt-5.6-terra` 55 | `artificialanalysis.ai/models/gpt-5-6-terra` |
| `gpt-5.6-luna` 51 | `artificialanalysis.ai/models/gpt-5-6-luna` |
| `gpt-5.5` 55 | `artificialanalysis.ai/models/gpt-5-5` |
| `gpt-5.4` 51 (xhigh) | `artificialanalysis.ai/models/gpt-5-4` — **value carried forward from the 2026-07-16 snapshot, NOT re-fetched on 2026-07-24.** Re-fetch before relying on it |
| `gpt-5.4-mini` | needs-probe — no value published |
| all Tiebreaker values | `vals.ai/benchmarks/swebench`, 2026-07-22 board |

Opus 5's `high` (59) and `medium` (56) values were available only via a
search summary, never a direct page fetch, so they are deliberately NOT
recorded in the matrix. Fetch the per-tier pages before adding them.

Tiebreaker-column convention: `—` means CONFIRMED ABSENT from the
cited board. `needs-probe` means NOT YET READ off it — absence from a
truncated fetch is not evidence of absence from the board. Re-fetch
the board in full before converting any `needs-probe` cell to `—`.

Surfaces caveat: for the Claude rows, `copilot-cli` in the Surfaces column
records where the model is *technically served*, NOT a permitted lane.
Serving a Claude model through Copilot CLI is FORBIDDEN in lane use — it
silently voids cross-family validity (see the Copilot Model Catalog below).
The Claude fleet lane is `claude-code` (or `api`); Copilot CLI is the
GPT-family lane only.

Row-inclusion rule: a model gets a row iff the fleet can dispatch
it as a lane today through a configured surface AND it is a live
fit-selection candidate. Excluded: Opus 4.7/4.6 and Sonnet 4.6
(legacy pinned references — see Claude Model Catalog; never new
fit-selection picks; Sonnet 4.6 retired from the matrix 2026-07-24
on succession by a probe-validated Sonnet 5),
Mythos 5 / Mythos Preview (no BES entitlement),
`gpt-5.5-pro` (no fleet surface, unprobed), the OpenAI `codex`-line
models (`gpt-5.3-codex`, `gpt-5.3-codex-spark`, `gpt-5.2-codex`) and
`gpt-5.2` and older (deprecated / retired with the elapsed codex
subscription), retiring Claude models, non-GPT non-Claude
Copilot models (FORBIDDEN in lane use — see Copilot Model Catalog),
BYOK endpoints.

**Exclusions bind the Version-Forward Proviso.** A model named in the
exclusion list above is NEVER reachable under that proviso, however
recent it is. The proviso reaches only ids that appear nowhere in this
guide — it is a gap-filler for versions that ship faster than this
document is refreshed, not a re-entry path for a model the fleet has
already looked at and declined.

Known gaps (explicit, per RESEARCH.md §7 — do not paper over):

- **RESOLVED 2026-07-24 — the GPT-5.6 Vals tiebreaker.** The
  2026-07-22 board carries the family: Sol 96.20, Luna 93.00. Sol now
  LEADS Fable 5 on SWE-V (96.20 vs 95.00) while trailing it by one
  point on the aggregate v4.1 index (59 vs 60); the ~3-point tie band
  therefore breaks toward Sol on the tiebreaker surface. Opus 5 leads
  both surfaces outright (61 / 97.00) and is not in a tie band.
- `gpt-5.4-mini` AA index value remains needs-probe.
- `claude-haiku-4-5` has a published NON-REASONING v4.1 value (24)
  and NO reasoning-variant index score. A search surfaced a
  conflicting "55 (reasoning)" figure the fetched page does not
  support — treat 24 as the only cited value.
- `claude-sonnet-4-6` never received a v4.1 adaptive/max value (only
  the non-reasoning 36). The gap is now closed by SUCCESSION, not by
  the number arriving: the row retired in favour of a probe-validated
  `claude-sonnet-5` (53).
- Tiebreaker cells marked `needs-probe` (`gpt-5.6-terra`,
  `claude-sonnet-5`, `claude-haiku-4-5`) were not in the board
  excerpt read on 2026-07-24, but that fetch was TRUNCATED. Unread,
  not absent — see the tiebreaker convention above.
- **Opus 5 cyber-safeguards — ACCEPTED TRADE-OFF, not a routing carve-out.**
  Anthropic and GitHub both flag enhanced cyber-safeguards on Opus 5, so
  security-adjacent requests may be refused. The owner chose a FULL Opus 5
  promotion on 2026-07-24 over a partial one that would have reserved
  security-surface review for Opus 4.8. Operational consequence: when a
  `warn-security-surface` review is refused, fall back to `claude-opus-4-8`
  or a GPT lane for that request and record it. A refusal is a policy
  outcome, not a capability verdict — do not retry it unchanged.

Status refresh 2026-07-16 (triggers (a)+(b)+(c)): the 2026-07-10
GPT-5.6 REJECTED probe is now RESOLVED — after `copilot update`
(1.0.70 → 1.0.71), pinned probes served real turns on `gpt-5.6-sol`,
`gpt-5.6-terra`, and `gpt-5.6-luna` on this seat (verbatim receipts:
`specs/2026-07-16-gpt-5-6-matrix-refresh/receipts/`); bare `gpt-5.6`
is NOT a valid id. Owner directive 2026-07-16 accepts Sol and Terra
as fit-selection options (Sol especially). Fable-5 caveat update: the
promo window was "through 2026-07-12", yet Fable-5 is the active
session model on 2026-07-16 — entitlement is continuing; the
re-probe-before-pinning-in-automation caveat stands.

Status refresh 2026-07-24 (triggers (b)+(c)): **Claude Opus 5 GA'd
2026-07-24** and enters the matrix at the top of both canonical
surfaces. Four pinned Claude-surface probes served real turns on this
seat — `claude-opus-5`, `claude-sonnet-5`, `claude-opus-4-8`,
`claude-haiku-4-5` (verbatim receipts:
`specs/2026-07-24-opus-5-matrix-refresh/receipts/`) — which CLOSES
the standing Sonnet-5 probe-candidate item and the Haiku
`needs-probe` status. `gpt-5.6-sol` was re-probed the same day on
Copilot CLI 1.0.75. The matrix row landed first WITHOUT a lane-role —
a row records capability and entitlement, and the lane flip is an
owner decision — and the owner then granted the FRONTIER role the
same day, so `claude-opus-5` is the frontier lane and
`claude-opus-4-8` the designated fallback. Anthropic filed Opus 4.8
under "Legacy models" the same day, which is consistent with that
ordering: the fleet did not follow recency, it followed two canonical
surfaces plus a seat probe, and the owner chose FULL promotion over a
partial one that would have kept 4.8 on security-surface work.

Refresh discipline: re-baseline this matrix on (a) an AA index
version bump (a v4 → v5 bump is a deliberate re-baselining event
with owner-visible diff, never a silent number swap), (b) a new
stable-model GA, or (c) a needs-probe resolution. A refresh that
meets every fastpath threshold (≤5 files, ≤300 lines, reversible, no
manifest-carried touch points) MAY land via `SPEC.fastpath.template.md`;
otherwise it is a Task SPEC. NOTE: this guide IS manifest-carried, so a
refresh of it can never be fastpath.
Update the Snapshot line on every refresh.

## Version-Forward Proviso

Owner-directed 2026-07-24: *"make sure that we include an open ended
proviso that allows teams to use newer version of model families
(Opus 5 for example) even if the rubric doesn't explicitly call that
version."*

The Capability Matrix is a dated snapshot; providers ship new versions
faster than it is refreshed. Without a standing rule this document
silently forbids a model the fleet is already running — this section
was authored in a `claude-opus-5` session on the very day Opus 5 GA'd,
against a matrix that did not list it. The proviso closes that gap.

**It governs ACCESS, never RANK.** The standing rule that recency is
not evidence of quality (Owner Calibration) is unchanged and binding.
This proviso lets a newer version be *used*; it never lets a newer
version be *called better*, and it grants no lane.

### Definitions

- **Family** is the Rule 20 cross-validation independence key. It
  resolves in three steps, in order:
  1. **Capability Matrix row** — the declared `Family` value wins.
  2. **Alias table** (below) — the Model Catalogs carry no `Family`
     column, so aliases resolve here and nowhere else.
  3. **Id prefix**, fallback only — `claude-*` → `claude`,
     `gpt-*` → `gpt`. An id matching neither prefix and appearing in
     neither of the two tables above falls **outside this proviso
     entirely**; it has no derivable family and MUST NOT be used in
     any lane.

  Step 2 exists because **aliases remain legal for permitted
  interactive use** and are carried in the Claude Model Catalog, yet
  none of them match `^claude-`. Without it, an interactive alias pick
  would have no derivable family and so could not prove Rule 20
  independence. (The Standard Prompts no longer pin aliases — they were
  converted to full ids on 2026-07-24 because every prompt there is
  automation.)

  | Alias | Family | Resolves to |
  |---|---|---|
  | `opus`, `opusplan`, `opus[1m]` | claude | current Anthropic Opus lane |
  | `sonnet`, `sonnet[1m]` | claude | current Anthropic Sonnet lane |
  | `haiku` | claude | current Anthropic Haiku lane |

  Aliases move over time by vendor design, so an alias is NEVER
  sufficient for an automation pin — pin the full id there (this
  restates the existing Claude Model Catalog rule, now with a family
  that actually resolves).

- **Product line** is the lineage within a family — `opus`, `sonnet`,
  `haiku`, `fable` under `claude`; `sol`, `terra`, `luna` under
  `gpt-5.x`. A version bump moves ALONG a product line.
- A **version-forward model** is a newer version of a product line
  that already holds a Capability Matrix row, on a surface already
  listed for that line.

### Permitted without a new SPEC or row

Interactive use — interactive Claude Code and interactive Copilot CLI
sessions, including interactive subagent dispatch — of an unlisted
newer version of a listed product line, **for capability fit only**.
Access means *may be served in an interactive turn*. Nothing more.

### Forbidden

- **Automation pins.** TASK.md lanes, Standard Prompts, scripts, CI,
  hooks, `-p` / headless runs, AFK and batch lanes all require a
  probed, rowed model. A wrong model interactively produces one
  visible turn; a wrong model in a pin produces silent, reproducible
  drift.
- **Occupying a role.** A version-forward model MUST NOT occupy a
  lane-role, a Routing Matrix cell, or a Capacity-table row until an
  owner-flipped row exists.
- **Inheriting authority.** Neither the predecessor's `Tier` nor its
  `approved-for-fleet` grant transfers. `approved-for-fleet` is an
  owner acceptance (Access Status table) — it is RANK, and rank never
  transfers by succession. An unlisted successor is
  `documented, needs-probe` and nothing else.
- **Crossing a product line or family.** `claude-opus-4-8` →
  `claude-sonnet-5` is not version-forward; it is a routing change.
- **Any unrecognised suffix — DEFAULT DENY.** Succession must be
  positively established, never assumed from a name. If the candidate
  id carries any qualifier its rowed predecessor does not — `-pro`,
  `-mini`, `-preview`, `-codex`, `-turbo`, `-thinking`, an effort tier,
  or anything else — it is OUT OF SCOPE unless the vendor's own
  release material names it the successor of that exact product line.
  The list of suffixes is illustrative, not exhaustive: an unlisted
  suffix defaults out, it does not default in. `gpt-5.5` →
  `gpt-5.5-pro` is out of scope.
- **Re-entry for declined models.** Anything in the Row-inclusion
  exclusion list is unreachable here, however recent.
- **Rebrands.** If the `Family` value would change, it is a new
  family — SPEC required.

### Rule 20 is preserved, not weakened

A version bump cannot create or destroy cross-family validity because
it does not change the `Family` value. The mechanical guardrail is
already family-derived, not an enumerated allowlist:
`validate-cli-invocation.sh` FAILS any Copilot span whose `--model`
does not match `^gpt-`, so a newly-served Claude model on Copilot is
blocked from lane use the day it appears, without a hook edit.

### Required record

Name the model and the rowed predecessor it stands in for, with one
line of why, in **the SPEC's Completion Report** when the work has a
SPEC — and in **the session's `SESSION_JOURNAL.md` entry** when it does
not. Interactive work often has no SPEC, so naming only the Completion
Report would leave the obligation unrecordable in the common case.

`model_route` in TASK.md front-matter is NOT a recording surface: it is
a scalar model slug with no notes field, and a TASK.md lane is
automation — it requires a rowed model and is therefore never a
legitimate destination for a version-forward pick.

First use on a surface SHOULD carry a pinned-`--model` probe receipt.
**A failed probe means unavailable** — fall back to the rowed
predecessor; do not retry silently.

### Bounded refresh obligation

First use of a version-forward model is a matrix **refresh trigger**
under category (b), discharged at the next refresh. It is deliberately
NOT an immediate blocking duty and NEVER a SPEC per version — an
unbounded per-version obligation is the failure mode that would make
agents route around this proviso instead of through it.

## GPT Model Catalog (via Copilot)

Verified sources: GitHub Copilot model availability and official OpenAI GPT
model docs. These entries describe GPT models reached through Copilot CLI/API
surfaces; the model name is separate from the serving surface.

| Model | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `gpt-5.6-sol` | documented, probe-validated 2026-07-16, re-probed 2026-07-24, approved-for-fleet; **Routing Matrix DEFAULT GPT lane from 2026-07-24** | Strongest OpenAI lane on AA v4.1 (59) and now on the tiebreaker too (Vals SWE-V 96.20, 2026-07-22 board — ahead of Fable 5's 95.00): deep reasoning over large codebases, demanding long-running agentic work, high-risk review/cross-validation of Claude-authored work. | Automation pins before more operational history accrues (GA 2026-07-09). The former "until a Vals datum lands" caveat is DISCHARGED — the datum landed 2026-07-22. |
| `gpt-5.6-terra` | documented, probe-validated 2026-07-16, approved-for-fleet (owner-directed) | Balanced everyday interactive/agentic coding lane; GPT-family implementation at capable tier. | Highest-risk architecture/integration calls when Sol or `gpt-5.5` fits. |
| `gpt-5.6-luna` | documented, probe-validated 2026-07-16 | Fast bounded scans, lightweight subagents, low-risk summarization. | Final integration decisions, ambiguous architecture, high-risk edits. |
| `gpt-5.5` | configured, documented, approved-for-fleet — **FALLBACK lane as of 2026-07-24**, no longer the default. AA labels it "deprecated" and recommends Sol, but Copilot still lists it GA and no OpenAI deprecation notice exists, so it is a fallback and NOT retired. | Deliberate fallback when `gpt-5.6-sol` is unavailable or quota-constrained, and for work explicitly pinned to 5.5 for reproducibility. | New default-lane assignments — use `gpt-5.6-sol`. |
| `gpt-5.4` | documented, needs-probe | Fallback when `gpt-5.5` is unavailable or a workflow is pinned to GPT-5.4. | Replacing `gpt-5.5` for high-risk work when `gpt-5.5` is available. |
| `gpt-5.4-mini` | documented, needs-probe | Fast read-heavy exploration, parallel document scans, lightweight subagents, low-risk summarization. | Final integration decisions, ambiguous architecture, high-risk edits. |

## Claude Model Catalog

Verified sources: local Claude config and official Claude Code model docs.

| Model or alias | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `opus` | configured, documented, approved-for-fleet | Independent architecture/spec review, ambiguity review, high-risk design critique, public-OSS review. | Bounded fanout and routine edits — fast lanes fit those equally well. |
| `claude-opus-5` | documented (GA 2026-07-24), probe-validated 2026-07-24; **approved-for-fleet (FRONTIER) from 2026-07-24** | Top-scored model on both canonical surfaces (AA v4.1 61; Vals SWE-V 97.00): complex agentic coding, long-running multi-step execution, autonomous code change with regression verification, multi-tool coordination, deep debugging and root-cause analysis. | Nothing categorically. On a cyber-safeguard refusal during security-surface review, fall back to `claude-opus-4-8` or a GPT lane for that request and record it — the accepted trade-off of the full promotion, not a carve-out. |
| `claude-opus-4-8` | configured, documented, approved-for-fleet — **FALLBACK from 2026-07-24**; vendor-filed "Legacy models" (still served) | Deliberate fallback for cross-validation/review, high-risk implementation review, architecture/spec critique, public-OSS release review. Also the practical stand-in when an Opus 5 cyber-safeguard refusal blocks a security-surface request. | New default frontier-lane assignments — use `claude-opus-5`. |
| `claude-sonnet-5` | documented, probe-validated 2026-07-24 on claude-code | Capable-tier Claude lane, successor to Sonnet 4.6 (AA v4.1 53): daily Claude coding, implementation support, doc synthesis, repo-local work after an approved spec. | Highest-risk architecture or integration calls when a frontier lane is available. |
| `claude-sonnet-4-6` | documented, needs-probe (never held an owner `approved-for-fleet` flip — do not imply one) | Legacy capable-tier reference, superseded upstream by Sonnet 5. Deliberate pinned/legacy use only. | New fit-selection picks — use `claude-sonnet-5`. |
| `claude-fable-5` | configured, documented; entitlement resolved 2026-07-10, **re-probed 2026-07-24** | Anthropic's designated "highest available capability" pick (AA v4.1 60; Vals SWE-V 95.00): orchestration, synthesis, high-risk implementation/review, deep multi-step work. No longer the top-scored Claude row (Opus 5: 61 / 97.00) — that is a scoreboard fact, not a demotion. | Cost-driven avoidance (cost is not a routing input); assuming a permanent role before the owner designates one. |
| `claude-opus-4-7` | documented, approved-for-fleet (LEGACY lane-role) | Legacy-but-available frontier predecessor (same $5/$25). Deliberate pinned/legacy reference only; `claude-opus-5` is the frontier lane and `claude-opus-4-8` the fallback. | New frontier-lane assignments (use `claude-opus-5`). |
| `claude-opus-4-6` | documented, approved-for-fleet (LEGACY lane-role) | Legacy-but-available (same price). Deliberate legacy/pinned use only. | New frontier-lane assignments (use `claude-opus-5`). |
| `sonnet` | documented, needs-probe | Creative/product/design synthesis, adaptive first-pass Claude work when configured, daily Claude coding, implementation support, doc synthesis, repo-local work after approved spec. | Highest-risk coding or architecture calls when `claude-opus-5` or Copilot-served `gpt-5.6-sol` is available and quota allows. |
| `haiku` | documented, needs-probe | Simple scans, short summaries, low-risk formatting, fast bounded support work. | Complex code edits, final review, ambiguous specs. |
| `opusplan` | documented, needs-probe | Claude-led work where planning should use Opus and execution should use Sonnet. | Work that must stay strictly on one pinned model. |
| `opus[1m]` / `sonnet[1m]` | documented, needs-probe | Long sessions and large-codebase/document synthesis when account support is confirmed. | Default use; verify availability first. |

Official Claude Code guidance says aliases can move over time. Use aliases for
interactive work. Use full model names when reproducibility matters.

## Copilot Model Catalog

GitHub Copilot CLI is a co-equal GPT-family SURFACE; the lane's family
keys on the MODEL served, not the CLI brand.

| Model | Status | Use for | Avoid for |
| --- | --- | --- | --- |
| `gpt-5.6-sol` (via Copilot CLI) | approved-for-fleet; **DEFAULT GPT lane from 2026-07-24** | Primary GPT-lane dispatch; cross-validation/review of Claude-authored work; second independent GPT opinion when the primary author is not GPT-family. | Cross-validating GPT-authored work — same family. |
| `gpt-5.5` (via Copilot CLI) | approved-for-fleet — FALLBACK from 2026-07-24 | Deliberate fallback when Sol is unavailable or quota-constrained, and work pinned to 5.5 for reproducibility. | New default-lane dispatch — use `gpt-5.6-sol`. Cross-validating GPT-authored work — same family. |
| `gpt-5.6-terra` / `gpt-5.6-luna` (via Copilot CLI) | probe-validated 2026-07-16 | Per the GPT Model Catalog rows above; same lane rules as Sol. | Cross-validating GPT-authored work — same family. |
| other unlisted/unprobed GPT models on Copilot | needs-probe | Probe with a pinned `--model` before catalog promotion. | Automation pins before a probe. |
| non-GPT models on Copilot | FORBIDDEN in lane use | — | Any lane assignment: serving a Claude model through Copilot silently voids cross-family validity. This binds by FAMILY, not by an enumerated list — it covers every Claude model GitHub serves, including ones added after this table was written (Opus 5 and Sonnet 5 appeared in the Copilot catalogue 2026-07-24) and any version reached under the Version-Forward Proviso. Enforced mechanically: `validate-cli-invocation.sh` FAILS any copilot span whose `--model` does not match `^gpt-`. |
| `--model auto` | FORBIDDEN in lane use | — | Any lane invocation (mechanically blocked by `validate-cli-invocation.sh`). |

Copilot lane rules:

- Pin `--model` explicitly in every lane invocation; `auto` is blocked.
- Copilot-on-GPT MUST NOT be the `cross_validation_lane` for work whose
  `model_route` is GPT-family (SPEC.schema §1.4 different-family rule).
- GPT-surface choice: Copilot CLI is the GPT-family fleet surface for
  implementation, review/cross-validation of Claude work, and GPT-lane
  dispatch. Seat quotas are not a constraint.
- Scripted invocations follow the `cross-agent-cli-invocation` skill
  pattern and are gated by the same PreToolUse hook as claude.

## Routing Matrix

These rows are task-class **starting points**, not assignments. The
fit decision — which model actually carries the work — defers to
the Capability Matrix above (verbs + canonical score + family
independence + context fit). Treat a row as the default opening
position that the matrix can override in either direction.

**Both default lanes were re-baselined 2026-07-24 (owner-directed).** The rows
below now read `gpt-5.6-sol` and `Claude Opus 5`.

Basis: each new lane leads BOTH canonical surfaces — Sol AA v4.1 59 / Vals
SWE-V 96.20 against `gpt-5.5`'s 55 / 82.60; Opus 5 AA v4.1 61 / SWE-V 97.00
against Opus 4.8's 56 / 88.60 — **and** each is probe-validated on this seat.
`gpt-5.5` and `claude-opus-4-8` remain documented, approved-for-fleet
fallbacks; neither is retired.

The recency rule still binds. An owner flip moved these lanes on two
independent vendor-neutral surfaces plus entitlement receipts; recency alone
would not have. **The Opus 5 promotion is FULL, including security-surface
review** — see the accepted trade-off in Owner Calibration.

| Task class | Primary route | Secondary route | Notes |
| --- | --- | --- | --- |
| Root fleet management | Copilot CLI `gpt-5.6-sol` | Claude Opus 5 review | Root owns orchestration, preflight, handoff order, and cross-repo policy. |
| Repo orientation | Copilot CLI `gpt-5.6-sol` or `gpt-5.4-mini` | Claude `sonnet` | Use faster models only for bounded read-only inventory. |
| New non-trivial SPEC | Copilot CLI `gpt-5.6-sol` | Claude Opus 5 critique | Claude should review ambiguity before high-risk execution. |
| Spec review | Claude Opus 5 or Copilot CLI `gpt-5.6-sol` | Both families for high-risk specs | Use independent cross-family review for public OSS, architecture, security, release, or cross-repo work. |
| Implementation from approved spec | Copilot CLI `gpt-5.6-sol` or Claude Opus 5 | Claude `sonnet` for creative/supporting work | Write-capable agents need branch/worktree isolation and file ownership. |
| Fast fanout / document scan | Copilot CLI `gpt-5.4-mini` | Claude `haiku` | Return distilled facts to the root agent; do not let scan agents edit. |
| Multi-agent coding | One lead writer on Copilot CLI `gpt-5.6-sol` or Claude Opus 5 | Additional writers only on disjoint files/worktrees | Root fleet manager must define ownership and integration order before edits. |
| Creative/product/design synthesis | Claude `sonnet`, preferably adaptive when configured and available | Claude Opus 5 or Copilot CLI `gpt-5.6-sol` for final technical validation | Useful for tone, concepts, narrative, and design exploration; specs still control execution. |
| Code review | Copilot CLI `gpt-5.6-sol` with `review-diff` | Claude Opus 5 | Findings first, severity ordered, with file/line citations. |
| Public OSS release work | Copilot CLI `gpt-5.6-sol` | Claude Opus 5 independent review | Wick and Mimir require low-noise PR plans and owner approval before push/publish. |
| Green room product evaluation | Copilot CLI `gpt-5.6-sol` or Claude Opus 5 | Different model family required | Follow `.agents/GREEN_ROOM_EVALUATION.md`; primary evaluation and verifier must be separate runs. |
| Long-context synthesis | Claude Opus 5 `[1m]` or Sonnet `[1m]` after probe | Copilot CLI `gpt-5.6-sol` with scoped docs | Use 1M context only when account support is confirmed and the task clearly benefits. |
| Trivial local command | Current root agent | None | Do not spawn agents for simple terminal answers. |

## Approved SPEC Decomposition

The decomposition procedure, TASK.md output contract, cross-family
refusal, AFK/HITL criteria, owner-only status flips, and the
integration gate are canonical in
`file://agents/skills/decompose-approved-spec/SKILL.md` and
`file://agents/specs/SPEC.schema.md` §1.4.

Model-lane assignment per task class draws from the Routing Matrix
above:

- `task_class: implementation` → primary Copilot CLI `gpt-5.6-sol`,
  cross-validation Claude Opus 5 (different family).
- `task_class: code-review` → cross-family from the implementer.
- `task_class: verification` (behavioral) → different family
  from the implementer; mechanical verification (lint, test) MAY
  share family.
- `task_class: research` / `docs` → fast read lanes acceptable
  for the primary; cross-family reviewer for high-stakes claims.

## Capacity and Availability

Weekly model limits and surface outages shift WHEN and WHERE work
runs, never the quality bar — capacity management, not cost
optimization:

| Pressure | Routing adjustment |
| --- | --- |
| Copilot `gpt-5.6-sol` quota healthy | Use Copilot as root lead and primary GPT implementer. |
| Copilot `gpt-5.6-sol` quota constrained | Move independent review/spec critique to Claude Opus 5; reserve Copilot for GPT-family integration and verification if possible. |
| Copilot CLI down or unreachable | Pause GPT-lane dispatch or use API only when a SPEC explicitly approves that surface. |
| Claude frontier quota healthy | Use the frontier Claude lane for spec review, second-pass code review, and high-risk repo work where a different model family adds value. |
| Claude frontier quota constrained | Reserve `claude-opus-5` for the riskiest reviews and drop to `claude-opus-4-8`, the designated fallback; legacy Opus 4.7/4.6 remain available as deliberate pinned references only if both are exhausted. |
| Both frontier quotas constrained | Stop parallel frontier fanout. Use fast/read-only models for inventory, then queue owner decisions until frontier capacity returns. |
| Creative work with low code risk | Prefer Claude Sonnet/adaptive when available, then validate implementation-impacting decisions with Copilot CLI `gpt-5.6-sol` or the frontier Claude lane. |

Be frugal on wasteful PROCESS overhead, never on research
(`file://agents/skills/execution-discipline-cluster/SKILL.md`
practice 4). Use frontier models for ambiguity, architecture, code
changes, integration, research, and final calls.

## Dispatch Rules

1. Pick the role before picking the model.
2. Keep the current root agent as the accountable integrator unless a SPEC or
   owner instruction assigns that role elsewhere.
3. Use Claude when an independent opinion is valuable, not just because another
   model exists.
4. Before substantial research, code review, verification, or implementation,
   agents MUST evaluate whether independent work can run in parallel.
5. Agents may initiate Claude or Copilot subagents under approved scope when
   delegation is the correct execution shape. State the worker role, model
   route, allowed files or read-only boundary, expected output, and whether
   edits are allowed.
6. Prefer fanout for independent research, code review, documentation
   inventory, static analysis, independent verification, and bounded read-only
   scans when wall-clock savings exceed coordination cost.
7. Keep local and serial execution for trivial command answers, tightly coupled
   single-file edits, urgent blocking steps, and owner-interactive planning
   unless the owner explicitly requests fanout.
8. Check with the owner when the parallelism decision is unclear,
   quota pressure on a frontier lane is material, or write ownership
   cannot be made disjoint.
9. Read-only agents may share a checkout. Write-capable agents need a separate
   branch or worktree and a bounded approved `SPEC.md`. Mutation-probe agents
   are write-capable by definition and MUST take the worktree path
   (`agents/skills/review-diff/references/multi-agent-review.md`).
10. Multiple spec authors/reviewers are encouraged for important work because
   they create better questions and catch weak assumptions.
11. Multiple write-capable agents in one repo require root fleet-manager control:
   disjoint file ownership, separate branches/worktrees when needed, an explicit
   integration order, and a single verifier.
12. For decomposed approved specs, review worker output first for SPEC
    compliance and only then for code quality.
13. For public OSS repos, prefer review/spec work first and avoid public CI churn
   until the owner approves a low-noise PR plan.
14. Use small/fast models for fanout only when the expected answer is bounded and
   easy for the root agent to verify.
15. Final integration, verification interpretation, and release decisions stay
    with a frontier model unless the owner accepts the risk.
16. Green room product evaluations are a required post-handoff phase for active
    repos. Do not convert a roadmap into implementation specs until a different
    model family has verified the evaluation packet.
17. Before dispatch, predict known failure modes in the prompt: environment
    gates, stale authority docs, owner decisions, public-OSS constraints,
    model quota, and whether verifier output is allowed to edit files.
18. Claude CLI `-p` runs can be silent for several minutes on long read-heavy
    reviews. Set an expected wait budget in the root status update and do not
    interrupt solely because no text has streamed. Interrupt only when the
    process exits badly, violates scope, exceeds the planned wall-clock budget,
    or the owner asks to stop.
19. Do not use Claude `--permission-mode dontAsk` for tasks that must write
    approved files. In non-interactive runs it can deny `Write` and `Bash`.
    Use a writer-capable mode with strict allowed files, or make the Claude run
    return full markdown and have the root fleet manager write it.
20. Rule 20: Cross-family review is REQUIRED — not merely recommended — on a
    change that **alters what a gate blocks or allows**, touches **secrets or
    a security surface**, or changes **branch/push protection**. One gate, on
    the execution diff, before the work lands.

    **Narrowed 2026-07-31 (owner-directed).** It formerly fired on any SPEC
    touching a path in the propagation manifests, at TWO gates, each up to two
    rounds — so a logging fix that could not change any verdict drew four
    review rounds. Path is not risk. If the change cannot alter a decision the
    fleet makes, no cross-family review is required; run the gates and land it.

    The `same-family-review` escape hatch applies to everything below that bar.
    Adopted 2026-06-10 after four consecutive guardrail SPECs where
    cross-family review caught defects same-family work missed
    (`specs/2026-06-09-mutation-probe-isolation-discipline/SPEC_EVIDENCE.md`
    SE1; owner-directed). This is the SINGLE CANONICAL statement of the
    cross-family rule (WS-GATES,
    `file://specs/2026-06-30-operating-model-lean-down/SPEC.md` §7); the
    review-spec, review-diff, and verify-spec skills cite it rather than
    restating it.

    **STOP RULE (added 2026-07-24, owner-directed).** Rule 20 requires
    review AT the gate; it does not require iterating until a reviewer stops
    producing observations, which it never will — an adversarial reviewer has
    no fixed point. Therefore:
    (a) **Severity floor.** Only BLOCKING and HIGH findings gate a landing.
        MEDIUM and LOW are recorded in the SPEC's review disposition and
        deferred. They are not fixed pre-landing.
    (b) **Round cap.** At most TWO rounds before landing: round 1 triages
        everything; round 2 verifies only the BLOCKING/HIGH fixes from round 1.
        A third round is permitted ONLY if round 2 surfaces a new BLOCKING
        finding, and MUST be justified in the SPEC.
    (c) **Reviewer is a second opinion, not an oracle.** A finding may be
        REJECTED on measurement, with the measurement recorded. Cross-family
        reviewers have produced demonstrably wrong counts and refuted-then-
        reproposed fixes.
    Evidence: `file://specs/2026-07-24-capture-after-lint-declaration/SPEC.md`
    §8 (SE-F). The stop rule bounds review DEPTH, never review SCOPE.

    **Classification (2026-07-31).** Classify by CONSEQUENCE, using the
    three tests in the rule head: does the change alter what a gate blocks
    or allows, touch secrets or a security surface, or change branch/push
    protection? Intent framing ("machinery", "just docs") is not an
    exemption — say what the change can and cannot alter, and check it
    against those three.

    The former test was path-based: grep the diff's touch points against
    the propagation manifests, class is touch-point-defined. That was
    retired by the 2026-07-31 narrowing above — *"Path is not risk"* — and
    a truncated duplicate of it survived here until 2026-08-05, so this
    rule contradicted its own narrowing four lines apart
    (`file://specs/2026-08-05-pocock-v1-2-and-harness-parity/SPEC.md` S9).
    The evidence behind the old test still stands on its own terms — three
    same-day misclassifications each hid real review-caught defects
    (`file://specs/2026-07-01-propagation-machinery-fixes/SPEC_EVIDENCE.md`
    SE-5) — which is why intent framing remains a non-exemption. What
    changed is the trigger, not the rigour.

    There is deliberately NO waiver mechanism for a change that DOES meet
    the bar (owner-affirmed 2026-07-02 against a recorded-waiver
    alternative: every waived or misclassified review that week hid real
    defects, while the rule's one hard stop proved correct). If the
    cross-family lane is unavailable for such a change, the work HOLDS; a
    per-case owner override remains possible only as an explicit
    in-transcript directive — an owner action, not a rule feature.

## Standard Prompts

Every prompt below is a scripted / headless invocation, which the
Version-Forward Proviso classifies as **automation**. Automation pins
therefore use **full model ids, never aliases** — an alias moves by
vendor design and would make these calls non-reproducible. The Claude
prompts were converted from `--model opus` / `--model sonnet` to full
ids on 2026-07-24 for exactly this reason; the Claude Model Catalog's
"use full model names when reproducibility matters" line is now
enforced by these examples rather than merely advised.

Claude independent spec review:

```bash
claude --print \
  "Read AGENTS.md, CLAUDE.md, WORKFLOW.md, and the target SPEC.md. Review only. Return blockers, ambiguity, unsafe assumptions, missing verification, and owner decisions. Do not edit files." \
  --model claude-opus-5 \
  --permission-mode plan \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}'
```

> **Flag-order gotcha (verified 2026-07-24, Claude Code 2.1.219).**
> `--mcp-config <configs...>` is **variadic** — it consumes every
> following positional argument. A prompt placed AFTER it is swallowed
> as a second config path and the call dies with
> `MCP config file not found: <your prompt text>`. Put the prompt
> immediately after `--print`, or pipe it on stdin
> (`echo "…" | claude --print --model … --mcp-config '{…}'`). Both
> shapes are probe-verified. This bug was live in all three prompts in
> this section until 2026-07-24.

Claude bounded repo worker after approved spec (frontier lane):

```bash
claude \
  --model claude-opus-5 \
  --effort xhigh \
  --permission-mode default \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}'
```

Claude deep technical review (frontier lane):

```bash
claude --print \
  "Read the named source docs and current diffs. Review only. Return deep technical risks, correctness concerns, missing tests, and decision points. Do not edit files." \
  --model claude-opus-5 \
  --effort xhigh \
  --permission-mode plan \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}'
```

Claude creative/product synthesis:

```bash
claude --print \
  "Read the named source docs. Produce creative/product synthesis only. Use adaptive behavior if this Claude surface supports it. Do not create implementation instructions unless explicitly requested." \
  --model claude-sonnet-5 \
  --permission-mode plan \
  --strict-mcp-config \
  --mcp-config '{"mcpServers":{}}'
```

Copilot read-only review (co-equal GPT lane; scripted):

```bash
gh copilot -- -p "$(cat specs/<id>/reviews/PROMPT.md)" \
  --model gpt-5.6-sol \
  -s \
  --no-custom-instructions \
  --disable-builtin-mcps \
  --deny-tool write --deny-tool 'shell' --deny-tool 'url' \
  < /dev/null
```

Deny write/shell/url for read-only review/scan posture; never add
`--allow-all-tools`. Pin `--model` explicitly (`auto` is blocked by
the validator). The `< /dev/null` stdin redirect is RECOMMENDED for
non-interactive scripted invocations.

Copilot GPT repo worker:

```bash
gh copilot -- -p "$(cat prompts/WORKER.md)" \
  --model gpt-5.6-sol \
  --no-custom-instructions \
  --disable-builtin-mcps \
  < /dev/null
```

Copilot GPT fast read-only scan:

```bash
gh copilot -- -p "<prompt>" \
  --model gpt-5.4-mini \
  --no-custom-instructions \
  --disable-builtin-mcps \
  --deny-tool write --deny-tool 'shell' --deny-tool 'url' \
  < /dev/null
```

Treat these as templates. Every actual dispatch prompt must name the repo,
spec path, allowed files, verification gate, and whether edits are allowed.

## MCP Note

Model routing does not approve MCP usage; the zero-active-MCP
default is canonical in `.agents/mcp/README.md`. Keep
`--strict-mcp-config --mcp-config '{"mcpServers":{}}'` for Claude
dispatch unless a task spec explicitly approves MCP use.

## Verification Commands

Use these when refreshing the catalog:

```bash
gh copilot --help
claude --version
claude mcp list
rg -n "model|advisorModel" /var/home/hasnobeef/.claude/settings.json /var/home/hasnobeef/.claude.json
node agents/scripts/preflight.mjs
node .agents/scripts/preflight.mjs
```

Use model probes only when the owner approves the spend/noise:

```bash
gh copilot -- -p "Reply with the active model name if available." --model gpt-5.4-mini --no-custom-instructions --disable-builtin-mcps < /dev/null
claude --print "Reply with only the active model id. No other text." --model claude-opus-5 --permission-mode plan --strict-mcp-config --mcp-config '{"mcpServers":{}}'
```
