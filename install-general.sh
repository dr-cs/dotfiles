#!/usr/bin/env bash

# Antigen package manager for zsh
curl -L git.io/antigen > ~/.antigen.zsh

# SDKMAN!
curl -s https://get.sdkman.io | bash
. "$HOME/.sdkman/bin/sdkman-init.sh"

# Java 8
# sdk install java 8.0.282.hs-adpt
# Trying out the J9 implementation.  If problems, revert to HotSpot above.
sdk install java 8.0.282.j9-adpt

# SBT starting point for Scala projects
# (which will then each use particular versions of SBT and Scala)
sdk install sbt

# Scala (for playing around with Scala shell)
sdk install scala

# Update npm & packages
npm install npm -g
npm update -g
npm install -g markdown-pdf

# Update Ruby & gems
sudo gem update —system
sudo gem update
sudo gem install jekyll
