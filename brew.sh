#!/bin/bash

# install command-line tools using Homebrew

# make sure we’re using the latest Homebrew
brew update

# upgrade any already-installed formulae
brew upgrade

# GNU File, Shell, and Text utilities
brew install coreutils

# proxy on terminal
# brew install proxychains-ng

# a code-searching tool similar to ack, but faster
brew install ripgrep

# A cat(1) clone with wings.
# https://github.com/sharkdp/bat
brew install bat

brew install git-delta
git config --global core.pager "delta --plus-color=#012800 --minus-color=#340001 --theme='Sublime Snazzy'"
git config --global interactive.difffilter "delta --color-only"

brew install vim
# brew install macvim
brew install neovim

# brew install git-flow

# Node version manager
# https://github.com/Schniz/fnm
brew install Schniz/tap/fnm

fnm install 22

# install global npm dependencies
# ./npm.sh

brew install navi

############################################
# Brew cask time!
############################################


# daily
# brew cask install google-chrome
brew install --cask google-chrome-canary
brew install --cask firefox
# brew cask install google-backup-and-sync
# brew cask install rescuetime
# brew cask install iina # video player
# brew cask install dropbox
# install from App Store
# brew cask install evernote
# brew cask install neteasemusic
# brew cask install sogouinput

# dev
brew install --cask iterm2
# brew cask install hyper
# brew cask install alfred
# brew cask install dash
# brew cask install atom
brew install --cask visual-studio-code
brew install --cask sublime-text
# brew cask install gitup
# brew cask install sketch
# brew cask install nestopia # nes games
# brew cask install charles
# brew cask install docker
# brew cask install jetbrains-toolbox

# https://github.com/egoist/devdocs-desktop
brew install --cask devdocs

# https://github.com/federico-terzi/espanso
brew tap federico-terzi/espanso
brew install espanso
espanso install all-emojis

# quick look plugin
# <https://github.com/sindresorhus/quick-look-plugins>
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
# brew cask install betterzip
brew install --cask qlimagesize
brew install --cask webpquicklook


# tools
brew install --cask imageoptim # compress image
brew install --cask the-unarchiver # addtional unzipper for .7z .rar
# brew cask install keycastr # keystroke visualizer
# brew cask install karabiner # custom key binding
# brew tap dteoh/sqa
# brew cask install slowquitapps # delay cmd+q
# defaults write com.dteoh.SlowQuitApps delay -int 700

# brew cask install shadowsocksx-ng # over the fucking wall



# Remove outdated versions from the cellar
brew cleanup
