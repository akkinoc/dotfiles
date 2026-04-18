if [[ -d "$HOMEBREW_PREFIX/share/zsh-completions" ]]; then
    fpath+=("$HOMEBREW_PREFIX/share/zsh-completions")
fi

zstyle ":completion:*" cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
if [[ -n "$LS_COLORS" ]]; then
    zstyle ":completion:*" list-colors "${(s/:/)LS_COLORS}"
fi
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*" menu no
autoload -Uz compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

bindkey "^[b"  backward-word
bindkey "^[f"  forward-word
bindkey "^A"   beginning-of-line
bindkey "^E"   end-of-line
bindkey "^[^?" backward-kill-word
bindkey "^[d"  kill-word
bindkey "^U"   backward-kill-line
bindkey "^K"   kill-line

if [[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    . "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
