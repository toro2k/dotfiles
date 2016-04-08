source "$HOME/.commonrc.sh"

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s no_empty_cmd_completion
shopt -s checkwinsize

if [ -r "/etc/bash_completion" ]; then
    source "/etc/bash_completion"
fi

if [ -r "$HOME/.bashmarks.sh" ]; then
    source "$HOME/.bashmarsk.sh"
fi

PROMPT_DIRTRIM=3

ON_PURPLE='[45m'
YELLOW='[1;33m'
RESET_COLOR='[0m'

if [ -z $SSH_TTY ]; then
    PS1="\n${ON_PURPLE}[\w] \$(scm_prompt) ${RESET_COLOR}\n\$ "
else
    PS1='\n[\h] \w ${YELLOW}\$\$ ${RESET_COLOR}'
fi

PS2='> '

if [[ $TERM == 'xterm' || $TERM =~ 'rxvt' ]]; then
    if [ -z $SSH_TTY ]; then
        PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
    else
        PROMPT_COMMAND='echo -ne "\033]0;[${HOSTNAME}] ${PWD}\007"'
    fi
fi


