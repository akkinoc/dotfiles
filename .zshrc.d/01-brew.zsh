if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif command -v brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

if command -v brew &>/dev/null; then
    export HOMEBREW_BUNDLE_DUMP_NO_CARGO=1
    export HOMEBREW_BUNDLE_DUMP_NO_FLATPAK=1
    export HOMEBREW_BUNDLE_DUMP_NO_GO=1
    export HOMEBREW_BUNDLE_DUMP_NO_KREW=1
    export HOMEBREW_BUNDLE_DUMP_NO_NPM=1
    export HOMEBREW_BUNDLE_DUMP_NO_UV=1
    export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
fi
