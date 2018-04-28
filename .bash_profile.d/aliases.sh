function _akihyro_dotfiles_aliases_cd_to_finder {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function _akihyro_dotfiles_aliases_open {
    local args=("$@")
    (( ${#args[@]} )) || args=(.)
    open "${args[@]}"
}

function _akihyro_dotfiles_aliases_path {
    local path
    IFS=: read -r -a path <<<"$PATH"
    printf '%s\n' "${path[@]}"
}

function _akihyro_dotfiles_aliases_relogin {
    exec -l "$SHELL"
}

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias @="_akihyro_dotfiles_aliases_cd_to_finder"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias zgrep="zgrep --color=auto"
alias zegrep="zegrep --color=auto"
alias zfgrep="zfgrep --color=auto"

alias g="git"
! type -t __git_complete &>/dev/null || __git_complete g __git_main

alias hist="history"

if ls -d --color=auto &>/dev/null; then
    alias ls="ls --color=auto"
elif ls -Gd &>/dev/null; then
    alias ls="ls -G"
fi
alias l="ls -l"
alias la="ls -al"
alias gls="gls --color=auto"
alias gl="gls -l"
alias gla="gls -al"

alias o="_akihyro_dotfiles_aliases_open"

alias path="_akihyro_dotfiles_aliases_path"

alias relogin="_akihyro_dotfiles_aliases_relogin"

alias rmf="rm -fr"

alias sudo="sudo "
