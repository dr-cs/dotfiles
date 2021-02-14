#!/usr/bin/env bash

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade

# Basic utilities
apt-get -y install xserver-xorg-input-libinput
apt-get -y install imagemagick
apt-get -y install tree
apt-get -y install webkit2png
apt-get -y install graphviz
apt-get -y install pandoc
apt-get -y install emacs
apt-get -y install ispell
apt-get -y install exfat-utils
apt-get -y install m4
apt-get -y install zsh
apt-get -y install texlive-full

# Programming languages
apt-get -y install openjdk-8-jdk
apt-get -y install openjfx
apt-get -y install ocaml
apt-get -y install opam

# Clean up
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get -y update

echo install-ubuntu.sh complete.
