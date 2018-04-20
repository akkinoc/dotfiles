export HISTSIZE=10000
export HISTTIMEFORMAT="%m/%d %H:%M:%S "
if [[ :$PATH: != *:$HOME/bin:* ]]; then
    export PATH="$PATH:$HOME/bin"
fi

alias ~="cd ~"
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

function cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

function path() {
    printf "${PATH//:/\\n}\n"
}

if [[ -f /usr/local/etc/profile.d/bash_completion.sh ]]; then
    . /usr/local/etc/profile.d/bash_completion.sh
fi
