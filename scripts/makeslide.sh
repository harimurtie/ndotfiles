#!/bin/bash

block=$(figlet block)
terminal_width=$(tput cols)
terminal_height=$(tput lines)
block_width=$(echo "$block" | wc -L)
block_height=$(echo "$block" | wc -l)
blank_columns=$((terminal_width - block_width))
blank_lines=$((terminal_height - block_height))
hpad=$(printf "%$((blank_columns / 2))s" " ")
vpad=$(printf "%$((blank_lines / 2))s" " ")
vpad=${vpad// /$'\n'}
block=$(echo "$block" | sed "s/^/${hpad}/g")
printf '%s' "$vpad" "$block" "$vpad"
