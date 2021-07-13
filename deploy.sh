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
skeleton "include ${PWD}/wm/sway/config" ~/.config/sway/config
# Waybar.
skeleton "{\n    \"include\": [\"${PWD}/wm/waybar/config\"]\n}" ~/.config/waybar/config
skeleton "@import \"${PWD}/wm/waybar/style.css\";" ~/.config/waybar/style.css
# Vim.
skeleton "source ${PWD}/vim/.vimrc" ~/.vimrc
# Neovim.
skeleton "source ${PWD}/vim/init.vim" ~/.config/nvim/init.vim
# Zsh.
skeleton "source ${PWD}/zsh/.zshrc" ~/.zshrc
