#!/bin/bash

while [ $(echo $(pidof alacritty) | awk '{split($0,a); print length(a);}') -lt 4 ]; do
	echo "Waiting for Alacritty before launching picom.."
	sleep 0.1
done

picom -b --config ~/.config/picom/picom.conf
echo "Launched picom as background daemon.."
