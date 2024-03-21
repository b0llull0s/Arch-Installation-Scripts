#!/bin/bash

# ______________  _________     _______     __________   _____________
#   \\______   \ / |   // ____//___ |  ____ \\__    \\  //   _____//  
#   ||    |__ ///   |  |_ /    \ |   |// ___\\ //  |  \\ \\_____  \\ 
#   ||    |   //    ^   /|  |   \|   |\ \\___ //   |   \\//______\ \\
#   ||    |  / \____  |||___|__/|___| \___//>\\______////_______  // 
#    \\__/        ||__|/     \/           \/         \/         \//                
#                  \  /      /             \         /          /                                                      
#  
# by Isaac P. Bassart (22-11-2023) 
# ----------------------------------------------------- 

DIR="$/home/d1ana/Screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option2="Selected area"
option3="Fullscreen"

options="$option2\n$option3"

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/.config/rofi/config-screenshot.rasi -i -no-show-icons -l 2 -width 30 -p "Take Screenshot")

case $choice in
    $option2)
        grim -g "$(slurp)" - | swappy -f -
        notify-send "Screenshot created" "Mode: Selected area"
    ;;
    $option3)
        sleep 3
        grim - | swappy -f -
        notify-send "Screenshot created" "Mode: Fullscreen"
    ;;
esac
