# Notes for a fully fresh install.

## Vital programs

### Git
First and foremost, I'll need git:
```sh
sudo apt install git
```

And then Git Credential Manager for my credentials, installed as a DotNET tool:
```sh
sudo apt install dotnet-sdk-8.0
dotnet tool install -g git-credential-manager
git-credential-manager configure
git config --global credential.credentialStore cache
```
See <https://github.com/git-ecosystem/git-credential-manager/blob/release/docs/install.md>

I also like to use a remote url that contains my username, as this makes it easy
to manage multiple accounts (this might not be required when using GCM, I'll
have to wait and see!):
```sh
# Clone with username in url.
git clone https://tru0067@github.com/tru0067/dotfiles.git
# Add remote url with username (e.g. when making a new repo).
git remote add origin https://tru0067@github.com/tru0067/dotfiles.git
# Change remote url to one with username.
git remote set-url origin https://tru0067@github.com/tru0067/dotfiles.git
```

### Kitty
Kitty can be installed with:
```sh
sudo apt install kitty
```
Or get the latest release through the installer with:
```sh
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```
This does not install kitty system-wide (so Sway will not know about it). I can
do so with:
```sh
sudo ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/kitty
```
See <https://sw.kovidgoyal.net/kitty/binary/> for more.

I'll then want to make kitty my default terminal emulator (this may not be
necessary, but good to know how to do):
```sh
sudo update-alternatives --config x-terminal-emulator
```

### Zsh
My shell of choice:
```sh
sudo apt install zsh
```
I should then set it to be the default:
```sh
chsh --shell /usr/bin/zsh
```
I need to logout and log back in again for that change to occur.

### Neovim
My editor of choice is neovim:
```sh
sudo apt install neovim
```

In order to build the latest version of Neovim from source, follow along with
<https://github.com/neovim/neovim/wiki/Building-Neovim>. For using the "Release"
build, make it with:
```sh
sudo make CMAKE_BUILD_TYPE=Release install
```
Possibly after checking out a suitable release tag e.g.:
```sh
git checkout tags/v0.11.2
```
The built binary should be earlier on the path than the packaged one, so it
should be fine to run with `nvim`. To use it with a shorter command, such as
`vi` one can override the normal alternative in `/etc/alternatives`. E.g. with:
```sh
cd /etc/alternatives
sudo rm vi
sudo ln -s /usr/local/bin/nvim vi
```
Since the alternatives for `nvim` and `vim` should still point to the packaged
binary this allows me to easily switch between all versions by simply running
`nvim`, `vim` or `vi`.

## Appearance

### Fonts
I'm partial to the Literation Nerd Font family. As well as Blex and JetBrains.
TODO: Figure out a way of making these install friendly.
After installing them, make sure to refresh the font cache:
```sh
fc-cache -f
```

### Terminal colorschemes
I have my own vim and alacritty colorschemes (and even a firefox one). Available
at <https://github.com/tru0067/verdurous>.

### Dotfiles
Now that all that stuff is installed, I should be able to configure them with my
dotfiles repo, which we are in! Available at
<https://github.com/tru0067/dotfiles>.

### GTK and icon themes
I like Qogir dark, which is available at
<https://github.com/vinceliuice/Qogir-theme> and the papirus icon theme,
available at <https://github.com/PapirusDevelopmentTeam/papirus-icon-theme>.

## Keyboard

### xkb
I use a custom xkb keyboard layout. This can be enabled by first linking my
layout:
```sh
sudo ln --symbolic ~/dotfiles/xkb/symbols/tt /usr/share/X11/xkb/symbols
```
and then by copying the contents of the `evdev.xml` portion of `xkb/README.md`
into `/usr/share/X11/xkb/rules/evdev.xml`. A restart is required, and then the
keyboard layout can be selected.

## Window manager

### Sway
I use sway as my window manager:
```sh
sudo apt install sway
```

I use `wofi` as my application launcher for sway, `wl-clipboard` to manage the
clipboard, `grim` and `slurp` to take screenshots, `brightnessctl` to control
backlight brightness and `blueman` to manage my bluetooth devices:
```sh
sudo apt install wofi wl-clipboard grim slurp brightnessctl blueman
```
In order to use `brightnessctl` is may be necessary to add myself to the `video`
group:
```sh
sudo usermod -a -G video $LOGNAME
```
and then log out and back in.

I typically configure my inputs and outputs with sway on a per device basis,
good options to know are:
```
input <keyboard> {
    xkb_layout "tt"
    xkb_variant "modded"
}
input <touchpad> {
    tap enabled
    natural_scroll enabled
}
```
The list of input devices can be obtained from within sway with:
```sh
swaymsg -t get_inputs
```
(You use the "Identifier" line.)

Another useful one-liner is:
```
output * bg $(find /path/to/wallpaper-directory -type f | shuf -n 1) fill
```
which sets a random wallpaper on every startup.

In order for firefox to use the wayland backend, it may be necessary to add
`MOZ_ENABLE_WAYLAND=1` to `~/.config/environment.d/envars.conf`.

## Other programs or packages

### LaTeX, Pandoc and other writing tools
I often use LaTeX for academic writing. I default to the TeXLive distribution.
I also like Pandoc (to create PDFs from markdown documents) and Patat (to create
presentations within the terminal).
```sh
sudo apt install texlive-full pandoc patat
```

### Anaconda
When developing with python, I typically use the Anaconda distribution,
available at <https://www.anaconda.com/products/individual>.

Some aspects of Anaconda work by modifying a shell rc file, in order for those
parts to work with `zsh` run:
```sh
conda init zsh
```
To disable Anaconda from changing the prompt run:
```sh
conda config --set changeps1 False
```

### Julia
When developing with julia, just get the latest release, available at
<https://julialang.org/downloads/>, extract this with `tar -xf julia-version`
and then add a link somewhere to the path, e.g.:
```sh
ln -s ~/builds/julia-1.7.2/bin/julia ~/.local/bin/julia
```
