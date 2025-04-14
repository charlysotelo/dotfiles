#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

# Install neovim if it isn't installed already
if ! command -v nvim > /dev/null 2>&1; then
  TEMP_DIR="/tmp/nvim-install"
  BIN_NAME="nvim-linux-$(uname -m)"
  TARBALL_NAME="${BIN_NAME}.tar.gz"
  TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/${TARBALL_NAME}"
  mkdir -p "$TEMP_DIR"
  pushd "$TEMP_DIR"
  curl -LO "$TARBALL_URL"
  mkdir -p "${HOME}/.local"
  tar xzf "${TARBALL_NAME}" --strip-components=1 -C ${HOME}/.local/
  rm -rf $TEMP_DIR
  sed -i '/alias vim='\''nvim'\''/!{$s/$/\nalias vim='\''nvim'\''/}' ~/.zshrc
  popd
fi

# Install NvChad
git clone https://github.com/NvChad/starter ${HOME}/.config/nvim

# Install copilot
git clone https://github.com/github/copilot.vim.git ${HOME}/.config/nvim/pack/github/start/copilot.vim

