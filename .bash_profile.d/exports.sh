if [[ :$PATH: != *:$HOME/bin:* ]]; then
    export PATH+=":$HOME/bin"
fi

export HISTSIZE=10000
export HISTTIMEFORMAT="%m/%d %H:%M:%S "

export LSCOLORS="exgxfxdxbxdxdxabhbaehe"
export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=31:bd=33:cd=33:su=30;41:sg=37;41:tw=30;44:ow=37;44"
