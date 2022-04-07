#!/bin/bash

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.

skeleton() {
    s=${1}  # Source string.
    t=${2}  # Target file.
    mkdir -p $(dirname ${t})
    if [[ ! -f ${t} ]]; then
        printf "${s}\n" > ${t}
        printf "Creating skeleton ${t}\n"
    else
        printf "Skipping skeleton ${t}\n"
    fi
}

# Alacritty.
skeleton "import:\n  - ${PWD}/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
# Git.
skeleton "[include]\n\tpath = ${PWD}/git/.gitconfig" ~/.gitconfig
# Sway.
skeleton "include ${PWD}/sway/config" ~/.config/sway/config
# Waybar.
skeleton "{\n    \"include\": [\"${PWD}/waybar/config\"]\n}" ~/.config/waybar/config
skeleton "@import \"${PWD}/waybar/style.css\";" ~/.config/waybar/style.css
# Vim.
skeleton "source ${PWD}/vim/.vimrc" ~/.vimrc
# Neovim.
skeleton "dofile\"${PWD}/vim/init.lua\"" ~/.config/nvim/init.lua
# Zathura.
skeleton "include ${PWD}/zathura/zathurarc" ~/.config/zathura/zathurarc
# Zsh.
skeleton "source ${PWD}/zsh/.zshrc" ~/.zshrc
