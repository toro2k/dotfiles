source "$HOME/.commonrc.sh"

HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000
HISTSIZE=1000

bindkey -e

autoload -U compinit && compinit

NL=$'\n'
setopt PROMPT_SUBST
PROMPT="${NL}%K{magenta}[%3~] \$(scm_prompt) %k${NL}%# "
unset NL

terminal_title() {
    echo -ne "\033]0;${PWD}\007"
}

precmd_functions=(terminal_title)
