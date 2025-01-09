#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

if [ -d "${HOME}/.oh-my-zsh/themes" ]; then
  ln -sf ${SCRIPT_DIR}/.oh-my-zsh/themes/charly.zsh-theme ~/.oh-my-zsh/themes/charly.zsh-theme
  sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="charly"/' ~/.zshrc
fi
