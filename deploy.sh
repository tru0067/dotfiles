#!/bin/bash

# Symlink the alacritty config file.
ln --symbolic ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Create skeleton config files that just source the config files in this repository.
# NOTE: This will destroy any existing config files!
echo "include ~/dotfiles/sway/config" > ~/.config/sway/config
echo "source ~/dotfiles/vim/init.vim" > ~/.config/nvim/init.vim
echo "source ~/dotfiles/zsh/.zshrc"   > ~/.zshrc

