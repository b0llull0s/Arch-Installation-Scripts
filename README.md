## Synopsis:

Ready to go Arch system riced with py-wal completly integrated, custom waybar modules with nerdy icons on Hyperland.
Unlocked Black Arch repo and some basic utils on both configuration and software.
Custom script to swap wallpapers and the entire color scheme for the new wallpaper.

Its divided on three scrips that are pretty straight forward as the archlinux installation script is.
I will try to improve it gradually as there are more stuff that could be optimized. Some stuff that need to be pointed:

- No battery icons as i don´t use batteries normally 
- No session manager as Hyperland recommends to login from the TTY

### Details:

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

### You also may want to check those:

- **Multimedia**: `Gimp`, `mpv`, `vlc`, `shotcut`, 
- **Security**: `ccrypt`, `GnuPG`, `Kleopatra` 

## Installation:

Make you sure you have a USB-drive ready to use with an Arch ISO in and just boot it. Remenber that hyperland wont work on virtual machines. 
You may like to desactivate the root user for security reasons and use sudo to manage privileges. To make sure this happened you can type this command even the archinstall script will give you this option later, just to make sure:

```
usermod -p '!' root
```
Connect to internet:

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

And wait for the install to finish, once is done reboot your system and download this repository:

```
https://github.com/Tr1sm3gist0/P4n1c-Arch.git
cd ~/P4nic-Arch
chmod +x *.sh
```

If there something you dont want to install just removed or replace with your preferecences. Other wise just run the first script.

The reason is divided on three is because is a good practise to reboot your system after some of those changes.

With the first script you will enable the Black Arh repo and create home directories.

Edit:
```
/etc/pacman.conf
```
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





