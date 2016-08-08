# backup old machine's key items

mkdir -p ~/migration/home
cd ~/migration

brew leaves      		> brew-list.txt    # all top-level brew installs
brew cask list 			> cask-list.txt
npm list -g --depth=0 	> npm-g-list.txt

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)


cp ~/.z ~/migration/home # z history file
cp -R ~/.ssh ~/migration/home # ssh
cp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration  # wifi
