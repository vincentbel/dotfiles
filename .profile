# homebrew
export PATH="$PATH:/opt/homebrew/bin/"

# android
export ANDROID_HOME="/usr/local/opt/android-sdk"
export PATH="$PATH:$ANDROID_HOME/sdk/platform-tools/"

# rust
export PATH="$PATH:$HOME/.cargo/bin"

# add `~/.bin` to the `$PATH`
export PATH="$PATH:$HOME/.bin";

# add `~/.local/bin` to the `$PATH`
export PATH="$PATH:$HOME/.local/bin";

# deno <https://deno.land>
export PATH="/$HOME/.deno/bin:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
if [[ "$OSTYPE" != "darwin"* ]]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
fi

# fnm: https://github.com/Schniz/fnm
if [[ -x "$(command -v fnm)" ]]; then
  eval "$(fnm env --use-on-cd)"
fi

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
