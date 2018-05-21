if type -t g &>/dev/null && type -t __git_complete &>/dev/null && type -t __git_main &>/dev/null; then
    __git_complete g __git_main
fi
