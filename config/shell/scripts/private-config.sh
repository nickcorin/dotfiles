#!/bin/sh

# Private configuration loader
# Loads profile-based configurations using 1Password CLI

load_private_configs() {
    local private_dir="$DOTFILES_DIR/config/private"
    local profile="${DOTFILES_PROFILE:-personal}"
    
    # Check 1Password CLI availability
    if ! command -v op >/dev/null 2>&1 || ! op account list >/dev/null 2>&1; then
        echo "Warning: 1Password CLI not available or not authenticated" >&2
        echo "  Install: brew install 1password-cli" >&2
        echo "  Authenticate: op signin" >&2
        return 0
    fi
    
    # Load profile configuration
    local profile_file="$private_dir/profiles/$profile.sh"
    if [ -f "$profile_file" ]; then
        . "$profile_file"
    else
        echo "Warning: Profile '$profile' not found" >&2
    fi
}

# Get available profiles for fzf
_get_profiles() {
    local private_dir="$DOTFILES_DIR/config/private"
    if [ -d "$private_dir/profiles" ]; then
        for p in "$private_dir/profiles"/*.sh; do
            [ -f "$p" ] && basename "$p" .sh
        done
    fi
}

# Function to switch profiles with fzf
switch_profile() {
    local new_profile="$1"
    
    # If no profile provided, use fzf to select
    if [ -z "$new_profile" ]; then
        if command -v fzf >/dev/null 2>&1; then
            new_profile=$(_get_profiles | fzf --ansi --border-label="Switch profile:" --layout=reverse --height=40%)
            [ -z "$new_profile" ] && return 0  # User cancelled
        else
            echo "Available profiles:" >&2
            _get_profiles >&2
            echo "Usage: switch_profile <profile_name>" >&2
            return 1
        fi
    fi
    
    # Validate profile exists
    if [ ! -f "$DOTFILES_DIR/config/private/profiles/$new_profile.sh" ]; then
        echo "Error: Profile '$new_profile' not found" >&2
        echo "Available profiles:" >&2
        _get_profiles >&2
        return 1
    fi
    
    export DOTFILES_PROFILE="$new_profile"
    echo "Switched to profile: $new_profile"
    echo "Restart your shell or run 'load_private_configs' to apply changes"
}

# Show current profile
current_profile() {
    echo "${DOTFILES_PROFILE:-personal}"
}

# Security cleanup functions
cleanup_keychain() {
    # Clear SSH keys from macOS SSH agent (not 1Password agent)
    if command -v ssh-add >/dev/null 2>&1; then
        ssh-add -D 2>/dev/null
    fi
    
    # Clear 1Password session if needed
    if command -v op >/dev/null 2>&1; then
        op signout --forget 2>/dev/null || true
    fi
}

# Cleanup on shell exit
cleanup_on_exit() {
    cleanup_keychain
}

# SSH agent setup utility
setup_ssh_agent() {
    local op_ssh_sock="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    
    # Check if 1Password SSH agent is available
    if [ -S "$op_ssh_sock" ]; then
        export SSH_AUTH_SOCK="$op_ssh_sock"
        return 0
    else
        echo "Warning: 1Password SSH agent not available. Enable in 1Password > Settings > Developer > SSH Agent" >&2
        # Fall back to system SSH agent if available
        if [ -n "$SSH_AUTH_SOCK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
            echo "Using system SSH agent: $SSH_AUTH_SOCK" >&2
            return 0
        fi
        return 1
    fi
}

# Register cleanup handler
trap cleanup_on_exit EXIT