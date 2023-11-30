#!/bin/bash
## Firewall ##
sudo pacman -Sy ufw
sudo ufw enable
sudo ufw status verbose
sudo systemctl enable ufw.service
## Git ##
sudo pacman -Sy git 
## Yay ##
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..
## PacCache ##
sudo pacman -Sy pacman-contrib
sudo systemctl enable paccache.timer
## Binaries ##
sudo pacman -Sy curl
sudo pacman -Sy wget
sudo pacman -Sy neofetch
sudo pacman -Sy exa
## Programming & Development ##
sudo pacman -Sy python-pip
sudo pacman -Sy cargo
# Terminals & Shells ##
sudo pacman -Sy zsh
sudo pacman -Sy alacritty
## Sound ##
sudo pacman -Sy cmus
sudo pacman -Sy pamixer
sudo pacman -Sy pavucontrol
## Bluetooth ##
sudo pacman -Sy blueman bluez bluez-utils
## Launcher ##
sudo pacman -Sy rofi
## File Managers ##
sudo pacman -Sy ranger
sudo pacman -Sy nemo
## Task Manager ##
sudo pacman -Sy btop
## Code Editors ##
sudo pacman -Sy neovim
sudo pacman -Sy code
## Utils ##
sudo pacman -Sy waybar
sudo pacman -Sy python-pywal
sudo pacman -Sy obsidian
sudo pacman -Sy signal-desktop
sudo pacman -Sy bleachbit
sudo pacman -Sy wireshark-qt
sudo pacman -Sy cliphist
## Virtual Box ##
sudo pacman -Sy virtualbox
sudo pacman -S virtualbox-guest-utils 
## Screenshots ##
sudo pacman -Sy grim
sudo pacman -Sy swappy
sudo pacman -Sy slurp
## Yay Packages ##
## swww ##
yay -S swww
sudo swww init
## librewolf ##
yay -S librewolf
## nordvpn ##
yay -S nordvpn-bin
sudo systemctl enable nordvpnd.service
sudo systemctl start nordvpnd.service
## 7-zip ##
yay -S 7-zip
