---
tracker:
  kind: linear
  endpoint: https://api.linear.app/graphql
  api_key: $LINEAR_API_KEY
  project_slug: agentic-installation-methodology
  active_states:
    - Todo
    - In Progress
    - In Review
  terminal_states:
    - Done
    - Canceled
    - Duplicate
polling:
  interval_ms: 30000
workspace:
  root: /var/home/hasnobeef/buildepicshit/.symphony/workspaces/agentic-installation-methodology
hooks:
  after_create: |
    git clone git@github.com:buildepicshit/agentic-installation-methodology.git .
  before_run: null
  after_run: null
  before_remove: null
  timeout_ms: 60000
agent:
  max_concurrent_agents: 1
  max_turns: 20
  max_retry_backoff_ms: 300000
codex:
  command: codex app-server
  approval_policy: on-request
  thread_sandbox: workspace-write
  turn_timeout_ms: 3600000
  read_timeout_ms: 5000
  stall_timeout_ms: 300000
bes:
  repo: agentic-installation-methodology
  posture: oss-public
  default_branch: main
---

# agentic-installation-methodology Workflow

This is the **public OSS** repo for the agentic installation
methodology longread (V1 shipped: 9 chapters, 7154 prose words).
`.agents/` and `.claude/` are gitignored on this repo's GitHub
remote per the fleet's public-OSS posture
(`file://agents/OPERATING_MODEL.md` "Public OSS posture"). Fleet
content lays into the working tree only; it does NOT push to the
public remote. Treat any change that touches `.agents/` or
`.claude/` as local-only unless an approved SPEC explicitly says
otherwise. PR plans MUST be low-noise and owner-approved before
any public CI churn.

<!--
Fleet-baseline WORKFLOW.md prompt body. Authored once in
bes-fleet-policy/agents/templates/WORKFLOW.body.md, propagated
into each repo by fleet-sync. Do not hand-edit below this line
in product repos.
-->
