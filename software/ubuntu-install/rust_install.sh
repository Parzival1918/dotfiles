#!/bin/bash

# Install rust components
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


function install {
  cargo install --list | grep $1

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    cargo install --locked $1
  else
    echo "Already installed: ${1}"
  fi
}

# shells
install nu
install starship

# git tools
install gitui

# dev tools
install mdbook
install bacon
install mise

# music
install termusic
install ncspot

# file managers
install yazi-fm
install zoxide

# extra
install bat
install exa
install du-dust
install mprocs
install ripgrep
install speedtest-rs
install wiki-tui
