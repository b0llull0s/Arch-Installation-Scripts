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
# Functions
error_exit() {
    echo "$1" 1>&2
    exit 1
}

install_packages() {
    for package in "$@"; do
        if ! pacman -Q "$package" &>/dev/null; then
            sudo pacman -S --noconfirm "$package" || error_exit "Failed to install $package"
        fi
    done
}

install_packages_yay() {
    for package in "$@"; do
        if ! yay -Q "$package" &>/dev/null; then
            yay -S --noconfirm "$package" || error_exit "Failed to install $package"
        fi
    done
}

enable_services() {
    for service in "$@"; do
        sudo systemctl enable --now "$service" || error_exit "Failed to enable $service"
    done
}

# Install Hyprland
install_packages hyprland ly

# Home directories setup
mkdir -p ~/Downloads ~/Screenshots || error_exit "Failed to create directories"

# Enable Black Arch repo
curl -fsSL https://blackarch.org/strap.sh | sudo bash || error_exit "Failed to enable Black Arch repo"

# Firewall setup
install_packages ufw
sudo ufw enable || error_exit "Failed to enable UFW"
enable_services ufw.service

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

# Binaries
install_packages zsh alacritty wofi curl wget locate less tree neofetch exa bat apparmor whois tcpdump exfat-utils openssh strace lsof fwupd tinyxxd 

# Qt
install_packages qt5-wayland qt6-wayland qt6-base qt6-tools qtcreator

# Programming & Development
install_packages cargo go tk geckodriver python-pip python-pywal ncurses cmake pngquant oxipng

# Media
install_packages cmus pamixer pavucontrol vlc

# Bluetooth
install_packages blueman bluez bluez-utils
enable_services bluetooth

# Utils
install_packages curlie waybar ranger fzf btop cliphist pam_yubico pam-u2f atool unzip zip sxiv p7zip net-tools openvpn proton-vpn-gtk-app jq timeshift qemu-user 

# Graphic Design
install_packages gimp blender inkscape

# Text Editor/Viewer
install_packages obsidian libreoffice-fresh zathura zathura-pdf-mupdf

# Gaming
install_packages steam lutris

# Messengers
install_packages signal-desktop thunderbird

# OBS
install_packages obs xdg-desktop-portal-hyprland xdg-desktop-portal-wlr

# Wireshark
install_packages wireshark-qt
sudo chmod +x /usr/bin/dumpcap || error_exit "Failed to change permissions for dumpcap"

# Screenshots
install_packages grim swappy slurp

# Yay Packages 
install_packages_yay ttf-firacode-nerd hyprland-qtutils swww vscodium-bin librewolf-bin scrub zsh-syntax-highlighting zsh-autosuggestions xpad youtube-music-bin cursor-bin python-pywalfox-librewolf

# Dot Files
for config_dir in alacritty btop gtk-3.0 gtk-4.0 hypr swappy waybar; do
    cp -r "$config_dir" ~/.config/ || error_exit "Failed to copy $config_dir"
done

cp -r wal ~/.config || error_exit "Failed to copy wal/templates"

# Script Permissions
sudo chmod +x ~/.config/hypr/scripts/*.sh || error_exit "Failed to change script permissions"

# OMZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || error_exit "Failed to install oh-my-zsh"

# Set pywal
wal -i ~/Arch-Installation-Script/w4llp4p3rs/1.jpg || error_exit "Failed to set pywal"
pywalfox install --browser librewolf || || error_exit "Failed to set pywalfox"

# Set Wallpaper
swww img ~/Arch-Installation-Script/w4llp4p3rs/1.jpg

# .zshsrc
SCRIPT_DIR=$(dirname "$(realpath "$0")")
cp "$SCRIPT_DIR/.zshrc" ~/ || error_exit "Failed to copy .zshrc"

# Function to install VirtualBox
install_virtualbox() {
    echo "Installing VirtualBox host modules..."
    sudo pacman -S --noconfirm virtualbox-host-modules-arch
    echo "Installing VirtualBox..."
    sudo pacman -S --noconfirm virtualbox
    echo "Loading VirtualBox modules..."
    sudo modprobe vboxdrv
    echo "Checking VirtualBox version..."
    VBOX_VERSION=$(vboxmanage -v | cut -dr -f1)
    echo "VirtualBox version detected: $VBOX_VERSION"
    EXT_PACK_URL="https://download.virtualbox.org/virtualbox/$VBOX_VERSION/Oracle_VM_VirtualBox_Extension_Pack-$VBOX_VERSION.vbox-extpack"
    echo "Downloading VirtualBox Extension Pack from $EXT_PACK_URL..."
    wget $EXT_PACK_URL
    echo "Installing VirtualBox Extension Pack..."
    sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-$VBOX_VERSION.vbox-extpack
    echo "Verifying the installed Extension Pack..."
    vboxmanage list extpacks
    read -p "Do you want to add your user to the vboxusers group? (yes/no): " ADD_USER
    if [[ "$ADD_USER" == "yes" ]]; then
        sudo usermod -aG vboxusers $USER
        echo "User $USER has been added to the vboxusers group."
    else
        echo "User $USER was not added to the vboxusers group."
    fi
    rm Oracle_VM_VirtualBox_Extension_Pack-$VBOX_VERSION.vbox-extpack
    echo "VirtualBox installation and setup complete."
}

read -p "Do you want to install VirtualBox? (yes/no): " INSTALL_VBOX
if [[ "$INSTALL_VBOX" == "yes" ]]; then
    install_virtualbox
else
    echo "Skipping VirtualBox installation."
fi

echo "Finished! Please reboot."

