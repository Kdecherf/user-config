#!/usr/bin/env bash

xrandr --output DP-0 --primary --auto --output HDMI-0 --left-of DP-0 --auto --rotate left

sleep 1

MONITOR=DP-0 polybar example &

sleep 1

MONITOR=HDMI-0 polybar example &
