if command -v ls &>/dev/null || command -v gls &>/dev/null; then
    LSCOLORS=("ex" "gx" "fx" "cx" "bx" "dx" "dx" "ab" "hb" "ac" "hc")
    LSCOLORS="${(j//)LSCOLORS}"
    export LSCOLORS
    LS_COLORS=(
        "di=$color[blue]"
        "ln=$color[cyan]"
        "so=$color[magenta]"
        "pi=$color[green]"
        "ex=$color[red]"
        "bd=$color[yellow]"
        "cd=$color[yellow]"
        "su=$color[black];$color[bg-red]"
        "sg=$color[white];$color[bg-red]"
        "tw=$color[black];$color[bg-blue]"
        "ow=$color[white];$color[bg-blue]"
        "or=$color[faint];$color[cyan]"
        "do=$color[faint];$color[magenta]"
        "st=$color[blue]"
    )
    LS_COLORS="${(j/:/)LS_COLORS}"
    export LS_COLORS
fi

if command -v ls &>/dev/null; then
    alias ls="ls --color=auto"
fi
if command -v gls &>/dev/null; then
    alias gls="gls --color=auto"
fi
