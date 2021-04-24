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

# Prompt settings.
# "{username}@{machine name}:{currect directory} ({vcs info}) ".
PROMPT='%F{2}%n@%M%f:%F{4}%~%f${vcs_info_msg_0_} '
# "[{exit status}] {time}"
RPROMPT='%F{7}[%?] %T%f'

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
bindkey '^H' backward-kill-word        # Let CTRL+BACKSPACE delete the previous word.
bindkey '^[[3;5~' kill-word            # Let CTRL+DELETE delete the next word.

# Aliases.
alias ls="ls -v --color=auto --group-directories-first"
alias ll="ls -al --si --time-style=long-iso"
alias grep="grep --color=auto"
alias tree="tree -v -C --dirsfirst"
