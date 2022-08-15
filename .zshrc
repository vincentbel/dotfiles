# uncomment following line and add `zprof` to the end of this file to enable profiling.
# zmodload zsh/zprof

# larger history
SAVEHIST=100000

[ -f ~/.profile ] && source ~/.profile

# zsh function path
fpath=( "$HOME/.zfunctions" $fpath )

# use antigen to manage plugins!
source ~/.zsh/antigen.zsh

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

  TERM_PROGRAM_NAME="Electron" # embed terminal inside vscode
  # <https://apple.stackexchange.com/questions/193437/get-terminal-application-name-from-shell>
  if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
    TERM_PROGRAM_NAME="iTerm2"
  elif [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
    TERM_PROGRAM_NAME="Terminal"
  fi

  # No point in waiting for the command to complete
  notifyme "$TERM_PROGRAM_NAME" "$CMD" "$LAST_EXIT_CODE" &
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  # need to set PROMPT_SUBST in order to make `f_notifyme` works in prompt
  # see more at <http://superuser.com/questions/142099/get-function-into-ps1-zsh>
  setopt PROMPT_SUBST
  export PS1='$(f_notifyme)'$PS1
fi

source ~/.aliases
source ~/.functions

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# fnm: https://github.com/Schniz/fnm
if [[ -x "$(command -v fnm)" ]]; then
  eval "$(fnm env --use-on-cd)"
fi

# https://github.com/denisidoro/navi
if [[ -x "$(command -v navi)" ]]; then
  source <(navi widget zsh)
fi

# fzf <https://github.com/junegunn/fzf>
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
elif  [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  # Debian fzf: <https://github.com/junegunn/fzf/issues/1385#issuecomment-627095222>
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# java verson manager <https://github.com/shyiko/jabba>
if [[ -f ~/.jabba/jabba.sh ]]; then
  zsh-defer source ~/.jabba/jabba.sh
fi

# zprof
