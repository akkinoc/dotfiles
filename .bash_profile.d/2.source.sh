if [[ -d "$HOMEBREW_PREFIX/etc/profile.d" ]]; then
    for _akkinoc_dotfiles_source_file in \
        "$HOMEBREW_PREFIX/etc/profile.d"/*.sh
    do
        [[ -f "$_akkinoc_dotfiles_source_file" ]] || continue
        . "$_akkinoc_dotfiles_source_file"
    done
    unset _akkinoc_dotfiles_source_file
fi

for _akkinoc_dotfiles_source_file in \
    "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" \
    "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
do
    [[ -f "$_akkinoc_dotfiles_source_file" ]] || continue
    . "$_akkinoc_dotfiles_source_file"
done
unset _akkinoc_dotfiles_source_file

if type -t rbenv &>/dev/null; then
    eval "$(rbenv init - bash)"
fi
