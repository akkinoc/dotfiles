function cd_to_finder_path() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function open_args_or_wd() {
    if [[ $# -gt 0 ]]; then
        open "$@"
    else
        open .
    fi
}

function path() {
    local paths
    IFS=: read -r -a paths <<<"$PATH"
    printf "%s\n" "${paths[@]}"
}

function relogin() {
    exec -l "$SHELL"
}
