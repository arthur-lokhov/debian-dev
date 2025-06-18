#!/usr/bin/env bash

# Applications
export TERMINAL="alacritty"
export BROWSER="firefox"
export FILE_MANAGER="thunar"

# Vars
export i3_GAP_INNER=8
export i3_GAP_DELTA=2
export i3_RESIZE_DELTA=1

APP_NAME=sxhkd

# Terminate already running bar instances
pkill $APP_NAME

# Wait until the processes have been shut down
while pgrep -u $UID -x $APP_NAME > /dev/null
do
	sleep 1
done

# Launch sxhkd
$APP_NAME -c "$HOME/.config/$APP_NAME/config_i3" "$HOME/.config/$APP_NAME/config_common" & disown
