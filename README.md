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

### Setting SSH key for GitHub

Place the SSH key for GitHub.  

* SSH secret key: `~/.ssh/github`
* SSH public key: `~/.ssh/github.pub`

### Installing dotfiles

Clone this Git repository.  

```console
$ GIT_SSH_COMMAND="ssh -i ~/.ssh/github" git clone git@github.com:akkinoc/dotfiles.git
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

### Importing the GPG key from Keybase

Required: [Keybase].  

[Keybase]: https://keybase.io/

Export the GPG key from Keybase and import it.  

```console
$ keybase login
$ gpg --import <(keybase pgp export --secret)
```

Import the ownertrust.  

```console
$ gpg --import-ownertrust <~/.gnupg/gpg-ownertrust.txt
```

## License

Licensed under the [MIT License].  

[MIT License]: LICENSE.txt
