#!/bin/sh

# Git configuration initialization script

# Source cache utilities
. "$DOTFILES_PATH/config/shell/scripts/cache-utils.sh"

# Check if this script needs to run
if ! needs_init "git" "$DOTFILES_PATH/config/git/init.sh"; then
    return 0 2>/dev/null || exit 0
fi

# Check if git is available
if ! command -v git >/dev/null 2>&1; then
    echo "Warning: Git is not installed. Install with: brew install git" >&2
    return 0 2>/dev/null || exit 0
fi

# Git configuration
git config --global core.editor "$EDITOR"
git config --global core.excludesFile "$DOTFILES_PATH/config/git/ignore"
git config --global init.defaultBranch "master"
git config --global pull.rebase "true"
git config --global push.autoSetupRemote "true"
git config --global user.name "Nicholas Corin"
git config --global user.email "nickcorin@gmail.com"

# SSH signing configuration for 1Password
git config --global gpg.format "ssh"
git config --global commit.gpgsign "true"
git config --global user.signingkey "key::nickcorin_id_ed25519"

# Configure pager based on bat availability
if command -v bat >/dev/null 2>&1; then
    git config --global core.pager "bat"
    export GH_PAGER=bat
else
    git config --global core.pager "cat"
    export GH_PAGER=cat
fi

# Mark this script as successfully initialized
mark_initialized "git" "$DOTFILES_PATH/config/git/init.sh"

echo "Git configuration initialized successfully"