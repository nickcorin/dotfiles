#!/bin/sh

# Zoxide initialization script

# Check if zoxide is available
if ! command -v zoxide >/dev/null 2>&1; then
    echo "Warning: Zoxide is not installed. Install with: brew install zoxide" >&2
    return 0 2>/dev/null || exit 0
fi

# Initialize zoxide (runs every shell session to set up aliases)
eval "$(zoxide init zsh)"