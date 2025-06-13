#!/usr/bin/env sh
# tmux-plugin.sh: Portable tmux helper for any POSIX shell
# Provides a tmux wrapper that can autostart, autoconnect, and autoquit

# Default configuration (override in your shell rc)
: "${TMUX_AUTOSTART:=true}"
: "${TMUX_AUTOSTART_ONCE:=true}"
: "${TMUX_AUTOCONNECT:=true}"
: "${TMUX_AUTOQUIT:=$TMUX_AUTOSTART}"
: "${TMUX_DEFAULT_SESSION_NAME:=session}"
: "${TMUX_FIXTERM:=true}"
: "${TMUX_FIXTERM_WITHOUT_256COLOR:=screen}"
: "${TMUX_FIXTERM_WITH_256COLOR:=screen-256color}"

# Ensure tmux is installed
if ! command -v tmux >/dev/null 2>&1; then
  printf 'tmux-plugin: tmux not found. Please install tmux.\n' >&2
  return 1 2>/dev/null || exit 1
fi

# Determine TERM based on color support
if command -v tput >/dev/null 2>&1 && [ "$(tput colors)" -ge 256 ]; then
  export TMUX_TERM="$TMUX_FIXTERM_WITH_256COLOR"
else
  export TMUX_TERM="$TMUX_FIXTERM_WITHOUT_256COLOR"
fi

# Core tmux wrapper function
tmux_run() {
  if [ "$#" -gt 0 ]; then
    command tmux "$@"
    return
  fi

  if [ "$TMUX_AUTOCONNECT" = "true" ]; then
    # Attach or switch/create session
    command tmux attach -t "$TMUX_DEFAULT_SESSION_NAME" 2>/dev/null \
      || command tmux new-session -A -s "$TMUX_DEFAULT_SESSION_NAME"
  else
    command tmux new-session -s "$TMUX_DEFAULT_SESSION_NAME"
  fi

  # Auto-quit if configured and not already inside tmux
  if [ "$TMUX_AUTOQUIT" = "true" ] && [ -z "$TMUX" ]; then
    exit
  fi
}

# Autostart tmux on shell launch if enabled
if [ -z "$TMUX" ] && [ "$TMUX_AUTOSTART" = "true" ]; then
  if [ "$TMUX_AUTOSTART_ONCE" = "false" ] || [ -z "$TMUX_STARTED" ]; then
    export TMUX_STARTED=true
    tmux_run
  fi
fi
