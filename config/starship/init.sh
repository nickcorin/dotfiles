#!/bin/sh

# Starship prompt initialization script

# Check if starship is available
if ! command -v starship >/dev/null 2>&1; then
    echo "Warning: Starship is not installed. Install with: brew install starship" >&2
    return 0 2>/dev/null || exit 0
fi

# Configure and initialize starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"
