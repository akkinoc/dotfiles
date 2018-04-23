function path() {
    local IFS=":"
    local path
    for path in ${PATH}; do
        printf "%s\n" "$path"
    done
}

function relogin() {
    exec -l "$SHELL"
}

function _cd_to_finder_path() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function _open_args_or_wd() {
    if [[ $# -gt 0 ]]; then
        open "$@"
    else
        open .
    fi
}
