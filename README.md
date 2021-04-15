# dotfiles

[![Works][Works Badge]][Works]
[![License][License Badge]][License]

[Works Badge]: https://cdn.rawgit.com/nikku/works-on-my-machine/v0.2.0/badge.svg
[Works]: https://github.com/nikku/works-on-my-machine
[License Badge]: https://img.shields.io/badge/license-MIT-brightgreen.svg
[License]: LICENSE.txt

My personal dotfiles for macOS.  

![Image]

[Image]: IMAGE.png

## Installation

### Setting SSH key

Place the SSH key.  

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

Import the GPG key.  

```console
$ gpg --import <{Key}
$ echo "{Fingerprint}:6:" | gpg --import-ownertrust
```

## License

Licensed under the [MIT License].  

[MIT License]: LICENSE.txt
