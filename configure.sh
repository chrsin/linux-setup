#!/bin/bash

#Inspired by the excellent setup stript at https://github.com/andreasuvoss/fedora-setup/blob/main/scripts/configure.sh
#Rebind keys
#Rebind from ['<Ctrl><Shift><Alt>R']
gsettings set org.gnome.shell.keybindings show-screen-recording-ui "['<Control>Print']"

#Gnome extensions
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com

#Git config
git config --global user.email "csod@ok.dk"
git config --global user.name "Christian Sindberg Oddershede"

# Better Alt-tabbing (each window not each application)
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward  "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward  "[]"