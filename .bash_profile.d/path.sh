if [[ :$PATH: != *:$HOME/bin:* ]]; then
    export PATH="$PATH:$HOME/bin"
fi

function path() {
    printf "${PATH//:/\\n}\n"
}
