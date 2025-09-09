#!/usr/bin/env bash
set -euo pipefail

# Configure system-wide zsh to use ~/.config/zsh as ZDOTDIR.

# Only run on systems with zsh.
if ! command -v zsh &>/dev/null; then
    echo "zsh not found, skipping ZDOTDIR configuration"
    exit 0
fi

ZSHENV_FILE="/etc/zshenv"
ZDOTDIR_LINE="export ZDOTDIR=\$HOME/.config/zsh"

# Check if the line already exists.
if grep -Fxq "$ZDOTDIR_LINE" "$ZSHENV_FILE" 2>/dev/null; then
    echo "ZDOTDIR already configured in $ZSHENV_FILE."
    exit 0
fi

echo "Configuring ZDOTDIR in $ZSHENV_FILE"

# Add the line to /etc/zshenv (requires sudo)
if sudo sh -c "echo '$ZDOTDIR_LINE' >> '$ZSHENV_FILE'"; then
    echo "Successfully added ZDOTDIR configuration to $ZSHENV_FILE"
else
    echo "Failed to configure ZDOTDIR. You may need to manually add:"
    echo "   $ZDOTDIR_LINE"
    echo "   to $ZSHENV_FILE"
    exit 1
fi
