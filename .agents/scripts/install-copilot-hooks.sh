#!/usr/bin/env bash
# install-copilot-hooks.sh — install the BES guardrails for GitHub Copilot CLI.
#
# WHY USER-LEVEL, AND WHY THAT IS A COMPROMISE
#   Every other fleet guardrail travels with the repo. This one cannot. Copilot
#   CLI 1.0.78 does not load repo-level `.github/hooks/*.json` (nor the
#   cross-tool `.claude/settings.json` block) — measured, not assumed — while
#   `~/.copilot/hooks/*.json` loads and enforces. So the only working path to
#   parity is a per-machine file `fleet-sync.sh` cannot deliver.
#
# THE TRUST BOUNDARY IS THE POINT
#   A user-level hook fires in EVERY repository on the machine. The first draft
#   guarded on `[ -f .claude/hooks/<name>.sh ]`, which is a scope filter and NOT
#   a trust boundary: an untrusted repo can ship a file with that name, and it
#   was then executed (measured — cross-family review, 2026-08-06). So the
#   installed hooks run only when the repo ROOT is on an explicit allowlist
#   stamped in here, derived from the fleet roster. The root is resolved with
#   `git rev-parse --show-toplevel`, so a session started in a SUBDIRECTORY is
#   still gated; `$PWD` left every subdirectory silently ungated.
#
#   Authority: file://specs/2026-08-06-copilot-guardrail-parity/SPEC.md S2
#
# THE ALLOWLIST IS A FUNCTION OF THE FLEET, NEVER OF THE CALLER
#   Everything below is anchored on THIS SCRIPT'S OWN LOCATION, never on the
#   caller's working directory. The previous version resolved the repo with
#   `git rev-parse --show-toplevel` against `$PWD` and then used that as "the
#   policy repo", so `--roots` rendered 12 entries from bes-fleet-policy and 11
#   from any child — dropping bes-fleet-policy itself, because a child's own
#   root is already on the roster and `sort -u` absorbed it. `--check` then
#   reported STALE forever from a child, and the remediation it printed would
#   have installed an allowlist ungating the one repo where every fleet rule
#   originates. Same class as the lesson already recorded at
#   `fleet-track.sh` ("Manifests are read from $script_dir, NEVER from
#   $root/agents/scripts"), learned 2026-07-24 and again 2026-07-26.
#
#   Authority: file://specs/2026-08-06-copilot-allowlist-caller-derived/SPEC.md
#
# USAGE
#   install-copilot-hooks.sh            install / update
#   install-copilot-hooks.sh --check    report only, never mutate
#   install-copilot-hooks.sh --roots    print the allowlist this machine would use
#   install-copilot-hooks.sh --uninstall
#
# EXIT (--check): 0 installed and current | 1 absent, stale or hand-edited | 2 unusable
set -uo pipefail

DEST_DIR="${COPILOT_HOME:-$HOME/.copilot}/hooks"
DEST="$DEST_DIR/bes-fleet.json"
STAMP="$DEST_DIR/.bes-fleet.sha256"   # digest of what WE last wrote
MODE="${1:-install}"
POLICY_REPO_NAME="bes-fleet-policy"

say() { printf 'install-copilot-hooks: %s\n' "$1"; }
err() { printf 'install-copilot-hooks: %s\n' "$1" >&2; }

# --- anchoring ---------------------------------------------------------------
# `${BASH_SOURCE[0]}` rather than `$0` so the file can be SOURCED by the
# acceptance harness without the paths shifting to the sourcing script.
_self="${BASH_SOURCE[0]:-$0}"
SELF=$(readlink -f -- "$_self" 2>/dev/null) || SELF="$_self"
script_dir=$(CDPATH= cd -- "$(dirname -- "$SELF")" 2>/dev/null && pwd -P) || script_dir=""
[ -n "$script_dir" ] || { err "cannot resolve this script's own directory"; exit 2; }
# This repo: agents/scripts/.. -> repo root (identical shape for the propagated
# .agents/scripts/ copy). Studio root is one further up.
repo_root=$(CDPATH= cd -- "$script_dir/../.." 2>/dev/null && pwd -P) || repo_root=""
studio_root=$(CDPATH= cd -- "$script_dir/../../.." 2>/dev/null && pwd -P) || studio_root=""

SRC="$script_dir/../copilot-hooks/bes-fleet.json"
[ -f "$SRC" ] || { err "canonical copilot-hooks/bes-fleet.json not found beside $script_dir — nothing to install"; exit 2; }

