#!/usr/bin/bash

git clone -b v0.10.3 https://github.com/neovim/neovim.git $HOME/repos/tools/neovim
sudo apt install cmake gettext lua5.1 liblua5.1-0-dev -y

cd $HOME/repos/tools/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install