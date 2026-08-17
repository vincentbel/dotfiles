# shared profile
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

# local profile
if [[ -f ~/.profile.local ]]; then
  source ~/.profile.local
fi
