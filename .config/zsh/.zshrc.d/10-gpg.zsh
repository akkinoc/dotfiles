if command -v gpg-agent &>/dev/null; then
    export GPG_TTY="$(tty)"
fi
