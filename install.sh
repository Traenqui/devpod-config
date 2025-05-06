#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. scripts/functions.sh
. zsh/zshenv

echo -e "
${yellow}
 _   _ _                 _         
| | | | |               | |        
| | | | |__  _   _ _ __ | |_ _   _ 
| | | | '_ \| | | | '_ \| __| | | |
| |_| | |_) | |_| | | | | |_| |_| |
 \___/|_.__/ \__,_|_| |_|\__|\__,_|
 _________________________________
|                                 |
|       Traenqui's dotfiles       |
|_________________________________|
"

info "Prompting for sudo password..."
if sudo -v; then
    # Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
    success "Sudo credentials updated."
else
    error "Failed to obtain sudo credentials."
    exit
fi

# Needed for later setups
./packages/setup.sh

find * -name "setup.sh" -not -wholename "packages*" | while read setup; do
    ./$setup
done

. tools/install_neovim.sh
# . tools/install_tmux.sh
# zsh

success "Finished installing Dotfiles"