#!/bin/bash

## SCRIPT INPUTS ##

# BINARY_NAME/CRATE_NAME
To_Install=('bob/bob-nvim' 'hx/hx' 'bat/bat' 'mise/mise' 'starship/starship' 'nu/nu' 'typst/typst-cli' 'exa/exa' 'z/zoxide' 'gitui/gitui' 'mdbook/mdbook' 'eza/eza' 'sd/sd' 'pastel/pastel' 'ouch/ouch' 'kalker/kalker' 'presenterm/presenterm' 'crabz/crabz' 'rg/ripgrep')

###################


check_exists() {
  if [[ -x "$(command -v $1)" ]]; then
    echo "- '$1' is already installed"
    return 0
  else
    echo "- '$1' is not installed"
    return 1
  fi
}

install_rust() { # 1: binary name, 2: binary crate name
  if ! check_exists "$1"; then
    echo "  |- Installing rust tool '$1' with 'cargo install -q --locked $2'"
    cargo install -q --locked $2
  fi
}

# Make sure that 'rustup' toolchain is installed so we can use 'cargo'
if ! check_exists "rustup"; then
  echo "- Installing 'rustup' toolchain"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# Install Rust tools
declare -i count
count=0
for i in "${To_Install[@]}"; do
  IFS='/' read -r -a name <<< "$i"
  install_rust "${name[0]}" "${name[1]}"
  if [[ $? ]]; then
    count+=1
  fi
done

echo "Number of installed tools: ${count}/${#To_Install[@]}"
