#!/usr/bin/env bash

apt -y update
apt -y upgrade
apt -y dist-upgrade

# Basic utilities
apt -y install curl
apt -y install direnv
apt -y install exfat-utils
apt -y install fonts-powerline
apt -y install graphviz
apt -y install imagemagick
apt -y install ispell
apt -y install keychain
apt -y install pandoc
apt -y install python3-full
apt -y install python3-gpg
apt -y install python3-pip
apt -y install python3-venv
apt -y install texlive-full
apt -y install tree
apt -y install webkit2png
apt -y install zsh

# Clean up
apt autoremove
apt autoclean
apt -y update

echo install-ubuntu.sh complete.
