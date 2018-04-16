if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
for file in ~/.bash_profile.d/*.sh; do
    . "$file"
done

export PATH=$PATH:$HOME/bin
