#!/bin/bash

# git tools
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# editors
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
code --install-extension "1yib.rust-bundle"
code --install-extension "charliermarsh.ruff"
code --install-extension "dustypomerleau.rust-syntax"
code --install-extension "github.copilot"
code --install-extension "github.copilot-chat"
code --install-extension "julialang.language-julia"
code --install-extension "ms-python.debugpy"
code --install-extension "ms-python.python"
code --install-extension "ms-python.vscode-pylance"
code --install-extension "rust-lang.rust-analyzer"
code --install-extension "serayuzgur.crates"

