#!/bin/bash

while [ $(echo $(pidof kitty) | awk '{split($0,a); print length(a);}') -lt 4 ]; do
	echo "Waiting for kitty before launching picom.."
	sleep 0.1
done

picom -b --config ~/.config/picom/picom.conf
echo "Launched picom as background daemon.."
