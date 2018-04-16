if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export PATH=$PATH:$HOME/bin

for file in ~/.bash_profile.d/*.sh; do
    . "$file"
done
