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

## Windows 10/11

> I only do Linux development, not Windows development (e.g., Visual C++, .Net).  So these steps set you up to do Linux development on Windows 10/11.

1. Update Windows
2. Remap CapsLock to Ctrl by downloading [map-capslock-ctrl.reg](map-capslock-ctrl.reg) and running ("merging") it.

   > There is a GUI program, [PowerToys](https://docs.microsoft.com/en-us/windows/powertoys/), that will remap keys, but the remapping does not work in terminals.

4. Install WSL2 (See detailed instructions at https://docs.microsoft.com/en-us/windows/wsl/install-win10#simplified-installation-for-windows-insiders.  Note that Windows 10 with all updates from 2021-07-29 and later should support the simplified install.)

    4.1. Start PowerShell in admin mode by typing Windows+R, typing `powershell` in the text box, and running it with Ctrl-Enter.
    4.2. On the PowerShell command line, enter `wsl --install`.
    4.3. Install Windows Terminal: https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701

Now you have WSL installed.  In a WSL terminal window, proceed with the Ubuntu steps below.

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
