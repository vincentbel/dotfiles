# backup first
./backup.sh

# set up symlink
./symlinks.sh

# make dir if needed
mkdir -p ~/.zsh

# use git clone to ensure antigen can self update
# https://github.com/zsh-users/antigen#antigen-selfupdate
git clone https://github.com/zsh-users/antigen ~/.zsh/antigen

# change default shell to zsh
chsh -s /bin/zsh

# enter zsh shell to use the current .zshrc config
# or open a new shell
zsh

################## Node.js ###########################

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

# open a new shell

# install node.js version 8.x
nvm install 8

# install global npm dependencies
./npm.sh


################## Homebrew ###########################

# install homebrew
# http://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew formulas
./brew.sh

# GitHub markdown TOC
wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc -o .gh-md-toc
