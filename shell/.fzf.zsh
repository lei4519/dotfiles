# sbtrkt fuzzy-match	Items that match sbtrkt 与 sbtrkt 匹配的项目
# 'wild exact-match (quoted) 完全匹配（引用）	Items that include wild 包含 wild 的项目
# ^music prefix-exact-match 前缀精确匹配	Items that start with music 以 music 开头的项目
# .mp3$	suffix-exact-match 后缀精确匹配	Items that end with .mp3 以 .mp3 结尾的项目
# !fire	inverse-exact-match 逆向精确匹配	Items that do not include fire 不包含 fire 的项目
# !^music	inverse-prefix-exact-match 反向前缀精确匹配	Items that do not start with music 不以 music 开头的项目
# !.mp3$	inverse-suffix-exact-match 反向后缀精确匹配	Items that do not end with .mp3 不以 .mp3 结尾的项目

# Setup fzf

export FZF_DEFAULT_OPTS="
--ansi 
--bind ctrl-d:page-down,ctrl-u:page-up
--preview '~/dotfiles/shell/fzf-preview.sh {}'
"
# --bind 'enter:become(nvim {})'

# https://github.com/sharkdp/fd?tab=readme-ov-file#using-fd-with-fzf
export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
# https://github.com/sharkdp/fd?tab=readme-ov-file#using-fd-with-rofi
# 与 rofi 一起使用
# fd --type f -e pdf . $HOME | rofi -keep-right -dmenu -i -p FILES -multi-select | xargs -I {} xdg-open {}

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}


eval "$(fzf --zsh)"
