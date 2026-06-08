#!/bin/bash

if [ -f $HOME/.config/gamemode-enabled ]; then
	hyprctl reload
	rm $HOME/.config/gamemode-enabled
else
	hyprctl eval "activate_gamemode()"
	touch $HOME/.config/gamemode-enabled
fi
