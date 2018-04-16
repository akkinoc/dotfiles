function o() {
    if [[ $# = 0 ]]; then
        open .
    else
        open "$@"
    fi
}
