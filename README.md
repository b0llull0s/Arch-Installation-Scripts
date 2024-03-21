## Synopsis:
Simple installation script for Arch Linux with Wayland, Hyperland and Waybar riced with py-wal.
It also unlocks the Black Arch library and downloads some basic security utils

Planning to add the next features soon:
- Black Theme
- Battery icons for the waybar 

## Details:

| Category               | Software               
|------------------------|------------------------|
| Window Manager         | Hyprland               |
| Terminal Manager       | Alacritty,kitty        |
| File Manager           | Ranger,Nemo            |
| Status Bar             | Waybar                 |
| Launcher               | Rofi                   |
| Shell                  | Zsh                    |
| Browser                | Librewolf              |
| Text Editor            | neovim, Visual Code    |

### Additional Packages included:

`ufw` , `wireshark` , `bleachbit` , `virtualbox` , `burp` , `obsidian` , `nordvpn` , `signal`, `btop` , `wget`   

## Installation:

Have in mind that hyperland wont work on virtual machines, so this will only work on bare metal. 
Make you sure you have a USB-drive ready to use with a verified Arch ISO, you can find how to verified the integrity of your iso on the Arch Docu.
You can use rufus or dd command in linux:
```
# Lookup for your USB drive
sudo fdisk -l
# Lookup for the path of your ISO file
realpath isofile
# Creates the bootable USB
sudo dd bs=4M if=/home/shutter/Documents/ISOs/archlinux-2023.10.14-x86_64.iso of=/dev/sdb
```
Once you booted the USB and accessed the Arch ISO you may need to connect to your wifi:
```
# Start iwctl
iwctl
# list devices
device list
# Interface set to scan
station wlan0 scan
# Scan for networks
station wlan0 get-networks
# Connect to a network
station wlan0 connect networkname
```
There may be other commands you would like to use prior archinstall in that case just do them now if not just hit that arch install script and fill it as you please. There just a few steps relevant to this build that you need to follow:

- Choose Hyperland as Desktop environment
- Make sure dont choose any session manager as Hyperland recommends to login directly from the TTY.

And wait for the install to finish, once is done reboot your system.
Now you should need to connect to internet again, this time use networkmanager:
```
system net
```
and download this repository:

```
https://github.com/Tr1sm3gist0/P4n1c-Arch.git
cd ~/P4nic-Arch
chmod +x *.sh
```

If there something you dont want to install just removed or replace with your preferecences. Other wise just run the first script.

The reason is divided on three is because is a good practise to reboot your system after some of those changes.

With the first script you will enable the Black Arh repo and create home directories.


And reboot your system, then just use the second script with sudo privileges to install the core of the packages for this build.

Once is done you may like to reboot again otherwise just hit the third script.

It will Download the config files and my wallpaper collection, the build is set it in a way that you only need to add new jpgs to the w4llp4p3rs folder to be able to select then from the script to change the wallpaper

## Keybindings

| Key Combination                      | Action                  |
|--------------------------------------|-------------------------|
| `Super + Enter`                      | Alacritty               |
| `Super + F`                          | Firefox                 |
| `Super + K`                          | Kill Active Window      |
| `Super + D`                          | Rofi                    |
| `Super + R`                          | Ranger                  |
| `Super + [1-9]`                      | Switch to Workspace     |
| `Super + [SHIFT] + [1-9]`            | Window to Workingspace  |
| `Super + [SHIFT] + [arrow key]`      | Resize Window           |
| `Super + [arrow key]`                | Move to Window          |
| `Super + P`                          | Toggle Split            |
| `Super + O`                          | Toggle Float            |
| `Super + S`                          | flameshot               |
| `Super + C`                          | VSCode                  |
| `Super + T`                          | task manager            |





