# Ghostty Terminal Config

macOS 下基于 Ghostty + Starship + zsh 插件的终端美化方案，从 iTerm2 + oh-my-zsh 迁移而来，更轻量更快。

## 效果

- 彩虹条提示符（椭圆 + 箭头风格，Catppuccin Mocha 配色）
- 半透明毛玻璃窗口
- 语法高亮、自动建议、模糊搜索

## 包含的配置文件

| 文件 | 说明 | 软链接目标 |
|------|------|-----------|
| `ghostty/config` | Ghostty 终端配置（字体、主题、窗口、光标） | `~/.config/ghostty/config` |
| `starship/starship.toml` | Starship 彩虹条提示符配置 | `~/.config/starship.toml` |
| `zsh/.zshrc` | zsh 配置（插件、工具、别名、快捷键） | `~/.zshrc` |

## 依赖

| 工具 | 用途 |
|------|------|
| [Ghostty](https://ghostty.org) | GPU 加速终端模拟器 |
| [Starship](https://starship.rs) | 跨 shell 提示符 |
| [fzf](https://github.com/junegunn/fzf) | 模糊搜索（Ctrl+R 搜历史，Ctrl+T 搜文件） |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | 智能目录跳转（`z foo` 代替 `cd`） |
| [eza](https://github.com/eza-community/eza) | 替代 ls，彩色图标 |
| [bat](https://github.com/sharkdp/bat) | 替代 cat，语法高亮 |
| [yazi](https://github.com/sxyazi/yazi) | 终端文件管理器 |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | 历史命令自动建议 |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | 命令语法高亮 |
| [zsh-completions](https://github.com/zsh-users/zsh-completions) | Tab 补全增强 |
| [JetBrainsMono Nerd Font](https://www.nerdfonts.com) | 终端字体（含图标） |

## 一键安装

```bash
git clone https://github.com/justhalfbit/ghostty-terminal-config.git
cd ghostty-terminal-config
./install.sh
```

## 手动安装

### 1. 安装依赖

```bash
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask ghostty
brew install starship fzf zoxide eza bat yazi zsh-autosuggestions zsh-syntax-highlighting zsh-completions
```

### 2. 创建软链接

```bash
mkdir -p ~/.config/ghostty
ln -sf $(pwd)/ghostty/config ~/.config/ghostty/config
ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
```

### 3. 重启 Ghostty 终端

## 快捷键速查

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+F` | 接受自动建议 |
| `Ctrl+R` | fzf 模糊搜索历史命令 |
| `Ctrl+T` | fzf 模糊搜索文件 |
| `Alt+C` | fzf 模糊搜索目录并 cd |
| `Tab` | 补全，连续按在候选列表中移动 |

## 别名速查

| 别名 | 实际命令 |
|------|---------|
| `ls` | `eza --icons --group-directories-first` |
| `ll` | `eza -l --icons --sort=name` |
| `lt` | `eza --tree --icons --level=2` |
| `cat` | `bat --paging=never` |
| `y` | yazi 文件管理器（退出自动 cd） |
| `z foo` | zoxide 智能跳转到包含 foo 的目录 |
