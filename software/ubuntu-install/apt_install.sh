#!/bin/bash

# Inspired from https://github.com/victoriadrake/dotfiles/
# Update Ubuntu and get standard repository programs
#sudo apt update && sudo apt full-upgrade -y

function install { # 1: apt package name, 2: bin name
  which $2 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# shells
apt-add-repository ppa:fish-shell/release-3
install fish fish

# Text editors
add-apt-repository ppa:maveonair/helix-editor
install helix hx

# WM and utils
install i3 i3
install polybar polybar
install rofi rofi
