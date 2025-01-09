#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf
