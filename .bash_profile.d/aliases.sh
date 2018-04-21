alias ~="cd ~"
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias zgrep="zgrep --color=auto"
alias zegrep="zegrep --color=auto"
alias zfgrep="zfgrep --color=auto"

alias hist="history"

if ls --color &>/dev/null; then
    alias ls="ls --color=auto"
elif ls -G &>/dev/null; then
    alias ls="ls -G"
fi
alias l="ls -l"
alias la="ls -al"
alias gls="gls --color"
alias gl="gls -l"
alias gla="gls -al"

alias sudo="sudo "
