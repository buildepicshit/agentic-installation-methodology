# Idea Capture

Single source: the `/idea-capture` slash-command
(`.claude/commands/idea-capture.md`) is the invocation surface; the
`spec-authoring` skill (`agents/skills/spec-authoring/SKILL.md`) owns
the grill tactics and authoring mechanics.

Dual-path convention (part of the contract — do not re-derive it by
hand elsewhere): spec folders live at `specs/<spec_id>/` in
`bes-fleet-policy` and at `.agents/specs/<spec_id>/` in child repos.
