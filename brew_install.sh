#!/bin/bash

## install a bunch of brew packages
cd `dirname $0`
brew install `cat brew_packages.txt`

## create a ~/.fzf.zsh file
$(brew --prefix)/opt/fzf/install --no-update-rc --no-bash --all

## install some nice fonts
#brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --cask font-meslo-lg-nerd-font

