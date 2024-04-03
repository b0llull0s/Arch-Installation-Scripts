#!/bin/bash
## Removes unnecesary packages from archinstall ##
sudo pacman -Rs dolphin
## Home directories ##
cd ..
mkdir Downloads Screenshots 
cd P4n1c-Arch
mv w4llp4p3rs ~/Downloads/
cd ~/Downloads/
## Enable Black Arch repo
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh
## Firewall ##
sudo pacman -Sy ufw
sudo ufw enable
sudo ufw status verbose
sudo systemctl enable ufw.service
## Nerdfonts ##
#git clone https://github.com/ryanoasis/nerd-fonts.git
#cd nerd-fonts
#chmod +x install.sh
#./install.sh
## Yay ##
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ..
## PacCache ##
sudo systemctl enable paccache.timer
## Mirrors ##
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo pacman -Sy pacman-contrib
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
## Binaries ##
sudo pacman -Sy curl
sudo pacman -Sy wget
sudo pacman -Sy locate
sudo pacman -Sy neofetch
sudo pacman -Sy exa
sudo pacman -Sy bat
## Programming & Development ##
sudo pacman -Sy python-pip
sudo pacman -Sy cargo
sudo pacman -Sy jre-openjdk
sudo pacman -Sy jdk-openjdk
sudo pacman -Sy go
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
## scrub ##
yay -S scrub
## zsh plugins ##
yay -S zsh-syntax-highlighting zsh-autosuggestions
## Dot Files ##
cp -r alacritty ~/.config/
cp -r btop ~/.config/
cp -r gtk-3.0 ~/.config/
cp -r gtk-4.0 ~/.config/
cp -r hypr ~/.config/
cp -r kitty ~/.config/
cp -r rofi ~/.config/
cp -r swappy ~/.config/
cp -r 7h0seF1L3s/wal/templates ~/.config/wal/templates
cp -r waybar ~/.config/
cp -r wireshark/profiles ~/.config/wireshark/profiles
cp 7h0seF1L3s/.zshrc ~/
## Set pywal ##
wal -i ~/Downloads/w4llp4p3rs/1.jpg
## Script Permissions
cd ~/.config/hyper/scripts
sudo chmod +x *.sh
cd
## OMZSH ##
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Finished! Do a sudo reboot."
