alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
alias @='cd "$(osascript -e "tell app \"Finder\" to POSIX path of (insertion location as alias)")"'

if type -t hub &>/dev/null; then
    alias g='hub'
else
    alias g='git'
fi

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias zgrep='zgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias ggrep='ggrep --color=auto'
alias gegrep='gegrep --color=auto'
alias gfgrep='gfgrep --color=auto'

alias hist='history'

if ls -d --color=auto &>/dev/null; then
    alias ls='ls --color=auto'
elif ls -Gd &>/dev/null; then
    alias ls='ls -G'
fi
alias gls='gls --color=auto'
alias l='ls -l'
alias la='ls -al'

alias relogin='exec -l "$SHELL"'

alias rmf='rm -fr'

alias sudo='sudo '
