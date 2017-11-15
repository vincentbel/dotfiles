# System Preference > Keyboard


defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Fn key as standard function key:
# 0 -> yes
# 1 -> no
defaults write NSGlobalDomain "com.apple.keyboard.fnState" -int 0
