#!/bin/bash

# Create skeleton config files that just source the config files in this
# repository, if those files already exist, do nothing.
mkdir -p ~/.config/alacritty
if [[ ! -f ~/.config/alacritty/alacritty.yml ]]; then
    printf "import:\n  - ${PWD}/alacritty/alacritty.yml\n" > ~/.config/alacritty/alacritty.yml
    printf "Adding skeleton ~/.config/alacritty/alacritty.yml\n"
fi
if [[ ! -f ~/.gitconfig ]]; then
    printf "[include]\n\tpath = ${PWD}/git/.gitconfig\n" > ~/.gitconfig
    printf "Adding skeleton ~/.gitconfig\n"
fi
mkdir -p ~/.config/sway
if [[ ! -f ~/.config/sway/config ]]; then
    printf "include ${PWD}/sway/config\n" > ~/.config/sway/config
    printf "Adding skeleton ~/.config/sway/config\n"
fi
if [[ ! -f ~/.config/sway/status.sh ]]; then
    cp ${PWD}/sway/status.sh ~/.config/sway/status.sh
    printf "Copying to ~/.config/sway/status.sh\n"
fi
if [[ ! -f ~/.vimrc ]]; then
    printf "source ${PWD}/vim/.vimrc\n" > ~/.vimrc
    printf "Adding skeleton ~/.vimrc\n"
fi
mkdir -p ~/.config/nvim
if [[ ! -f ~/.config/nvim/init.vim ]]; then
    printf "source ${PWD}/vim/init.vim\n" > ~/.config/nvim/init.vim
    printf "Adding skeleton ~/.config/nvim/init.vim\n"
fi
if [[ ! -f ~/.zshrc ]]; then
    printf "source ${PWD}/zsh/.zshrc\n" > ~/.zshrc
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
        printf "source ${PWD}/vim/after/ftplugin/$filename\n" > ~/.config/nvim/after/ftplugin/$filename
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
        printf "source ${PWD}/vim/after/syntax/$filename\n" > ~/.config/nvim/after/syntax/$filename
        printf "Adding skeleton ~/.config/nvim/after/syntax/$filename\n"
    fi
done
