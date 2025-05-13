#!/bin/bash

# Clear previous debug log
echo "Starting test" > /tmp/xpad_debug.log

# Get cursor position
CURSOR_POS=$(hyprctl cursorpos)
CURSOR_X=$(echo "$CURSOR_POS" | awk '{print $1}')
CURSOR_Y=$(echo "$CURSOR_POS" | awk '{print $2}')
echo "Cursor position: $CURSOR_X $CURSOR_Y" >> /tmp/xpad_debug.log

# Test 1: Create a persistent rule to force position
echo "Creating window rule for xpad" >> /tmp/xpad_debug.log
hyprctl keyword windowrulev2 "move $CURSOR_X $CURSOR_Y,class:^(xpad)$" >> /tmp/xpad_debug.log 2>&1

# Launch xpad
echo "Launching xpad" >> /tmp/xpad_debug.log
xpad &

echo "Done. Please check if xpad appeared at cursor position." >> /tmp/xpad_debug.log
echo "If it worked, run 'hyprctl keyword windowrulev2 \"remove,class:^(xpad)$\"' to remove the test rule." >> /tmp/xpad_debug.log