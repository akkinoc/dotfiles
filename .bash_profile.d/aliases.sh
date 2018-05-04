alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
if type -t pwd-ext &>/dev/null; then
    alias @='cd "$(pwd-ext)"'
fi

if type -t code &>/dev/null; then
    alias c='code'
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
    alias ge='ggrep -EIn --exclude-dir=.git'
elif type -t grep &>/dev/null; then
    alias ge='grep -EIn --exclude-dir=.git'
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
if type -t gls &>/dev/null; then
    alias l='gls -l'
    alias la='gls -al'
else
    alias l='ls -l'
    alias la='ls -al'
fi

if type -t open-args-or-wd &>/dev/null; then
    alias o='open-args-or-wd'
fi

alias relogin='exec -l "$SHELL"'

alias rmf='rm -fr'

if type -t sudo &>/dev/null; then
    alias sudo='sudo '
fi
