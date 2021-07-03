#!/bin/bash

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.
mkdir -p ~/.config/alacritty
current_target=~/.config/alacritty/alacritty.yml
if [[ ! -f ${current_target} ]]; then
    printf "import:\n  - ${PWD}/alacritty/alacritty.yml\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
current_target=~/.gitconfig
if [[ ! -f ${current_target} ]]; then
    printf "[include]\n\tpath = ${PWD}/git/.gitconfig\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
mkdir -p ~/.config/sway
current_target=~/.config/sway/config
if [[ ! -f ${current_target} ]]; then
    printf "include ${PWD}/sway/config\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
current_target=~/.config/sway/status.sh
if [[ ! -f ${current_target} ]]; then
    cp ${PWD}/sway/status.sh ${current_target}
    printf "Creating copy in  ${current_target}\n"
else
    printf "Skipping copy of  ${current_target}\n"
fi
current_target=~/.vimrc
if [[ ! -f ${current_target} ]]; then
    printf "source ${PWD}/vim/.vimrc\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
mkdir -p ~/.config/nvim
current_target=~/.config/nvim/init.vim
if [[ ! -f ${current_target} ]]; then
    printf "source ${PWD}/vim/init.vim\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
current_target=~/.zshrc
if [[ ! -f ${current_target} ]]; then
    printf "source ${PWD}/zsh/.zshrc\n" > ${current_target}
    printf "Creating skeleton ${current_target}\n"
else
    printf "Skipping skeleton ${current_target}\n"
fi
