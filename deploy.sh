#!/bin/bash

# Symlink the alacritty config file.
# TODO: It should be possible to do this with the `import:` syntax within a
# system `alacritty.yml`, but I couldn't get this working.
if [[ ! -f ~/.config/alacritty/alacritty.yml ]]; then
    ln --symbolic ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.
# TODO: Currently assumes the dotfiles repo is in the home directory. Should be
# possible to know where this repo is by the path that this script is run from.
if [[ ! -f ~/.config/sway/config ]]; then
    echo "include ~/dotfiles/sway/config" > ~/.config/sway/config
fi
if [[ ! -f ~/.vimrc ]]; then
    echo "source ~/dotfiles/vim/.vimrc"   > ~/.vimrc
fi
if [[ ! -f ~/.config/nvim/init.vim ]]; then
    echo "source ~/dotfiles/vim/init.vim" > ~/.config/nvim/init.vim
fi
if [[ ! -f ~/.zshrc ]]; then
    echo "source ~/dotfiles/zsh/.zshrc"   > ~/.zshrc
fi

