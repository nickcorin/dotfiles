#!/bin/bash
set -eufo pipefail

# Set Zsh as default shell if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🐚 Setting Zsh as default shell..."
    chsh -s "$(which zsh)"
    echo "✅ Default shell changed to Zsh. Please restart your terminal."
fi