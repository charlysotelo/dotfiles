# Install atuin if it isn't installed already
if ! command -v atuin > /dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
  sed -i 's/(atuin init zsh)/(atuin init zsh --disable-up-arrow)/g' ~/.zshrc
  source ${HOME}/.atuin/bin/env
fi

if [ "${ATUIN_PERSONAL_LOGIN}" = "true" ]; then
  echo "Key is ${ATUIN_KEY}"
  atuin login -u ${ATUIN_USERNAME} -p ${ATUIN_PASSWORD} -k "${ATUIN_KEY}"
  atuin sync
fi

