# My system configuration files

##### Alacritty
Terminal colorscheme, that's about it.

##### Sway
All my window manager config.

##### Vim
A bare minimum `.vimrc` as well as my `init.vim`.

##### Zsh
Aliases and prompt.

##### `deploy.sh`
A script that automatically links each of the system's config files to the ones
in this repository. Where possible, we source this repo's config file within the
system config file, where this is not possible, we symlink them. If those files
already exist, this script does not overwrite them.

---

### TODO:

##### Vim
Change formatoptions to be loaded after. Likewise set up the tex.vim, will
probably want another deploy script specifically for vim stuff.

