# create python virtualenv with given name and install preset tools from conf file with matching name

if [ $# -lt 1 ]; then
  echo "This script should be called with a single param which defines the name of the virtualenv to install"
  exit 1
fi

VIRTUALENV_NAME=$1

# exit current virtualenv if in one
if [[ "$VIRTUAL_ENV" != "" ]]; then
  echo "in virtualenv, exiting to avoid duplicating dep installs on multiple levels"
  deactivate
fi

# install virtualenv as global if not already installed
if pip freeze | cut -d '=' -f 1 | grep -q -e "^virtualenv$"; then
  echo 'virtualenv already installed'
else
  echo 'installing virtualenv'
  pip install virtualenv
fi
echo "Activating virtualenv..."
source /usr/local/bin/virtualenvwrapper.sh

echo "creating virtualenv $VIRTUALENV_NAME"
mkvirtualenv $VIRTUALENV_NAME

VIRTUALENV_REQS=$(dirname "$(realpath "$0")")/${VIRTUALENV_NAME}.txt
echo "populating $VIRTUALENV_NAME with requirements from config file $VIRTUALENV_REQS"
workon $VIRTUALENV_NAME
pip install -r $VIRTUALENV_REQS
echo "$VIRTUALENV_NAME requirements installed"
deactivate $VIRTUALENV_NAME
