# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# export https_proxy=http://127.0.0.1:8118
# export http_proxy=http://127.0.0.1:8118
export all_proxy=socks5://127.0.0.1:8119

# man use bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export EDITOR="nvim"
export VISUAL="nvim"

# export EDITOR="neovide"
# export VISUAL="neovide"

alias vi="$EDITOR"
alias vim="$EDITOR"

alias icat="kitty +kitten icat"

alias lg="lazygit"

alias ni="neovide"

function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

function joshuto() {
	ID="$$"
	mkdir -p /tmp/$USER
	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
	env joshuto --output-file "$OUTPUT_FILE" $@
	exit_code=$?

	case "$exit_code" in
		# regular exit
		0)
			;;
		# output contains current directory
		101)
			JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
			cd "$JOSHUTO_CWD"
			;;
		# output selected files
		102)
			;;
		*)
			echo "Exit code: $exit_code"
			;;
	esac
}
alias js="joshuto --change-directory"

eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# zoxide
export _ZO_ECHO='1'
unalias z
function z () {
    __zoxide_z "$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/Users/lay/.bun/_bun" ] && source "/Users/lay/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
