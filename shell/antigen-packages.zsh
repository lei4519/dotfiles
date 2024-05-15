# Load the oh-my-zsh's library
antigen use oh-my-zsh

# https://github.com/unixorn/awesome-zsh-plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle chrissicool/zsh-256color
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle marlonrichert/zsh-autocomplete@main
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle dim-an/cod


# Load the theme
# antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

# Tell antigen that you're done
antigen apply
