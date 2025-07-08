#!/bin/sh

# Refresh context in current shell from tmux environment

if [ -z "${TMUX:-}" ]; then
    echo "Not in a tmux session"
    exit 1
fi

# Get context from tmux
context=$(tmux show-environment CURRENT_DOTFILES_CONTEXT 2>/dev/null | cut -d= -f2)

if [ -n "$context" ] && [ "$context" != "$CURRENT_DOTFILES_CONTEXT" ]; then
    echo "Refreshing context to: $context"
    export CURRENT_DOTFILES_CONTEXT="$context"
    
    # Get all tmux environment variables and export them
    tmux show-environment | grep -v "^-" | while IFS= read -r line; do
        export "$line"
    done
    
    echo "Context refreshed"
else
    echo "Context already up to date"
fi