#!/bin/bash
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