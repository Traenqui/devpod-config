#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

sudo -v

info "Installing Brew packages"
brew bundle
success "Finished installing Brewfile packages."

sudo apt-get install xdg-utils -y

