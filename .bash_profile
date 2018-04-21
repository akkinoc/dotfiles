if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
for file in ~/.bash_profile.d/{shopts,exports,aliases,functions,sources}.sh; do
    . "$file"
done
