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

function link_item {
    local target="$1" mode="${2:-}"
    local src_item="$DOTFILES_HOME/$target"
    local dest_item="$HOME/$target"
    local hist_item="$DOTFILES_HIST_DIR/$target"
    printf 'Linking... %s => %s\n' "$src_item" "$dest_item"
    if [[ -f "$dest_item" || -d "$dest_item" || -h "$dest_item" ]]; then
        mkdir -p "$(dirname "$hist_item")"
        mv "$dest_item" "$hist_item"
    fi
    ln -s "$src_item" "$dest_item"
    [[ -z "$mode" ]] || chmod "$mode" "$dest_item"
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

link_item .Brewfile
link_item .bash_completion
link_item .bash_profile
link_item .bash_profile.d
link_item .gitattributes
link_item .gitconfig
link_item .gitignore

ensure_dir .dotfiles
link_item .dotfiles/bin
