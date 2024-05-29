#!/bin/bash

get_distro() {
  if [[ -e /etc/os-release ]]; then
    distro=$(cat /etc/os-release | grep ^NAME)
  fi
  echo ${distro:6:-1}
}

check_exists() {
  if [[ -x "$(command -v $1)" ]]; then
    echo "- '$1' is already installed"
    return 0
  else
    echo "- '$1' is not installed"
    return 1
  fi
}

distro=$(get_distro)

if [[ "${distro}" == "Ubuntu" ]]; then
  echo "Detected Ubuntu"

  # fish shell
  if ! check_exists "fish"; then
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish

    # set default shell as fish
    echo "/usr/local/bin/fish" >> /etc/shells
    chsh -s /usr/local/bin/fish
  fi

  # kitty terminal
  if ! check_exists "kitty"; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    # symlink kitty and kitten binaries
    ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty 
    ln -s ~/.local/kitty.app/bin/kitten /usr/bin/kitten
  fi
elif [[ "${distro}" == "Arch" ]]; then
  echo "Detected Arch"

  # fish shell
  if ! check_exists "fish"; then
    pacman -S fish

    # set default shell as fish
    echo "/usr/local/bin/fish" >> /etc/shells
    chsh -s /usr/local/bin/fish
  fi

  # kitty terminal
  if ! check_exists "kitty"; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

    # symlink kitty and kitten binaries
    ln -s ~/.local/kitty.app/bin/kitty /usr/bin/kitty 
    ln -s ~/.local/kitty.app/bin/kitten /usr/bin/kitten
  fi
else
  echo "Unsupported OS"
fi
