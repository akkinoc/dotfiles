_akihyro_dotfiles_prompt_status=
_akihyro_dotfiles_prompt_pipestatus=()
_akihyro_dotfiles_prompt_started=()
_akihyro_dotfiles_prompt_ended=()

function _akihyro_dotfiles_prompt_trap {
    if (( ! ${#_akihyro_dotfiles_prompt_started[@]} || ${#_akihyro_dotfiles_prompt_ended[@]} )); then
        IFS=$'\t' read -r -a _akihyro_dotfiles_prompt_started < <(date '+%s%t%H:%M:%S')
        _akihyro_dotfiles_prompt_ended=()
    fi
}

function _akihyro_dotfiles_prompt_command {
    local status=$? pipestatus=(${PIPESTATUS[@]})
    _akihyro_dotfiles_prompt_status=$status
    _akihyro_dotfiles_prompt_pipestatus=(${pipestatus[@]})
    if (( ${#_akihyro_dotfiles_prompt_started[@]} && ! ${#_akihyro_dotfiles_prompt_ended[@]} )); then
        IFS=$'\t' read -r -a _akihyro_dotfiles_prompt_ended < <(date '+%s%t%H:%M:%S')
    fi
    PS1="$(_akihyro_dotfiles_prompt_ps1)"
    history -a
    history -c
    history -r
}

function _akihyro_dotfiles_prompt_ps1 {
    _akihyro_dotfiles_prompt_ps1_title
    _akihyro_dotfiles_prompt_ps1_result
    _akihyro_dotfiles_prompt_ps1_location
    _akihyro_dotfiles_prompt_ps1_prompt
}

function _akihyro_dotfiles_prompt_ps1_title {
    printf '\\[\\e]0;\\u at \\h in \\W\\a\\]'
}

function _akihyro_dotfiles_prompt_ps1_result {
    printf '\\n'
    _akihyro_dotfiles_prompt_ps1_result_status
    _akihyro_dotfiles_prompt_ps1_result_time
    printf '\\n'
}

function _akihyro_dotfiles_prompt_ps1_result_status {
    _akihyro_dotfiles_prompt_ps1_result_status_by_code $_akihyro_dotfiles_prompt_status
    printf ' [ '
    local index
    for index in ${!_akihyro_dotfiles_prompt_pipestatus[@]}; do
        (( ! $index )) || printf ' | '
        _akihyro_dotfiles_prompt_ps1_result_status_by_code ${_akihyro_dotfiles_prompt_pipestatus[$index]}
    done
    printf ' ]'
}

function _akihyro_dotfiles_prompt_ps1_result_status_by_code {
    local code=$1
    local signal=
    (( $code <= 128 )) || signal="$(kill -l $(( $code - 128 )) 2>/dev/null)"
    if (( ! $code )); then
        printf '\\[\\e[32m\\]✔ %d\\[\\e[m\\]' $code
    elif [[ -z "$signal" ]]; then
        printf '\\[\\e[31m\\]✘ %d\\[\\e[m\\]' $code
    else
        printf '\\[\\e[31m\\]✘ %d:%s\\[\\e[m\\]' $code "$signal"
    fi
}

function _akihyro_dotfiles_prompt_ps1_result_time {
    (( ${#_akihyro_dotfiles_prompt_started[@]} && ${#_akihyro_dotfiles_prompt_ended[@]} )) || return 0
    printf ' took \\[\\e[4m\\]%'\''d s\\[\\e[m\\] \\[\\e[2m\\](%s - %s)\\[\\e[m\\]' \
        $(( ${_akihyro_dotfiles_prompt_ended[0]} - ${_akihyro_dotfiles_prompt_started[0]} )) \
        "${_akihyro_dotfiles_prompt_started[1]}" \
        "${_akihyro_dotfiles_prompt_ended[1]}"
}

function _akihyro_dotfiles_prompt_ps1_location {
    _akihyro_dotfiles_prompt_ps1_location_user
    _akihyro_dotfiles_prompt_ps1_location_host
    _akihyro_dotfiles_prompt_ps1_location_wd
    _akihyro_dotfiles_prompt_ps1_location_git
    printf '\\n'
}

function _akihyro_dotfiles_prompt_ps1_location_user {
    if [[ "$USER" != "root" ]]; then
        printf '\\[\\e[35m\\]\\u\\[\\e[m\\]'
    else
        printf '\\[\\e[1;35m\\]\\u\\[\\e[m\\]'
    fi
}

function _akihyro_dotfiles_prompt_ps1_location_host {
    if [[ -z "${SSH_CONNECTION:-}" ]]; then
        printf ' at \\[\\e[36m\\]\\h\\[\\e[m\\]'
    else
        printf ' at \\[\\e[1;36m\\]\\H\\[\\e[m\\]'
    fi
}

function _akihyro_dotfiles_prompt_ps1_location_wd {
    if [[ "$PWD/" == "$HOME/"* ]]; then
        printf ' in \\[\\e[34m\\]\\w\\[\\e[m\\]'
    else
        printf ' in \\[\\e[1;34m\\]\\w\\[\\e[m\\]'
    fi
}

function _akihyro_dotfiles_prompt_ps1_location_git {
    type -t __git_ps1 &>/dev/null || return 0
    __git_ps1 ' on \\[\\e[33m\\]%s\\[\\e[m\\]'
}

function _akihyro_dotfiles_prompt_ps1_prompt {
    printf '\\$ '
}

trap "_akihyro_dotfiles_prompt_trap" DEBUG
PROMPT_COMMAND="_akihyro_dotfiles_prompt_command"
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
