if [[ -d /usr/local/etc/profile.d ]]; then
    for _akihyro_dotfiles_source_file in \
        /usr/local/etc/profile.d/*.sh
    do
        [[ -f "$_akihyro_dotfiles_source_file" ]] || continue
        . "$_akihyro_dotfiles_source_file"
    done
    unset _akihyro_dotfiles_source_file
fi
