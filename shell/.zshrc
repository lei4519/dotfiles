
# 获取当前操作系统信息
os=$(uname -s)

# 判断操作系统是 Mac 还是 Linux
if [[ $os == "Darwin" ]]; then
  source ~/dotfiles/shell/mac-os.zsh
elif [[ $os == "Linux" ]]; then
  source ~/dotfiles/shell/linux-os.zsh
fi

#Display Pokemon
# https://gitlab.com/phoneybadger/pokemon-colorscripts
# pokemon-colorscripts --no-title -r 1,3,6
# https://github.com/aflaag/pokemon-icat?tab=readme-ov-file
~/pokemon-icat/bin/pokemon-icat

# bun completions
[ -s "/Users/lay/.bun/_bun" ] && source "/Users/lay/.bun/_bun"

source ~/dotfiles/shell/proxy.zsh
source ~/dotfiles/shell/antigen.zsh
source ~/dotfiles/shell/antigen-packages.zsh
source ~/dotfiles/shell/alias_and_export.zsh
# 两者的顺序很重要，vim-mode-conf 应该最后被调用
source ~/dotfiles/shell/autocomplete-conf.zsh
source ~/dotfiles/shell/vim-mode-conf.zsh

# 由 vim-mode-conf 调用
# source ~/dotfiles/shell/.fzf.zsh

eval "$(fnm env --use-on-cd)"
eval "$(zoxide init --cmd cd zsh)"
# eval "$(starship init zsh)"

source ~/.p10k.zsh

# Created by `pipx` on 2024-05-13 09:16:03
export PATH="$PATH:/Users/lay/.local/bin"
