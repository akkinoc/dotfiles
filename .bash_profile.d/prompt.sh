function _prompt_command() {
    local -a statuses=(${PIPESTATUS[@]})
    PS1="$(_ps1_title)"
    PS1+="$(_ps1_result ${statuses[@]})"
    PS1+="$(_ps1_user)"
    PS1+="$(_ps1_host)"
    PS1+="$(_ps1_wd)"
    PS1+="$(_ps1_git)"
    PS1+="$(_ps1_prompt)"
}

function _ps1_title() {
    printf "%s" '\[\e]0;\u at \h in \W\a\]'
}

function _ps1_result() {
    local -a statuses=($@)
    local -i index
    for index in ${!statuses[@]}; do
        local -i status=${statuses[$index]}
        if [[ $index -eq 0 ]]; then
            printf "%s" '\n'
        else
            printf "%s" ' → '
        fi
        if [[ $status -eq 0 ]]; then
            printf "%s %d%s" '\[\e[32m\]✔' $status '\[\e[m\]'
        else
            printf "%s %d%s" '\[\e[31m\]✘' $status '\[\e[m\]'
        fi
    done
}

function _ps1_user() {
    if [[ "$USER" != "root" ]]; then
        printf "%s" '\n\[\e[35m\]\u\[\e[m\]'
    else
        printf "%s" '\n\[\e[1;35m\]\u\[\e[m\]'
    fi
}

function _ps1_host() {
    if [[ -z "${SSH_CONNECTION:-}" ]]; then
        printf "%s" ' at \[\e[36m\]\h\[\e[m\]'
    else
        printf "%s" ' at \[\e[1;36m\]\H\[\e[m\]'
    fi
}

function _ps1_wd() {
    if [[ "$PWD/" == "$HOME/"* ]]; then
        printf "%s" ' in \[\e[34m\]\w\[\e[m\]'
    else
        printf "%s" ' in \[\e[1;34m\]\w\[\e[m\]'
    fi
}

function _ps1_git() {
    if type -t __git_ps1 &>/dev/null; then
        __git_ps1 ' on \[\e[33m\]%s\[\e[m\]'
    fi
}

function _ps1_prompt() {
    printf "%s" '\n\$ '
}

PROMPT_COMMAND="_prompt_command"
PROMPT_DIRTRIM=0
PS1='\$ '
PS2='> '
PS3='#? '
PS4='+ '
GIT_PS1_STATESEPARATOR=":"
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
