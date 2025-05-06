#! /usr/bin/env sh

git clone -b 3.5a https://github.com/tmux/tmux.git $HOME/repos/tools/tmux
sudo apt install libevent-dev ncurses-dev build-essential bison pkg-config -y

cd $HOME/repos/tools/tmux
sh ./autogen.sh
./configure && make
sudo make install