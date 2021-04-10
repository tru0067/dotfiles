#!/bin/bash

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.
# TODO: Currently assumes the dotfiles repo is in the home directory. Should be
# possible to know where this repo is by the path that this script is run from.
mkdir -p ~/.config/alacritty
if [[ ! -f ~/.config/alacritty/alacritty.yml ]]; then
    printf "import:\n  - /home/tru0067/dotfiles/alacritty/alacritty.yml\n" > ~/.config/alacritty/alacritty.yml
    printf "Adding skeleton ~/.config/alacritty/alacritty.yml\n"
fi
mkdir -p ~/.config/sway
if [[ ! -f ~/.config/sway/config ]]; then
    printf "include ~/dotfiles/sway/config\n" > ~/.config/sway/config
    printf "Adding skeleton ~/.config/sway/config\n"
fi
if [[ ! -f ~/.config/sway/status.sh ]]; then
    cp ~/dotfiles/sway/status.sh ~/.config/sway/status.sh
    printf "Copying to ~/.config/sway/status.sh\n"
fi
if [[ ! -f ~/.vimrc ]]; then
    printf "source ~/dotfiles/vim/.vimrc\n" > ~/.vimrc
    printf "Adding skeleton ~/.vimrc\n"
fi
mkdir -p ~/.config/nvim
if [[ ! -f ~/.config/nvim/init.vim ]]; then
    printf "source ~/dotfiles/vim/init.vim\n" > ~/.config/nvim/init.vim
    printf "Adding skeleton ~/.config/nvim/init.vim\n"
fi
if [[ ! -f ~/.config/nvim/filetype.vim ]]; then
    printf "source ~/dotfiles/vim/filetype.vim\n" > ~/.config/nvim/filetype.vim
    printf "Adding skeleton ~/.config/nvim/filetype.vim\n"
fi
if [[ ! -f ~/.zshrc ]]; then
    printf "source ~/dotfiles/zsh/.zshrc\n" > ~/.zshrc
    printf "Adding skeleton ~/.zshrc\n"
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
        printf "source ~/dotfiles/vim/after/ftplugin/$filename\n" > ~/.config/nvim/after/ftplugin/$filename
        printf "Adding skeleton ~/.config/nvim/after/ftplugin/$filename\n"
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
        printf "source ~/dotfiles/vim/after/syntax/$filename\n" > ~/.config/nvim/after/syntax/$filename
        printf "Adding skeleton ~/.config/nvim/after/syntax/$filename\n"
    fi
done
