function _prompt_command() {
    local result=$?
    PS1="\[\e]0;\u at \h in \W\a\]"
    if [[ $result -eq 0 ]]; then
        PS1+="\n\[\e[32m\]✔ \\\$? = $result\[\e[m\]"
    else
        PS1+="\n\[\e[31m\]✘ \\\$? = $result\[\e[m\]"
    fi
    if [[ $USER != "root" ]]; then
        PS1+="\n\[\e[35m\]\u\[\e[m\]"
    else
        PS1+="\n\[\e[1;35m\]\u\[\e[m\]"
    fi
    if [[ -z $SSH_CONNECTION ]]; then
        PS1+=" at \[\e[36m\]\h\[\e[m\]"
    else
        PS1+=" at \[\e[1;36m\]\H\[\e[m\]"
    fi
    if [[ $PWD/ = $HOME/* ]]; then
        PS1+=" in \[\e[34m\]\w\[\e[m\]"
    else
        PS1+=" in \[\e[1;34m\]\w\[\e[m\]"
    fi
    if type -t __git_ps1 &>/dev/null; then
        PS1+="$(__git_ps1 " on \[\e[33m\]%s\[\e[m\]")"
    fi
    PS1+="\n\\\$ "
    return $result
}

PROMPT_COMMAND="_prompt_command"
PROMPT_DIRTRIM=0
PS1="\n\u at \h in \w\n\\\$ "
PS2="> "
PS3="#? "
PS4="+ "
GIT_PS1_STATESEPARATOR=":"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
