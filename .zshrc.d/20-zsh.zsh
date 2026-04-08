if [[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    . "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -d "$HOMEBREW_PREFIX/share/zsh-completions" ]]; then
    fpath+=("$HOMEBREW_PREFIX/share/zsh-completions")
fi

autoload -Uz compinit && compinit
if [[ -n "$LS_COLORS" ]]; then
    zstyle ":completion:*" list-colors "${(s/:/)LS_COLORS}"
fi
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ':completion:*' menu no
