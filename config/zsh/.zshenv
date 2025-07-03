# Environment variables for zsh
# This file is loaded by all zsh instances (login, non-login, scripts)

# System directories.
export XDG_CONFIG_HOME="$HOME/.config"

# User directories.
export DEV_DIR="$HOME/code"
export DOTFILES_DIR="$XDG_CONFIG_HOME/dotfiles"
export GOPATH="$DEV_DIR/go"
export GOBIN="$GOPATH/bin"

# Editor configuration.
export EDITOR="nvim"

# Application-specific directories.
export OBSIDIAN_VAULT_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
export CLAUDE_CONFIG_DIR="$XDG_CONFIG_HOME/claude"

# Context management.
export DOTFILES_CONTEXTS="op://starship/config/contexts.toml"

# Locale settings.
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Configure the PATH
# We prepend directories to PATH if they exist and are not already in the PATH
# `typeset -U` ensures that the array contains only unique values
typeset -U path
path=(
    /opt/homebrew/bin
    "$GOBIN"
    /usr/local/opt/llvm/bin
    $path
)
export PATH
