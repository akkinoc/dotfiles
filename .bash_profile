if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
for file in ~/.bash_profile.d/*.sh; do
    . "$file"
done
