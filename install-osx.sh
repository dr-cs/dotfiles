#!/usr/bin/env bash

# Software I need on every mac system

brew update
brew upgrade

# Basic command line utilities
brew install node
brew install wget --with-iri
brew install imagemagick --with-webp
brew install tree
brew install ispell
brew install webkit2png
brew install graphviz
# Also installs ghc, cabal-install, gmp
brew install pandoc
# This is the best emacs for Mac OSX.
# See https://github.com/railwaycat/homebrew-emacsmacport
# brew tap railwaycat/emacsmacport
# brew install --cask emacs-mac
brew install --cask emacs
brew install gnutls
brew install gnupg2 --with-gnupg21

# Programming languages
brew install gradle
brew install scala
brew install sbt

# Big one ...
brew install --cask mactex

# Remove outdated versions from the cellar.
brew cleanup

echo install-osx.sh complete.
