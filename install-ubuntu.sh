#!/usr/bin/env bash

apt -y update
apt -y upgrade
apt -y dist-upgrade

# Basic utilities
apt -y install imagemagick
apt -y install tree
apt -y install webkit2png
apt -y install graphviz
apt -y install pandoc
apt -y install ispell
apt -y install exfat-utils
apt -y install zsh
apt -y install keychain
apt -y install texlive-full

# Clean up
apt autoremove
apt autoclean
apt -y update

echo install-ubuntu.sh complete.
