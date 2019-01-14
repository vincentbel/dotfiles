# android
export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/sdk/platform-tools/"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# add `~/.bin` to the `$PATH`
export PATH="$PATH:$HOME/.bin";

# add `~/.local/bin` to the `$PATH`
export PATH="$PATH:$HOME/.local/bin";


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
