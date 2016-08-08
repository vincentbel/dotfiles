# backup first
./backup.sh

# use git clone to ensure antigen can self update
# https://github.com/zsh-users/antigen#antigen-selfupdate
git clone https://github.com/zsh-users/antigen ~/.zsh

# set up symlink
./symlinks.sh

# enter zsh shell to use the current .zshrc config
zsh

################## Node.js ###########################

# since we use lukechilds/zsh-nvm to manage nvm
# the following cmds should be excuted at the configed zsh shell
# upgrade nvm to latest version
nvm upgrade
# install node.js version 6.x
nvm install 6

# install global npm dependencies
./npm.sh


################## Homebrew ###########################

# install homebrew
# http://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install homebrew formulars
./brew.sh
