shopt -s extglob
shopt -s histappend
if (( ${BASH_VERSINFO[0]} >= 4 )); then
    shopt -s autocd
    shopt -s globstar
fi

if type -t /opt/homebrew/bin/brew &>/dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif type -t brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

for _akkinoc_dotfiles_profile_file in \
    ~/.bashrc \
    ~/.bash_profile.d/*.sh
do
    [[ -f "$_akkinoc_dotfiles_profile_file" ]] || continue
    . "$_akkinoc_dotfiles_profile_file"
done
unset _akkinoc_dotfiles_profile_file
