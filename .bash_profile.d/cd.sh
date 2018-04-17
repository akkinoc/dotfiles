alias c="cd"
alias ~="cd ~"
alias -- -="cd -"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

function @() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}
