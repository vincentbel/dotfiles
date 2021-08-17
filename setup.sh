#!/bin/bash

########## Set up file for GitHub Codespace ##########
# See more at: <https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account#dotfiles>

# install fnm: https://github.com/Schniz/fnm
curl -fsSL https://fnm.vercel.app/install | bash

# install fzf: https://github.com/junegunn/fzf
sudo apt-get install fzf

# set up symlink
./symlinks.sh
