# Idea Capture

Use this slash-command to capture an owner-and-agent ideation conversation
into a contract-grade `IDEA.md` artefact.

Argument: `<slug>` — kebab-case topic identifier.

0. Apply grill-before-IDEA behavior from `spec-authoring`: inspect repo
   facts before asking, ask one owner question at a time, present 2-3
   approaches when the design space is ambiguous, and capture owner
   validation before authoring.
1. Compute `spec_id = <YYYY-MM-DD>-<slug>` (override allowed if owner
   directs).
2. Create `specs/<spec_id>/` (or `.agents/specs/<spec_id>/` when running
   inside a child product repo).
3. Render `IDEA.md` from the conversation, populated per the structured
   template at `agents/specs/IDEA.template.md` (or `.agents/specs/IDEA.template.md`
   in child repos).
4. Set front-matter `status: draft` initially.
5. Run the IDEA quality gate via the `spec-review` skill in IDEA mode (or
   directly via `bash agents/scripts/lint-spec.sh specs/<spec_id>/IDEA.md`).
6. If the gate passes, set `status: ready-for-spec`. If it fails, leave
   `status: draft` and surface failures with file:line citations. If the
   IDEA contains questions only the owner can answer, set
   `status: owner-blocking`.

Use the `spec-authoring` skill. Citation grammar applies; agent memory
and training are LEGITIMATE INPUTS to the conversation but MUST NOT
appear as evidence in the artefact.
