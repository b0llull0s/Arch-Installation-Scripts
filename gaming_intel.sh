#!/bin/bash

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

install_packages lutris wine winetricks lib32-vkd3d umu-launcher lib32-vulkan-icd-loader vkd3d vulkan-tools vulkan-intel lib32-vulkan-intel


# fluidsynth - For games that have MIDI music
# gamemode - Allows games to request a temporary set of optimisations
# gvfs - GVFS backend
# innoextract - Extract Inno Setup installers
# lib32-gamemode - Allows games to request a temporary set of optimisations
# xorg-xgamma - Restore gamma on game exit
# lib32-libglvnd lib32-gnutls
