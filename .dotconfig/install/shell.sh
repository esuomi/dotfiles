# Install zsh and related tooling
brew install zsh zsh-completions

# Install oh-my-zsh to make things easier
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Switch to zsh
chsh -s /usr/local/bin/zsh
