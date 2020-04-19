#!/bin/bash

# Restore layout.
i3-msg "workspace 2:dev; append_layout ~/.config/i3/dev-workspace.json"

# Autostart applications.
(kitty --name nvim -d /home/nick/go -e tmux &)
(kitty --name term -d ~ tmux &)
