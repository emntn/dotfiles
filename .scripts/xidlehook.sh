#!/bin/sh

# https://github.com/jD91mZM2/xidlehook

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 600 \
    'i3lock -c 000000' \
    '' \
  --timer 900 \
    'systemctl suspend' \
    ''
