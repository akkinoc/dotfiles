shopt -s extglob
shopt -s histappend
if (( ${BASH_VERSINFO[0]} >= 4 )); then
    shopt -s autocd
    shopt -s globstar
fi

for _akihyro_dotfiles_profile_file in \
    /usr/local/etc/profile.d/*.sh \
    ~/.bashrc \
    ~/.bash_profile.d/{exports,aliases,prompt}.sh
do
    [[ -f "$_akihyro_dotfiles_profile_file" ]] || continue
    . "$_akihyro_dotfiles_profile_file"
done
unset _akihyro_dotfiles_profile_file
