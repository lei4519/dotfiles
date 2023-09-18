# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules -g ""'
export FZF_DEFAULT_OPTS='--bind ctrl-d:page-down,ctrl-u:page-up'

export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export EDITOR="nvim"
export VISUAL="nvim"

alias vi="$EDITOR"
alias vim="$EDITOR"

alias python="/usr/bin/python3"
alias lg="lazygit"
alias ra=". ranger"

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

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

eval "$(starship init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# pnpm
export PNPM_HOME="/Users/lay/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
