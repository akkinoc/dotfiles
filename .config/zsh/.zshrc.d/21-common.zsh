if command -v vim &>/dev/null; then
    export EDITOR="vim"
    export VISUAL="vim"
elif command -v vi &>/dev/null; then
    export EDITOR="vi"
    export VISUAL="vi"
fi

if command -v bat col sh &>/dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
elif command -v less &>/dev/null; then
    export MANPAGER="less"
fi

if command -v less &>/dev/null; then
    export PAGER="less"
fi
