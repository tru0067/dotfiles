# Notes for a fully fresh install.

##### Git
First and foremost, I'll need git:
```
sudo apt install git
```
I'll probably want to set up a personal access token for this machine. I also
like to use a remote url that contains my username, as this makes it easy to
manage multiple accounts, along with storing my credentials:
```
# Clone with username in url.
git clone https://tru0067@github.com/tru0067/dotfiles.git
# Add remote url with username (e.g. when making a new repo).
git remote add origin https://tru0067@github.com/tru0067/dotfiles.git
# Change remote url to one with username.
git remote set-url origin https://tru0067@github.com/tru0067/dotfiles.git
# Use stored credentials.
git config credential.helper store
```

##### Wallpapers
I have my own wallpaper repo. Available at
<https://github.com/tru0067/wallpapers>.

##### Fonts
I'm partial to the Literation Nerd Font family. As well as Blex and JetBrains.
TODO: Figure out a way of making these install friendly.
After installing them, make sure to refresh the font cache:
```
fc-cache -f
```

##### Verdurous
I have my own vim colorscheme. Available at
<https://github.com/tru0067/verdurous>.

##### Neovim
My editor of choice is neovim:
```
sudo apt install neovim
```

##### Zsh
My shell of choice:
```
sudo apt install zsh
```
I should then set it to be the default:
```
chsh --shell /usr/bin/zsh
```
I need to logout and log back in again for that change to occur.

##### Alacritty
Alacritty is not as of yet in the official ubuntu repos. Thus I intall it from
the popOS PPA:
```
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt-get update
sudo apt install alacritty
```
I'll then want to make alacritty our default terminal emulator (this may not be
necessary, but good to know how to do):
```
sudo update-alternatives --config x-terminal-emulator
```

##### PCManFM
My file manager of choice is PCManFM:
```
sudo apt install pcmanfm
```

TODO: Do I want PCManFM to manage desktop icons? `pcmanfm --desktop`.

##### GTK and icon themes
I like Qogir dark, which is available at
<https://github.com/vinceliuice/Qogir-theme> and the papirus icon theme,
available at <https://github.com/PapirusDevelopmentTeam/papirus-icon-theme>. For
installing these themes I use gnome-tweaks. Available via:
```
sudo apt install gnome-tweaks
```

##### xkb
I use a custom xkb keyboard layout. This can be enabled by first linking my
layout:
```
sudo ln --symbolic ~/dotfiles/xkb/symbols/tt /usr/share/X11/xkb/symbols
```
and then by copying the contents of `xkb/evdev.xml` into
`/usr/share/X11/xkb/rules/evdev.xml`. A restart is required, and then the
keyboard layout can be selected.

TODO: Sway!!!!!!

