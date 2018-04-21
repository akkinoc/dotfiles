shopt -s histappend

if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
    shopt -s autocd
    shopt -s globstar
fi
