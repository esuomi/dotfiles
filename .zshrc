# load SSH keys into the keychain
ssh-add -A 2>/dev/null;

# jump straight to Kapsi IRC
alias irc="ssh -i ~/.ssh/id_rsa esuomi@kapsi.fi -t screen -rdU"

###                                                 ###
# env customizations for various tools etc that I use #
###                                                 ###
# Java 1.8 is my thing right now
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# Maven is a memory hog
export MAVEN_OPTS="-Xmx1024m -Xms512m"
export EDITOR='vi'

# Allow the use of cmdline tools with Postgres.app
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Path to your oh-my-zsh installation.
export ZSH=/Users/esko.suomi/.oh-my-zsh

###                                           ###
# Shell conf automation so that I don't have to #
###                                           ###
# reload ssh keys automatically to SSH agent on session start (eg. first terminal window opened after machine restart)
# TODO: check multiple keys automagically
#added_keys=`ssh-add -l`
#if [ ! $(echo $added_keys | grep -o -e my_key) ]; then
#    ssh-add "$HOME/.ssh/my_key"
#fi

###         ###
# Git helpers #
###         ###
# clean all merged branches (compares to current branch)
function git-scrub() {
  git branch --merged | grep -v "\*" | grep -v master | grep -v dev | xargs -n 1 git branch -d
}

###                      ###
# Python virtualenv config #
###                      ###
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

###            ###
# Docker helpers #
###            ###
function docker-scrub() {
  # Delete all stopped containers
  docker ps -q -f status=exited | xargs --no-run-if-empty docker rm
  # Delete all dangling (unused) images
  docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi
}

###                                                          ###
# Powerline theme and its customizations for zsh               #
# https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme #
###                                                          ###
ZSH_THEME="robbyrussell"
#ZSH_THEME="powerline"
#POWERLINE_RIGHT_B="none"
#POWERLINE_RIGHT_A="exit-status-on-fail"
#POWERLINE_SHORT_HOST_NAME="true"
#POWERLINE_NO_BLANK_LINE="true"
#POWERLINE_CUSTOM_CURRENT_PATH="%3~"
#POWERLINE_SHOW_GIT_ON_RIGHT="true"
#POWERLINE_DETECT_SSH="true"

###                                          ###
# dotgit or how I actually store these configs #
###                                          ###
alias dotgit='/usr/bin/git --git-dir=/Users/esko.suomi/.cfg/ --work-tree=/Users/esko.suomi'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew brew-cask docker docker-compose git gradle lein mvn)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
