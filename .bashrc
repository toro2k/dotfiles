source "$HOME/.commonrc.sh"


shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s no_empty_cmd_completion
shopt -s checkwinsize


if [[ -r "/etc/bash_completion" ]]; then
    source "/etc/bash_completion"
fi


PROMPT_DIRTRIM=3

ON_PURPLE='\[\e[45m\]'
ON_RED='\[\e[41m\]'
RED='\[\e[1;31m\]'
YELLOW='\[\e[1;33m\]'
RESET_COLOR='\[\e[0m\]'

if [[ -z "$SSH_TTY" ]]; then
    if [[ "$EUID" == 0 ]]; then
        PS1="\n${ON_RED} [\w] ${RESET_COLOR}\n\$ "
    else
        PS1="\n${ON_PURPLE} [\w]\$(scm_prompt) ${RESET_COLOR}\n\$ "
    fi
else
    if [[ "$EUID" == 0 ]]; then
        PS1="\n[\h] \w ${RED}\\\$\\\$ ${RESET_COLOR}"
    else
        PS1="\n[\h] \w ${YELLOW}\\\$\\\$ ${RESET_COLOR}"
    fi
fi

PS2='> '

if [[ "$TERM" == 'xterm' || "$TERM" =~ 'rxvt' ]]; then
    if [[ -z "$SSH_TTY" ]]; then
        PROMPT_COMMAND='echo -ne "\e]0;${PWD}\a"'
    else
        PROMPT_COMMAND='echo -ne "\e]0;[${HOSTNAME}] ${PWD}\a"'
    fi
fi
