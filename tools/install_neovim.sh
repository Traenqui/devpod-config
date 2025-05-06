#! /usr/bin/env sh

if command -v nvim >/dev/null 2>&1; then
    echo "Neovim is already installed. Skipping build and install."
    exit 0
fi

git clone -b v0.10.3 https://github.com/neovim/neovim.git $HOME/repos/tools/neovim

sudo apt update
sudo apt install cmake gettext lua5.1 liblua5.1-0-dev -y

cd $HOME/repos/tools/neovim || exit 1
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install