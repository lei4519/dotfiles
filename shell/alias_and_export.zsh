
# man use bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# export EDITOR="neovide"
# export VISUAL="neovide"
export EDITOR="nvim"
export VISUAL="nvim"
export ZVM_VI_EDITOR="$EDITOR"

alias icat="kitty +kitten icat"


export BAT_THEME="Dracula"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export YAZI_CONFIG_HOME="$HOME/dotfiles/terminal/file-manager/yazi"

alias vi="$EDITOR"
alias vim="$EDITOR"

alias icat="kitty +kitten icat"

alias lg="lazygit"

alias ni="neovide"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	  /usr/bin/cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias f="yy"

# function joshuto() {
# 	ID="$$"
# 	mkdir -p /tmp/$USER
# 	OUTPUT_FILE="/tmp/$USER/joshuto-cwd-$ID"
# 	env joshuto --output-file "$OUTPUT_FILE" $@
# 	exit_code=$?
#
# 	case "$exit_code" in
# 		# regular exit
# 		0)
# 			;;
# 		# output contains current directory
# 		101)
# 			JOSHUTO_CWD=$(cat "$OUTPUT_FILE")
# 			cd "$JOSHUTO_CWD"
# 			;;
# 		# output selected files
# 		102)
# 			;;
# 		*)
# 			echo "Exit code: $exit_code"
# 			;;
# 	esac
# }
# alias js="joshuto --change-directory"
