# My Dotfiles

Inspired by and much borrowed from:

* https://github.com/webpro/dotfiles
* https://github.com/mathiasbynens/dotfiles


## OS X

To use, first make sure you have an up-to-date system and Apple's developer tools:

```sh
$ sudo softwareupdate -i -a
$ xcode-select --install
```

You may need to restart your computer after executing the commands above.  After they're done:

1. Install [Homebrew](http://brew.sh/)
2. Install [Git](http://git-scm.com/) (on OS X: `brew install git`)
3. Clone this repository
4. `cd` to the `dotfiles` directory created by cloning this repository
5. `bash install-osx.sh`
6. `bash customize-osx.sh`

## Ubuntu (works on Windows 10 WSL2 Ubuntu)

1. Install [Git](http://git-scm.com/) (on Ubuntu: `sudo apt-get install git`)
2. Clone this repository
3. `cd` to the `dotfiles` directory created by cloning this repository
4. `sudo bash install-ubuntu.sh`
5. `bash customize-ubuntu.sh`

## General

After doing the platform-specific installations and customizations above, do the following.

1. Run `bash install-general.sh`
2. Run `bash link-dotfiles.sh`
3. Install the [Nerd Fonts](https://github.com/romkatv/powerlevel10k#fonts) required by the Powerlevel10k zsh theme and configure (Windows) Terminal to use `MesloLGS NF`.

After restarting terminal, run `p10k configure`.