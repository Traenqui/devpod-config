#!/usr/bin/env bash

mkdir -p "$ZDOTDIR"
mkdir -p "$XDG_CONFIG_HOME/eza"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"

ln -sf "$DOTFILES/eza/tokyonight.yml" "$XDG_CONFIG_HOME/eza/theme.yml"