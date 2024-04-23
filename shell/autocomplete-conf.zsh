# https://github.com/marlonrichert/zsh-autocomplete#make-tab-and-shifttab-go-to-the-menu

# call by ./vim-mode-conf.zsh
function autocomplete_keybindings() {
  bindkey              '^I' menu-select
  bindkey "$terminfo[kcbt]" menu-select
  bindkey -M menuselect              '^I'         menu-complete
  bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
}

