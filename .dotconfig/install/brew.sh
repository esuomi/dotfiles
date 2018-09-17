# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off       # First things first, disable brew's pointless tracking
brew tap homebrew/dupes  # OSX system tool duplicates
brew update
brew upgrade

# Install packages

apps=(
  coreutils
  f3
  fswatch
  gawk
  gnu-sed
  gnupg
  htop
  jenv
  jq
  plantuml
  the_silver_searcher
  tree
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)
brew install "${apps[@]}"

# Update pip to latest
pip install --upgrade pip
