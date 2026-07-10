# Cascade by id-citation (non-propagating SPECs)

Read this when a SPEC binds work in child repos but does NOT
mutate `agents/*` content (typical of Decision SPECs encoding
studio-level principles, taxonomies, or cross-repo policies).
SPECs that DO mutate `agents/*` reach the children via the
standard `file://agents/scripts/fleet-sync.sh` propagation;
this reference does not apply to them.

## Mechanism

`specs/*` does not propagate via `fleet-sync.sh`; only
`agents/*` content propagates. When a SPEC binds work in child
repos but does not mutate `agents/*`, the cascade mechanism is
**id-citation**: child repos cite the upstream SPEC by its `id`
from their per-product SPECs.

## Implications for authors

- Do not expect file-level propagation of `specs/*` content.
- A studio-level Decision SPEC's downstream binding is enforced
  when per-product SPECs cite it by `id` and pass `spec-review`.
  Forward direction is automatic at review time; reverse
  direction (upstream discovers all downstream consumers) is
  manual cross-repo grep.

Pattern authority:
`file://specs/2026-05-02-studio-principle-ai/SPEC_EVIDENCE.md` §3.
