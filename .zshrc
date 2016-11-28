# load SSH keys into the keychain
ssh-add -A 2>/dev/null;

# jump straight to Kapsi IRC
alias irc="ssh -i ~/.ssh/id_rsa esuomi@kapsi.fi -t screen -rdU"

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

# python/virtualenv configs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code/python
source /usr/local/bin/virtualenvwrapper.sh
# matplotlib frameworkpython workaround for virtualenv
# http://matplotlib.org/faq/virtualenv_faq.html#pythonhome-function
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# Docker helpers
function docker-scrub() {
  # Delete all stopped containers
  docker ps -q -f status=exited | xargs --no-run-if-empty docker rm
  # Delete all dangling (unused) images
  docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi
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
