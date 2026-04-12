if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif command -v brew &>/dev/null; then
    eval "$(brew shellenv)"
fi
