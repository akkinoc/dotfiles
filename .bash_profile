shopt -s extglob
shopt -s histappend
if (( ${BASH_VERSINFO[0]} >= 4 )); then
    shopt -s autocd
    shopt -s globstar
fi

function _akihyro_dotfiles_sources {
    local files=("$@")
    local file
    for file in "${files[@]}"; do
        [[ -f "$file" ]] || continue
        . "$file"
    done
}

_akihyro_dotfiles_sources /usr/local/etc/profile.d/*.sh
_akihyro_dotfiles_sources ~/.bashrc
_akihyro_dotfiles_sources ~/.bash_profile.d/{exports,aliases,prompt}.sh
