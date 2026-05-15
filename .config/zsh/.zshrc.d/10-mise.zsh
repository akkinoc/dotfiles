if command -v mise &>/dev/null; then
    export MISE_TRUSTED_CONFIG_PATHS="${${(%):-%x}:A:h:h:h:h}"
    eval "$(mise activate zsh)"
fi
