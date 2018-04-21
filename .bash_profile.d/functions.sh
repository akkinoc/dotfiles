function cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function o() {
    open "${@:-.}"
}

function path() {
    printf "${PATH//:/\\n}\n"
}

function relogin() {
    exec "$SHELL" -l
}
