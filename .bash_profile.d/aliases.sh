alias ~="cd ~"
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias hist="history"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias zgrep="zgrep --color=auto"
alias zegrep="zegrep --color=auto"
alias zfgrep="zfgrep --color=auto"

alias sudo="sudo "


if ls --color &>/dev/null; then
    export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=31:bd=33:cd=33:su=30;41:sg=37;41:tw=30;44:ow=37;44"
    alias ls="ls --color=auto"
else
    export LSCOLORS="exgxfxdxbxdxdxabhbaehe"
    alias ls="ls -G"
fi

alias l="ls -l"
alias la="ls -al"
