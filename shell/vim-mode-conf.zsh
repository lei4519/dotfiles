# https://github.com/jeffreytse/zsh-vi-mode?tab=readme-ov-file#configuration-function
function zvm_config() {
  # 默认进入插入模式
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}
# Since the default initialization mode, 
# this plugin will overwrite the previous key bindings, 
# this causes the key bindings of other plugins (i.e. fzf, zsh-autocomplete, etc.) to fail.
function zvm_after_init() {
  source $DOT_PATH/shell/.fzf.zsh
}

# all the keybindings of normal and visual mode should be executed by the zvm_after_lazy_keybindings_commands

function zvm_after_lazy_keybindings() {
  autocomplete_keybindings
}

# https://github.com/jeffreytse/zsh-vi-mode/issues/19
if [[ $os == "Darwin" ]]; then
  function zvm_vi_yank() {
    zvm_yank
    echo ${CUTBUFFER} | pbcopy
    zvm_exit_visual_mode
  }
elif [[ $os == "Linux" ]]; then
  function zvm_vi_yank () {
    zvm_yank
    printf %s "${CUTBUFFER}" | xclip -sel c
    zvm_exit_visual_mode
  }
fi

