#!/bin/bash

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.
# TODO: Currently assumes the dotfiles repo is in the home directory. Should be
# possible to know where this repo is by the path that this script is run from.
mkdir -p ~/.config/alacritty
if [[ ! -f ~/.config/alacritty/alacritty.yml ]]; then
    printf "import:\n  - /home/tru0067/dotfiles/alacritty/alacritty.yml" > ~/.config/alacritty/alacritty.yml
fi
mkdir -p ~/.config/sway
if [[ ! -f ~/.config/sway/config ]]; then
    printf "include ~/dotfiles/sway/config" > ~/.config/sway/config
fi
if [[ ! -f ~/.vimrc ]]; then
    printf "source ~/dotfiles/vim/.vimrc" > ~/.vimrc
fi
mkdir -p ~/.config/nvim
if [[ ! -f ~/.config/nvim/init.vim ]]; then
    printf "source ~/dotfiles/vim/init.vim" > ~/.config/nvim/init.vim
fi
if [[ ! -f ~/.config/nvim/filetype.vim ]]; then
    printf "source ~/dotfiles/vim/filetype.vim" > ~/.config/nvim/filetype.vim
fi
if [[ ! -f ~/.zshrc ]]; then
    printf "source ~/dotfiles/zsh/.zshrc" > ~/.zshrc
fi

# Now do the same for every vim file in this repo's `vim/after/ftplugin/`
for filename in vim/after/ftplugin/*.vim; do
    # Check that the filename we just matched actually exists.
    if [[ ! -f "$filename" ]]; then
        continue
    fi
    # Strip out the path part (just keep the filename itself).
    filename="$(basename -- $filename)"
    # Check if we already have a corresponding file in our config directory.
    mkdir -p ~/.config/nvim/after/ftplugin
    if [[ ! -f ~/.config/nvim/after/ftplugin/$filename ]]; then
        # If we don't, make one to source the one in this repo.
        printf "source ~/dotfiles/vim/after/ftplugin/$filename" > ~/.config/nvim/after/ftplugin/$filename
    fi
done

# And for every vim file in this repo's `vim/after/syntax/`
for filename in vim/after/syntax/*.vim; do
    # Check that the filename we just matched actually exists.
    if [[ ! -f "$filename" ]]; then
        continue
    fi
    # Strip out the path part (just keep the filename itself).
    filename="$(basename -- $filename)"
    # Check if we already have a corresponding file in our config directory.
    mkdir -p ~/.config/nvim/after/syntax
    if [[ ! -f ~/.config/nvim/after/syntax/$filename ]]; then
        # If we don't, make one to source the one in this repo.
        printf "source ~/dotfiles/vim/after/syntax/$filename" > ~/.config/nvim/after/syntax/$filename
    fi
done
