#!/bin/bash
#  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\ 
# ( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )
#  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ < 
#  /\_/\          ..                          ..       ..                      ..       ..                    .x+=:.      /\_/\ 
# ( o.o )   . uW8"          .n~~%x.     x .d88"  x .d88"                 x .d88"  x .d88"      .n~~%x.       z`    ^%    ( o.o )
#  > ^ <    `t888         x88X   888.    5888R    5888R      x.    .      5888R    5888R     x88X   888.        .   <k    > ^ < 
#  /\_/\     8888   .    X888X   8888L   '888R    '888R    .@88k  z88u    '888R    '888R    X888X   8888L     .@8Ned8"    /\_/\ 
# ( o.o )    9888.z88N  X8888X   88888    888R     888R   ~"8888 ^8888     888R     888R   X8888X   88888   .@^%8888"    ( o.o )
#  > ^ <     9888  888E 88888X   88888X   888R     888R     8888  888R     888R     888R   88888X   88888X x88:  `)8b.    > ^ < 
#  /\_/\     9888  888E 88888X   88888X   888R     888R     8888  888R     888R     888R   88888X   88888X 8888N=*8888    /\_/\ 
# ( o.o )    9888  888E 88888X   88888f   888R     888R     8888  888R     888R     888R   88888X   88888f  %8"    R88   ( o.o )
#  > ^ <     9888  888E 48888X   88888    888R     888R     8888 ,888B .   888R     888R   48888X   88888    @8Wou 9%     > ^ < 
#  /\_/\    .8888  888"  ?888X   8888"   .888B .  .888B .  "8888Y 8888"   .888B .  .888B .  ?888X   8888"  .888888P`      /\_/\ 
# ( o.o )    `%888*%"     "88X   88*`    ^*888%   ^*888%    `Y"   'YP     ^*888%   ^*888%    "88X   88*`   `   ^"F       ( o.o )
#  > ^ <        "`          ^"==="`        "%       "%                      "%       "%        ^"==="`                    > ^ < 
#  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\  /\_/\ 
# ( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )( o.o )
#  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ <  > ^ < 
usage() {
    echo "Usage: $0 [-copy [PATH]] [-hard]"
    echo "  -copy [PATH]  Optionally copy the .cache directory to the specified PATH."
    echo "               If PATH is not provided, copy to the current directory."
    echo "  -hard        Securely delete files using rmk function."
    exit 1
}
#_#
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
CACHE_DIR="/home/b0llull0s/.cache"
#_#
EXCLUDE_DIR="wal"
#_#
TEMP_DIR=$(mktemp -d)
#_#
mv "$CACHE_DIR/$EXCLUDE_DIR" "$TEMP_DIR"
#_#
if [[ "$COPY_PATH" != "" ]]; then
    cp -r "$CACHE_DIR" "$COPY_PATH"
    echo ".cache directory copied to $COPY_PATH."
fi
#_#
if $HARD_DELETE; then
    
    find "$CACHE_DIR"/* -exec rmk {} \;
else
    
    find "$CACHE_DIR"/* -not -path "$CACHE_DIR/$EXCLUDE_DIR/*" -delete
fi
#_#
mv "$TEMP_DIR/$EXCLUDE_DIR" "$CACHE_DIR"
#_#
rmdir "$TEMP_DIR"
#_#
echo "Cache cleared, except for $CACHE_DIR/$EXCLUDE_DIR."
#_#
if $HARD_DELETE; then
    echo "Files were securely deleted using the rmk function."
fi
