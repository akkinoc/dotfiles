_akihyro_dotfiles_prompt_status=
_akihyro_dotfiles_prompt_pipestatus=()

function _akihyro_dotfiles_prompt_command {
    local status=$? pipestatus=(${PIPESTATUS[@]})
    _akihyro_dotfiles_prompt_status=$status
    _akihyro_dotfiles_prompt_pipestatus=(${pipestatus[@]})
    PS1="$(_akihyro_dotfiles_prompt_ps1)"
}

function _akihyro_dotfiles_prompt_ps1 {
    local title="$(_akihyro_dotfiles_prompt_ps1_title)"
    local result="$(_akihyro_dotfiles_prompt_ps1_result)"
    local location="$(_akihyro_dotfiles_prompt_ps1_location)"
    local prompt="$(_akihyro_dotfiles_prompt_ps1_prompt)"
    printf '%s\\n%s\\n%s\\n%s' "$title" "$result" "$location" "$prompt"
}

function _akihyro_dotfiles_prompt_ps1_title {
    printf '\\[\\e]0;\\u at \\h in \\W\\a\\]'
}

function _akihyro_dotfiles_prompt_ps1_result {
    local status="$(_akihyro_dotfiles_prompt_ps1_result_status)"
    local pipestatus="$(_akihyro_dotfiles_prompt_ps1_result_pipestatus)"
    printf '%s' "$status"
    [[ -z "$pipestatus" ]] || printf ' piped [ %s ]' "$pipestatus"
}

function _akihyro_dotfiles_prompt_ps1_result_status {
    _akihyro_dotfiles_prompt_ps1_result_status_by_code $_akihyro_dotfiles_prompt_status
}

function _akihyro_dotfiles_prompt_ps1_result_pipestatus {
    local index
    for index in ${!_akihyro_dotfiles_prompt_pipestatus[@]}; do
        local status=${_akihyro_dotfiles_prompt_pipestatus[$index]}
        [[ $index -eq 0 ]] || printf ' | '
        _akihyro_dotfiles_prompt_ps1_result_status_by_code $status
    done
}

function _akihyro_dotfiles_prompt_ps1_result_status_by_code {
    local status=$1
    if [[ $status -eq 0 ]]; then
        printf '\\[\\e[32m\\]✔ %d\\[\\e[m\\]' $status
    else
        printf '\\[\\e[31m\\]✘ %d\\[\\e[m\\]' $status
        if [[ $status -gt 128 ]]; then
            local signal="$(kill -l $status 2>/dev/null)"
            [[ -z "$signal" ]] || printf '\\[\\e[31m\\]:%s\\[\\e[m\\]' "$signal"
        fi
    fi
}

function _akihyro_dotfiles_prompt_ps1_location {
    local user="$(_akihyro_dotfiles_prompt_ps1_location_user)"
    local host="$(_akihyro_dotfiles_prompt_ps1_location_host)"
    local wd="$(_akihyro_dotfiles_prompt_ps1_location_wd)"
    local git="$(_akihyro_dotfiles_prompt_ps1_location_git)"
    printf '%s at %s in %s' "$user" "$host" "$wd"
    [[ -z "$git" ]] || printf ' on %s' "$git"
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
        printf '\\[\\e[36m\\]\\h\\[\\e[m\\]'
    else
        printf '\\[\\e[1;36m\\]\\H\\[\\e[m\\]'
    fi
}

function _akihyro_dotfiles_prompt_ps1_location_wd {
    if [[ "$PWD/" == "$HOME/"* ]]; then
        printf '\\[\\e[34m\\]\\w\\[\\e[m\\]'
    else
        printf '\\[\\e[1;34m\\]\\w\\[\\e[m\\]'
    fi
}

function _akihyro_dotfiles_prompt_ps1_location_git {
    type -t __git_ps1 &>/dev/null || return 0
    __git_ps1 '\\[\\e[33m\\]%s\\[\\e[m\\]'
}

function _akihyro_dotfiles_prompt_ps1_prompt {
    printf '\\$ '
}

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
