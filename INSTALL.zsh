#!/usr/bin/env zsh

setopt err_exit no_unset pipe_fail

DOTFILES_HOME="${${(%):-%x}:A:h}"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history"
DOTFILES_SAVE_DIR="$DOTFILES_HIST_DIR/$(date "+%Y%m%dT%H%M%S")"

initialize_data() {
    print -P "%F{magenta}${(D)DOTFILES_DATA_DIR}%f: Initializing..."
    mkdir -p -m go-rwx "$DOTFILES_DATA_DIR" "$DOTFILES_HIST_DIR" "$DOTFILES_SAVE_DIR"
}

link_item() {
    local target="$1"
    local src_item="$DOTFILES_HOME/$target"
    local dest_item="$HOME/$target"
    local save_item="$DOTFILES_SAVE_DIR/${dest_item/#\//}"
    print -P "%F{magenta}${(D)dest_item}%f: Linking... %F{8}(src: ${(D)src_item})%f"
    if [[ -e "$dest_item" || -L "$dest_item" ]]; then
        mkdir -p "${save_item:h}"
        mv "$dest_item" "$save_item"
    fi
    mkdir -p "${dest_item:h}"
    ln -s "$src_item" "$dest_item"
}

ensure_dir() {
    local target="$1"
    local mode="${2:-}"
    local dest_item="$HOME/$target"
    if [[ -n "$mode" ]]; then
        print -P "%F{magenta}${(D)dest_item}%f: Ensuring... %F{8}(mode: $mode)%f"
        mkdir -p -m "$mode" "$dest_item"
    else
        print -P "%F{magenta}${(D)dest_item}%f: Ensuring..."
        mkdir -p "$dest_item"
    fi
}

report_results() {
    local code=$?
    if (( code == 0 )); then
        print -P "%F{green}✔ The dotfiles installation succeeded!%f"
    else
        print -P "%F{red}✘ The dotfiles installation failed...%f"
    fi
}

trap report_results EXIT

initialize_data

ensure_dir ".cache"
ensure_dir ".cache/starship"
ensure_dir ".cache/zsh"

ensure_dir ".config"
link_item  ".config/bat"
link_item  ".config/git"
link_item  ".config/homebrew"
link_item  ".config/starship"
link_item  ".config/vim"
link_item  ".config/zsh"

ensure_dir ".local/share"
ensure_dir ".local/share/gnupg" go-rwx
link_item  ".local/share/gnupg/gpg.conf"
link_item  ".local/share/gnupg/gpg-agent.conf"
ensure_dir ".local/share/nvm"
ensure_dir ".local/share/rbenv"

ensure_dir ".local/state"
ensure_dir ".local/state/zsh"

ensure_dir ".ssh" go-rwx
link_item  ".ssh/allowed_signers"
link_item  ".ssh/config"
link_item  ".ssh/github.hosts"

link_item  ".zshenv"

link_item  "Library/Application Support/iTerm2/DynamicProfiles/akkinoc.json"
ensure_dir "Library/Logs/iTerm2/Sessions" go-rwx
