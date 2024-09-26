export XDG_CONFIG_HOME="$HOME/.config"


# man use bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/liberica-jdk-8.jdk/Contents/Home"
export PATH="$PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin"

export MAVEN_HOME="$HOME/apache-maven"
export PATH="$PATH:$MAVEN_HOME/bin"

# export M2_HOME="$HOME/apache-maven"
# export PATH="$PATH:$M2_HOME/bin"
#
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

# Created by `pipx` on 2024-07-26 16:06:43
export PATH="$PATH:$HOME/.local/bin"

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
