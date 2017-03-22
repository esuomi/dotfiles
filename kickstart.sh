#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install package managers and managed tools

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"

# Install python preset virtualenvs

. "$DOTFILES_DIR/install/python/virtualenv.sh openstack-dev"
. "$DOTFILES_DIR/install/python/virtualenv.sh aws-dev"

# Post-installation configuration steps

. "$DOTFILES_DIR/install/post.sh"
