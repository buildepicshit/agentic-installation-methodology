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
# USAGE
#   install-copilot-hooks.sh            install / update
#   install-copilot-hooks.sh --check    report only, never mutate
#   install-copilot-hooks.sh --roots    print the allowlist this machine would use
#   install-copilot-hooks.sh --uninstall
#
# EXIT (--check): 0 installed and current | 1 absent, stale or hand-edited | 2 unusable
set -uo pipefail

SRC_REL="agents/copilot-hooks/bes-fleet.json"
DEST_DIR="${COPILOT_HOME:-$HOME/.copilot}/hooks"
DEST="$DEST_DIR/bes-fleet.json"
STAMP="$DEST_DIR/.bes-fleet.sha256"   # digest of what WE last wrote
MODE="${1:-install}"

say() { printf 'install-copilot-hooks: %s\n' "$1"; }

root=$(git rev-parse --show-toplevel 2>/dev/null) || root="$PWD"
SRC=""
for c in "$root/$SRC_REL" "$root/.${SRC_REL}"; do
    [ -f "$c" ] && { SRC="$c"; break; }
done
[ -n "$SRC" ] || { say "canonical $SRC_REL not found under $root — nothing to install"; exit 2; }

# --- fleet roots ------------------------------------------------------------
# Derived from the roster manifests, resolved against the studio root (this
# repo's parent). Each is canonicalised so a symlinked or relative path cannot
# slip past the allowlist. The policy repo itself is always included.
fleet_roots() {
    local base manifests m line p
    base=$(cd "$root/.." 2>/dev/null && pwd -P) || return 1
    manifests=""
    for m in fleet-internal-repos.txt fleet-oss-repos.txt fleet-local-only-repos.txt; do
        for d in "$root/agents/scripts" "$root/.agents/scripts"; do
            [ -f "$d/$m" ] && { manifests="$manifests $d/$m"; break; }
        done
    done
    { printf '%s\n' "$(cd "$root" && pwd -P)"
      for m in $manifests; do
          while IFS= read -r line; do
              case "$line" in ''|\#*) continue ;; esac
              p=$(cd "$base/$line" 2>/dev/null && pwd -P) || continue
              printf '%s\n' "$p"
          done < "$m"
      done
    } | sort -u
}

render() {  # render -> the installable JSON on stdout
    local roots pattern
    roots=$(fleet_roots) || return 1
    [ -n "$roots" ] || return 1
    # `case` alternation: /a|/b|/c
    pattern=$(printf '%s' "$roots" | paste -sd'|' -)
    # Substitute with a literal-safe replacement (paths contain / but no |).
    awk -v pat="$pattern" '{ gsub(/@@FLEET_ROOTS@@/, pat); print }' "$SRC"
}

case "$MODE" in
  --roots)
      fleet_roots; exit 0 ;;

  --check)
      if [ ! -f "$DEST" ]; then
          say "NOT INSTALLED — Copilot agents in fleet repos are gated by git hooks ONLY."
          say "  9 of 14 guardrails (bulk-staging, verify-bypass, undeclared-deps,"
          say "  security-surface, ...) do not fire for Copilot on this machine."
          say "  Fix: bash agents/scripts/install-copilot-hooks.sh"
          exit 1
      fi
      tmp=$(mktemp) || exit 2
      if ! render > "$tmp" 2>/dev/null; then rm -f "$tmp"; say "cannot resolve fleet roots"; exit 2; fi
      if cmp -s "$tmp" "$DEST"; then rm -f "$tmp"; say "installed and current ($DEST)"; exit 0; fi
      rm -f "$tmp"
      say "STALE — $DEST differs from what this repo would install"
      say "  Fix: bash agents/scripts/install-copilot-hooks.sh"
      exit 1
      ;;

  --uninstall)
      rm -f "$DEST" "$STAMP" && say "removed $DEST (Copilot returns to git-hooks-only)"
      exit 0 ;;

  install|"")
      mkdir -p "$DEST_DIR" 2>/dev/null || { say "cannot create $DEST_DIR"; exit 2; }
      tmp=$(mktemp) || exit 2
      render > "$tmp" 2>/dev/null || { rm -f "$tmp"; say "cannot resolve fleet roots — refusing to install an unguarded file"; exit 2; }
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
      say "allowlisted roots: $(fleet_roots | wc -l | tr -d ' ')"
      say "verify: run 'git add -A --dry-run' via Copilot inside a fleet repo (expect DENY)"
      exit 0 ;;

  *) say "usage: $(basename "$0") [--check|--roots|--uninstall]"; exit 2 ;;
esac
