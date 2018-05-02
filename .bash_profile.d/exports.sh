if type -t gpg-agent tty &>/dev/null; then
    export GPG_TTY="$(tty)"
fi

export HISTSIZE=100000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

if ls -d --color=auto &>/dev/null || type -t gls &>/dev/null; then
    export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=31:bd=33:cd=33:su=30;41:sg=37;41:tw=30;44:ow=37;44"
fi
if ls -Gd &>/dev/null; then
    export LSCOLORS="exgxfxdxbxdxdxabhbaehe"
fi

if [[ ":$PATH:" != *:"$HOME/.dotfiles/bin":* ]]; then
    export PATH+=":$HOME/.dotfiles/bin"
fi
