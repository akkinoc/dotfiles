if command -v code &>/dev/null; then
    alias c="code"
fi

if command -v cp &>/dev/null; then
    alias cp="cp -i"
fi

if command -v git &>/dev/null; then
    alias d="git diff --no-index"
elif command -v diff &>/dev/null; then
    alias d="diff -u"
fi

if [[ -n "$VISUAL" ]]; then
    alias e="$VISUAL"
elif [[ -n "$EDITOR" ]]; then
    alias e="$EDITOR"
fi

if command -v git &>/dev/null; then
    alias g="git"
fi

if command -v ggrep &>/dev/null; then
    alias ge="ggrep -EIn"
elif command -v grep &>/dev/null; then
    alias ge="grep -EIn"
fi

if command -v gradle &>/dev/null; then
    alias gr="gradle"
    alias gw="./gradlew"
fi

if command -v gls &>/dev/null; then
    alias l="gls -Flv --time-style=+'%Y-%m-%d %H:%M'"
    alias la="l -a"
else
    alias l="ls -Fl -D '%Y-%m-%d %H:%M'"
    alias la="l -a"
fi

if command -v trash &>/dev/null; then
    alias mt="trash"
fi

if command -v mv &>/dev/null; then
    alias mv="mv -i"
fi

if command -v open &>/dev/null; then
    alias o="open"
fi

alias p="print"

if command -v rm &>/dev/null; then
    alias rm="rm -i"
fi

if command -v bat &>/dev/null; then
    alias v="bat"
elif command -v less &>/dev/null; then
    alias v="less -N"
elif [[ -n "$PAGER" ]]; then
    alias v="$PAGER"
fi
