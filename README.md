# My system configuration files

### Files

##### `alacritty/`
Terminal colorscheme, that's about it.

##### `git/`
Very simple `.gitconfig`.

##### `vim/`
A bare minimum `.vimrc` as well as my `init.vim`. For my vim colorscheme see
<https://github.com/tru0067/verdurous>.

##### `wm/`
All my window manager config. Contains some tweaks to the Gnome DE, as well as
my config for `sway` and `waybar`.

##### `xkb/`
My custom keyboard layout.

##### `zsh/`
Aliases and prompt.

##### `deploy.sh`
A script that automatically links each of the system's config files to the ones
in this repository. Where possible, we make a system config file that simply
sources this repo's config file. Where this is not possible, we symlink them. If
those files already exist, this script does not overwrite them. Must be run from
within this directory.

##### `install_notes.md`
A brief outline of some common steps when performing a fresh install.

### TODO
-   Sway
    -   Set up sway idle/lock
    -   Multiple monitors
-   Change terminal emulator to `kitty`
    -   Underline and images
    -   Want to check battery performance though
-   Configure NeoVim
    -   Built-in LSP
    -   Refactor makeprg's into compiler scripts
        -   Along with error format?
