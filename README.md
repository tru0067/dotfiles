# My system configuration files

### Files

##### `git/`
Very simple `.gitconfig`.

##### `gnome/`
Some minor tweaks for when I do use GNOME.

##### `kitty/`

##### `sway/`
All my window manager config.

##### `vim/`
A bare minimum `.vimrc` as well as my `init.vim`. For my vim colorscheme see
<https://github.com/tru0067/verdurous>.

##### `waybar/`

##### `xkb/`
My custom keyboard layout.

##### `zathura/`

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

### Useful config stuff you need to know

-   If you use firefox, by setting `full-screen-api.ignore-widgets` to `true`
    (fastest to find by searching `dgets`) in `about:config`, you can maximise
    *windows* while keeping them *windowed*. This allows you to fullscreen
    videos while keeping them inside the bounds set by your window manager!

### TODO
-   Sway
    -   Set up sway idle/lock
    -   Multiple monitors
-   NeoVim
    -   Error format for compilers
