#!/bin/sh
date_str=$(date "+%A %B %-d | %Y-%m-%d %H:%M")
battery_str=$(upower --show-info /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}')
volume_str=$(amixer -M get Master | grep "Mono:" | awk '{print $6=="[off]" ? $4" M": $4" O"}' | tr -d "[]")
echo $volume_str "|" $battery_str "|" $date_str 
