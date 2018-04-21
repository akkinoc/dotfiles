function _prompt_command() {
    local result=$?
    PS1="\[\e]0;\u at \h in \W\a\]"
    PS1+="\n"
    if [[ $result -eq 0 ]]; then
        PS1+="\[\e[32m\]OK!! [$result]\[\e[m\]"
    else
        PS1+="\[\e[31m\]NG... [$result]\[\e[m\]"
    fi
    PS1+="\n"
    if [[ $USER != "root" ]]; then
        PS1+="\[\e[35m\]\u\[\e[m\]"
    else
        PS1+="\[\e[1;35m\]\u\[\e[m\]"
    fi
    PS1+=" at \[\e[36m\]\H\[\e[m\]"
    PS1+=" in \[\e[34m\]\w\[\e[m\]"
    PS1+="$(__git_ps1 ' on \[\e[33m\]%s\[\e[m\]')"
    PS1+="\n"
    PS1+="\\\$ "
    return $result
}

PROMPT_COMMAND="_prompt_command"
PROMPT_DIRTRIM=0
PS1="\n\u at \H in \w\n\$ "
PS2="> "
PS3="#? "
PS4="+ "
GIT_PS1_STATESEPARATOR=":"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
