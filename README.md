# dotfiles

```sh
# 必须放在 ~/dotfiles，保证下面软连接的命令准确
git clone git@github.com:lei4519/dotfiles.git ~/dotfiles
```

## Install

### 按键映射

```sh
brew install --cask karabiner-elements
ln -f -i -n -s ~/dotfiles/karabiner ~/.config/karabiner
```

### Neovim

```sh
brew install neovim
ln -f -i -n -s ~/dotfiles/nvim ~/.config/nvim
# 搜索替换 nvim-pack/nvim-spectre
brew install gnu-sed
# 输入法切换
brew tap daipeihust/tap && brew install im-select
# tsserver
npm install -g typescript typescript-language-server
```

### Ranger

```sh
pip3 install ranger-fm pynvim
# preview json
brew install jq
# ranger code highlight
brew install highlight
ln -f -i -n -s ~/dotfiles/ranger ~/.config/ranger
```

### fzf

```sh
brew install fzf
# ag
brew install the_silver_searcher
# rg
# brew install ripgrep # one of rg ag
```

### lazygit

```sh
brew install lazygit
# git pager styles, lazygit need
brew install git-delta
ln -f -i -n -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -i -n -s ~/dotfiles/.gitignore ~/.gitignore
ln -f -i -n -s ~/dotfiles/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml
# ln -f -i -n -s <local path> /usr/local/bin/lazygit
```

### 终端

```sh
# 配置
ln -f -i -n -s ~/dotfiles/.zshrc ~/.zshrc

# 字体
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# 快速跳转
brew install autojump

# alacritty 终端
brew install --cask alacritty
ln -f -i -n -s ~/dotfiles/alacritty ~/.config/alacritty

# 终端主题
brew install starship
ln -f -i -n -s ~/dotfiles/starship.toml ~/.config/starship.toml

# 终端自动完成、提示
brew install --cask fig

# (使用fig内置plugin也可以)建议提示补全
brew install zsh-autosuggestions

# tmux
brew install tmux
# 快速打开终端里的url
brew install urlview
# 粘贴到系统剪切板
brew install reattach-to-user-namespace
ln -f -i -n -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -i -n -s ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local

# 类似 tmux，但更简单
# brew install zellij
# ln -f -i -n -s ~/dotfiles/zellij ~/.config/zellij

# 漂亮的 cat
brew install lolcat
```

### Lunarvim

[https://www.lunarvim.org/](https://www.lunarvim.org/)

Install

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -f -i -n -s ~/dotfiles/lvim ~/.config/lvim
ln -f -i -n -s ~/.local/bin/lvim /usr/local/bin/lvim
```

---

Uninstall

```sh
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
rm ~/.config/lvim
rm /usr/local/bin/lvim
```

### Neovide

> neovide 没法和 tmux 一起使用，所以放弃了

```sh
# rust 编写的 neovim ui
brew install --cask neovide
```

#### use lvim

config

```sh
cp /Applications/Neovide.app/Contents/MacOS/neovide /Applications/Neovide.app/Contents/MacOS/neovide_original
chmod +x ~/dotfiles/neovide
ln -f -n -s ~/dotfiles/neovide /Applications/Neovide.app/Contents/MacOS/neovide
```

---

unconfig

```sh
rm /Applications/Neovide.app/Contents/MacOS/neovide
cp /Applications/Neovide.app/Contents/MacOS/neovide_original /Applications/Neovide.app/Contents/MacOS/neovide
rm /Applications/Neovide.app/Contents/MacOS/neovide_original
```

### 系统软件（增强但不必需）

```sh
# cpu 内存查看
brew install bottom

# alfred
brew install --cask alfred

# 窗口切换
brew install alt-tab
```

### Eslint

配置一个全局的 eslint，对所有的 ts(x) js(x) 文件都可以生效 

```sh
npm i -g eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-prettier eslint-config-standard eslint-config-prettier
ln -f -i -n -s ~/dotfiles/.eslintrc.js ~/.eslintrc.js
```

## vim 宏

```sh
# 查看宏
:reg <letter>


# 编辑宏

:let @<letter>='

# 依次按键 Ctrl-R Ctrl-R <letter>自动补全宏指令集

# 做出对应的修改，然后补全最后面的单引号即可

# 此时可以输入:reg a 发现宏的内容已经被修改了
```

