#!/usr/bin/env zsh

setopt err_exit no_unset pipe_fail

DOTFILES_HOME="${${(%):-%x}:A:h}"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history"
DOTFILES_SAVE_DIR="$DOTFILES_HIST_DIR/$(date "+%Y%m%dT%H%M%S")"

initialize_data() {
    print -P "%F{magenta}${DOTFILES_DATA_DIR/#$HOME/~}%f: Initializing..."
    mkdir -p -m go-rwx "$DOTFILES_DATA_DIR" "$DOTFILES_HIST_DIR" "$DOTFILES_SAVE_DIR"
}

link_item() {
    local target="$1"
    local src_item="$DOTFILES_HOME/$target"
    local dest_item="$HOME/$target"
    local save_item="$DOTFILES_SAVE_DIR/${dest_item/#\//}"
    print -P "%F{magenta}${dest_item/#$HOME/~}%f: Linking... %F{8}(src: ${src_item/#$HOME/~})%f"
    if [[ -e "$dest_item" || -L "$dest_item" ]]; then
        mkdir -p "${save_item:h}"
        mv "$dest_item" "$save_item"
    fi
    mkdir -p "${dest_item:h}"
    ln -s "$src_item" "$dest_item"
}

ensure_dir() {
    local target="$1"
    local mode="${2:--}"
    local dest_item="$HOME/$target"
    print -P "%F{magenta}${dest_item/#$HOME/~}%f: Ensuring... %F{8}(mode: $mode)%f"
    mkdir -p -m "$mode" "$dest_item"
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

link_item ".Brewfile"

link_item ".gitconfig"
link_item ".gitignore"

ensure_dir ".gnupg" go-rwx
link_item ".gnupg/gpg.conf"
link_item ".gnupg/gpg-agent.conf"

ensure_dir ".ssh" go-rwx
link_item ".ssh/config"
link_item ".ssh/github.hosts"

link_item ".starship/config.toml"

link_item ".vimrc"

link_item ".zshrc"
link_item ".zshrc.d"

link_item "Library/Application Support/iTerm2/DynamicProfiles/akkinoc.json"
ensure_dir "Library/Logs/iTerm2/Sessions" go-rwx
