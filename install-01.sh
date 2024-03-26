#!/bin/bash
## Removes unnecesary packages from archinstall ##
sudo pacman -Rs dolphin
## Home directories ##
cd ..
mkdir Downloads Screenshots VS-Workspaces
cd P4n1c-Arch
mv w4llp4p3rs ~/Downloads/
cd ~/Downloads/
## Enable Black Arch repo
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
## pacman.conf reminder ##
echo "Please edit /etc/pacman.conf options:"
echo "Uncoment Color"
echo "Set ParallelDownloads = 5"
echo "Add ILoveCandy "
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
sudo pacman -Sy locate
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
sudo pacman -Sy cliphist
## Wireshark ##
sudo pacman -Sy wireshark-qt
sudo chmod +x /usr/bin/dumpcap
## Virtual Box ##
sudo pacman -Sy virtualbox
sudo pacman -S virtualbox-guest-utils 
sudo pacman -S virtualbox-host-modules-arch
## Screenshots ##
sudo pacman -Sy grim
sudo pacman -Sy swappy
sudo pacman -Sy slurp
## Python ##
sudo pacman -S python-requests
sudo pacman -S python-beautifulsoup4
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
## zsh plugins ##
yay -S zsh-syntax-highlighting zsh-autosuggestions
## Dot Files ##
cp -r alacritty ~/.config/
cp -r 7h0seF1L3s/kitty ~/.config/
cp -r 7h0seF1L3s/hypr ~/.config/
cp -r 7h0seF1L3s/waybar ~/.config/waybar
cp -r 7h0seF1L3s/rofi ~/.config/rofi
cp -r 7h0seF1L3s/swappy ~/.config/swappy
cp 7h0seF1L3s/.zshrc ~/
#cp .config/nvim/init.vim ~/.config/nvim/init.vim
cp -r 7h0seF1L3s/val/templates ~/.config/val/templates
## Set pywal ##
wal -i ~/Downloads/w4llp4p3rs/1.jpg
## Script Permissions
cd ~/.config/hyper/scripts
sudo chmod +x *.sh
cd
## OMZSH ##
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Finished! Do a sudo reboot."
