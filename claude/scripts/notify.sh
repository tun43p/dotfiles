#!/usr/bin/env bash
# Claude Code notification hook — visual (terminal-notifier) + sound (afplay).
# Usage: notify.sh <kind>   where kind ∈ done | error | permission
# Wired from the Stop / Notification hooks in ~/.claude/settings.json.

set -euo pipefail

# Drain hook JSON from stdin so the pipe closes cleanly (payload unused).
cat >/dev/null 2>&1 || true

kind="${1:-done}"

# Use $DOTS when set; otherwise derive the repo root from this script's real
# location (resolves the ~/.claude symlink) so the GUI-launch case still works.
repo_root="$(cd -P "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
assets="${DOTS:-$repo_root}/assets/audio"

case "$kind" in
  done)       message="Travail terminé." ;        sound="done" ;;
  error)      message="Une erreur est survenue." ; sound="error" ;;
  permission) message="Permission requise." ;      sound="ping" ;;
  question)   message="Question en attente." ;     sound="ping" ;;
  idle)       message="En attente de ta réponse." ; sound="ping" ;;
  *)          message="$kind" ;                    sound="done" ;;
esac

# Detect the front app so a click on the notification re-focuses it.
# In the VSCode extension the hook gets neither TERM_PROGRAM nor VSCODE_INJECTION,
# but CLAUDE_CODE_ENTRYPOINT=claude-vscode is reliably set.
if [[ "${CLAUDE_CODE_ENTRYPOINT:-}" == "claude-vscode" || "${__CFBundleIdentifier:-}" == "com.microsoft.VSCode" || "${TERM_PROGRAM:-}" == "vscode" || -n "${VSCODE_INJECTION:-}" ]]; then
  app="Visual Studio Code"
elif [[ -n "${KITTY_WINDOW_ID:-}" || "${TERM:-}" == "xterm-kitty" ]]; then
  app="kitty"
else
  app="Terminal"
fi

# Click focuses the terminal app; inside tmux, also jump to the exact pane.
click="open -a '$app'"
tmux_bin="$(command -v tmux || true)"
if [[ -n "${TMUX_PANE:-}" && -n "$tmux_bin" ]]; then
  click="$click; '$tmux_bin' select-window -t '$TMUX_PANE'; '$tmux_bin' select-pane -t '$TMUX_PANE'"
fi

if command -v terminal-notifier >/dev/null 2>&1; then
  terminal-notifier -title "Claude Code" -message "$message" \
    -execute "$click" >/dev/null 2>&1 || true
fi

# Sound (fire-and-forget so the hook returns immediately).
audio="$assets/$sound.aiff"
if [[ -f "$audio" ]] && command -v afplay >/dev/null 2>&1; then
  ( afplay "$audio" >/dev/null 2>&1 & )
fi

exit 0
