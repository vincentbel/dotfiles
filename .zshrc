# zmodload zsh/zprof
# larger history
SAVEHIST=100000

# add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# add rust
export PATH="$HOME/.cargo/bin:$PATH";

# add `./node_modules/.bin` to `$PATH`
export PATH="./node_modules/.bin:$PATH";

# zsh function path
fpath=( "$HOME/.zfunctions" $fpath )

# use antigen to manage plugins!
source ~/.zsh/antigen/antigen.zsh

# lazy load nvm, extremely fast startup
export NVM_LAZY_LOAD=true

# use antigen init to improve startup
# see more at <https://github.com/zsh-users/antigen/blob/develop/CHANGELOG.md#110---2016-09-10>
antigen init ~/.antigenrc

# bind keyboard shortcuts for history-substring-search
# https://github.com/zsh-users/zsh-history-substring-search#usage
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

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
# need to set PROMPT_SUBST in order to make `f_notifyme` works in prompt
# see more at <http://superuser.com/questions/142099/get-function-into-ps1-zsh>
setopt PROMPT_SUBST
export PS1='$(f_notifyme)'$PS1

source ~/.aliases
source ~/.functions
