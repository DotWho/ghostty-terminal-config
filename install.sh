#!/bin/bash

# ==============================================================================
# ghostty-terminal-config 一键安装脚本
# ==============================================================================

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> 安装 Homebrew 依赖..."
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask ghostty
brew install starship fzf zoxide eza bat yazi zsh-autosuggestions zsh-syntax-highlighting zsh-completions

echo "==> 创建配置目录..."
mkdir -p ~/.config/ghostty

echo "==> 创建软链接..."
ln -sf "$REPO_DIR/ghostty/config" ~/.config/ghostty/config
ln -sf "$REPO_DIR/starship/starship.toml" ~/.config/starship.toml
ln -sf "$REPO_DIR/zsh/.zshrc" ~/.zshrc

echo "==> 安装完成！请重启 Ghostty 终端生效。"
