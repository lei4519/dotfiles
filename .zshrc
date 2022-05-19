export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export EDITOR="lvim"
export VISUAL="lvim"

alias taskbiz="cd /Users/lay/work/ad-taskbiz-web && yarn start"
alias zhiadmin="cd /Users/lay/work/ad-zhitask-admin-web && yarn start"
alias zhitask="cd /Users/lay/work/zhitask-site/packages/biz && yarn start"
alias zhihome="cd /Users/lay/work/zhitask-site/packages/home && yarn start"

# alias lvim="/Users/lay/.local/bin/lvim"
export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$HOME/.local/share/lunarvim"}"
export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$HOME/.config/lvim"}"
export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$HOME/.cache/lvim"}"
alias nl="neovide -- -u "$LUNARVIM_RUNTIME_DIR/lvim/init.lua""

alias vi="$EDITOR"
alias vim="$EDITOR"
alias python="/usr/bin/python3"
alias lg="lazygit"
# alias ra=". ~/.zshrc; ranger"
alias ra=". ranger"
alias ze="zellij"

alias ssh-connect="ssh root@43.138.102.54"

# eval "$(zellij setup --generate-auto-start zsh)"
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
