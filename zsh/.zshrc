# History settings.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Miscellaneous settings.
setopt autocd                          # Automatically cd if the command is a filename.
unsetopt beep                          # Don't beep.

# Setting defaults.
export EDITOR="nvim"                   # Set neovim as default editor.
export VISUAL="nvim"

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
alias grep="grep --color=auto"
alias tree="tree -v -C --dirsfirst"
