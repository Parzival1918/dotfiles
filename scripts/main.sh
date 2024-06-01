#!/bin/bash

get_distro() {
  if [[ -e /etc/os-release ]]; then
    distro=$(cat /etc/os-release | grep ^NAME)
    echo ${distro:6:-1}
  elif [[ -x "$(command -v uname)" ]]; then
    distro=$(uname -o)
    echo ${distro}
  else
    echo "Unknown"
  fi
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

  # polybar
  if ! check_exists "polybar"; then
    sudo apt install polybar
  fi

  # GitHub cli
  if ! check_exists "gh"; then
    (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
  fi

  # rofi
  if ! check_exists "rofi"; then
    sudo apt install rofi
  fi

  # i3 window manager
  if ! check_exists "i3"; then
    sudo apt install i3
  fi

  # install latex utilities
  if ! check_exists "pdflatex"; then
    sudo apt install texlive-full
  fi

  # picom
  if ! check_exists "picom"; then
    sudo apt -y install picom 
  fi

  # feh, wallpapers
  if ! check_exists "feh"; then
    sudo apt install feh
  fi

  # fortune startup app
  if ! check_exists "fortune"; then
    sudo apt install fortune-mod
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

  # polybar
  if ! check_exists "polybar"; then
    pacman -S polybar
  fi

  # GitHub cli
  if ! check_exists "gh"; then
    pacman -S github-cli
  fi

  # rofi
  if ! check_exists "rofi"; then
    pacman -S rofi
  fi

  # i3 window manager
  if ! check_exists "i3"; then
    pacman -S i3-wm
  fi

  # install latex utilities
  if ! check_exists "pdflatex"; then
    pacman -S texlive-basic texlive-latex texlive-latexextra
  fi

  # picom
  if ! check_exists "picom"; then
    pacman -S picom
  fi

  # feh, wallpapers
  if ! check_exists "feh"; then
    pacman -S feh
  fi

  # fortune startup app
  if ! check_exists "fortune"; then
    pacman -S fortune-mod
  fi
else
  echo "Unsupported OS: ${distro}"
fi
