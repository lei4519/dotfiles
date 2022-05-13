# dotfiles

```sh
# 必须放在 ~/dotfiles
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
# brew install the_silver_searcher # ag, or rg
brew install lazygit # lazygit
brew install git-delta # git pager styles, lazygit need
brew install ripgrep # rg, telescope need
brew install fd # telescope need
npm i -g vscode-langservers-extracted # eslint 服务
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

### Alacritty
```
brew install --cask alacritty # alacritty 终端
ln -f -i -n -s ~/dotfiles/alacritty ~/.config/alacritty
brew install starship # 终端主题
ln -f -i -n -s ~/dotfiles/starship.toml ~/.config/starship.toml
brew install zellij # 类似 tmux，但更简单
ln -f -i -n -s ~/dotfiles/zellij ~/.config/zellij
brew install zsh-autosuggestions # 建议提示补全
```

### Lunarvim

[https://www.lunarvim.org/](https://www.lunarvim.org/)

#### Install

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# ln -f -i -n -s ~/.local/bin/lvim /usr/local/bin/lvim
```

#### Uninstall

```sh
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

### 系统剪切板历史管理
```sh
# brew install --cask maccy # 系统剪切板历史管理
```

### Karabiner-Elements
```sh
brew install --cask karabiner-elements
ln -f -i -n -s ~/dotfiles/karabiner.json ~/.config/karabiner/karabiner.json
# https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/from/modifiers
# https://genesy.github.io/karabiner-complex-rules-generator
```
