#!/bin/bash

# Restore layout.
i3-msg "workspace 2:dev; append_layout ~/.config/i3/dev-workspace.json"

# Autostart applications.
(alacritty --class nvim --working-directory "$GOPATH" -e tmux &)
(alacritty --class term --working-directory ~ -e tmux &)
(alacritty --class term --working-directory ~ -e tmux &)

