# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off       # First things first, disable brew's pointless tracking
brew tap homebrew/dupes  # OSX system tool duplicates
brew update
brew upgrade

# Install packages

apps=(
  coreutils
  fswatch
  gnu-sed
  gnupg
  htop-osx
  jq
  leiningen
  boot-clj
  libksba
  maven
  node
  python
  rethinkdb
  the_silver_searcher
  tmux
  watch
  zsh
  s3cmd
  groovy
)
brew install "${apps[@]}"
