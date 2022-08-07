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

## Installation

### Setting SSH key

Place my SSH key.

* SSH secret key: `~/.ssh/akkinoc`
* SSH public key: `~/.ssh/akkinoc.pub`

### Installing dotfiles

Clone this Git repository.

```console
$ GIT_SSH_COMMAND="ssh -i ~/.ssh/akkinoc" git clone git@github.com:akkinoc/dotfiles.git
```

Install dotfiles and reload shell.

```console
$ dotfiles/INSTALL.sh
$ exec -l "$SHELL"
```

## Additional installation

### Installing Homebrew packages

Required: [Homebrew].

[Homebrew]: https://brew.sh/

Install Homebrew packages.

```console
$ brew bundle --global
```

Change login shell to Bash installed via Homebrew.

```console
$ export SHELL="/usr/local/bin/bash"
$ sudo dscl . -create "/Users/$USER" UserShell "$SHELL"
$ reload
```

### Setting GPG key

Required: [GnuPG].

[GnuPG]: https://gnupg.org/

Disable option to store password in macOS keychain.

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
