#!/bin/bash
set -e

# Functions

error_exit() {
    echo "$1" 1>&2
    exit 1
}

install_packages() {
    for package in "$@"; do
        if ! pacman -Q "$package" &>/dev/null; then
            sudo pacman -Sy --noconfirm "$package" || error_exit "Failed to install $package"
        fi
    done
}

enable_services() {
    for service in "$@"; do
        sudo systemctl enable --now "$service" || error_exit "Failed to enable $service"
    done
}

# Install Hyprland
sudo pacman -Sy hyprland ly

# Home directories setup
mkdir -p ~/Downloads ~/Screenshots || error_exit "Failed to create directories"

# Enable Black Arch repo
curl -fsSL https://blackarch.org/strap.sh | sudo bash || error_exit "Failed to enable Black Arch repo"

# Firewall setup
install_packages ufw
sudo ufw enable || error_exit "Failed to enable UFW"
enable_services ufw.service

## Nerdfonts ##
#git clone https://github.com/ryanoasis/nerd-fonts.git
#cd nerd-fonts
#chmod +x install.sh
#./install.sh

# Yay setup
install_packages base-devel git
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si || error_exit "Failed to install yay"
cd ..

# Mirrors setup
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup || error_exit "Failed to backup mirrorlist"
sudo pacman -Sy --noconfirm pacman-contrib || error_exit "Failed to install pacman-contrib"
# sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist || error_exit "Failed to rank mirrors"

# PacCache setup
sudo systemctl enable --now paccache.timer || error_exit "Failed to enable paccache.timer"

# packages grouped by category

# Binaries
install_packages wofi curl wget locate less tree neofetch exa bat apparmor whois tcpdump exfat-utils

# Programming & Development
install_packages python-pip cargo go

# Terminals & Shells
install_packages zsh alacritty

# Sound
install_packages cmus pamixer pavucontrol

# Bluetooth
install_packages blueman bluez bluez-utils
enable_services bluetooth

# File Managers
install_packages ranger

# Task Manager
install_packages btop

# Utils
install_packages waybar obsidian signal-desktop cliphist pam_yubico pam-u2f atool unzip zip sxiv p7zip net-tools

# Wireshark
install_packages wireshark-qt
sudo chmod +x /usr/bin/dumpcap || error_exit "Failed to change permissions for dumpcap"

# Virtual Box
#install_packages virtualbox virtualbox-guest-utils virtualbox-host-modules-arch

# Screenshots
install_packages grim swappy slurp

# Python
install_packages python-pywal python-requests python-beautifulsoup4 python-pexpect python-selenium

# Codium
yay -S vscodium-bin || error_exit "Failed to install Codium"

# Fira Code Nerd
yay -S --noconfirm ttf-firacode-nerd || error_exit "Failed to install Fira Code Nerd"

# swww
yay -S --noconfirm swww || error_exit "Failed to install swww"
swww-daemon --format xrgb || error_exit "Failed to initialize swww"

# librewolf
yay -S --noconfirm librewolf-bin || error_exit "Failed to install librewolf-bin"

# nordvpn
yay -S --noconfirm nordvpn-bin || error_exit "Failed to install nordvpn-bin"
sudo systemctl enable --now nordvpnd || error_exit "Failed to enable nordvpnd"

# scrub
yay -S --noconfirm scrub || error_exit "Failed to install scrub"

# zsh plugins
yay -S --noconfirm zsh-syntax-highlighting zsh-autosuggestions || error_exit "Failed to install zsh plugins"

# Dot Files
for config_dir in alacritty btop gtk-3.0 gtk-4.0 hypr rofi swappy waybar; do
    cp -r "$config_dir" ~/.config/ || error_exit "Failed to copy $config_dir"
done

cp -r wal ~/.config || error_exit "Failed to copy wal/templates"

# Script Permissions
sudo chmod +x ~/.config/hypr/scripts/*.sh || error_exit "Failed to change script permissions"

# OMZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || error_exit "Failed to install oh-my-zsh"

# Set pywal
wal -i ~/P4n1c-Arch/w4llp4p3rs/1.jpg || error_exit "Failed to set pywal"

# Set Wallpaper
swww img ~/P4n1c-Arch/w4llp4p3rs/1.jpg

# Zsh
cp .zshrc ~/ || error_exit "Failed to copy .zshrc"

echo "Finished! Please reboot."

