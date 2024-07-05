export XDG_CONFIG_HOME="$HOME/.config"


# man use bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# export EDITOR="neovide"
# export VISUAL="neovide"
export EDITOR="nvim"
export VISUAL="nvim"
export ZVM_VI_EDITOR="$EDITOR"

alias icat="kitty +kitten icat"

alias lc="nvim leetcode.nvim"

export BAT_THEME="Dracula"

alias cz="chezmoi"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# go end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export YAZI_CONFIG_HOME="$DOT_PATH/terminal/file-manager/yazi"

# Helpful aliases
alias  c='clear' # clear terminal
alias vc='code' # gui code editor

alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

alias vi="$EDITOR"
alias vim="$EDITOR"

alias lg="lazygit"
alias lzd="lazydocker"

alias ni="neovide --fork"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	  cd "$cwd"
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