# --- the policy repo ---------------------------------------------------------
# `bes-fleet-policy` is deliberately absent from the three roster manifests
# (it is the propagation SOURCE, not a destination), so it must be resolved
# here — and resolved the SAME WAY from every fleet location.
# ONE rule, applied identically from every location: the policy repo is the
# canonically-named checkout at the studio root, and it must carry the undotted
# `agents/scripts/fleet-files.txt` marker. Resolution is therefore a function of
# WHERE THE FLEET IS, never of which copy of this script is running.
#
# An earlier draft had a "step 1" that trusted the script's own repo whenever it
# sat in an undotted `agents/` tree, and its comment called that
# "unspoofable by a sibling directory". That was WRONG, and measurably so:
# `repo_root` is computed as `$script_dir/../..`, so
# `[ "$script_dir" = "$repo_root/agents/scripts" ]` is TAUTOLOGICAL — true for
# any path ending in /agents/scripts. A second checkout or `git worktree add
# ../bfp-feature` (which AGENTS.md "Workspace Rules" positively directs agents
# to make) therefore claimed ITSELF as the policy repo: `--roots` from it
# emitted 12 roots containing the worktree and NOT bes-fleet-policy, exit 0,
# same count, no warning — the exact ungating this SPEC exists to prevent,
# reintroduced through a different door. The fail-closed tripwire could not
# catch it either, because `policy_is_gated` asks whether policy_root()'s own
# answer is present, and it always is.
# Found by adversarial review, 2026-08-06; reproduced before fixing.
#
# Deliberately NOT a glob over "any sibling that looks like a policy repo":
# presence-based discovery is forgeable, and merely CLONING a repo into the
# studio root must never grant it machine-wide hook execution.
policy_root() {
    local cand
    [ -n "$studio_root" ] || return 1
    cand="$studio_root/$POLICY_REPO_NAME"
    [ -f "$cand/agents/scripts/fleet-files.txt" ] || return 1
    (CDPATH= cd -- "$cand" 2>/dev/null && pwd -P)
}

# Every root is spliced into a shell `case` alternation that lives inside the
# generated JSON and is later EXECUTED by Copilot. That makes path characters
# executable, and all three failure modes are silent:
#   $ ( ) `        command substitution — `/x/$(touch PWNED)` runs at hook
#                  evaluation time (reproduced, cross-family review 2026-08-06)
#   * ? [ ]        `case` patterns are GLOBS, not literals: `/home/*` admits
#                  every unauthorised root under /home
#   | ) ; " \      break out of the case alternation or the JSON string
#   &              in an awk gsub REPLACEMENT expands to the MATCHED text, so
#                  `/a&b` renders as `/a@@FLEET_ROOTS@@b` — a pattern that can
#                  never match, silently UNGATING that repo
#   whitespace     splits or corrupts the pattern
# So roots are allowlisted by CHARACTER, not sanitised: an unexpected character
# means the operator gets a refusal, never a quietly wrong allowlist. Every real
# fleet path is `/`, alphanumerics, dot, underscore, hyphen.
root_is_safe() {
    case "$1" in
        ''|*[!/A-Za-z0-9._-]*) return 1 ;;
        *) return 0 ;;
    esac
}

# Fail-closed tripwire. The allowlist is caller-invariant by construction, so
# this cannot fire through the normal path today. It exists to catch a FUTURE
# reintroduction of caller-derived roots BEFORE that silently ungates the one
# repo where every fleet rule originates.
policy_is_gated() {   # $1 = rendered roots, newline-separated
    local policy
    policy=$(policy_root) || return 1
    printf '%s\n' "$1" | grep -qxF -- "$policy"
}

# --- fleet roots -------------------------------------------------------------
# Derived from the roster manifests, resolved against the studio root. Each is
# canonicalised so a symlinked or relative path cannot slip past the allowlist.
# Collation is PINNED to C: `sort -u` orders by locale, so an unpinned sort makes
# the rendered bytes a function of the caller's LC_COLLATE and `--check` reports
# STALE on a correctly-installed machine whenever install and check ran under
# different locales — the very false-STALE symptom this SPEC exists to remove,
# arriving by a second route. Measured: the live 12-root list renders to
# different bytes under LC_ALL=C vs en_US.UTF-8.
# Manifests are read from `$script_dir`, NEVER from a CWD-derived path: this
# repo carries them at `agents/scripts/`, every child at `.agents/scripts/`.
fleet_roots() {
    local policy m line p
    policy=$(policy_root) || return 1
    { printf '%s\n' "$policy"
      for m in fleet-internal-repos.txt fleet-oss-repos.txt fleet-local-only-repos.txt; do
          [ -f "$script_dir/$m" ] || continue
          while IFS= read -r line; do
              case "$line" in ''|\#*) continue ;; esac
              p=$(CDPATH= cd -- "$studio_root/$line" 2>/dev/null && pwd -P) || continue
              printf '%s\n' "$p"
          done < "$script_dir/$m"
      done
    } | LC_ALL=C sort -u
}

