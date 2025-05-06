#! /usr/bin/env sh

default="\033[39m"
black="\033[30m"
red="\033[0;31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"
light_gray="\033[37m"
dark_gray="\033[90m"
light_red="\033[91m"
light_green="\033[92m"
light_yellow="\033[93m"
light_blue="\033[94m"
light_magenta="\033[95m"
light_cyan="\033[96m"
white="\033[97m"

symlink() {
    OVERWRITTEN=""
    if [ -e "$2" ] || [ -h "$2" ]; then
        OVERWRITTEN="(Overwritten)"
        if ! rm -r "$2"; then
            substep_error "Failed to remove existing file(s) at $2."
        fi
    fi
    if ln -sf "$1" "$2"; then
        substep_success "Symlinked $2 to $1. $OVERWRITTEN"
    else
        substep_error "Symlinking $2 to $1 failed."
    fi
}

clear_broken_symlinks() {
    find -L "$1" -type l | while read fn; do
        if rm "$fn"; then
            substep_success "Removed broken symlink at $fn."
        else
            substep_error "Failed to remove broken symlink at $fn."
        fi
    done
}

coloredEcho() {
    local exp="$1"
    local color="$2"
    local arrow="$3"

    # Normalize color name
    color=$(echo "$color" | tr '[:upper:]' '[:lower:]')

    # Select color code
    case "$color" in
        default) color_code="$default" ;;
        black) color_code="$black" ;;
        red) color_code="$red" ;;
        green) color_code="$green" ;;
        yellow) color_code="$yellow" ;;
        blue) color_code="$blue" ;;
        magenta) color_code="$magenta" ;;
        cyan) color_code="$cyan" ;;
        light_gray) color_code="$light_gray" ;;
        dark_gray) color_code="$dark_gray" ;;
        light_red) color_code="$light_red" ;;
        light_green) color_code="$light_green" ;;
        light_yellow) color_code="$light_yellow" ;;
        light_blue) color_code="$light_blue" ;;
        light_magenta) color_code="$light_magenta" ;;
        light_cyan) color_code="$light_cyan" ;;
        white) color_code="$white" ;;
        *) color_code="$default" ;;
    esac

    # Use printf to properly interpret color codes
    printf "%b%b %s%b\n" "\033[1m" "$color_code$arrow" "$exp" "\033[0m"
}


info() {
    coloredEcho "$1" blue "========>"
}

success() {
    coloredEcho "$1" green "========>"
}

error() {
    coloredEcho "$1" red "========>"
}

substep_info() {
    coloredEcho "$1" magenta "===="
}

substep_success() {
    coloredEcho "$1" cyan "===="
}

substep_error() {
    coloredEcho "$1" red "===="
}