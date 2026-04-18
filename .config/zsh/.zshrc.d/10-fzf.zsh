if command -v fzf &>/dev/null; then
    export FZF_DEFAULT_OPTS="--cycle --info=inline"
    export FZF_CTRL_R_OPTS="--layout=reverse"
    . <(fzf --zsh)
fi
