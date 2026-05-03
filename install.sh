#!/bin/bash

# ==============================================================================
# ghostty-terminal-config 一键安装脚本
# ==============================================================================

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.config-backup/$(date +%Y%m%d_%H%M%S)"

# 检查 Homebrew 是否安装
if ! command -v brew &> /dev/null; then
  echo "错误: 未检测到 Homebrew，请先安装: https://brew.sh"
  exit 1
fi

echo "==> 安装 Homebrew 依赖..."
brew install --cask font-maple-mono-nf
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask ghostty
brew install starship fzf zoxide eza bat yazi zsh-autosuggestions zsh-syntax-highlighting zsh-completions

echo "==> 创建配置目录..."
mkdir -p ~/.config/ghostty

# 备份已有配置（真实文件和软链接都备份）
echo "==> 检查已有配置..."
backup_file() {
  local file="$1"
  local name="$2"
  if [ -e "$file" ] || [ -L "$file" ]; then
    mkdir -p "$BACKUP_DIR"
    if [ -L "$file" ]; then
      # 软链接：记录指向的目标路径
      local target
      target="$(readlink "$file")"
      echo "$target" > "$BACKUP_DIR/$name.symlink"
      echo "    备份软链接 $file -> $BACKUP_DIR/$name.symlink (指向 $target)"
    else
      # 真实文件：直接复制
      cp "$file" "$BACKUP_DIR/$name"
      echo "    备份文件 $file -> $BACKUP_DIR/$name"
    fi
  fi
}

backup_file ~/.config/ghostty/config "ghostty-config"
backup_file ~/.config/starship.toml "starship.toml"
backup_file ~/.zshrc ".zshrc"

if [ -d "$BACKUP_DIR" ]; then
  echo "    已有配置已备份到 $BACKUP_DIR"
fi

echo "==> 创建软链接..."
ln -sf "$REPO_DIR/ghostty/config" ~/.config/ghostty/config
ln -sf "$REPO_DIR/starship/starship.toml" ~/.config/starship.toml
ln -sf "$REPO_DIR/zsh/.zshrc" ~/.zshrc

echo "==> 安装完成！请重启 Ghostty 终端生效。"
