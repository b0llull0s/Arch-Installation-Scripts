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
# Set the path to your wallpaper folder
WALLPAPER_FOLDER="$HOME/Downloads/w4llp4p3rs"

# Function to set wallpaper and reset Waybar
set_wallpaper() {
    local wallpaper="$1"
    wal -q -i "$wallpaper"
    swww img "$wallpaper"
    ~/.config/hypr/scripts/waybar.sh
}

# Ask for options
options=("random" "select")
selected_option=$(echo -e "1. ${options[0]}\n2. ${options[1]}" |  rofi -dmenu -l 2 -width 30)
# Handle the selected option
case "$selected_option" in
    "1. random")
        # Get a random wallpaper from the folder
        WALLPAPER=$(find "$WALLPAPER_FOLDER" -type f | shuf -n 1)
        set_wallpaper "$WALLPAPER"
        ;;
    "2. select")
        # Select wallpaper with rofi
        selected_wallpaper=$(ls -1 "$WALLPAPER_FOLDER" | grep "jpg" | rofi -dmenu -p "Select wallpaper:")
        if [ -z "$selected_wallpaper" ]; then
            echo "No wallpaper selected"
            exit 1
        fi
        selected_wallpaper_path="$WALLPAPER_FOLDER/$selected_wallpaper"
        set_wallpaper "$selected_wallpaper_path"
        ;;
    *)
        echo "Invalid option"
        exit 1
        ;;
esac

exit 0
