#!/bin/bash

# Install rust components
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


function install {
  cargo install --list | grep $1

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    cargo install $1
  else
    echo "Already installed: ${1}"
  fi
}

# shells
install nu

# git tools
install gitui

# dev tools
install mdbook

# music
install termusic

# file managers
install yazi-fm
install zoxide