# The ONE checked path to an allowlist. Every consumer goes through this, so
# `--roots` is a truthful preview of exactly what `install` would write — it
# previously printed whatever `fleet_roots` produced and exited 0 regardless,
# which would have shown an unusable allowlist as if it were fine.
resolved_roots() {  # roots on stdout; refusal on stderr + nonzero
    local roots
    roots=$(fleet_roots) || {
        err "cannot identify $POLICY_REPO_NAME from $script_dir — refusing to produce an allowlist that may not gate it"
        return 1
    }
    [ -n "$roots" ] || { err "fleet roots resolved empty"; return 1; }
    local r
    while IFS= read -r r; do
        root_is_safe "$r" || {
            err "REFUSING — root contains a character that is executable inside the generated hook: '$r'"
            err "  Allowed: / A-Z a-z 0-9 . _ -   Rename or relocate the checkout, then re-run."
            return 1
        }
    done <<EOF
$roots
EOF
    policy_is_gated "$roots" || {
        err "REFUSING — the allowlist omits $POLICY_REPO_NAME; installing it would ungate the repo where every fleet rule originates"
        return 1
    }
    printf '%s\n' "$roots"
}

render() {  # render -> the installable JSON on stdout
    local roots pattern
    roots=$(resolved_roots) || return 1
    # `case` alternation: /a|/b|/c
    pattern=$(printf '%s' "$roots" | paste -sd'|' -)
    # Substitute with a literal-safe replacement (paths contain / but no |).
    awk -v pat="$pattern" '{ gsub(/@@FLEET_ROOTS@@/, pat); print }' "$SRC"
}

# Sourceable for test (AC-5): when SOURCED rather than executed, define the
# functions above and stop before the dispatch. No writes happen above here.
#
# `return` is only legal in a sourced file or a function, so this tests HOW WE
# WERE ENTERED. The obvious `[ "${BASH_SOURCE[0]}" = "$0" ]` tests $0, which is
# CALLER-CONTROLLED: a caller that sources this file with $0 set to its path ran
# the full install dispatch — a machine-wide write — by accident. That is not
# hypothetical; it is how this repo's own acceptance harness rewrote
# ~/.copilot/hooks/bes-fleet.json on its first run (2026-08-06).
(return 0 2>/dev/null) && return 0

case "$MODE" in
  --roots)
      resolved_roots || exit 2
      exit 0 ;;

  --check)
      if [ ! -f "$DEST" ]; then
          say "NOT INSTALLED — Copilot agents in fleet repos are gated by git hooks ONLY."
          say "  9 of 14 guardrails (bulk-staging, verify-bypass, undeclared-deps,"
          say "  security-surface, ...) do not fire for Copilot on this machine."
          say "  Fix: bash $SELF"
          exit 1
      fi
      tmp=$(mktemp) || exit 2
      if ! render > "$tmp"; then rm -f "$tmp"; say "cannot resolve fleet roots"; exit 2; fi
      if cmp -s "$tmp" "$DEST"; then rm -f "$tmp"; say "installed and current ($DEST)"; exit 0; fi
      rm -f "$tmp"
      say "STALE — $DEST differs from what this repo would install"
      say "  Fix: bash $SELF"
      exit 1
      ;;

  --uninstall)
      # The status must reflect the removal, not just gate the message: `rm -f
      # ... && say ...; exit 0` reported success even when the unlink failed.
      if rm -f "$DEST" "$STAMP"; then
          say "removed $DEST (Copilot returns to git-hooks-only)"
          exit 0
      fi
      say "could not remove $DEST — Copilot may still be running these hooks"
      exit 2 ;;

  install|"")
      mkdir -p "$DEST_DIR" 2>/dev/null || { say "cannot create $DEST_DIR"; exit 2; }
      tmp=$(mktemp) || exit 2
      render > "$tmp" || { rm -f "$tmp"; say "refusing to install an unguarded file"; exit 2; }
      # Refuse to clobber anything we did not write, and anything we DID write
      # that has since been hand-edited. The marker comment alone was not
      # enough: a user could add hooks while keeping the comment, and the
      # installer would silently discard them (cross-family review, 2026-08-06).
      if [ -e "$DEST" ]; then
          if [ -f "$STAMP" ] && [ "$(sha256sum < "$DEST" | cut -d' ' -f1)" = "$(cat "$STAMP")" ]; then
              : # untouched since we wrote it — safe to update
          else
              rm -f "$tmp"
              say "REFUSING — $DEST exists and was not written by this installer, or has been edited since."
              say "  Diff it, merge what you want, then remove it and re-run."
              exit 1
          fi
      fi
      mv -f "$tmp" "$DEST" || { rm -f "$tmp"; say "install failed"; exit 2; }
      sha256sum < "$DEST" | cut -d' ' -f1 > "$STAMP"
      say "installed $DEST"
      say "allowlisted roots: $(resolved_roots | wc -l | tr -d ' ')"
      say "verify: run 'git add -A --dry-run' via Copilot inside a fleet repo (expect DENY)"
      exit 0 ;;

  *) say "usage: $(basename "$0") [--check|--roots|--uninstall]"; exit 2 ;;
esac
