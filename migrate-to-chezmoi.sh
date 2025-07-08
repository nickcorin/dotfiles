#!/bin/bash
set -euo pipefail

echo "🚀 Starting chezmoi migration..."

# Create backup branch
echo "📸 Creating backup branch..."
git add .
git commit -m "WIP: Save current state before chezmoi migration"
git branch backup-pre-chezmoi

# Directories that should become dot_config/*
SYMLINKED_CONFIGS=(
    "claude"
    "fzf"
    "gh"
    "ghostty"
    "git"
    "lazygit"
    "nvim"
    "opencode"
    "sesh"
    "starship"
    "tmux"
    "zsh"
)

# Create dot_config directory
echo "📁 Creating dot_config directory..."
mkdir -p dot_config

# Move symlinked configs
echo "🔄 Moving symlinked configs to dot_config..."
for config in "${SYMLINKED_CONFIGS[@]}"; do
    if [ -d "config/$config" ]; then
        echo "  Moving config/$config → dot_config/$config"
        mv "config/$config" "dot_config/$config"
    fi
done

# Create resources directory for non-dotfile configs
echo "📁 Creating resources directory..."
mkdir -p resources

# Move non-symlinked configs to resources
echo "🔄 Moving non-symlinked configs to resources..."
for dir in config/*/; do
    if [ -d "$dir" ]; then
        dirname=$(basename "$dir")
        echo "  Moving $dir → resources/$dirname"
        mv "$dir" "resources/$dirname"
    fi
done

# Remove empty config directory
rmdir config 2>/dev/null || true

# Move other files that need dot_ prefix
if [ -f ".tmux.conf" ]; then
    echo "🔄 Moving .tmux.conf → dot_tmux.conf"
    mv .tmux.conf dot_tmux.conf
fi

echo "✅ Directory structure migrated!"
echo ""
echo "📋 Summary of changes:"
echo "  - Symlinked configs moved to dot_config/"
echo "  - Other configs moved to resources/"
echo "  - Ready for chezmoi init"
echo ""
echo "Next steps:"
echo "  1. Review changes: git status"
echo "  2. Install chezmoi: brew install chezmoi"
echo "  3. Initialize: chezmoi init --source ~/code/dotfiles"
echo "  4. Test: chezmoi diff"
echo "  5. Apply: chezmoi apply"