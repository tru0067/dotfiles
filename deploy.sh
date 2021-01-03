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

# Now do the same for every vim file in `after/ftplugin/`
for filename in after/ftplugin/*.vim; do
    # Check that the filename we just matched actually exists.
    if [[ ! -f "$filename" ]]; then
        continue
    fi
    # Strip out the path part (just keep the filename itself).
    filename="$(basename -- $filename)"
    # Check if we already have a corresponding file in our config directory.
    if [[ ! -f ~/.config/nvim/after/ftplugin/$filename ]]; then
        # If we don't, make one to source the one in this repo.
        echo "source ~/dotfiles/vim/after/ftplugin/$filename" > ~/.config/nvim/after/ftplugin/$filename
    fi
done

