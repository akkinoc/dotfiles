if type -t gpg-agent tty &>/dev/null; then
    export GPG_TTY="$(tty)"
fi

export GREP_COLOR="1;31"
export GREP_COLORS="ms=1;31:mc=1;31:fn=35:ln=32:bn=32:se=36"

export HISTSIZE=100000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

export LSCOLORS="exgxfxdxbxdxdxabhbaehe"
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=31:bd=33:cd=33:su=30;41:sg=37;41:tw=30;44:ow=37;44"

if [[ ":$PATH:" != *:"$HOME/.dotfiles/bin":* ]]; then
    export PATH+=":$HOME/.dotfiles/bin"
fi
