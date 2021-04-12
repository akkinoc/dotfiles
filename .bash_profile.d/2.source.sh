if [[ -d /usr/local/etc/profile.d ]]; then
    for _akkinoc_dotfiles_source_file in \
        /usr/local/etc/profile.d/*.sh
    do
        [[ -f "$_akkinoc_dotfiles_source_file" ]] || continue
        . "$_akkinoc_dotfiles_source_file"
    done
    unset _akkinoc_dotfiles_source_file
fi
