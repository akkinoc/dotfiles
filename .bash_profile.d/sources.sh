function _akihyro_dotfiles_sources_source_if_exists {
    local file="$1"
    local args=("${@:2}")
    [[ ! -f "$file" ]] || . "$file" "${args[@]}"
}

function _akihyro_dotfiles_sources_source_from_brew_if_exists {
    local file="$1"
    local args=("${@:2}")
    type -t brew &>/dev/null || return 0
    _akihyro_dotfiles_sources_source_if_exists "$(brew --prefix)/$file" "${args[@]}"
}

_akihyro_dotfiles_sources_source_from_brew_if_exists "etc/profile.d/bash_completion.sh"
