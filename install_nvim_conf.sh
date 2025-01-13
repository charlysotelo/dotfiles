#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install NvChad
git clone https://github.com/NvChad/starter ${HOME}/.config/nvim

# Install copilot
git clone https://github.com/github/copilot.vim.git ${HOME}/.config/nvim/pack/github/start/copilot.vim

