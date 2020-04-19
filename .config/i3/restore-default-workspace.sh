#!/bin/bash

# Restore layout.
i3-msg "workspace 1:default; append_layout ~/.config/i3/default-workspace.json"

# Autostart applications.
(kitty --hold --name neofetch neofetch &)
