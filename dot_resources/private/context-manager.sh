#!/bin/sh

# Simplified Context Manager for Dotfiles
# Manages development contexts with 1Password integration

# Configuration
CONTEXT_FILE="$HOME/tmp/dotfiles/context"
CONTEXTS_CACHE="$HOME/tmp/dotfiles/contexts.toml"
ENV_CACHE_DIR="$HOME/tmp/dotfiles/env"

# Ensure directories exist
mkdir -p "$(dirname "$CONTEXT_FILE")" "$ENV_CACHE_DIR"

# Get contexts config (from cache or 1Password)
_get_config() {
    if [ -f "$CONTEXTS_CACHE" ]; then
        cat "$CONTEXTS_CACHE"
        return
    fi
    
    if ! command -v op >/dev/null 2>&1 || ! op account list >/dev/null 2>&1; then
        return 1
    fi
    
    local config
    if config=$(op read "${DOTFILES_CONTEXTS:-op://starship/contexts}" 2>/dev/null); then
        echo "$config" > "$CONTEXTS_CACHE"
        echo "$config"
    else
        return 1
    fi
}

# Get current context
get_current_context() {
    if [ -f "$CONTEXT_FILE" ]; then
        cat "$CONTEXT_FILE"
    else
        echo "none"
    fi
}

# List available contexts
list_contexts() {
    if ! command -v yq >/dev/null 2>&1; then
        echo "Error: yq is required for context management. Install with: brew install yq" >&2
        return 1
    fi
    _get_config | yq -p toml '.contexts | keys | .[]' 2>/dev/null
}

# Switch context
switch_context() {
    local new_context="$1"
    local current_context=$(get_current_context)
    
    [ "$current_context" = "$new_context" ] && return 0
    
    # Check for required dependencies
    if [ "$new_context" != "none" ] && ! command -v yq >/dev/null 2>&1; then
        echo "Error: yq is required for context management. Install with: brew install yq" >&2
        return 1
    fi
    
    # Update git signing config only
    if [ "$new_context" = "none" ]; then
        git config --global --unset user.signingkey 2>/dev/null || true
        git config --global commit.gpgsign false
    else
        local ssh_key=$(_get_config | yq -p toml ".contexts.$new_context.ssh_key" -r 2>/dev/null)
        if [ -n "$ssh_key" ] && [ "$ssh_key" != "null" ] && [ -f "$HOME/.ssh/${ssh_key}.pub" ]; then
            # Configure SSH signing if public key exists
            git config --global gpg.format ssh
            git config --global user.signingkey "$HOME/.ssh/${ssh_key}.pub"
            git config --global commit.gpgsign true
        else
            git config --global --unset user.signingkey 2>/dev/null || true
            git config --global commit.gpgsign false
        fi
    fi
    
    # Save context
    echo "$new_context" > "$CONTEXT_FILE"
    export CURRENT_DOTFILES_CONTEXT="$new_context"
    
    # Handle environment variables if in tmux
    if [ -n "${TMUX:-}" ] && [ "$new_context" != "none" ]; then
        # Set context in tmux
        tmux set-environment -g CURRENT_DOTFILES_CONTEXT "$new_context"
        tmux set-environment CURRENT_DOTFILES_CONTEXT "$new_context"
        
        # Get and set env vars
        local env_vars=$(_get_config | yq -p toml ".contexts.$new_context.env | to_entries | .[] | .key + \"=\" + .value" -r 2>/dev/null)
        if [ -n "$env_vars" ]; then
            echo "$env_vars" | while IFS='=' read -r var_name op_ref; do
                if [ -n "$var_name" ] && [ -n "$op_ref" ]; then
                    # Check cache first
                    local cache_file="$ENV_CACHE_DIR/$var_name"
                    local value
                    if [ -f "$cache_file" ]; then
                        value=$(cat "$cache_file")
                    elif value=$(op read "$op_ref" 2>/dev/null); then
                        echo "$value" > "$cache_file"
                    fi
                    
                    if [ -n "$value" ]; then
                        export "$var_name"="$value"
                        if [ -n "${TMUX:-}" ]; then
                            tmux set-environment -g "$var_name" "$value"
                            tmux set-environment "$var_name" "$value"
                        fi
                    fi
                fi
            done
        fi
        
        # Refresh status
        tmux refresh-client -S
    fi
}

# Initialize on shell startup
init_context() {
    local context=$(get_current_context)
    export CURRENT_DOTFILES_CONTEXT="$context"
    [ "$context" != "none" ] && switch_context "$context" >/dev/null 2>&1
}

# Clear caches
clear_context_cache() {
    rm -f "$CONTEXTS_CACHE"
    rm -rf "$ENV_CACHE_DIR"/*
    echo "Context caches cleared"
}

# Refresh context configuration from 1Password
refresh_context_config() {
    rm -f "$CONTEXTS_CACHE"
    if _get_config >/dev/null 2>&1; then
        echo "Context configuration refreshed from 1Password"
    else
        echo "Failed to refresh context configuration"
        return 1
    fi
}

# Show current context and git configuration
show_context_status() {
    local context=$(get_current_context)
    echo "Current context: $context"
    
    if [ "$context" != "none" ]; then
        local signing_key=$(git config --global user.signingkey 2>/dev/null || echo "not set")
        local signing_enabled=$(git config --global commit.gpgsign 2>/dev/null || echo "false")
        
        echo "  Signing key: $signing_key"
        echo "  Signing enabled: $signing_enabled"
    else
        echo "  No signing configuration active"
    fi
}