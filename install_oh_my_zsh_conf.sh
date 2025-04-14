#!/bin/bash
SCRIPT_DIR=$(dirname "$(realpath $0)")

if [ "${INSTALL_OH_MY_ZSH}" = "true" ] && [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo "Installing Oh-My-Zsh..."
  ${SCRIPT_DIR}/install_package.sh -f zsh
  pushd ${HOME}
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  popd
fi

if [ -d "${HOME}/.oh-my-zsh/themes" ]; then
  echo "Installing charly.zsh-theme..."
  ln -sf ${SCRIPT_DIR}/.oh-my-zsh/themes/charly.zsh-theme ${HOME}/.oh-my-zsh/themes/charly.zsh-theme
  sed -i 's/ZSH_THEME="[^"]*"/ZSH_THEME="charly"/' ${HOME}/.zshrc
fi

# Plugins
sed -i -E '/^plugins=/s/.*/plugins=(git kubectl)/' ${HOME}/.zshrc

cat << EOF >> ${HOME}/.zshrc
export HISTSIZE=10000000
export SAVEHIST=10000000
setopt SHARE_HISTORY
EOF

cat << EOF >> ${HOME}/.zshrc
export PATH="${HOME}/.local/bin:${PATH}"
EOF
