if command -v starship &>/dev/null; then
    export STARSHIP_CONFIG="$HOME/.starship/config.toml"
    eval "$(starship init zsh)"
fi
