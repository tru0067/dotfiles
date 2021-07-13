#!/bin/bash

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.

# Alacritty.
mkdir -p ~/.config/alacritty
current_target=~/.config/alacritty/alacritty.yml
if [[ ! -f ${current_target} ]]; then
    printf "import:\n  - ${PWD}/alacritty/alacritty.yml\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
# Git.
current_target=~/.gitconfig
if [[ ! -f ${current_target} ]]; then
    printf "[include]\n\tpath = ${PWD}/git/.gitconfig\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
# Sway.
mkdir -p ~/.config/sway
current_target=~/.config/sway/config
if [[ ! -f ${current_target} ]]; then
    printf "include ${PWD}/wm/sway/config\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
# Waybar.
mkdir -p ~/.config/waybar
current_target=~/.config/waybar/config
if [[ ! -f ${current_target} ]]; then
    printf "{\n    \"include\": [\"${PWD}/wm/waybar/config\"]\n}\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
current_target=~/.config/waybar/style.css
if [[ ! -f ${current_target} ]]; then
    printf "@import \"${PWD}/wm/waybar/style.css\";\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
# Vim.
current_target=~/.vimrc
if [[ ! -f ${current_target} ]]; then
    printf "source ${PWD}/vim/.vimrc\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
# Neovim.
mkdir -p ~/.config/nvim
current_target=~/.config/nvim/init.vim
if [[ ! -f ${current_target} ]]; then
    printf "source ${PWD}/vim/init.vim\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
# Zsh.
current_target=~/.zshrc
if [[ ! -f ${current_target} ]]; then
    printf "source ${PWD}/zsh/.zshrc\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
