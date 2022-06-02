git clone --depth=1 git@github.com:lei4519/dotfiles.git ~/dotfiles
```

## 必需品

### 终端字体

```sh
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nred-font
```

### Neovim

```sh
brew install neovim # neovim
pip3 install ranger-fm pynvim # ranger
brew install jq # preview json
brew install highlight # ranger code highlight
brew install the_silver_searcher # ag, or rg
brew install lazygit # lazygit
brew install git-delta # git pager styles, lazygit need
# brew install ripgrep # rg, telescope need
brew install fzf
brew install autojump
brew install fd
# brew install gnu-sed # 搜索替换 nvim-pack/nvim-spectre
brew install im-select # 输入法切换
```

### 软连接

```sh
# -f 强制执行
# -i 交互模式，文件存在则提示用户是否覆盖
# -n 把符号链接视为一般目录
# -s 软链接(符号链接)
ln -f -i -n -s ~/dotfiles/lvim ~/.config/lvim
ln -f -i -n -s ~/dotfiles/nvim ~/.config/nvim
ln -f -i -n -s ~/dotfiles/ranger ~/.config/ranger
ln -f -i -n -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -i -n -s ~/dotfiles/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml
```

## 系统软件

```sh
brew install bottom # cpu 内存查看
brew install --cask fig # 终端自动完成、提示
brew install --cask alfred
```

### Alacritty

```sh
brew install --cask alacritty # alacritty 终端
ln -f -i -n -s ~/dotfiles/alacritty ~/.config/alacritty
brew install starship # 终端主题
ln -f -i -n -s ~/dotfiles/starship.toml ~/.config/starship.toml
# brew install zellij # 类似 tmux，但更简单
# ln -f -i -n -s ~/dotfiles/zellij ~/.config/zellij
brew install zsh-autosuggestions # 建议提示补全
```

### 窗口切换

```sh
brew install alt-tab
```

### tmux

```sh
brew install tmux
ln -f -i -n -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -i -n -s ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local
brew install urlview # 快速打开终端里的url
brew install reattach-to-user-namespace
```

### Lunarvim

[https://www.lunarvim.org/](https://www.lunarvim.org/)

#### Install

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -f -i -n -s ~/.local/bin/lvim /usr/local/bin/lvim
```

ln -f -i -n -s ~/dotfiles/karabiner ~/.config/karabiner

#### Uninstall

```sh
ln -f -i -n -s ~/dotfiles/karabiner ~/.config/karabiner
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
# rm /usr/local/bin/lvim
```

### Neovide use Lvim

#### Install

```sh
brew install --cask neovide  # optional rust 编写的 neovim ui
cp /Applications/Neovide.app/Contents/MacOS/neovide /Applications/Neovide.app/Contents/MacOS/neovide_original
chmod +x ./neovide
ln -f -n -s ~/dotfiles/neovide /Applications/Neovide.app/Contents/MacOS/neovide
```

#### Uninstall

```sh
rm /Applications/Neovide.app/Contents/MacOS/neovide
cp /Applications/Neovide.app/Contents/MacOS/neovide_original /Applications/Neovide.app/Contents/MacOS/neovide
rm /Applications/Neovide.app/Contents/MacOS/neovide_original
```

### Karabiner-Elements

```sh
brew install --cask karabiner-elements
ln -f -i -n -s ~/dotfiles/karabiner ~/.config/karabiner
```
