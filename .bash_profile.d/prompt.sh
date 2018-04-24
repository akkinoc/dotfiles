function _prompt_command {
    _prompt_status=$? _prompt_pipestatus=(${PIPESTATUS[@]})
    PS1="$(_ps1)"
}

function _ps1 {
    local title="$(_ps1_title)"
    local result="$(_ps1_result)"
    local location="$(_ps1_location)"
    local prompt="$(_ps1_prompt)"
    printf '%s\\n%s\\n%s\\n%s' "$title" "$result" "$location" "$prompt"
}

function _ps1_title {
    printf '\\[\\e]0;\\u at \\h in \\W\\a\\]'
}

function _ps1_result {
    local status="$(_ps1_result_status)"
    local pipestatus="$(_ps1_result_pipestatus)"
    printf '%s' "$status"
    [[ -z "$pipestatus" ]] || printf ' piped [ %s ]' "$pipestatus"
}

function _ps1_result_status {
    _ps1_result_status_by_code $_prompt_status
}

function _ps1_result_pipestatus {
    local index
    for index in ${!_prompt_pipestatus[@]}; do
        local status=${_prompt_pipestatus[$index]}
        [[ $index -eq 0 ]] || printf ' | '
        _ps1_result_status_by_code $status
    done
}

function _ps1_result_status_by_code {
    local status=$1
    if [[ $status -eq 0 ]]; then
        printf '\\[\\e[32m\\]✔ %d\\[\\e[m\\]' $status
    else
        local signal="$(_ps1_result_status_signal_by_code $status)"
        printf '\\[\\e[31m\\]✘ %d' $status
        [[ -z "$signal" ]] || printf ' (SIG%s)' "$signal"
        printf '\\[\\e[m\\]'
    fi
}

function _ps1_result_status_signal_by_code {
    local status=$1
    [[ $status -gt 128 ]] || return 0
    printf '%s' "$(kill -l $status 2>/dev/null)"
}

function _ps1_location {
    local user="$(_ps1_location_user)"
    local host="$(_ps1_location_host)"
    local wd="$(_ps1_location_wd)"
    local git="$(_ps1_location_git)"
    printf '%s at %s in %s' "$user" "$host" "$wd"
    [[ -z "$git" ]] || printf ' on %s' "$git"
}

function _ps1_location_user {
    if [[ "$USER" != "root" ]]; then
        printf '\\[\\e[35m\\]\\u\\[\\e[m\\]'
    else
        printf '\\[\\e[1;35m\\]\\u\\[\\e[m\\]'
    fi
}

function _ps1_location_host {
    if [[ -z "${SSH_CONNECTION:-}" ]]; then
        printf '\\[\\e[36m\\]\\h\\[\\e[m\\]'
    else
        printf '\\[\\e[1;36m\\]\\H\\[\\e[m\\]'
    fi
}

function _ps1_location_wd {
    if [[ "$PWD/" == "$HOME/"* ]]; then
        printf '\\[\\e[34m\\]\\w\\[\\e[m\\]'
    else
        printf '\\[\\e[1;34m\\]\\w\\[\\e[m\\]'
    fi
}

function _ps1_location_git {
    type -t __git_ps1 &>/dev/null || return 0
    __git_ps1 '\\[\\e[33m\\]%s\\[\\e[m\\]'
}

function _ps1_prompt {
    printf '\\$ '
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
