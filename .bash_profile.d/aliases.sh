alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
if type -t osascript &>/dev/null; then
    alias @='cd "$(osascript -e "tell app \"Finder\" to POSIX path of (insertion location as alias)")"'
fi

if type -t hub &>/dev/null; then
    alias g='hub'
elif type -t git &>/dev/null; then
    alias g='git'
fi

if type -t grep &>/dev/null; then
    alias grep='grep --color=auto'
fi
if type -t egrep &>/dev/null; then
    alias egrep='egrep --color=auto'
fi
if type -t fgrep &>/dev/null; then
    alias fgrep='fgrep --color=auto'
fi
if type -t zgrep &>/dev/null; then
    alias zgrep='zgrep --color=auto'
fi
if type -t zegrep &>/dev/null; then
    alias zegrep='zegrep --color=auto'
fi
if type -t zfgrep &>/dev/null; then
    alias zfgrep='zfgrep --color=auto'
fi
if type -t ggrep &>/dev/null; then
    alias ggrep='ggrep --color=auto'
fi
if type -t gegrep &>/dev/null; then
    alias gegrep='gegrep --color=auto'
fi
if type -t gfgrep &>/dev/null; then
    alias gfgrep='gfgrep --color=auto'
fi
if type -t ggrep &>/dev/null; then
    alias ge='ggrep -EInr --exclude-dir=.git'
elif type -t grep &>/dev/null; then
    alias ge='grep -EInr --exclude-dir=.git'
fi

alias hist='history'

if ls -d --color=auto &>/dev/null; then
    alias ls='ls --color=auto'
elif ls -Gd &>/dev/null; then
    alias ls='ls -G'
fi
if type -t gls &>/dev/null; then
    alias gls='gls --color=auto'
fi
alias l='ls -l'
alias la='ls -al'

alias relogin='exec -l "$SHELL"'

alias rmf='rm -fr'

if type -t sudo &>/dev/null; then
    alias sudo='sudo '
fi
