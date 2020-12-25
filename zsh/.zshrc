# History settings.
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Miscellaneous settings.
setopt autocd                          # Automatically cd if the command is a filename.
unsetopt beep                          # Don't beep.

# Prompt settings.
PROMPT="%F{2}%n@%M:%f%F{4}%~%f "      # "{username}@{machine name}:{currect directory} "
RPROMPT="[%?] %T"                      # "[{exit status}] {time}"

# Command line vi mode settings.
bindkey -v                             # Use vi keybindings for editing the command line.
KEYTIMEOUT=5                           # Remove mode switching delay.
bindkey -v '^?' backward-delete-char   # Allow backspacing past start of insertion.
# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} = '' ]] ||
         [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select
# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[5 q'
}

# Keybindings.
bindkey '^H' backward-kill-word        # Let CTRL+BACKSPACE delete the previous word.
bindkey '^[[3;5~' kill-word            # Let CTRL+DELETE delete the next word.

# Aliases.
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -al --si --time-style=long-iso"

