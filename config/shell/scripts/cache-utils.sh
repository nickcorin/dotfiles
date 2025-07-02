#!/bin/sh

# Cache invalidation utilities for dotfiles

CACHE_DIR="${HOME}/.cache/dotfiles"
mkdir -p "$CACHE_DIR"

# Calculate SHA256 hash of a file
# Usage: _get_hash "/path/to/file"
_get_hash() {
    if command -v shasum >/dev/null 2>&1; then
        shasum -a 256 "$1" | cut -d' ' -f1
    elif command -v sha256sum >/dev/null 2>&1; then
        sha256sum "$1" | cut -d' ' -f1
    else
        echo "No hash utility found" >&2
        return 1
    fi
}

# Check if a tool needs initialization based on script changes
# Usage: needs_init "tool_name" "/path/to/script.sh"
# Returns: 0 if needs init, 1 if up to date
needs_init() {
    tool="$1"
    script_path="$2"
    
    [ -z "$tool" ] || [ -z "$script_path" ] && return 1
    [ ! -f "$script_path" ] && return 1
    
    cache_file="$CACHE_DIR/${tool}.hash"
    current_hash=$(_get_hash "$script_path") || return 0
    
    if [ -f "$cache_file" ]; then
        cached_hash=$(cat "$cache_file" 2>/dev/null)
        [ "$cached_hash" = "$current_hash" ] && return 1
    fi
    
    return 0
}

# Mark a tool as initialized with current script hash
# Usage: mark_initialized "tool_name" "/path/to/script.sh"
mark_initialized() {
    tool="$1"
    script_path="$2"
    
    [ -z "$tool" ] || [ -z "$script_path" ] && return 1
    [ ! -f "$script_path" ] && return 1
    
    current_hash=$(_get_hash "$script_path") || return 1
    echo "$current_hash" > "$CACHE_DIR/${tool}.hash"
}

# Clear cache for a specific tool
# Usage: clear_cache "tool_name"
clear_cache() {
    tool="$1"
    [ -z "$tool" ] && return 1
    
    cache_file="$CACHE_DIR/${tool}.hash"
    [ -f "$cache_file" ] && rm "$cache_file"
}