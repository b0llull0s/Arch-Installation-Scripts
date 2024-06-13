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
usage() {
    echo "Usage: $0 [-copy [PATH]] [-hard]"
    echo "  -copy [PATH]  Copy the .cache to PATH."
    echo "               If PATH is not provided, copy to the current directory."
    echo "  -hard        Securely delete files using rmk function."
    exit 1
}

# -hard
rmk() {
    scrub -p dod "$1"
    shred -zun 10 -v "$1"
}
#_#
COPY_PATH=""
HARD_DELETE=false
while [[ "$1" != "" ]]; do
    case $1 in
        -copy)
            shift
            if [[ "$1" != "" && "$1" != -* ]]; then
                COPY_PATH="$1"
                shift
            else
                COPY_PATH=$(pwd)
            fi
            ;;
        -hard)
            HARD_DELETE=true
            shift
            ;;
        *)
            usage
            ;;
    esac
done
#_#
CACHE_DIR="~/.cache"
EXCLUDE_DIR="wal" #_# Exclude list #_#
TEMP_DIR=$(mktemp -d)
mv "$CACHE_DIR/$EXCLUDE_DIR" "$TEMP_DIR"
#_# Copy 
if [[ "$COPY_PATH" != "" ]]; then
    cp -r "$CACHE_DIR" "$COPY_PATH"
    echo ".cache directory copied to $COPY_PATH."
fi
#_# Hard 
if $HARD_DELETE; then
    
    find "$CACHE_DIR"/* -exec rmk {} \;
else
    
    rm -rf "$CACHE_DIR"/*
fi
#_#
mv "$TEMP_DIR/$EXCLUDE_DIR" "$CACHE_DIR"
#_# Soft
rmdir "$TEMP_DIR"

echo "Soft clear"

if $HARD_DELETE; then
    echo "Hard clear"
fi
