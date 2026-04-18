if command -v gpg-agent tty &>/dev/null; then
    export GNUPGHOME="$XDG_DATA_HOME/gnupg"
    export GPG_TTY="$(tty)"
fi
