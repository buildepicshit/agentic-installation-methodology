#!/usr/bin/env bash
# install-pre-push-hook.sh — install/uninstall/check the BES
# fleet CI pre-push hook. Installs into the repo's ACTIVE hooks
# path: `.git/hooks/pre-push` by default, or `<core.hooksPath>/pre-push`
# when `core.hooksPath` is set (fleet posture uses `.githooks/`).
#
# Per specs/2026-05-25-fleet-ci-bootstrap/SPEC.md §7.5.
#
# Modes:
#   install-pre-push-hook.sh             install (default)
#   install-pre-push-hook.sh --uninstall remove (only if BES-installed)
#   install-pre-push-hook.sh --check     report install status
#   install-pre-push-hook.sh --help      usage

set -uo pipefail

MARKER="BES fleet CI pre-push hook"

resolve_template() {
    local script_dir
    script_dir="$(cd "$(dirname "$0")" && pwd)"
    local candidates=(
        "${CLAUDE_PROJECT_DIR:-}/agents/githooks/pre-push"
        "${CLAUDE_PROJECT_DIR:-}/.agents/githooks/pre-push"
        "$script_dir/../githooks/pre-push"
    )
    for c in "${candidates[@]}"; do
        if [ -f "$c" ]; then
            echo "$c"
            return 0
        fi
    done
    return 1
}

resolve_target() {
    local repo_root
    repo_root="$(git rev-parse --show-toplevel 2>/dev/null)" || {
        echo ""
        return 1
    }
    # Honor core.hooksPath if set. Fleet repos use
    # `git config core.hooksPath .githooks` per fleet-sync.sh, so
    # installing into .git/hooks/pre-push would be invisible to git.
    local hooks_path
    hooks_path="$(git -C "$repo_root" config --get core.hooksPath 2>/dev/null || true)"
    if [ -n "$hooks_path" ]; then
        # core.hooksPath can be absolute or repo-relative.
        case "$hooks_path" in
            /*) echo "$hooks_path/pre-push" ;;
            *)  echo "$repo_root/$hooks_path/pre-push" ;;
        esac
    else
        echo "$repo_root/.git/hooks/pre-push"
    fi
}

is_bes_installed() {
    local target="$1"
    [ -e "$target" ] && head -n3 "$target" 2>/dev/null | grep -qF "$MARKER"
}

do_install() {
    local template target
    template="$(resolve_template)" || {
        echo "install-pre-push-hook: template not found" >&2
        return 1
    }
    target="$(resolve_target)" || {
        echo "install-pre-push-hook: not inside a git repo (git rev-parse failed)" >&2
        return 1
    }

    if is_bes_installed "$target"; then
        echo "install-pre-push-hook: already installed at $target (idempotent)"
        return 0
    fi

    if [ -e "$target" ]; then
        echo "install-pre-push-hook: refusing to overwrite existing pre-push hook at $target (not installed by BES)" >&2
        echo "  remove or merge the existing hook manually, then re-run." >&2
        return 1
    fi

    mkdir -p "$(dirname "$target")"
    # Prefer symlink for live updates; fall back to copy on
    # platforms where symlinks aren't supported.
    if ln -s "$template" "$target" 2>/dev/null; then
        :
    else
        cp "$template" "$target"
        chmod +x "$target"
    fi
    echo "install-pre-push-hook: installed $template -> $target"
}

do_uninstall() {
    local target
    target="$(resolve_target)" || {
        echo "install-pre-push-hook: not inside a git repo" >&2
        return 1
    }
    if [ ! -e "$target" ]; then
        echo "install-pre-push-hook: nothing to uninstall (no $target)"
        return 0
    fi
    if ! is_bes_installed "$target"; then
        echo "install-pre-push-hook: refusing to remove pre-push hook at $target (not BES-installed)" >&2
        return 1
    fi
    rm -f "$target"
    echo "install-pre-push-hook: uninstalled $target"
}

do_check() {
    local target
    target="$(resolve_target)" || {
        echo "not inside a git repo"
        return 0
    }
    if is_bes_installed "$target"; then
        echo "installed: $target"
    elif [ -e "$target" ]; then
        echo "pre-push exists but not BES-installed: $target"
    else
        echo "not installed: $target absent"
    fi
}

main() {
    case "${1:-}" in
        --help|-h)
            cat <<'USAGE'
install-pre-push-hook.sh — install/uninstall the BES fleet
CI pre-push hook into the current git repo.

Modes:
  install-pre-push-hook.sh              install (default)
  install-pre-push-hook.sh --uninstall  remove (only if BES-installed)
  install-pre-push-hook.sh --check      report install status
  install-pre-push-hook.sh --help       this message
USAGE
            return 0
            ;;
        --uninstall)
            do_uninstall
            return $?
            ;;
        --check)
            do_check
            return 0
            ;;
        ""|--install)
            do_install
            return $?
            ;;
        *)
            echo "unknown mode: $1" >&2
            return 2
            ;;
    esac
}

main "$@"
