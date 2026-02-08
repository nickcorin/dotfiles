#!/usr/bin/env bash
#
# Syncs custom theme files from ~/.config/tmux/themes/ to the catppuccin plugin's themes directory.
# This allows custom themes (like cyberdream and rose-pine) to be used with the catppuccin plugin.

THEMES_DIR="$HOME/.config/tmux/themes"
CATPPUCCIN_THEMES_DIR="$HOME/.config/tmux/plugins/tmux/themes"

# Exit if the catppuccin plugin is not installed.
if [[ ! -d "$CATPPUCCIN_THEMES_DIR" ]]; then
    exit 0
fi

# Map of source theme files to their catppuccin-compatible destination names.
declare -A THEME_MAP=(
    ["cyberdream-dark.conf"]="catppuccin_cyberdream_dark_tmux.conf"
    ["cyberdream-light.conf"]="catppuccin_cyberdream_light_tmux.conf"
    ["vesper.conf"]="catppuccin_vesper_tmux.conf"
    ["rose-pine.conf"]="catppuccin_rose_pine_tmux.conf"
    ["rose-pine-moon.conf"]="catppuccin_rose_pine_moon_tmux.conf"
    ["rose-pine-dawn.conf"]="catppuccin_rose_pine_dawn_tmux.conf"
)

for src_name in "${!THEME_MAP[@]}"; do
    src_file="$THEMES_DIR/$src_name"
    dst_file="$CATPPUCCIN_THEMES_DIR/${THEME_MAP[$src_name]}"

    # Skip if the source file doesn't exist.
    if [[ ! -f "$src_file" ]]; then
        continue
    fi

    # Copy if destination doesn't exist or source is newer.
    if [[ ! -f "$dst_file" ]] || [[ "$src_file" -nt "$dst_file" ]]; then
        cp "$src_file" "$dst_file"
    fi
done
