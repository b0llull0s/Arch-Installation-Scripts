#!/bin/bash

CURSOR_POS=$(hyprctl cursorpos | tr -d ',')
CURSOR_X=$(echo "$CURSOR_POS" | awk '{print $1}')
CURSOR_Y=$(echo "$CURSOR_POS" | awk '{print $2}')

X_OFFSET=-150  # Adjust based on xpad width
Y_OFFSET=-150  # Adjust based on xpad height

FINAL_X=$((CURSOR_X + X_OFFSET))
FINAL_Y=$((CURSOR_Y + Y_OFFSET))

hyprctl keyword windowrulev2 "move $FINAL_X $FINAL_Y,class:^(xpad)$" 

xpad &
