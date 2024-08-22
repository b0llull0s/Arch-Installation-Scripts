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

# Packages

install_packages nmap ncat openbsd-netcat mariadb 

# Yay Packages

yay -S --noconfirm rustscan
yay -S --noconfirm ffuf
yay -S --noconfirm burpsuite
yay -S --noconfirm feroxbuster
yay -S --noconfirm naabu
yay -S --noconfirm netexec
yay -S --noconfirm ruby-evil-winrm


# Snap

sudo snap install john-the-ripper
