if command -v grep &>/dev/null || command -v ggrep &>/dev/null; then
    export GREP_COLOR="$color[bold];$color[red]"
    GREP_COLORS=(
        "ms=$color[bold];$color[red]"
        "mc=$color[bold];$color[red]"
        "fn=$color[magenta]"
        "ln=$color[green]"
        "bn=$color[green]"
        "se=$color[cyan]"
    )
    GREP_COLORS="${(j/:/)GREP_COLORS}"
    export GREP_COLORS
fi

if command -v grep &>/dev/null; then
    alias grep="grep --color=auto --exclude-dir=.git"
fi
if command -v ggrep &>/dev/null; then
    alias ggrep="ggrep --color=auto --exclude-dir=.git"
fi
