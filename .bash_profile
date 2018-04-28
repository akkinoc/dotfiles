shopt -s extglob
shopt -s failglob
shopt -s histappend
if (( ${BASH_VERSINFO[0]} >= 4 )); then
    shopt -s autocd
    shopt -s globstar
fi

. ~/.bash_profile.d/sources.sh
. ~/.bash_profile.d/exports.sh
. ~/.bash_profile.d/aliases.sh
. ~/.bash_profile.d/prompt.sh
