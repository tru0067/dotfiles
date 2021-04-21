#!/bin/sh
date_str=$(date "+%A %B %-d | %Y-%m-%d %H:%M")
battery_str=$(upower --show-info $(upower --enumerate | grep "BAT") \
    | grep -E "state|percentage" \
    | awk 'ORS = " " {print $2}' \
    | awk '{print $1=="charging" ? $2" ": $2}')
volume_str=$(amixer -M get Master | grep "Mono:" \
    | awk '{print $6=="[off]" ? $4" ": $4" "}' \
    | tr -d "[]")
echo $volume_str "|" $battery_str "|" $date_str 
