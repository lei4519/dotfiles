# dotfiles

```sh
# 必须放在 ~/dotfiles，保证下面软连接的命令准确
git clone git@github.com:lei4519/dotfiles.git ~/dotfiles
```

## 按键映射

```sh
brew install --cask karabiner-elements
ln -f -n -s ~/dotfiles/karabiner ~/.config/karabiner
```

## 截图

```sh
brew install --cask snipaste
ln -f -n -s ~/dotfiles/snipaste/config.ini ~/.snipaste/config.ini
```

## 笔记

```sh
brew install --cask obsidian

# 图床上传
brew install piclist --cask
rm -rf /Users/lay/Library/Application\ Support/piclist/data.json && ln -f -n -s ~/dotfiles/picgo/data.json /Users/lay/Library/Application Support/piclist/data.json
```

## 终端

```sh
# 配置
ln -f -n -s ~/dotfiles/.zshrc ~/.zshrc

# kitty 图片查看
# brew install imagemagick
# brew install ghostscript

# 字体
# https://www.nerdfonts.com/font-downloads
# 搜索 fira code nerd font
brew tap homebrew/cask-fonts
brew install --cask fira-code-nerd-font

# 快速跳转
# brew install autojump
brew install zoxide

# alacritty 终端
brew install --cask alacritty
ln -f -n -s ~/dotfiles/alacritty ~/.config/alacritty

# kitty 终端
brew install kitty
rm -rf ~/.config/kitty && ln -f -n -s ~/dotfiles/kitty ~/.config/kitty

# 终端主题
brew install starship
rm -rf ~/.config/starship.toml && ln -f -n -s ~/dotfiles/starship.toml ~/.config/starship.toml

# 终端自动完成、提示
brew install --cask fig

# 建议提示补全
brew install zsh-autosuggestions
brew install zsh-autocomplete
brew install zsh-vi-mode

# tmux
brew install tmux
# 快速打开终端里的url
brew install urlview
# 粘贴到系统剪切板
brew install reattach-to-user-namespace
ln -f -n -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -f -n -s ~/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local

# 漂亮的 cat
# brew install lolcat
brew install bat
# preview markdown
brew install pandoc
# preview json
brew install jq
```

## Vim

```sh
# 清理现有配置
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

brew install neovim

# 输入法切换
brew tap daipeihust/tap && brew install im-select

# ----- TODO -----
# 搜索替换 nvim-pack/nvim-spectre
brew install gnu-sed

# tsserver
npm install -g typescript typescript-language-server
```

### Lazyvim

```sh
ln -f -n -s ~/dotfiles/lazy-vim ~/.config/nvim
```

### Lunarvim

[https://www.lunarvim.org/](https://www.lunarvim.org/)

#### Install

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -f -n -s ~/dotfiles/lunar-vim ~/.config/lvim
ln -f -n -s ~/.local/bin/lvim /usr/local/bin/lvim
```

#### Uninstall

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
rm ~/.config/lvim
rm /usr/local/bin/lvim
```

### 原生 nvim

```sh
ln -f -n -s ~/dotfiles/native-nvim ~/.config/nvim
```

## lazygit

```sh
brew install lazygit
# git pager styles, lazygit need
brew install git-delta
ln -f -n -s ~/dotfiles/git/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml
ln -f -n -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -n -s ~/dotfiles/.gitignore ~/.gitignore
```

## Ranger [废弃？]

```sh
pip3 install ranger-fm pynvim

# ranger code highlight
brew install highlight
ln -f -n -s ~/dotfiles/ranger ~/.config/ranger
```

## joshuto

```sh
brew install joshuto
ln -f -n -s ~/dotfiles/joshuto ~/.config/joshuto
```

## fzf

```sh
brew install fzf
rm -rf ~/.fzf.zsh && ln -f -n -s  ~/dotfiles/.fzf.zsh ~/.fzf.zsh
brew install fd
brew install ripgrep
```
## neovide

```sh
brew install neovide
rm -rf ~/.config/neovide/config.toml && ln -f -n -s ~/dotfiles/neovide/config.toml ~/.config/neovide/config.toml 
```
