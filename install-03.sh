#!/bin/bash
## Github Repos ##
git clone https://github.com/b0llull0s/7h0seF1L3s
mv w4llp4p3rs ~/Downloads/
## Dot Files ##
cp -r 7h0seF1L3s/alacritty ~/.config/
cp -r 7h0seF1L3s/kitty ~/.config/
cp -r 7h0seF1L3s/hypr ~/.config/
cp -r 7h0seF1L3s/waybar ~/.config/waybar
cp -r 7h0seF1L3s/rofi ~/.config/rofi
cp -r 7h0seF1L3s/swappy ~/.config/swappy
cp 7h0seF1L3s/.zshrc ~/
#cp .config/nvim/init.vim ~/.config/nvim/init.vim
cp -r 7h0seF1L3s/val/templates ~/.config/val/templates
## Set pywal ##
wal -i ~/Downloads/w4llp4p3rs/01.jpg
## Script Permissions
cd ~/.config/hyper/scripts
sudo chmod +x *.sh
cd
## OMZSH ##
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Finished! Do a sudo reboot."
