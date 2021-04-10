# My system configuration files

### Files

##### `alacritty/`
Terminal colorscheme, that's about it.

##### `gnome/`
My setting tweaks for the Gnome desktop environment.

##### `sway/`
All my window manager config.

##### `vim/`
A bare minimum `.vimrc` as well as my `init.vim`. Also contains my custom syntax
and filetype rules. For my vim colorscheme see
<https://github.com/tru0067/verdurous>.

##### `xkb/`
My custom keyboard layout.

##### `zsh/`
Aliases and prompt.

##### `deploy.sh`
A script that automatically links each of the system's config files to the ones
in this repository. Where possible, we make a system config file that simply
sources this repo's config file. Where this is not possible, we symlink them. If
those files already exist, this script does not overwrite them.

##### `install_notes.md`
A brief outline of some common steps when performing a fresh install.

---

### TODO:

##### Vim
Change formatoptions to be loaded after. Is it possible to do this for every
filetype? Could source a generic one for each if not...
