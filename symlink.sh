#!/bin/bash

# from: https://github.com/paulirish/dotfiles/blob/master/symlink-setup.sh
# this symlinks all the dotfiles (and .vim/) to ~/
# it also symlinks ~/.bin for easy updating

# this is safe to run multiple times and will prompt you about anything unclear


# this is a messy edit of alrra's nice work here:
#   https://raw.githubusercontent.com/alrra/dotfiles/master/os/create_symbolic_links.sh
#   it should and needs to be improved to be less of a hack.



# jump down to line ~140 for the start.



#
# utils !!!
#

answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

execute() {
  $1 &> /dev/null
  print_result $? "${2:-$1}"
}

get_answer() {
  printf "$REPLY"
}

print_error() {
  # Print output in red
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
  # Print output in purple
  printf "\n\e[0;35m $1\e[0m\n\n"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m"
}

print_result() {
  [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

link() {
  local sourceFile=$1
  local targetFile=$2
  if [ ! -e "$targetFile" ]; then
    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
  else
    if [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
      print_success "$targetFile → $sourceFile"
    else
      if [ "$CODESPACES" == "true" ]; then
        # always overwrite in GitHub Codespace env
        rm -rf "$targetFile"
        execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
      else
        ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
        if answer_is_yes; then
          rm -rf "$targetFile"
          execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        else
          print_error "$targetFile → $sourceFile"
        fi
      fi
    fi
  fi
}

#
# actual symlink stuff
#


# finds all .dotfiles in this folder
declare -a FILES_TO_SYMLINK=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .gitignore | sed -e 's|//|/|' | sed -e 's|./.|.|')
FILES_TO_SYMLINK="$FILES_TO_SYMLINK .vim .atom .bin" # add in vim and the binaries

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  local i=""
  local sourceFile=""
  local targetFile=""

  for i in ${FILES_TO_SYMLINK[@]}; do

    sourceFile="$(pwd)/$i"
    # no need to link all file to $HOME dir
    # just keep the dir stucture. e.g:
    # link: .atom/config.cson -> ~/.atom/config.cson, rather than: .atom/config.cson -> ~/config.cson
    # targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
    targetFile="$HOME/$(printf "%s" "$i")"

    link "$sourceFile" "$targetFile"
  done
}

main

# neovim config file
# https://neovim.io/doc/user/starting.html#config
mkdir -p "$HOME/.config/nvim"
link "$(pwd)/neovim-config.vim" "$HOME/.config/nvim/init.vim"

if [[ "$OSTYPE" == "darwin"* ]]; then
  # vscode config location:
  # https://code.visualstudio.com/docs/getstarted/settings#_settings-file-locations
  link "$(pwd)/.vscode" "$HOME/Library/Application Support/Code/User"

  # espanso config
  # https://espanso.org/docs/sync/
  link "$(pwd)/.espanso" "$HOME/Library/Preferences/espanso"

  #　Rime config location:
  # <https://github.com/rime/home/wiki/RimeWithSchemata#rime-%E4%B8%AD%E7%9A%84%E6%95%B8%E6%93%9A%E6%96%87%E4%BB%B6%E5%88%86%E4%BD%88%E5%8F%8A%E4%BD%9C%E7%94%A8>
  for filePath in ./rime/*.yaml; do
    filename=$(basename "$filePath")
    link "$(pwd)/rime/$filename" "$HOME/Library/Rime/$filename"
  done
fi
