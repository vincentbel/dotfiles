#!/bin/bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install proxychains-ng
brew install diff-so-fancy
# use diff-so-fancy globally
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

############################################
# Brew cask time!
############################################

brew install caskroom/cask/brew-cask
brew tap caskroom/versions


# daily
brew cask install google-chrome
brew cask install firefox
brew cask install google-drive
brew cask install evernote
brew cask install rescuetime
brew cask install neteasemusic

# dev
brew cask install iterm2
brew cask install alfred
brew cask install dash
brew cask install atom
brew cask install sublime-text
brew cask install gitup

# quick look plugin
# <https://github.com/sindresorhus/quick-look-plugins>
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install betterzipql

# tools
brew cask install imageoptim # compress image
brew cask install licecap # gif maker
brew cask install the-unarchiver # addtional unzipper for .7z .rar

brew cask install shadowsocksx # over the fuck wall



# Remove outdated versions from the cellar
brew cleanup
