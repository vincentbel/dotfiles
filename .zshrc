# zmodload zsh/zprof
# larger history
SAVEHIST=100000

# add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# zsh function path
fpath=( "$HOME/.zfunctions" $fpath )

# use antigen to manage plugins!
source ~/.zsh/antigen/antigen.zsh

# load the oh-my-zsh's library.
# don't load oh-my-zsh lib, takes too long
# antigen use oh-my-zsh

local b="antigen-bundle"

$b robbyrussell/oh-my-zsh lib/git.zsh
$b git

# guess what to install when running an unknown command.
# $b command-not-found

# homebrew  - autocomplete on 'brew install'
# $b brew
# $b brew-cask

# tracks your most used directories, based on 'frecency'.
$b rupa/z z.sh

# syntax highlighting bundle.
$b zsh-users/zsh-syntax-highlighting

# history search
$b zsh-users/zsh-history-substring-search

# auto suggestions
$b zsh-users/zsh-autosuggestions

# use pure,
# https://github.com/sindresorhus/pure#antigen
$b mafredri/zsh-async
$b sindresorhus/pure

# install nvm
$b lukechilds/zsh-nvm

# don't set a theme, because pure does it for you
# antigen theme agnoster

# tell antigen that you're done.
antigen apply

# bind keyboard shortcuts for history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search#usage
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# set default user to shorter prompt style
# https://gist.github.com/kevin-smets/8568070#shorter-prompt-style
# already setted by sindresorhus/pure
# DEFAULT_USER="VincentBel"

# show macOS notification when long running command finishes
# and your terminal is not in focus
# http://frantic.im/notify-on-completion
function f_notifyme {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notifyme "$CMD" "$LAST_EXIT_CODE" &
}
#  export PS1='$(f_notifyme)'$PS1


source ~/.aliases
source ~/.functions
