#!/bin/sh
# Use larger text.
#gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
# Set themes.
gsettings set org.gnome.desktop.interface gtk-theme "Qogir-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Qogir-dark"
gsettings set org.gnome.desktop.interface font-name "LiterationSans Nerd Font"
# Allow focus on hover.
gsettings set org.gnome.desktop.wm.preferences focus-mode "sloppy"
# Disable default <Super+Num> app switching.
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for i in $(seq 1 9)
do
    gsettings set org.gnome.shell.keybindings switch-to-application-${i} []
done
