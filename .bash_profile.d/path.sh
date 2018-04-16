if [[ :$PATH: != *:$HOME/bin:* ]]; then
    export PATH="$PATH:$HOME/bin"
fi
alias path="printf \"\${PATH//:/\\n}\n\""
