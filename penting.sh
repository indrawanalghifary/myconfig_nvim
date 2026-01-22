#!/bin/bash
set -e

################################
# Basic packages
################################
echo "==> Update system"
sudo apt update

echo "==> Install build-essential & dependencies"
sudo apt install -y \
  build-essential \
  curl \
  wget \
  git \
  ca-certificates \
  zsh \
  locale-gen id_ID.UTF-8 \
  update-locale LANG=id_ID.UTF-8 \
  timedatectl set-timezone Asia/Jakarta

################################
# Ensure zshrc exists
################################
touch ~/.zshrc

################################
# Install Neovim Nightly
################################
NVIM_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz"
ARCHIVE="nvim-linux-x86_64.tar.gz"
INSTALL_DIR="/opt/nvim"

echo "==> Download Neovim nightly"
wget -O "$ARCHIVE" "$NVIM_URL"

echo "==> Extract Neovim"
tar xzvf "$ARCHIVE"

echo "==> Install Neovim"
sudo rm -rf "$INSTALL_DIR"
sudo mv nvim-linux-x86_64 "$INSTALL_DIR"
sudo ln -sf "$INSTALL_DIR/bin/nvim" /usr/local/bin/nvim

################################
# Set Neovim as default editor
################################
echo "==> Set Neovim as default editor"

if ! grep -q "EDITOR=nvim" ~/.zshrc; then
  cat <<'EOF' >> ~/.zshrc

# Default editor
export EDITOR=nvim
export VISUAL=nvim
EOF
fi

if command -v update-alternatives >/dev/null 2>&1; then
  sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 100
  sudo update-alternatives --set editor /usr/local/bin/nvim
fi

################################
# Install NVM
################################
echo "==> Install NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

################################
# Load NVM for this script
################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

################################
# Ensure NVM in zshrc
################################
if ! grep -q "NVM_DIR" ~/.zshrc; then
  cat <<'EOF' >> ~/.zshrc

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF
fi

################################
# Install Node.js LTS
################################
echo "==> Install Node.js LTS"
nvm install --lts
nvm use --lts
nvm alias default lts/*

################################
# Install Astral uv
################################
echo "==> Install Astral uv"
curl -LsSf https://astral.sh/uv/install.sh | sh

################################
# Load uv path
################################
export PATH="$HOME/.local/bin:$PATH"

################################
# Ensure uv in zshrc
################################
if ! grep -q ".local/bin" ~/.zshrc; then
  cat <<'EOF' >> ~/.zshrc

# Astral uv
export PATH="$HOME/.local/bin:$PATH"
EOF
fi

################################
# Install Python via uv
################################
echo "==> Install latest Python via uv"
uv python install
uv python pin

################################
# Cleanup
################################
rm -f "$ARCHIVE"

echo "================================="
echo "Setup selesai 🎉"
echo "Restart terminal atau jalankan:"
echo "source ~/.zshrc"
echo "================================="
