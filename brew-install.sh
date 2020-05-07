#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`
echo "Install Xcode command line tool..."
xcode-select --install

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
brew install tree
brew install htop
brew install wget
brew install jq
brew install stow
brew install tflint
brew install zsh
brew cask install github-desktop
brew cask install visual-studio-code
brew cask install iterm

# Communication Apps
brew cask install keybase
brew cask install slack

# Web Tools
brew cask install google-chrome

# File Storage
brew cask install dropbox

# Entertainment
brew cask install spotify
