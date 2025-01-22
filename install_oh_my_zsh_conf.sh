#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

if [ -d "${HOME}/.oh-my-zsh/themes" ]; then
  echo "Installing charly.zsh-theme..."
  ln -sf ${SCRIPT_DIR}/.oh-my-zsh/themes/charly.zsh-theme ${HOME}/.oh-my-zsh/themes/charly.zsh-theme
  sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="charly"/' ${HOME}/.zshrc
fi

cat << EOF >> ${HOME}/.zshrc
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt SHARE_HISTORY
EOF
