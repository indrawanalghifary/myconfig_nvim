#!/bin/bash

# Pastikan zsh terinstall
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt update
    sudo apt install -y zsh git curl
fi

# --- Install Oh My Zsh via zsh non-interaktif ---
echo "Installing Oh My Zsh..."
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# --- Set ZSH_CUSTOM path ---
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# --- Install plugins ---
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
        echo "Installing $plugin..."
        git clone https://github.com/zsh-users/$plugin.git "$ZSH_CUSTOM/plugins/$plugin"
    fi
done

# --- Update ~/.zshrc plugins without removing existing ones ---
if grep -q "^plugins=" ~/.zshrc; then
    EXISTING_PLUGINS=$(grep "^plugins=" ~/.zshrc | sed -E 's/plugins=\((.*)\)/\1/')
    NEW_PLUGINS=$(echo "$EXISTING_PLUGINS zsh-autosuggestions zsh-syntax-highlighting" | tr ' ' '\n' | sort -u | tr '\n' ' ')
    sed -i.bak "s/^plugins=.*/plugins=($NEW_PLUGINS)/" ~/.zshrc
else
    echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" >> ~/.zshrc
fi

# --- Change default shell to zsh using sudo ---
if [ "$SHELL" != "$(which zsh)" ]; then
    sudo chsh -s "$(which zsh)" "$USER"
fi

echo "Installation complete! Restart terminal or run 'source ~/.zshrc'."
