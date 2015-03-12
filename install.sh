#!/bin/bash
########################################################################################################################
# インストール
########################################################################################################################

set -eux
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# ファンクション: ファイル "~/.dotfiles" を作成
function make_dotdotfiles() {
    pushd $(dirname $0)
    echo "export DOTFILES_HOME=$PWD" >$HOME/.dotfiles
    popd
}

# ファンクション: シンボリックリンクを作成, 既存ファイルは退避
# $1: ファイル名
# $2: リンク先ディレクトリ
function link_dotfile() {
    file_name=$1
    to_dir=$2
    from_file=$DOTFILES_HOME/$file_name
    to_file=$to_dir/$file_name
    backup_dir=$DOTFILES_HOME/.backup/$to_dir
    backup_file=$DOTFILES_HOME/.backup/$to_file.$timestamp
    if [ -e $to_file ]; then
        mkdir -p $backup_dir
        mv $to_file $backup_file
    fi
    mkdir -p $to_dir
    ln -s $from_file $to_file
}

# メイン処理
make_dotdotfiles
. ${HOME}/.dotfiles
link_dotfile .bash_profile  ${HOME}
link_dotfile .gitconfig     ${HOME}
link_dotfile .gitattributes ${HOME}
