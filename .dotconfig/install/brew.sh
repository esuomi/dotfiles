# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/dupes # OSX system tool duplicates
brew update
brew upgrade

# Install packages

apps=(
  ansible
  coreutils
  fswatch
  gnu-sed
  gnupg
  htop-osx
  jq
  leiningen
  libksba
  maven
  node
  python
  rethinkdb
  the_silver_searcher
  tmux
  watch
  zsh
)
brew install "${apps[@]}"
