if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/bin

. $HOME/.dotfiles
for p in $DOTFILES_HOME/profile.d/*.sh; do
    . $p
done
