if [[ -f "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]]; then
    export NVM_DIR="$XDG_DATA_HOME/nvm"
    . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
fi
