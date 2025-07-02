#!/bin/sh

# Homebrew initialization script

# Only run on macOS
case "$OSTYPE" in
    darwin*) ;;
    *) return 0 2>/dev/null || exit 0 ;;
esac

# Check if homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Warning: Homebrew is not installed. Install from: https://brew.sh" >&2
    return 0 2>/dev/null || exit 0
fi

# Get brew prefix
brew_prefix=$(brew --prefix 2>/dev/null)
if [ -z "$brew_prefix" ]; then
    echo "Error: Could not determine brew prefix" >&2
    return 1 2>/dev/null || exit 1
fi

# Architecture-specific alias for Apple Silicon (runs every shell session)
if [ "$(uname -m)" = "arm64" ]; then
    alias brew="arch -arm64 brew"
fi

# Set up brew environment (runs every shell session to set PATH)
eval "$($brew_prefix/bin/brew shellenv)"

# Source zsh plugins if available (runs every shell session)
if [ -f "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    . "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    . "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi