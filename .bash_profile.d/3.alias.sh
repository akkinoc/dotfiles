if type -t colordiff &>/dev/null; then
    alias diff="colordiff"
fi

if type -t grep &>/dev/null; then
    alias grep="grep --color=auto"
fi
if type -t egrep &>/dev/null; then
    alias egrep="egrep --color=auto"
fi
if type -t fgrep &>/dev/null; then
    alias fgrep="fgrep --color=auto"
fi
if type -t ggrep &>/dev/null; then
    alias ggrep="ggrep --color=auto"
fi
if type -t gegrep &>/dev/null; then
    alias gegrep="gegrep --color=auto"
fi
if type -t gfgrep &>/dev/null; then
    alias gfgrep="gfgrep --color=auto"
fi

if ls -d --color=auto &>/dev/null; then
    alias ls="ls --color=auto"
elif ls -Gd &>/dev/null; then
    alias ls="ls -G"
fi
if type -t gls &>/dev/null; then
    alias gls="gls --color=auto"
fi

if type -t sudo &>/dev/null; then
    alias sudo="sudo "
fi

if type -t vim &>/dev/null; then
    alias ex="vim -e"
    alias exim="vim -E"
    alias rvim="vim -Z"
    alias rview="vim -RZ"
    alias vi="vim"
    alias view="vim -R"
    alias vimdiff="vim -d"
    _akkinoc_dotfiles_alias_vimruntime="$(vim -e -T dumb --cmd 'exe "se t_cm=\<C-M>" | ec $VIMRUNTIME | q')"
    _akkinoc_dotfiles_alias_vimruntime="${_akkinoc_dotfiles_alias_vimruntime//$'\r'}"
    if [[ -x "$_akkinoc_dotfiles_alias_vimruntime/macros/less.sh" ]]; then
        alias vimless="\"$_akkinoc_dotfiles_alias_vimruntime/macros/less.sh\""
    fi
    unset _akkinoc_dotfiles_alias_vimruntime
elif type -t vi &>/dev/null; then
    alias ex="vi -e"
    alias view="vi -R"
fi

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
if type -t pwd-ext &>/dev/null; then
    alias @="cd \"\$(pwd-ext)\""
fi

if type -t diff &>/dev/null; then
    alias d="diff -u"
fi

if type -t code &>/dev/null; then
    alias e="code"
else
    alias e="\"\${EDITOR:?}\""
fi

if type -t hub &>/dev/null; then
    alias g="hub"
elif type -t git &>/dev/null; then
    alias g="git"
fi

if type -t ggrep &>/dev/null; then
    alias ge="ggrep -EIn --exclude-dir=.git"
elif type -t grep &>/dev/null; then
    alias ge="grep -EIn --exclude-dir=.git"
fi

if type -t gls &>/dev/null; then
    alias l="gls -Fl"
    alias la="gls -Fal"
else
    alias l="ls -Fl"
    alias la="ls -Fal"
fi

if type -t open-args-or-wd &>/dev/null; then
    alias o="open-args-or-wd"
fi

alias reload="exec -l \"\${SHELL:?}\""

alias rmf="rm -frv"

if type -t vimless &>/dev/null; then
    alias v="vimless"
else
    alias v="\"\${PAGER:?}\""
fi
