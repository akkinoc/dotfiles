#!/bin/bash

set -eu -o pipefail
cd "$(dirname "$0")"

DOTFILES_HOME="$PWD"
DOTFILES_DATA_DIR="$HOME/.dotfiles"
DOTFILES_BOOTSTRAP_SCRIPT_FILE="$DOTFILES_DATA_DIR/bootstrap.sh"
DOTFILES_HISTORY_DIR="$DOTFILES_DATA_DIR/history/$(date +%Y%m%dT%H%M%S)"

function create_bootstrap_script() {
    printf "\e[36mCreating bootstrap script... $DOTFILES_BOOTSTRAP_SCRIPT_FILE\e[m\n"
    mkdir -p "$(dirname "$DOTFILES_BOOTSTRAP_SCRIPT_FILE")"
    printf "export DOTFILES_HOME='$DOTFILES_HOME'\n" >"$DOTFILES_BOOTSTRAP_SCRIPT_FILE"
}

function link_dotfile() {
    local target="$1"
    local src_file="$DOTFILES_HOME/$target"
    local dest_file="$HOME/$target"
    local history_file="$DOTFILES_HISTORY_DIR/$target"
    printf "\e[36mLinking dotfile... $dest_file\e[m\n"
    if [[ -f $dest_file || -L $dest_file ]]; then
        mkdir -p "$(dirname "$history_file")"
        mv "$dest_file" "$history_file"
    fi
    mkdir -p "$(dirname "$dest_file")"
    ln -s "$src_file" "$dest_file"
}

function show_result() {
    if [[ $? = 0 ]]; then
        printf "\e[32mThe dotfiles installation succeeded!\e[m\n"
    else
        printf "\e[31mThe dotfiles installation failed...\e[m\n"
    fi
}

trap show_result EXIT
create_bootstrap_script
link_dotfile .bash_profile
link_dotfile .gitattributes
link_dotfile .gitconfig
link_dotfile .gitignore
