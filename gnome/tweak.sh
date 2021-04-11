#!/bin/sh
# Use larger text.
#gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
# Allow focus on hover.
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Disable default <Super+Num> app switching.
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for i in $(seq 1 9)
do
    gsettings set org.gnome.shell.keybindings switch-to-application-${i} []
done
# TODO: I really could add just about every settings change here, but there
#       are a whole lot, and I really wanna get a tiling wm set up instead.
#       For now, these will do as a bare minimum.
