# Notes for a fully fresh install.

## Vital programs

### Git
First and foremost, I'll need git:
```bash
sudo apt install git
```
I'll probably want to set up a personal access token for this machine. I also
like to use a remote url that contains my username, as this makes it easy to
manage multiple accounts, along with storing my credentials:
```bash
# Clone with username in url.
git clone https://tru0067@github.com/tru0067/dotfiles.git
# Add remote url with username (e.g. when making a new repo).
git remote add origin https://tru0067@github.com/tru0067/dotfiles.git
# Change remote url to one with username.
git remote set-url origin https://tru0067@github.com/tru0067/dotfiles.git
# Use stored credentials.
git config credential.helper store
```

### Alacritty
Alacritty is not as of yet in the official ubuntu repos. Thus I intall it from
the popOS PPA:
```bash
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get update
sudo apt install alacritty
```
I'll then want to make alacritty my default terminal emulator (this may not be
necessary, but good to know how to do):
```bash
sudo update-alternatives --config x-terminal-emulator
```

### Zsh
My shell of choice:
```bash
sudo apt install zsh
```
I should then set it to be the default:
```bash
chsh --shell /usr/bin/zsh
```
I need to logout and log back in again for that change to occur.

### Neovim
My editor of choice is neovim:
```bash
sudo apt install neovim
```

TODO: I think I want to build it from source at some point.

### PCManFM
My file manager of choice is PCManFM:
```
sudo apt install pcmanfm
```

TODO: Do I want PCManFM to manage desktop icons? `pcmanfm --desktop`. Would this
work with sway? Does PCManFM play nice in wayland?

## Appearance

### Fonts
I'm partial to the Literation Nerd Font family. As well as Blex and JetBrains.
TODO: Figure out a way of making these install friendly.
After installing them, make sure to refresh the font cache:
```bash
fc-cache -f
```

### Verdurous
I have my own vim colorscheme. Available at
<https://github.com/tru0067/verdurous>.

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
```bash
sudo ln --symbolic ~/dotfiles/xkb/symbols/tt /usr/share/X11/xkb/symbols
```
and then by copying the contents of `xkb/evdev.xml` into
`/usr/share/X11/xkb/rules/evdev.xml`. A restart is required, and then the
keyboard layout can be selected.

## Window manager

### Sway
I've been experimenting with sway as my window manager:
```bash
sudo apt install sway
```

I use `wofi` as my application launcher for sway, `wl-clipboard` to manage the
clipboard, `grim` to take screenshots and `brightnessctl` to control backlight
brightness:
```bash
sudo apt install wofi wl-clipboard grim brightnessctl
```
In order to use `brightnessctl` is may be necessary to add myself to the `video`
group:
```bash
sudo usermod -a -G video $LOGNAME
```
and then log out and back in.


I typically configure my keyboard/mouse with sway on a per device basis, good
options to know are:
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
```bash
swaymsg -t get_inputs
```

In order for firefox to use the wayland backend, it may be necessary to add
`MOZ_ENABLE_WAYLAND=1` to `~/.config/environment.d/envars.conf`.

## Other programs or packages

### Anaconda
When developing with python, I typically use the Anaconda distribution,
available at <https://www.anaconda.com/products/individual>.

### LaTeX, Pandoc and other writing tools
I often use LaTeX for academic writing, and for its PDF capabilities when
combined with Pandoc. I default to the TeXLive distribution:
```bash
sudo apt install texlive pandoc
```

Another very awesome tool is Patat, which uses Pandoc to create presentations
from within the terminal. Patat can even display images (through Kitty's `icat`
kitten (Patat version >= 0.8.7) or through `w3m-img`).
```bash
sudo apt install patat
```

### Dropbox
TODO: Dropbox!

### Spotify
TODO: Spotify

### Code
TODO: Code?

### Chrome
TODO: Chrome?
