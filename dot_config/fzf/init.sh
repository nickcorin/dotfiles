#!/bin/sh

# FZF initialization script

# Check if fzf is available
if ! command -v fzf >/dev/null 2>&1; then
    echo "Warning: FZF is not installed. Install with: brew install fzf" >&2
    return 0 2>/dev/null || exit 0
fi

# Configure FZF with Catppuccin theme (runs every shell session)
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"

