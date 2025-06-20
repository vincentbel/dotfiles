# backup first
./backup.sh

# set up symlink
./symlink.sh

# make dir if needed
mkdir -p ~/.zsh

# use git clone to ensure antigen can self update
# https://github.com/zsh-users/antigen#antigen-selfupdate
curl -L git.io/antigen > ~/.zsh/antigen.zsh

# change default shell to zsh
chsh -s /bin/zsh

# enter zsh shell to use the current .zshrc config
# or open a new shell
zsh

################## Homebrew ###########################

# install homebrew
# http://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install homebrew formulas
./brew.sh

# install global npm dependencies
./npm.sh

# GitHub markdown TOC
wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc -o .gh-md-toc

# installl jabba <https://github.com/shyiko/jabba>
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash -s -- --skip-rc && . ~/.jabba/jabba.sh
