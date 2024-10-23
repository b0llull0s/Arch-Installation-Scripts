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

DIR="$HOME/Screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option1="Selected area"
option2="Fullscreen"

options="$option1\n$option2"

choice=$(echo -e "$options" | wofi --show=dmenu --width 100 --height 85)

case $choice in
    $option1)
        grim -g "$(slurp)" - | swappy -f -
        notify-send "Screenshot created" "Mode: Selected area"
    ;;
    $option2)
        sleep 3
        grim - | swappy -f -
        notify-send "Screenshot created" "Mode: Fullscreen"
    ;;
esac
