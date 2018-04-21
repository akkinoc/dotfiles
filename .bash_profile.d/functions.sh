function cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function o() {
    if [[ $# -eq 0 ]]; then
        open .
    else
        open "$@"
    fi
}

function path() {
    printf "${PATH//:/\\n}\n"
}

function relogin() {
    exec -l "$SHELL"
}
