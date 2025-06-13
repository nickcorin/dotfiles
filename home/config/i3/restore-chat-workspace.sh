#!/bin/bash

# Restore layout.
i3-msg "workspace 4:chat; append_layout ~/.config/i3/chat-workspace.json"

# Autostart applications.
(firefox --new-instance -P whatsapp --class whatsapp --new-window https://web.whatsapp.com &)
(alacritty --class irssi -e irssi &)
