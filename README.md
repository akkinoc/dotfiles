# dotfiles

![works badge]
[![license badge]][license]
[![sponsor badge]][sponsor]

[works badge]: https://img.shields.io/badge/works-on%20my%20machine-brightgreen
[license]: LICENSE.txt
[license badge]: https://img.shields.io/github/license/akkinoc/dotfiles?color=blue
[sponsor]: https://github.com/sponsors/akkinoc
[sponsor badge]: https://img.shields.io/static/v1?logo=github&label=sponsor&message=%E2%9D%A4&color=db61a2

My personal dotfiles for macOS.

## Requirements

- [1Password]
- [Homebrew]

[1Password]: https://1password.com/
[Homebrew]: https://brew.sh/

## Installation

Clone this Git repository.

```console
$ SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" \
  git clone git@github.com:akkinoc/dotfiles.git
```

Install dotfiles and reload shell.

```console
$ dotfiles/INSTALL.zsh
$ exec -l "$SHELL"
```

Install Homebrew packages.

```console
$ brew bundle -g
```

Change login shell to Zsh installed via Homebrew.

```console
$ shell="$HOMEBREW_PREFIX/bin/zsh"
$ sudo dscl . -create "/Users/$USER" UserShell "$shell"
$ exec -l "$shell"
```

Disable option to store GPG key password in macOS keychain.

```console
$ defaults write org.gpgtools.common DisableKeychain -bool yes
```

Import my GPG key.

```console
$ gpg --import <{Key}
$ echo "{Fingerprint}:6:" | gpg --import-ownertrust
```

## License

Licensed under the [MIT License][license].
