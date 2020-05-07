#!/bin/sh

command -v xcode-select >/dev/null 2>&1 || { echo >&2 "Installing xcode command line tool..."; xcode-select --install; }

command -v brew >/dev/null 2>&1 || { echo >&2 "Installing brew..."; /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

echo "Installing brew cask..."
brew tap caskroom/cask

# Programming Languages & Configuration languages
brew cask install java
brew install node
brew install python
brew install awscli
brew install vault
brew install terraform
brew install packer
brew install ansible
brew install molecule

# Dev Tools
brew install git
brew install docker
brew install docker-machine
brew install docker-compose
brew cask install docker
brew install tree
brew install htop
brew install wget
brew install jq
brew install stow
brew install tflint
brew install zsh
brew cask install github-desktop
brew cask install visual-studio-code
brew cask install iterm2
brew cask install spectacle

# Fonts
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

# Communication Apps
brew cask install keybase
brew cask install slack

# Web Tools
brew cask install google-chrome

# File Storage
brew cask install dropbox

# Entertainment
brew cask install spotify
brew cask install nvidia-geforce-now 

# clean up
brew cleanup