if command -v gpg-agent tty &>/dev/null; then
    export GPG_TTY="$(tty)"
fi
