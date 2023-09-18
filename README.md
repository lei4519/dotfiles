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

## 终端

```sh
# 配置
ln -f -n -s ~/dotfiles/.zshrc ~/.zshrc

# 字体
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# 快速跳转
brew install autojump

# alacritty 终端
brew install --cask alacritty
ln -f -n -s ~/dotfiles/alacritty ~/.config/alacritty

# 终端主题
brew install starship
ln -f -n -s ~/dotfiles/alacritty/starship.toml ~/.config/starship.toml

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
ln -f -n -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -f -n -s ~/dotfiles/tmux/.tmux.conf.local ~/.tmux.conf.local

# 漂亮的 cat
brew install lolcat
```

## Vim

```sh
# 清理现有配置
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

brew install neovim


# ----- TODO -----
# 搜索替换 nvim-pack/nvim-spectre
brew install gnu-sed

# 输入法切换
brew tap daipeihust/tap && brew install im-select

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
# preview json
brew install jq
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
# ag
brew install the_silver_searcher
# rg
# brew install ripgrep # one of rg ag
```

## 提示

### Eslint

配置一个全局的 eslint，对所有的 ts(x) js(x) 文件都可以生效

```sh
npm i -g eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-prettier eslint-config-standard eslint-config-prettier
ln -f -n -s ~/dotfiles/.eslintrc.js ~/.eslintrc.js
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

