#!/bin/bash

set -eu -o pipefail

DOTFILES_HOME="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history"
DOTFILES_SAVE_DIR="$DOTFILES_HIST_DIR/$(date "+%Y%m%dT%H%M%S")"

function initialize_data {
    printf '\e[35m%s\e[m: Initializing...\n' "$(shorten_item "$DOTFILES_DATA_DIR")"
    mkdir -p -m go-rwx "$DOTFILES_DATA_DIR" "$DOTFILES_HIST_DIR" "$DOTFILES_SAVE_DIR"
}

function link_item {
    local target="$1"
    local src_item="$DOTFILES_HOME/$target"
    local dest_item="$HOME/$target"
    local save_item="$DOTFILES_SAVE_DIR/$dest_item"
    printf '\e[35m%s\e[m: Linking... \e[2m(src: %s)\e[m\n' "$(shorten_item "$dest_item")" "$(shorten_item "$src_item")"
    if [[ -e "$dest_item" || -L "$dest_item" ]]; then
        mkdir -p "$(dirname "$save_item")"
        mv "$dest_item" "$save_item"
    fi
    mkdir -p "$(dirname "$dest_item")"
    ln -s "$src_item" "$dest_item"
}

function ensure_dir {
    local target="$1" mode="${2:--}"
    local dest_item="$HOME/$target"
    printf '\e[35m%s\e[m: Ensuring... \e[2m(mode: %s)\e[m\n' "$(shorten_item "$dest_item")" "$mode"
    mkdir -p -m "$mode" "$dest_item"
}

function shorten_item {
    local item="$1"
    item="${item/#$HOME/~}"
    printf '%s' "$item"
}

function report_results {
    local code=$?
    if (( ! $code )); then
        printf '\e[32m✔ The dotfiles installation succeeded!\e[m\n'
    else
        printf '\e[31m✘ The dotfiles installation failed...\e[m\n'
    fi
}

trap report_results EXIT

initialize_data

link_item ".bash_profile"
link_item ".bash_profile.d"

link_item ".dotfiles/bin"

link_item ".gitattributes"
link_item ".gitconfig"
link_item ".gitconfig.cyberz"
link_item ".gitignore"

ensure_dir ".gnupg" go-rwx
link_item ".gnupg/gpg.conf"
link_item ".gnupg/gpg-agent.conf"
link_item ".gnupg/gpg-ownertrust.txt"

link_item ".inputrc"

ensure_dir ".ssh" go-rwx
link_item ".ssh/config"
link_item ".ssh/github.hosts"
link_item ".ssh/cyberz.github.hosts"

link_item ".vimrc"

link_item ".Brewfile"

link_item "Library/Application Support/iTerm2/DynamicProfiles/Akihiro Kondo.json"
ensure_dir "Library/Logs/iTerm2/Sessions" go-rwx
