# ==============================================================================
# 历史记录
# ==============================================================================
# zsh 历史命令配置，autosuggestions 和 fzf 都依赖历史记录
# HISTFILE: 历史记录文件路径
# HISTSIZE: 内存中保留的历史条数
# SAVEHIST: 写入文件的历史条数
# share_history: 多个终端窗口共享历史
# hist_ignore_all_dups: 有重复时只保留最新一条
# hist_ignore_space: 命令前加空格不记录（用于敏感命令）
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# ==============================================================================
# zsh-completions | 补全增强
# ==============================================================================
# 扩展 zsh 的 Tab 补全候选列表，支持更多命令的参数补全
# 使用方法: 输入命令后按 Tab 键
# 注意: fpath 必须在 compinit 之前，否则补全定义不会被扫描到
fpath=(/opt/homebrew/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -u
# Tab 补全时显示候选菜单，连续按 Tab 可用光标在列表中移动选择
zstyle ':completion:*' menu select
# 补全大小写不敏感，输入 cd dow 可以补出 Downloads
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ==============================================================================
# Starship | 终端提示符
# ==============================================================================
# 跨 shell 的提示符工具，显示当前目录、git 分支、语言版本等
# 配置文件: ~/.config/starship.toml（不创建则使用默认样式）
# 注意: 放在 compinit 之后，避免补全系统冲突
eval "$(starship init zsh)"

# ==============================================================================
# zsh-autosuggestions | 自动建议
# ==============================================================================
# 根据历史命令在光标后显示灰色建议
# 使用方法: 输入时自动出现灰色提示，按 → 或 Ctrl+F 接受
# 注意: 依赖历史记录，上面的 HISTFILE 配置不能少
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ==============================================================================
# zsh-syntax-highlighting | 语法高亮
# ==============================================================================
# 命令输入时实时着色：存在的命令绿色，不存在的红色，字符串高亮等
# 注意: 官方要求必须是最后一个被 source 的插件，否则无法正确高亮其他插件的命令
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==============================================================================
# 快捷键
# ==============================================================================
# Ctrl+F 接受 autosuggestions 的建议（默认是 → 键，Ctrl+F 更顺手）
bindkey '^F' autosuggest-accept

# ==============================================================================
# 别名
# ==============================================================================
# eza | 替代 ls，支持彩色输出、文件图标、目录优先
# 使用方法: ls 普通列表, ll 详细列表, lt 树形视图
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --sort=name"
alias lt="eza --tree --icons --level=2"
