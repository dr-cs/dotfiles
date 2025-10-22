#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Antigen package manager for zsh
curl -L git.io/antigen > ~/.antigen.zsh

# SDKMAN!
curl -s https://get.sdkman.io | bash
. "$HOME/.sdkman/bin/sdkman-init.sh"

# Java 8
# sdk install java 8.0.282.hs-adpt
# Trying out the J9 implementation.  If problems, revert to HotSpot above.
sdk install java 8.0.282.j9-adpt

