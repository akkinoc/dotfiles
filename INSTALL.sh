#!/bin/bash

set -eu -o pipefail

DOTFILES_HOME="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history/$(date "+%Y%m%dT%H%M%S")"

function install_item {
    local target="$1"
    local src_item="$(resolve_env_item "$DOTFILES_HOME/$target")"
    local dest_item="$HOME/$target"
    local hist_item="$DOTFILES_HIST_DIR/$target"
    [[ -e "$src_item" ]] || return 0
    if [[ -e "$dest_item" || -L "$dest_item" ]]; then
        printf '[\e[33m%s\e[m] Saving... \e[36m%s\e[m => \e[34m%s\e[m\n' \
            "$target" "$(shorten_item "$dest_item")" "$(shorten_item "$hist_item")"
        mkdir -p "$(dirname "$hist_item")"
        mv "$dest_item" "$hist_item"
    fi
    printf '[\e[33m%s\e[m] Linking... \e[35m%s\e[m => \e[36m%s\e[m\n' \
            "$target" "$(shorten_item "$src_item")" "$(shorten_item "$dest_item")"
    mkdir -p "$(dirname "$dest_item")"
    ln -s "$src_item" "$dest_item"
}

function polish_item_mode {
    local target="$1" mode="$2"
    local item="$HOME/$target"
    [[ -e "$item" ]] || return 0
    printf '[\e[33m%s\e[m] Polishing... \e[36m%s\e[m (mode: %s)\n' \
        "$target" "$(shorten_item "$item")" "$mode"
    chmod "$mode" "$item"
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
        item="~/${item##$HOME/}"
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

install_item .Brewfile
install_item .bash_completion
install_item .bash_profile
install_item .bash_profile.d
install_item .dotfiles/bin
install_item .gitattributes
install_item .gitconfig
install_item .gitignore
install_item .gnupg/gpg.conf
install_item .gnupg/gpg-agent.conf

polish_item_mode .dotfiles go-rwx
polish_item_mode .gnupg go-rwx
