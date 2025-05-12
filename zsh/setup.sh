#!/usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

info "Setting up Zsh configuration..."

substep_info "Creating Zsh and eza config folders..."
mkdir -p "$ZDOTDIR"
mkdir -p "$XDG_CONFIG_HOME/eza"

substep_info "Symlinking Zsh config files..."
symlink "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
symlink "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
symlink "$DOTFILES/zsh/zlogout" "$ZDOTDIR/.zlogout"
symlink "$DOTFILES/zsh/zlogin" "$ZDOTDIR/.zlogin"
symlink "$DOTFILES/zsh/zprofile" "$ZDOTDIR/.zprofile"

substep_info "Symlinking eza theme..."
symlink "$DOTFILES/eza/tokyonight.yml" "$XDG_CONFIG_HOME/eza/theme.yml"

clear_broken_symlinks "$ZDOTDIR"

set_zsh_shell() {
    if echo "$SHELL" | grep --quiet zsh; then
        success "Zsh shell is already set."
    else
        substep_info "Adding Zsh executable to /etc/shells if needed..."
        if grep --fixed-strings --line-regexp --quiet "$(which zsh)" /etc/shells; then
            substep_success "Zsh executable already exists in /etc/shells."
        else
            if which zsh | sudo tee -a /etc/shells >/dev/null; then
                substep_success "Zsh executable added to /etc/shells."
            else
                substep_error "Failed to add Zsh executable to /etc/shells."
                return 1
            fi
        fi

        substep_info "Changing default shell to Zsh..."
        if sudo chsh -s "$(which zsh)" "$USER"; then
            substep_success "Changed default shell to Zsh."
        else
            substep_error "Failed to change default shell to Zsh."
            return 2
        fi
    fi
}

if set_zsh_shell; then
    success "Finished setting up Zsh and eza."
else
    error "Failed to fully set up Zsh."
fi

info "Starting Zsh now to verify configuration..."
exec zsh

