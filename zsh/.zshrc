# History settings.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Miscellaneous settings.
unsetopt beep                          # Don't beep.

# Setting defaults.
export EDITOR="nvim"                   # Set neovim as default editor.
export VISUAL="nvim"
# Set `LS_COLORS`. Generated from `dircolors -b`.
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=01;04;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# Git integration.
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{6}(%b)%f' # "{branch name}".
zstyle ':vcs_info:*' enable git

# Duration of last command.
function preexec () {
    cmd_start_time=$(date +%s%3N)
}
function precmd () {
    if [ ${cmd_start_time} ]; then
        local ms=$(($(date +%s%3N) - ${cmd_start_time}))
        local s=$((ms / 1000))
        local m=$((ms / 60000))
        local h=$((ms / 3600000))
        if   ((h > 0)); then cmd_duration=${h}h$((m % 60))m$((s % 60))s
        elif ((m > 0)); then cmd_duration=${m}m$((s % 60))s
        elif ((s > 9)); then cmd_duration=${s}.$(printf %02d $(((ms % 1000) / 10)))s
        elif ((s > 0)); then cmd_duration=${s}.$(printf %03d $((ms % 1000)))s
        else cmd_duration=${ms}ms
        fi
        unset cmd_start_time
    else
        unset cmd_duration
    fi
}

# Prompt settings.
# "{username}@{machine name}:{currect directory} ({vcs info}) ".
PROMPT='%F{2}%n@%M%f:%F{4}%~%f${vcs_info_msg_0_} '
# "({command duration}) [{exit status}] {time}"
RPROMPT='%F{7}$(if [ ${cmd_duration} ]; then echo "(${cmd_duration}) "; fi)[%?] %T%f'

# Command line vi mode settings.
bindkey -v                             # Use vi keybindings for editing the command line.
KEYTIMEOUT=5                           # Remove mode switching delay.
bindkey -v '^?' backward-delete-char   # Allow backspacing past start of insertion.
# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
function zle-line-init() { echo -ne "\e[5 q" }
zle -N zle-keymap-select
zle -N zle-line-init
# Let Ctrl-E open the command line in an editor.
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Keybindings.
# Let Ctrl-Backspace delete the previous word.
bindkey '^H' backward-kill-word
# Let Ctrl-Delete delete the next word.
bindkey '^[[3;5~' kill-word
# Let Ctrl-F search through the history.
bindkey '^F' history-incremental-pattern-search-backward
# Let Ctrl-N expand the current line by searching backward through the history.
bindkey '^N' history-beginning-search-backward
# Let Ctrl-P expand the current line by searching forward through the history.
bindkey '^P' history-beginning-search-forward
# Let Ctrl-K delete the rest of the current line.
bindkey '^K' kill-line
# Let Ctrl-U delete the current line.
bindkey '^U' kill-whole-line

# Aliases.
alias ls="ls -v --color=auto --group-directories-first"
alias ll="ls -al --si --time-style=long-iso"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias tree="tree -v --dirsfirst"
