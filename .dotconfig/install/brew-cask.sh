# Install Caskroom for Homebrew

brew tap caskroom/cask
brew install brew-cask

# Install packages

apps=(
  acorn                
  ccleaner             
  font-hack
  obs
  sublime-text3
  atom         
  docker
  rowanj-gitx
  spectacle
  visualvm
  audacity
  dropbox
  google-chrome
  spotify
  beyond-compare
  flux
  intellij-idea
  steam
  lighttable
)

brew cask install "${apps[@]}"
