#!/bin/bash

########## Set up file for GitHub Codespace ##########
# See more at: <https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account#dotfiles>

printf "\n\n========== Installing fnm ==========\n\n"
# install fnm: https://github.com/Schniz/fnm
curl -fsSL https://fnm.vercel.app/install | bash

printf "\n\n========== Installing fzf ==========\n\n"
# install fzf: https://github.com/junegunn/fzf
sudo apt-get install fzf

printf "\n\n========== Setting up symlinks ==========\n\n"
# set up symlink
./symlink.sh
