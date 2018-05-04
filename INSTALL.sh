#!/bin/bash

set -eu -o pipefail

DOTFILES_HOME="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history/$(date "+%Y%m%dT%H%M%S")"

function ensure_dir {
    local dir="$1" mode="${2:-}"
    mkdir -p "$dir"
    [[ -z "$mode" ]] || chmod "$mode" "$dir"
}

function install_item {
    local target="$1" mode="${2:-}"
    local src_item="$(resolve_env_src_item "$DOTFILES_HOME/$target")"
    local dest_item="$HOME/$target"
    local hist_item="$DOTFILES_HIST_DIR/$target"
    printf '[\e[33m%s\e[m]\n' "$target"
    if [[ -e "$dest_item" || -L "$dest_item" ]]; then
        printf 'Saving... \e[36m%s\e[m => \e[34m%s\e[m\n' "$dest_item" "$hist_item"
        mkdir -p "$(dirname "$hist_item")"
        mv "$dest_item" "$hist_item"
    fi
    if [[ -e "$src_item" ]]; then
        printf 'Linking... \e[35m%s\e[m => \e[36m%s\e[m\n' "$src_item" "$dest_item"
        ln -s "$src_item" "$dest_item"
        [[ -z "$mode" ]] || chmod "$mode" "$dest_item"
    else
        printf 'Skipping...\n'
    fi
}

function resolve_env_src_item {
    local item="$1"
    local dir="$(dirname "$item")"
    local name="$(basename "$item")"
    if [[ -e "$dir/[macos]$name" && "$OSTYPE" == "darwin"* ]]; then
        item="$dir/[macos]$name"
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
install_item .gitattributes
install_item .gitconfig
install_item .gitignore

ensure_dir .dotfiles
install_item .dotfiles/bin

ensure_dir .gnupg go-rwx
install_item .gnupg/gpg.conf
install_item .gnupg/gpg-agent.conf
