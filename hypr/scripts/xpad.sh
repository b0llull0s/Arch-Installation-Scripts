#!/bin/bash

# Clear previous debug log
echo "Starting test" > /tmp/xpad_debug.log

CURSOR_POS=$(hyprctl cursorpos | tr -d ',')
CURSOR_X=$(echo "$CURSOR_POS" | awk '{print $1}')
CURSOR_Y=$(echo "$CURSOR_POS" | awk '{print $2}')
echo "Cursor position : $CURSOR_X $CURSOR_Y" >> /tmp/xpad_debug.log

X_OFFSET=-150  # Adjust based on xpad width
Y_OFFSET=-150  # Adjust based on xpad height

FINAL_X=$((CURSOR_X + X_OFFSET))
FINAL_Y=$((CURSOR_Y + Y_OFFSET))
echo "Final position with offset: $FINAL_X $FINAL_Y" >> /tmp/xpad_debug.log

# Create a persistent rule to force position
echo "Creating window rule for xpad" >> /tmp/xpad_debug.log
hyprctl keyword windowrulev2 "move $FINAL_X $FINAL_Y,class:^(xpad)$" >> /tmp/xpad_debug.log 2>&1

# Launch xpad
echo "Launching xpad" >> /tmp/xpad_debug.log
xpad &

echo "Done. Please check if xpad appeared at cursor position." >> /tmp/xpad_debug.log
echo "If it worked, run 'hyprctl keyword windowrulev2 \"remove,class:^(xpad)$\"' to remove the test rule." >> /tmp/xpad_debug.log
