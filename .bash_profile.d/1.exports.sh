if type -t vim &>/dev/null; then
    export EDITOR="vim"
elif type -t vi &>/dev/null; then
    export EDITOR="vi"
fi

if type -t fzf &>/dev/null; then
    export FZF_DEFAULT_OPTS="--ansi --cycle"
fi

if type -t gpg-agent tty &>/dev/null; then
    export GPG_TTY="$(tty)"
fi

if
    type -t grep &>/dev/null ||
    type -t egrep &>/dev/null ||
    type -t fgrep &>/dev/null ||
    type -t ggrep &>/dev/null ||
    type -t gegrep &>/dev/null ||
    type -t gfgrep &>/dev/null
then
    export GREP_COLOR="1;31"
    export GREP_COLORS="ms=1;31:mc=1;31:fn=35:ln=32:bn=32:se=36"
fi

export HISTSIZE=100000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

if type -t less &>/dev/null; then
    export LESS="-FIMRXx4"
fi

export LSCOLORS="exgxfxdxbxdxdxabhbaehe"
export LS_COLORS="di=34:ln=36:so=35:pi=32:ex=31:bd=33:cd=33:su=30;41:sg=37;41:tw=30;44:ow=37;44"
export LS_COLORS+=":or=2;36:do=2;35:st=2;30;44"
export TIME_STYLE="long-iso"

if type -t less &>/dev/null; then
    export PAGER="less"
fi

if [[ ":$PATH:" != *:"$HOME/.dotfiles/bin":* ]]; then
    export PATH+=":$HOME/.dotfiles/bin"
fi
