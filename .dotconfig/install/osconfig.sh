# Accept native tooling (mainly Git) license
xcode-select --install

# Change default save folder for screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots

# apply changes
killall SystemUIServer
