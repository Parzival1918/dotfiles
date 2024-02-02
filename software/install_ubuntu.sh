#!/usr/bin/bash

# Install all software to new ubuntu machine
# REMEMBER TO RUN AS sudo
apt update

echo "Install all rust components"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Install shells"
cargo install nu

apt-add-repository ppa:fish-shell/release-3
apt install fish

echo "Install editors"
add-apt-repository ppa:maveonair/helix-editor
apt install helix

echo "Install terminal emulators"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo "Install WM and utils"
apt install i3

apt install polybar

apt install rofi

echo "Install git tools"
cargo install gitui

type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
