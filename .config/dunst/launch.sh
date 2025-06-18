#!/usr/bin/env bash

APP_NAME=dunst

# Terminate already running bar instances
pkill $APP_NAME

# Wait until the processes have been shut down
while pgrep -u $UID -x $APP_NAME >/dev/null
do
    sleep 1
done

# Launch dunst
$APP_NAME -config $HOME/.config/$APP_NAME/config.ini & disown
