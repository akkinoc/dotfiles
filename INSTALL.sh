#!/bin/bash

set -eu -o pipefail
cd "$(dirname "$0")"

DOTFILES_HOME="$PWD"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_HIST_DIR="$DOTFILES_DATA_DIR/history/$(date +%Y%m%dT%H%M%S)"

function link_dotfile {
    local target="$1"
    local src_file="$DOTFILES_HOME/$target"
    local dest_file="$HOME/$target"
    local hist_file="$DOTFILES_HIST_DIR/$target"
    printf 'Linking... %s => %s\n' "$src_file" "$dest_file"
    if [[ -f "$dest_file" || -d "$dest_file" || -h "$dest_file" ]]; then
        mkdir -p "$(dirname "$hist_file")"
        mv "$dest_file" "$hist_file"
    fi
    mkdir -p "$(dirname "$dest_file")"
    ln -s "$src_file" "$dest_file"
}

function report_result {
    local code=$?
    if (( ! $code )); then
        printf '\e[32mThe dotfiles installation succeeded!\e[m\n'
    else
        printf '\e[31mThe dotfiles installation failed...\e[m\n'
    fi
}

trap report_result EXIT
link_dotfile .Brewfile
link_dotfile .bash_profile
link_dotfile .bash_profile.d
link_dotfile .gitattributes
link_dotfile .gitconfig
link_dotfile .gitignore
