# load SSH keys into the keychain
ssh-add -A 2>/dev/null;

# jump straight to Kapsi IRC
alias irc="ssh -i ~/.ssh/id_rsa_hetzner esuomi@irc.induct.io -t screen -rdU"

# Java 1.8 is my thing right now
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Maven is a memory hog
export MAVEN_OPTS="-Xmx1024m -Xms512m"
export EDITOR='vi'

# Allow the use of cmdline tools with Postgres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Path to your oh-my-zsh installation.
export ZSH=/Users/esko.suomi/.oh-my-zsh

# clean all merged branches (compares to current branch)
function git-scrub() {
  git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d
}

ZSH_THEME="robbyrussell"

# dotgit or how I actually store these configs
alias dotgit='/usr/bin/git --git-dir=/Users/esko.suomi/.cfg/ --work-tree=/Users/esko.suomi'

# zsh plugins
plugins=(brew brew-cask docker docker-compose git gradle lein mvn)

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# added by travis gem
[ -f /Users/esko.suomi/.travis/travis.sh ] && source /Users/esko.suomi/.travis/travis.sh
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

### zsh extensions

# Additional completion definitions for Zsh.
fpath=(/usr/local/share/zsh-completions $fpath)

# Fish-like fast/unobtrusive autosuggestions for zsh.
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fish shell-like syntax highlighting for Zsh.
# NOTE: Must be at the end of .zshrc!
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
