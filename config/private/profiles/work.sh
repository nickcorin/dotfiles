#!/bin/sh

# Work profile configuration
# All environment variables and settings for work use

# Check if 1Password CLI is available and authenticated
if ! command -v op >/dev/null 2>&1 || ! op account list >/dev/null 2>&1; then
    echo "Warning: 1Password CLI not available or not authenticated for work profile" >&2
    return 0 2>/dev/null || exit 0
fi

# SSH Configuration - Use 1Password SSH agent if available
setup_ssh_agent

# Work profile loaded (check $DOTFILES_PROFILE to verify)

