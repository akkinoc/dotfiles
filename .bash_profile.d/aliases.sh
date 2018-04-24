alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias @="_cd_to_finder_path"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias zgrep="zgrep --color=auto"
alias zegrep="zegrep --color=auto"
alias zfgrep="zfgrep --color=auto"

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

alias o="_open_args_or_wd"

alias rmf="rm -fr"

alias sudo="sudo "
