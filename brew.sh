#!/bin/bash

# install command-line tools using Homebrew

# make sure we’re using the latest Homebrew
brew update

# upgrade any already-installed formulae
brew upgrade

# proxy on terminal
brew install proxychains-ng

# a code-searching tool similar to ack, but faster
brew install the_silver_searcher

brew install diff-so-fancy
# use diff-so-fancy globally
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

brew install vim
brew install macvim

brew install git-flow

############################################
# Brew cask time!
############################################

brew install caskroom/cask/brew-cask
brew tap caskroom/versions


# daily
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install google-backup-and-sync
brew cask install rescuetime
brew cask install iina # video player
# brew cask install dropbox
# install from App Store
# brew cask install evernote
# brew cask install neteasemusic

# dev
brew cask install iterm2
# brew cask install hyper
brew cask install alfred
brew cask install dash
brew cask install atom
brew cask install visual-studio-code
brew cask install sublime-text
brew cask install gitup
brew cask install sketch
# brew cask install nestopia # nes games
# brew cask install charles
# brew cask install docker
# brew cask install jetbrains-toolbox

# quick look plugin
# <https://github.com/sindresorhus/quick-look-plugins>
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install betterzipql

# tools
brew cask install imageoptim # compress image
brew cask install the-unarchiver # addtional unzipper for .7z .rar
brew cask install keycastr # keystroke visualizer
# brew cask install karabiner # custom key binding
brew tap dteoh/sqa
brew cask install slowquitapps # delay cmd+q
defaults write com.dteoh.SlowQuitApps delay -int 700

brew cask install shadowsocksx-ng # over the fucking wall



# Remove outdated versions from the cellar
brew cleanup
