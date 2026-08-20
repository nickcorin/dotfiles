#!/usr/bin/env bash
set -euo pipefail

for zshenv_file in /etc/zshenv /etc/zsh/zshenv; do
    if [[ ! -r "$zshenv_file" ]]; then
        continue
    fi

    if grep -Eq '^[[:space:]]*export[[:space:]]+ZDOTDIR=.*\.config/zsh' "$zshenv_file"; then
        printf '%s\n' \
            "Warning: $zshenv_file still points ZDOTDIR at ~/.config/zsh." \
            "These dotfiles now use ~/.zshenv and ~/.zshrc directly." \
            "Remove the ZDOTDIR line manually, then start a new login shell."
    fi
done
