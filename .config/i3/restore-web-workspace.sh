#!/bin/bash

# Restore layout.
i3-msg "workspace 3:web; append_layout ~/.config/i3/web-workspace.json"

# Autostart applications.
(firefox --new-instance -P default --new-window https://www.google.com &)
