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
pacman -Sy neovim
pacman -Sy code
## Utils ##
pacman -Sy waybar
pacman -Sy python-pywal
pacman -Sy obsidian
pacman -Sy signal-desktop
pacman -Sy bleachbit
pacman -Sy wireshark-qt
pacman -Sy cliphist
## Virtual Box ##
pacman -Sy virtualbox
pacman -S virtualbox-guest-utils 
pacman -S virtualbox-host-modules-arch
## Screenshots ##
pacman -Sy grim
pacman -Sy swappy
pacman -Sy slurp
## Python ##
pacman -S python-requests
pacman -S python-beautifulsoup4
## Fira Code Nerd ##
yay -S ttf-firacode-nerd
## swww ##
yay -S swww
sudo swww init
## librewolf ##
yay -S librewolf-bin
## nordvpn ##
yay -S nordvpn-bin
sudo systemctl enable nordvpnd
sudo systemctl start nordvpnd
## 7-zip ##
yay -S 7-zip
