if command -v rbenv &>/dev/null; then
    export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
    eval "$(rbenv init - zsh)"
fi
