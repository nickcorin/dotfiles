#!/bin/sh

# General utility functions

# Convert video to optimized GIF
# Usage: gif "input.mp4"
# Output: Creates "input.gif" in same directory
gif() {
    ffmpeg -i "$1" \
        -filter_complex "[0:v]fps=30,scale=iw*min(800/iw\,1):-1:flags=lanczos,split[a][b];[a]palettegen=stats_mode=diff[p];[b][p]paletteuse=dither=bayer:bayer_scale=3" \
        -c:v gif "${1%.*}.gif"
}

# Check if running on macOS
# Usage: is_darwin && echo "On macOS"
# Returns: 0 if macOS, 1 otherwise
is_darwin() {
    case "$OSTYPE" in
        darwin*) return 0 ;;
        *) return 1 ;;
    esac
}

# Check if a command is available
# Usage: is_installed "git" && echo "Git found"
# Returns: 0 if command exists, 1 otherwise
is_installed() {
    command -v "$1" >/dev/null 2>&1
}

# Check if shell is interactive
# Usage: is_interactive_shell && echo "Interactive"
# Returns: 0 if interactive, 1 if non-interactive
is_interactive_shell() {
    case $- in
        *i*) return 0 ;;
        *) return 1 ;;
    esac
}