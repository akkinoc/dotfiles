function cd_to_finder_path() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function source_from_brew_if_exists() {
    local file="$1"
    local args=("${@:2}")
    type -t brew &>/dev/null || return 0
    source_if_exists "$(brew --prefix)/$file" "${args[@]}"
}

function source_if_exists() {
    local file="$1"
    local args=("${@:2}")
    [[ -f "$file" ]] || return 0
    . "$file" "${args[@]}"
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
    printf '%s\n' "${paths[@]}"
}

function relogin() {
    exec -l "$SHELL"
}
