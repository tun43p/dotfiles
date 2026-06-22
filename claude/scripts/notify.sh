#!/usr/bin/env bash
# Claude Code notification hook — visual (terminal-notifier) + sound (afplay).
# Usage: notify.sh <kind>   where kind ∈ done | error | permission
# Wired from the Stop / Notification hooks in ~/.claude/settings.json.

set -euo pipefail

# Disable audio
WITH_AUDIO="false"

payload="$(cat 2>/dev/null || true)"
kind="${1:-done}"

# Label each notification by project so multiple VSCode tabs/windows are
# distinguishable, and group by session so they stack instead of overwriting.
cwd="$(printf '%s' "$payload" | sed -n 's/.*"cwd":[[:space:]]*"\([^"]*\)".*/\1/p')"
project="$(basename "${cwd:-$PWD}")"
group="${CLAUDE_CODE_SESSION_ID:-$project}"

# Use $DOTS when set; otherwise derive the repo root from this script's real
# location (resolves the ~/.claude symlink) so the GUI-launch case still works.
repo_root="$(cd -P "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
assets="${DOTS:-$repo_root}/assets/audio"

case "$kind" in
  done)       message="Travail terminé." ;          sound="warcraft-done" ;;
  error)      message="Une erreur est survenue." ;  sound="windows-error" ;;
  permission) message="Permission requise." ;       sound="shocked" ;;
  question)   message="Question en attente." ;      sound="metal-gear-solid" ;;
  idle)       message="En attente de ta réponse." ; sound="correct" ;;
  *)          message="$kind" ;                     sound="gta-v-notification" ;;
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

# Build the click action: focus the right window, then narrow if we can.
if [[ "$app" == "Visual Studio Code" && -n "$cwd" ]]; then
  # `open -a` sends an Apple event to the running app — no `code` CLI helper, so
  # no extra Electron process bouncing in the Dock. Still raises the folder's
  # window/native-tab.
  click="open -a 'Visual Studio Code' '$cwd'"
else
  click="open -a '$app'"
  # Inside tmux, jump to the exact session, window and pane.
  tmux_bin="$(command -v tmux || true)"
  if [[ -n "${TMUX_PANE:-}" && -n "$tmux_bin" ]]; then
    click="$click; '$tmux_bin' switch-client -t '$TMUX_PANE' 2>/dev/null; '$tmux_bin' select-window -t '$TMUX_PANE'; '$tmux_bin' select-pane -t '$TMUX_PANE'"
  fi
fi

if command -v terminal-notifier >/dev/null 2>&1; then
  terminal-notifier -title "Claude Code — $project" -message "$message" \
    -group "$group" -execute "$click" >/dev/null 2>&1 || true
fi

# Sound (fire-and-forget so the hook returns immediately).
if [[ "$WITH_AUDIO" == "false" ]]; then
  exit 0
fi

audio="$assets/$sound.aiff"
if [[ -f "$audio" ]] && command -v afplay >/dev/null 2>&1; then
  ( afplay "$audio" >/dev/null 2>&1 & )
fi

exit 0
