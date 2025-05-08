#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")
${SCRIPT_DIR}/install_tmux_conf.sh
${SCRIPT_DIR}/install_oh_my_zsh_conf.sh
${SCRIPT_DIR}/install_nvim_conf.sh
${SCRIPT_DIR}/install_atuin.sh
${SCRIPT_DIR}/git_cfg.sh
