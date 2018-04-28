[[ ! -f ~/.bashrc ]] || . ~/.bashrc

[[ ${BASH_VERSINFO[0]} -lt 4 ]] || shopt -s autocd
[[ ${BASH_VERSINFO[0]} -lt 4 ]] || shopt -s globstar
shopt -s histappend

. ~/.bash_profile.d/exports.sh
. ~/.bash_profile.d/sources.sh
. ~/.bash_profile.d/aliases.sh
. ~/.bash_profile.d/prompt.sh
