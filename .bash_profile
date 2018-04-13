if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/bin

. "$HOME/.dotfiles/bootstrap.sh"
for file in "$DOTFILES_HOME"/.bash_profile.d/*.sh; do
    . "$file"
done
