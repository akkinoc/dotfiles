if (( ${BASH_VERSINFO[0]} >= 4 )) && type -t fzf &>/dev/null; then
    function _akihyro_dotfiles_bind_search_history {
        local no line
        line="$(
            HISTTIMEFORMAT= history |
            fzf --clear --height 10% --inline-info +m -q "${READLINE_LINE}" --reverse +s --tac -n 2..
        )" || return 0
        read -r no line <<<"$line"
        READLINE_LINE="$line"
        READLINE_POINT=${#READLINE_LINE}
    }
    bind -x '"\C-r": _akihyro_dotfiles_bind_search_history'
fi
