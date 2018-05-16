#!/bin/bash

set -eu -o pipefail

DOTFILES_HOME="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history"
DOTFILES_SAVE_DIR="$DOTFILES_HIST_DIR/$(date "+%Y%m%dT%H%M%S")"

function initialize_data {
    printf 'Initializing... \e[34m%s\e[m\n' "$(shorten_item "$DOTFILES_DATA_DIR")"
    mkdir -p -m go-rwx "$DOTFILES_DATA_DIR" "$DOTFILES_HIST_DIR" "$DOTFILES_SAVE_DIR"
}

function link_item {
    local target="$1"
    local src_item="$(resolve_env_item "$DOTFILES_HOME/$target")"
    local dest_item="$HOME/$target"
    local save_item="$DOTFILES_SAVE_DIR/$target"
    [[ -e "$src_item" ]] || return 0
    if [[ -e "$dest_item" || -L "$dest_item" ]]; then
        printf '[\e[33m%s\e[m] Saving... \e[36m%s\e[m => \e[34m%s\e[m\n' \
            "$target" "$(shorten_item "$dest_item")" "$(shorten_item "$save_item")"
        mkdir -p "$(dirname "$save_item")"
        mv "$dest_item" "$save_item"
    fi
    printf '[\e[33m%s\e[m] Linking... \e[35m%s\e[m => \e[36m%s\e[m\n' \
        "$target" "$(shorten_item "$src_item")" "$(shorten_item "$dest_item")"
    mkdir -p "$(dirname "$dest_item")"
    ln -s "$src_item" "$dest_item"
}

function ensure_dir {
    local target="$1"
    local src_item="$(resolve_env_item "$DOTFILES_HOME/$target")"
    local dest_item="$HOME/$target"
    [[ -d "$src_item" ]] || return 0
    printf '[\e[33m%s\e[m] Ensuring... \e[36m%s\e[m\n' "$target" "$(shorten_item "$dest_item")"
    mkdir -p "$dest_item"
}

function polish_item_mode {
    local target="$1" mode="$2"
    local dest_item="$HOME/$target"
    [[ -e "$dest_item" ]] || return 0
    printf '[\e[33m%s\e[m] Polishing... \e[36m%s\e[m (mode: %s)\n' "$target" "$(shorten_item "$dest_item")" "$mode"
    chmod "$mode" "$dest_item"
}

function resolve_env_item {
    local item="$1"
    local dir="$(dirname "$item")"
    local name="$(basename "$item")"
    if [[ -e "$dir/[macos]$name" && "$OSTYPE" == "darwin"* ]]; then
        item="$dir/[macos]$name"
    fi
    printf '%s' "$item"
}

function shorten_item {
    local item="$1"
    if [[ "$item" == "$HOME/"* ]]; then
        item="~/${item#"$HOME/"}"
    fi
    printf '%s' "$item"
}

function report_results {
    local code=$?
    if (( ! $code )); then
        printf '\e[32mThe dotfiles installation succeeded!\e[m\n'
    else
        printf '\e[31mThe dotfiles installation failed...\e[m\n'
    fi
}

trap report_results EXIT

initialize_data

link_item ".bash_profile"
link_item ".bash_profile.d"

link_item ".dotfiles/bin"

link_item ".gitattributes"
link_item ".gitconfig"
link_item ".gitignore"

link_item ".gnupg/gpg.conf"
link_item ".gnupg/gpg-agent.conf"
link_item ".gnupg/gpg-ownertrust.txt"
polish_item_mode ".gnupg" go-rwx

link_item ".inputrc"

link_item ".ssh/config"
link_item ".ssh/github.hosts"
polish_item_mode ".ssh" go-rwx

link_item ".vimrc"

link_item ".Brewfile"

link_item "Library/Application Support/iTerm2/DynamicProfiles/Akihiro.json"
ensure_dir "Library/Logs/iTerm2/Sessions"
