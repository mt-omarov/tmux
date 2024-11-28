#!/bin/bash

PWD=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
TPM_URL="https://github.com/tmux-plugins/tpm.git"
TPM_DIR="${PWD}/plugins/tpm"

function install_tpm() {
  mkdir -p "${PWD}/plugins" && cd "$_" &&
    git clone $TPM_URL
  if [ ! -d $TPM_DIR ]; then
    echo "Failed to git clone tpm! Exiting..."
    exit 1
  fi
}

function install_plugins() {
  cd $TPM_DIR && bash -c "source ./scripts/install_plugins.sh"
}

install_tpm
install_plugins
