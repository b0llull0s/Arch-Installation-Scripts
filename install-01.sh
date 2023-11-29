#!/bin/bash
## Set Dark theme ##
mkdir ~/.config/gtk-3.0
touch ~/.config/gtk-3.0/settings.ini
echo "gtk-application-prefer-dark-theme=1" > ~/.config/gtk-3.0/settings.ini
## Removes Dolphin and dunst
sudo pacman -Rs
## Creates Home directories
mkdir ~/Screenshots ~/Downloads ~/VS-Workspaces
cd Downloads
## Enable Black Arch repo
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
## pacman.conf reminder ##
echo "Please edit /etc/pacman.conf options:"
echo "Uncoment Color"
echo "Set ParallelDownloads = 5"
echo "Add ILoveCandy "
