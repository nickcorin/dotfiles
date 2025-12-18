#!/bin/sh

# Only run on macOS.
case "$OSTYPE" in
    darwin*) ;;
    *) return 0 2>/dev/null || exit 0 ;;
esac

if ! command -v brew >/dev/null 2>&1; then
    echo "Warning: Homebrew is not installed. Install from: https://brew.sh" >&2
    return 0 2>/dev/null || exit 0
fi

brew_prefix=$(brew --prefix 2>/dev/null)
if [ -z "$brew_prefix" ]; then
    echo "Error: Could not determine brew prefix" >&2
    return 1 2>/dev/null || exit 1
fi

# NOTE: This was a workaround for brew when Apple Silicon chips were still first-gen, and may no longer be necessary.
if [ "$(uname -m)" = "arm64" ]; then
    alias brew="arch -arm64 brew"
fi

# Set up brew environment.
eval "$($brew_prefix/bin/brew shellenv)"

# Source zsh plugins if available.
if [ -f "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    . "$brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    . "$brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
