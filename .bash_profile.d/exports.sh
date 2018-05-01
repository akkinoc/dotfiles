export GPG_TTY="$(tty)"

export HISTSIZE=100000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

export LSCOLORS="exgxfxdxbxdxdxabhbaehe"
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=31:bd=33:cd=33:su=30;41:sg=37;41:tw=30;44:ow=37;44"

if [[ ":$PATH:" != *:"$HOME/.dotfiles/bin":* ]]; then
    export PATH+=":$HOME/.dotfiles/bin"
fi
